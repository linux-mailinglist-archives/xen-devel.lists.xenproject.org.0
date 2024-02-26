Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A87CB867C76
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 17:49:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685675.1066783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reeAW-00055b-6Y; Mon, 26 Feb 2024 16:49:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685675.1066783; Mon, 26 Feb 2024 16:49:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reeAW-00052P-3S; Mon, 26 Feb 2024 16:49:32 +0000
Received: by outflank-mailman (input) for mailman id 685675;
 Mon, 26 Feb 2024 16:49:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ree6R-0000BK-U3
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 16:45:19 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6cfdc0e4-d4c6-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 17:45:19 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-512bd533be0so3923413e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 08:45:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d18-20020a056402401200b005640022af58sm2509237eda.83.2024.02.26.08.45.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 08:45:18 -0800 (PST)
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
X-Inumbo-ID: 6cfdc0e4-d4c6-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708965919; x=1709570719; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XYZOa3J14PwMoF80jvxD0VhtxRYvyB0LOPQq6Y/apVY=;
        b=RsKSjMVR+mNCv97sPMaKUUhTvDzU+HokmPK7Qg98ElUbHU2RLXdd372r4sEhM1SZgK
         7uJsuvlvB/ePqvfF9QhaqFs2OkyJJBWLCajnagiAALsxnqPV/Nyb9j1dzGbP95Ym6aRh
         ooAxiDaA2vNlj6PbyF+wZ2G/+bIOMlv2Yi5LoTFbjt276IHbOA4PP5oT3MZCdxg/v8C1
         5G7kX1l6d3ZCxHHaKT+sqWMNv/pRL60Wzhu8V1EBV2udVpmb+YFn9Fsp8yn0u/EssWmC
         /BlxvIhko5sKL90XBrLpPAzESYuINEzrPX/yG4yBesQSgtE9NBentBdZKu9UXdQMlYyj
         mcVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708965919; x=1709570719;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XYZOa3J14PwMoF80jvxD0VhtxRYvyB0LOPQq6Y/apVY=;
        b=KMoSvHppyeC7uUCuX80xl2WNm+DmHUio/WzQHxwnVbJsvqeiRC2mpHZbhRf7n1eR1f
         Mg0v6Xjfl9cpDGz3waigNW/gijNSiOUchsBiNu4dGRX7HkF37OPYN/0LoMJ1Dqzm9dvx
         h1z8+O6TidLmatRk2eFckcjdjEWSD6CrSl5Uu29C21AchxJiBvctdZFjekEAyIDHejqp
         Ayh6UQVO4yeXQNp66+qLc0CyZ4nrz+xLnzpP8llo3fm9vaKx3luiiVdlOWDDMZylEoAo
         bXV72qD20QGhdc3BrD5BtwMYndaxtpT/tf1CFa3GQtU857GoxjBmE7CZbWbiXL2Q5YUA
         ImFA==
X-Gm-Message-State: AOJu0YwS30+2V3yknpPOPmmrgixh0K7XkFCO7f3pG6hhTOUwdyFQg/20
	HZ+2Au9vY39W8RDRKmn2pJT2BpEGNB7tV2r92uPZiFb7scHqC0okqj904P1a5u9+f4D8KaPnJSk
	=
X-Google-Smtp-Source: AGHT+IEJZL8vn/EMuwZRGM3/4zNNuLIusBD3O5kk1RqbEsr4YKFsolMj3+CB5jypecUGTBMBxffYIw==
X-Received: by 2002:a05:6512:20c7:b0:512:f69f:fc45 with SMTP id u7-20020a05651220c700b00512f69ffc45mr2912115lfr.27.1708965918966;
        Mon, 26 Feb 2024 08:45:18 -0800 (PST)
Message-ID: <a4db4772-f6d5-42d9-8d5f-be451b5639ff@suse.com>
Date: Mon, 26 Feb 2024 17:45:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 10/12] VMX: convert vmx_vmentry_control
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <293e5aef-8843-461c-bc96-709a605b2680@suse.com>
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
In-Reply-To: <293e5aef-8843-461c-bc96-709a605b2680@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

... to a field in the capability/controls struct.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -162,7 +162,6 @@ static int cf_check parse_ept_param_runt
 
 /* Dynamic (run-time adjusted) execution control flags. */
 struct vmx_caps __ro_after_init vmx_caps;
-u32 vmx_vmentry_control __read_mostly;
 u64 vmx_ept_vpid_cap __read_mostly;
 static uint64_t __read_mostly vmx_vmfunc;
 
