Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36912CF8ADE
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 15:07:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196199.1514068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd7ij-0004XR-AQ; Tue, 06 Jan 2026 14:07:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196199.1514068; Tue, 06 Jan 2026 14:07:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd7ij-0004Vo-6o; Tue, 06 Jan 2026 14:07:37 +0000
Received: by outflank-mailman (input) for mailman id 1196199;
 Tue, 06 Jan 2026 14:07:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vd7aM-0000Ic-9g
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 13:58:58 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7b5f913-eb07-11f0-9ccf-f158ae23cfc8;
 Tue, 06 Jan 2026 14:58:56 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-430f3ef2d37so812960f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jan 2026 05:58:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0e19bfsm4654784f8f.18.2026.01.06.05.58.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 05:58:55 -0800 (PST)
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
X-Inumbo-ID: d7b5f913-eb07-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767707936; x=1768312736; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/W6SkAbgch3VF6wNy3YU3AMUhJhp6OUaf6yGBOkOVJw=;
        b=dDgYK9JvFvg8xYLxeoaQtW7gQs9gCBI8E6R9OTnInEhsHqMBM2flrd5WR8nfm5LzBY
         jTcWMIixZa0W0rkZFi9TAeO7Gw+8teJ+ZqpAl9XOhWB6Wl70OGO7dd2nQtmtfOePd2UN
         62tKgE9JxZ1AT522Za4Vu85erIxA0+k1YWk8R1XHlV2QnSIiTb/WL7w8OlwXj6PcgFgc
         5r4pavkYf3xnb7FW7E7FdPMIl5S4Ho+joEXOTlDOpZGkvgv/tk35y9nGMhNcBmKA97xg
         EOr9evFX3LYroBjgWzm0e9VbpQlwjOacO4qPb11li5bA0jP93v+rCGaGd0wb4KK6hysi
         5OQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767707936; x=1768312736;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/W6SkAbgch3VF6wNy3YU3AMUhJhp6OUaf6yGBOkOVJw=;
        b=ReHjUGB5ty5q+XsPkdpQAu0wGh0D4ZJVqfb+Nc26Xv8jaUOiJkNhJwtc08le79dBZo
         440lqm3BmlQFHHPClon4ROACr9NSZRyXk5mryhQSL6Rm2cNci0WUdssC0IcUF7EpM/uZ
         Aw0JUAHpZBuhWzQRMQguzGvQHTHsQ29kr3JemgTf4Ke8QvUM02H5w0JXeJW6PybPmbi/
         Wss8WGWp7R+tPxxcImXcVUKiAo2GdWumBLgXVXXzPIhbq/xDHPR0NXdJ/zT+eqRl7nem
         HTxQQiNaF5vNRPncQpfP1zW4ERdV6BtmnETpfQ00ET4OrZT14q2czkhpVoVR3aCqnAYN
         kpVw==
X-Gm-Message-State: AOJu0YwGrIfQlQzcfeT21wNyrJ36T1e0LU77FHk5vJ1u2oNcy9smA0nq
	dz23kjZhALji2XzOOJBzbkM98QgXEcHdHMDecI8W1nUhj8wu7UYLKvqxuXCIHTNbzUo23cWnwzY
	Qe/k=
X-Gm-Gg: AY/fxX4b3gIggiodN9Un0xIF3mz6by51rpVXNDFU33Ys95Nge5WGy4NvK/C6v8ZIQgm
	B+aPfQeKBmVm9StfS/JyvPM0LLyYe/c5myAKSWUbeyQ5JxitSY6GAbWChztX9i4pNsx8RYDtAr9
	TRUHwwKiInD2oCwvhFVTzSxKFT16GT4W1IQoXwI64SqMcm3paTquibttFWioJL26JHZG5ljeK4t
	UYFKlYPPtHJsKCF69cmfanwpv2v6NGvDxsMPfwV50XAT2AsKUDKEVUFxgwv8IGbhlH18Lxz3oio
	RW0WYsStR8WtNIz5ULwy0hgISbGtRp/BXxtyuTKeAhC0EHlYCBm/fYdUu85BEjKfuX86Ak7ibO4
	VeyVwOaNCrwcn4OqRUGi6zSf/cZYrGBPHwi8+JPibl7DWSHnbna2s08Vj6DwrbHPca9cMpnPQZB
	jpIbHe4RQFzdfKAjwFgvbtPt7zNYm3oE2ZjKudHX3GIEz00DWVrzquicl3YNcEskw9/36gYIVhY
	sJ688s7axq1zQ==
