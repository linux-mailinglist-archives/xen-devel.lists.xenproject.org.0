Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2F3818609
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 12:06:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656672.1025064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFXvT-0004tI-41; Tue, 19 Dec 2023 11:06:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656672.1025064; Tue, 19 Dec 2023 11:06:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFXvS-0004jU-Oa; Tue, 19 Dec 2023 11:06:14 +0000
Received: by outflank-mailman (input) for mailman id 656672;
 Tue, 19 Dec 2023 11:06:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Div9=H6=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rFXvQ-0003Hq-Lu
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 11:06:12 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c871784-9e5e-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 12:06:08 +0100 (CET)
Received: from beta.station (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id 26ABC4EE0C9A;
 Tue, 19 Dec 2023 12:06:08 +0100 (CET)
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
X-Inumbo-ID: 9c871784-9e5e-11ee-98eb-6d05b1d4d9a1
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [PATCH v2 4/6] xen: add SAF deviation for safe cast removal
Date: Tue, 19 Dec 2023 12:05:12 +0100
Message-Id: <dff9e788e04aa04970cfbb70d09f4d1baf725506.1702982442.git.maria.celeste.cesario@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702982442.git.maria.celeste.cesario@bugseng.com>
References: <cover.1702982442.git.maria.celeste.cesario@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>

The xen sources contain violations of MISRA C:2012 Rule 11.8 whose
headline states:
"A conversion shall not remove any const, volatile or _Atomic qualification
from the type pointed to by a pointer".

Add SAF-3-safe deviation: removal of const qualifier to comply with function signature.

Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
---
Changes in v2:
- reword SAF-3-safe text;
- merge comments on __hvm_copy;
- add SAF-3-safe comment in x86/hvm.c:3433;
- add SAF-3-safe comment on arm/guestcopy.c raw_copy_to_guest and
  raw_copy_to_guest_flush_dcache.
---
 docs/misra/safe.json     | 8 ++++++++
 xen/arch/arm/guestcopy.c | 2 ++
 xen/arch/x86/hvm/hvm.c   | 6 ++++--
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index 952324f85c..96b964293a 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -28,6 +28,14 @@
         },
         {
             "id": "SAF-3-safe",
+            "analyser": {
+                "eclair": "MC3R1.R11.8"
+            },
+            "name": "MC3R1.R11.8: removal of const qualifier to comply with function signature",
+            "text": "A single function could either read or write through a passed in pointer, depending on how it is called. It is deemed safe to cast away a const qualifier when passing a pointer to such a function, when the other parameters guarantee read-only operation."
+        },
+        {
+            "id": "SAF-4-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/arch/arm/guestcopy.c b/xen/arch/arm/guestcopy.c
index 6716b03561..cf80ac46b1 100644
--- a/xen/arch/arm/guestcopy.c
+++ b/xen/arch/arm/guestcopy.c
@@ -109,6 +109,7 @@ static unsigned long copy_guest(void *buf, uint64_t addr, unsigned int len,
 
 unsigned long raw_copy_to_guest(void *to, const void *from, unsigned int len)
 {
+    /* SAF-3-safe COPY_to_guest doesn't modify from */
     return copy_guest((void *)from, (vaddr_t)to, len,
                       GVA_INFO(current), COPY_to_guest | COPY_linear);
 }
@@ -116,6 +117,7 @@ unsigned long raw_copy_to_guest(void *to, const void *from, unsigned int len)
 unsigned long raw_copy_to_guest_flush_dcache(void *to, const void *from,
                                              unsigned int len)
 {
+    /* SAF-3-safe COPY_to_guest doesn't modify from */
     return copy_guest((void *)from, (vaddr_t)to, len, GVA_INFO(current),
                       COPY_to_guest | COPY_flush_dcache | COPY_linear);
 }
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 523e0df57c..324893fbcc 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3413,7 +3413,8 @@ static enum hvm_translation_result __hvm_copy(
 enum hvm_translation_result hvm_copy_to_guest_phys(
     paddr_t paddr, const void *buf, unsigned int size, struct vcpu *v)
 {
-    return __hvm_copy((void *)buf /* HVMCOPY_to_guest doesn't modify */,
+    /* SAF-3-safe HVMCOPY_to_guest doesn't modify buf */
+    return __hvm_copy((void *)buf,
                       paddr, size, v,
                       HVMCOPY_to_guest | HVMCOPY_phys, 0, NULL);
 }
@@ -3429,7 +3430,8 @@ enum hvm_translation_result hvm_copy_to_guest_linear(
     unsigned long addr, const void *buf, unsigned int size, uint32_t pfec,
     pagefault_info_t *pfinfo)
 {
-    return __hvm_copy((void *)buf /* HVMCOPY_to_guest doesn't modify */,
+    /* SAF-3-safe HVMCOPY_to_guest doesn't modify buf */
+    return __hvm_copy((void *)buf,
                       addr, size, current, HVMCOPY_to_guest | HVMCOPY_linear,
                       PFEC_page_present | PFEC_write_access | pfec, pfinfo);
 }
-- 
2.40.0


