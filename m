Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB67D694959
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 15:58:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494615.764810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRaHX-0003Up-8G; Mon, 13 Feb 2023 14:58:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494615.764810; Mon, 13 Feb 2023 14:58:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRaHX-0003QU-0b; Mon, 13 Feb 2023 14:58:15 +0000
Received: by outflank-mailman (input) for mailman id 494615;
 Mon, 13 Feb 2023 14:58:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sHlb=6J=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pRaHV-0001Ha-Mj
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 14:58:13 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5e0b7d7-abae-11ed-93b5-47a8fe42b414;
 Mon, 13 Feb 2023 15:58:12 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id a10so13250838edu.9
 for <xen-devel@lists.xenproject.org>; Mon, 13 Feb 2023 06:58:12 -0800 (PST)
Received: from uni.router.wind (adsl-89.109.242.225.tellas.gr.
 [109.242.225.89]) by smtp.googlemail.com with ESMTPSA id
 v1-20020a50a441000000b004aab66d34c7sm6787617edb.7.2023.02.13.06.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 06:58:11 -0800 (PST)
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
X-Inumbo-ID: d5e0b7d7-abae-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MvIoc5bBDL+U3AaRn4Z94l9PVnkFFMdQ2k/Ww5bMv0w=;
        b=JdMx4mznZ0/8VCrN7/smpGbxw2TcphyETjng1zV9KYbGGVRaESxC+YVH+QLmKMcwkv
         2x1zLE9zM4IT0SWlFQ6Lb9FxMlcrKtVKs3cSonckkza7fuawSuWmc6ffbFng1eYmgF/3
         oecTjTmqv8krRF4saVRHxKikfhJE5fS4x5nBYGkp5CanYufUBDBOsYtivWp0Psx/uTgw
         q0qeAiRaFjv7P3vikuPmM06m0Rvk2Y2D3Zq+02s915L6Yw7ZMmS4A9/CkHK9GiC8leZU
         HQDLeeRMtPjgj9TE6wt1LQVRLTL0QLaiu/fFgob9fFsTXNhE7utpMuIhPyd3CJp5hp8W
         BP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MvIoc5bBDL+U3AaRn4Z94l9PVnkFFMdQ2k/Ww5bMv0w=;
        b=54i7I8seBsriLBhwm0qAjM5T64YLYjFSmXoZRpK1g8wvZZwVxYirlJYw0MRL/8JHDE
         k/hR001axfNJqlTfrRK+KemXVu83aBstY/mQTqChMKXyalL4LxFkCEBg/dAEKHizxK/J
         DvoP4ufOAGrgMiUH0Z2DWtdDODEFjiNfYvMZkuK+M8IDjIycgZLwltpxxVAfS6YfDTCM
         fKiwQ40QVs1OyUbLo3J5EF8iXvYKy3UAox53gWRB5AcS3wbD6cmvBVxrSA6uoZKriD0R
         80T4CC5b5szMNw+GIoOTSDcUgN9ftQTEEwKRS4oSDk1GJgBC3G2Pv5j0vLQ6Ck0gNsYA
         idag==
X-Gm-Message-State: AO0yUKWQWc7zC37oOGRnRSpEbLjphbNTphEFdncl4whExHYnVwXSXh3Y
	BPTOvQVf5Y5SWw8LE2tna2H2IPhUWUg=
X-Google-Smtp-Source: AK7set9ISVZ/9+WhCVxmbwk/PEEwSzL7YpdteuK90ToMhP7WfzgjriLjNFMIjhZGZ5oqPZO1Z0CoMQ==
X-Received: by 2002:a50:8d1e:0:b0:4ac:c426:6b4a with SMTP id s30-20020a508d1e000000b004acc4266b4amr4832781eds.36.1676300291502;
        Mon, 13 Feb 2023 06:58:11 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [RFC 08/10] x86: wire cpu_has_svm/vmx_* to false when svm/vmx not enabled
