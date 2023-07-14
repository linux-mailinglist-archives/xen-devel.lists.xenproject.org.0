Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E017534CB
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 10:12:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563534.880758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKDtI-0003CE-IY; Fri, 14 Jul 2023 08:11:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563534.880758; Fri, 14 Jul 2023 08:11:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKDtI-0003AS-FP; Fri, 14 Jul 2023 08:11:04 +0000
Received: by outflank-mailman (input) for mailman id 563534;
 Fri, 14 Jul 2023 08:11:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1HgV=DA=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qKDtG-0003AM-Vx
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 08:11:02 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7c093c0-221d-11ee-8611-37d641c3527e;
 Fri, 14 Jul 2023 10:11:00 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.163.153.34])
 by support.bugseng.com (Postfix) with ESMTPSA id 338F54EE0739;
 Fri, 14 Jul 2023 10:10:58 +0200 (CEST)
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
X-Inumbo-ID: f7c093c0-221d-11ee-8611-37d641c3527e
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [XEN PATCH] x86/mce: change parameter names in function definitions to match the corresponding declarations
Date: Fri, 14 Jul 2023 10:10:49 +0200
Message-Id: <5d1b292f3bb46dccf7e1cae38903165c5e236507.1689321884.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change parameter names in function definitions to match the
corresponding delcarations thus fixing violations of MISRA C:2012
Rule 8.3 ("All declarations of an object or function shall use the same
names and type qualifiers").

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/cpu/mcheck/mce.c     | 11 +++++------
 xen/arch/x86/cpu/mcheck/mce_amd.c | 16 ++++++++--------
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index 3e93bdd8da..140634198c 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -123,7 +123,7 @@ void mce_recoverable_register(mce_recoverable_t cbfunc)
     mc_recoverable_scan = cbfunc;
 }
 
-struct mca_banks *mcabanks_alloc(unsigned int nr_mce_banks)
+struct mca_banks *mcabanks_alloc(unsigned int nr)
 {
     struct mca_banks *mb;
 
@@ -135,18 +135,17 @@ struct mca_banks *mcabanks_alloc(unsigned int nr_mce_banks)
      * For APs allocations get done by the BSP, i.e. when the bank count may
      * may not be known yet. A zero bank count is a clear indication of this.
      */
-    if ( !nr_mce_banks )
-        nr_mce_banks = MCG_CAP_COUNT;
+    if ( !nr )
+        nr = MCG_CAP_COUNT;
 
-    mb->bank_map = xzalloc_array(unsigned long,
-                                 BITS_TO_LONGS(nr_mce_banks));
+    mb->bank_map = xzalloc_array(unsigned long, BITS_TO_LONGS(nr));
     if ( !mb->bank_map )
     {
         xfree(mb);
         return NULL;
     }
 
-    mb->num = nr_mce_banks;
+    mb->num = nr;
 
     return mb;
 }
diff --git a/xen/arch/x86/cpu/mcheck/mce_amd.c b/xen/arch/x86/cpu/mcheck/mce_amd.c
index 3c374fd4e4..6c7951d028 100644
--- a/xen/arch/x86/cpu/mcheck/mce_amd.c
+++ b/xen/arch/x86/cpu/mcheck/mce_amd.c
@@ -272,13 +272,13 @@ int vmce_amd_rdmsr(const struct vcpu *v, uint32_t msr, uint64_t *val)
 }
 
 enum mcheck_type
-amd_mcheck_init(struct cpuinfo_x86 *ci)
+amd_mcheck_init(struct cpuinfo_x86 *c)
 {
     uint32_t i;
     enum mcequirk_amd_flags quirkflag = 0;
 
-    if ( ci->x86_vendor != X86_VENDOR_HYGON )
-        quirkflag = mcequirk_lookup_amd_quirkdata(ci);
+    if ( c->x86_vendor != X86_VENDOR_HYGON )
+        quirkflag = mcequirk_lookup_amd_quirkdata(c);
 
     /* Assume that machine check support is available.
      * The minimum provided support is at least the K8. */
@@ -298,14 +298,14 @@ amd_mcheck_init(struct cpuinfo_x86 *ci)
         }
     }
 
-    if ( ci->x86 == 0xf )
+    if ( c->x86 == 0xf )
         return mcheck_amd_k8;
 
     if ( quirkflag == MCEQUIRK_F10_GART )
         mcequirk_amd_apply(quirkflag);
 
-    if ( cpu_has(ci, X86_FEATURE_AMD_PPIN) &&
-         (ci == &boot_cpu_data || ppin_msr) )
+    if ( cpu_has(c, X86_FEATURE_AMD_PPIN) &&
+         (c == &boot_cpu_data || ppin_msr) )
     {
         uint64_t val;
 
@@ -320,7 +320,7 @@ amd_mcheck_init(struct cpuinfo_x86 *ci)
 
         if ( !(val & PPIN_ENABLE) )
             ppin_msr = 0;
-        else if ( ci == &boot_cpu_data )
+        else if ( c == &boot_cpu_data )
             ppin_msr = MSR_AMD_PPIN;
     }
 
@@ -328,6 +328,6 @@ amd_mcheck_init(struct cpuinfo_x86 *ci)
     mce_recoverable_register(mc_amd_recoverable_scan);
     mce_register_addrcheck(mc_amd_addrcheck);
 
-    return ci->x86_vendor == X86_VENDOR_HYGON ?
+    return c->x86_vendor == X86_VENDOR_HYGON ?
             mcheck_hygon : mcheck_amd_famXX;
 }
-- 
2.34.1


