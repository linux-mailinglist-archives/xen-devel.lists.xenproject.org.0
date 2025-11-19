Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9E0C6E0EB
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 11:50:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165764.1492458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLfli-0003jN-Dq; Wed, 19 Nov 2025 10:50:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165764.1492458; Wed, 19 Nov 2025 10:50:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLfli-0003h7-9P; Wed, 19 Nov 2025 10:50:34 +0000
Received: by outflank-mailman (input) for mailman id 1165764;
 Wed, 19 Nov 2025 10:50:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nJND=53=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vLflg-0003Dg-GW
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 10:50:32 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9199e2b2-c535-11f0-9d18-b5c5bf9af7f9;
 Wed, 19 Nov 2025 11:50:31 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-640e9f5951aso1183527a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Nov 2025 02:50:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fad4494sm1575027766b.18.2025.11.19.02.50.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Nov 2025 02:50:30 -0800 (PST)
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
X-Inumbo-ID: 9199e2b2-c535-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763549431; x=1764154231; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=loYtzp0ab1X2xMw5ZpAYNU+RwEo6LK1Qt3iW0KjPiTQ=;
        b=QTzRlye3nn6iWQha3i7xHxibutqPNlfTuiEjo0mkXmYhg4M40J27w32dJswhU1AGCN
         7UqA3DPvr+F2A82Ayfo4G0ecckBZMFc+/ImgRGZxCnVAXyA98you+XmpbVFnmTUNYyGt
         wUUgdyybJteytq0ZoTSt7ejT6G8kmFEIhxSx8vOeYaEqZn2glBcFLuTjHl+7cS/hZwvs
         ew+d9BisoaB+l/kNj7hZxGbaorLGEenrmsCkIkWiGLbPvxvzvUY8YnDvFU2Non8mXLmf
         Vl3CVsWJzaJmGX1QzzUWnwgTkP8HIeDTCUeM8RK89iF+SZ/ZfhZ6TMHOR0k0nKWxU84o
         MSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763549431; x=1764154231;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=loYtzp0ab1X2xMw5ZpAYNU+RwEo6LK1Qt3iW0KjPiTQ=;
        b=XNqUMOC1XNRjYljgmHhvhsxLsZYdOdLrgwpTfegnlsx6umDwsiF4wz1AMPpBhvWb8T
         zmIaEQruzB/3eTlcNfBZuXmOVbGt8//1zwqFsZ+tY9m95d51GnZZR52/K2hns1N8gzlO
         ujGCvsMGrqU7+eHcq6C2Al17U6CClui6eyGCY6UmiuWyqGQR+VKcrPagO0pUgkwOl8RL
         urlL5pQgrov2Vyh92g3hwDbd6lPQawnjs0zYpShjLUByIfUSLEiNaarcxk8chTGQlcYE
         SSpuv7kINJCPEOJZUrblzljDlp0H/Z0RIfSTmG01PLDgVOysnHpwqAZLBE9LyM93j2du
         K9zQ==
X-Gm-Message-State: AOJu0YwnTuME3CNI+iiQ/0hFaNKnHrL7DDZgt3Az3M6cBmHGyGA5tkMI
	xDB65g0qqkvzC3rFN8zQDxVKenCQABSZNUkJ7eZSBcOCRXWdh+3ohs5qJUg0sH0bNB5f2+uFdEZ
	Wg94=
X-Gm-Gg: ASbGnctxceg64vvJ3URY+gam0wYzrtkhH+hGUXDWutNdJ6isDiTELLCAz0ypoprBTXM
	hiVxGLl1cbkioy6QNNaErlBpd6wvaqQSxbDFa+bG5zhxaOwnLyESohOGomh70xMtyLUdrE2MX7/
	kFlqQtf8PJncxEbeDK19UE5+MQ6yp5ar4SQTF24UlHihO9YHCIRVoEWBzpc42WlUHCvOfD7z00C
	UMEX5rZqsoAgRpel2LYdFZvlkNfe5jH0H7w5jBZ+Jz8GUeHmx8ggmaKwOppxIqNW94c+abaWXAB
	nWOe4K1+Y7IUmDSSOIAMOtRlwFyzo8RMAzVCk700E2rX4duohJm0CJa/4wsaT8AqPWVpXpRdZlK
	oYCj5aYwZPGpVvILC0ZsKnz4H61xFI+Y5+rLiusqnAmRAAKjriZbchvjGm2aAuV0m6XUe7potBZ
	8E3n7JSVQFMqqRoqHcgyz6k6nBhTxi5zoQWrmnbawCnhkhBppDqinvSWSOk6O4gpb69miJQq+1c
	+E=