Date: Mon, 13 Feb 2023 16:57:49 +0200
Message-Id: <20230213145751.1047236-9-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230213145751.1047236-1-burzalodowa@gmail.com>
References: <20230213145751.1047236-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To be able to use cpu_has_svm/vmx_* macros in common code without enclosing
them inside #ifdef guards when the respective virtualization technology is
not enabled, define them as false when not applicable.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/x86/include/asm/hvm/svm/svm.h  | 17 ++++++++++++
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h | 35 +++++++++++++++++++++++++
 xen/arch/x86/include/asm/hvm/vmx/vmx.h  | 18 +++++++++++++
 3 files changed, 70 insertions(+)

diff --git a/xen/arch/x86/include/asm/hvm/svm/svm.h b/xen/arch/x86/include/asm/hvm/svm/svm.h
index 65e35a4f59..556584851b 100644
--- a/xen/arch/x86/include/asm/hvm/svm/svm.h
+++ b/xen/arch/x86/include/asm/hvm/svm/svm.h
@@ -80,6 +80,7 @@ extern u32 svm_feature_flags;
 #define SVM_FEATURE_SSS           19 /* NPT Supervisor Shadow Stacks */
 #define SVM_FEATURE_SPEC_CTRL     20 /* MSR_SPEC_CTRL virtualisation */
 
+#ifdef CONFIG_AMD_SVM
 #define cpu_has_svm_feature(f) (svm_feature_flags & (1u << (f)))
 #define cpu_has_svm_npt       cpu_has_svm_feature(SVM_FEATURE_NPT)
 #define cpu_has_svm_lbrv      cpu_has_svm_feature(SVM_FEATURE_LBRV)
@@ -95,6 +96,22 @@ extern u32 svm_feature_flags;
 #define cpu_has_svm_vloadsave cpu_has_svm_feature(SVM_FEATURE_VLOADSAVE)
 #define cpu_has_svm_sss       cpu_has_svm_feature(SVM_FEATURE_SSS)
 #define cpu_has_svm_spec_ctrl cpu_has_svm_feature(SVM_FEATURE_SPEC_CTRL)
+#else
+#define cpu_has_svm_npt       false
+#define cpu_has_svm_lbrv      false
+#define cpu_has_svm_svml      false
+#define cpu_has_svm_nrips     false
+#define cpu_has_svm_cleanbits false
+#define cpu_has_svm_flushbyasid false
+#define cpu_has_svm_decode    false
+#define cpu_has_svm_vgif      false
+#define cpu_has_pause_filter  false
+#define cpu_has_pause_thresh  false
+#define cpu_has_tsc_ratio     false
+#define cpu_has_svm_vloadsave false
+#define cpu_has_svm_sss       false
+#define cpu_has_svm_spec_ctrl false
+#endif /* CONFIG_AMD_SVM */
 
 #define SVM_PAUSEFILTER_INIT    4000
 #define SVM_PAUSETHRESH_INIT    1000
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
index 0a84e74478..03d1f7480a 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -294,6 +294,7 @@ extern u64 vmx_ept_vpid_cap;
 
 #define VMX_TSC_MULTIPLIER_MAX                  0xffffffffffffffffULL
 
+#ifdef CONFIG_INTEL_VMX
 #define cpu_has_wbinvd_exiting \
     (vmx_secondary_exec_control & SECONDARY_EXEC_WBINVD_EXITING)
 #define cpu_has_vmx_virtualize_apic_accesses \
@@ -352,6 +353,36 @@ extern u64 vmx_ept_vpid_cap;
     (vmx_secondary_exec_control & SECONDARY_EXEC_BUS_LOCK_DETECTION)
 #define cpu_has_vmx_notify_vm_exiting \
     (vmx_secondary_exec_control & SECONDARY_EXEC_NOTIFY_VM_EXITING)
