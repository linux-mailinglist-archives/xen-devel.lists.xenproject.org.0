Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7557783AD23
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 16:21:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671086.1044231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSf4F-000632-Ss; Wed, 24 Jan 2024 15:21:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671086.1044231; Wed, 24 Jan 2024 15:21:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSf4F-00060G-Po; Wed, 24 Jan 2024 15:21:31 +0000
Received: by outflank-mailman (input) for mailman id 671086;
 Wed, 24 Jan 2024 15:21:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bgOV=JC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSf4E-0005y3-R1
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 15:21:30 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3eb6add8-bacc-11ee-9b0f-b553b5be7939;
 Wed, 24 Jan 2024 16:21:28 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a2e0be86878so1248754366b.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 07:21:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g14-20020a056638060e00b0046e80c50d73sm4012598jar.22.2024.01.24.07.21.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 07:21:27 -0800 (PST)
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
X-Inumbo-ID: 3eb6add8-bacc-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706109688; x=1706714488; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NHbry3mGxalDD+ohiGv55543evF0oBb72dJrX/9cbxU=;
        b=g0eQMNi3nwJak5DAYfp3KYdYGMj/TDMcShmuUo6tVFcp5+x+6flM41sYK6QX1Zr0V1
         vszjOQXt7YxOHh6uD7TKZ2LGeIJZRzx8hdzslB+NQ8TyXO1fcIQfjtaaxxaGbmYN3wOW
         mmHEiqOJNvWVBMHU4/nmjrc/bO/Px99Je8wugYyRgV6NhNQbVI/xKeX7ZNoL8d7sOwOx
         /S5Wnl+BS0is995wZ9TNv2S90K0cCl1D2NyGJa773SJM82vwjnKeYxL5j7PLhQZvM4Yw
         2G07mZhFEvUzPJ0ns0GV/PI6QivjLaxrm4zf77zsCtKTcWcQUVFJrQJpxiJYDAeI/xnH
         laSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706109688; x=1706714488;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NHbry3mGxalDD+ohiGv55543evF0oBb72dJrX/9cbxU=;
        b=RCfAECMgoyYD5XhH/1sdNA28oO9uvfGtdmmLEm3bOzUct1RfZFW6NgjjDjPEkxxzIu
         kKMM7mybEzDP4gWJqewW4k+sv13aws7kxqTIWANe2WJoV4efq7VYrJ/2cBqoSRvHeY2n
         qWpQVeIz9WdG5XgCdnKnXGkBqPrNwswoF7uK/3GYF8oix/c0/ahYNTz2jLAkP3O3gnmq
         gg5oYhgLmoWzRknqbBM0peWkKIGh88m0hTpbT8xBR+eCUfHaNaffGAdJn1nSb931ktIU
         2KYhxDQUykB3bZe9dBJgiXNH6PP0ZptnlzCpKiavTAJykZ0b6YKLSdvglgTaSX04QWww
         PhOg==
X-Gm-Message-State: AOJu0YzMRd47w9sAjgzrUQEJXvhLXWjnnDrbl63e46xBT7LDgXdWS59z
	kumecMocX/6e1IwZdmrlx0K+F4mE3zdJ9tnw5BY3OFMzk4A+xaRcUOU5dvrKxxh2fyAOirIvN6o
	=
X-Google-Smtp-Source: AGHT+IGFAWesxPFXDEhnQFwicGj5Lqr8yL+IrGWtPHfdfw/eLrxDtZeWMLnBeixehsMhO4ra2PppNA==
X-Received: by 2002:a17:906:51a:b0:a26:f7ea:7cb6 with SMTP id j26-20020a170906051a00b00a26f7ea7cb6mr1539539eja.16.1706109687954;
        Wed, 24 Jan 2024 07:21:27 -0800 (PST)
Message-ID: <87108f1d-4b13-4c1e-9432-4f14d4f5c12d@suse.com>
Date: Wed, 24 Jan 2024 16:21:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/NMI: refine "watchdog stuck" log message
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

Observing

"Testing NMI watchdog on all CPUs: 0 stuck"

it felt like it's not quite right, but I still read it as "no CPU stuck;
all good", when really the system suffered from what 6bdb965178bb
("x86/intel: ensure Global Performance Counter Control is setup
correctly") works around. Convert this to

"Testing NMI watchdog on all CPUs: {0} stuck"

or, with multiple CPUs having an issue, e.g.

"Testing NMI watchdog on all CPUs: {0,40} stuck"

to make more obvious that a lone number is not a count of CPUs.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
In principle "sep" could also fulfill the job of "ok"; it felt to me as
if this may not be liked very much, though.

--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -167,13 +167,14 @@ static void __init cf_check wait_for_nmi
 void __init check_nmi_watchdog(void)
 {
     static unsigned int __initdata prev_nmi_count[NR_CPUS];
-    int cpu;
+    unsigned int cpu;
+    char sep = '{';
     bool ok = true;
 
     if ( nmi_watchdog == NMI_NONE )
         return;
 
-    printk("Testing NMI watchdog on all CPUs:");
+    printk("Testing NMI watchdog on all CPUs: ");
 
     for_each_online_cpu ( cpu )
         prev_nmi_count[cpu] = per_cpu(nmi_count, cpu);
@@ -189,12 +190,13 @@ void __init check_nmi_watchdog(void)
     {
         if ( per_cpu(nmi_count, cpu) - prev_nmi_count[cpu] < 2 )
         {
-            printk(" %d", cpu);
+            printk("%c%u", sep, cpu);
+            sep = ',';
             ok = false;
         }
     }
 
-    printk(" %s\n", ok ? "ok" : "stuck");
+    printk("%s\n", ok ? "ok" : "} stuck");
 
     /*
      * Now that we know it works we can reduce NMI frequency to

