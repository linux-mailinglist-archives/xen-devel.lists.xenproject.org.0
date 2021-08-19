Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 919A73F1DCC
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 18:27:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168944.308533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGksX-0005eo-6i; Thu, 19 Aug 2021 16:26:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168944.308533; Thu, 19 Aug 2021 16:26:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGksX-0005cR-2F; Thu, 19 Aug 2021 16:26:53 +0000
Received: by outflank-mailman (input) for mailman id 168944;
 Thu, 19 Aug 2021 16:26:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GG3y=NK=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mGksV-0005cJ-RV
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 16:26:51 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06bfb8ef-0c66-4afd-935b-f762f805d22e;
 Thu, 19 Aug 2021 16:26:50 +0000 (UTC)
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
X-Inumbo-ID: 06bfb8ef-0c66-4afd-935b-f762f805d22e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629390410;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0bq3BVYPoh/F+VjLX6mWhIkl7vV/zIFlvd2v2C6o/SY=;
  b=IBxrgyKveiesDmCJxFQfiThruaGeNNf6L5U1WcpzWf+Zmx4jhw+j7vyt
   Sf0P1msZNGDtdKBFYl3oVTst2GKqgT+QomFIqjs1t++geUYnzhErpot/E
   reR4AgTsNGT6aMVyfTVRcD4J9kz/brZU1oYxIPJmVCCczyA5ct8it9M/g
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: K5vpNeu9O6/0X9CPbJBK4IZ5yMV9ssthhhleagY7HUGZuLnZPfaq37yzQsdT3rBFHakjvJqDBd
 B0UhpGmrIdxx3ja+pBRbfXS+mMR6pbyeesCkQz6MQO2F+Nc6zL4UXsThr1WHSc3QK6e1J3kqSm
 e1kAwY2L/HoblEYdwPzTbCu/SM8PlwbjWcSGp7Q0fPBnKQZuFh67rglp1R9GbURn1V1K53FfTv
 WbGLWG3DGhQQ0QpXCZVJIl4tFuSnmkixz2M8xXBUj0xKz8mPdrTieGM+Trpoy/dwF84MYlrmZX
 jJwH5Bbrk+UYBYamSzi7qBfa
X-SBRS: 5.1
X-MesageID: 50836927
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:kfFFVqERhnhHpxSDpLqE7MeALOsnbusQ8zAXPhZKOHhom62j9/
 xG885x6faZslwssRIb+OxoWpPufZqGz+8R3WB5B97LYOCBggaVxepZg7cKrQeNJ8VQnNQtsp
 uJ38JFeb/N5fkRt7eY3DWF
X-IronPort-AV: E=Sophos;i="5.84,335,1620705600"; 
   d="scan'208";a="50836927"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/spec-ctrl: Skip RSB overwriting when safe to do so
Date: Thu, 19 Aug 2021 17:26:41 +0100
Message-ID: <20210819162641.22772-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

In some configurations, it is safe to not overwrite the RSB on entry to Xen.
Both Intel and AMD have guidelines in this area, because of the performance
difference it makes for native kernels.

A simple microperf test, measuring the amount of time a XENVER_version
hypercall takes, shows the following improvements:

  KabyLake:     -13.9175% +/- 6.85387%
  CoffeeLake-R:  -9.1183% +/- 5.04519%
  Milan:        -17.7803% +/- 1.29808%

This is best case improvement, because no real workloads are making
XENVER_version hypercalls in a tight loop.  However, this is the hypercall
used by PV kernels to force evtchn delivery if one is pending, so it is a
common hypercall to see, especially in dom0.

The avoidance of RSB-overwriting speeds up all interrupts, exceptions and
system calls from PV or Xen context.  RSB-overwriting is still required on
VMExit from HVM guests for now.

In terms of more realistic testing, LMBench in dom0 on an AMD Rome system
shows improvements across the board, with the best improvement at 8% for
simple syscall and simple write.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

Backporting note.  This depends on the order of CR4 setup in __start_xen()
being ahead of the call to init_speculation().  I'm not sure how stable the
order was going backwards.

Raw stats data is here: https://paste.debian.net/hidden/0d59b024/

