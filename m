Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E79DD7E39DB
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 11:34:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628727.980506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0JP9-00053P-Pj; Tue, 07 Nov 2023 10:33:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628727.980506; Tue, 07 Nov 2023 10:33:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0JP9-00050g-Kf; Tue, 07 Nov 2023 10:33:55 +0000
Received: by outflank-mailman (input) for mailman id 628727;
 Tue, 07 Nov 2023 10:33:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=raD6=GU=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r0JP7-0004jI-M9
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 10:33:53 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24894e44-7d59-11ee-9b0e-b553b5be7939;
 Tue, 07 Nov 2023 11:33:51 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 18D2C4EE0C88;
 Tue,  7 Nov 2023 11:33:49 +0100 (CET)
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
X-Inumbo-ID: 24894e44-7d59-11ee-9b0e-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 1/4] xen/vsprintf: replace backwards jump with loop
Date: Tue,  7 Nov 2023 11:33:42 +0100
Message-Id: <9fbc2bcfa1ee019a8ac1cd1a3d29c38b59b8edff.1699295113.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699295113.git.nicola.vetrini@bugseng.com>
References: <cover.1699295113.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The backwards goto in the vsnprintf function can be replaced
with a loop, thereby fixing a violation of MISRA C:2012 Rule 15.2.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/common/vsprintf.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/xen/common/vsprintf.c b/xen/common/vsprintf.c
index c49631c0a4d8..603bae44177a 100644
--- a/xen/common/vsprintf.c
+++ b/xen/common/vsprintf.c
@@ -495,6 +495,8 @@ int vsnprintf(char *buf, size_t size, const char *fmt, va_list args)
     }
 
     for (; *fmt ; ++fmt) {
+        bool repeat = true;
+
         if (*fmt != '%') {
             if (str < end)
                 *str = *fmt;
@@ -504,14 +506,16 @@ int vsnprintf(char *buf, size_t size, const char *fmt, va_list args)
 
         /* process flags */
         flags = 0;
-    repeat:
-        ++fmt;          /* this also skips first '%' */
-        switch (*fmt) {
-        case '-': flags |= LEFT; goto repeat;
-        case '+': flags |= PLUS; goto repeat;
-        case ' ': flags |= SPACE; goto repeat;
-        case '#': flags |= SPECIAL; goto repeat;
-        case '0': flags |= ZEROPAD; goto repeat;
+        while ( repeat ) {
+            ++fmt;          /* this also skips the first '%' */
+            switch (*fmt) {
+            case '-': flags |= LEFT; break;
+            case '+': flags |= PLUS; break;
+            case ' ': flags |= SPACE; break;
+            case '#': flags |= SPECIAL; break;
+            case '0': flags |= ZEROPAD; break;
+            default: repeat = false; break;
+            }
         }
 
         /* get field width */
-- 
2.34.1


