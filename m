Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NSdaFvltT2pWggIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 11:46:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7012072F1B4
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 11:46:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=HnLhIgWY;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1357779.1612124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whlKk-0005wk-My; Thu, 09 Jul 2026 09:46:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357779.1612124; Thu, 09 Jul 2026 09:46:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whlKk-0005vE-Je; Thu, 09 Jul 2026 09:46:18 +0000
Received: by outflank-mailman (input) for mailman id 1357779;
 Thu, 09 Jul 2026 09:46:17 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1whlKj-0005v7-AC
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 09:46:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whlKi-00336H-Mz
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 11:46:16 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4f6dd6-2eae-0a2a0a5409dd-0a2a4505d85e-38
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 11:46:16 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4f6de8-3cb2-0a2a45050019-d155dd2ab01e-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 11:46:16 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-472326ca506so1164172f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 02:46:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa039ad21sm48835523f8f.20.2026.07.09.02.46.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2026 02:46:14 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783590376; x=1784195176; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+4xQOmeu+MyTNV0g4WtVtGPDZB+biO3eVfaMQF1BsQw=;
        b=HnLhIgWY36UwmcShTEyt89K81VzV6JDIN4nuCxF/wnrdlI6MFyTtptlkVkItfYI6jY
         26z/tXv1G6A+NXjBwYpjC7rPhRVdUYy5cbej1OLCxkPXF4/VhlaQLiJEmicP/GuuRHwX
         fX1HDiC4BeuFY9EULmT8sngCFYhiWNHOc7Vti9YKJ7fEf7Bv8Ywmi+qjGEADzN77I4+L
         6q80XFZmRbAhb9WRx0aJUvj5rlJ/x6YLt34Hv4ieB+tcT0+0R1YpeaVEikMCpQyeyq/g
         G1+C1LKNtG/G7mNuLP00uoiJhdFc/Ggegd4kknj0PquLb75XpnBqDVn45hsvXKTmlgEo
         RAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783590376; x=1784195176;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+4xQOmeu+MyTNV0g4WtVtGPDZB+biO3eVfaMQF1BsQw=;
        b=qLZ/k7NXkhQhjoG7VSoLQ+gXjTr0Z5+gWiJeWRNat9tueHRnESKczNq29J1V/TD9ur
         ZRBYkm3hkzKO2tM2mNYMlxC1uidTCsBtqf2aYt+fZx5PUn+0nN9q9wdYHjTfhdepF6jF
         e1/XpT9b8xsmd5MODvUnjJ36qCNcixq/UFmo6zpbS/vl4XOlhHUrEx24ehOcpoi94TDb
         IipiCdi2RqIASOtqb51CIAzu2sgH+dYJnPhFJ9KdiL+oUj/dN8b8QOzLFoi4BsPPgwSc
         8GW63Bpk1oMujJHlti0YAKlNRFMWvUoPzxWcRwI3S/Y8K9DpeZagumLU/c/kDUuTEjIC
         CMFw==
X-Gm-Message-State: AOJu0YxqgoBR+RRSN4FZL4mFU7gjmBey4dWW1ke1//5EZJPrJ4jegQtN
	acRhQAHntPSsXZXSe18jfkNcWSCDh8YR8Xhbxgbr5AGD5ymGCNU+atiVKQ2LHkdCUJA6TMECsRT
	GbH1ZAA==
X-Gm-Gg: AfdE7ckc8hkIL+gTCnUM4aaqy4xB2PO+aT4zhbwyWi3FKDprAcJVo0H6Bno6FLYXgjy
	0V0H5dNx83ScAH9C/Gg/Jb2Q6MBlLMnqnTPeEI2j2TE/rljusZ4Zkyjf83O8GfQl38PzOdFoDgv
	3bhGiou/QuFf6vOwEo2kJEn/G4OPnvIR9FKWIsWUWyjG9QO7D7nQofWCzKH6hn017p1E0lxRh4x
	YZIrePkplOuSJyHg5hDjkZlVlFdh/wDU7iFjkZCWQ34FzS7jLlvpbJiMwRVCloypGftBcNsbAj7
	3cxDemq+/NQ9GKEH+u7HJp+58eq1dh4CLdvtW8am72io0W1Lg0v9SBMnWXUjaIOxUFKwpyc4Uz+
	bAt7fl6jXk60bDGoIwTbm2MU6yUsJNYoHmF9dw/z68kx10jQ907nR3e5+EUAROP9St+OZPrl98X
	EhpznAhJr71qGPkLvk6UmHTYwZr3FNRhbM6jMGDpCRZRlbc61GqqMe1rGifggdvocWIlvZnB0R2
	sQ3
X-Received: by 2002:a5d:59c5:0:b0:472:d3ab:34db with SMTP id ffacd0b85a97d-47df072b1c2mr7281350f8f.15.1783590375287;
        Thu, 09 Jul 2026 02:46:15 -0700 (PDT)
Message-ID: <fe377539-f32b-4202-8ef6-fd5b959a7f66@suse.com>
Date: Thu, 9 Jul 2026 11:46:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: drop host_and_vcpu_must_have()
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
X-purgate-ID: tlsNG-c201ff/1783590376-0FD1E118-89171A67/0/0
X-purgate-type: clean
X-purgate-size: 85925
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,evex.lr:url];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7012072F1B4

With CPU policy dependency logic now properly in place and working, and
with us never enabling ISA bits in guest policies which the underlying
hardware doesn't support, the dual checks aren't needed anymore. In fact
in Misra terms they are dead code.

In turn, a number of cpu_has_* can then also go away, when their only user
was the emulator code.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
In my build (with all the other pending work in place) this is a savings
of about 2k of generated code.

A related question is in how far vcpu_has_*() are useful to retain. We
could as well access the policy directly, which would even be more
efficient when a "cp" local variable (or function parameter) is in scope.
Then x86_emulate()'s instance could also have its __maybe_unused dropped.

With the cpu_has_* being dropped I came to wonder why we have e.g.
cpu_has_lkgs. This particular one was added together with cpu_has_fred,
yet imo we better wouldn't add such #define-s when they're not going to be
used.

