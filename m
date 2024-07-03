Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BF29255B0
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 10:45:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752799.1161035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOvbu-0007Bu-LU; Wed, 03 Jul 2024 08:45:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752799.1161035; Wed, 03 Jul 2024 08:45:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOvbu-00078x-Ht; Wed, 03 Jul 2024 08:45:06 +0000
Received: by outflank-mailman (input) for mailman id 752799;
 Wed, 03 Jul 2024 08:45:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOvbt-00078r-Am
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 08:45:05 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ab25bf8-3918-11ef-bbf9-fd08da9f4363;
 Wed, 03 Jul 2024 10:45:04 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ebeefb9a7fso57136661fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 01:45:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c91ce6ec5fsm10147186a91.26.2024.07.03.01.44.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 01:45:03 -0700 (PDT)
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
X-Inumbo-ID: 8ab25bf8-3918-11ef-bbf9-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719996304; x=1720601104; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BDCTqSs87S2kysd0+eBbmLOryx1PJ7tmmOJyFjEQ740=;
        b=XlWxVrO8JmUSAFvmQvsQm8kel0r2S34ibosBiZh43NjhzBboM1Kj6lVEQIMFW6GdM2
         19dFEgU29C6Ms0V41E42lFFUYDwKP6tOx96NlFUZAFSqsv+4ngkw3oXBlXgll/0lOd+m
         RkVfSUEU0+EgNiZFHzl0IXfATdtr6PPcwnwuS9zFpt26khUPJI6IIVGn3BNU1jnpCqcZ
         bHdRhyGtDWxi+fuerlZIQXltvfko59WSqCv5dVdVowheyOhTABSQtAQNMIEEbxlx/giA
         VKJaKB+EEJIYLn+biCFXv2FSiE2G+hNR8Hnyh2SCNyOvNOwmqhhlclb6Q7jUDUNOSaSD
         7Fpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719996304; x=1720601104;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BDCTqSs87S2kysd0+eBbmLOryx1PJ7tmmOJyFjEQ740=;
        b=ZCkomMZJCoHIpNzXQv7kW+nFQFlY8UjUm/K5af6WNe1BgdVfZllHowzR8Zaeaw01Yj
         zwVtDqI1Y0k+EnPlkUYguF0uR39C4V0QxwKzWBEYfih2xpBUjjYCDxvNqh9IE+GJ9kUa
         +vRoHNoDG7wjZu+Rl0HZj1w9HS1CVCcQ+6fmoex61xGXDfTCLEyH/SNpvBupiVJr7gmH
         rees7cjIoMKNtiEN1Q+6YopiCGuGAbbciCgiimfFx6wvRlmgh0UE8vdQsYGhOp959dwR
         mU1MIlISBVzICZwaF64sWRY8VqzqoSaw4/U/vdv/aifphl9q1ye9AW0VOOV1eXERamZV
         2FIw==
X-Gm-Message-State: AOJu0Yz+qaaTvr8xmpxh7zIa0ZZW1GLT3k7zsy+0lVJ0LbOM+J6us3Fx
	7jDk0q0XpsSAXRtDmkZmMue6TGxtejilHI55vmaFsMvuBEMEUOuKlZ22mrRubwtxjYNZ5ms++/4
	=
X-Google-Smtp-Source: AGHT+IFEwk7u3df4uuhAhO2F1q0i6rVdNomzjaSGpN+BulGdnLpCKVFksGcn1z6S/PSl9XdwtVmyEQ==
X-Received: by 2002:a2e:ab1b:0:b0:2ee:7a54:3b08 with SMTP id 38308e7fff4ca-2ee7a543b70mr19006461fa.3.1719996303772;
        Wed, 03 Jul 2024 01:45:03 -0700 (PDT)
Message-ID: <37f1a5b8-9b54-42f1-845f-dddcf0b0401e@suse.com>
Date: Wed, 3 Jul 2024 10:44:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 for-4.19? 1/2] amend 'cmdline: document and enforce
 "extra_guest_irqs" upper bounds'
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <789d567b-db3a-4c4d-9eac-f73232777244@suse.com>
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
In-Reply-To: <789d567b-db3a-4c4d-9eac-f73232777244@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Address late review comments for what is now commit 17f6d398f765:
- bound max_irqs right away against nr_irqs
- introduce a #define for a constant used twice

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v5: New.

--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -2663,15 +2663,16 @@ void __init ioapic_init(void)
 unsigned int __hwdom_init arch_hwdom_irqs(const struct domain *d)
 {
     unsigned int n = fls(num_present_cpus());
-    /* Bounded by the domain pirq EOI bitmap gfn. */
-    const unsigned int max_irqs = PAGE_SIZE * BITS_PER_BYTE;
+    /* Bounding by the domain pirq EOI bitmap capacity. */
+    const unsigned int max_irqs = min_t(unsigned int, nr_irqs,
+                                        PAGE_SIZE * BITS_PER_BYTE);
 
     if ( is_system_domain(d) )
         return max_irqs;
 
     if ( !d->domain_id )
         n = min(n, dom0_max_vcpus());
-    n = min(nr_irqs_gsi + n * NR_DYNAMIC_VECTORS, min(nr_irqs, max_irqs));
+    n = min(nr_irqs_gsi + n * NR_DYNAMIC_VECTORS, max_irqs);
 
     printk("%pd has maximum %u PIRQs\n", d, n);
 
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -353,7 +353,8 @@ static int late_hwdom_init(struct domain
 #ifdef CONFIG_HAS_PIRQ
 
 static unsigned int __read_mostly extra_hwdom_irqs;
-static unsigned int __read_mostly extra_domU_irqs = 32;
+#define DEFAULT_EXTRA_DOMU_IRQS 32U
+static unsigned int __read_mostly extra_domU_irqs = DEFAULT_EXTRA_DOMU_IRQS;
 
 static int __init cf_check parse_extra_guest_irqs(const char *s)
 {
@@ -839,7 +840,8 @@ void __init setup_system_domains(void)
             extra_hwdom_irqs = n - nr_static_irqs;
             printk(XENLOG_WARNING "hwdom IRQs bounded to %u\n", n);
         }
-        if ( extra_domU_irqs > max(32U, n - nr_static_irqs) )
+        if ( extra_domU_irqs >
+             max(DEFAULT_EXTRA_DOMU_IRQS, n - nr_static_irqs) )
         {
             extra_domU_irqs = n - nr_static_irqs;
             printk(XENLOG_WARNING "domU IRQs bounded to %u\n", n);


