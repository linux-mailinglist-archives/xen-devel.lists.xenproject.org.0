Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE58BAD3A9A
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 16:09:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010990.1389262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOzf3-0007MP-4a; Tue, 10 Jun 2025 14:09:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010990.1389262; Tue, 10 Jun 2025 14:09:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOzf3-0007Kk-20; Tue, 10 Jun 2025 14:09:09 +0000
Received: by outflank-mailman (input) for mailman id 1010990;
 Tue, 10 Jun 2025 14:09:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6UIy=YZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uOzf1-0007Ke-4r
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 14:09:07 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 736fbc39-4604-11f0-a307-13f23c93f187;
 Tue, 10 Jun 2025 16:08:58 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a536ecbf6fso2336721f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 07:08:58 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b49b:5992:e13c:c106:5fe0?
 (p200300cab734b49b5992e13cc1065fe0.dip0.t-ipconnect.de.
 [2003:ca:b734:b49b:5992:e13c:c106:5fe0])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a532436668sm12592509f8f.54.2025.06.10.07.08.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 07:08:57 -0700 (PDT)
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
X-Inumbo-ID: 736fbc39-4604-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749564537; x=1750169337; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F9CeBZObUAuzVxn4kdm5rVCoM3RplIXj9ZSWP0CUGk8=;
        b=ECHzlzi11nv54aaazN9HGRtLSLP3mZ2kMHfMU8hbSC8c81FFuUrKqKpXbxgddJw4g7
         Q2cGy0l9QaB5/9E0/kiz98FnYVtC+FT3GflwLpW0Y/6wVXHTaCZ8gdxbQVWQLIhiOgGY
         kTqEehGXMntQVMHHGvTnI8tCrpbFWm8lH0JM8H1w0OcXC06RZIYrqOrIwI8ZG+NuE975
         d/6dMKn/WWbn5oCH0m613bM0Mdgmy5v0PRuWMi00Cq1I0AzphR4+gMtQrg5/QXDC756k
         DpMhv4WzZmVkV3Z6/P+RgM0vwWJQpOSF0o8YUbWvAaiYQi+b5kIbRgO1xScmpYg3kA0W
         FrRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749564537; x=1750169337;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F9CeBZObUAuzVxn4kdm5rVCoM3RplIXj9ZSWP0CUGk8=;
        b=oIogjlv7IQ6b0mvSgorUQveGRZSmy82VdBjOOQtfnfsDUCrXdEAEDDyyt+R3t5I9Vh
         iRPXvOEek4S7GXzUfPSzZ9gtTceJb9kB3QyN9Rv1yiaIC8UBkwk53iG0Ze9GFEk298kP
         0xryAv/A4BfWvDrnYDlksREnpFJub5ipsOgWmfF4OmD5qUyzDqrDrqzgy1L1NvbAtBHQ
         A2HKXoDz1GE3k0BlwEv8ykDKE7m8S/iEKoyUaUiJIGnsYUFL7dT/wkUCfZyGewJLXJjc
         4wqkDlQPNhQ4rwmXn+JsHTgDz8KxWdr6OWsOTBA9wkwraT2Izkrgppou/v/TNReLnbpS
         2UgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVaXfNhH7G9qL2AF9s/m2oLjWy9tnDCPhG+xj4lyahfo6dHc+FohyaCYf3qPPGurJdG4JJawpGPQ0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJYpi78PWs/IHKiOq825xkz/h4wFsUZW+MHAu2ck3iv2Q+XVYw
	+Ymg3h0ls9xfzCqbsEFkf1q3x/Z+nFxzi4n9pENw1/x1fwTouAjMLj8usdXbAbM2Bg==
X-Gm-Gg: ASbGncvBsiyTDcTlDXSi6XSe1+1l00kU2dX1f93xYBC6SzxxwXzJFwfCZDphVYWskN3
	hkRKGwM8EaCXEx94H+KjyWQHFUUrvMGxz1xsGkMjCZMjAkjxQNYxdZZOXIzYr7e4aKXCLQmFMot
	utLBp20D/ivUMpEcI9SImvgtA/dJW0lIZYkurRM5rWzY3R2NYM8w03O0EuQTQP+NHBRsoNqNxo/
	JL1Q7XD+Vd06qMpnRtbBzj/uJM3Dp+RLKExx9ql5g6Yv/cykStwnHmiEMVZNbzg838GGuYq00Nh
	4njGwLG03qf701+cLrd0IAzVAt6uaAFZB4scqYXnPiWOh/YxPFgUL+Ph6lfl9x1/TZElt7MhCro
	oyzRpqdt3lmzLyoZAYPRa08Vpu35LkPqyHMG3/2d9pEOX2pltpXJ/u0yJKQ5xovYlJdJjQkhaxU
	bWSI20hpcuDiQ1k4kiMt32
X-Google-Smtp-Source: AGHT+IEsYCHMAKKxb62EDmD0ynVIQ7sEu0G8PUrA/p6Kzs/Zobi2sfZxAvurhyLIICx6Tst5NGqGbg==
X-Received: by 2002:a5d:4447:0:b0:3a5:1cc5:aa6f with SMTP id ffacd0b85a97d-3a55229bddemr1857281f8f.34.1749564537393;
        Tue, 10 Jun 2025 07:08:57 -0700 (PDT)
Message-ID: <6fe24545-1f76-4f3f-84bb-b0f8e225ac7b@suse.com>
Date: Tue, 10 Jun 2025 16:08:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] xen/riscv: dt_processor_hartid() implementation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749121437.git.oleksii.kurochko@gmail.com>
 <751343d295c0fa6a9a7d8f2265ece3faecd44b64.1749121437.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <751343d295c0fa6a9a7d8f2265ece3faecd44b64.1749121437.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.06.2025 17:58, Oleksii Kurochko wrote:
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
> +    unsigned int max_cells = UINT32_MAX / sizeof(*cell);
> +
> +    ac = dt_n_addr_cells(cpun);
> +    cell = dt_get_property(cpun, "reg", &len);
> +
> +    if (ac > max_cells) {

Besides the (double) style issue, why's this needed? Can't you simply ...

> +        printk("%s: cell count overflow (ac=%u, max=%u)\n", __func__, ac,
> +               max_cells);
> +        return ~0UL;
> +    }
> +
> +    if ( !cell || !ac || ((sizeof(*cell) * ac) > len) )

... write the last part here in a way that there can't be overflow?
ac > len / sizeof(*cell) that is? (Remaining question then is what to
do when len isn't evenly divisible by sizeof(*cell).)

> +        return ~0UL;
> +
> +    return dt_read_number(cell, ac);

What meaning does this have for ac > 2? (As per your checking above
it can be up to UINT32_MAX / 4.)

Jan

