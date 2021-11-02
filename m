Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F47244309F
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 15:40:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220313.381530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhuxO-0000ur-Aj; Tue, 02 Nov 2021 14:40:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220313.381530; Tue, 02 Nov 2021 14:40:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhuxO-0000tP-77; Tue, 02 Nov 2021 14:40:10 +0000
Received: by outflank-mailman (input) for mailman id 220313;
 Tue, 02 Nov 2021 14:40:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7JXc=PV=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mhuxM-0000sY-HT
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 14:40:08 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a2cdaa26-76f9-4f56-8fec-67ef697049b1;
 Tue, 02 Nov 2021 14:40:07 +0000 (UTC)
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
X-Inumbo-ID: a2cdaa26-76f9-4f56-8fec-67ef697049b1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635864007;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3yeCHmdxvJVOclLCsWlqqmdXtM4p9lV1mZS+SKfALY4=;
  b=MHx03HuxlkbK4EPn2Qpy0+ZPDGd3fdsCO11wXR0z0qYGtph+pm7AaQbY
   vNoqjpnacEpDLbCFu5/P2ABTAt8YSmAVQhMyWnIwlkozoUoxSBajgc8kk
   bsLPQqO6lf/TO33txAMufMyM8O3TdboTZ1suJM5/V8/wGE3+Lh/uSqJg6
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: AgZUx/QNhNvsTdv6a7SphkWXz3yJVWvS3gHWbe3BSja2XeMiI7oIj+KOR0H5IQcsd6ZkFVssfq
 2qxUjnQK74twr+tXfKbRBie0IGldlpk5nzXVQrtaO9H8c+QRhGne0d/LLIj2496mw/GUfe7N/b
 kg/7n7MuvCGegMQDrVPJmPSuXzHRCLLQ20XowMLJzRaCswb7ditJaZM4NctkJRIdH7pGhoYRvD
 ozdKHlnOER55DcZKqzMaOKO8a0vRwizYVNdnC8EIfwd2877POYzh5hLYa6kH/gtxReZXWeyWVs
 Cf20AlwQjFUB1MHVJTSIUagN
X-SBRS: 5.1
X-MesageID: 56863530
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Qz+9ra2dwPFkI4fpHPbD5R92kn2cJEfYwER7XKvMYLTBsI5bp2ZSz
 WQXXW+OPf2KNGTxco10YY3jpkoH6pSEydBrSwM+pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan8ZqTNMEn970Es6w7Rh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhwd4q0
 Ohjm5mMczwXFfzKoN8CeTdfHHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Er8IvNsT0eqgYvWlt12rxBvc6W5HTBa7N4Le02R9t2JAQRquFP
 6L1bxJjK02eJBJCKG06J6sBhMTxjVTaUjJH/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 kDs8nn9AxoaHMeC0jfD+XWp7sffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnJKalkASAMJtPcM/1Du29IGF5T6iGUIqSTEUPbTKq/QKbTAt0
 1aImfbgCjpurKCZRBqhy1uEkd+hEXNLdDFfPEfoWSNAuoC++99r0nojW/46SPbt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNL1D2BLwQKChRqlEGp/ZgPY1
 JTjs5PGhN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOu2whdR0xbZxeIGOBj
 KrvVeV5vsY70JyCNvcfXm5MI55ykfiI+SrND6i8giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWmDOCLbimnk/P+efPOxaopUItbQLmghYRt/jf/m04M
 r93aqO39vmoeLSlP3SMrtJLdTjn7xETXPjLliCeTcbbSiIOJY3rI6WJqV/4U4A6zalTiMnS+
 XSxBh1RxFbl3CWVIgSWcHFzLrjoWM8n/348OCUtO3eu2mQiPtnzvPtOKcNvcOl17vFnwN51U
 +IBJ5eKDMNQR2mV4D8ad5T88tBvLUz5mQKUMiO5SzEjZJo8FRfR89rpc1K3pikDBya6r+Ukp
 Lik2l+JSJYPXV06Xs3XdOiu3xW6un1EwLB+WE7BI99yfkTw8dc1d3yt36Fve8xVcEfN3DqX0
 QqSECw0n+iVrt9n6sTNiICFs5ytT7l0EH1FEjSJ9r2xLyTboDaumNcSTOaScDnBf2ro46H+N
 /5NxvTxPfBbzlZHt41wT+Riwa4kvoa9orZbykJvHWnRbkTtAbRleyHU0c5Kv6xL57lYpQrpB
 R7fpogEYe2EaJH/DVocBAs5deDSh/gblw7b4ekxPEintjR8+6CKUBkKMhSB4MCHwGCZ7G/xL
 T8dhfMr
