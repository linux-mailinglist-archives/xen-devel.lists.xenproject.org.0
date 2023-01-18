Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65799672887
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 20:38:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480773.745324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIEEv-0000Ef-A8; Wed, 18 Jan 2023 19:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480773.745324; Wed, 18 Jan 2023 19:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIEEv-0000BY-6q; Wed, 18 Jan 2023 19:36:53 +0000
Received: by outflank-mailman (input) for mailman id 480773;
 Wed, 18 Jan 2023 19:36:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vMWs=5P=citrix.com=prvs=37540d4c2=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pIEEu-0000BQ-G8
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 19:36:52 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72374afc-9767-11ed-b8d1-410ff93cb8f0;
 Wed, 18 Jan 2023 20:36:48 +0100 (CET)
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
X-Inumbo-ID: 72374afc-9767-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674070608;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ji3KK17PZ3w8CrRmcf1K16MitXB1wnSQTS0aYMoQlfA=;
  b=OC041fCDnSa7XRMK3e8wa8pSzDjQNaNUFIYZA0n574szM/D+ogbDVdME
   D78Hv2NC7P6KqLSTRO3sdCIzNfbcHKehc5IJXsTL6xgAhNaxUijTeACkT
   gTSotnzFwVfaOWqM+dXmo9M1cn815k5zu3umVzDz2tVVeSqJaxDeezbBy
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 93202811
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:dWa16KpvS49rUWV+tz/S/lCH9aZeBmIEZRIvgKrLsJaIsI4StFCzt
 garIBnTaP2Ia2f1f9pwbo+zpkgF6pPdx9djT1c5pH03EHsb9puZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WxwUmAWP6gR5weHzilNUfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACEAYymY2MSU+6jlE7hJ3dg5Fs/aDapK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVxrl6PqLVxyG/U1AFri5DmMcbPe8zMTsJQ9qqdj
 jOdpTyjUkhDXDCZ4Rrb+FjzgtHLoTLiSYEYBb+fq9Fj3kLGkwT/DzVJDADm8JFVkHWWRNZ3O
 0ESvC00osAa90G1T9+7QxyxplaFuAIRX5xbFOhSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHkpeYVHac/be8ti6pNG4eKmpqWMMfZVJbuZ+5+th110+RCI85S8ZZk+EZBxnhz
 j2zt3cYpY4J05da8v6n52rBsgOF882hohEO2unHYo60xlonO9X0PdbwtgizAeVod9jAEATY1
 JQQs43Htb1VU8nQ/MCYaL9VdIxF8cppJ9E1bbRHO5A6vwqg9He4FWy7yGEvfRw5WirolNKAX
 aMyhe+yzMUJVJdSRfUrC79d8uxzpUQaKfzrV+rPcv1FaYVreQmM8UlGPBDPgzizzhZ3wPBva
 f93lPpA615AUcyLKxLvF48gPUIDnHhilQs/u7ilp/hY7VZuTCHMEupUWLd/Rus48LmFsG3oH
 yV3bqO3J+FkeLSmOEH/qNdDRW3m2FBnXfgaXeQLLL/cSuencUl9Y8LsLUQJJ9c+wf8Ky7eYl
 px/M2cBoGfCabT8AV3iQhhehHnHBP6TcVpT0fQQAGuV
IronPort-HdrOrdr: A9a23:nqd4V6rdTUIGm7++oO9GdcQaV5oVeYIsimQD101hICG9E/b4qy
 nKpp9w6faaskdzZJhNo7290dC7MBXhHP1Oj7X5X43PYOCOggLBEGkJhbGSugEIcBeQygcy78
 ddm6QXMqyTMbB25fyKhzVRGb4bsby6GK/Bv5a780tQ
X-IronPort-AV: E=Sophos;i="5.97,226,1669093200"; 
   d="scan'208";a="93202811"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Kevin Tian
	<kevin.tian@intel.com>
Subject: [PATCH] x86/vmx: Partially revert "x86/vmx: implement Notify VM Exit"
Date: Wed, 18 Jan 2023 19:36:37 +0000
Message-ID: <20230118193637.8907-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The original patch tried to do two things - implement VMNotify, and
re-optimise VT-x to not intercept #DB/#AC by default.

The second part is buggy in multiple ways.  Both GDBSX and Introspection need
to conditionally intercept #DB, which was not accounted for.  Also, #DB
interception has nothing at all to do with cpu_has_monitor_trap_flag.

Revert the second half, leaving #DB/#AC intercepted unilaterally, but with
VMNotify active by default when available.

Fixes: 573279cde1c4 ("x86/vmx: implement Notify VM Exit")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Kevin Tian <kevin.tian@intel.com>

 #DB/#AC are not fastpaths in the slightest.  This perf optimisation can be
reworked at some point later with rather more care and testing.

It's *really* not as urgent as getting VMNotify active by default.
---
 xen/arch/x86/hvm/vmx/vmcs.c | 11 ++---------
 xen/arch/x86/hvm/vmx/vmx.c  | 16 ++--------------
 2 files changed, 4 insertions(+), 23 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 8992f4e0aeb2..7d8bfeb53982 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1296,17 +1296,10 @@ static int construct_vmcs(struct vcpu *v)
     v->arch.hvm.vmx.exception_bitmap = HVM_TRAP_MASK
               | (paging_mode_hap(d) ? 0 : (1U << TRAP_page_fault))
               | (v->arch.fully_eager_fpu ? 0 : (1U << TRAP_no_device));
+
     if ( cpu_has_vmx_notify_vm_exiting )
-    {
         __vmwrite(NOTIFY_WINDOW, vm_notify_window);
-        /*
-         * Disable #AC and #DB interception: by using VM Notify Xen is
-         * guaranteed to get a VM exit even if the guest manages to lock the
-         * CPU.
-         */
-        v->arch.hvm.vmx.exception_bitmap &= ~((1U << TRAP_debug) |
-                                              (1U << TRAP_alignment_check));
-    }
+
     vmx_update_exception_bitmap(v);
 
     v->arch.hvm.guest_cr[0] = X86_CR0_PE | X86_CR0_ET;
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 15a07933ee5d..2e2ab0ac0e26 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1564,19 +1564,10 @@ static void cf_check vmx_update_host_cr3(struct vcpu *v)
 
 void vmx_update_debug_state(struct vcpu *v)
 {
-    unsigned int mask = 1u << TRAP_int3;
-
-    if ( !cpu_has_monitor_trap_flag && cpu_has_vmx_notify_vm_exiting )
-        /*
-         * Only allow toggling TRAP_debug if notify VM exit is enabled, as
-         * unconditionally setting TRAP_debug is part of the XSA-156 fix.
-         */
-        mask |= 1u << TRAP_debug;
-
     if ( v->arch.hvm.debug_state_latch )
-        v->arch.hvm.vmx.exception_bitmap |= mask;
+        v->arch.hvm.vmx.exception_bitmap |= 1U << TRAP_int3;
     else
-        v->arch.hvm.vmx.exception_bitmap &= ~mask;
+        v->arch.hvm.vmx.exception_bitmap &= ~(1U << TRAP_int3);
 
     vmx_vmcs_enter(v);
     vmx_update_exception_bitmap(v);
@@ -4192,9 +4183,6 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
         switch ( vector )
         {
         case TRAP_debug:
-            if ( cpu_has_monitor_trap_flag && cpu_has_vmx_notify_vm_exiting )
-                goto exit_and_crash;
-
             /*
              * Updates DR6 where debugger can peek (See 3B 23.2.1,
              * Table 23-1, "Exit Qualification for Debug Exceptions").
-- 
2.11.0


