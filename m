Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C432CA6EA41
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 08:18:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926052.1328905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twyYB-0003xY-1t; Tue, 25 Mar 2025 07:18:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926052.1328905; Tue, 25 Mar 2025 07:18:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twyYA-0003vt-V7; Tue, 25 Mar 2025 07:18:14 +0000
Received: by outflank-mailman (input) for mailman id 926052;
 Tue, 25 Mar 2025 07:18:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RPpQ=WM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1twyY9-0003oz-L5
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 07:18:13 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5011c108-0949-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 08:18:13 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ac25d2b2354so874099466b.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 00:18:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ebccfae4casm7176205a12.34.2025.03.25.00.18.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 00:18:12 -0700 (PDT)
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
X-Inumbo-ID: 5011c108-0949-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742887092; x=1743491892; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YzGPiON2y3NiZ52lxi6U1xktGB3tDjpAH9Qs2LgO9NA=;
        b=PTlFyUA6/Vt4R3gq0ZWJ5hsF9XHzvd4DgpNOkCtqmADYXUNT5s2ic+7CE8hrF0DQ7e
         sN7NCT1E7UnnTFgDO+VdXBejDmi6X+xdGWxtuipgMd2to23LzcRuHJJuZO2yuTLAJ/wB
         lDfFcpJEaqDLWbMiJ8qqByZ6phbdmo8NAjL3yNMPC9d+fZAQNBA7cmyhVwr+fJ3L1IDd
         DyU5/nZvHlR9OC5nPsppJd/0r2/WYUorVyBBEdqTEyjultlrwiQhRq4MTNgYjv7cC1L0
         v2LPWQwrp44n5YY1TmxCEKZamDHZazqFPRw+ryxYVfiswOyYA9fkpqgVtRtWJQjm1K4M
         9qCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742887092; x=1743491892;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YzGPiON2y3NiZ52lxi6U1xktGB3tDjpAH9Qs2LgO9NA=;
        b=LtN6h/hMY0GrYpSrvYHyBC56ANtg1hkHQkjLKGZ2caoJLHmJGXezNXY670tgVXdvOT
         wohorJz/af8VeCNN5MeI0LeH8mr0YZ+f9y5UXX4H2bhfJsLbGLZ+61xsmduZ3QGKPDYS
         sVmg69xfuPfse8fGTyBzlEmvRHvPx2xUvZtM1EtinWCilLm29T61CgFMm7l6wIxX/iaz
         m3fFdJp+BrR+LF4zcJ0nlSOF4ah70QjCERFpo1aXsGYdQbDIP2WrzwatSwosZ0qLqUb4
         Hum9b2KxS47dGOCT2/5IGNCJq8+UbKyW10etTOtfjuSzphryERk7hhLMZZnNUYEv7AjL
         u6Rw==
X-Gm-Message-State: AOJu0Yzc3KsmjwV/Auc0HJhk+b+IQ6tpSt23VqUyZqKbAeAU2gv8DpSA
	dmopsXaAlqlKF9V3JYlMjL8Gvm1J/7yfkiIL0mu5dl6dh4E8DqQDT8kCN1Cu9jBvW0hhfKF1R2c
	=
X-Gm-Gg: ASbGncuxdwRFGcR//qJ9DHRqAQFUh8KZvOKJgzIwkNTelNIWNVZh+zor8D3bRtpJSv7
	xMSYhd4tggQuBhX5B4bnK+G92HHIoXBaBtqP+LgYpy51egosj26z4RpjMBIFCROMrU8M2M2S8pX
	LjAxcKLouaxW/I4zR7UZAJVFfYnWZTSWq8ZUWgmxAMRZODAcMpdRYa7JqzmEc0g20gPj1a+Qf8F
	7x14vIMLpPWJ7mYH0tbB1YufVu5RiIzxx9fgoe+1QMEXTaPBG/7O1lXnIpf+Z9xKTPGyPcuj0P2
	EcAGqTOysf8FelMm0Rlr4Y7jOtz63s/ioT9zh87IhHYXBiK9pgfzl4ugIeVPS9sSjnzjsUg4gSQ
	ZpTf6VEaDUnhFYa7oWSmNR0TOvCI5sA==
X-Google-Smtp-Source: AGHT+IEv8s73LJM73w8ATxo5vSKKAoViAtCvuRZEV3R0iOGROJFQjstw3rIzoJhAqFfkaHXnavrxHQ==
X-Received: by 2002:a17:907:97c2:b0:ac6:ba92:79c9 with SMTP id a640c23a62f3a-ac6ba927fdbmr208490266b.18.1742887092412;
        Tue, 25 Mar 2025 00:18:12 -0700 (PDT)
Message-ID: <edecdda9-4728-4c65-9f31-76c912a433d7@suse.com>
Date: Tue, 25 Mar 2025 08:18:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/CPU: don't hard-code MTRR availability
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

In particular if we're running virtualized, the underlying hypervisor
(which may be another Xen) may not surface MTRRs, and offer PAT only.

Fixes: 5a281883cdc3 ("Hardcode many cpu features for x86/64 -- we know 64-bit")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -70,7 +70,7 @@ static inline bool boot_cpu_has(unsigned
 #define cpu_has_pse             1
 #define cpu_has_apic            boot_cpu_has(X86_FEATURE_APIC)
 #define cpu_has_sep             boot_cpu_has(X86_FEATURE_SEP)
-#define cpu_has_mtrr            1
+#define cpu_has_mtrr            boot_cpu_has(X86_FEATURE_MTRR)
 #define cpu_has_pge             1
 #define cpu_has_pse36           boot_cpu_has(X86_FEATURE_PSE36)
 #define cpu_has_clflush         boot_cpu_has(X86_FEATURE_CLFLUSH)

