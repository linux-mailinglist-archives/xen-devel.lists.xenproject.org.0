Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5413A43DC7
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 12:37:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895656.1304320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmtFJ-0002bN-Gj; Tue, 25 Feb 2025 11:37:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895656.1304320; Tue, 25 Feb 2025 11:37:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmtFJ-0002Z0-DM; Tue, 25 Feb 2025 11:37:05 +0000
Received: by outflank-mailman (input) for mailman id 895656;
 Tue, 25 Feb 2025 11:37:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tmtFI-0002Ya-SL
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 11:37:04 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d44e4f6c-f36c-11ef-9897-31a8f345e629;
 Tue, 25 Feb 2025 12:37:02 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-38f26a82d1dso2804208f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 03:37:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd8667d5sm1976991f8f.20.2025.02.25.03.37.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 03:37:00 -0800 (PST)
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
X-Inumbo-ID: d44e4f6c-f36c-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740483421; x=1741088221; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=npvN6N6QR/GbSP8B/CqHnDaWQzL1F8XjmXoQUnwBasM=;
        b=SeNKGeRxfrF62T/Cunt4VPpYBfmq5bepIgdgw2z7+n57wTCPZFQBFMSz93TXuodI20
         BfZg0iqjUZZ2Cm6YY1TCUXd24OSgdGMGoFJrfaWajRffJFxbWi0noProYVF9tRnvrm+F
         3+xLKkw/lPeCVxUtQpoNvewXav4PZYX/ZcARxgWQyvv7xk54aC71cKecQ06qd0DWoi/k
         96tjXZTYcwdFDyZHEpKrxhqnpm5I+DgrDDOtgr/F6OV6WXFcQvckDMGZ9Y2nsVfkf4QC
         7SknIq4x5Ed3gCE3VPW5JNywGRv4+4ycj5TIAGnTVH0GClb4eFy4ZohELk8HleVFQmZm
         qccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740483421; x=1741088221;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=npvN6N6QR/GbSP8B/CqHnDaWQzL1F8XjmXoQUnwBasM=;
        b=PecpiJSvJ3QAJFJ7iI16W1MfoWK4CarV1Txe2oPgyt3aCxBq14mSM/kiXj6iwzmNjA
         Teq1XahcXlGllWJm0kO+uSAIRz/l3wRSelPAQ9+ZnGcneaP2R5xGzlneQUwIMIQClW7g
         tzYH+WAAdO+0DAtD1XQEZIiy+V51f70QHYR4gmwI7pFpRRm51PAU233s8lSB1b+2VZA3
         oDPg59wvO7sdF2CTEe+7MApWDxOKCfazG5ShVKbimHDv6g2b+X3bXpWfWo10/KlqU9LA
         pY96Z5a6mH9JzzuM8xbc/9EEGGctzppy2e85+45jgGDkubRnx/gX8+Gusj4GI3MJl0C0
         HtWA==
X-Gm-Message-State: AOJu0Yx64iS8et+PL2ral0SiKueBLSqa0XDG9CZUVzzx6PU0WS+7ry7i
	hy7yDoXpw5Ucvddc8UDK4dpOpBUqYOXs18gHaawLwMUb7zciMVVwb7knEq2SEegTdJFBzfNW4eQ
	=
X-Gm-Gg: ASbGncvKHXAiYjCYiVijaCjSMU+s6p4PIcV0Y/oocNZL8OukDkq/QTUgXFukuI43AtU
	pKh8wQGBDAmZ3cAM/TJourgVMMdOBgUqEFKIieea5/w/SGTVZ0S7faGnuAjzxDG1L9Xwbe58w3a
	elI9Eek6EHxbhf9tKYMb6XKvLq2pSzmgJ4BBiuDoAKmm3gKTiKPWWO9ui0c2N6GMo6qdnnVaakm
	6lR4Yzu2W8yV72fQwjjjB0B4Ude6/pK3GLN6qJL60PLUVv/uC5nIa+jYny04KmlwksCPFd1mGd2
	6Gd5l2XqNe2htntkPOkalHtP2v0+RR+pagiSXoIKDPl8MMGtgG8yCWq5L0R+fLHNfYV8fujF4zO
	Uw71ZmR+e46Y=
X-Google-Smtp-Source: AGHT+IHhXoPIfjnOKmUr6o033L5/tW3+80usZo9PEqe/p1FnVU89l17Z6erd8/Fx5eFO6hdy2f6KMw==
X-Received: by 2002:adf:e78a:0:b0:386:3328:6106 with SMTP id ffacd0b85a97d-390cc630c5dmr2496669f8f.35.1740483421035;
        Tue, 25 Feb 2025 03:37:01 -0800 (PST)
Message-ID: <29cc2974-a1d8-4123-83b0-b44a3151f900@suse.com>
Date: Tue, 25 Feb 2025 12:37:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 01/11] x86/HVM: improve CET-IBT pruning of ENDBR
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
v4: Rename functions. Re-base.
v3: Re-base.
v2: Use cpu_has_xen_ibt in {svm,vmx}_fill_funcs().

--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -160,10 +160,17 @@ static int __init cf_check hvm_enable(vo
     else if ( using_svm() )
         fns = start_svm();
 
+    if ( fns )
+        hvm_funcs = *fns;
+
+    if ( IS_ENABLED(CONFIG_INTEL_VMX) )
+        vmx_fill_funcs();
+    if ( IS_ENABLED(CONFIG_AMD_SVM) )
+        svm_fill_funcs();
+
     if ( fns == NULL )
         return 0;
 
-    hvm_funcs = *fns;
     hvm_enabled = 1;
 
     printk("HVM: %s enabled\n", fns->name);
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2530,6 +2530,19 @@ const struct hvm_function_table * __init
     return &svm_function_table;
 }
 
+void __init svm_fill_funcs(void)
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
@@ -3064,6 +3064,30 @@ const struct hvm_function_table * __init
     return &vmx_function_table;
 }
 
+void __init vmx_fill_funcs(void)
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
@@ -260,6 +260,9 @@ extern int8_t hvm_port80_allowed;
 extern const struct hvm_function_table *start_svm(void);
 extern const struct hvm_function_table *start_vmx(void);
 
+void svm_fill_funcs(void);
+void vmx_fill_funcs(void);
+
 int hvm_domain_initialise(struct domain *d,
                           const struct xen_domctl_createdomain *config);
 void hvm_domain_relinquish_resources(struct domain *d);


