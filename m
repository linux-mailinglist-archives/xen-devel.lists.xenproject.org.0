Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 332346A3BE2
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 08:57:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502220.773940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWYNh-0001qd-B6; Mon, 27 Feb 2023 07:57:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502220.773940; Mon, 27 Feb 2023 07:57:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWYNh-0001o1-7F; Mon, 27 Feb 2023 07:57:09 +0000
Received: by outflank-mailman (input) for mailman id 502220;
 Mon, 27 Feb 2023 07:57:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oRQf=6X=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pWYNf-0000zt-81
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 07:57:07 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5353a6b3-b674-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 08:57:05 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id cq23so22126117edb.1
 for <xen-devel@lists.xenproject.org>; Sun, 26 Feb 2023 23:57:05 -0800 (PST)
Received: from uni.router.wind (adsl-209.109.242.226.tellas.gr.
 [109.242.226.209]) by smtp.googlemail.com with ESMTPSA id
 b23-20020a50ccd7000000b0049ef70a2894sm2788272edj.38.2023.02.26.23.57.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 23:57:03 -0800 (PST)
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
X-Inumbo-ID: 5353a6b3-b674-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62fJGVZ50pgC5Zj0lapAQX8/jn38WZfFE90N46rhqOc=;
        b=aeopOVF+ZmTM9E1XSIg18EmWxLfPTk6K/Zo8lH97FqBN4mxKZ9nhlE6xRx4Ch29nPT
         /20cPln2vSqnzPXVmUZXVge4IjKXCha/UR2tPxR2t9lxurOwF8ewtWFauKr+4dnWwFH6
         5BFQ18Srn/Av6C+VgelkgNvtR6XZYiARrD+dnswZm6t3G4bqsA+coUhv+vNS4CCdhg76
         FFIr4YictVrBJn+OCAST1Wz4kePyiANoCCaZ6QMiLmFcwBHiUzaiInfz49bF7EAoyFq6
         G5p50jV8fzt8oW1bIMwY/e/sLc6xKuXxvnpv+GDfYuXVBK+3nL6vTUXSJ98+gz5YSn4B
         nfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=62fJGVZ50pgC5Zj0lapAQX8/jn38WZfFE90N46rhqOc=;
        b=BRRIYzzJgaAkpdGCRsneK2PByF8ijquiyR+fUVPZQ6KEa38yZSvL73YO4Mm8NItWSf
         lNNVpM/saWN2Zf2Mmp0llar9qFdX9IR21yVx5BCI5d6ucWK3ACWbPFrY3eTOByqodWnr
         Mvis68EUdsDmZNru6t2d3bt7Y8XroNJYhryJP7Q+qNQOamogqVt8YB2zgziyues3Muw+
         TlD4ftfgDAz+FtYPQXaKbY6VpECJqVjshhsHnk9gz0Y7YDtinztESqCOn0TpWMt9nIj+
         YLnq8uRtuXv3OV2wtyuiYKwIgJzbIvGmGPmYNCvBZBU+L//lB3QOSXrsJP7DtyJOBD98
         rrzQ==
X-Gm-Message-State: AO0yUKW4P8+BQLcxypiy1pV7C9jPdmk2oWseQuYEz0TPo6vLNRIoGwm0
	24HbHgU5ygjB2sMpNCIAAWwbP1fguFAryQ==
X-Google-Smtp-Source: AK7set++sPj47cXU0KyOEHvdPqoq+vL31REQK7S1la89qbPs5Slr4kKrDXazFIwBa/iQHf6X7Cnlyg==
X-Received: by 2002:a05:6402:60d:b0:4ad:7c30:259a with SMTP id n13-20020a056402060d00b004ad7c30259amr24302872edv.2.1677484624048;
        Sun, 26 Feb 2023 23:57:04 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 3/4] x86/vmx: replace enum vmx_msr_intercept_type with the msr access flags
Date: Mon, 27 Feb 2023 09:56:51 +0200
Message-Id: <20230227075652.3782973-4-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230227075652.3782973-1-burzalodowa@gmail.com>
References: <20230227075652.3782973-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace enum vmx_msr_intercept_type with the msr access flags, defined
in hvm.h, so that the functions {svm,vmx}_{set,clear}_msr_intercept()
share the same prototype.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/x86/cpu/vpmu_intel.c           | 24 +++++++-------
 xen/arch/x86/hvm/vmx/vmcs.c             | 38 ++++++++++-----------
 xen/arch/x86/hvm/vmx/vmx.c              | 44 ++++++++++++-------------
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h | 14 ++------
 4 files changed, 54 insertions(+), 66 deletions(-)

diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index bcfa187a14..bd91c79a36 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -230,22 +230,22 @@ static void core2_vpmu_set_msr_bitmap(struct vcpu *v)
 
     /* Allow Read/Write PMU Counters MSR Directly. */
     for ( i = 0; i < fixed_pmc_cnt; i++ )
-        vmx_clear_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR0 + i, VMX_MSR_RW);
+        vmx_clear_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR0 + i, MSR_RW);
 
     for ( i = 0; i < arch_pmc_cnt; i++ )
     {
-        vmx_clear_msr_intercept(v, MSR_IA32_PERFCTR0 + i, VMX_MSR_RW);
+        vmx_clear_msr_intercept(v, MSR_IA32_PERFCTR0 + i, MSR_RW);
 
         if ( full_width_write )
-            vmx_clear_msr_intercept(v, MSR_IA32_A_PERFCTR0 + i, VMX_MSR_RW);
+            vmx_clear_msr_intercept(v, MSR_IA32_A_PERFCTR0 + i, MSR_RW);
     }
 
     /* Allow Read PMU Non-global Controls Directly. */
     for ( i = 0; i < arch_pmc_cnt; i++ )
-        vmx_clear_msr_intercept(v, MSR_P6_EVNTSEL(i), VMX_MSR_R);
+        vmx_clear_msr_intercept(v, MSR_P6_EVNTSEL(i), MSR_R);
 
-    vmx_clear_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR_CTRL, VMX_MSR_R);
-    vmx_clear_msr_intercept(v, MSR_IA32_DS_AREA, VMX_MSR_R);
+    vmx_clear_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR_CTRL, MSR_R);
+    vmx_clear_msr_intercept(v, MSR_IA32_DS_AREA, MSR_R);
 }
 
 static void core2_vpmu_unset_msr_bitmap(struct vcpu *v)
@@ -253,21 +253,21 @@ static void core2_vpmu_unset_msr_bitmap(struct vcpu *v)
     unsigned int i;
 
     for ( i = 0; i < fixed_pmc_cnt; i++ )
-        vmx_set_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR0 + i, VMX_MSR_RW);
+        vmx_set_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR0 + i, MSR_RW);
 
     for ( i = 0; i < arch_pmc_cnt; i++ )
     {
-        vmx_set_msr_intercept(v, MSR_IA32_PERFCTR0 + i, VMX_MSR_RW);
+        vmx_set_msr_intercept(v, MSR_IA32_PERFCTR0 + i, MSR_RW);
 
         if ( full_width_write )
-            vmx_set_msr_intercept(v, MSR_IA32_A_PERFCTR0 + i, VMX_MSR_RW);
+            vmx_set_msr_intercept(v, MSR_IA32_A_PERFCTR0 + i, MSR_RW);
     }
 
     for ( i = 0; i < arch_pmc_cnt; i++ )
-        vmx_set_msr_intercept(v, MSR_P6_EVNTSEL(i), VMX_MSR_R);
+        vmx_set_msr_intercept(v, MSR_P6_EVNTSEL(i), MSR_R);
 
-    vmx_set_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR_CTRL, VMX_MSR_R);
-    vmx_set_msr_intercept(v, MSR_IA32_DS_AREA, VMX_MSR_R);
+    vmx_set_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR_CTRL, MSR_R);
+    vmx_set_msr_intercept(v, MSR_IA32_DS_AREA, MSR_R);
 }
 
 static inline void __core2_vpmu_save(struct vcpu *v)
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index ed71ecfb62..22c12509d5 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -902,8 +902,7 @@ static void vmx_set_host_env(struct vcpu *v)
               (unsigned long)&get_cpu_info()->guest_cpu_user_regs.error_code);
 }
 