IronPort-HdrOrdr: A9a23:XlpBd6u2O152W3VdX2702/va7skDeNV00zEX/kB9WHVpmszxra
 GTdZMgpHnJYVcqKRYdcL+7Scq9qB/nmqKdgrNhWYtKPjOW2ldARbsKheCJrlHd8kXFh5dgPM
 xbE5SWZuefMbEDt7ee3DWF
X-IronPort-AV: E=Sophos;i="5.87,203,1631592000"; 
   d="scan'208";a="56863530"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH for-4.16] x86/shstk: Fix use of shadow stacks with XPTI active
Date: Tue, 2 Nov 2021 14:39:35 +0000
Message-ID: <20211102143935.17473-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The call to setup_cpu_root_pgt(0) in smp_prepare_cpus() is too early.  It
clones the BSP's stack while the .data mapping is still in use, causing all
mappings to be fully read read/write (and with no guard pages either).  This
ultimately causes #DF when trying to enter the dom0 kernel for the first time.

Defer setting up BSPs XPTI pagetable until reinit_bsp_stack() after we've set
up proper shadow stack permissions.

Fixes: 60016604739b ("x86/shstk: Rework the stack layout to support shadow stacks")
Fixes: b60ab42db2f0 ("x86/shstk: Activate Supervisor Shadow Stacks")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

For 4.16.  This is a rare configuration.  Real hardware supporting CET-SS is
either AMD, or fixed to Meltdown, so doesn't turn on XPTI by default.

The bug can be triggered either by booting real CET-SS hardware with `xpti` on
the cmdline, or booting Xen in a VM where "fixed to meltdown" isn't
advertised.  The result when things go wrong is an unconditional crash.

Risks are minimal - all the change is doing is reordering some actions during
boot.  The shadow stack specific aspects are hard for people to independently
verify, owing to the fact that CET-SS is only on current-generation CPUs, but
I have an example sitting on my desk which is how I discovered this.

However, the paths altered are tested thoroughly by OSSTest on every single
host boot, in a variety of combinations due to the selection of hardware.
---
 xen/arch/x86/setup.c   | 5 +++++
 xen/arch/x86/smpboot.c | 9 ++-------
 xen/include/xen/smp.h  | 1 +
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index b101565f1431..fea86530f9f2 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -666,6 +666,7 @@ static void noreturn init_done(void)
 static void __init noreturn reinit_bsp_stack(void)
 {
     unsigned long *stack = (void*)(get_stack_bottom() & ~(STACK_SIZE - 1));
+    int rc;
 
     /* Update TSS and ISTs */
     load_system_tables();
@@ -676,6 +677,10 @@ static void __init noreturn reinit_bsp_stack(void)
     stack_base[0] = stack;
     memguard_guard_stack(stack);
 
+    rc = setup_cpu_root_pgt(0);
+    if ( rc )
+        panic("Error %d setting up PV root page table\n", rc);
+
     if ( IS_ENABLED(CONFIG_XEN_SHSTK) && cpu_has_xen_shstk )
     {
         wrmsrl(MSR_PL0_SSP,
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 0dce1ae87210..329cfdb6c9f6 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -821,7 +821,7 @@ static root_pgentry_t common_pgt;
 
 extern const char _stextentry[], _etextentry[];
 
-static int setup_cpu_root_pgt(unsigned int cpu)
+int setup_cpu_root_pgt(unsigned int cpu)
 {
     root_pgentry_t *rpt;
     unsigned int off;
@@ -1138,8 +1138,6 @@ static struct notifier_block cpu_smpboot_nfb = {
 
 void __init smp_prepare_cpus(void)
 {
-    int rc;
-
     register_cpu_notifier(&cpu_smpboot_nfb);
 
     mtrr_aps_sync_begin();
@@ -1153,10 +1151,7 @@ void __init smp_prepare_cpus(void)
 
     stack_base[0] = (void *)((unsigned long)stack_start & ~(STACK_SIZE - 1));
 
-    rc = setup_cpu_root_pgt(0);
-    if ( rc )
-        panic("Error %d setting up PV root page table\n", rc);
-    if ( per_cpu(root_pgt, 0) )
+    if ( opt_xpti_hwdom || opt_xpti_domu )
     {
         get_cpu_info()->pv_cr3 = 0;
 
diff --git a/xen/include/xen/smp.h b/xen/include/xen/smp.h
index d5a3644611db..0a9219173f0f 100644
--- a/xen/include/xen/smp.h
+++ b/xen/include/xen/smp.h
@@ -70,5 +70,6 @@ int alloc_cpu_id(void);
 extern void *stack_base[NR_CPUS];
 
 void initialize_cpu_data(unsigned int cpu);
+int setup_cpu_root_pgt(unsigned int cpu);
 
 #endif /* __XEN_SMP_H__ */
-- 
2.11.0