X-Google-Smtp-Source: AGHT+IEGeRGZxtt1c2ZvMypgAJp7gPNtwh7MGE9GrSiyIhqdrHGTy53gt/Im7l3M7uDHN9ud0RefRA==
X-Received: by 2002:a05:6000:400b:b0:430:fcda:452d with SMTP id ffacd0b85a97d-432bca312admr3431267f8f.22.1767707935839;
        Tue, 06 Jan 2026 05:58:55 -0800 (PST)
Message-ID: <366597a9-c506-4183-bdee-8ef3d1045669@suse.com>
Date: Tue, 6 Jan 2026 14:58:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/5] x86/HVM: drop at_tsc parameter from ->set_tsc_offset()
 hook
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <66a53368-9c33-436c-858e-2b2d25ae84b7@suse.com>
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
In-Reply-To: <66a53368-9c33-436c-858e-2b2d25ae84b7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

While the VMX hook never used the parameter, the SVM one lost its sole use
some time ago (while the original use of the parameter had gone away even
earlier).

Again modernize types while there.

Amends: 0cd50753eb40 ("nestedsvm: Disable TscRateMSR")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/domain.c
+++ b/xen/arch/x86/hvm/domain.c
@@ -312,8 +312,7 @@ int arch_set_info_hvm_guest(struct vcpu
     /* Sync AP's TSC with BSP's. */
     v->arch.hvm.cache_tsc_offset =
         d->vcpu[0]->arch.hvm.cache_tsc_offset;
-    hvm_set_tsc_offset(v, v->arch.hvm.cache_tsc_offset,
-                       d->arch.hvm.sync_tsc);
+    hvm_set_tsc_offset(v, v->arch.hvm.cache_tsc_offset);
 
     paging_update_paging_modes(v);
 
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -412,7 +412,7 @@ static void hvm_set_guest_tsc_fixed(stru
     delta_tsc = guest_tsc - tsc;
     v->arch.hvm.cache_tsc_offset = delta_tsc;
 
-    hvm_set_tsc_offset(v, v->arch.hvm.cache_tsc_offset, at_tsc);
+    hvm_set_tsc_offset(v, v->arch.hvm.cache_tsc_offset);
 }
 
 #define hvm_set_guest_tsc(v, t) hvm_set_guest_tsc_fixed(v, t, 0)
@@ -430,7 +430,7 @@ static void hvm_set_guest_tsc_msr(struct
 static void hvm_set_guest_tsc_adjust(struct vcpu *v, u64 tsc_adjust)
 {
     v->arch.hvm.cache_tsc_offset += tsc_adjust - v->arch.hvm.msr_tsc_adjust;
-    hvm_set_tsc_offset(v, v->arch.hvm.cache_tsc_offset, 0);
+    hvm_set_tsc_offset(v, v->arch.hvm.cache_tsc_offset);
     v->arch.hvm.msr_tsc_adjust = tsc_adjust;
     if ( v == current )
         update_vcpu_system_time(v);
@@ -4023,8 +4023,7 @@ void hvm_vcpu_reset_state(struct vcpu *v
     /* Sync AP's TSC with BSP's. */
     v->arch.hvm.cache_tsc_offset =
         v->domain->vcpu[0]->arch.hvm.cache_tsc_offset;
-    hvm_set_tsc_offset(v, v->arch.hvm.cache_tsc_offset,
-                       d->arch.hvm.sync_tsc);
+    hvm_set_tsc_offset(v, v->arch.hvm.cache_tsc_offset);
 
     v->arch.hvm.msr_tsc_adjust = 0;
 
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -779,7 +779,7 @@ static int cf_check svm_get_guest_pat(st
     return 1;
 }
 
-static void cf_check svm_set_tsc_offset(struct vcpu *v, u64 offset, u64 at_tsc)
+static void cf_check svm_set_tsc_offset(struct vcpu *v, uint64_t offset)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     struct vmcb_struct *n1vmcb, *n2vmcb;
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1558,7 +1558,7 @@ static void cf_check vmx_handle_cd(struc
     }
 }
 
-static void cf_check vmx_set_tsc_offset(struct vcpu *v, u64 offset, u64 at_tsc)
+static void cf_check vmx_set_tsc_offset(struct vcpu *v, uint64_t offset)
 {
     vmx_vmcs_enter(v);
 
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1114,7 +1114,7 @@ static void load_shadow_guest_state(stru
             hvm_inject_hw_exception(X86_EXC_GP, 0);
     }
 
-    hvm_set_tsc_offset(v, v->arch.hvm.cache_tsc_offset, 0);
+    hvm_set_tsc_offset(v, v->arch.hvm.cache_tsc_offset);
 
     vvmcs_to_shadow_bulk(v, ARRAY_SIZE(vmentry_fields), vmentry_fields);
 
@@ -1330,7 +1330,7 @@ static void load_vvmcs_host_state(struct
             hvm_inject_hw_exception(X86_EXC_GP, 0);
     }
 
-    hvm_set_tsc_offset(v, v->arch.hvm.cache_tsc_offset, 0);
+    hvm_set_tsc_offset(v, v->arch.hvm.cache_tsc_offset);
 
     set_vvmcs(v, VM_ENTRY_INTR_INFO, 0);
 
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -165,7 +165,7 @@ struct hvm_function_table {
     int  (*get_guest_pat)(struct vcpu *v, uint64_t *gpat);
     int  (*set_guest_pat)(struct vcpu *v, uint64_t gpat);
 
-    void (*set_tsc_offset)(struct vcpu *v, u64 offset, u64 at_tsc);
+    void (*set_tsc_offset)(struct vcpu *v, uint64_t offset);
 
     void (*inject_event)(const struct x86_event *event);
 
@@ -482,10 +482,9 @@ static inline void hvm_cpuid_policy_chan
     alternative_vcall(hvm_funcs.cpuid_policy_changed, v);
 }
 
-static inline void hvm_set_tsc_offset(struct vcpu *v, uint64_t offset,
-                                      uint64_t at_tsc)
+static inline void hvm_set_tsc_offset(struct vcpu *v, uint64_t offset)
 {
-    alternative_vcall(hvm_funcs.set_tsc_offset, v, offset, at_tsc);
+    alternative_vcall(hvm_funcs.set_tsc_offset, v, offset);
 }
 
 /*
@@ -847,7 +846,7 @@ static inline void hvm_sync_pir_to_irr(s
  */
 int hvm_guest_x86_mode(struct vcpu *v);
 void hvm_cpuid_policy_changed(struct vcpu *v);
-void hvm_set_tsc_offset(struct vcpu *v, uint64_t offset, uint64_t at_tsc);
+void hvm_set_tsc_offset(struct vcpu *v, uint64_t offset);
 
 /* End of prototype list */
 
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -2985,8 +2985,7 @@ int tsc_set_info(struct domain *d,
              */
             d->arch.hvm.sync_tsc = rdtsc();
             hvm_set_tsc_offset(d->vcpu[0],
-                               d->vcpu[0]->arch.hvm.cache_tsc_offset,
-                               d->arch.hvm.sync_tsc);
+                               d->vcpu[0]->arch.hvm.cache_tsc_offset);
         }
     }
 