I was surprised that CoffeeLake's improvement wasn't better than KabyLake.
CFL-R has meltdown fixed vs KBL, so XPTI is a hit which ought to be visible in
this benchmark.  Also, MSR_SPEC_CTRL differes between the ucode-retrofitted
version and one of the early in-hardware versions.  We have yet to make use of
eIBRS so there is definitely an improvement to be had on CFL-R.
---
 xen/arch/x86/spec_ctrl.c | 67 ++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 57 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 739b7913ff86..750110e9dfcc 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -33,7 +33,7 @@
 /* Cmdline controls for Xen's alternative blocks. */
 static bool __initdata opt_msr_sc_pv = true;
 static bool __initdata opt_msr_sc_hvm = true;
-static bool __initdata opt_rsb_pv = true;
+static int8_t __initdata opt_rsb_pv = -1;
 static bool __initdata opt_rsb_hvm = true;
 static int8_t __initdata opt_md_clear_pv = -1;
 static int8_t __initdata opt_md_clear_hvm = -1;
@@ -554,6 +554,35 @@ static bool __init retpoline_safe(uint64_t caps)
     }
 }
 
+/*
+ * https://software.intel.com/content/www/us/en/develop/articles/software-security-guidance/technical-documentation/retpoline-branch-target-injection-mitigation.html
+ *
+ * Silvermont and Airmont based cores are 64bit but only have a 32bit wide
+ * RSB, which impacts the safety of using SMEP to avoid RSB-overwriting.
+ */
+static bool __init rsb_is_full_width(void)
+{
+    if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
+         boot_cpu_data.x86 != 6 )
+        return true;
+
+    switch ( boot_cpu_data.x86_model )
+    {
+    case 0x37: /* Baytrail / Valleyview (Silvermont) */
+    case 0x4a: /* Merrifield */
+    case 0x4c: /* Cherrytrail / Brasswell */
+    case 0x4d: /* Avaton / Rangely (Silvermont) */
+    case 0x5a: /* Moorefield */
+    case 0x5d: /* SoFIA 3G Granite/ES2.1 */
+    case 0x65: /* SoFIA LTE AOSP */
+    case 0x6e: /* Cougar Mountain */
+    case 0x75: /* Lightning Mountain */
+        return false;
+    }
+
+    return true;
+}
+
 /* Calculate whether this CPU speculates past #NM */
 static bool __init should_use_eager_fpu(void)
 {
@@ -992,18 +1021,36 @@ void __init init_speculation_mitigations(void)
         default_xen_spec_ctrl |= SPEC_CTRL_SSBD;
 
     /*
-     * PV guests can poison the RSB to any virtual address from which
-     * they can execute a call instruction.  This is necessarily outside
-     * of the Xen supervisor mappings.
+     * PV guests can create RSB entries for any linear address they control,
+     * which are outside of Xen's mappings.
+     *
+     * SMEP inhibits speculation to any user mappings, so in principle it is
+     * safe to not overwrite the RSB when SMEP is active.
+     *
+     * However, some caveats apply:
+     *
+     * 1) CALL instructions push the next sequential linear address into the
+     *    RSB, meaning that there is a boundary case at the user=>supervisor
+     *    split.  This can be compensated for by having an unmapped or NX
+     *    page, or an instruction which halts speculation.
      *
-     * With SMEP enabled, the processor won't speculate into user mappings.
-     * Therefore, in this case, we don't need to worry about poisoned entries
-     * from 64bit PV guests.
+     *    For Xen, the next sequential linear address is the start of M2P
+     *    (mapped NX), or a zapped hole (unmapped).
      *
-     * 32bit PV guest kernels run in ring 1, so use supervisor mappings.
-     * If a processors speculates to 32bit PV guest kernel mappings, it is
-     * speculating in 64bit supervisor mode, and can leak data.
+     * 2) 32bit PV kernels execute in Ring 1 and use supervisor mappings.
+     *    SMEP offers no protection in this case.
+     *
+     * 3) Some CPUs have RSBs which are not full width, which allow the
+     *    attacker's entries to alias Xen addresses.
+     *
+     * It is safe to turn off RSB stuffing when Xen is using SMEP itself, and
+     * 32bit PV guests are disabled, and when the RSB is full width.
      */
+    BUILD_BUG_ON(RO_MPT_VIRT_START != PML4_ADDR(256));
+    if ( opt_rsb_pv == -1 && boot_cpu_has(X86_FEATURE_XEN_SMEP) &&
+         !opt_pv32 && rsb_is_full_width() )
+        opt_rsb_pv = 0;
+
     if ( opt_rsb_pv )
     {
         setup_force_cpu_cap(X86_FEATURE_SC_RSB_PV);
-- 
2.11.0


