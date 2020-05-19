Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E8F1D90DE
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 09:21:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jawYq-0004mA-Kc; Tue, 19 May 2020 07:21:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aMO8=7B=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jawYp-0004m5-Hj
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 07:21:11 +0000
X-Inumbo-ID: 50122fc4-99a1-11ea-b9cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 50122fc4-99a1-11ea-b9cf-bc764e2007e4;
 Tue, 19 May 2020 07:21:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D84F5B1FC;
 Tue, 19 May 2020 07:21:11 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v10 01/12] xen/vmx: let opt_ept_ad always reflect the current
 setting
Date: Tue, 19 May 2020 09:20:55 +0200
Message-Id: <20200519072106.26894-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200519072106.26894-1-jgross@suse.com>
References: <20200519072106.26894-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

In case opt_ept_ad has not been set explicitly by the user via command
line or runtime parameter, it is treated as "no" on Avoton cpus.

Change that handling by setting opt_ept_ad to 0 for this cpu type
explicitly if no user value has been set.

By putting this into the (renamed) boot time initialization of vmcs.c
_vmx_cpu_up() can be made static.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/hvm/vmx/vmcs.c        | 22 +++++++++++++++-------
 xen/arch/x86/hvm/vmx/vmx.c         |  4 +---
 xen/include/asm-x86/hvm/vmx/vmcs.h |  3 +--
 3 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 4c23645454..221af9737a 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -315,10 +315,6 @@ static int vmx_init_vmcs_config(void)
 
         if ( !opt_ept_ad )
             _vmx_ept_vpid_cap &= ~VMX_EPT_AD_BIT;
-        else if ( /* Work around Erratum AVR41 on Avoton processors. */
-                  boot_cpu_data.x86 == 6 && boot_cpu_data.x86_model == 0x4d &&
-                  opt_ept_ad < 0 )
-            _vmx_ept_vpid_cap &= ~VMX_EPT_AD_BIT;
 
         /*
          * Additional sanity checking before using EPT:
@@ -652,7 +648,7 @@ void vmx_cpu_dead(unsigned int cpu)
     vmx_pi_desc_fixup(cpu);
 }
 
-int _vmx_cpu_up(bool bsp)
+static int _vmx_cpu_up(bool bsp)
 {
     u32 eax, edx;
     int rc, bios_locked, cpu = smp_processor_id();
@@ -2108,9 +2104,21 @@ static void vmcs_dump(unsigned char ch)
     printk("**************************************\n");
 }
 
-void __init setup_vmcs_dump(void)
+int __init vmx_vmcs_init(void)
 {
-    register_keyhandler('v', vmcs_dump, "dump VT-x VMCSs", 1);
+    int ret;
+
+    if ( opt_ept_ad < 0 )
+        /* Work around Erratum AVR41 on Avoton processors. */
+        opt_ept_ad = !(boot_cpu_data.x86 == 6 &&
+                       boot_cpu_data.x86_model == 0x4d);
+
+    ret = _vmx_cpu_up(true);
+
+    if ( !ret )
+        register_keyhandler('v', vmcs_dump, "dump VT-x VMCSs", 1);
+
+    return ret;
 }
 
 static void __init __maybe_unused build_assertions(void)
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 6efa80e422..11a4dd94cf 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2482,7 +2482,7 @@ const struct hvm_function_table * __init start_vmx(void)
 {
     set_in_cr4(X86_CR4_VMXE);
 
-    if ( _vmx_cpu_up(true) )
+    if ( vmx_vmcs_init() )
     {
         printk("VMX: failed to initialise.\n");
         return NULL;
@@ -2553,8 +2553,6 @@ const struct hvm_function_table * __init start_vmx(void)
         vmx_function_table.get_guest_bndcfgs = vmx_get_guest_bndcfgs;
     }
 
-    setup_vmcs_dump();
-
     lbr_tsx_fixup_check();
     bdf93_fixup_check();
 
diff --git a/xen/include/asm-x86/hvm/vmx/vmcs.h b/xen/include/asm-x86/hvm/vmx/vmcs.h
index 95c1dea7b8..906810592f 100644
--- a/xen/include/asm-x86/hvm/vmx/vmcs.h
+++ b/xen/include/asm-x86/hvm/vmx/vmcs.h
@@ -21,11 +21,10 @@
 #include <xen/mm.h>
 
 extern void vmcs_dump_vcpu(struct vcpu *v);
-extern void setup_vmcs_dump(void);
+extern int vmx_vmcs_init(void);
 extern int  vmx_cpu_up_prepare(unsigned int cpu);
 extern void vmx_cpu_dead(unsigned int cpu);
 extern int  vmx_cpu_up(void);
-extern int  _vmx_cpu_up(bool bsp);
 extern void vmx_cpu_down(void);
 
 struct vmcs_struct {
-- 
2.26.1


