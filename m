Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBE2867C44
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 17:42:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685638.1066672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ree3c-00075t-NO; Mon, 26 Feb 2024 16:42:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685638.1066672; Mon, 26 Feb 2024 16:42:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ree3c-00073W-K6; Mon, 26 Feb 2024 16:42:24 +0000
Received: by outflank-mailman (input) for mailman id 685638;
 Mon, 26 Feb 2024 16:42:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ree3b-000739-FG
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 16:42:23 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02e920d9-d4c6-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 17:42:21 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-563fe793e1cso4459006a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 08:42:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d18-20020a056402401200b005640022af58sm2509237eda.83.2024.02.26.08.42.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 08:42:20 -0800 (PST)
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
X-Inumbo-ID: 02e920d9-d4c6-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708965741; x=1709570541; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=856hL3x+HrIg0hf4NEQ6xzQ16mC6OszsgQrB/VvbrOE=;
        b=NJdb4fk5w8RBnb14LfyQtixMKG9L3lJld6Mi5Hmjuql8QTj+rzqULWmUpHAlBpULR8
         loU5IyTvYF6dtu2k+h97Ajp4wVkyvixsuDvwz543GkphoDgEEoEGUj3ifCJ+9SfWsCHZ
         r7b29Oshu9M3eql7oFeJZXL+7h1q1Yajx5dvEYP4H8xcrO6d8dj6Z91LJO514v0US0kO
         BN2P7tQD9djO07vibb9oq1L93UuFCvV/ZVA8QxYx10P2mlsDpLRgs6hnC+XffC1MlNgV
         dgqo6LOC763mXGqZQSNHQa+MLsKdnV9HDuYO2NMFlPWvRuH9gbOZ9v4IldXYmitFGtKp
         eqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708965741; x=1709570541;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=856hL3x+HrIg0hf4NEQ6xzQ16mC6OszsgQrB/VvbrOE=;
        b=fVhljMzqOXKDhNWjWnRIReKxwLtxw182Op7kz4nKV7n6qTDTaOZck0blpHz2JVpY29
         2swCLuTXLrufs8I3Xds83oGS9LARLd5eTi/PjGLtU3BCenG9B1Ffjo3aK+knSdlbNgYX
         UGkCXtq6zipk2z10yrRlTeJBce4IE2FnHwJODQEQocmSISvGRk4fXvprpbpl4Hw7kq84
         RAEV0xNFof+6qfnf+ak+2RHuqGF1uEvcWgUOJBM/PPLBMR3TxOV5JhCoyR6A0niKAKH8
         Zg6s0Tw84v12v1Y7Ahg7gYSEaNqg67ruFiK+mbl7D91RbkCgBEtb0LUCYo5A//LtgCqg
         +r8Q==
X-Gm-Message-State: AOJu0YzjdkQWLPBb1sI8DIXJgLAj83XaaitiVbq7QpQVlVzXBEuMVHJQ
	r9mUWsekZhSzhPp/HD2mQrl2KBcWpMvjjIIDagYsctmtNLkZwYjTA0WMPM8Ab6EdOiNU+rgLOYc
	=
X-Google-Smtp-Source: AGHT+IFX4tC3kWKlsoQOmrfXbRUbYfg6ORAJGlbqb7HSf3nXJ3JiVN1u1vNGBzF/EmN/XqFAYOBrQA==
X-Received: by 2002:aa7:d0d4:0:b0:565:76b6:920c with SMTP id u20-20020aa7d0d4000000b0056576b6920cmr4634899edo.9.1708965740965;
        Mon, 26 Feb 2024 08:42:20 -0800 (PST)
Message-ID: <537b0d9c-1936-4cf5-a012-d50b1097a22d@suse.com>
Date: Mon, 26 Feb 2024 17:42:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 02/12] x86/HVM: improve CET-IBT pruning of ENDBR
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

__init{const,data}_cf_clobber can have an effect only for pointers
actually populated in the respective tables. While not the case for SVM
right now, VMX installs a number of pointers only under certain
conditions. Hence the respective functions would have their ENDBR purged
only when those conditions are met. Invoke "pruning" functions after
having copied the respective tables, for them to install any "missing"
pointers.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This is largely cosmetic for present hardware, which when supporting
CET-IBT likely also supports all of the advanced VMX features for which
hook pointers are installed conditionally. The only case this would make
a difference there is when use of respective features was suppressed via
command line option (where available). For future hooks it may end up
relevant even by default, and it also would be if AMD started supporting
CET-IBT; right now it matters only for .pi_update_irte, as iommu_intpost
continues to default to off.

Originally I had meant to put the SVM and VMX functions in presmp-
initcalls, but hvm/{svm,vmx}/built_in.o are linked into hvm/built_in.o
before hvm/hvm.o. And I don't think I want to fiddle with link order
here.
---
v3: Re-base.
v2: Use cpu_has_xen_ibt in prune_{svm,vmx}().

--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -161,10 +161,15 @@ static int __init cf_check hvm_enable(vo
     else if ( cpu_has_svm )
         fns = start_svm();
 
+    if ( fns )
+        hvm_funcs = *fns;
+
+    prune_vmx();
+    prune_svm();
+
     if ( fns == NULL )
         return 0;
 
-    hvm_funcs = *fns;
     hvm_enabled = 1;
 
     printk("HVM: %s enabled\n", fns->name);
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2587,6 +2587,19 @@ const struct hvm_function_table * __init
     return &svm_function_table;
 }
 
+void __init prune_svm(void)
+{
+    /*
+     * Now that svm_function_table was copied, populate all function pointers
+     * which may have been left at NULL, for __initdata_cf_clobber to have as
+     * much of an effect as possible.
+     */
+    if ( !cpu_has_xen_ibt )
+        return;
+
+    /* Nothing at present. */
+}
+
 void asmlinkage svm_vmexit_handler(void)
 {
     struct cpu_user_regs *regs = guest_cpu_user_regs();
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3042,6 +3042,30 @@ const struct hvm_function_table * __init
     return &vmx_function_table;
 }
 
+void __init prune_vmx(void)
+{
+    /*
+     * Now that vmx_function_table was copied, populate all function pointers
+     * which may have been left at NULL, for __initdata_cf_clobber to have as
+     * much of an effect as possible.
+     */
+    if ( !cpu_has_xen_ibt )
+        return;
+
+    vmx_function_table.set_descriptor_access_exiting =
+        vmx_set_descriptor_access_exiting;
+
+    vmx_function_table.update_eoi_exit_bitmap = vmx_update_eoi_exit_bitmap;
+    vmx_function_table.process_isr            = vmx_process_isr;
+    vmx_function_table.handle_eoi             = vmx_handle_eoi;
+
+    vmx_function_table.pi_update_irte = vmx_pi_update_irte;
+
+    vmx_function_table.deliver_posted_intr = vmx_deliver_posted_intr;
+    vmx_function_table.sync_pir_to_irr     = vmx_sync_pir_to_irr;
+    vmx_function_table.test_pir            = vmx_test_pir;
+}
+
 /*
  * Not all cases receive valid value in the VM-exit instruction length field.
  * Callers must know what they're doing!
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -250,6 +250,9 @@ extern s8 hvm_port80_allowed;
 extern const struct hvm_function_table *start_svm(void);
 extern const struct hvm_function_table *start_vmx(void);
 
+void prune_svm(void);
+void prune_vmx(void);
+
 int hvm_domain_initialise(struct domain *d,
                           const struct xen_domctl_createdomain *config);
 void hvm_domain_relinquish_resources(struct domain *d);


