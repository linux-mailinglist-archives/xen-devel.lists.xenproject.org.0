Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD75B753A1F
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 13:50:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563584.880890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKHJ5-0005px-RF; Fri, 14 Jul 2023 11:49:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563584.880890; Fri, 14 Jul 2023 11:49:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKHJ5-0005nb-Mo; Fri, 14 Jul 2023 11:49:55 +0000
Received: by outflank-mailman (input) for mailman id 563584;
 Fri, 14 Jul 2023 11:49:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z95V=DA=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qKHJ3-0005Gy-UA
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 11:49:53 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b19dbbb-223c-11ee-8611-37d641c3527e;
 Fri, 14 Jul 2023 13:49:52 +0200 (CEST)
Received: from nico.bugseng.com (unknown [37.163.94.163])
 by support.bugseng.com (Postfix) with ESMTPSA id 7A3D04EE0739;
 Fri, 14 Jul 2023 13:49:50 +0200 (CEST)
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
X-Inumbo-ID: 8b19dbbb-223c-11ee-8611-37d641c3527e
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 2/4] xen/arm64: bitops: justify uninitialized variable inside a macro
Date: Fri, 14 Jul 2023 13:49:19 +0200
Message-Id: <d06a312944bee7457fa2ac75e0cfef20f0ec430f.1689329728.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689329728.git.nicola.vetrini@bugseng.com>
References: <cover.1689329728.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macro 'testop' expands to a function that declares the local
variable 'oldbit', which is written before being set, but is such a
way that is not amenable to automatic checking.

Therefore, a deviation comment, is introduced to document this situation.

A similar reasoning applies to macro 'guest_testop'.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 docs/misra/safe.json                     | 16 ++++++++++++++++
 xen/arch/arm/arm64/lib/bitops.c          |  3 +++
 xen/arch/arm/include/asm/guest_atomics.h |  3 +++
 3 files changed, 22 insertions(+)

diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index 244001f5be..4cf7cbf57b 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -20,6 +20,22 @@
         },
         {
             "id": "SAF-2-safe",
+            "analyser": {
+                "eclair": "MC3R1.R9.1"
+            },
+            "name": "Rule 9.1: initializer not needed",
+            "text": "The following local variables are possibly subject to being read before being written, but code inspection ensured that the control flow in the construct where they appear ensures that no such event may happen."
+        },
+        {
+            "id": "SAF-3-safe",
+            "analyser": {
+                "eclair": "MC3R1.R9.1"
+            },
+            "name": "Rule 9.1: initializer not needed",
+            "text": "The following local variables are possibly subject to being read before being written, but code inspection ensured that the control flow in the construct where they appear ensures that no such event may happen."
+        },
+        {
+            "id": "SAF-4-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/arch/arm/arm64/lib/bitops.c b/xen/arch/arm/arm64/lib/bitops.c
index 20e3f3d6ce..e0728bb29d 100644
--- a/xen/arch/arm/arm64/lib/bitops.c
+++ b/xen/arch/arm/arm64/lib/bitops.c
@@ -114,8 +114,11 @@ bitop(change_bit, eor)
 bitop(clear_bit, bic)
 bitop(set_bit, orr)
 
+/* SAF-2-safe MC3R1.R9.1 */
 testop(test_and_change_bit, eor)
+/* SAF-2-safe MC3R1.R9.1 */
 testop(test_and_clear_bit, bic)
+/* SAF-2-safe MC3R1.R9.1 */
 testop(test_and_set_bit, orr)
 
 static always_inline bool int_clear_mask16(uint16_t mask, volatile uint16_t *p,
diff --git a/xen/arch/arm/include/asm/guest_atomics.h b/xen/arch/arm/include/asm/guest_atomics.h
index a1745f8613..9d8f8ec3a3 100644
--- a/xen/arch/arm/include/asm/guest_atomics.h
+++ b/xen/arch/arm/include/asm/guest_atomics.h
@@ -67,8 +67,11 @@ guest_bitop(change_bit)
 /* test_bit does not use load-store atomic operations */
 #define guest_test_bit(d, nr, p) ((void)(d), test_bit(nr, p))
 
+/* SAF-3-safe MC3R1.R9.1 */
 guest_testop(test_and_set_bit)
+/* SAF-3-safe MC3R1.R9.1 */
 guest_testop(test_and_clear_bit)
+/* SAF-3-safe MC3R1.R9.1 */
 guest_testop(test_and_change_bit)
 
 #undef guest_testop
-- 
2.34.1


