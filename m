Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 109F284B7EB
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 15:30:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676968.1053342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXMSZ-0004ZN-2O; Tue, 06 Feb 2024 14:30:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676968.1053342; Tue, 06 Feb 2024 14:30:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXMSY-0004VN-Vh; Tue, 06 Feb 2024 14:30:02 +0000
Received: by outflank-mailman (input) for mailman id 676968;
 Tue, 06 Feb 2024 14:30:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x4wk=JP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rXMSX-0004KN-HI
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 14:30:01 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 346ce9b7-c4fc-11ee-8a47-1f161083a0e0;
 Tue, 06 Feb 2024 15:30:00 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a37721e42feso351487866b.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 06:29:58 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 c25-20020a170906171900b00a3667f53691sm1220020eje.86.2024.02.06.06.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 06:29:57 -0800 (PST)
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
X-Inumbo-ID: 346ce9b7-c4fc-11ee-8a47-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707229798; x=1707834598; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fsZlrZvi9YFerP5MveeH4iiwb2SzDqfcOIVBQPs9lQE=;
        b=E9EcdVMbLKePRG6MkrzIosdqA3gGakEZJYpOQ4t8xUfU9qzBCSuNrpQBSGSLDEJuP4
         XcwAb0KP/AQRJkyDNZpzj8AJ2zLa7IgSeQQ2m93bCZ/5Ile8HDFeWbPw6O+hK+aWl5RU
         tsoeXWNak/B2utBWvv8tqRAxHiausoo6pXfko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707229798; x=1707834598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fsZlrZvi9YFerP5MveeH4iiwb2SzDqfcOIVBQPs9lQE=;
        b=T5akLn+sJ+5vjd6iIAamp+jdI4CJZUwrf3aXSDJkFIYta6TQn4/MJvg/oeMFWOE+L0
         M3qCY1cc90SibGrBRoP4JTsDEonpupuY/618aSEFezf1K8Xxxk2AYA6HhJgkSdS1VBVq
         CvXyDlTc6xhGA5Q9oHkUekevGnMDgmyVS7jR8XyCikcZr6JGjHm/X0EZVVESS9xjbwjS
         CN8mr9zZD8NVdy3md5cR1fa4zmGt4xMP/o5GdY0nHEzZ2V/h2plpQU8UU3cVlSCvawKc
         ER/bCU5EtleT/HqiMs5lX8Vcdy0kK9WRIKmDgJVQ42u/POOngm5vVq49XHsQDYBa2oeH
         66lA==
X-Gm-Message-State: AOJu0Yz5F5IJp3u/UtM3aRxBSsUNxTYaRKlMWfbioWYJvK92EnJEpDdT
	jMjvh9BewdT/Lqs5+PdWCfOApFEiVkfv4Bmsi7Ttmlt9ICyq8vfH2F7tcKQ29XXgqUr0cseeyMw
	y
X-Google-Smtp-Source: AGHT+IG5Y7nMGxysjOYLAICTvl7WITL49d/nFugczn+f8opqv7J+ZMw0W7qU8ePnbxcYdSjIxMfirw==
X-Received: by 2002:a17:907:1048:b0:a36:d1e1:71ec with SMTP id oy8-20020a170907104800b00a36d1e171ecmr1939767ejb.46.1707229797924;
        Tue, 06 Feb 2024 06:29:57 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVez7Ui5noFWY0PuCXOpYFV42XauGh1uqkWVG7LhA6WT77G4YD8THNooDlndHrKqL6GYiLhVtp6NuIT16dzRXfidRn/yp0xCf5RzOuVaeLozqnaqzAcQEk1L+AGIkaimSG6DJxitPrHPrmULG9U+gwJPJLx40Plbtab21ASWudfdwtnCWQXcKS3RxyEJbA+X0ubPvfl4XI=
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/vmx: add support for virtualize SPEC_CTRL
Date: Tue,  6 Feb 2024 15:25:07 +0100
Message-ID: <20240206142507.81985-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The feature is defined in the tertiary exec control, and is available starting
from Sapphire Rapids and Alder Lake CPUs.

When enabled, two extra VMCS fields are used: SPEC_CTRL mask and shadow.  Bits
set in mask are not allowed to be toggled by the guest (either set or clear)
and the value in the shadow field is the value the guest expects to be in the
SPEC_CTRL register.