@@ -259,7 +258,6 @@ static int vmx_init_vmcs_config(bool bsp
     struct vmx_caps caps = {};
     u64 _vmx_ept_vpid_cap = 0;
     u64 _vmx_misc_cap = 0;
-    u32 _vmx_vmentry_control;
     u64 _vmx_vmfunc = 0;
     bool mismatch = false;
 
@@ -480,7 +478,7 @@ static int vmx_init_vmcs_config(bool bsp
     min = 0;
     opt = (VM_ENTRY_LOAD_GUEST_PAT | VM_ENTRY_LOAD_GUEST_EFER |
            VM_ENTRY_LOAD_BNDCFGS);
-    _vmx_vmentry_control = adjust_vmx_controls(
+    caps.vmentry_control = adjust_vmx_controls(
         "VMEntry Control", min, opt, MSR_IA32_VMX_ENTRY_CTLS, &mismatch);
 
     if ( mismatch )
@@ -491,7 +489,6 @@ static int vmx_init_vmcs_config(bool bsp
         /* First time through. */
         vmx_caps = caps;
         vmx_ept_vpid_cap           = _vmx_ept_vpid_cap;
-        vmx_vmentry_control        = _vmx_vmentry_control;
         vmx_caps.basic_msr = ((uint64_t)vmx_basic_msr_high << 32) |
                              vmx_basic_msr_low;
         vmx_vmfunc                 = _vmx_vmfunc;
@@ -531,7 +528,7 @@ static int vmx_init_vmcs_config(bool bsp
             vmx_caps.vmexit_control, caps.vmexit_control);
         mismatch |= cap_check(
             "VMEntry Control",
-            vmx_vmentry_control, _vmx_vmentry_control);
+            vmx_caps.vmentry_control, caps.vmentry_control);
         mismatch |= cap_check(
             "EPT and VPID Capability",
             vmx_ept_vpid_cap, _vmx_ept_vpid_cap);
@@ -1091,7 +1088,7 @@ static int construct_vmcs(struct vcpu *v
 {
     struct domain *d = v->domain;
     uint32_t vmexit_ctl = vmx_caps.vmexit_control;
-    u32 vmentry_ctl = vmx_vmentry_control;
+    u32 vmentry_ctl = vmx_caps.vmentry_control;
     int rc = 0;
 
     vmx_vmcs_enter(v);
@@ -2202,7 +2199,6 @@ int __init vmx_vmcs_init(void)
          * Make sure all dependent features are off as well.
          */
         memset(&vmx_caps, 0, sizeof(vmx_caps));
-        vmx_vmentry_control        = 0;
         vmx_ept_vpid_cap           = 0;
         vmx_vmfunc                 = 0;
     }
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -235,7 +235,6 @@ void vmx_vmcs_reload(struct vcpu *v);
 #define VM_ENTRY_LOAD_GUEST_PAT         0x00004000
 #define VM_ENTRY_LOAD_GUEST_EFER        0x00008000
 #define VM_ENTRY_LOAD_BNDCFGS           0x00010000
-extern u32 vmx_vmentry_control;
 
 #define SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES 0x00000001U
 #define SECONDARY_EXEC_ENABLE_EPT               0x00000002U
@@ -297,6 +296,7 @@ struct vmx_caps {
     uint32_t secondary_exec_control;
     uint64_t tertiary_exec_control;
     uint32_t vmexit_control;
+    uint32_t vmentry_control;
 };
 extern struct vmx_caps vmx_caps;
 
@@ -325,9 +325,9 @@ extern struct vmx_caps vmx_caps;
 #define cpu_has_monitor_trap_flag \
     (vmx_caps.cpu_based_exec_control & CPU_BASED_MONITOR_TRAP_FLAG)
 #define cpu_has_vmx_pat \
-    (vmx_vmentry_control & VM_ENTRY_LOAD_GUEST_PAT)
+    (vmx_caps.vmentry_control & VM_ENTRY_LOAD_GUEST_PAT)
 #define cpu_has_vmx_efer \
-    (vmx_vmentry_control & VM_ENTRY_LOAD_GUEST_EFER)
+    (vmx_caps.vmentry_control & VM_ENTRY_LOAD_GUEST_EFER)
 #define cpu_has_vmx_unrestricted_guest \
     (vmx_caps.secondary_exec_control & SECONDARY_EXEC_UNRESTRICTED_GUEST)
 #define vmx_unrestricted_guest(v)               \
@@ -355,7 +355,7 @@ extern struct vmx_caps vmx_caps;
     (vmx_caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_PML)
 #define cpu_has_vmx_mpx \
     ((vmx_caps.vmexit_control & VM_EXIT_CLEAR_BNDCFGS) && \
-     (vmx_vmentry_control & VM_ENTRY_LOAD_BNDCFGS))
+     (vmx_caps.vmentry_control & VM_ENTRY_LOAD_BNDCFGS))
 #define cpu_has_vmx_xsaves \
     (vmx_caps.secondary_exec_control & SECONDARY_EXEC_XSAVES)
 #define cpu_has_vmx_tsc_scaling \


