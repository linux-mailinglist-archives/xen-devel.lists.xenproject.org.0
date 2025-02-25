Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA200A43DC9
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 12:37:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895668.1304330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmtFt-0003CX-Rw; Tue, 25 Feb 2025 11:37:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895668.1304330; Tue, 25 Feb 2025 11:37:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmtFt-0003AR-Od; Tue, 25 Feb 2025 11:37:41 +0000
Received: by outflank-mailman (input) for mailman id 895668;
 Tue, 25 Feb 2025 11:37:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tmtFs-0002Ya-Ff
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 11:37:40 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea789a32-f36c-11ef-9897-31a8f345e629;
 Tue, 25 Feb 2025 12:37:38 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-388cae9eb9fso2879638f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 03:37:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd8e7121sm1991465f8f.61.2025.02.25.03.37.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 03:37:38 -0800 (PST)
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
X-Inumbo-ID: ea789a32-f36c-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740483458; x=1741088258; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6uSgxkwpDZFbL0VmO//I6SlIcZxFmgRGqtOVriVjNJU=;
        b=PpyCAe8fViuGvakCYJA/O2M7TdmF7/VtVexIIuJpk8lsCw+J9WDavPjamKPJ+RBfTD
         f+OyvIVL21tGexFltVtUWt7n7OXtZ/py6rBR+1Yh6YQOv0n5E+/ot3FWqOT1zovEmDRv
         RViCTEvwX/zx2SIPUiQDVzjFoZOY6fGuZHlZsZVIP68Tn61bpt20FdzTHUnA/GRec53f
         pOza/GFeJ9jx6Nlalbx1C0tHZSDF9AbluqpMylfraL4bF1k7jL2RHi/IWWYrh99bhmv4
         aqaozS1F28unkjjeQ3S8Bvafbz4JUEsoo6Luzjh9zz1Eq/7tF8v8mMQGt2HjEuNrdn3/
         +HbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740483458; x=1741088258;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6uSgxkwpDZFbL0VmO//I6SlIcZxFmgRGqtOVriVjNJU=;
        b=nD0CzCky50Zp4jmOgdDs8ocn2qRUxF3A/M48PoLS/uRBbR+HMT+MZgpd5ilW9CK76o
         jPNVQ58JHLBXO8g5u2S0mv82GVar9oeRQ/aG6pvLzCC7q1JgE+u59Z7sxMbswsl0yqBe
         C/XGSIPhSKqqvFN/+gVH1IBbT0aHA6MoSyP/w6yZ87NfMcb/IdfHOUxEmmz9QH4q8HWA
         6txcL5A/7Fotqi/Xxk5cc84iHQSa+YMnQTg0B546i33SOY6c9+CO7Ppl4PfGo72rd7Qg
         NJ6+E3v+7AmDwio+ElB45f/ZdHgvNxOFbYTrrRNm32QJfb1BHxPgd6TMEkB+raSF6OW6
         3Zxw==
X-Gm-Message-State: AOJu0YxaVuCas9uNcgW8Z/pO5eafKId/2L/F5QFbU39FgYNBPm2HgbjM
	ROT+unsDHMiDOBudp2aod2QcvUQ0PdreLZX89Y1EvOZmDwDbwz2CUiw+9selcwxr5xr09redZGg
	=
X-Gm-Gg: ASbGnctLNIPOAJo8FQ0kQfMu3F4x5GHW/CTaTw17++K9am7hqdNrue301HvuIH9Thp9
	LGkT0WYXCEJFr4pm6XEIktU62VrCuXK06INfQJ7llSXoFDBBXGW68Q+WMxY83ZhaHff0mPtvERQ
	Ir88ybm6IofitnywcUacFEYllivOjOynijO+1CTNXPQrGrdCnyvDwEeiwwEFl/wetHo4lAyRi16
	aEtbrmFPRxQeos38FtrB5HckDgGLMPMFr/zE2Yo381oXbcY1egPIctqmT07VgJor97nmsVDRyl3
	bRY67eiG0y6wBRHxZi7UB1acEC1NyNtWSQE0NtQcMorcl8Iwmr/+xytf6WXi9wKBG5Z9NqAqiRG
	Td9IUcYz6e3U=
X-Google-Smtp-Source: AGHT+IHFA9EOyHdTNGWqdgJuv5Erlj+E1X56smhCgRn4T8/vZ24k2pb5+kAuz7+uVq5f7Lvj72uMJw==
X-Received: by 2002:a5d:6d07:0:b0:38f:2766:7594 with SMTP id ffacd0b85a97d-390cc6048c8mr1954114f8f.12.1740483458295;
        Tue, 25 Feb 2025 03:37:38 -0800 (PST)
