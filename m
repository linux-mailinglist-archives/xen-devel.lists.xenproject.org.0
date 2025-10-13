Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97886BD322D
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 15:07:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142339.1476527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8IG8-0003P6-7x; Mon, 13 Oct 2025 13:06:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142339.1476527; Mon, 13 Oct 2025 13:06:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8IG8-0003ND-4f; Mon, 13 Oct 2025 13:06:40 +0000
Received: by outflank-mailman (input) for mailman id 1142339;
 Mon, 13 Oct 2025 13:06:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9ybd=4W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v8IG6-0003N6-3W
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 13:06:38 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 726b8560-a835-11f0-9d15-b5c5bf9af7f9;
 Mon, 13 Oct 2025 15:06:36 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3f0134ccc0cso3187326f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 13 Oct 2025 06:06:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5e8b31sm18346804f8f.54.2025.10.13.06.06.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 06:06:34 -0700 (PDT)
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
X-Inumbo-ID: 726b8560-a835-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760360795; x=1760965595; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PTDT/IVcDjOHO7b5s7iseOWwfbD5DgrsVmlRzu81Gzc=;
        b=FhFhliO0DelhvmnTJlH02+s+nqT/PRG4gDZ8MWK8tc8h7ijAXNAW7saP+6XOBql/9y
         4C+BEQ9STC2rpsRW607ZpjLnpn+cgQTfJvWyp1TS1x1iWKVNbTom/1lPnzBHNw4Z6Jth
         k3Y2LJz7bS+fmIbOXlsja1AxJAFLC2ogciTC+9Qbpy0jQHUlHtU7OHJdG/aSyCSUqu5j
         lzlHRUg37l6ukqvOVdlh937ezZCrbMxaA3f1ZfkSZzlIqFZEsL7/ptjObCmSaU48WSsT
         qVAI0AtlSAdl4oYpRjjo3sYHWPRz/VMCcS3ZbWHHYmbIutqOGb/amhlfTyd/C20/ICDJ
         M63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760360795; x=1760965595;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PTDT/IVcDjOHO7b5s7iseOWwfbD5DgrsVmlRzu81Gzc=;
        b=V4jRjU0YAcza8/P4GDBV0MO2E3RLLJbf70c08Xol0PHUdun8rnFneFACOZyrj6txL9
         swmj9YAOXqIZMXxYSQrWhjxW55IxuEIWDCao9hcVEJnJOGO/FZkOHa1Kw1YDoLEYZxtR
         +NWTqi/7L6ohp1nJXzhhpM6JTyxEQQVHBauF3wFQCEbrLnPvY+O2cTvfWTPWAYNsGZi7
         g55bb/TzKh46/0wisSMoVtndbdKu1TFlpkGhifThiEycbo7OtgxEPz7IlcB8eNH9t7Q4
         8sdE2NDo9yrgayQSR4708jU9UqhOloYa4aO43WMCqvSZAy0fL89BYxGAJzol8fm0GdTb
         XhLQ==
X-Gm-Message-State: AOJu0YwFNU/qNYsvvjPhHIW5Jq0Ir9jTYWJy/+MYq46eXb+68tiFKyuz
	OmEHvSN7zLTug1qv9Rr4Bb90ElknIbIwD3twQrqi9KDSELsrtzRGWptjERea48uEhHdTwVzKSKJ
	rQWc=
X-Gm-Gg: ASbGncsIC3jIDAdcPkIi3lAO3lfMTo2MU38Wb7ykibXmgSkeOubE57r35GvKIrMYc28
	O5p9iXfvmZYSsG8Rrv1T8FTeQqKYfKE9uEfr28HiHQ6fs2yg4+mL2XzF5VUfJO93VUeqJ8fHipF
	CWKDspVX9i5JlKJMUMyXJIE+rr56Nw0Dq4kB/ShUvQhta9HgvqweCfVFf4dy3YC3H7vL7WYtGJm
	rW+ESOaNFT1icIArV0NCithmP41lw16kPrc1sTy9G6NRUcjDiSA8xGzsY/3k+iy1VUngrldr03o
	Spo3/jeAv9Okf5tO9aNv5q2DKvdczPDT4v9oKle0IPER8RZ/tD7Sj80TlT3YI8yaNJBDWh2yuAh
	FjcBguI/Z6a9qKhB33mBBRX4BXUm0hgSPw7lWc/GUlK544Zg/xCz1vRy2WwsxxPJXuh2GUmf/LZ
	x0aomdHvgVhBAcDs76QETuyBW7RgERN0v0MhO+