-void vmx_clear_msr_intercept(struct vcpu *v, unsigned int msr,
-                             enum vmx_msr_intercept_type type)
+void vmx_clear_msr_intercept(struct vcpu *v, unsigned int msr, int type)
 {
     struct vmx_msr_bitmap *msr_bitmap = v->arch.hvm.vmx.msr_bitmap;
     struct domain *d = v->domain;
@@ -917,25 +916,24 @@ void vmx_clear_msr_intercept(struct vcpu *v, unsigned int msr,
 
     if ( msr <= 0x1fff )
     {
-        if ( type & VMX_MSR_R )
+        if ( type & MSR_R )
             clear_bit(msr, msr_bitmap->read_low);
-        if ( type & VMX_MSR_W )
+        if ( type & MSR_W )
             clear_bit(msr, msr_bitmap->write_low);
     }
     else if ( (msr >= 0xc0000000) && (msr <= 0xc0001fff) )
     {
         msr &= 0x1fff;
-        if ( type & VMX_MSR_R )
+        if ( type & MSR_R )
             clear_bit(msr, msr_bitmap->read_high);
-        if ( type & VMX_MSR_W )
+        if ( type & MSR_W )
             clear_bit(msr, msr_bitmap->write_high);
     }
     else
         ASSERT(!"MSR out of range for interception\n");
 }
 
-void vmx_set_msr_intercept(struct vcpu *v, unsigned int msr,
-                           enum vmx_msr_intercept_type type)
+void vmx_set_msr_intercept(struct vcpu *v, unsigned int msr, int type)
 {
     struct vmx_msr_bitmap *msr_bitmap = v->arch.hvm.vmx.msr_bitmap;
 
@@ -945,17 +943,17 @@ void vmx_set_msr_intercept(struct vcpu *v, unsigned int msr,
 
     if ( msr <= 0x1fff )
     {
-        if ( type & VMX_MSR_R )
+        if ( type & MSR_R )
             set_bit(msr, msr_bitmap->read_low);
-        if ( type & VMX_MSR_W )
+        if ( type & MSR_W )
             set_bit(msr, msr_bitmap->write_low);
     }
     else if ( (msr >= 0xc0000000) && (msr <= 0xc0001fff) )
     {
         msr &= 0x1fff;
-        if ( type & VMX_MSR_R )
+        if ( type & MSR_R )
             set_bit(msr, msr_bitmap->read_high);
-        if ( type & VMX_MSR_W )
+        if ( type & MSR_W )
             set_bit(msr, msr_bitmap->write_high);
     }
     else
@@ -1162,17 +1160,17 @@ static int construct_vmcs(struct vcpu *v)
         v->arch.hvm.vmx.msr_bitmap = msr_bitmap;
         __vmwrite(MSR_BITMAP, virt_to_maddr(msr_bitmap));
 
-        vmx_clear_msr_intercept(v, MSR_FS_BASE, VMX_MSR_RW);
-        vmx_clear_msr_intercept(v, MSR_GS_BASE, VMX_MSR_RW);
-        vmx_clear_msr_intercept(v, MSR_SHADOW_GS_BASE, VMX_MSR_RW);
-        vmx_clear_msr_intercept(v, MSR_IA32_SYSENTER_CS, VMX_MSR_RW);
-        vmx_clear_msr_intercept(v, MSR_IA32_SYSENTER_ESP, VMX_MSR_RW);
-        vmx_clear_msr_intercept(v, MSR_IA32_SYSENTER_EIP, VMX_MSR_RW);
+        vmx_clear_msr_intercept(v, MSR_FS_BASE, MSR_RW);
+        vmx_clear_msr_intercept(v, MSR_GS_BASE, MSR_RW);
+        vmx_clear_msr_intercept(v, MSR_SHADOW_GS_BASE, MSR_RW);
+        vmx_clear_msr_intercept(v, MSR_IA32_SYSENTER_CS, MSR_RW);
+        vmx_clear_msr_intercept(v, MSR_IA32_SYSENTER_ESP, MSR_RW);
+        vmx_clear_msr_intercept(v, MSR_IA32_SYSENTER_EIP, MSR_RW);
         if ( paging_mode_hap(d) && (!is_iommu_enabled(d) || iommu_snoop) )
-            vmx_clear_msr_intercept(v, MSR_IA32_CR_PAT, VMX_MSR_RW);
+            vmx_clear_msr_intercept(v, MSR_IA32_CR_PAT, MSR_RW);
         if ( (vmexit_ctl & VM_EXIT_CLEAR_BNDCFGS) &&
              (vmentry_ctl & VM_ENTRY_LOAD_BNDCFGS) )
-            vmx_clear_msr_intercept(v, MSR_IA32_BNDCFGS, VMX_MSR_RW);
+            vmx_clear_msr_intercept(v, MSR_IA32_BNDCFGS, MSR_RW);
     }
 
     /* I/O access bitmap. */
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 0ec33bcc18..87c47c002c 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -802,7 +802,7 @@ static void cf_check vmx_cpuid_policy_changed(struct vcpu *v)
      */
     if ( cp->feat.ibrsb )
     {
-        vmx_clear_msr_intercept(v, MSR_SPEC_CTRL, VMX_MSR_RW);
+        vmx_clear_msr_intercept(v, MSR_SPEC_CTRL, MSR_RW);
 
         rc = vmx_add_guest_msr(v, MSR_SPEC_CTRL, 0);
         if ( rc )
@@ -810,7 +810,7 @@ static void cf_check vmx_cpuid_policy_changed(struct vcpu *v)
     }
     else
     {
-        vmx_set_msr_intercept(v, MSR_SPEC_CTRL, VMX_MSR_RW);
+        vmx_set_msr_intercept(v, MSR_SPEC_CTRL, MSR_RW);
 
         rc = vmx_del_msr(v, MSR_SPEC_CTRL, VMX_MSR_GUEST);
         if ( rc && rc != -ESRCH )
@@ -820,20 +820,20 @@ static void cf_check vmx_cpuid_policy_changed(struct vcpu *v)
 
     /* MSR_PRED_CMD is safe to pass through if the guest knows about it. */
     if ( cp->feat.ibrsb || cp->extd.ibpb )
-        vmx_clear_msr_intercept(v, MSR_PRED_CMD,  VMX_MSR_RW);
+        vmx_clear_msr_intercept(v, MSR_PRED_CMD, MSR_RW);
     else
-        vmx_set_msr_intercept(v, MSR_PRED_CMD,  VMX_MSR_RW);
+        vmx_set_msr_intercept(v, MSR_PRED_CMD, MSR_RW);
 
     /* MSR_FLUSH_CMD is safe to pass through if the guest knows about it. */
     if ( cp->feat.l1d_flush )
-        vmx_clear_msr_intercept(v, MSR_FLUSH_CMD, VMX_MSR_RW);
+        vmx_clear_msr_intercept(v, MSR_FLUSH_CMD, MSR_RW);
     else
-        vmx_set_msr_intercept(v, MSR_FLUSH_CMD, VMX_MSR_RW);
+        vmx_set_msr_intercept(v, MSR_FLUSH_CMD, MSR_RW);
 
     if ( cp->feat.pks )
-        vmx_clear_msr_intercept(v, MSR_PKRS, VMX_MSR_RW);
+        vmx_clear_msr_intercept(v, MSR_PKRS, MSR_RW);
     else
-        vmx_set_msr_intercept(v, MSR_PKRS, VMX_MSR_RW);
+        vmx_set_msr_intercept(v, MSR_PKRS, MSR_RW);
 
  out:
     vmx_vmcs_exit(v);
@@ -1429,7 +1429,7 @@ static void cf_check vmx_handle_cd(struct vcpu *v, unsigned long value)
 
             vmx_get_guest_pat(v, pat);
             vmx_set_guest_pat(v, uc_pat);
-            vmx_set_msr_intercept(v, MSR_IA32_CR_PAT, VMX_MSR_RW);
+            vmx_set_msr_intercept(v, MSR_IA32_CR_PAT, MSR_RW);
 
             wbinvd();               /* flush possibly polluted cache */
             hvm_asid_flush_vcpu(v); /* invalidate memory type cached in TLB */
@@ -1440,7 +1440,7 @@ static void cf_check vmx_handle_cd(struct vcpu *v, unsigned long value)
             v->arch.hvm.cache_mode = NORMAL_CACHE_MODE;
             vmx_set_guest_pat(v, *pat);
             if ( !is_iommu_enabled(v->domain) || iommu_snoop )
-                vmx_clear_msr_intercept(v, MSR_IA32_CR_PAT, VMX_MSR_RW);
+                vmx_clear_msr_intercept(v, MSR_IA32_CR_PAT, MSR_RW);
             hvm_asid_flush_vcpu(v); /* no need to flush cache */
         }
     }
@@ -1906,9 +1906,9 @@ static void cf_check vmx_update_guest_efer(struct vcpu *v)
      * into hardware, clear the read intercept to avoid unnecessary VMExits.
      */
     if ( guest_efer == v->arch.hvm.guest_efer )
-        vmx_clear_msr_intercept(v, MSR_EFER, VMX_MSR_R);
+        vmx_clear_msr_intercept(v, MSR_EFER, MSR_R);
     else
-        vmx_set_msr_intercept(v, MSR_EFER, VMX_MSR_R);
+        vmx_set_msr_intercept(v, MSR_EFER, MSR_R);
 }
 
 void nvmx_enqueue_n2_exceptions(struct vcpu *v, 
@@ -2335,7 +2335,7 @@ static void cf_check vmx_enable_msr_interception(struct domain *d, uint32_t msr)
     struct vcpu *v;
 
     for_each_vcpu ( d, v )
-        vmx_set_msr_intercept(v, msr, VMX_MSR_W);
+        vmx_set_msr_intercept(v, msr, MSR_W);
 }
 
 static void cf_check vmx_vcpu_update_eptp(struct vcpu *v)
