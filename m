Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B07ADAA52
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 10:09:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016835.1393772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR4uO-00084v-WF; Mon, 16 Jun 2025 08:09:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016835.1393772; Mon, 16 Jun 2025 08:09:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR4uO-00082X-Tb; Mon, 16 Jun 2025 08:09:36 +0000
Received: by outflank-mailman (input) for mailman id 1016835;
 Mon, 16 Jun 2025 08:09:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jh7D=Y7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uR4uN-00082R-VL
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 08:09:35 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c98f501-4a89-11f0-b894-0df219b8e170;
 Mon, 16 Jun 2025 10:09:33 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-60702d77c60so8929894a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jun 2025 01:09:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-608b4ae33acsm5642549a12.72.2025.06.16.01.09.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jun 2025 01:09:32 -0700 (PDT)
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
X-Inumbo-ID: 3c98f501-4a89-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750061373; x=1750666173; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zZfHtjkdrYYmA9/heTYtJ0Yl/vLIy6strWdx3GoU9Gc=;
        b=cFyVnLP1722aaQuYF9uxlgkWTKj+5lHHqaoQILEs/ZfWfBJ7twJ28ocVfby/8c7j3j
         l8MjF1A7KJOYLnOt3R4lbQk7wR8U+OsULFT2giE5gH5h9Sbi31dI7AU91Su2GWFCL5DF
         gB4vEN82QeJ5UvvTeE9Apb9y4TrsVVFKNpcPwrbftZ/N7NK55f4LRv/61KwciXWDoUCR
         CuDMzz06VTXYtvBwN3iDrKd8jr8xqUZGh8H6HLCsuz8RH3DUEq4NQWN6qubWmecv8l6m
         fiSkStdTQEkdAhqP9SEzcfPpWNtmEcvBqTBeh6cfClJgW/7dathzRbByFaMsuQ6HTft6
         P00g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750061373; x=1750666173;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZfHtjkdrYYmA9/heTYtJ0Yl/vLIy6strWdx3GoU9Gc=;
        b=E5soYm1jAnPVc+FEfUYTZb0Q4n7Ij8PJ0RZrI7ZisbknrghEqiizMnFcIlwfDHoNiV
         K7+rk3JI7bxsikFajOFKAiFcuEHHUW6277JkUGY4eKpuhDwJnxFK4S2rkXSxtu5ECSQq
         xtFqAdl8HtBKPYMH0gPYbRKkrZhVNL3C/d2FlYVHDmqwipgF8XHWee4Ev0j0cLtfDInk
         zy2b2/USqJ2XPG5zP+V7LbZZS04yieFdXyXQ5Lz61WmlZ7pnjIMTVK2zlpCmkKCzRV6H
         uO+QqfE7XyVCL2IndU6CaDhbsI9Ua8uS8vNpEpe9wzucmvtUuMWNdgiP/nZmXDPZv93D
         gmgA==
X-Forwarded-Encrypted: i=1; AJvYcCUBgUACGHiVNaoDfm+A8CA3FhldoxQO7gcaeWkdL6IvZjkItfrMNwiCORdToZa3bF9bZtnDQBPrfoE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOeO6nxNhhTL+j+OrQuARWG+C4aLHv8E0AsbqPsdtVcBNwQdTh
	lRzClu3mTrpiDS3aKRnzvQ/tloMe4/MR5+54KLz1lTr90T7z+cEjSJrCOOvpXRiYpg==
X-Gm-Gg: ASbGncvBFZbXAgu8j//BoA8VacP4giEQwEieSonNlAI4IbJQk+xqfCeMBPpiixOG/h5
	PypesWZRxCUFe7NIAXpsbM3x2QaFV0+Qnr4EpXAZ+qBYMfiafkzjv/Z2j9IT1fAFlvAYbZT0WVO
	TYK9tbf0OUBPsd+cN5XlA8vnQRpHF+oK7d1/3Et3bYQ+wIvFmL02Sc/OAxdYbm3eKG/KjJDG6Gz
	090Ioh+jsBLW6iOkqPK1xwsHM3PzSE/8/NRLeV8ojxyeveNWWLpIAcf2T+gMYEmoKMhEY1U7xx3
	3et/m8wV9iJQrwudOCciCTcL+Mciobmfwxf1VierQ85HzqB+gV2pVBqNR+XjKw6ch1qv7EVYEZI
	jx3Mih8XOF/ZgkOJt6uEusiUtTyg6rML9nNGxhlz4BXJrKIE=
X-Google-Smtp-Source: AGHT+IHHZG4vs1VM/y0jrZAygfYomS3PxI2UpN7jNa+OF9aBFw7XWH2pNe2RtYtVhV7zBeExwl2gnA==
X-Received: by 2002:a05:6402:2549:b0:602:17a1:c672 with SMTP id 4fb4d7f45d1cf-608d0861a94mr8003525a12.8.1750061373103;
        Mon, 16 Jun 2025 01:09:33 -0700 (PDT)
Message-ID: <e4826a1f-a91d-4ee4-8313-e7f7b9beb3ae@suse.com>
Date: Mon, 16 Jun 2025 10:09:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/9] xen/riscv: dt_processor_hartid() implementation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749825782.git.oleksii.kurochko@gmail.com>
 <c76d79ed590988850fd3db0c79fc7a2ec1f7f078.1749825782.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <c76d79ed590988850fd3db0c79fc7a2ec1f7f078.1749825782.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.06.2025 17:48, Oleksii Kurochko wrote:
> Implements dt_processor_hartid() to get the hart ID of the given
> device tree node and do some checks if CPU is available and given device
> tree node has proper riscv,isa property.
> 
> As a helper function dt_get_hartid() is introduced to deal specifically
> with reg propery of a CPU device node.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>


Acked-by: Jan Beulich <jbeulich@suse.com>

> @@ -14,3 +17,77 @@ void __init smp_prepare_boot_cpu(void)
>      cpumask_set_cpu(0, &cpu_possible_map);
>      cpumask_set_cpu(0, &cpu_online_map);
>  }
> +
> +/**
> + * dt_get_hartid - Get the hartid from a CPU device node
> + *
> + * @cpun: CPU number(logical index) for which device node is required
> + *
> + * Return: The hartid for the CPU node or ~0UL if not found.
> + */
> +static unsigned long dt_get_hartid(const struct dt_device_node *cpun)
> +{
> +    const __be32 *cell;
> +    unsigned int ac;
> +    uint32_t len;
> +
> +    ac = dt_n_addr_cells(cpun);
> +    cell = dt_get_property(cpun, "reg", &len);

I'll commit as is, but I'd like to note that such could be more compact:

    unsigned int ac = dt_n_addr_cells(cpun);
    uint32_t len;
    const __be32 *cell = dt_get_property(cpun, "reg", &len);

> +    /*
> +     * If ac > 2, the result may be truncated or meaningless unless
> +     * dt_read_number() supports wider integers.
> +     *
> +     * TODO: drop (ac > 2) when dt_read_number() will support wider
> +     *       integers.
> +     */
> +    if ( !cell || !ac || (ac > 2) || (ac > len / sizeof(*cell)) )
> +        return ~0UL;
> +
> +    return dt_read_number(cell, ac);

I'd further like to note that this will silently truncate from 64 to 32
bits (when ac == 2) for RV32.

Jan