By using it the hypervisor can force the value of SPEC_CTRL bits behind the
guest back without having to trap all accesses to SPEC_CTRL.  It also allows
getting rid of SPEC_CTRL in the guest MSR load list, since the value in the
shadow field will be loaded by the hardware on vmentry.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Applies on top of "VMX: tertiary execution control infrastructure"
---
 xen/arch/x86/hvm/vmx/vmcs.c             | 10 ++++++-
 xen/arch/x86/hvm/vmx/vmx.c              | 40 ++++++++++++++++++++-----
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  5 ++++
 xen/arch/x86/include/asm/msr.h          |  9 ++++--
 4 files changed, 54 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 9e016634ab5c..adcbd014123a 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -202,6 +202,7 @@ static void __init vmx_display_features(void)
     P(cpu_has_vmx_tsc_scaling, "TSC Scaling");
     P(cpu_has_vmx_bus_lock_detection, "Bus Lock Detection");
     P(cpu_has_vmx_notify_vm_exiting, "Notify VM Exit");
+    P(cpu_has_vmx_virt_spec_ctrl, "Virtualize SPEC_CTRL");
 #undef P
 
     if ( !printed )
@@ -365,7 +366,7 @@ static int vmx_init_vmcs_config(bool bsp)
 
     if ( _vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_TERTIARY_CONTROLS )
     {
-        uint64_t opt = 0;
+        uint64_t opt = TERTIARY_EXEC_VIRT_SPEC_CTRL;
 
         _vmx_tertiary_exec_control = adjust_vmx_controls2(
             "Tertiary Exec Control", 0, opt,
@@ -1378,6 +1379,10 @@ static int construct_vmcs(struct vcpu *v)
         rc = vmx_add_msr(v, MSR_PRED_CMD, PRED_CMD_IBPB,
                          VMX_MSR_HOST);
 
+    /* Set any bits we don't allow toggling in the mask field. */
+    if ( cpu_has_vmx_virt_spec_ctrl && v->arch.msrs->spec_ctrl.raw )
+        __vmwrite(SPEC_CTRL_MASK, v->arch.msrs->spec_ctrl.raw);
+
  out:
     vmx_vmcs_exit(v);
 
@@ -2086,6 +2091,9 @@ void vmcs_dump_vcpu(struct vcpu *v)
     if ( v->arch.hvm.vmx.secondary_exec_control &
          SECONDARY_EXEC_VIRTUAL_INTR_DELIVERY )
         printk("InterruptStatus = %04x\n", vmr16(GUEST_INTR_STATUS));
+    if ( cpu_has_vmx_virt_spec_ctrl )
+        printk("SPEC_CTRL mask = %#016lx  shadow = %#016lx\n",
+               vmr(SPEC_CTRL_MASK), vmr(SPEC_CTRL_SHADOW));
 
     printk("*** Host State ***\n");
     printk("RIP = 0x%016lx (%ps)  RSP = 0x%016lx\n",
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 48376cc32751..3911e4ecb0d6 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -823,18 +823,28 @@ static void cf_check vmx_cpuid_policy_changed(struct vcpu *v)
     {
         vmx_clear_msr_intercept(v, MSR_SPEC_CTRL, VMX_MSR_RW);
 
-        rc = vmx_add_guest_msr(v, MSR_SPEC_CTRL, 0);
-        if ( rc )
-            goto out;
+        if ( !cpu_has_vmx_virt_spec_ctrl )
+        {
+            rc = vmx_add_guest_msr(v, MSR_SPEC_CTRL, 0);
+            if ( rc )
+                goto out;
+        }
     }
     else
     {
         vmx_set_msr_intercept(v, MSR_SPEC_CTRL, VMX_MSR_RW);
 
-        rc = vmx_del_msr(v, MSR_SPEC_CTRL, VMX_MSR_GUEST);
-        if ( rc && rc != -ESRCH )
-            goto out;
-        rc = 0; /* Tolerate -ESRCH */
+        /*
+         * NB: there's no need to clear the virtualize SPEC_CTRL control, as
+         * the MSR intercept takes precedence.
+         */
+        if ( !cpu_has_vmx_virt_spec_ctrl )
+        {
+            rc = vmx_del_msr(v, MSR_SPEC_CTRL, VMX_MSR_GUEST);
+            if ( rc && rc != -ESRCH )
+                goto out;
+            rc = 0; /* Tolerate -ESRCH */
+        }
     }
 
     /* MSR_PRED_CMD is safe to pass through if the guest knows about it. */
@@ -2629,6 +2639,9 @@ static uint64_t cf_check vmx_get_reg(struct vcpu *v, unsigned int reg)
     switch ( reg )
     {
     case MSR_SPEC_CTRL:
+        if ( cpu_has_vmx_virt_spec_ctrl )
+            /* Requires remote VMCS loaded - fetched below. */
+            break;
         rc = vmx_read_guest_msr(v, reg, &val);
         if ( rc )
         {
@@ -2652,6 +2665,11 @@ static uint64_t cf_check vmx_get_reg(struct vcpu *v, unsigned int reg)
     vmx_vmcs_enter(v);
     switch ( reg )
     {
+    case MSR_SPEC_CTRL:
+        ASSERT(cpu_has_vmx_virt_spec_ctrl);
+        __vmread(SPEC_CTRL_SHADOW, &val);
+        break;
+
     case MSR_IA32_BNDCFGS:
         __vmread(GUEST_BNDCFGS, &val);
         break;
@@ -2678,6 +2696,9 @@ static void cf_check vmx_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
     switch ( reg )
     {
     case MSR_SPEC_CTRL:
+        if ( cpu_has_vmx_virt_spec_ctrl )
+            /* Requires remote VMCS loaded - fetched below. */
+            break;
         rc = vmx_write_guest_msr(v, reg, val);
         if ( rc )
         {
@@ -2698,6 +2719,11 @@ static void cf_check vmx_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
     vmx_vmcs_enter(v);
     switch ( reg )
     {
+    case MSR_SPEC_CTRL:
+        ASSERT(cpu_has_vmx_virt_spec_ctrl);
+        __vmwrite(SPEC_CTRL_SHADOW, val);
+        break;
+
     case MSR_IA32_BNDCFGS:
         __vmwrite(GUEST_BNDCFGS, val);
         break;
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
index a7dd2eeffcad..58140af69153 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -270,6 +270,9 @@ extern u32 vmx_secondary_exec_control;
 #define TERTIARY_EXEC_VIRT_SPEC_CTRL            BIT(7, UL)
 extern uint64_t vmx_tertiary_exec_control;
 
+#define cpu_has_vmx_virt_spec_ctrl \
+     (vmx_tertiary_exec_control & TERTIARY_EXEC_VIRT_SPEC_CTRL)
+
 #define VMX_EPT_EXEC_ONLY_SUPPORTED                         0x00000001
 #define VMX_EPT_WALK_LENGTH_4_SUPPORTED                     0x00000040
 #define VMX_EPT_MEMORY_TYPE_UC                              0x00000100
@@ -436,6 +439,8 @@ enum vmcs_field {
     XSS_EXIT_BITMAP                 = 0x0000202c,
     TSC_MULTIPLIER                  = 0x00002032,
     TERTIARY_VM_EXEC_CONTROL        = 0x00002034,
+    SPEC_CTRL_MASK                  = 0x0000204a,
+    SPEC_CTRL_SHADOW                = 0x0000204c,
     GUEST_PHYSICAL_ADDRESS          = 0x00002400,
     VMCS_LINK_POINTER               = 0x00002800,
     GUEST_IA32_DEBUGCTL             = 0x00002802,
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index 1d8ea9f26faa..eed7b36cd992 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -302,8 +302,13 @@ struct vcpu_msrs
      * For PV guests, this holds the guest kernel value.  It is accessed on
      * every entry/exit path.
      *
-     * For VT-x guests, the guest value is held in the MSR guest load/save
-     * list.
+     * For VT-x guests, the guest value is held in the MSR guest load/save list
+     * if there's no support for virtualized SPEC_CTRL. If virtualized
+     * SPEC_CTRL is enabled the value here signals which bits in SPEC_CTRL the
+     * guest is not able to modify.  Note that the value for those bits used in
+     * Xen context is also used in the guest context.  Setting a bit here
+     * doesn't force such bit to set in the guest context unless also set in
+     * Xen selection of SPEC_CTRL.
      *
      * For SVM, the guest value lives in the VMCB, and hardware saves/restores
      * the host value automatically.  However, guests run with the OR of the
-- 
2.43.0


