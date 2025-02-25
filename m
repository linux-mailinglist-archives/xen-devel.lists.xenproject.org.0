Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83968A43DE1
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 12:40:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895705.1304380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmtIr-00078I-En; Tue, 25 Feb 2025 11:40:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895705.1304380; Tue, 25 Feb 2025 11:40:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmtIr-00074k-BU; Tue, 25 Feb 2025 11:40:45 +0000
Received: by outflank-mailman (input) for mailman id 895705;
 Tue, 25 Feb 2025 11:40:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tmtH5-0002yH-CZ
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 11:38:55 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17ac0329-f36d-11ef-9aae-95dc52dad729;
 Tue, 25 Feb 2025 12:38:54 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43948f77f1aso33479655e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 03:38:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02ce60asm139318455e9.7.2025.02.25.03.38.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 03:38:53 -0800 (PST)
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
X-Inumbo-ID: 17ac0329-f36d-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740483534; x=1741088334; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DTusM0fDm59kqKhW8l+iBfpZZq5WHW5Z3JNxVLio7rE=;
        b=DRs/SfDR7+GG5G2HNuVNYaWB5+xCSR8A8hUWqScvTQ0T1BMAbyvMbfRnqIpk/uXPux
         rvESQf8gFbSFZJjgdiSgPKN8edpZXvvBnWY978xXwaUHjY2do/+LA2hQ+LqfS9S9iOcx
         Y9+FlUHyQ+5PRc3q5U52nk0ddlz4SwHMSBjxlcNK1PHmGCOBWqiJUpD+C62EdwIodjYp
         0Gv6lGIlY0hUU9LEgKKQjxczF6pTbkh6J8lRIG/EPw7WjIorr79O5N/rZ/vJchTsV4PQ
         1G4ddHvIN6X9YFCaLtQWKjGsakzEsLUpW0NGYLXKKlnN1h5yvPWw95exmm3+/3DKgT6b
         rj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740483534; x=1741088334;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DTusM0fDm59kqKhW8l+iBfpZZq5WHW5Z3JNxVLio7rE=;
        b=V5P54pgZKq1AXGu5zMBF24UBBaF1s4t54zzgHGn3NAAOIk3kQwak6tE/8GnWzn5CHw
         2rt52QgCgUbwgvnRd+ZiqUBCS2yvW02/ihYOo/IiRs3V0ZTvbXCDa1n3clvD7wA98mgq
         9Q4Xx9W8PPb6lBfCdY6aZhbG7LztF/Hej0svEdMn9N+76+6gWHkW7l7Tarsc6bTm9qy/
         6BFOZzOzTJatgGdmYFtwTJiVgMTNbdeYiRhyEjKL3LAx/NxTfpLsPFSJZpI+J8t8sC1D
         0wk4SYXUqJ6g/C5UmWQhVbqGz1JQyMotfkcFQx77EKFk2mojQ2iYHeLVMFS7G/S6hADh
         NQnw==
X-Gm-Message-State: AOJu0YzOiSj1DkF7MdPK2zFmZIA1TzxLfMWX2GjauevP06bgYIB05LT+
	RY17/RzlvHVWNgizyOAVbFdc7kk5GsG0evq1PmtkOZZiE/OvBApDGMm+tXQDOvKphACyL1G5V8Q
	=
X-Gm-Gg: ASbGnctaawt77ha2StDhB3S7zKssP/3MkrZWCHmY3t1DukRomd5sPDlqanYRAiFVz+M
	OAAsp/A3sQYfRa4KMHxfsZ+SLddwJyEhs82tMpFXAzZWZs2PveZb5WDntQiYweeiggI3thZrtN2
	WlTnBv3bUtbGQTPscsBTHQcbtukBuAOgrQ7Di6qjOCUxcyXIuNnmnaKhrSDY1LI7Mk0vKJSx8v+
	TZ1g7H2fydQ9lBMXHtkf5tpIwIuQqG9HRonj66HLiYHCI7842BVHZc8l8fUFsph7cqUOh6ZRUfH
	PHr3Qv3Suo2yUAQQaQz2P75SrzBqn73jtQAZmGjAJytY8crxMkIFJRlEaLD6zIHA/glcReEj6/i
	6wxl3BP/rQTU=
X-Google-Smtp-Source: AGHT+IEJO7wsKesf+/5MzpG4RLDp9qDPXkBIhvcjcV/fC66yW5AIg2E8Z+xYaNC+JgAEhj/8YxAH/A==
X-Received: by 2002:a05:600c:3b1e:b0:439:9f12:1809 with SMTP id 5b1f17b1804b1-43ab0f6de11mr23580275e9.20.1740483534169;
        Tue, 25 Feb 2025 03:38:54 -0800 (PST)