--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -126,28 +126,18 @@ static inline bool boot_cpu_has(unsigned
 #define cpu_has_pge             1
 #define cpu_has_pse36           boot_cpu_has(X86_FEATURE_PSE36)
 #define cpu_has_clflush         boot_cpu_has(X86_FEATURE_CLFLUSH)
-#define cpu_has_mmx             1
 #define cpu_has_htt             boot_cpu_has(X86_FEATURE_HTT)
 
 /* CPUID level 0x00000001.ecx */
-#define cpu_has_sse3            boot_cpu_has(X86_FEATURE_SSE3)
-#define cpu_has_pclmulqdq       boot_cpu_has(X86_FEATURE_PCLMULQDQ)
 #define cpu_has_monitor         boot_cpu_has(X86_FEATURE_MONITOR)
 #define cpu_has_vmx             boot_cpu_has(X86_FEATURE_VMX)
 #define cpu_has_eist            boot_cpu_has(X86_FEATURE_EIST)
-#define cpu_has_ssse3           boot_cpu_has(X86_FEATURE_SSSE3)
-#define cpu_has_fma             boot_cpu_has(X86_FEATURE_FMA)
 #define cpu_has_cx16            boot_cpu_has(X86_FEATURE_CX16)
 #define cpu_has_pdcm            boot_cpu_has(X86_FEATURE_PDCM)
 #define cpu_has_pcid            boot_cpu_has(X86_FEATURE_PCID)
-#define cpu_has_sse4_1          boot_cpu_has(X86_FEATURE_SSE4_1)
-#define cpu_has_sse4_2          boot_cpu_has(X86_FEATURE_SSE4_2)
 #define cpu_has_x2apic          boot_cpu_has(X86_FEATURE_X2APIC)
-#define cpu_has_popcnt          boot_cpu_has(X86_FEATURE_POPCNT)
-#define cpu_has_aesni           boot_cpu_has(X86_FEATURE_AESNI)
 #define cpu_has_xsave           boot_cpu_has(X86_FEATURE_XSAVE)
 #define cpu_has_avx             boot_cpu_has(X86_FEATURE_AVX)
-#define cpu_has_f16c            boot_cpu_has(X86_FEATURE_F16C)
 #define cpu_has_rdrand          boot_cpu_has(X86_FEATURE_RDRAND)
 #define cpu_has_hypervisor      boot_cpu_has(X86_FEATURE_HYPERVISOR)
 
@@ -156,17 +146,11 @@ static inline bool boot_cpu_has(unsigned
                                  boot_cpu_has(X86_FEATURE_NX))
 #define cpu_has_page1gb         boot_cpu_has(X86_FEATURE_PAGE1GB)
 #define cpu_has_rdtscp          boot_cpu_has(X86_FEATURE_RDTSCP)
-#define cpu_has_3dnow_ext       boot_cpu_has(X86_FEATURE_3DNOWEXT)
-#define cpu_has_3dnow           boot_cpu_has(X86_FEATURE_3DNOW)
 
 /* CPUID level 0x80000001.ecx */
 #define cpu_has_cmp_legacy      boot_cpu_has(X86_FEATURE_CMP_LEGACY)
 #define cpu_has_svm             boot_cpu_has(X86_FEATURE_SVM)
-#define cpu_has_sse4a           boot_cpu_has(X86_FEATURE_SSE4A)
-#define cpu_has_xop             boot_cpu_has(X86_FEATURE_XOP)
 #define cpu_has_skinit          boot_cpu_has(X86_FEATURE_SKINIT)
-#define cpu_has_fma4            boot_cpu_has(X86_FEATURE_FMA4)
-#define cpu_has_tbm             boot_cpu_has(X86_FEATURE_TBM)
 
 /* CPUID level 0x00000006.eax */
 #define cpu_has_turbo_boost     host_cpu_policy.basic.turbo_boost
@@ -190,43 +174,23 @@ static inline bool boot_cpu_has(unsigned
 #define cpu_has_xsaves          boot_cpu_has(X86_FEATURE_XSAVES)
 
 /* CPUID level 0x00000007:0.ebx */
-#define cpu_has_bmi1            boot_cpu_has(X86_FEATURE_BMI1)
 #define cpu_has_hle             boot_cpu_has(X86_FEATURE_HLE)
-#define cpu_has_avx2            boot_cpu_has(X86_FEATURE_AVX2)
 #define cpu_has_smep            boot_cpu_has(X86_FEATURE_SMEP)
-#define cpu_has_bmi2            boot_cpu_has(X86_FEATURE_BMI2)
 #define cpu_has_invpcid         boot_cpu_has(X86_FEATURE_INVPCID)
 #define cpu_has_rtm             boot_cpu_has(X86_FEATURE_RTM)
 #define cpu_has_pqe             boot_cpu_has(X86_FEATURE_PQE)
 #define cpu_has_fpu_sel         (!boot_cpu_has(X86_FEATURE_NO_FPU_SEL))
 #define cpu_has_mpx             boot_cpu_has(X86_FEATURE_MPX)
 #define cpu_has_avx512f         boot_cpu_has(X86_FEATURE_AVX512F)
-#define cpu_has_avx512dq        boot_cpu_has(X86_FEATURE_AVX512DQ)
-#define cpu_has_rdseed          boot_cpu_has(X86_FEATURE_RDSEED)
 #define cpu_has_smap            boot_cpu_has(X86_FEATURE_SMAP)
-#define cpu_has_avx512_ifma     boot_cpu_has(X86_FEATURE_AVX512_IFMA)
 #define cpu_has_clflushopt      boot_cpu_has(X86_FEATURE_CLFLUSHOPT)
 #define cpu_has_clwb            boot_cpu_has(X86_FEATURE_CLWB)
-#define cpu_has_avx512cd        boot_cpu_has(X86_FEATURE_AVX512CD)
 #define cpu_has_proc_trace      boot_cpu_has(X86_FEATURE_PROC_TRACE)
-#define cpu_has_sha             boot_cpu_has(X86_FEATURE_SHA)
 #define cpu_has_avx512bw        boot_cpu_has(X86_FEATURE_AVX512BW)
-#define cpu_has_avx512vl        boot_cpu_has(X86_FEATURE_AVX512VL)
 
 /* CPUID level 0x00000007:0.ecx */
-#define cpu_has_avx512_vbmi     boot_cpu_has(X86_FEATURE_AVX512_VBMI)
 #define cpu_has_pku             boot_cpu_has(X86_FEATURE_PKU)
-#define cpu_has_avx512_vbmi2    boot_cpu_has(X86_FEATURE_AVX512_VBMI2)
-#define cpu_has_gfni            boot_cpu_has(X86_FEATURE_GFNI)
-#define cpu_has_vaes            boot_cpu_has(X86_FEATURE_VAES)
-#define cpu_has_vpclmulqdq      boot_cpu_has(X86_FEATURE_VPCLMULQDQ)
-#define cpu_has_avx512_vnni     boot_cpu_has(X86_FEATURE_AVX512_VNNI)
-#define cpu_has_avx512_bitalg   boot_cpu_has(X86_FEATURE_AVX512_BITALG)
-#define cpu_has_avx512_vpopcntdq boot_cpu_has(X86_FEATURE_AVX512_VPOPCNTDQ)
 #define cpu_has_rdpid           boot_cpu_has(X86_FEATURE_RDPID)
-#define cpu_has_movdiri         boot_cpu_has(X86_FEATURE_MOVDIRI)
-#define cpu_has_movdir64b       boot_cpu_has(X86_FEATURE_MOVDIR64B)
-#define cpu_has_enqcmd          boot_cpu_has(X86_FEATURE_ENQCMD)
 #define cpu_has_pks             boot_cpu_has(X86_FEATURE_PKS)
 
 /* CPUID level 0x80000007.edx */
@@ -241,38 +205,23 @@ static inline bool boot_cpu_has(unsigned
 #define cpu_has_auto_ibrs       boot_cpu_has(X86_FEATURE_AUTO_IBRS)
 
 /* CPUID level 0x00000007:0.edx */
-#define cpu_has_avx512_vp2intersect boot_cpu_has(X86_FEATURE_AVX512_VP2INTERSECT)
 #define cpu_has_srbds_ctrl      boot_cpu_has(X86_FEATURE_SRBDS_CTRL)
 #define cpu_has_md_clear        boot_cpu_has(X86_FEATURE_MD_CLEAR)
 #define cpu_has_rtm_always_abort boot_cpu_has(X86_FEATURE_RTM_ALWAYS_ABORT)
 #define cpu_has_tsx_force_abort boot_cpu_has(X86_FEATURE_TSX_FORCE_ABORT)
-#define cpu_has_serialize       boot_cpu_has(X86_FEATURE_SERIALIZE)
 #define cpu_has_hybrid          boot_cpu_has(X86_FEATURE_HYBRID)
-#define cpu_has_avx512_fp16     boot_cpu_has(X86_FEATURE_AVX512_FP16)
 #define cpu_has_arch_caps       boot_cpu_has(X86_FEATURE_ARCH_CAPS)
 
 /* CPUID level 0x00000007:1.eax */
-#define cpu_has_sha512          boot_cpu_has(X86_FEATURE_SHA512)
-#define cpu_has_sm3             boot_cpu_has(X86_FEATURE_SM3)
-#define cpu_has_sm4             boot_cpu_has(X86_FEATURE_SM4)
-#define cpu_has_avx_vnni        boot_cpu_has(X86_FEATURE_AVX_VNNI)
-#define cpu_has_avx512_bf16     boot_cpu_has(X86_FEATURE_AVX512_BF16)
-#define cpu_has_cmpccxadd       boot_cpu_has(X86_FEATURE_CMPCCXADD)
 #define cpu_has_fred            boot_cpu_has(X86_FEATURE_FRED)
 #define cpu_has_lkgs            boot_cpu_has(X86_FEATURE_LKGS)
 #define cpu_has_nmi_src         boot_cpu_has(X86_FEATURE_NMI_SRC)
-#define cpu_has_avx_ifma        boot_cpu_has(X86_FEATURE_AVX_IFMA)
 
 /* CPUID level 0x80000021.eax */
 #define cpu_has_lfence_dispatch boot_cpu_has(X86_FEATURE_LFENCE_DISPATCH)
 #define cpu_has_verw_clear      boot_cpu_has(X86_FEATURE_VERW_CLEAR)
 #define cpu_has_nscb            boot_cpu_has(X86_FEATURE_NSCB)
 
-/* CPUID level 0x00000007:1.edx */
-#define cpu_has_avx_vnni_int8   boot_cpu_has(X86_FEATURE_AVX_VNNI_INT8)
-#define cpu_has_avx_ne_convert  boot_cpu_has(X86_FEATURE_AVX_NE_CONVERT)
-#define cpu_has_avx_vnni_int16  boot_cpu_has(X86_FEATURE_AVX_VNNI_INT16)
-
 /* MSR_ARCH_CAPS */
 #define cpu_has_rdcl_no         boot_cpu_has(X86_FEATURE_RDCL_NO)
 #define cpu_has_eibrs           boot_cpu_has(X86_FEATURE_EIBRS)
--- a/xen/arch/x86/x86_emulate/0f01.c
+++ b/xen/arch/x86/x86_emulate/0f01.c
@@ -121,7 +121,7 @@ int x86emul_0f01(struct x86_emulate_stat
         switch ( s->vex.pfx )
         {
         case vex_none: /* serialize */
-            host_and_vcpu_must_have(serialize);
+            vcpu_must_have(serialize);
             asm volatile ( ".byte 0x0f, 0x01, 0xe8" ); /* Binutils >= 2.34, Clang >= 11 */
             break;
         case vex_f2: /* xsusldtrk */
--- a/xen/arch/x86/x86_emulate/0fc7.c
+++ b/xen/arch/x86/x86_emulate/0fc7.c
@@ -33,7 +33,7 @@ int x86emul_0fc7(struct x86_emulate_stat
 
         case 6: /* rdrand */
             generate_exception_if(s->vex.pfx >= vex_f3, X86_EXC_UD);
-            host_and_vcpu_must_have(rdrand);
+            vcpu_must_have(rdrand);
             *dst = s->ea;
             switch ( s->op_bytes )
             {
@@ -75,7 +75,7 @@ int x86emul_0fc7(struct x86_emulate_stat
             }
 
             generate_exception_if(s->vex.pfx >= vex_f3, X86_EXC_UD);
-            host_and_vcpu_must_have(rdseed);
+            vcpu_must_have(rdseed);
             *dst = s->ea;
             switch ( s->op_bytes )
             {
@@ -112,7 +112,7 @@ int x86emul_0fc7(struct x86_emulate_stat
         fail_if(!ops->cmpxchg);
         if ( s->rex_prefix & REX_W )
         {
-            host_and_vcpu_must_have(cx16);
+            vcpu_must_have(cx16);
             generate_exception_if(!is_aligned(s->ea.mem.seg, s->ea.mem.off, 16,
                                               ctxt, ops),
                                   X86_EXC_GP, 0);
--- a/xen/arch/x86/x86_emulate/fpu.c
+++ b/xen/arch/x86/x86_emulate/fpu.c
@@ -96,13 +96,13 @@ int x86emul_fpu(struct x86_emulate_state
         unsigned long dummy;
 
     case 0x9b:  /* wait/fwait */
-        host_and_vcpu_must_have(fpu);
+        vcpu_must_have(fpu);
         get_fpu(X86EMUL_FPU_wait);
         emulate_fpu_insn_stub(b);
         break;
 
     case 0xd8: /* FPU 0xd8 */
-        host_and_vcpu_must_have(fpu);
+        vcpu_must_have(fpu);
         get_fpu(X86EMUL_FPU_fpu);
         switch ( s->modrm )
         {
@@ -128,7 +128,7 @@ int x86emul_fpu(struct x86_emulate_state
         break;
 
     case 0xd9: /* FPU 0xd9 */
-        host_and_vcpu_must_have(fpu);
+        vcpu_must_have(fpu);
         get_fpu(X86EMUL_FPU_fpu);
         switch ( s->modrm )
         {
@@ -229,7 +229,7 @@ int x86emul_fpu(struct x86_emulate_state
         break;
 
     case 0xda: /* FPU 0xda */
-        host_and_vcpu_must_have(fpu);
+        vcpu_must_have(fpu);
         get_fpu(X86EMUL_FPU_fpu);
         switch ( s->modrm )
         {
@@ -250,7 +250,7 @@ int x86emul_fpu(struct x86_emulate_state
         break;
 
     case 0xdb: /* FPU 0xdb */
-        host_and_vcpu_must_have(fpu);
+        vcpu_must_have(fpu);
         get_fpu(X86EMUL_FPU_fpu);
         switch ( s->modrm )
         {
@@ -279,7 +279,7 @@ int x86emul_fpu(struct x86_emulate_state
             case 0: /* fild m32i */
                 goto fpu_memsrc32;
             case 1: /* fisttp m32i */
-                host_and_vcpu_must_have(sse3);
+                vcpu_must_have(sse3);
                 /* fall through */
             case 2: /* fist m32i */
             case 3: /* fistp m32i */
@@ -308,7 +308,7 @@ int x86emul_fpu(struct x86_emulate_state
         break;
 
     case 0xdc: /* FPU 0xdc */
-        host_and_vcpu_must_have(fpu);
+        vcpu_must_have(fpu);
         get_fpu(X86EMUL_FPU_fpu);
         switch ( s->modrm )
         {
@@ -334,7 +334,7 @@ int x86emul_fpu(struct x86_emulate_state
         break;
 
     case 0xdd: /* FPU 0xdd */
-        host_and_vcpu_must_have(fpu);
+        vcpu_must_have(fpu);
         get_fpu(X86EMUL_FPU_fpu);
         switch ( s->modrm )
         {
@@ -353,7 +353,7 @@ int x86emul_fpu(struct x86_emulate_state
             case 0: /* fld m64fp */;
                 goto fpu_memsrc64;
             case 1: /* fisttp m64i */
-                host_and_vcpu_must_have(sse3);
+                vcpu_must_have(sse3);
                 /* fall through */
             case 2: /* fst m64fp */
             case 3: /* fstp m64fp */
@@ -399,7 +399,7 @@ int x86emul_fpu(struct x86_emulate_state
         break;
 
     case 0xde: /* FPU 0xde */
-        host_and_vcpu_must_have(fpu);
+        vcpu_must_have(fpu);
         get_fpu(X86EMUL_FPU_fpu);
         switch ( s->modrm )
         {
@@ -421,7 +421,7 @@ int x86emul_fpu(struct x86_emulate_state
         break;
 
     case 0xdf: /* FPU 0xdf */
-        host_and_vcpu_must_have(fpu);
+        vcpu_must_have(fpu);
         get_fpu(X86EMUL_FPU_fpu);
         switch ( s->modrm )
         {
@@ -451,7 +451,7 @@ int x86emul_fpu(struct x86_emulate_state
             case 0: /* fild m16i */
                 goto fpu_memsrc16;
             case 1: /* fisttp m16i */
-                host_and_vcpu_must_have(sse3);
+                vcpu_must_have(sse3);
                 /* fall through */
             case 2: /* fist m16i */
             case 3: /* fistp m16i */
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -619,26 +619,6 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_must_have(feat) \
     generate_exception_if(!vcpu_has_##feat(), X86_EXC_UD)
 
-#ifdef __XEN__
-/*
- * Note the difference between vcpu_must_have(<feature>) and
- * host_and_vcpu_must_have(<feature>): The latter needs to be used when
- * emulation code is using the same instruction class for carrying out
- * the actual operation.
- */
-# define host_and_vcpu_must_have(feat) ({ \
-    generate_exception_if(!cpu_has_##feat, X86_EXC_UD); \
-    vcpu_must_have(feat); \
-})
-#else
-/*
- * For the test harness both are fine to be used interchangeably, i.e.
- * features known to always be available (e.g. SSE/SSE2) to (64-bit) Xen
- * may be checked for by just vcpu_must_have().
- */
-# define host_and_vcpu_must_have(feat) vcpu_must_have(feat)
-#endif
-
 /*
  * Instruction emulation:
  * Most instructions are emulated directly via a fragment of inline assembly
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1161,7 +1161,7 @@ static unsigned long *decode_vex_gpr(
         break; \
     case 0: case 1: \
         if ( !(lig) ) \
-            host_and_vcpu_must_have(avx512vl); \
+            vcpu_must_have(avx512vl); \
         break; \
     } \
 } while ( false )
@@ -3219,15 +3219,15 @@ x86_emulate(
 #ifndef X86EMUL_NO_MMX
 
     case X86EMUL_OPC(0x0f, 0x0e): /* femms */
-        host_and_vcpu_must_have(3dnow);
+        vcpu_must_have(3dnow);
         asm volatile ( "femms" );
         break;
 
     case X86EMUL_OPC(0x0f, 0x0f): /* 3DNow! */
         if ( _3dnow_table[(imm1 >> 4) & 0xf] & (1 << (imm1 & 0xf)) )
-            host_and_vcpu_must_have(3dnow);
+            vcpu_must_have(3dnow);
         else if ( _3dnow_ext_table[(imm1 >> 4) & 0xf] & (1 << (imm1 & 0xf)) )
-            host_and_vcpu_must_have(3dnow_ext);
+            vcpu_must_have(3dnow_ext);
         else
             generate_exception(X86_EXC_UD);
 
@@ -3304,7 +3304,7 @@ x86_emulate(
 #endif
 
     CASE_SIMD_SCALAR_FP(, 0x0f, 0x2b):     /* movnts{s,d} xmm,mem */
-        host_and_vcpu_must_have(sse4a);
+        vcpu_must_have(sse4a);
         /* fall through */
     CASE_SIMD_PACKED_FP_VEX(0x0f, 0x2b):   /* movntp{s,d} xmm,m128 */
                                            /* vmovntp{s,d} {x,y}mm,mem */
@@ -3375,7 +3375,7 @@ x86_emulate(
             if ( (b & ~1) == 0x10 && ea.type == OP_MEM )
                 d |= TwoOp;
     simd_0f_avx:
-            host_and_vcpu_must_have(avx);
+            vcpu_must_have(avx);
     simd_0f_ymm:
             get_fpu(X86EMUL_FPU_ymm);
         }
@@ -3423,7 +3423,7 @@ x86_emulate(
                                (ea.type != OP_REG && evex.brs &&
                                 (evex.pfx & VEX_PREFIX_SCALAR_MASK))),
                               X86_EXC_UD);
-        host_and_vcpu_must_have(avx512f);
+        vcpu_must_have(avx512f);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(evex.pfx & VEX_PREFIX_SCALAR_MASK);
     simd_zmm:
@@ -3479,7 +3479,7 @@ x86_emulate(
         generate_exception_if((evex.lr || evex.opmsk || evex.brs ||
                                evex.w != (evex.pfx & VEX_PREFIX_DOUBLE_MASK)),
                               X86_EXC_UD);
-        host_and_vcpu_must_have(avx512f);
+        vcpu_must_have(avx512f);
         if ( (d & DstMask) != DstMem )
             d &= ~TwoOp;
         op_bytes = 8;
@@ -3497,7 +3497,7 @@ x86_emulate(
     simd_0f_sse3_avx:
         if ( vex.opcx != vex_none )
             goto simd_0f_avx;
-        host_and_vcpu_must_have(sse3);
+        vcpu_must_have(sse3);
         goto simd_0f_xmm;
 
     case X86EMUL_OPC_EVEX_F3(0x0f, 0x12):   /* vmovsldup [xyz]mm/mem,[xyz]mm{k} */
@@ -3506,7 +3506,7 @@ x86_emulate(
         generate_exception_if((evex.brs ||
                                evex.w != (evex.pfx & VEX_PREFIX_DOUBLE_MASK)),
                               X86_EXC_UD);
-        host_and_vcpu_must_have(avx512f);
+        vcpu_must_have(avx512f);
         avx512_vlen_check(false);
         d |= TwoOp;
         op_bytes = !(evex.pfx & VEX_PREFIX_DOUBLE_MASK) || evex.lr
@@ -3543,7 +3543,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x64): /* vpblendm{d,q} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x65): /* vblendmp{s,d} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     avx512f_no_sae:
-        host_and_vcpu_must_have(avx512f);
+        vcpu_must_have(avx512f);
         generate_exception_if(ea.type != OP_MEM && evex.brs, X86_EXC_UD);
         avx512_vlen_check(false);
         goto simd_zmm;
@@ -3584,7 +3584,7 @@ x86_emulate(
     case X86EMUL_OPC(0x0f, 0x2a):          /* cvtpi2ps mm/m64,xmm */
     CASE_SIMD_PACKED_FP(, 0x0f, 0x2c):     /* cvttp{s,d}2pi xmm/mem,mm */
     CASE_SIMD_PACKED_FP(, 0x0f, 0x2d):     /* cvtp{s,d}2pi xmm/mem,mm */
-            host_and_vcpu_must_have(mmx);
+            vcpu_must_have(mmx);
         }
         op_bytes = (b & 4) && (vex.pfx & VEX_PREFIX_DOUBLE_MASK) ? 16 : 8;
         goto simd_0f_fp;
@@ -3602,7 +3602,7 @@ x86_emulate(
         }
         else
         {
-            host_and_vcpu_must_have(avx);
+            vcpu_must_have(avx);
             get_fpu(X86EMUL_FPU_ymm);
         }
 
@@ -3623,13 +3623,13 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_F3(5, 0x2a):      /* vcvtsi2sh r/m,xmm,xmm */
     case X86EMUL_OPC_EVEX_F3(5, 0x7b):      /* vcvtusi2sh r/m,xmm,xmm */
-        host_and_vcpu_must_have(avx512_fp16);
+        vcpu_must_have(avx512_fp16);
         /* fall through */
     CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x2a): /* vcvtsi2s{s,d} r/m,xmm,xmm */
     CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x7b): /* vcvtusi2s{s,d} r/m,xmm,xmm */
         generate_exception_if(evex.opmsk || (ea.type != OP_REG && evex.brs),
                               X86_EXC_UD);
-        host_and_vcpu_must_have(avx512f);
+        vcpu_must_have(avx512f);
         if ( !evex.brs )
             avx512_vlen_check(true);
         get_fpu(X86EMUL_FPU_zmm);
@@ -3684,7 +3684,7 @@ x86_emulate(
         else
         {
             generate_exception_if(vex.reg != 0xf, X86_EXC_UD);
-            host_and_vcpu_must_have(avx);
+            vcpu_must_have(avx);
             get_fpu(X86EMUL_FPU_ymm);
 
             /* Work around erratum BT230. */
@@ -3742,7 +3742,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_F3(5, 0x2d):      /* vcvtsh2si xmm/mem,reg */
     case X86EMUL_OPC_EVEX_F3(5, 0x78):      /* vcvttsh2usi xmm/mem,reg */
     case X86EMUL_OPC_EVEX_F3(5, 0x79):      /* vcvtsh2usi xmm/mem,reg */
-        host_and_vcpu_must_have(avx512_fp16);
+        vcpu_must_have(avx512_fp16);
         /* fall through */
     CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x2c): /* vcvtts{s,d}2si xmm/mem,reg */
     CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x2d): /* vcvts{s,d}2si xmm/mem,reg */
@@ -3752,7 +3752,7 @@ x86_emulate(
                                evex.opmsk ||
                                (ea.type != OP_REG && evex.brs)),
                               X86_EXC_UD);
-        host_and_vcpu_must_have(avx512f);
+        vcpu_must_have(avx512f);
         if ( !evex.brs )
             avx512_vlen_check(true);
         get_fpu(X86EMUL_FPU_zmm);
@@ -3772,7 +3772,7 @@ x86_emulate(
         else
         {
             generate_exception_if(vex.reg != 0xf, X86_EXC_UD);
-            host_and_vcpu_must_have(avx);
+            vcpu_must_have(avx);
             get_fpu(X86EMUL_FPU_ymm);
         }
 
@@ -3818,7 +3818,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX(5, 0x2e): /* vucomish xmm/m16,xmm */
     case X86EMUL_OPC_EVEX(5, 0x2f): /* vcomish xmm/m16,xmm */
-        host_and_vcpu_must_have(avx512_fp16);
+        vcpu_must_have(avx512_fp16);
         generate_exception_if(evex.w, X86_EXC_UD);
         /* fall through */
     CASE_SIMD_PACKED_FP(_EVEX, 0x0f, 0x2e): /* vucomis{s,d} xmm/mem,xmm */
@@ -3827,7 +3827,7 @@ x86_emulate(
                                (ea.type != OP_REG && evex.brs) ||
                                evex.w != evex.pfx),
                               X86_EXC_UD);
-        host_and_vcpu_must_have(avx512f);
+        vcpu_must_have(avx512f);
         if ( !evex.brs )
             avx512_vlen_check(true);
         get_fpu(X86EMUL_FPU_zmm);
@@ -3971,7 +3971,7 @@ x86_emulate(
 
     case X86EMUL_OPC_VEX(0x0f, 0x4a):    /* kadd{w,q} k,k,k */
         if ( !vex.w )
-            host_and_vcpu_must_have(avx512dq);
+            vcpu_must_have(avx512dq);
         /* fall through */
     case X86EMUL_OPC_VEX(0x0f, 0x41):    /* kand{w,q} k,k,k */
     case X86EMUL_OPC_VEX_66(0x0f, 0x41): /* kand{b,d} k,k,k */
@@ -3987,11 +3987,11 @@ x86_emulate(
         generate_exception_if(!vex.l, X86_EXC_UD);
     opmask_basic:
         if ( vex.w )
-            host_and_vcpu_must_have(avx512bw);
+            vcpu_must_have(avx512bw);
         else if ( vex.pfx )
-            host_and_vcpu_must_have(avx512dq);
+            vcpu_must_have(avx512dq);
     opmask_common:
-        host_and_vcpu_must_have(avx512f);
+        vcpu_must_have(avx512f);
         generate_exception_if(!vex.r || (mode_64bit() && !(vex.reg & 8)) ||
                               ea.type != OP_REG, X86_EXC_UD);
 
@@ -4016,7 +4016,7 @@ x86_emulate(
 
     case X86EMUL_OPC_VEX(0x0f, 0x4b):    /* kunpck{w,d}{d,q} k,k,k */
         generate_exception_if(!vex.l, X86_EXC_UD);
-        host_and_vcpu_must_have(avx512bw);
+        vcpu_must_have(avx512bw);
         goto opmask_common;
 
     case X86EMUL_OPC_VEX_66(0x0f, 0x4b): /* kunpckbw k,k,k */
@@ -4051,7 +4051,7 @@ x86_emulate(
             {
                 if ( b != 0x50 )
                 {
-                    host_and_vcpu_must_have(mmx);
+                    vcpu_must_have(mmx);
                     vcpu_must_have(mmxext);
                 }
                 else
@@ -4066,9 +4066,9 @@ x86_emulate(
         {
             generate_exception_if(vex.reg != 0xf, X86_EXC_UD);
             if ( b == 0x50 || !vex.l )
-                host_and_vcpu_must_have(avx);
+                vcpu_must_have(avx);
             else
-                host_and_vcpu_must_have(avx2);
+                vcpu_must_have(avx2);
             get_fpu(X86EMUL_FPU_ymm);
         }
 
@@ -4088,7 +4088,7 @@ x86_emulate(
         generate_exception_if((evex.w != (evex.pfx & VEX_PREFIX_DOUBLE_MASK) ||
                                (ea.type != OP_MEM && evex.brs)),
                               X86_EXC_UD);
-        host_and_vcpu_must_have(avx512dq);
+        vcpu_must_have(avx512dq);
         avx512_vlen_check(false);
         goto simd_zmm;
 
@@ -4127,12 +4127,12 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_F2(0x0f, 0x7a): /* vcvtudq2ps [xyz]mm/mem,[xyz]mm{k} */
                                           /* vcvtuqq2ps [xyz]mm/mem,{x,y}mm{k} */
         if ( evex.w )
-            host_and_vcpu_must_have(avx512dq);
+            vcpu_must_have(avx512dq);
         else
         {
     case X86EMUL_OPC_EVEX(0x0f, 0x78):    /* vcvttp{s,d}2udq [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX(0x0f, 0x79):    /* vcvtp{s,d}2udq [xyz]mm/mem,[xyz]mm{k} */
-            host_and_vcpu_must_have(avx512f);
+            vcpu_must_have(avx512f);
         }
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(false);
@@ -4298,14 +4298,14 @@ x86_emulate(
     case X86EMUL_OPC_VEX_66(0x0f38, 0x45): /* vpsrlv{d,q} {x,y}mm/mem,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x47): /* vpsllv{d,q} {x,y}mm/mem,{x,y}mm,{x,y}mm */
     simd_0f_avx2:
-            host_and_vcpu_must_have(avx2);
+            vcpu_must_have(avx2);
             goto simd_0f_ymm;
         }
         if ( vex.pfx )
             goto simd_0f_sse2;
 #endif /* !X86EMUL_NO_SIMD */
     simd_0f_mmx:
-        host_and_vcpu_must_have(mmx);
+        vcpu_must_have(mmx);
         get_fpu(X86EMUL_FPU_mmx);
         goto simd_0f_common;
 
@@ -4349,7 +4349,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x0b): /* vpmulhrsw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x1c): /* vpabsb [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x1d): /* vpabsw [xyz]mm/mem,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512bw);
+        vcpu_must_have(avx512bw);
         generate_exception_if(evex.brs, X86_EXC_UD);
         elem_bytes = 1 << (b & 1);
         goto avx512f_no_sae;
@@ -4381,7 +4381,7 @@ x86_emulate(
             generate_exception_if(b != 0x27 && evex.w != (b & 1), X86_EXC_UD);
             goto avx512f_no_sae;
         }
-        host_and_vcpu_must_have(avx512bw);
+        vcpu_must_have(avx512bw);
         generate_exception_if(evex.brs, X86_EXC_UD);
         elem_bytes = 1 << (ext == ext_0f ? b & 1 : evex.w);
         avx512_vlen_check(false);
@@ -4412,7 +4412,7 @@ x86_emulate(
         if ( vex.opcx != vex_none )
         {
             generate_exception_if(vex.l || vex.reg != 0xf, X86_EXC_UD);
-            host_and_vcpu_must_have(avx);
+            vcpu_must_have(avx);
             get_fpu(X86EMUL_FPU_ymm);
         }
         else if ( vex.pfx )
@@ -4422,7 +4422,7 @@ x86_emulate(
         }
         else
         {
-            host_and_vcpu_must_have(mmx);
+            vcpu_must_have(mmx);
             get_fpu(X86EMUL_FPU_mmx);
         }
 
@@ -4454,7 +4454,7 @@ x86_emulate(
             dst.bytes = 2;
         /* fall through */
     case X86EMUL_OPC_EVEX_66(5, 0x6e): /* vmovw r/m16,xmm */
-        host_and_vcpu_must_have(avx512_fp16);
+        vcpu_must_have(avx512_fp16);
         generate_exception_if(evex.w, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f, 0x6e): /* vmov{d,q} r/m,xmm */
@@ -4462,7 +4462,7 @@ x86_emulate(
         generate_exception_if((evex.lr || evex.opmsk || evex.brs ||
                                evex.reg != 0xf || !evex.RX),
                               X86_EXC_UD);
-        host_and_vcpu_must_have(avx512f);
+        vcpu_must_have(avx512f);
         get_fpu(X86EMUL_FPU_zmm);
 
         opc = init_evex(stub);
@@ -4520,7 +4520,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_F2(0x0f, 0x6f): /* vmovdqu{8,16} [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_F2(0x0f, 0x7f): /* vmovdqu{8,16} [xyz]mm,[xyz]mm/mem{k} */
-        host_and_vcpu_must_have(avx512bw);
+        vcpu_must_have(avx512bw);
         elem_bytes = 1 << evex.w;
         goto vmovdqa;
 
@@ -4558,7 +4558,7 @@ x86_emulate(
             if ( vex.l )
             {
     simd_0f_imm8_avx2:
-                host_and_vcpu_must_have(avx2);
+                vcpu_must_have(avx2);
             }
             else
             {
@@ -4572,7 +4572,7 @@ x86_emulate(
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x40): /* vdpps $imm8,{x,y}mm/mem,{x,y}mm,{x,y}mm */
 #endif
     simd_0f_imm8_avx:
-                host_and_vcpu_must_have(avx);
+                vcpu_must_have(avx);
             }
     simd_0f_imm8_ymm:
             get_fpu(X86EMUL_FPU_ymm);
@@ -4585,7 +4585,7 @@ x86_emulate(
         }
         else
         {
-            host_and_vcpu_must_have(mmx);
+            vcpu_must_have(mmx);
             vcpu_must_have(mmxext);
             get_fpu(X86EMUL_FPU_mmx);
         }
@@ -4613,7 +4613,7 @@ x86_emulate(
             generate_exception_if(evex.w, X86_EXC_UD);
         else
         {
-            host_and_vcpu_must_have(avx512bw);
+            vcpu_must_have(avx512bw);
             generate_exception_if(evex.brs, X86_EXC_UD);
         }
         d = (d & ~SrcMask) | SrcMem | TwoOp;
@@ -4643,9 +4643,9 @@ x86_emulate(
         if ( vex.opcx != vex_none )
         {
             if ( vex.l )
-                host_and_vcpu_must_have(avx2);
+                vcpu_must_have(avx2);
             else
-                host_and_vcpu_must_have(avx);
+                vcpu_must_have(avx);
             get_fpu(X86EMUL_FPU_ymm);
         }
         else if ( vex.pfx )
@@ -4655,7 +4655,7 @@ x86_emulate(
         }
         else
         {
-            host_and_vcpu_must_have(mmx);
+            vcpu_must_have(mmx);
             get_fpu(X86EMUL_FPU_mmx);
         }
 
@@ -4765,7 +4765,7 @@ x86_emulate(
         if ( vex.opcx != vex_none )
         {
             generate_exception_if(vex.reg != 0xf, X86_EXC_UD);
-            host_and_vcpu_must_have(avx);
+            vcpu_must_have(avx);
             get_fpu(X86EMUL_FPU_ymm);
 
 #ifdef __x86_64__
@@ -4806,7 +4806,7 @@ x86_emulate(
         else
 #endif /* !X86EMUL_NO_SIMD */
         {
-            host_and_vcpu_must_have(mmx);
+            vcpu_must_have(mmx);
             get_fpu(X86EMUL_FPU_mmx);
         }
 
@@ -4832,7 +4832,7 @@ x86_emulate(
     case X86EMUL_OPC_F2(0x0f, 0x78):     /* insertq $imm8,$imm8,xmm,xmm */
         generate_exception_if(ea.type != OP_REG, X86_EXC_UD);
 
-        host_and_vcpu_must_have(sse4a);
+        vcpu_must_have(sse4a);
         get_fpu(X86EMUL_FPU_xmm);
 
         opc = init_prefixes(stub);
@@ -4846,7 +4846,7 @@ x86_emulate(
     case X86EMUL_OPC_66(0x0f, 0x79):     /* extrq xmm,xmm */
     case X86EMUL_OPC_F2(0x0f, 0x79):     /* insertq xmm,xmm */
         generate_exception_if(ea.type != OP_REG, X86_EXC_UD);
-        host_and_vcpu_must_have(sse4a);
+        vcpu_must_have(sse4a);
         op_bytes = 8;
         goto simd_0f_xmm;
 
@@ -4859,7 +4859,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_F3(0x0f, 0xe6):   /* vcvtdq2pd {x,y}mm/mem,[xyz]mm{k} */
                                             /* vcvtqq2pd [xyz]mm/mem,[xyz]mm{k} */
         if ( evex.pfx != vex_f3 )
-            host_and_vcpu_must_have(avx512f);
+            vcpu_must_have(avx512f);
         else if ( evex.w )
         {
     case X86EMUL_OPC_EVEX_66(0x0f, 0x78):   /* vcvttps2uqq {x,y}mm/mem,[xyz]mm{k} */
@@ -4870,11 +4870,11 @@ x86_emulate(
                                             /* vcvttpd2qq [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f, 0x7b):   /* vcvtps2qq {x,y}mm/mem,[xyz]mm{k} */
                                             /* vcvtpd2qq [xyz]mm/mem,[xyz]mm{k} */
-            host_and_vcpu_must_have(avx512dq);
+            vcpu_must_have(avx512dq);
         }
         else
         {
-            host_and_vcpu_must_have(avx512f);
+            vcpu_must_have(avx512f);
             /*
              * While SDM version 085 has explicit wording towards embedded
              * rounding being ignored, it's still not entirely unambiguous with
@@ -4921,7 +4921,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f, 0xd6): /* vmovq xmm,xmm/m64 */
         generate_exception_if(evex.lr || !evex.w || evex.opmsk || evex.brs,
                               X86_EXC_UD);
-        host_and_vcpu_must_have(avx512f);
+        vcpu_must_have(avx512f);
         d |= TwoOp;
         op_bytes = 8;
         goto simd_zmm;
@@ -4947,15 +4947,15 @@ x86_emulate(
     case X86EMUL_OPC_VEX(0x0f, 0x90):    /* kmov{w,q} k/mem,k */
     case X86EMUL_OPC_VEX_66(0x0f, 0x90): /* kmov{b,d} k/mem,k */
         generate_exception_if(vex.l || !vex.r, X86_EXC_UD);
-        host_and_vcpu_must_have(avx512f);
+        vcpu_must_have(avx512f);
         if ( vex.w )
         {
-            host_and_vcpu_must_have(avx512bw);
+            vcpu_must_have(avx512bw);
             op_bytes = 4 << !vex.pfx;
         }
         else if ( vex.pfx )
         {
-            host_and_vcpu_must_have(avx512dq);
+            vcpu_must_have(avx512dq);
             op_bytes = 1;
         }
         else
@@ -4981,14 +4981,14 @@ x86_emulate(
         generate_exception_if(vex.l || !vex.r || vex.reg != 0xf ||
                               ea.type != OP_REG, X86_EXC_UD);
 
-        host_and_vcpu_must_have(avx512f);
+        vcpu_must_have(avx512f);
         if ( vex.pfx == vex_f2 )
-            host_and_vcpu_must_have(avx512bw);
+            vcpu_must_have(avx512bw);
         else
         {
             generate_exception_if(vex.w, X86_EXC_UD);
             if ( vex.pfx )
-                host_and_vcpu_must_have(avx512dq);
+                vcpu_must_have(avx512dq);
         }
 
         get_fpu(X86EMUL_FPU_opmask);
@@ -5020,10 +5020,10 @@ x86_emulate(
         dst = ea;
         dst.reg = decode_gpr(&_regs, modrm_reg);
 
-        host_and_vcpu_must_have(avx512f);
+        vcpu_must_have(avx512f);
         if ( vex.pfx == vex_f2 )
         {
-            host_and_vcpu_must_have(avx512bw);
+            vcpu_must_have(avx512bw);
             dst.bytes = 4 << (mode_64bit() && vex.w);
         }
         else
@@ -5031,7 +5031,7 @@ x86_emulate(
             generate_exception_if(vex.w, X86_EXC_UD);
             dst.bytes = 4;
             if ( vex.pfx )
-                host_and_vcpu_must_have(avx512dq);
+                vcpu_must_have(avx512dq);
         }
 
         get_fpu(X86EMUL_FPU_opmask);
@@ -5055,18 +5055,18 @@ x86_emulate(
 
     case X86EMUL_OPC_VEX(0x0f, 0x99):    /* ktest{w,q} k,k */
         if ( !vex.w )
-            host_and_vcpu_must_have(avx512dq);
+            vcpu_must_have(avx512dq);
         /* fall through */
     case X86EMUL_OPC_VEX(0x0f, 0x98):    /* kortest{w,q} k,k */
     case X86EMUL_OPC_VEX_66(0x0f, 0x98): /* kortest{b,d} k,k */
     case X86EMUL_OPC_VEX_66(0x0f, 0x99): /* ktest{b,d} k,k */
         generate_exception_if(vex.l || !vex.r || vex.reg != 0xf ||
                               ea.type != OP_REG, X86_EXC_UD);
-        host_and_vcpu_must_have(avx512f);
+        vcpu_must_have(avx512f);
         if ( vex.w )
-            host_and_vcpu_must_have(avx512bw);
+            vcpu_must_have(avx512bw);
         else if ( vex.pfx )
-            host_and_vcpu_must_have(avx512dq);
+            vcpu_must_have(avx512dq);
 
         get_fpu(X86EMUL_FPU_opmask);
 
@@ -5256,7 +5256,7 @@ x86_emulate(
         break;
 
     case X86EMUL_OPC_F3(0x0f, 0xb8): /* popcnt r/m,r */
-        host_and_vcpu_must_have(popcnt);
+        vcpu_must_have(popcnt);
         asm ( "popcnt %1,%0" : "=r" (dst.val) : "rm" (src.val) );
         _regs.eflags &= ~EFLAGS_MASK;
         if ( !dst.val )
@@ -5353,7 +5353,7 @@ x86_emulate(
                                 (evex.pfx & VEX_PREFIX_SCALAR_MASK)) ||
                                !evex.r || !evex.R || evex.z),
                               X86_EXC_UD);
-        host_and_vcpu_must_have(avx512f);
+        vcpu_must_have(avx512f);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(evex.pfx & VEX_PREFIX_SCALAR_MASK);
     simd_imm8_zmm:
@@ -5397,9 +5397,9 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x22): /* vpinsr{d,q} $imm8,r/m,xmm,xmm */
         generate_exception_if(evex.lr || evex.opmsk || evex.brs, X86_EXC_UD);
         if ( b & 2 )
-            host_and_vcpu_must_have(avx512dq);
+            vcpu_must_have(avx512dq);
         else
-            host_and_vcpu_must_have(avx512bw);
+            vcpu_must_have(avx512bw);
         if ( !mode_64bit() )
             evex.w = 0;
         memcpy(mmvalp, &src.val, src.bytes);
@@ -5436,7 +5436,7 @@ x86_emulate(
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x25): /* vpternlog{d,q} $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     avx512f_imm8_no_sae:
-        host_and_vcpu_must_have(avx512f);
+        vcpu_must_have(avx512f);
         generate_exception_if(ea.type != OP_MEM && evex.brs, X86_EXC_UD);
         avx512_vlen_check(false);
         goto simd_imm8_zmm;
@@ -5506,7 +5506,7 @@ x86_emulate(
     case X86EMUL_OPC_F2(0x0f, 0xd6):     /* movdq2q xmm,mm */
         generate_exception_if(ea.type != OP_REG, X86_EXC_UD);
         op_bytes = 8;
-        host_and_vcpu_must_have(mmx);
+        vcpu_must_have(mmx);
         goto simd_0f_int;
 
 #endif /* !X86EMUL_NO_MMX && !X86EMUL_NO_SIMD */
@@ -5535,7 +5535,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f, 0xe4): /* vpmulhuw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f, 0xea): /* vpminsw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f, 0xee): /* vpmaxsw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512bw);
+        vcpu_must_have(avx512bw);
         generate_exception_if(evex.brs, X86_EXC_UD);
         elem_bytes = b & 0x10 ? 1 : 2;
         goto avx512f_no_sae;
@@ -5558,7 +5558,7 @@ x86_emulate(
         {
             generate_exception_if(vex.l || vex.reg != 0xf, X86_EXC_UD);
             d |= TwoOp;
-            host_and_vcpu_must_have(avx);
+            vcpu_must_have(avx);
             get_fpu(X86EMUL_FPU_ymm);
         }
         else if ( vex.pfx )
@@ -5568,7 +5568,7 @@ x86_emulate(
         }
         else
         {
-            host_and_vcpu_must_have(mmx);
+            vcpu_must_have(mmx);
             vcpu_must_have(mmxext);
             get_fpu(X86EMUL_FPU_mmx);
         }
@@ -5630,7 +5630,7 @@ x86_emulate(
     CASE_SIMD_PACKED_INT(0x0f38, 0x1c): /* pabsb {,x}mm/mem,{,x}mm */
     CASE_SIMD_PACKED_INT(0x0f38, 0x1d): /* pabsw {,x}mm/mem,{,x}mm */
     CASE_SIMD_PACKED_INT(0x0f38, 0x1e): /* pabsd {,x}mm/mem,{,x}mm */
-        host_and_vcpu_must_have(ssse3);
+        vcpu_must_have(ssse3);
         if ( vex.pfx )
         {
     simd_0f38_common:
@@ -5638,7 +5638,7 @@ x86_emulate(
         }
         else
         {
-            host_and_vcpu_must_have(mmx);
+            vcpu_must_have(mmx);
             get_fpu(X86EMUL_FPU_mmx);
         }
         opc = init_prefixes(stub);
@@ -5665,7 +5665,7 @@ x86_emulate(
         if ( ea.type != OP_MEM )
         {
             generate_exception_if(b & 2, X86_EXC_UD);
-            host_and_vcpu_must_have(avx2);
+            vcpu_must_have(avx2);
         }
         /* fall through */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x0c): /* vpermilps {x,y}mm/mem,{x,y}mm,{x,y}mm */
@@ -5681,13 +5681,13 @@ x86_emulate(
     case X86EMUL_OPC_VEX_66(0x0f38, 0x17): /* vptest {x,y}mm/mem,{x,y}mm */
         if ( vex.opcx == vex_none )
         {
-            host_and_vcpu_must_have(sse4_1);
+            vcpu_must_have(sse4_1);
             get_fpu(X86EMUL_FPU_xmm);
         }
         else
         {
             generate_exception_if(vex.reg != 0xf, X86_EXC_UD);
-            host_and_vcpu_must_have(avx);
+            vcpu_must_have(avx);
             get_fpu(X86EMUL_FPU_ymm);
         }
 
@@ -5754,13 +5754,13 @@ x86_emulate(
     case X86EMUL_OPC_66(0x0f38, 0x3f): /* pmaxud xmm/m128,xmm */
     case X86EMUL_OPC_66(0x0f38, 0x40): /* pmulld xmm/m128,xmm */
     case X86EMUL_OPC_66(0x0f38, 0x41): /* phminposuw xmm/m128,xmm */
-        host_and_vcpu_must_have(sse4_1);
+        vcpu_must_have(sse4_1);
         goto simd_0f38_common;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x10): /* vpsrlvw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x11): /* vpsravw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x12): /* vpsllvw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512bw);
+        vcpu_must_have(avx512bw);
         generate_exception_if(!evex.w || evex.brs, X86_EXC_UD);
         elem_bytes = 2;
         goto avx512f_no_sae;
@@ -5770,7 +5770,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x20): /* vpmovswb [xyz]mm,{x,y}mm/mem{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x30): /* vpmovzxbw {x,y}mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x30): /* vpmovwb [xyz]mm,{x,y}mm/mem{k} */
-        host_and_vcpu_must_have(avx512bw);
+        vcpu_must_have(avx512bw);
         if ( evex.pfx != vex_f3 )
         {
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x21): /* vpmovsxbd xmm/mem,[xyz]mm{k} */
@@ -5812,13 +5812,13 @@ x86_emulate(
 
     case X86EMUL_OPC_VEX_66(0x0f38, 0x13): /* vcvtph2ps xmm/mem,{x,y}mm */
         generate_exception_if(vex.w, X86_EXC_UD);
-        host_and_vcpu_must_have(f16c);
+        vcpu_must_have(f16c);
         op_bytes = 8 << vex.l;
         goto simd_0f_ymm;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x13): /* vcvtph2ps {x,y}mm/mem,[xyz]mm{k} */
         generate_exception_if(evex.w || (ea.type != OP_REG && evex.brs), X86_EXC_UD);
-        host_and_vcpu_must_have(avx512f);
+        vcpu_must_have(avx512f);
         if ( !evex.brs )
             avx512_vlen_check(false);
         op_bytes = 8 << evex.lr;
@@ -5872,7 +5872,7 @@ x86_emulate(
             op_bytes = 8;
         generate_exception_if(evex.brs, X86_EXC_UD);
         if ( !evex.w )
-            host_and_vcpu_must_have(avx512dq);
+            vcpu_must_have(avx512dq);
         goto avx512_broadcast;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x1a): /* vbroadcastf32x4 m128,{y,z}mm{k} */
@@ -5882,7 +5882,7 @@ x86_emulate(
         generate_exception_if(ea.type != OP_MEM || !evex.lr || evex.brs,
                               X86_EXC_UD);
         if ( evex.w )
-            host_and_vcpu_must_have(avx512dq);
+            vcpu_must_have(avx512dq);
         goto avx512_broadcast;
 
     case X86EMUL_OPC_VEX_66(0x0f38, 0x20): /* vpmovsxbw xmm/mem,{x,y}mm */
@@ -5907,9 +5907,9 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x28): /* vpmovm2{b,w} k,[xyz]mm */
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x38): /* vpmovm2{d,q} k,[xyz]mm */
         if ( b & 0x10 )
-            host_and_vcpu_must_have(avx512dq);
+            vcpu_must_have(avx512dq);
         else
-            host_and_vcpu_must_have(avx512bw);
+            vcpu_must_have(avx512bw);
         generate_exception_if(evex.opmsk || ea.type != OP_REG, X86_EXC_UD);
         d |= TwoOp;
         op_bytes = 16 << evex.lr;
@@ -5952,7 +5952,7 @@ x86_emulate(
         fault_suppression = false;
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x44): /* vplzcnt{d,q} [xyz]mm/mem,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512cd);
+        vcpu_must_have(avx512cd);
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_VEX_66(0x0f38, 0x2c): /* vmaskmovps mem,{x,y}mm,{x,y}mm */
@@ -5963,7 +5963,7 @@ x86_emulate(
         typeof(vex) *pvex;
 
         generate_exception_if(ea.type != OP_MEM || vex.w, X86_EXC_UD);
-        host_and_vcpu_must_have(avx);
+        vcpu_must_have(avx);
         elem_bytes = 4 << (b & 1);
     vmaskmov:
         get_fpu(X86EMUL_FPU_ymm);
@@ -6028,7 +6028,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xba): /* vfmsub231p{s,d} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xbc): /* vfnmadd231p{s,d} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xbe): /* vfnmsub231p{s,d} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512f);
+        vcpu_must_have(avx512f);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(false);
         goto simd_zmm;
@@ -6047,28 +6047,28 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xbb): /* vfmsub231s{s,d} xmm/mem,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xbd): /* vfnmadd231s{s,d} xmm/mem,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xbf): /* vfnmsub231s{s,d} xmm/mem,xmm,xmm{k} */
-        host_and_vcpu_must_have(avx512f);
+        vcpu_must_have(avx512f);
         generate_exception_if(ea.type != OP_REG && evex.brs, X86_EXC_UD);
         if ( !evex.brs )
             avx512_vlen_check(true);
         goto simd_zmm;
 
     case X86EMUL_OPC_66(0x0f38, 0x37): /* pcmpgtq xmm/m128,xmm */
-        host_and_vcpu_must_have(sse4_2);
+        vcpu_must_have(sse4_2);
         goto simd_0f38_common;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x38): /* vpminsb [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x3a): /* vpminuw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x3c): /* vpmaxsb [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x3e): /* vpmaxuw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512bw);
+        vcpu_must_have(avx512bw);
         generate_exception_if(evex.brs, X86_EXC_UD);
         elem_bytes = b & 2 ?: 1;
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x40): /* vpmull{d,q} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         if ( evex.w )
-            host_and_vcpu_must_have(avx512dq);
+            vcpu_must_have(avx512dq);
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_66(0x0f38, 0xdb):     /* aesimc xmm/m128,xmm */
@@ -6077,7 +6077,7 @@ x86_emulate(
     case X86EMUL_OPC_66(0x0f38, 0xdd):     /* aesenclast xmm/m128,xmm,xmm */
     case X86EMUL_OPC_66(0x0f38, 0xde):     /* aesdec xmm/m128,xmm,xmm */
     case X86EMUL_OPC_66(0x0f38, 0xdf):     /* aesdeclast xmm/m128,xmm,xmm */
-        host_and_vcpu_must_have(aesni);
+        vcpu_must_have(aesni);
         if ( vex.opcx == vex_none )
             goto simd_0f38_common;
         /* fall through */
@@ -6091,7 +6091,7 @@ x86_emulate(
     case X86EMUL_OPC_VEX   (0x0f38, 0x51): /* vpdpbuuds [xy]mm/mem,[xy]mm,[xy]mm */
     case X86EMUL_OPC_VEX_F3(0x0f38, 0x51): /* vpdpbsuds [xy]mm/mem,[xy]mm,[xy]mm */
     case X86EMUL_OPC_VEX_F2(0x0f38, 0x51): /* vpdpbssds [xy]mm/mem,[xy]mm,[xy]mm */
-        host_and_vcpu_must_have(avx_vnni_int8);
+        vcpu_must_have(avx_vnni_int8);
         generate_exception_if(vex.w, X86_EXC_UD);
         op_bytes = 16 << vex.l;
         goto simd_0f_ymm;
@@ -6100,7 +6100,7 @@ x86_emulate(
     case X86EMUL_OPC_VEX_66(0x0f38, 0x51): /* vpdpbusds [xy]mm/mem,[xy]mm,[xy]mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x52): /* vpdpwssd [xy]mm/mem,[xy]mm,[xy]mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x53): /* vpdpwssds [xy]mm/mem,[xy]mm,[xy]mm */
-        host_and_vcpu_must_have(avx_vnni);
+        vcpu_must_have(avx_vnni);
         generate_exception_if(vex.w, X86_EXC_UD);
         goto simd_0f_ymm;
 
@@ -6108,7 +6108,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x51): /* vpdpbusds [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x52): /* vpdpwssd [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x53): /* vpdpwssds [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512_vnni);
+        vcpu_must_have(avx512_vnni);
         generate_exception_if(evex.w, X86_EXC_UD);
         goto avx512f_no_sae;
 
@@ -6120,7 +6120,7 @@ x86_emulate(
             d |= TwoOp;
         /* fall through */
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x52): /* vdpbf16ps [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512_bf16);
+        vcpu_must_have(avx512_bf16);
         generate_exception_if(evex.w, X86_EXC_UD);
         op_bytes = 16 << evex.lr;
         goto avx512f_no_sae;
@@ -6137,7 +6137,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x4d): /* vrcp14s{s,d} xmm/mem,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x4f): /* vrsqrt14s{s,d} xmm/mem,xmm,xmm{k} */
-        host_and_vcpu_must_have(avx512f);
+        vcpu_must_have(avx512f);
         generate_exception_if(evex.brs, X86_EXC_UD);
         avx512_vlen_check(true);
         goto simd_zmm;
@@ -6146,16 +6146,16 @@ x86_emulate(
         generate_exception_if(evex.w || !evex.r || !evex.R || evex.z, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x54): /* vpopcnt{b,w} [xyz]mm/mem,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512_bitalg);
+        vcpu_must_have(avx512_bitalg);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x66): /* vpblendm{b,w} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512bw);
+        vcpu_must_have(avx512bw);
         generate_exception_if(evex.brs, X86_EXC_UD);
         elem_bytes = 1 << evex.w;
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x55): /* vpopcnt{d,q} [xyz]mm/mem,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512_vpopcntdq);
+        vcpu_must_have(avx512_vpopcntdq);
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_VEX_66(0x0f38, 0x5a): /* vbroadcasti128 m128,ymm */
@@ -6164,14 +6164,14 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x62): /* vpexpand{b,w} [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x63): /* vpcompress{b,w} [xyz]mm,[xyz]mm/mem{k} */
-        host_and_vcpu_must_have(avx512_vbmi2);
+        vcpu_must_have(avx512_vbmi2);
         elem_bytes = 1 << evex.w;
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x88): /* vexpandp{s,d} [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x89): /* vpexpand{d,q} [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x8a): /* vcompressp{s,d} [xyz]mm,[xyz]mm/mem{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x8b): /* vpcompress{d,q} [xyz]mm,[xyz]mm/mem{k} */
-        host_and_vcpu_must_have(avx512f);
+        vcpu_must_have(avx512f);
         generate_exception_if(evex.brs, X86_EXC_UD);
         avx512_vlen_check(false);
         /*
@@ -6193,7 +6193,7 @@ x86_emulate(
         goto simd_zmm;
 
     case X86EMUL_OPC_EVEX_F2(0x0f38, 0x68): /* vp2intersect{d,q} [xyz]mm/mem,[xyz]mm,k+1 */
-        host_and_vcpu_must_have(avx512_vp2intersect);
+        vcpu_must_have(avx512_vp2intersect);
         generate_exception_if(evex.opmsk || !evex.r || !evex.R, X86_EXC_UD);
         op_bytes = 16 << evex.lr;
         goto avx512f_no_sae;
@@ -6205,7 +6205,7 @@ x86_emulate(
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x71): /* vpshldv{d,q} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x73): /* vpshrdv{d,q} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512_vbmi2);
+        vcpu_must_have(avx512_vbmi2);
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_VEX   (0x0f38, 0xb0): /* vcvtneoph2ps mem,[xy]mm */
@@ -6215,7 +6215,7 @@ x86_emulate(
         generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_VEX_F3(0x0f38, 0x72): /* vcvtneps2bf16 [xy]mm/mem,xmm */
-        host_and_vcpu_must_have(avx_ne_convert);
+        vcpu_must_have(avx_ne_convert);
         generate_exception_if(vex.w, X86_EXC_UD);
         d |= TwoOp;
         op_bytes = 16 << vex.l;
@@ -6225,16 +6225,16 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x7d): /* vpermt2{b,w} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x8d): /* vperm{b,w} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         if ( !evex.w )
-            host_and_vcpu_must_have(avx512_vbmi);
+            vcpu_must_have(avx512_vbmi);
         else
-            host_and_vcpu_must_have(avx512bw);
+            vcpu_must_have(avx512bw);
         generate_exception_if(evex.brs, X86_EXC_UD);
         fault_suppression = false;
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x78): /* vpbroadcastb xmm/m8,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x79): /* vpbroadcastw xmm/m16,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512bw);
+        vcpu_must_have(avx512bw);
         generate_exception_if(evex.w || evex.brs, X86_EXC_UD);
         op_bytes = elem_bytes = 1 << (b & 1);
         /* See the comment at the avx512_broadcast label. */
@@ -6243,14 +6243,14 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x7a): /* vpbroadcastb r32,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x7b): /* vpbroadcastw r32,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512bw);
+        vcpu_must_have(avx512bw);
         generate_exception_if(evex.w, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x7c): /* vpbroadcast{d,q} reg,[xyz]mm{k} */
         generate_exception_if((ea.type != OP_REG || evex.brs ||
                                evex.reg != 0xf || !evex.RX),
                               X86_EXC_UD);
-        host_and_vcpu_must_have(avx512f);
+        vcpu_must_have(avx512f);
         avx512_vlen_check(false);
         get_fpu(X86EMUL_FPU_zmm);
 
@@ -6319,14 +6319,14 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x83): /* vpmultishiftqb [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         generate_exception_if(!evex.w, X86_EXC_UD);
-        host_and_vcpu_must_have(avx512_vbmi);
+        vcpu_must_have(avx512_vbmi);
         fault_suppression = false;
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_VEX_66(0x0f38, 0x8c): /* vpmaskmov{d,q} mem,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x8e): /* vpmaskmov{d,q} {x,y}mm,{x,y}mm,mem */
         generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
-        host_and_vcpu_must_have(avx2);
+        vcpu_must_have(avx2);
         elem_bytes = 4 << vex.w;
         goto vmaskmov;
 
@@ -6468,7 +6468,7 @@ x86_emulate(
                                modrm_reg == state->sib_index),
                               X86_EXC_UD);
         avx512_vlen_check(false);
-        host_and_vcpu_must_have(avx512f);
+        vcpu_must_have(avx512f);
         get_fpu(X86EMUL_FPU_zmm);
 
         /* Read destination and index registers. */
@@ -6608,7 +6608,7 @@ x86_emulate(
     case X86EMUL_OPC_VEX_66(0x0f38, 0xbd): /* vfnmadd231s{s,d} xmm/mem,xmm,xmm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0xbe): /* vfnmsub231p{s,d} {x,y}mm/mem,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0xbf): /* vfnmsub231s{s,d} xmm/mem,xmm,xmm */
-        host_and_vcpu_must_have(fma);
+        vcpu_must_have(fma);
         goto simd_0f_ymm;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xa0): /* vpscatterd{d,q} [xyz]mm,mem{k} */
@@ -6630,7 +6630,7 @@ x86_emulate(
                                modrm_reg == state->sib_index),
                               X86_EXC_UD);
         avx512_vlen_check(false);
-        host_and_vcpu_must_have(avx512f);
+        vcpu_must_have(avx512f);
         get_fpu(X86EMUL_FPU_zmm);
 
         /* Read source and index registers. */
@@ -6733,20 +6733,20 @@ x86_emulate(
 
     case X86EMUL_OPC_VEX_66(0x0f38, 0xb1): /* vbcstnesh2ps mem,[xy]mm */
     case X86EMUL_OPC_VEX_F3(0x0f38, 0xb1): /* vbcstnebf162ps mem,[xy]mm */
-        host_and_vcpu_must_have(avx_ne_convert);
+        vcpu_must_have(avx_ne_convert);
         generate_exception_if(vex.w || ea.type != OP_MEM, X86_EXC_UD);
         op_bytes = 2;
         goto simd_0f_ymm;
 
     case X86EMUL_OPC_VEX_66(0x0f38, 0xb4): /* vpmadd52luq [xy]mm/mem,[xy]mm,[xy]mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0xb5): /* vpmadd52huq [xy]mm/mem,[xy]mm,[xy]mm */
-        host_and_vcpu_must_have(avx_ifma);
+        vcpu_must_have(avx_ifma);
         generate_exception_if(!vex.w, X86_EXC_UD);
         goto simd_0f_ymm;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xb4): /* vpmadd52luq [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xb5): /* vpmadd52huq [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512_ifma);
+        vcpu_must_have(avx512_ifma);
         generate_exception_if(!evex.w, X86_EXC_UD);
         goto avx512f_no_sae;
 
@@ -6756,29 +6756,29 @@ x86_emulate(
     case X86EMUL_OPC(0x0f38, 0xcb):     /* sha256rnds2 XMM0,xmm/m128,xmm */
     case X86EMUL_OPC(0x0f38, 0xcc):     /* sha256msg1 xmm/m128,xmm */
     case X86EMUL_OPC(0x0f38, 0xcd):     /* sha256msg2 xmm/m128,xmm */
-        host_and_vcpu_must_have(sha);
+        vcpu_must_have(sha);
         op_bytes = 16;
         goto simd_0f38_common;
 
     case X86EMUL_OPC_VEX_F2(0x0f38, 0xcb): /* vsha512rnds2 xmm,ymm,ymm */
     case X86EMUL_OPC_VEX_F2(0x0f38, 0xcc): /* vsha512msg1 xmm,ymm */
     case X86EMUL_OPC_VEX_F2(0x0f38, 0xcd): /* vsha512msg2 ymm,ymm */
-        host_and_vcpu_must_have(sha512);
+        vcpu_must_have(sha512);
         generate_exception_if(ea.type != OP_REG || vex.w || !vex.l, X86_EXC_UD);
         op_bytes = 32;
         goto simd_0f_ymm;
 
     case X86EMUL_OPC_66(0x0f38, 0xcf):      /* gf2p8mulb xmm/m128,xmm */
-        host_and_vcpu_must_have(gfni);
+        vcpu_must_have(gfni);
         goto simd_0f38_common;
 
     case X86EMUL_OPC_VEX_66(0x0f38, 0xcf):  /* vgf2p8mulb {x,y}mm/mem,{x,y}mm,{x,y}mm */
-        host_and_vcpu_must_have(gfni);
+        vcpu_must_have(gfni);
         generate_exception_if(vex.w, X86_EXC_UD);
         goto simd_0f_avx;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xcf): /* vgf2p8mulb [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        host_and_vcpu_must_have(gfni);
+        vcpu_must_have(gfni);
         generate_exception_if(evex.w || evex.brs, X86_EXC_UD);
         elem_bytes = 1;
         goto avx512f_no_sae;
@@ -6789,7 +6789,7 @@ x86_emulate(
     case X86EMUL_OPC_VEX   (0x0f38, 0xd3): /* vpdpwuuds [xy]mm/mem,[xy]mm,[xy]mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0xd3): /* vpdpwusds [xy]mm/mem,[xy]mm,[xy]mm */
     case X86EMUL_OPC_VEX_F3(0x0f38, 0xd3): /* vpdpwsuds [xy]mm/mem,[xy]mm,[xy]mm */
-        host_and_vcpu_must_have(avx_vnni_int16);
+        vcpu_must_have(avx_vnni_int16);
         generate_exception_if(vex.w, X86_EXC_UD);
         op_bytes = 16 << vex.l;
         goto simd_0f_ymm;
@@ -6797,12 +6797,12 @@ x86_emulate(
     case X86EMUL_OPC_VEX   (0x0f38, 0xda): /* vsm3msg1 xmm/mem,xmm,xmm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0xda): /* vsm3msg2 xmm/mem,xmm,xmm */
         generate_exception_if(vex.w || vex.l, X86_EXC_UD);
-        host_and_vcpu_must_have(sm3);
+        vcpu_must_have(sm3);
         goto simd_0f_ymm;
 
     case X86EMUL_OPC_VEX_F3(0x0f38, 0xda): /* vsm4key4 [xy]mm/mem,[xy]mm,[xy]mm */
     case X86EMUL_OPC_VEX_F2(0x0f38, 0xda): /* vsm4rnds4 [xy]mm/mem,[xy]mm,[xy]mm */
-        host_and_vcpu_must_have(sm4);
+        vcpu_must_have(sm4);
         generate_exception_if(vex.w, X86_EXC_UD);
         op_bytes = 16 << vex.l;
         goto simd_0f_ymm;
@@ -6812,16 +6812,16 @@ x86_emulate(
     case X86EMUL_OPC_VEX_66(0x0f38, 0xde):  /* vaesdec {x,y}mm/mem,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0xdf):  /* vaesdeclast {x,y}mm/mem,{x,y}mm,{x,y}mm */
         if ( !vex.l )
-            host_and_vcpu_must_have(aesni);
+            vcpu_must_have(aesni);
         else
-            host_and_vcpu_must_have(vaes);
+            vcpu_must_have(vaes);
         goto simd_0f_avx;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xdc): /* vaesenc [xyz]mm/mem,[xyz]mm,[xyz]mm */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xdd): /* vaesenclast [xyz]mm/mem,[xyz]mm,[xyz]mm */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xde): /* vaesdec [xyz]mm/mem,[xyz]mm,[xyz]mm */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xdf): /* vaesdeclast [xyz]mm/mem,[xyz]mm,[xyz]mm */
-        host_and_vcpu_must_have(vaes);
+        vcpu_must_have(vaes);
         generate_exception_if(evex.brs || evex.opmsk, X86_EXC_UD);
         goto avx512f_no_sae;
 
@@ -6831,7 +6831,7 @@ x86_emulate(
          X86EMUL_OPC_VEX_66(0x0f38, 0xef): /* cmp<cc>xadd r,r,m */
         generate_exception_if(!mode_64bit() || dst.type != OP_MEM || vex.l,
                               X86_EXC_UD);
-        host_and_vcpu_must_have(cmpccxadd);
+        vcpu_must_have(cmpccxadd);
         fail_if(!ops->rmw);
         state->rmw = rmw_cmpccxadd;
         break;
@@ -6863,7 +6863,7 @@ x86_emulate(
 
     case X86EMUL_OPC_F2(0x0f38, 0xf0): /* crc32 r/m8, r{32,64} */
     case X86EMUL_OPC_F2(0x0f38, 0xf1): /* crc32 r/m{16,32,64}, r{32,64} */
-        host_and_vcpu_must_have(sse4_2);
+        vcpu_must_have(sse4_2);
         dst.bytes = rex_prefix & REX_W ? 8 : 4;
         switch ( op_bytes )
         {
@@ -6903,9 +6903,9 @@ x86_emulate(
         typeof(vex) *pvex = container_of(buf + 1, typeof(vex), raw[0]);
 
         if ( b == 0xf5 || vex.pfx )
-            host_and_vcpu_must_have(bmi2);
+            vcpu_must_have(bmi2);
         else
-            host_and_vcpu_must_have(bmi1);
+            vcpu_must_have(bmi1);
         generate_exception_if(vex.l, X86_EXC_UD);
 
         buf[0] = 0xc4;
@@ -6936,7 +6936,7 @@ x86_emulate(
         case 1: /* blsr r,r/m */
         case 2: /* blsmsk r,r/m */
         case 3: /* blsi r,r/m */
-            host_and_vcpu_must_have(bmi1);
+            vcpu_must_have(bmi1);
             break;
         default:
             goto unrecognized_insn;
@@ -7008,7 +7008,7 @@ x86_emulate(
         break;
 
     case X86EMUL_OPC_66(0x0f38, 0xf8): /* movdir64b r,m512 */
-        host_and_vcpu_must_have(movdir64b);
+        vcpu_must_have(movdir64b);
         generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
         src.val = truncate_ea(*dst.reg);
         generate_exception_if(!is_aligned(x86_seg_es, src.val, 64, ctxt, ops),
@@ -7026,7 +7026,7 @@ x86_emulate(
 
     case X86EMUL_OPC_F2(0x0f38, 0xf8): /* enqcmd r,m512 */
     case X86EMUL_OPC_F3(0x0f38, 0xf8): /* enqcmds r,m512 */
-        host_and_vcpu_must_have(enqcmd);
+        vcpu_must_have(enqcmd);
         generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
         generate_exception_if(vex.pfx != vex_f2 && !mode_ring0(), X86_EXC_GP, 0);
         src.val = truncate_ea(*dst.reg);
@@ -7057,7 +7057,7 @@ x86_emulate(
         break;
 
     case X86EMUL_OPC(0x0f38, 0xf9): /* movdiri mem,r */
-        host_and_vcpu_must_have(movdiri);
+        vcpu_must_have(movdiri);
         generate_exception_if(dst.type != OP_MEM, X86_EXC_UD);
         fail_if(!ops->blk);
         state->blk = blk_movdir;
@@ -7115,7 +7115,7 @@ x86_emulate(
     case X86EMUL_OPC_66(0x0f3a, 0x40): /* dpps $imm8,xmm/m128,xmm */
     case X86EMUL_OPC_66(0x0f3a, 0x41): /* dppd $imm8,xmm/m128,xmm */
     case X86EMUL_OPC_66(0x0f3a, 0x42): /* mpsadbw $imm8,xmm/m128,xmm */
-        host_and_vcpu_must_have(sse4_1);
+        vcpu_must_have(sse4_1);
         goto simd_0f3a_common;
 
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x0a): /* vrndscaless $imm8,xmm/mem,xmm,xmm{k} */
@@ -7124,7 +7124,7 @@ x86_emulate(
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x08): /* vrndscaleps $imm8,[xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x09): /* vrndscalepd $imm8,[xyz]mm/mem,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512f);
+        vcpu_must_have(avx512f);
         generate_exception_if(evex.w != (b & 1), X86_EXC_UD);
         avx512_vlen_check(b & 2);
         goto simd_imm8_zmm;
@@ -7133,7 +7133,7 @@ x86_emulate(
         generate_exception_if(ea.type != OP_REG && evex.brs, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX(0x0f3a, 0x08): /* vrndscaleph $imm8,[xyz]mm/mem,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512_fp16);
+        vcpu_must_have(avx512_fp16);
         generate_exception_if(evex.w, X86_EXC_UD);
         avx512_vlen_check(b & 2);
         goto simd_imm8_zmm;
@@ -7141,7 +7141,7 @@ x86_emulate(
 #endif /* X86EMUL_NO_SIMD */
 
     CASE_SIMD_PACKED_INT(0x0f3a, 0x0f): /* palignr $imm8,{,x}mm/mem,{,x}mm */
-        host_and_vcpu_must_have(ssse3);
+        vcpu_must_have(ssse3);
         if ( vex.pfx )
         {
     simd_0f3a_common:
@@ -7149,7 +7149,7 @@ x86_emulate(
         }
         else
         {
-            host_and_vcpu_must_have(mmx);
+            vcpu_must_have(mmx);
             get_fpu(X86EMUL_FPU_mmx);
         }
         opc = init_prefixes(stub);
@@ -7180,7 +7180,7 @@ x86_emulate(
     case X86EMUL_OPC_66(0x0f3a, 0x15): /* pextrw $imm8,xmm,r/m */
     case X86EMUL_OPC_66(0x0f3a, 0x16): /* pextr{d,q} $imm8,xmm,r/m */
     case X86EMUL_OPC_66(0x0f3a, 0x17): /* extractps $imm8,xmm,r/m */
-        host_and_vcpu_must_have(sse4_1);
+        vcpu_must_have(sse4_1);
         get_fpu(X86EMUL_FPU_xmm);
 
         opc = init_prefixes(stub);
@@ -7219,7 +7219,7 @@ x86_emulate(
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x16): /* vpextr{d,q} $imm8,xmm,r/m */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x17): /* vextractps $imm8,xmm,r/m */
         generate_exception_if(vex.l || vex.reg != 0xf, X86_EXC_UD);
-        host_and_vcpu_must_have(avx);
+        vcpu_must_have(avx);
         get_fpu(X86EMUL_FPU_ymm);
 
         /* Work around erratum BT41. */
@@ -7246,11 +7246,11 @@ x86_emulate(
                                evex.opmsk || evex.brs),
                               X86_EXC_UD);
         if ( !(b & 2) )
-            host_and_vcpu_must_have(avx512bw);
+            vcpu_must_have(avx512bw);
         else if ( !(b & 1) )
-            host_and_vcpu_must_have(avx512dq);
+            vcpu_must_have(avx512dq);
         else
-            host_and_vcpu_must_have(avx512f);
+            vcpu_must_have(avx512f);
         get_fpu(X86EMUL_FPU_zmm);
         opc = init_evex(stub);
         goto pextr;
@@ -7264,7 +7264,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x39): /* vextracti32x4 $imm8,{y,z}mm,xmm/m128{k} */
                                             /* vextracti64x2 $imm8,{y,z}mm,xmm/m128{k} */
         if ( evex.w )
-            host_and_vcpu_must_have(avx512dq);
+            vcpu_must_have(avx512dq);
         generate_exception_if(evex.brs, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x23): /* vshuff32x4 $imm8,{y,z}mm/mem,{y,z}mm,{y,z}mm{k} */
@@ -7284,7 +7284,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x3b): /* vextracti32x8 $imm8,zmm,ymm/m256{k} */
                                             /* vextracti64x4 $imm8,zmm,ymm/m256{k} */
         if ( !evex.w )
-            host_and_vcpu_must_have(avx512dq);
+            vcpu_must_have(avx512dq);
         generate_exception_if(evex.lr != 2 || evex.brs, X86_EXC_UD);
         fault_suppression = false;
         goto avx512f_imm8_no_sae;
@@ -7300,14 +7300,14 @@ x86_emulate(
             generate_exception_if((evex.w || evex.reg != 0xf || !evex.RX ||
                                    (ea.type != OP_REG && (evex.z || evex.brs))),
                                   X86_EXC_UD);
-            host_and_vcpu_must_have(avx512f);
+            vcpu_must_have(avx512f);
             avx512_vlen_check(false);
             opc = init_evex(stub);
         }
         else
         {
             generate_exception_if(vex.w || vex.reg != 0xf, X86_EXC_UD);
-            host_and_vcpu_must_have(f16c);
+            vcpu_must_have(f16c);
             opc = init_prefixes(stub);
         }
 
@@ -7392,7 +7392,7 @@ x86_emulate(
         if ( !(b & 0x20) )
             goto avx512f_imm8_no_sae;
     avx512bw_imm:
-        host_and_vcpu_must_have(avx512bw);
+        vcpu_must_have(avx512bw);
         generate_exception_if(evex.brs, X86_EXC_UD);
         elem_bytes = 1 << evex.w;
         avx512_vlen_check(false);
@@ -7400,7 +7400,7 @@ x86_emulate(
 
     case X86EMUL_OPC_66(0x0f3a, 0x20): /* pinsrb $imm8,r32/m8,xmm */
     case X86EMUL_OPC_66(0x0f3a, 0x22): /* pinsr{d,q} $imm8,r/m,xmm */
-        host_and_vcpu_must_have(sse4_1);
+        vcpu_must_have(sse4_1);
         memcpy(mmvalp, &src.val, src.bytes);
         ea.type = OP_MEM;
         d = SrcMem16; /* Fake for the common SIMD code below. */
@@ -7419,7 +7419,7 @@ x86_emulate(
         goto simd_0f_int_imm8;
 
     case X86EMUL_OPC_66(0x0f3a, 0x21): /* insertps $imm8,xmm/m32,xmm */
-        host_and_vcpu_must_have(sse4_1);
+        vcpu_must_have(sse4_1);
         op_bytes = 4;
         goto simd_0f3a_common;
 
@@ -7431,7 +7431,7 @@ x86_emulate(
         goto simd_0f_imm8_avx;
 
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x21): /* vinsertps $imm8,xmm/m32,xmm,xmm */
-        host_and_vcpu_must_have(avx512f);
+        vcpu_must_have(avx512f);
         generate_exception_if(evex.lr || evex.w || evex.opmsk || evex.brs,
                               X86_EXC_UD);
         op_bytes = 4;
@@ -7439,18 +7439,18 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x50): /* vrangep{s,d} $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x56): /* vreducep{s,d} $imm8,[xyz]mm/mem,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512dq);
+        vcpu_must_have(avx512dq);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x26): /* vgetmantp{s,d} $imm8,[xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x54): /* vfixupimmp{s,d} $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512f);
+        vcpu_must_have(avx512f);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(false);
         goto simd_imm8_zmm;
 
     case X86EMUL_OPC_EVEX(0x0f3a, 0x26): /* vgetmantph $imm8,[xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX(0x0f3a, 0x56): /* vreduceph $imm8,[xyz]mm/mem,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512_fp16);
+        vcpu_must_have(avx512_fp16);
         generate_exception_if(evex.w, X86_EXC_UD);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(false);
@@ -7458,11 +7458,11 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x51): /* vranges{s,d} $imm8,xmm/mem,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x57): /* vreduces{s,d} $imm8,xmm/mem,xmm,xmm{k} */
-        host_and_vcpu_must_have(avx512dq);
+        vcpu_must_have(avx512dq);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x27): /* vgetmants{s,d} $imm8,xmm/mem,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x55): /* vfixupimms{s,d} $imm8,xmm/mem,xmm,xmm{k} */
-        host_and_vcpu_must_have(avx512f);
+        vcpu_must_have(avx512f);
         generate_exception_if(ea.type != OP_REG && evex.brs, X86_EXC_UD);
         if ( !evex.brs )
             avx512_vlen_check(true);
@@ -7470,7 +7470,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX(0x0f3a, 0x27): /* vgetmantsh $imm8,xmm/mem,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX(0x0f3a, 0x57): /* vreducesh $imm8,xmm/mem,xmm,xmm{k} */
-        host_and_vcpu_must_have(avx512_fp16);
+        vcpu_must_have(avx512_fp16);
         generate_exception_if(evex.w, X86_EXC_UD);
         if ( !evex.brs )
             avx512_vlen_check(true);
@@ -7481,31 +7481,31 @@ x86_emulate(
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x30): /* kshiftr{b,w} $imm8,k,k */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x32): /* kshiftl{b,w} $imm8,k,k */
         if ( !vex.w )
-            host_and_vcpu_must_have(avx512dq);
+            vcpu_must_have(avx512dq);
     opmask_shift_imm:
         generate_exception_if(vex.l || !vex.r || vex.reg != 0xf ||
                               ea.type != OP_REG, X86_EXC_UD);
-        host_and_vcpu_must_have(avx512f);
+        vcpu_must_have(avx512f);
         get_fpu(X86EMUL_FPU_opmask);
         op_bytes = 1; /* Any non-zero value will do. */
         goto simd_0f_imm8;
 
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x31): /* kshiftr{d,q} $imm8,k,k */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x33): /* kshiftl{d,q} $imm8,k,k */
-        host_and_vcpu_must_have(avx512bw);
+        vcpu_must_have(avx512bw);
         goto opmask_shift_imm;
 
     case X86EMUL_OPC_66(0x0f3a, 0x44):     /* pclmulqdq $imm8,xmm/m128,xmm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x44): /* vpclmulqdq $imm8,{x,y}mm/mem,{x,y}mm,{x,y}mm */
-        host_and_vcpu_must_have(pclmulqdq);
+        vcpu_must_have(pclmulqdq);
         if ( vex.opcx == vex_none )
             goto simd_0f3a_common;
         if ( vex.l )
-            host_and_vcpu_must_have(vpclmulqdq);
+            vcpu_must_have(vpclmulqdq);
         goto simd_0f_imm8_avx;
 
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x44): /* vpclmulqdq $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm */
-        host_and_vcpu_must_have(vpclmulqdq);
+        vcpu_must_have(vpclmulqdq);
         generate_exception_if(evex.brs || evex.opmsk, X86_EXC_UD);
         goto avx512f_imm8_no_sae;
 
@@ -7513,7 +7513,7 @@ x86_emulate(
                                            /* vpermil2ps $imm,{x,y}mm,{x,y}mm/mem,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x49): /* vpermil2pd $imm,{x,y}mm/mem,{x,y}mm,{x,y}mm,{x,y}mm */
                                            /* vpermil2pd $imm,{x,y}mm,{x,y}mm/mem,{x,y}mm,{x,y}mm */
-        host_and_vcpu_must_have(xop);
+        vcpu_must_have(xop);
         goto simd_0f_imm8_ymm;
 
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x4a): /* vblendvps {x,y}mm,{x,y}mm/mem,{x,y}mm,{x,y}mm */
@@ -7565,7 +7565,7 @@ x86_emulate(
                                            /* vfnmsubss xmm/m32,xmm,xmm,xmm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x7f): /* vfnmsubsd xmm,xmm/m64,xmm,xmm */
                                            /* vfnmsubsd xmm/m64,xmm,xmm,xmm */
-        host_and_vcpu_must_have(fma4);
+        vcpu_must_have(fma4);
         goto simd_0f_imm8_ymm;
 
     case X86EMUL_OPC_66(0x0f3a, 0x60):     /* pcmpestrm $imm8,xmm/m128,xmm */
@@ -7578,13 +7578,13 @@ x86_emulate(
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x63): /* vpcmpistri $imm8,xmm/m128,xmm */
         if ( vex.opcx == vex_none )
         {
-            host_and_vcpu_must_have(sse4_2);
+            vcpu_must_have(sse4_2);
             get_fpu(X86EMUL_FPU_xmm);
         }
         else
         {
             generate_exception_if(vex.l || vex.reg != 0xf, X86_EXC_UD);
-            host_and_vcpu_must_have(avx);
+            vcpu_must_have(avx);
             get_fpu(X86EMUL_FPU_ymm);
         }
 
@@ -7633,7 +7633,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x66): /* vfpclassp{s,d} $imm8,[xyz]mm/mem,k{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x67): /* vfpclasss{s,d} $imm8,xmm/mem,k{k} */
-        host_and_vcpu_must_have(avx512dq);
+        vcpu_must_have(avx512dq);
         generate_exception_if(!evex.r || !evex.R || evex.z, X86_EXC_UD);
         if ( !(b & 1) )
             goto avx512f_imm8_no_sae;
@@ -7643,7 +7643,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX(0x0f3a, 0x66): /* vfpclassph $imm8,[xyz]mm/mem,k{k} */
     case X86EMUL_OPC_EVEX(0x0f3a, 0x67): /* vfpclasssh $imm8,xmm/mem,k{k} */
-        host_and_vcpu_must_have(avx512_fp16);
+        vcpu_must_have(avx512_fp16);
         generate_exception_if(evex.w || !evex.r || !evex.R || evex.z, X86_EXC_UD);
         if ( !(b & 1) )
             goto avx512f_imm8_no_sae;
@@ -7658,51 +7658,51 @@ x86_emulate(
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x71): /* vpshld{d,q} $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x73): /* vpshrd{d,q} $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512_vbmi2);
+        vcpu_must_have(avx512_vbmi2);
         goto avx512f_imm8_no_sae;
 
     case X86EMUL_OPC_EVEX_F3(0x0f3a, 0xc2): /* vcmpsh $imm8,xmm/mem,xmm,k{k} */
         generate_exception_if(ea.type != OP_REG && evex.brs, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX(0x0f3a, 0xc2): /* vcmpph $imm8,[xyz]mm/mem,[xyz]mm,k{k} */
-        host_and_vcpu_must_have(avx512_fp16);
+        vcpu_must_have(avx512_fp16);
         generate_exception_if(evex.w || !evex.r || !evex.R || evex.z, X86_EXC_UD);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(evex.pfx & VEX_PREFIX_SCALAR_MASK);
         goto simd_imm8_zmm;
 
     case X86EMUL_OPC(0x0f3a, 0xcc):     /* sha1rnds4 $imm8,xmm/m128,xmm */
-        host_and_vcpu_must_have(sha);
+        vcpu_must_have(sha);
         op_bytes = 16;
         goto simd_0f3a_common;
 
     case X86EMUL_OPC_66(0x0f3a, 0xce):      /* gf2p8affineqb $imm8,xmm/m128,xmm */
     case X86EMUL_OPC_66(0x0f3a, 0xcf):      /* gf2p8affineinvqb $imm8,xmm/m128,xmm */
-        host_and_vcpu_must_have(gfni);
+        vcpu_must_have(gfni);
         goto simd_0f3a_common;
 
     case X86EMUL_OPC_VEX_66(0x0f3a, 0xce):  /* vgf2p8affineqb $imm8,{x,y}mm/mem,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0xcf):  /* vgf2p8affineinvqb $imm8,{x,y}mm/mem,{x,y}mm,{x,y}mm */
-        host_and_vcpu_must_have(gfni);
+        vcpu_must_have(gfni);
         generate_exception_if(!vex.w, X86_EXC_UD);
         goto simd_0f_imm8_avx;
 
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0xce): /* vgf2p8affineqb $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0xcf): /* vgf2p8affineinvqb $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        host_and_vcpu_must_have(gfni);
+        vcpu_must_have(gfni);
         generate_exception_if(!evex.w, X86_EXC_UD);
         fault_suppression = false;
         goto avx512f_imm8_no_sae;
 
     case X86EMUL_OPC_VEX_66(0x0f3a, 0xde): /* vsm3rnds2 $imm8,xmm/mem,xmm,xmm */
-        host_and_vcpu_must_have(sm3);
+        vcpu_must_have(sm3);
         generate_exception_if(vex.w || vex.l, X86_EXC_UD);
         op_bytes = 16;
         goto simd_0f_imm8_ymm;
 
     case X86EMUL_OPC_66(0x0f3a, 0xdf):     /* aeskeygenassist $imm8,xmm/m128,xmm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0xdf): /* vaeskeygenassist $imm8,xmm/m128,xmm */
-        host_and_vcpu_must_have(aesni);
+        vcpu_must_have(aesni);
         if ( vex.opcx == vex_none )
             goto simd_0f3a_common;
         generate_exception_if(vex.l, X86_EXC_UD);
@@ -7741,13 +7741,13 @@ x86_emulate(
     CASE_SIMD_SINGLE_FP(_EVEX, 5, 0x5d): /* vmin{p,s}h [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     CASE_SIMD_SINGLE_FP(_EVEX, 5, 0x5e): /* vdiv{p,s}h [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     CASE_SIMD_SINGLE_FP(_EVEX, 5, 0x5f): /* vmax{p,s}h [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512_fp16);
+        vcpu_must_have(avx512_fp16);
         generate_exception_if(evex.w, X86_EXC_UD);
         goto avx512f_all_fp;
 
     CASE_SIMD_ALL_FP(_EVEX, 5, 0x5a):  /* vcvtp{h,d}2p{h,d} [xyz]mm/mem,[xyz]mm{k} */
                                        /* vcvts{h,d}2s{h,d} xmm/mem,xmm,xmm{k} */
-        host_and_vcpu_must_have(avx512_fp16);
+        vcpu_must_have(avx512_fp16);
         if ( vex.pfx & VEX_PREFIX_SCALAR_MASK )
             d &= ~TwoOp;
         op_bytes = 2 << (((evex.pfx & VEX_PREFIX_SCALAR_MASK) ? 0 : 1 + evex.lr) +
@@ -7758,7 +7758,7 @@ x86_emulate(
                                        /* vcvtqq2ph [xyz]mm/mem,xmm{k} */
     case X86EMUL_OPC_EVEX_F2(5, 0x7a): /* vcvtudq2ph [xyz]mm/mem,[xy]mm{k} */
                                        /* vcvtuqq2ph [xyz]mm/mem,xmm{k} */
-        host_and_vcpu_must_have(avx512_fp16);
+        vcpu_must_have(avx512_fp16);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(false);
         op_bytes = 16 << evex.lr;
@@ -7768,7 +7768,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_F3(5, 0x5b): /* vcvttph2dq [xy]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX   (5, 0x78): /* vcvttph2udq [xy]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX   (5, 0x79): /* vcvtph2udq [xy]mm/mem,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512_fp16);
+        vcpu_must_have(avx512_fp16);
         generate_exception_if(evex.w, X86_EXC_UD);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(false);
@@ -7779,7 +7779,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(5, 0x79): /* vcvtph2uqq xmm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(5, 0x7a): /* vcvttph2qq xmm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(5, 0x7b): /* vcvtph2qq xmm/mem,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512_fp16);
+        vcpu_must_have(avx512_fp16);
         generate_exception_if(evex.w, X86_EXC_UD);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(false);
@@ -7816,7 +7816,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(6, 0xba): /* vfmsub231ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0xbc): /* vfnmadd231ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0xbe): /* vfnmsub231ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512_fp16);
+        vcpu_must_have(avx512_fp16);
         generate_exception_if(evex.w, X86_EXC_UD);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(false);
@@ -7838,7 +7838,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(6, 0xbb): /* vfmsub231sh xmm/m16,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0xbd): /* vfnmadd231sh xmm/m16,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0xbf): /* vfnmsub231sh xmm/m16,xmm,xmm{k} */
-        host_and_vcpu_must_have(avx512_fp16);
+        vcpu_must_have(avx512_fp16);
         generate_exception_if(evex.w || (ea.type != OP_REG && evex.brs),
                               X86_EXC_UD);
         if ( !evex.brs )
@@ -7847,13 +7847,13 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(6, 0x4c): /* vrcpph [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0x4e): /* vrsqrtph [xyz]mm/mem,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512_fp16);
+        vcpu_must_have(avx512_fp16);
         generate_exception_if(evex.w, X86_EXC_UD);
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_EVEX_66(6, 0x4d): /* vrcpsh xmm/m16,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0x4f): /* vrsqrtsh xmm/m16,xmm,xmm{k} */
-        host_and_vcpu_must_have(avx512_fp16);
+        vcpu_must_have(avx512_fp16);
         generate_exception_if(evex.w || evex.brs, X86_EXC_UD);
         avx512_vlen_check(true);
         goto simd_zmm;
@@ -7871,7 +7871,7 @@ x86_emulate(
     {
         unsigned int src1 = ~evex.reg;
 
-        host_and_vcpu_must_have(avx512_fp16);
+        vcpu_must_have(avx512_fp16);
         generate_exception_if(evex.w || ((b & 1) && ea.type != OP_REG && evex.brs),
                               X86_EXC_UD);
         if ( mode_64bit() )
@@ -7931,7 +7931,7 @@ x86_emulate(
         /* fall through */
     case X86EMUL_OPC_XOP(08, 0xa2): /* vpcmov {x,y}mm/mem,{x,y}mm,{x,y}mm,{x,y}mm */
                                     /* vpcmov {x,y}mm,{x,y}mm/mem,{x,y}mm,{x,y}mm */
-        host_and_vcpu_must_have(xop);
+        vcpu_must_have(xop);
         goto simd_0f_imm8_ymm;
 
 #endif /* X86EMUL_NO_SIMD */
@@ -7946,7 +7946,7 @@ x86_emulate(
         case 5: /* blcic r/m,r */
         case 6: /* blsic r/m,r */
         case 7: /* t1mskc r/m,r */
-            host_and_vcpu_must_have(tbm);
+            vcpu_must_have(tbm);
             break;
         default:
             goto unrecognized_insn;
@@ -7980,7 +7980,7 @@ x86_emulate(
         {
         case 1: /* blcmsk r/m,r */
         case 6: /* blci r/m,r */
-            host_and_vcpu_must_have(tbm);
+            vcpu_must_have(tbm);
             goto xop_09_rm_rv;
         }
         goto unrecognized_insn;
@@ -8003,7 +8003,7 @@ x86_emulate(
         /* fall through */
     case X86EMUL_OPC_XOP(09, 0x80): /* vfrczps {x,y}mm/mem,{x,y}mm */
     case X86EMUL_OPC_XOP(09, 0x81): /* vfrczpd {x,y}mm/mem,{x,y}mm */
-        host_and_vcpu_must_have(xop);
+        vcpu_must_have(xop);
         generate_exception_if(vex.w, X86_EXC_UD);
         goto simd_0f_ymm;
 
@@ -8049,7 +8049,7 @@ x86_emulate(
     case X86EMUL_OPC_XOP(09, 0x9b): /* vpshaq xmm/m128,xmm,xmm */
                                     /* vpshaq xmm,xmm/m128,xmm */
         generate_exception_if(vex.l, X86_EXC_UD);
-        host_and_vcpu_must_have(xop);
+        vcpu_must_have(xop);
         goto simd_0f_ymm;
 
 #endif /* X86EMUL_NO_SIMD */
@@ -8059,7 +8059,7 @@ x86_emulate(
         uint8_t *buf = get_stub(stub);
         typeof(vex) *pxop = container_of(buf + 1, typeof(vex), raw[0]);
 
-        host_and_vcpu_must_have(tbm);
+        vcpu_must_have(tbm);
         generate_exception_if(vex.l || vex.reg != 0xf, X86_EXC_UD);
 
         if ( ea.type == OP_REG )

