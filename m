Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E9492CEDD
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 12:07:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756734.1165456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRUEd-0005wt-79; Wed, 10 Jul 2024 10:07:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756734.1165456; Wed, 10 Jul 2024 10:07:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRUEd-0005vL-3X; Wed, 10 Jul 2024 10:07:39 +0000
Received: by outflank-mailman (input) for mailman id 756734;
 Wed, 10 Jul 2024 10:07:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Spoc=OK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sRUEa-0005v3-Qe
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 10:07:36 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3afbabd6-3ea4-11ef-bbfb-fd08da9f4363;
 Wed, 10 Jul 2024 12:07:35 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-59559ea9cfdso1913699a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jul 2024 03:07:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fbb6a12cdbsm30040885ad.48.2024.07.10.03.07.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jul 2024 03:07:34 -0700 (PDT)
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
X-Inumbo-ID: 3afbabd6-3ea4-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720606055; x=1721210855; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VmB5VlrCruBNMysU/eqgV5A8vtRMzARwEOGBkE7ZyQE=;
        b=BCijzPEd4kRSvRIAWoqzIYUWEICZ9X67c/pAWdznf5yXU8cFArNIKfno9z9qYWmbxr
         CC9ND9SNtqm77d9RcVssBeFV9kLQ77Ugs9b0yPmsYXHgd3ayvHmQXfBpxRv78jMZdZ+i
         ts6TKZiRywJO2ZiH7bZJNNsJFOzgg5rfDknW1LJ7d+WKP1kf4dBMEUN0dsry4i2qxz/T
         A3Vpdd7u5GyXGIKk9WP520Ba4v3YkhD07FCoRbYldOpbeJDvRlZy4RuobPGvs3vvJCm1
         AnyI94ogX0HnCOrHuRIhdmnRBz0jEXHoDWdTiEmtdJ7kbZB04U74CZ3LEOh0RlwGQpc3
         XyEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720606055; x=1721210855;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VmB5VlrCruBNMysU/eqgV5A8vtRMzARwEOGBkE7ZyQE=;
        b=gcoRQP2LuBh/CUL1P+NBaZA4UVl0pa9SzGjMNLXE7iK5nIIHtQhEUNThanuODA3RVh
         kZQFp7bkaPpUE0j5Ey8NTDE4Q1aH2Wbzi7xeLFQDs08xyNEF7wdg9LSM412ya5ZDOiGB
         I2xI4tyMzQM+wZSPsnlUoxL/FYXkVU7QveURENzz0wKHWTUBMu/aZbAXOGKKz+xVrHUm
         xpERF9VYT9DcqybN7mVGyeaAmLSaQI6IXP2UxjjQpISI4jEfajtb9NkSlnULnK879eGo
         l6cFmVVp69rAyqvj0eeWdfEbukRq9RNnq4Dk5FOM7WOcWfzZqqE9e8mNvAIPKIQ+vU1S
         +ZcQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7MpDea8143v1D5VtfdvMMzdAwfZDcWtw6VaLnGPStYpQ/86kyPEhcVwv/Ly93+uqjC46cIdaUZWl7tMGo4nTjJFzFi4pMQgI4FmZ5gu8=
X-Gm-Message-State: AOJu0YwEAXn/iREloiTrnm0nhvHH0U2TybCLsmnj6oa5gJbFn6QrA6kU
	92J3+cYi6VvyX0OHGQOUjbcn3AS5hN9CEK8eGJVE/MV5nK9odZJ8Ux7hkqcsQg==
X-Google-Smtp-Source: AGHT+IEnO9ZITpKf0zKDZxK01fT7aGNwd2exsHYAD1jWYtmIjNShumFAhX50SzYeqyKZb4e1RExfoQ==
X-Received: by 2002:a17:906:1610:b0:a72:aeff:dfed with SMTP id a640c23a62f3a-a780b8826b7mr376603466b.53.1720606055111;
        Wed, 10 Jul 2024 03:07:35 -0700 (PDT)
Message-ID: <ad1b1b09-faca-4dc1-997a-a0fd56a6781a@suse.com>
Date: Wed, 10 Jul 2024 12:07:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/5] xen/riscv: test basic handling stuff
From: Jan Beulich <jbeulich@suse.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1719918148.git.oleksii.kurochko@gmail.com>
 <62cce91351f00f80cb1c7701906e2d8cd3301ec1.1719918148.git.oleksii.kurochko@gmail.com>
 <48dcb83f-3314-4091-9e57-9f757d7bc9db@suse.com>
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
In-Reply-To: <48dcb83f-3314-4091-9e57-9f757d7bc9db@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.07.2024 12:06, Jan Beulich wrote:
> On 02.07.2024 13:23, Oleksii Kurochko wrote:
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> Acked-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>  xen/arch/riscv/setup.c | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
>> index a6a29a1508..4f06203b46 100644
>> --- a/xen/arch/riscv/setup.c
>> +++ b/xen/arch/riscv/setup.c
>> @@ -19,6 +19,20 @@ void arch_get_xen_caps(xen_capabilities_info_t *info)
>>  unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
>>      __aligned(STACK_SIZE);
>>  
>> +static void test_run_in_exception(const struct cpu_user_regs *regs)
>> +{
>> +    printk("If you see this message, ");
>> +    printk("run_in_exception_handler is most likely working\n");
>> +}
>> +
>> +static void test_macros_from_bug_h(void)
>> +{
>> +    run_in_exception_handler(test_run_in_exception);
>> +    WARN();
>> +    printk("If you see this message, ");
>> +    printk("WARN is most likely working\n");
>> +}
> 
> While for the moment this may be okay, in the longer run WARN() will cause
> quite a bit of output that you don't want on every boot. The further plans
> here will want mentioning in the description.
> 
> Additionally as part of re-basing I think you would have wanted to put this
> under the (relatively new) SELF_TESTS Kconfig control.

Oh, and: Is it possible there's a word ("exception"?) missing from the title?

Jan

