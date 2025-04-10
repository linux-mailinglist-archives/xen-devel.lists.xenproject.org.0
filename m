Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C249A846F7
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 16:55:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945867.1343952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2tIt-0006T2-As; Thu, 10 Apr 2025 14:54:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945867.1343952; Thu, 10 Apr 2025 14:54:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2tIt-0006Qw-8A; Thu, 10 Apr 2025 14:54:55 +0000
Received: by outflank-mailman (input) for mailman id 945867;
 Thu, 10 Apr 2025 14:54:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w6Mj=W4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2tIs-0006Qp-8U
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 14:54:54 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c137c8e8-161b-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 16:54:51 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cec5cd73bso7332925e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 07:54:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f2338d6ebsm56825265e9.2.2025.04.10.07.54.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 07:54:50 -0700 (PDT)
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
X-Inumbo-ID: c137c8e8-161b-11f0-9eac-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744296890; x=1744901690; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8kgeECv7qU2yQw36LJ4ym/kjgwi3QCF6RYMPxFIQhKI=;
        b=R20tMyHggDB/UULH0GLzlkmLH7ZtUjjhvxvBD/9+y4uvYqF4FRecZT+LigAsnKoc2o
         ZjVL2JzaoFJrrXChxdbXd02vVX3Qad1+iIS89SqzT8ILH6hdJ88N8l70jhNr6lZZFaOy
         YQXP5LAzHcA6ip0UoO1gnjPzm5ST/BheQ+ZtYk0JINEvIIettKOJjLrB+nsybImf6vYB
         wYsPUEPu8399GuGbrqVcCu9vyJ/ESQV83UVLbZ1uxsgQ1R34glwL2wPDMPOfcJC8Bou4
         H9qICaOB/lP7Qb0GhPgWNeyZCzC4QVvHQy0JFxy1ES+MxzOD04wn2iiZ2mVL1+AYKjCw
         9BaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744296890; x=1744901690;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8kgeECv7qU2yQw36LJ4ym/kjgwi3QCF6RYMPxFIQhKI=;
        b=W+LD/c+yaboNeqAReT5k8p9kDe1Pr+Fp6QFZ2+eb8IqJbf9phhtuENY/ftyD+/LXFf
         Sy+EYDQkYXYKS0ht0TKcwr6jNwB4hRXk8CIanKxA2YnCOVfNuF3sQT9taOf24+IakXf1
         TgBTKTRtFZhvEa/VqWKan8NgcR+TIjUQy0tUCY2SylLymiLvazmEoLGl2TsRXrNQOZzK
         qHIH6NJY/Obr0eQUS0QchOIzXXEGbo/YD5SRua8Coe9vzk3gxvSVamvRQUN5U3+prLqA
         Tul5KEx6vsDdcLlbRQqrUQ9W9RHVCchD8DihT4MYFo+NlFlC3qm/S4Z5lk8riaFiOTmA
         pNfA==
X-Gm-Message-State: AOJu0Yyt5z/I0wG4QF6U0n0Q4wqLKmMh+GtVeVyTHiYrr8UyhSdEcZR0
	2QGb+CRhUKxm73nSaCuPkB84zsJcIoZ93KM8JJlnzTGa+Jy0vmMn8jsm/nnsH7oOwCcyiEg06+A
	=
X-Gm-Gg: ASbGncvCG0RgaLtkyBpw/yOaX/qR2SNJ0jChtO3kcq6tiAN8W3+PWk3a3NHfXumWc/L
	z4HhvhHXg56IhHZOiJBb3hcsAO78j/bV2EE/s8YQdknkYKNzHkibPLS5TJOKEAcgLSKK3dswalp
	K08fFP3vLhdstAb29MNtm47OYbyuPFKf1OfTVWZ3hVOlaxW9tS9hFQRbsupvi1z4U9fO89zZFRx
	NkgaM5flQIn5TPVIaKc4oHrXhhf4R2jgU40dFr3BTaOSySP35cmhWlceV47QvzBYKueovZEnW2Z
	D/L+TB2XzGmNyZJMmznEiyCFPIlLtPCNv4Gr4LO8bNEQC8yqfI2YmDlJuBHGPj1KtW6BU7qcrzU
	d/01p/wkXn4u1b1YYRuUoracYx2h73Mp41Av1
X-Google-Smtp-Source: AGHT+IFOQtYzc3LE4JjUMl0WzMMMoPe7xTA1Hz7Pfr9sARpp+mtHa6Tn3vwr2RMt5xj4xui4oemryg==
X-Received: by 2002:a05:600c:3591:b0:43d:24d:bbe2 with SMTP id 5b1f17b1804b1-43f2d97d6cbmr30979885e9.28.1744296890609;
        Thu, 10 Apr 2025 07:54:50 -0700 (PDT)
Message-ID: <2bcde8df-4a11-4ec7-acf3-618576de717e@suse.com>
Date: Thu, 10 Apr 2025 16:54:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] Arm: cpu_*_map adjustments
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

First, they all start out zeroed. There's no point doing an initial
cpumask_clear() on them.

Next, only cpu_online_map may be altered post-boot, and even that only
rarely. Add respective placement attributes.

Finally, cpu_present_map really isn't anything more than an alias of
cpu_possible_map. Avoid the copying, and have the linker provide the
symbol (if needed in the first place; it is needed right now as
common code references the symbol).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I would have preferred to use __attribute__((alias(...))), but that
apparently (and following the doc) can't be used when a declaration of
the to-be-provided symbol is present earlier. 

With the cpumask_clear()s dropped, the containing function's name is
now yet more out of sync with what the function does. On x86 we call a
similar thing smp_prepare_boot_cpu().

With x86 getting away without cpu_possible_map I wonder if we shouldn't
globally fold that and cpu_present_map, under whichever is deemed the
more suitable name of the two. There's little point in having new ports
adding perhaps yet more inconsistencies there.

--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -35,9 +35,8 @@
 #undef virt_to_mfn
 #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
 
-cpumask_t cpu_online_map;
-cpumask_t cpu_present_map;
-cpumask_t cpu_possible_map;
+cpumask_t __read_mostly cpu_online_map;
+cpumask_t __ro_after_init cpu_possible_map;
 
 struct cpuinfo_arm cpu_data[NR_CPUS];
 
@@ -111,8 +110,6 @@ static void remove_cpu_sibling_map(int c
 void __init
 smp_clear_cpu_maps (void)
 {
-    cpumask_clear(&cpu_possible_map);
-    cpumask_clear(&cpu_online_map);
     cpumask_set_cpu(0, &cpu_online_map);
     cpumask_set_cpu(0, &cpu_possible_map);
     cpu_logical_map(0) = READ_SYSREG(MPIDR_EL1) & MPIDR_HWID_MASK;
@@ -312,8 +309,6 @@ smp_prepare_cpus(void)
 {
     int rc;
 
-    cpumask_copy(&cpu_present_map, &cpu_possible_map);
-
     rc = setup_cpu_sibling_map(0);
     if ( rc )
         panic("Unable to allocate CPU sibling/core maps\n");
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -206,6 +206,8 @@ SECTIONS
   ELF_DETAILS_SECTIONS
 }
 
+PROVIDE(cpu_present_map = cpu_possible_map);
+
 /*
  * The assembly code use _start and XEN_VIRT_START interchangeably to
  * match the context.