+#else
+#define cpu_has_wbinvd_exiting false
+#define cpu_has_vmx_virtualize_apic_accesses false
+#define cpu_has_vmx_tpr_shadow false
+#define cpu_has_vmx_vnmi false
+#define cpu_has_vmx_msr_bitmap false
+#define cpu_has_vmx_secondary_exec_control false
+#define cpu_has_vmx_ept false
+#define cpu_has_vmx_dt_exiting false
+#define cpu_has_vmx_vpid false
+#define cpu_has_monitor_trap_flag false
+#define cpu_has_vmx_pat false
+#define cpu_has_vmx_efer false
+#define cpu_has_vmx_unrestricted_guest false
+#define vmx_unrestricted_guest(v) false
+#define cpu_has_vmx_ple false
+#define cpu_has_vmx_apic_reg_virt false
+#define cpu_has_vmx_virtual_intr_delivery false
+#define cpu_has_vmx_virtualize_x2apic_mode false
+#define cpu_has_vmx_posted_intr_processing false
+#define cpu_has_vmx_vmcs_shadowing false
+#define cpu_has_vmx_vmfunc false
+#define cpu_has_vmx_virt_exceptions false
+#define cpu_has_vmx_pml false
+#define cpu_has_vmx_mpx false
+#define cpu_has_vmx_xsaves false
+#define cpu_has_vmx_tsc_scaling false
+#define cpu_has_vmx_bus_lock_detection false
+#define cpu_has_vmx_notify_vm_exiting false
+#endif /* CONFIG_INTEL_VMX */
 
 #define VMCS_RID_TYPE_MASK              0x80000000
 
@@ -374,8 +405,12 @@ extern u64 vmx_ept_vpid_cap;
 #define VMX_BASIC_DEFAULT1_ZERO		(1ULL << 55)
 
 extern u64 vmx_basic_msr;
+#ifdef CONFIG_INTEL_VMX
 #define cpu_has_vmx_ins_outs_instr_info \
     (!!(vmx_basic_msr & VMX_BASIC_INS_OUT_INFO))
+#else
+#define cpu_has_vmx_ins_outs_instr_info false
+#endif /* CONFIG_INTEL_VMX */
 
 /* Guest interrupt status */
 #define VMX_GUEST_INTR_STATUS_SUBFIELD_BITMASK  0x0FF
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index 97d6b810ec..fe9a5796f7 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -289,6 +289,7 @@ typedef union cr_access_qual {
 
 extern uint8_t posted_intr_vector;
 
+#ifdef CONFIG_INTEL_VMX
 #define cpu_has_vmx_ept_exec_only_supported        \
     (vmx_ept_vpid_cap & VMX_EPT_EXEC_ONLY_SUPPORTED)
 
@@ -301,6 +302,17 @@ extern uint8_t posted_intr_vector;
 #define cpu_has_vmx_ept_ad    (vmx_ept_vpid_cap & VMX_EPT_AD_BIT)
 #define cpu_has_vmx_ept_invept_single_context   \
     (vmx_ept_vpid_cap & VMX_EPT_INVEPT_SINGLE_CONTEXT)
+#else
+#define cpu_has_vmx_ept_exec_only_supported false
+
+#define cpu_has_vmx_ept_wl4_supported false
+#define cpu_has_vmx_ept_mt_uc false
+#define cpu_has_vmx_ept_mt_wb false
+#define cpu_has_vmx_ept_2mb false
+#define cpu_has_vmx_ept_1gb false
+#define cpu_has_vmx_ept_ad false
+#define cpu_has_vmx_ept_invept_single_context false
+#endif /* CONFIG_INTEL_VMX */
 
 #define EPT_2MB_SHIFT     16
 #define EPT_1GB_SHIFT     17
@@ -310,12 +322,18 @@ extern uint8_t posted_intr_vector;
 #define INVEPT_SINGLE_CONTEXT   1
 #define INVEPT_ALL_CONTEXT      2
 
+#ifdef CONFIG_INTEL_VMX
 #define cpu_has_vmx_vpid_invvpid_individual_addr                    \
     (vmx_ept_vpid_cap & VMX_VPID_INVVPID_INDIVIDUAL_ADDR)
 #define cpu_has_vmx_vpid_invvpid_single_context                     \
     (vmx_ept_vpid_cap & VMX_VPID_INVVPID_SINGLE_CONTEXT)
 #define cpu_has_vmx_vpid_invvpid_single_context_retaining_global    \
     (vmx_ept_vpid_cap & VMX_VPID_INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL)
+#else
+#define cpu_has_vmx_vpid_invvpid_individual_addr false
+#define cpu_has_vmx_vpid_invvpid_single_context false
+#define cpu_has_vmx_vpid_invvpid_single_context_retaining_global false
+#endif /* CONFIG_INTEL_VMX */
 
 #define INVVPID_INDIVIDUAL_ADDR                 0
 #define INVVPID_SINGLE_CONTEXT                  1
-- 
2.37.2


