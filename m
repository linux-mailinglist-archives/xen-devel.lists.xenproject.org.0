Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A30867C46
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 17:43:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685642.1066683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ree45-0007ix-4a; Mon, 26 Feb 2024 16:42:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685642.1066683; Mon, 26 Feb 2024 16:42:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ree45-0007gO-1S; Mon, 26 Feb 2024 16:42:53 +0000
Received: by outflank-mailman (input) for mailman id 685642;
 Mon, 26 Feb 2024 16:42:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ree44-0006ea-6t
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 16:42:52 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14fa70fa-d4c6-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 17:42:51 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5129cdae3c6so4246468e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 08:42:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d18-20020a056402401200b005640022af58sm2509237eda.83.2024.02.26.08.42.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 08:42:50 -0800 (PST)
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
X-Inumbo-ID: 14fa70fa-d4c6-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708965771; x=1709570571; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lGEwsapTSmnGaMr1Jgff2JJNs1NGP6rlb8MtqM0Zg5M=;
        b=VVWNh8lM51dFkQXcYCAuVqphIixln+YbzyPvK2JsC+Qn7+qE1thSQiS7zY5d/shsgM
         VyoCKhBEmLLbQfUpHqSXg5F1t3lW4Pcy4bg4xDwb3e0oBnCzJGr4E19jYUq3ZbzDSLB+
         uXnt2NjeJ010cdADbUCC0iIZ0DDHpMkwx0Ls1mSiieI7i9K8DTMsTmNqlN9upnmUrV+h
         oCqh964V9sXYYoRbeRb0n1fKpLdE/nWLAFLShDQ/lheb/8jwUniTTmNRWXScihDLIcjl
         M8yOWcMTkZ+kp+qaxGEZVEtkvYtpZ7ud5MHWefWMbhHnT0PCbxghihlnOUCnMZy5gbfj
         OZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708965771; x=1709570571;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lGEwsapTSmnGaMr1Jgff2JJNs1NGP6rlb8MtqM0Zg5M=;
        b=SpBlZEqwvzRdvELvNEROf5CbBfPM8sRaduZ/UQpxDEVjkk73fUeLgBxACWWrrpQFBK
         ELjLasiHTsyeB25tVR2WvqKZSbT37SvXMgnOKp34+2tEkzOka/X24jtdeaVnv+ay43mr
         zyVtrID7TQwzti0llU6gV/+jnql6AHhfClhJ95UVsLraSsMI5yj0mV6/Wy0gNVg0EqEj
         G0oUK8AH5LYR8s3RSFOSFZmBk2JCRhTDKnP5QOAYwYMM8kPSQHISVab6BXt9bwDEQkup
         dXxyMFLq2r4a6as9ruEhRfOD7ZNzaTU+6yQNIYc/FruG6VWHU2E2jPV1IaeGrDcfeWP0
         5S0g==
X-Gm-Message-State: AOJu0YyLh3Sq3WOp7B7+/U2F+V87iXVfc9yATB8rqLw3GyExTsv57L+U
	F3FM4Kuztmeaim/Eljxn+IXbWBnKt+7lwN15Ve5lyF1PXy0KaA9jJHaLApF5NoDp7nJnt9q7wmI
	=
X-Google-Smtp-Source: AGHT+IFzOe9RPrj/tlAUmp2ftETyB287NeXrdceNxcU4UMcEgBERU+cMFdJrD1BufPsTF8baSgqG0A==
X-Received: by 2002:ac2:4e6e:0:b0:512:a939:3fcc with SMTP id y14-20020ac24e6e000000b00512a9393fccmr4269698lfs.32.1708965771184;
        Mon, 26 Feb 2024 08:42:51 -0800 (PST)
Message-ID: <7a4ec627-f801-409b-995e-42732970e47c@suse.com>
Date: Mon, 26 Feb 2024 17:42:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 03/12] VMX: drop vmcs_revision_id
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

It's effectively redundant with vmx_basic_msr. For the #define
replacement to work, struct vmcs_struct's respective field name also
needs to change: Drop the not really meaningful "vmcs_" prefix from it.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
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
@@ -498,7 +498,6 @@ static int vmx_init_vmcs_config(bool bsp
     if ( !vmx_pin_based_exec_control )
     {
         /* First time through. */
-        vmcs_revision_id           = vmx_basic_msr_low & VMX_BASIC_REVISION_MASK;
         vmx_pin_based_exec_control = _vmx_pin_based_exec_control;
         vmx_cpu_based_exec_control = _vmx_cpu_based_exec_control;
         vmx_secondary_exec_control = _vmx_secondary_exec_control;
@@ -610,7 +609,7 @@ static paddr_t vmx_alloc_vmcs(void)
 
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
@@ -2214,7 +2214,7 @@ int nvmx_msr_read_intercept(unsigned int
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
 