X-Google-Smtp-Source: AGHT+IF5HQXsfdWfMsQHoGd0ZBK0BjVjR6KLSXTHcLNIhkNIxlpzMPrVGI6Cqx4/UNnlT1UpJ4seDA==
X-Received: by 2002:a05:6000:2f83:b0:3ee:1461:1659 with SMTP id ffacd0b85a97d-4266e7e01cfmr12613997f8f.31.1760360795011;
        Mon, 13 Oct 2025 06:06:35 -0700 (PDT)
Message-ID: <2e5698e1-a21b-489f-863e-9e77e5dfaa13@suse.com>
Date: Mon, 13 Oct 2025 15:06:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for-4.21 v2] x86/AMD: avoid REP MOVSB for Zen3/4
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <8ecbf8b7-91fe-4f9e-9542-7ec22b6a47bb@suse.com>
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
In-Reply-To: <8ecbf8b7-91fe-4f9e-9542-7ec22b6a47bb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Along with Zen2 (which doesn't expose ERMS), both families reportedly
suffer from sub-optimal aliasing detection when deciding whether REP MOVSB
can actually be carried out the accelerated way. Therefore we want to
avoid its use in the common case of memcpy(); copy_page_hot() is fine, as
its two pointers are always going to be having the same low 5 bits.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
---
Trying to amend the comment in cpufeatures.h (e.g. "..., i.e. ERMS minus
the Zen3/4 pointer aliasing issue") makes it get longish, so I kept it at
the shortened form.
---
v2: Leave page copying alone.

--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -1386,6 +1386,10 @@ static void cf_check init_amd(struct cpu
 
 	check_syscfg_dram_mod_en();
 
+	if (c == &boot_cpu_data && cpu_has(c, X86_FEATURE_ERMS)
+	    && c->family != 0x19 /* Zen3/4 */)
+		setup_force_cpu_cap(X86_FEATURE_XEN_REP_MOVSB);
+
 	amd_log_freq(c);
 }
 
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -684,6 +684,9 @@ static void cf_check init_intel(struct c
 	 */
 	if (c == &boot_cpu_data && c->vfm == INTEL_SKYLAKE_X)
 		setup_clear_cpu_cap(X86_FEATURE_CLWB);
+
+	if (c == &boot_cpu_data && cpu_has(c, X86_FEATURE_ERMS))
+		setup_force_cpu_cap(X86_FEATURE_XEN_REP_MOVSB);
 }
 
 const struct cpu_dev __initconst_cf_clobber intel_cpu_dev = {
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -7,7 +7,7 @@
 #define FSCAPINTS FEATURESET_NR_ENTRIES
 
 /* Synthetic words follow the featureset words. */
-#define X86_NR_SYNTH 1
+#define X86_NR_SYNTH 2
 #define X86_SYNTH(x) (FSCAPINTS * 32 + (x))
 
 /* Synthetic features */
@@ -43,6 +43,7 @@ XEN_CPUFEATURE(IBPB_ENTRY_PV,     X86_SY
 XEN_CPUFEATURE(IBPB_ENTRY_HVM,    X86_SYNTH(29)) /* MSR_PRED_CMD used by Xen for HVM */
 XEN_CPUFEATURE(USE_VMCALL,        X86_SYNTH(30)) /* Use VMCALL instead of VMMCALL */
 XEN_CPUFEATURE(PDX_COMPRESSION,   X86_SYNTH(31)) /* PDX compression */
+XEN_CPUFEATURE(XEN_REP_MOVSB,     X86_SYNTH(32)) /* REP MOVSB used for memcpy() */
 
 /* Bug words follow the synthetic words. */
 #define X86_NR_BUG 1
--- a/xen/arch/x86/memcpy.S
+++ b/xen/arch/x86/memcpy.S
@@ -10,7 +10,7 @@ FUNC(memcpy)
          * precautions were taken).
          */
         ALTERNATIVE "and $7, %edx; shr $3, %rcx", \
-                    STR(rep movsb; RET), X86_FEATURE_ERMS
+                    STR(rep movsb; RET), X86_FEATURE_XEN_REP_MOVSB
         rep movsq
         or      %edx, %ecx
         jz      1f

