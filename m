Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E788F82F2AA
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 17:54:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667903.1039585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPmhA-0004KW-Cr; Tue, 16 Jan 2024 16:53:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667903.1039585; Tue, 16 Jan 2024 16:53:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPmhA-0004Ij-8s; Tue, 16 Jan 2024 16:53:48 +0000
Received: by outflank-mailman (input) for mailman id 667903;
 Tue, 16 Jan 2024 16:53:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MjSB=I2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rPmh8-0004Fe-3p
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 16:53:46 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf51b44b-b48f-11ee-98f1-6d05b1d4d9a1;
 Tue, 16 Jan 2024 17:53:44 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50eaabc36bcso12448205e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jan 2024 08:53:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o4-20020a92c684000000b0035fec5419a1sm3653344ilg.16.2024.01.16.08.53.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jan 2024 08:53:43 -0800 (PST)
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
X-Inumbo-ID: cf51b44b-b48f-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705424024; x=1706028824; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KNWDMti/5OC6TyJo8byrqi6FeWcTeKmy3eyd/Ct4AYo=;
        b=P3hEzCBoJDd7beCn2wKLWsCwxw7qYGN/CRKRfdbIIie/pipzqeVdIuf/vnacC91auE
         +lc3PjfRbP9NBqeC26tPr/MSrAF+EsjF1ngFbBGN2ftNUwpi+uuazdDpouywmFkENVhN
         OzvTSALQzV1aK8TJB0hp167FBp2Ketst8USds+/Xf5NKOXtAPMnNhju6a2M1gWRNZpe9
         3EDeJx9CVQ5Dzlr4TLkqKa0T0NgLwFPrhsUjNVTliIEoj2fr45Wz61wdBB+iBf1chpa/
         xMsAhOJje68UQbSZU1rcDgYt1t2QEWcDJwTuEFry1iGnWbr6OrgGABCZqn0HyjFuqRZt
         mcww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705424024; x=1706028824;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KNWDMti/5OC6TyJo8byrqi6FeWcTeKmy3eyd/Ct4AYo=;
        b=UdNKhdOkaRA4BbVUWxGJY47h26HaSqyHt9ZFosFLkp/3ZqwPMvscotYUWrU3S1uI9F
         PxargzeLTE4DnqyU9gW6V+N62aGLy8rSIaxpk92/aCzeHLEjiOOeamK69KeWTd3REsG8
         YUT5qdgBSMo0Sus98bbiF5KwbhRqmF5tusPdRlr5SYMf7vc4X9jVo2AH0J5PosfqnWjN
         0glNRS3OO92TO+SJf152sb1qemT0yZrCg5RIY8o/UG0DdIu0XapjP8Nv36bFuX0ZIvpg
         kH4QG1kiFR8/9Ma8xLmHDUeIygBs+vW94Zj4/iwQ6tWiuLfWTIRBm2RmOrETTKrAd0Jm
         p7Hw==
X-Gm-Message-State: AOJu0YylRA/Hu7GDaFfrU0tuQYEytWIicaMQw/kV0yi9tJt0WA5CuQ7Z
	uz/VQWnys/VzioQ5VagcWQ/FFarVuGVdAuLJa+aSTpF0YA==
X-Google-Smtp-Source: AGHT+IGCh5UUnCv5FlABBN5nJOZ5a7AJW9KXVKDpHfHs5MT+INZhXjbK/BdVTJpSbbdM3G0/siFxdA==
X-Received: by 2002:a2e:391d:0:b0:2cd:633a:e1d6 with SMTP id g29-20020a2e391d000000b002cd633ae1d6mr4042596lja.13.1705424024197;
        Tue, 16 Jan 2024 08:53:44 -0800 (PST)
Message-ID: <c19cf600-5971-457b-936d-77a035ab6913@suse.com>
Date: Tue, 16 Jan 2024 17:53:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: arrange for ENDBR zapping from
 <vendor>_ctxt_switch_masking()
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

While altcall is already used for them, the functions want announcing in
.init.rodata.cf_clobber, even if the resulting static variables aren't
otherwise used.

While doing this also move ctxt_switch_masking to .data.ro_after_init.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -258,6 +258,11 @@ static void cf_check amd_ctxt_switch_mas
 #undef LAZY
 }
 
+#ifdef CONFIG_XEN_IBT /* Announce the function to ENDBR clobbering logic. */
+static const typeof(ctxt_switch_masking) __initconst_cf_clobber __used csm =
+    amd_ctxt_switch_masking;
+#endif
+
 /*
  * Mask the features and extended features returned by CPUID.  Parameters are
  * set from the boot line via two methods:
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -119,7 +119,7 @@ static const struct cpu_dev __initconst_
 static const struct cpu_dev *this_cpu = &default_cpu;
 
 static DEFINE_PER_CPU(uint64_t, msr_misc_features);
-void (* __read_mostly ctxt_switch_masking)(const struct vcpu *next);
+void (* __ro_after_init ctxt_switch_masking)(const struct vcpu *next);
 
 bool __init probe_cpuid_faulting(void)
 {
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -220,6 +220,11 @@ static void cf_check intel_ctxt_switch_m
 #undef LAZY
 }
 
+#ifdef CONFIG_XEN_IBT /* Announce the function to ENDBR clobbering logic. */
+static const typeof(ctxt_switch_masking) __initconst_cf_clobber __used csm =
+    intel_ctxt_switch_masking;
+#endif
+
 /*
  * opt_cpuid_mask_ecx/edx: cpuid.1[ecx, edx] feature mask.
  * For example, E8400[Intel Core 2 Duo Processor series] ecx = 0x0008E3FD,

