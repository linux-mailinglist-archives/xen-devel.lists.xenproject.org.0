Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A74DC8076C
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 13:30:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170485.1495558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVhg-000570-Aq; Mon, 24 Nov 2025 12:30:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170485.1495558; Mon, 24 Nov 2025 12:30:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVhg-00054L-7d; Mon, 24 Nov 2025 12:30:00 +0000
Received: by outflank-mailman (input) for mailman id 1170485;
 Mon, 24 Nov 2025 12:29:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNVhf-00053p-AD
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 12:29:59 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4954ad95-c931-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 13:29:57 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-42b3c5defb2so2741052f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 04:29:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f2e574sm28027049f8f.3.2025.11.24.04.29.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 04:29:56 -0800 (PST)
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
X-Inumbo-ID: 4954ad95-c931-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763987396; x=1764592196; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=loYtzp0ab1X2xMw5ZpAYNU+RwEo6LK1Qt3iW0KjPiTQ=;
        b=eIQjI7WBHz797RDOC0nzXmerMZOw5qsBWpKllMT83q67Bc4QFJ1iQgw6jMcEBg3dM7
         YgIJZCGB2e3TS1lLjafNvir7xxEypx7VF3F8tjK4wN6n+2zcJNLhRNo8DluHtyUnc8Z+
         L5r35nlB93fSbV4y2gBZ8BNw2xvIizl2TfuGi2iPpNby6S+ZwAJOsr0gR6f24KdhfAvN
         eqOpvQOG1sBcvj2i7SZJDfDaW1yu45uk8ZU61uvfLQ3ayOIukooqRne/2dzP7MHkZAaJ
         Nlw4dbBcBh3LVNtbvFfgNmhTB9k6nlq6vLTtI2HguUfpWi2rP5amxNKfmbhP/pu+Ohth
         fBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763987396; x=1764592196;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=loYtzp0ab1X2xMw5ZpAYNU+RwEo6LK1Qt3iW0KjPiTQ=;
        b=u36EzG+GD1zK9c/cKhjg5e9nQaNaD4SSmexsPEWyzXeN8tyKDSq9gISwH1kLcQQXYZ
         YDnm7mlDPxW2D6wJDun7vkdACmRv1WJr79xzvyG4NlU3pPSPk36exCGfJ8ANP/cCdXM6
         eDraAGCBESmEBgnJwTbJxbRZt8/8KQY43E4NW7X1sVQLu6BmoIfrxRA+yBkxqOQklqka
         bCX+7w9rVnvoLXBxiuSq3xcaRZD18FAUyyKd9sWQ7AEIcKtj0aThD+0nE8b3gIz9NcqH
         aEf3QWQpy8vLr7GGbUqMk7WTyA7AH0RcWEN9JnUH5twhPm8tq/gAOl2OVVI7DVfwu2YT
         D5ow==
X-Gm-Message-State: AOJu0YySx/WHvZ0+zG9a9Pbxwg9AaPTRnTICgqa/yDMWsA443qHLbu7s
	nrA3NS5Mmi2r9WzwP5dqsNyTMu8xfJ6uewY/C+0JpO0aGRC1nlttapwF2feqfjJPimnLAhjm2fM
	LBHQ=
X-Gm-Gg: ASbGncsQmXhsi9/hY/Av1n4Btu1onSbVBmw/fXTvTd3HLeUGCnVWREJaIXUITSO1IM9
	/uZjoROlzaLjNAkuzqqIieYkLpiqzYG00ODbSG5oteTApcjGRtBNayha0U7Ne065sKMUyM9+I8t
	1c8hOGNgvLNJqoLst+/WoxoqBZ2VjjnKS4WQLVTMPzWpLQAn7GdMivSSACW6V800t2Df78ve5Ee
	vYy/EZLSFbsMVWxMMFgzOcxIaChTH0v2+DifKg7MZ1iKwypdAexrCoMgkIuvB5lhgXeQIsCRfaP
	Hh8ZC7I8v6i3hvxJ3ov7GTfRi10tyepK86Ptz7EvIRIvfYCFOV/kYkkuH9G4sXzmue3nV1NiB5o
	r0bp6Yi8qIH6+U0PwzejY2n55wGdn7LYwLxClDvzfvGGVxqw980BwSxwBv+3LaAOB9zsMdmFu9m
	cockKUE5xZ1UnzHokCHuI8d0MfqLNFDNYMRzg5j+QTUC6z58guQYDfB1BN35LwQztJzmUr8rth+
	58=
X-Google-Smtp-Source: AGHT+IGUo5krvOHlWHuUrqWM84LfzTSr6Moq/i3I5gjCmPghpd0wOiBERWwyIY2Iuav9MBJxMqbuuQ==
X-Received: by 2002:a05:6000:2585:b0:42b:2ee0:569f with SMTP id ffacd0b85a97d-42cc1d0cf1emr13037823f8f.33.1763987396439;
        Mon, 24 Nov 2025 04:29:56 -0800 (PST)
Message-ID: <f43e5d5c-c095-43c9-814a-ca063c503d3f@suse.com>
Date: Mon, 24 Nov 2025 13:29:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/4] x86/MCE: restrict allocation of thermal and CMCI
 vector to BSP
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <5ac2e9b1-81f2-41d9-8f05-d546a49c43a7@suse.com>
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
In-Reply-To: <5ac2e9b1-81f2-41d9-8f05-d546a49c43a7@suse.com>
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
 


