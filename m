Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE3B810FDE
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 12:26:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653947.1020578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDNNQ-00016Q-Qg; Wed, 13 Dec 2023 11:26:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653947.1020578; Wed, 13 Dec 2023 11:26:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDNNQ-00013U-MH; Wed, 13 Dec 2023 11:26:08 +0000
Received: by outflank-mailman (input) for mailman id 653947;
 Wed, 13 Dec 2023 11:26:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6bXc=HY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDNNP-0000of-6R
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 11:26:07 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65ebc7a7-99aa-11ee-9b0f-b553b5be7939;
 Wed, 13 Dec 2023 12:26:03 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-55193d5e8cdso1961513a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Dec 2023 03:26:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ts7-20020a170907c5c700b00a1b65cd1957sm7638756ejc.107.2023.12.13.03.26.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Dec 2023 03:26:02 -0800 (PST)
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
X-Inumbo-ID: 65ebc7a7-99aa-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702466762; x=1703071562; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MVhMZ95mKAlr6aDCNvbsUi8vylkupgWDWrbedv2GG0I=;
        b=Z4O7u2g0lt3zrLrxmGu/DiYfNrHoRjBW3/AcGXWvq5vftWU9xzIur6sOfdK8XH3/7q
         c72s6fbjbnVlYi94ewJn/pzt11cNlld22WF76W7OQqRXtRFaac394F+vD/m/VAW7FW4e
         N6cwpzrZxLdFmJhxpw6f9VOjXOXVJqPtYcMEpYaFPVd7lSj+iKqxTT0KfwNF3yJEqczr
         3LFMEL6lr2T7Yk0QydPm3LqRBIOSS02Z/jbrQ55ra8zKvWtCz+nQ+XFpmy3fy2xXuQvJ
         jI7bmiDXs3pzGtM2pm3mFHt0XzKp1JaKtbMb8sJKnfqTH2F0AF4sQelAG6tLEJiCGVem
         44eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702466762; x=1703071562;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MVhMZ95mKAlr6aDCNvbsUi8vylkupgWDWrbedv2GG0I=;
        b=gm4T+wPoNOh6s1I2PrTiE/CWwXmariQ5Ee06gH5KXRalXdZ/OYc4WhdUmJdmckR/GQ
         HNI7/0AJqoLpixZBsxK3eIwTl43LBhNH15jSwAeeMZI50X1wrubXjaIlGt3vG+ip5EWH
         Gtkb1AjBVKloPu4w08NKUV9SqD39DzoeBicJcxS14KTRy9WyVZHXkV/kQ5UPiWQZZh03
         tSXipvkiv9nOGAsAzvXaQru7ulIBXWWPvZabXP0qicm75TFxkbyWiwt2kd3NJQKRk61i
         9aSa2EpzxWoxSOjwa2PSt3r0JJbYkQplt4jWUZyed3WpsSqkFhmLzD3YQWN5S3z5p/Tj
         +HHA==
X-Gm-Message-State: AOJu0YzqvhI+ysWyTALiCHvqdBFQdDjrdU9YFhKnozDRW4d+CkmiXzrU
	QgrhN9kWu1T92h+d6zqxdX1l+ElDcau76SXClCQE
X-Google-Smtp-Source: AGHT+IHT0CAZPqcxNSN3/ppz+SV9gI3cYozYKrzLUMPTC/lpm/ea9bFzG+005QW2YXXFAp7Y184vcw==
X-Received: by 2002:a17:906:5197:b0:a1f:8159:614f with SMTP id y23-20020a170906519700b00a1f8159614fmr3655603ejk.137.1702466762473;
        Wed, 13 Dec 2023 03:26:02 -0800 (PST)
Message-ID: <6505090e-8961-47ca-9726-0271c25bf2f8@suse.com>
Date: Wed, 13 Dec 2023 12:26:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 George Dunlap <george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] smp: move cpu_is_offline() definition
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

It's all the same for the 3 arch-es which have it, and RISC-V would
introduce a 4th instance. Put it in xen/smp.h instead, while still
permitting asm/smp.h to define a custom variant if need be.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/include/asm/smp.h
+++ b/xen/arch/arm/include/asm/smp.h
@@ -12,8 +12,6 @@ extern unsigned long smp_up_cpu;
 DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
 DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
 
-#define cpu_is_offline(cpu) unlikely(!cpu_online(cpu))
-
 /*
  * Do we, for platform reasons, need to actually keep CPUs online when we
  * would otherwise prefer them to be off?
--- a/xen/arch/ppc/include/asm/smp.h
+++ b/xen/arch/ppc/include/asm/smp.h
@@ -7,8 +7,6 @@
 DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
 DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
 
-#define cpu_is_offline(cpu) unlikely(!cpu_online(cpu))
-
 /*
  * Do we, for platform reasons, need to actually keep CPUs online when we
  * would otherwise prefer them to be off?
--- a/xen/arch/x86/include/asm/smp.h
+++ b/xen/arch/x86/include/asm/smp.h
@@ -43,7 +43,6 @@ extern u32 x86_cpu_to_apicid[];
 
 #define cpu_physical_id(cpu)	x86_cpu_to_apicid[cpu]
 
-#define cpu_is_offline(cpu) unlikely(!cpu_online(cpu))
 extern void cpu_exit_clear(unsigned int cpu);
 extern void cpu_uninit(unsigned int cpu);
 int cpu_add(uint32_t apic_id, uint32_t acpi_id, uint32_t pxm);
--- a/xen/include/xen/smp.h
+++ b/xen/include/xen/smp.h
@@ -3,6 +3,10 @@
 
 #include <asm/smp.h>
 
+#ifndef cpu_is_offline
+#define cpu_is_offline(cpu) unlikely(!cpu_online(cpu))
+#endif
+
 /*
  * stops all CPUs but the current one:
  */