X-Google-Smtp-Source: AGHT+IGTSa2SoqaSM6MxzZVV6krh/0JZvl3sKjNYS5ilfrS4p5hFfhVobIvSqhuabRs2iEnGysniFg==
X-Received: by 2002:a17:907:9625:b0:b73:9222:6a64 with SMTP id a640c23a62f3a-b7638d02056mr241902266b.3.1763549431096;
        Wed, 19 Nov 2025 02:50:31 -0800 (PST)
Message-ID: <638d0954-e889-41ee-b277-282f83170c69@suse.com>
Date: Wed, 19 Nov 2025 11:50:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/4] x86/MCE: restrict allocation of thermal and CMCI vector
 to BSP
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <fbc9a2f8-170a-4645-8836-c90c42ad726f@suse.com>
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
In-Reply-To: <fbc9a2f8-170a-4645-8836-c90c42ad726f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

There's no need to do this for every AP; just do it once when setting up
the BSP. Then both vector variables can also validly become ro-after-init.

While touching intel_init_thermal(), constify its 1st parameter, which
in turn requires touching intel_thermal_supported() as well.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This contextually (but not functionally) collides with "x86/MCE: adjust S3
resume handling".

--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -37,7 +37,7 @@ bool is_mc_panic;
 DEFINE_PER_CPU_READ_MOSTLY(unsigned int, nr_mce_banks);
 unsigned int __read_mostly firstbank;
 unsigned int __read_mostly ppin_msr;
-uint8_t __read_mostly cmci_apic_vector;
+uint8_t __ro_after_init cmci_apic_vector;
 bool __read_mostly cmci_support;
 
 /* If mce_force_broadcast == 1, lmce_support will be disabled forcibly. */
--- a/xen/arch/x86/cpu/mcheck/mce_intel.c
+++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
@@ -87,7 +87,7 @@ static void cf_check intel_thermal_inter
 }
 
 /* Thermal monitoring depends on APIC, ACPI and clock modulation */
-static bool intel_thermal_supported(struct cpuinfo_x86 *c)
+static bool intel_thermal_supported(const struct cpuinfo_x86 *c)
 {
     if ( !cpu_has_apic )
         return false;
@@ -110,13 +110,13 @@ static void __init mcheck_intel_therm_in
 }
 
 /* P4/Xeon Thermal regulation detect and init */
-static void intel_init_thermal(struct cpuinfo_x86 *c)
+static void intel_init_thermal(const struct cpuinfo_x86 *c, bool bsp)
 {
     uint64_t msr_content;
     uint32_t val;
     int tm2 = 0;
     unsigned int cpu = smp_processor_id();
-    static uint8_t thermal_apic_vector;
+    static uint8_t __ro_after_init thermal_apic_vector;
 
     if ( !intel_thermal_supported(c) )
         return; /* -ENODEV */
@@ -160,7 +160,8 @@ static void intel_init_thermal(struct cp
         return; /* -EBUSY */
     }
 
-    alloc_direct_apic_vector(&thermal_apic_vector, intel_thermal_interrupt);
+    if ( bsp )
+        alloc_direct_apic_vector(&thermal_apic_vector, intel_thermal_interrupt);
 
     /* The temperature transition interrupt handler setup */
     val = thermal_apic_vector;    /* our delivery vector */
@@ -667,7 +668,7 @@ static void cf_check cmci_interrupt(void
         mctelem_dismiss(mctc);
 }
 
-static void intel_init_cmci(struct cpuinfo_x86 *c)
+static void intel_init_cmci(struct cpuinfo_x86 *c, bool bsp)
 {
     u32 l, apic;
     int cpu = smp_processor_id();
@@ -687,7 +688,8 @@ static void intel_init_cmci(struct cpuin
         return;
     }
 
-    alloc_direct_apic_vector(&cmci_apic_vector, cmci_interrupt);
+    if ( bsp )
+        alloc_direct_apic_vector(&cmci_apic_vector, cmci_interrupt);
 
     apic = cmci_apic_vector;
     apic |= (APIC_DM_FIXED | APIC_LVT_MASKED);
@@ -993,9 +995,9 @@ enum mcheck_type intel_mcheck_init(struc
 
     intel_init_mce(bsp);
 
-    intel_init_cmci(c);
+    intel_init_cmci(c, bsp);
 
-    intel_init_thermal(c);
+    intel_init_thermal(c, bsp);
 
     intel_init_ppin(c);
 