Message-ID: <2b5f1dd8-7f4c-45dd-abea-a1876adaec8d@suse.com>
Date: Tue, 25 Feb 2025 12:37:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 02/11] VMX: drop vmcs_revision_id
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <748548e8-79e5-4957-be16-c5ea4d202d21@suse.com>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <748548e8-79e5-4957-be16-c5ea4d202d21@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's effectively redundant with vmx_basic_msr. For the #define
replacement to work, struct vmcs_struct's respective field name also
needs to change: Drop the not really meaningful "vmcs_" prefix from it.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
v2: New.

--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -175,7 +175,7 @@ static DEFINE_PER_CPU(paddr_t, current_v
 static DEFINE_PER_CPU(struct list_head, active_vmcs_list);
 DEFINE_PER_CPU(bool, vmxon);
 
-static u32 vmcs_revision_id __read_mostly;
+#define vmcs_revision_id (vmx_basic_msr & VMX_BASIC_REVISION_MASK)
 u64 __read_mostly vmx_basic_msr;
 
 static void __init vmx_display_features(void)
@@ -501,7 +501,6 @@ static int vmx_init_vmcs_config(bool bsp
     if ( !vmx_pin_based_exec_control )
     {
         /* First time through. */
-        vmcs_revision_id           = vmx_basic_msr_low & VMX_BASIC_REVISION_MASK;
         vmx_pin_based_exec_control = _vmx_pin_based_exec_control;
         vmx_cpu_based_exec_control = _vmx_cpu_based_exec_control;
         vmx_secondary_exec_control = _vmx_secondary_exec_control;
@@ -613,7 +612,7 @@ static paddr_t vmx_alloc_vmcs(void)
 
     vmcs = __map_domain_page(pg);
     clear_page(vmcs);
-    vmcs->vmcs_revision_id = vmcs_revision_id;
+    vmcs->revision_id = vmcs_revision_id;
     unmap_domain_page(vmcs);
 
     return page_to_maddr(pg);
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1166,7 +1166,7 @@ static void nvmx_set_vmcs_pointer(struct
     paddr_t vvmcs_maddr = v->arch.hvm.vmx.vmcs_shadow_maddr;
 
     __vmpclear(vvmcs_maddr);
-    vvmcs->vmcs_revision_id |= VMCS_RID_TYPE_MASK;
+    vvmcs->revision_id |= VMCS_RID_TYPE_MASK;
     v->arch.hvm.vmx.secondary_exec_control |=
         SECONDARY_EXEC_ENABLE_VMCS_SHADOWING;
     __vmwrite(SECONDARY_VM_EXEC_CONTROL,
@@ -1181,7 +1181,7 @@ static void nvmx_clear_vmcs_pointer(stru
     paddr_t vvmcs_maddr = v->arch.hvm.vmx.vmcs_shadow_maddr;
 
     __vmpclear(vvmcs_maddr);
-    vvmcs->vmcs_revision_id &= ~VMCS_RID_TYPE_MASK;
+    vvmcs->revision_id &= ~VMCS_RID_TYPE_MASK;
     v->arch.hvm.vmx.secondary_exec_control &=
         ~SECONDARY_EXEC_ENABLE_VMCS_SHADOWING;
     __vmwrite(SECONDARY_VM_EXEC_CONTROL,
@@ -1799,10 +1799,10 @@ static int nvmx_handle_vmptrld(struct cp
             {
                 struct vmcs_struct *vvmcs = vvmcx;
 
-                if ( ((vvmcs->vmcs_revision_id ^ vmx_basic_msr) &
-                                         VMX_BASIC_REVISION_MASK) ||
+                if ( ((vvmcs->revision_id ^ vmx_basic_msr) &
+                      VMX_BASIC_REVISION_MASK) ||
                      (!cpu_has_vmx_vmcs_shadowing &&
-                      (vvmcs->vmcs_revision_id & ~VMX_BASIC_REVISION_MASK)) )
+                      (vvmcs->revision_id & ~VMX_BASIC_REVISION_MASK)) )
                 {
                     hvm_unmap_guest_frame(vvmcx, 1);
                     vmfail(regs, VMX_INSN_VMPTRLD_INCORRECT_VMCS_ID);
@@ -2215,7 +2215,7 @@ int nvmx_msr_read_intercept(unsigned int
             map_domain_page(_mfn(PFN_DOWN(v->arch.hvm.vmx.vmcs_pa)));
 
         data = (host_data & (~0ul << 32)) |
-               (vmcs->vmcs_revision_id & 0x7fffffff);
+               (vmcs->revision_id & 0x7fffffff);
         unmap_domain_page(vmcs);
 
         if ( !cpu_has_vmx_vmcs_shadowing )
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -17,7 +17,7 @@ int cf_check vmx_cpu_up(void);
 void cf_check vmx_cpu_down(void);
 
 struct vmcs_struct {
-    u32 vmcs_revision_id;
+    uint32_t revision_id;
     unsigned char data [0]; /* vmcs size is read from MSR */
 };
 