@@ -3502,17 +3502,17 @@ void cf_check vmx_vlapic_msr_changed(struct vcpu *v)
             {
                 for ( msr = MSR_X2APIC_FIRST;
                       msr <= MSR_X2APIC_LAST; msr++ )
-                    vmx_clear_msr_intercept(v, msr, VMX_MSR_R);
+                    vmx_clear_msr_intercept(v, msr, MSR_R);
 
-                vmx_set_msr_intercept(v, MSR_X2APIC_PPR, VMX_MSR_R);
-                vmx_set_msr_intercept(v, MSR_X2APIC_TMICT, VMX_MSR_R);
-                vmx_set_msr_intercept(v, MSR_X2APIC_TMCCT, VMX_MSR_R);
+                vmx_set_msr_intercept(v, MSR_X2APIC_PPR, MSR_R);
+                vmx_set_msr_intercept(v, MSR_X2APIC_TMICT, MSR_R);
+                vmx_set_msr_intercept(v, MSR_X2APIC_TMCCT, MSR_R);
             }
             if ( cpu_has_vmx_virtual_intr_delivery )
             {
-                vmx_clear_msr_intercept(v, MSR_X2APIC_TPR, VMX_MSR_W);
-                vmx_clear_msr_intercept(v, MSR_X2APIC_EOI, VMX_MSR_W);
-                vmx_clear_msr_intercept(v, MSR_X2APIC_SELF, VMX_MSR_W);
+                vmx_clear_msr_intercept(v, MSR_X2APIC_TPR, MSR_W);
+                vmx_clear_msr_intercept(v, MSR_X2APIC_EOI, MSR_W);
+                vmx_clear_msr_intercept(v, MSR_X2APIC_SELF, MSR_W);
             }
         }
         else