Message-ID: <5b7e9a1d-475e-4023-921a-aca9a3cafc0c@suse.com>
Date: Tue, 25 Feb 2025 12:38:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 05/11] VMX: convert vmx_cpu_based_exec_control
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

... to a field in the capability/controls struct.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
v4: Re-base.
v2: New.

--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -162,7 +162,6 @@ static int cf_check parse_ept_param_runt
 
 /* Dynamic (run-time adjusted) execution control flags. */
 struct vmx_caps __ro_after_init vmx_caps;
-u32 vmx_cpu_based_exec_control __read_mostly;
 u32 vmx_secondary_exec_control __read_mostly;
 uint64_t vmx_tertiary_exec_control __read_mostly;
 u32 vmx_vmexit_control __read_mostly;
@@ -263,7 +262,6 @@ static int vmx_init_vmcs_config(bool bsp
 {
     u32 vmx_basic_msr_low, vmx_basic_msr_high, min, opt;
     struct vmx_caps caps = {};
-    u32 _vmx_cpu_based_exec_control;
     u32 _vmx_secondary_exec_control = 0;
     uint64_t _vmx_tertiary_exec_control = 0;
     u64 _vmx_ept_vpid_cap = 0;
@@ -301,12 +299,12 @@ static int vmx_init_vmcs_config(bool bsp
            CPU_BASED_MONITOR_TRAP_FLAG |
            CPU_BASED_ACTIVATE_SECONDARY_CONTROLS |
            CPU_BASED_ACTIVATE_TERTIARY_CONTROLS);
-    _vmx_cpu_based_exec_control = adjust_vmx_controls(
+    caps.cpu_based_exec_control = adjust_vmx_controls(
         "CPU-Based Exec Control", min, opt,
         MSR_IA32_VMX_PROCBASED_CTLS, &mismatch);
-    _vmx_cpu_based_exec_control &= ~CPU_BASED_RDTSC_EXITING;
-    if ( _vmx_cpu_based_exec_control & CPU_BASED_TPR_SHADOW )
-        _vmx_cpu_based_exec_control &=
+    caps.cpu_based_exec_control &= ~CPU_BASED_RDTSC_EXITING;
+    if ( caps.cpu_based_exec_control & CPU_BASED_TPR_SHADOW )
+        caps.cpu_based_exec_control &=
             ~(CPU_BASED_CR8_LOAD_EXITING | CPU_BASED_CR8_STORE_EXITING);
 
     rdmsrl(MSR_IA32_VMX_MISC, _vmx_misc_cap);
@@ -323,7 +321,7 @@ static int vmx_init_vmcs_config(bool bsp
         return -EINVAL;
     }
 
-    if ( _vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_SECONDARY_CONTROLS )
+    if ( caps.cpu_based_exec_control & CPU_BASED_ACTIVATE_SECONDARY_CONTROLS )
     {
         min = 0;
         opt = (SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES |
@@ -353,7 +351,7 @@ static int vmx_init_vmcs_config(bool bsp
          * "APIC Register Virtualization" and "Virtual Interrupt Delivery"
          * can be set only when "use TPR shadow" is set
          */
-        if ( (_vmx_cpu_based_exec_control & CPU_BASED_TPR_SHADOW) &&
+        if ( (caps.cpu_based_exec_control & CPU_BASED_TPR_SHADOW) &&
              opt_apicv_enabled )
             opt |= SECONDARY_EXEC_APIC_REGISTER_VIRT |
                    SECONDARY_EXEC_VIRTUAL_INTR_DELIVERY |
@@ -364,7 +362,7 @@ static int vmx_init_vmcs_config(bool bsp
             MSR_IA32_VMX_PROCBASED_CTLS2, &mismatch);
     }
 
-    if ( _vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_TERTIARY_CONTROLS )
+    if ( caps.cpu_based_exec_control & CPU_BASED_ACTIVATE_TERTIARY_CONTROLS )
     {
         uint64_t opt = (TERTIARY_EXEC_VIRT_SPEC_CTRL |
                         TERTIARY_EXEC_EPT_PAGING_WRITE);
@@ -501,7 +499,6 @@ static int vmx_init_vmcs_config(bool bsp
     {
         /* First time through. */
         vmx_caps = caps;
-        vmx_cpu_based_exec_control = _vmx_cpu_based_exec_control;
         vmx_secondary_exec_control = _vmx_secondary_exec_control;
         vmx_tertiary_exec_control  = _vmx_tertiary_exec_control;
         vmx_ept_vpid_cap           = _vmx_ept_vpid_cap;
@@ -534,7 +531,7 @@ static int vmx_init_vmcs_config(bool bsp
             vmx_caps.pin_based_exec_control, caps.pin_based_exec_control);
         mismatch |= cap_check(
             "CPU-Based Exec Control",
-            vmx_cpu_based_exec_control, _vmx_cpu_based_exec_control);
+            vmx_caps.cpu_based_exec_control, caps.cpu_based_exec_control);
         mismatch |= cap_check(
             "Secondary Exec Control",
             vmx_secondary_exec_control, _vmx_secondary_exec_control);
@@ -1114,7 +1111,7 @@ static int construct_vmcs(struct vcpu *v
     /* VMCS controls. */
     __vmwrite(PIN_BASED_VM_EXEC_CONTROL, vmx_caps.pin_based_exec_control);
 
-    v->arch.hvm.vmx.exec_control = vmx_cpu_based_exec_control;
+    v->arch.hvm.vmx.exec_control = vmx_caps.cpu_based_exec_control;
     if ( d->arch.vtsc && !cpu_has_vmx_tsc_scaling )
         v->arch.hvm.vmx.exec_control |= CPU_BASED_RDTSC_EXITING;
 
@@ -2228,7 +2225,6 @@ int __init vmx_vmcs_init(void)
          * Make sure all dependent features are off as well.
          */
         memset(&vmx_caps, 0, sizeof(vmx_caps));
-        vmx_cpu_based_exec_control = 0;
         vmx_secondary_exec_control = 0;
         vmx_tertiary_exec_control  = 0;
         vmx_vmexit_control         = 0;
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -210,7 +210,6 @@ void vmx_vmcs_reload(struct vcpu *v);
 #define CPU_BASED_MONITOR_EXITING             0x20000000U
 #define CPU_BASED_PAUSE_EXITING               0x40000000U
 #define CPU_BASED_ACTIVATE_SECONDARY_CONTROLS 0x80000000U
-extern u32 vmx_cpu_based_exec_control;
 
 #define PIN_BASED_EXT_INTR_MASK         0x00000001
 #define PIN_BASED_NMI_EXITING           0x00000008
@@ -303,6 +302,7 @@ extern u64 vmx_ept_vpid_cap;
 struct vmx_caps {
     uint64_t basic_msr;
     uint32_t pin_based_exec_control;
+    uint32_t cpu_based_exec_control;
 };
 extern struct vmx_caps vmx_caps;
 
@@ -314,19 +314,19 @@ extern struct vmx_caps vmx_caps;
      vmx_secondary_exec_control & SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES)
 #define cpu_has_vmx_tpr_shadow \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
-     vmx_cpu_based_exec_control & CPU_BASED_TPR_SHADOW)
+     (vmx_caps.cpu_based_exec_control & CPU_BASED_TPR_SHADOW))
 #define cpu_has_vmx_vnmi \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
      (vmx_caps.pin_based_exec_control & PIN_BASED_VIRTUAL_NMIS))
 #define cpu_has_vmx_msr_bitmap \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
-     vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_MSR_BITMAP)
+     (vmx_caps.cpu_based_exec_control & CPU_BASED_ACTIVATE_MSR_BITMAP))
 #define cpu_has_vmx_secondary_exec_control \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
-     vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_SECONDARY_CONTROLS)
+     (vmx_caps.cpu_based_exec_control & CPU_BASED_ACTIVATE_SECONDARY_CONTROLS))
 #define cpu_has_vmx_tertiary_exec_control \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
-     vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_TERTIARY_CONTROLS)
+     (vmx_caps.cpu_based_exec_control & CPU_BASED_ACTIVATE_TERTIARY_CONTROLS))
 #define cpu_has_vmx_ept \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
      vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_EPT)
@@ -341,7 +341,7 @@ extern struct vmx_caps vmx_caps;
      vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VPID)
 #define cpu_has_monitor_trap_flag \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
-     vmx_cpu_based_exec_control & CPU_BASED_MONITOR_TRAP_FLAG)
+     (vmx_caps.cpu_based_exec_control & CPU_BASED_MONITOR_TRAP_FLAG))
 #define cpu_has_vmx_pat \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
      vmx_vmentry_control & VM_ENTRY_LOAD_GUEST_PAT)


