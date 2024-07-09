Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD2D92B3F5
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 11:36:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756014.1164564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR7GE-0000yN-JD; Tue, 09 Jul 2024 09:35:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756014.1164564; Tue, 09 Jul 2024 09:35:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR7GE-0000w2-Gc; Tue, 09 Jul 2024 09:35:46 +0000
Received: by outflank-mailman (input) for mailman id 756014;
 Tue, 09 Jul 2024 09:35:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/VCn=OJ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sR7GD-0000vw-K6
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 09:35:45 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ca0f651-3dd6-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 11:35:43 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.214])
 by support.bugseng.com (Postfix) with ESMTPSA id 3B49C4EE0742;
 Tue,  9 Jul 2024 11:35:41 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 9ca0f651-3dd6-11ef-8776-851b0ebba9a2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [XEN PATCH for-4.19] xen/bitmap: amend MISRA C deviation for Rule 20.7
Date: Tue,  9 Jul 2024 11:34:20 +0200
Message-Id: <794724e70c4e45224916576af01070e8aebe9aab.1720517398.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As noticed in the gitlab analyses, deviating bitmap_switch
for Rule 20.7 in this way does not work for ECLAIR.

Instead, the deviation should be put in the macro invocation.

No functional change.

Fixes: 0dca0f2b9a7e ("automation/eclair: address violations of MISRA C Rule 20.7")
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
An alternative approach would be to use an ecl configuration, but that
would be tool-specific.

As this is purely an improvement to the CI, I'd like to ask for a release ack.
---
 xen/include/xen/bitmap.h | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/xen/include/xen/bitmap.h b/xen/include/xen/bitmap.h
index 6ee39aa35ac6..f8ef85541a84 100644
--- a/xen/include/xen/bitmap.h
+++ b/xen/include/xen/bitmap.h
@@ -103,18 +103,16 @@ extern int bitmap_allocate_region(unsigned long *bitmap, int pos, int order);
 #define bitmap_switch(nbits, zero, small, large)			  \
 	unsigned int n__ = (nbits);					  \
 	if (__builtin_constant_p(nbits) && !n__) {			  \
-		/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */ \
 		zero;							  \
 	} else if (__builtin_constant_p(nbits) && n__ <= BITS_PER_LONG) { \
-		/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */ \
 		small;							  \
 	} else {							  \
-		/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */ \
 		large;							  \
 	}
 
 static inline void bitmap_zero(unsigned long *dst, unsigned int nbits)
 {
+	/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */
 	bitmap_switch(nbits,,
 		*dst = 0UL,
 		memset(dst, 0, bitmap_bytes(nbits)));
@@ -139,6 +137,7 @@ static inline void bitmap_fill(unsigned long *dst, unsigned int nbits)
 static inline void bitmap_copy(unsigned long *dst, const unsigned long *src,
 			unsigned int nbits)
 {
+        /* SAF-7-safe Rule 20.7 non-parenthesized macro argument */
 	bitmap_switch(nbits,,
 		*dst = *src,
 		memcpy(dst, src, bitmap_bytes(nbits)));
@@ -147,6 +146,7 @@ static inline void bitmap_copy(unsigned long *dst, const unsigned long *src,
 static inline void bitmap_and(unsigned long *dst, const unsigned long *src1,
 			const unsigned long *src2, unsigned int nbits)
 {
+	/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */
 	bitmap_switch(nbits,,
 		*dst = *src1 & *src2,
 		__bitmap_and(dst, src1, src2, nbits));
@@ -155,6 +155,7 @@ static inline void bitmap_and(unsigned long *dst, const unsigned long *src1,
 static inline void bitmap_or(unsigned long *dst, const unsigned long *src1,
 			const unsigned long *src2, unsigned int nbits)
 {
+	/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */
 	bitmap_switch(nbits,,
 		*dst = *src1 | *src2,
 		__bitmap_or(dst, src1, src2, nbits));
@@ -163,6 +164,7 @@ static inline void bitmap_or(unsigned long *dst, const unsigned long *src1,
 static inline void bitmap_xor(unsigned long *dst, const unsigned long *src1,
 			const unsigned long *src2, unsigned int nbits)
 {
+	/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */
 	bitmap_switch(nbits,,
 		*dst = *src1 ^ *src2,
 		__bitmap_xor(dst, src1, src2, nbits));
@@ -171,6 +173,7 @@ static inline void bitmap_xor(unsigned long *dst, const unsigned long *src1,
 static inline void bitmap_andnot(unsigned long *dst, const unsigned long *src1,
 			const unsigned long *src2, unsigned int nbits)
 {
+	/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */
 	bitmap_switch(nbits,,
 		*dst = *src1 & ~*src2,
 		__bitmap_andnot(dst, src1, src2, nbits));
@@ -179,6 +182,7 @@ static inline void bitmap_andnot(unsigned long *dst, const unsigned long *src1,
 static inline void bitmap_complement(unsigned long *dst, const unsigned long *src,
 			unsigned int nbits)
 {
+	/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */
 	bitmap_switch(nbits,,
 		*dst = ~*src & BITMAP_LAST_WORD_MASK(nbits),
 		__bitmap_complement(dst, src, nbits));
@@ -187,6 +191,7 @@ static inline void bitmap_complement(unsigned long *dst, const unsigned long *sr
 static inline int bitmap_equal(const unsigned long *src1,
 			const unsigned long *src2, unsigned int nbits)
 {
+	/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */
 	bitmap_switch(nbits,
 		return -1,
 		return !((*src1 ^ *src2) & BITMAP_LAST_WORD_MASK(nbits)),
@@ -196,6 +201,7 @@ static inline int bitmap_equal(const unsigned long *src1,
 static inline int bitmap_intersects(const unsigned long *src1,
 			const unsigned long *src2, unsigned int nbits)
 {
+	/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */
 	bitmap_switch(nbits,
 		return -1,
 		return ((*src1 & *src2) & BITMAP_LAST_WORD_MASK(nbits)) != 0,
@@ -205,6 +211,7 @@ static inline int bitmap_intersects(const unsigned long *src1,
 static inline int bitmap_subset(const unsigned long *src1,
 			const unsigned long *src2, unsigned int nbits)
 {
+	/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */
 	bitmap_switch(nbits,
 		return -1,
 		return !((*src1 & ~*src2) & BITMAP_LAST_WORD_MASK(nbits)),
@@ -213,6 +220,7 @@ static inline int bitmap_subset(const unsigned long *src1,
 
 static inline int bitmap_empty(const unsigned long *src, unsigned int nbits)
 {
+	/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */
 	bitmap_switch(nbits,
 		return -1,
 		return !(*src & BITMAP_LAST_WORD_MASK(nbits)),
@@ -221,6 +229,7 @@ static inline int bitmap_empty(const unsigned long *src, unsigned int nbits)
 
 static inline int bitmap_full(const unsigned long *src, unsigned int nbits)
 {
+	/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */
 	bitmap_switch(nbits,
 		return -1,
 		return !(~*src & BITMAP_LAST_WORD_MASK(nbits)),
-- 
2.34.1