@@ -3523,7 +3523,7 @@ void cf_check vmx_vlapic_msr_changed(struct vcpu *v)
            SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE) )
         for ( msr = MSR_X2APIC_FIRST;
               msr <= MSR_X2APIC_LAST; msr++ )
-            vmx_set_msr_intercept(v, msr, VMX_MSR_RW);
+            vmx_set_msr_intercept(v, msr, MSR_RW);
 
     vmx_update_secondary_exec_control(v);
     vmx_vmcs_exit(v);
@@ -3659,7 +3659,7 @@ static int cf_check vmx_msr_write_intercept(
                         return X86EMUL_OKAY;
                     }
 
-                    vmx_clear_msr_intercept(v, lbr->base + i, VMX_MSR_RW);
+                    vmx_clear_msr_intercept(v, lbr->base + i, MSR_RW);
                 }
             }
 
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
index 0a84e74478..e08c506be5 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -644,18 +644,8 @@ static inline int vmx_write_guest_msr(struct vcpu *v, uint32_t msr,
     return 0;
 }
 
-
-/* MSR intercept bitmap infrastructure. */
-enum vmx_msr_intercept_type {
-    VMX_MSR_R  = 1,
-    VMX_MSR_W  = 2,
-    VMX_MSR_RW = VMX_MSR_R | VMX_MSR_W,
-};
-
-void vmx_clear_msr_intercept(struct vcpu *v, unsigned int msr,
-                             enum vmx_msr_intercept_type type);
-void vmx_set_msr_intercept(struct vcpu *v, unsigned int msr,
-                           enum vmx_msr_intercept_type type);
+void vmx_clear_msr_intercept(struct vcpu *v, unsigned int msr, int type);
+void vmx_set_msr_intercept(struct vcpu *v, unsigned int msr, int type);
 void vmx_vmcs_switch(paddr_t from, paddr_t to);
 void vmx_set_eoi_exit_bitmap(struct vcpu *v, u8 vector);
 void vmx_clear_eoi_exit_bitmap(struct vcpu *v, u8 vector);
-- 
2.37.2


