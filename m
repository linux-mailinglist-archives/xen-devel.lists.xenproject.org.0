Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC60B9EC98
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 12:46:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130356.1469954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1jUu-0005df-SX; Thu, 25 Sep 2025 10:46:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130356.1469954; Thu, 25 Sep 2025 10:46:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1jUu-0005cK-Nl; Thu, 25 Sep 2025 10:46:48 +0000
Received: by outflank-mailman (input) for mailman id 1130356;
 Thu, 25 Sep 2025 10:46:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v1jUs-0005cA-W7
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 10:46:46 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed0836b4-99fc-11f0-9809-7dc792cee155;
 Thu, 25 Sep 2025 12:46:43 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b2ef8e00becso163000466b.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Sep 2025 03:46:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b35446f7472sm141276666b.57.2025.09.25.03.46.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 03:46:42 -0700 (PDT)
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
X-Inumbo-ID: ed0836b4-99fc-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758797203; x=1759402003; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Sou60HWqNHvUljooVDmBcMtkjAZ+GcrOgZ1byfQcMzE=;
        b=Fo2yBaH5xRTehsiKFMiWL99aeFGDWaVySGoy43PlrRm6ijLAmUV2Vw4gngffCousHm
         to39zIWs4syqjvuoVw63oWiWSX+KBubXdHIS8Mo9fRee7GRhiL1SQRK1Vu47spqloUT3
         LudkaA3tvxGdVfn9PRxMimZDCKwhfkMy/W5MBIk7wugOIyY5M7PE//eu7/kmy40d4Blp
         l5yNpxCwK3byJOeHCWfoMFVXJbBBIvf20BsS2/uA1pGy6w2h9a6G3+UsYayAfMyFZRJt
         pDxk1o6lbh22tQieS4h+xF6Prh4CwtxgTmcWqTuiEpWUsqd/XHAgntfQXc3bYbUlrFPT
         InNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758797203; x=1759402003;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sou60HWqNHvUljooVDmBcMtkjAZ+GcrOgZ1byfQcMzE=;
        b=wF8BaZA1hwXphcBEX1ampq+mn8AkxPfU3sdgGcWo2nDgQJOPpc8kYlpm/9C5VsNOZh
         pjmtd4UvyMOyzIumBKspO59bHjyO63yF7QdGwtk9mf1eeypEioYoCkxYibG1zKK3X3Jt
         jBaFeIHH0bVEGFHuOYUnxiQuXJleQXhIZ31Mli6Sf0ya6vuhnVVY1q55KmN+jer0qcp3
         z1QhGqEWc8TdVGtLU2+SufoXdmEz/pMuJ1RAEiE87catnqZTCS062UbNxs+LwVeYiv0z
         U7rHAbu9xcCkWJ2Xr5OoCciOxnd7lDfOzBQmeOZr5bw0oIaFemgfaJQ8jMaIxSejuNdy
         offA==
X-Gm-Message-State: AOJu0Yy/mCCIy+nJ16oe1ZoREMaGVyc8VM+p/wWIsJ0GSrJ9fijUPEkd
	H8etNdGralynynzKqViiJrXWuFarp60DN+5HNcjbtKL4Esldp16ezDnFjkNhiU5u3aqJCMxFc95
	oyq8=
X-Gm-Gg: ASbGncuSoFd96k9bcscEb43KFSudwnthTk/JclEPCGjIIuVmu72aabPEhO5UdQzVWBk
	Xci2uDGyasB2ImP4P9A0B7+C/T+ZLT58jbI8d6P2TfJ//e7Z1PgJjNJbxSPLLXEk5ND4Z4XdX4e
	MX9wfR6KiGi9fdvCZL6b7Ze43/HCb3dhNwswGwz36EyukTVj39MIFITHg7YYNmIxcVt8Y68J/kM
	1r9TsKuXfHuBM8/FsZ4O0rfozlBMekYu49PGWlSQ1yl63pu9jA3uEtedjK+hGK3BpETz+fNH2ud
	e0MWshXV9RsufGpdiFZnXuTEChEzorP9UYK/0nJo/HGyRINJ9m7LvIQfso62viXJ1tSy5hRI6Ft
	cn5r/ldmLh8TwWyD8iktjGS5HOAEcww9dhqLB3NUVC6gWBbwMPJI6tPDbhxFUEgADt46rRyPfpr
	/SFgJWRhw=
X-Google-Smtp-Source: AGHT+IHfPKu0e+qE5+gpPqP/8uHmVswfZmQrUlr9XLAs5JiI0ePew/p8xaVsUN6pP1jFGS6lqHp6Jw==
X-Received: by 2002:a17:907:6ea3:b0:b07:d904:4b9c with SMTP id a640c23a62f3a-b34ba147a47mr343958566b.12.1758797203115;
        Thu, 25 Sep 2025 03:46:43 -0700 (PDT)
Message-ID: <6bcaa5b7-4e34-40c9-85e6-48a0a5869b86@suse.com>
Date: Thu, 25 Sep 2025 12:46:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH for-4.21 1/2] x86/AMD: avoid REP MOVSB for Zen3/4
From: Jan Beulich <jbeulich@suse.com>
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
Content-Transfer-Encoding: 7bit

Along with Zen2 (which doesn't expose ERMS), both families reportedly
suffer from sub-optimal aliasing detection when deciding whether REP MOVSB
can actually be carried out the accelerated way. Therefore we want to
avoid its use in the common case (memset(), copy_page_hot()).

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Question is whether merely avoiding REP MOVSB (but not REP MOVSQ) is going
to be good enough.

--- a/xen/arch/x86/copy_page.S
+++ b/xen/arch/x86/copy_page.S
@@ -57,6 +57,6 @@ END(copy_page_cold)
         .endm
 
 FUNC(copy_page_hot)
-        ALTERNATIVE copy_page_movsq, copy_page_movsb, X86_FEATURE_ERMS
+        ALTERNATIVE copy_page_movsq, copy_page_movsb, X86_FEATURE_XEN_REP_MOVSB
         RET
 END(copy_page_hot)
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
+XEN_CPUFEATURE(XEN_REP_MOVSB,     X86_SYNTH(32)) /* REP MOVSB used for memcpy() and alike. */
 
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


