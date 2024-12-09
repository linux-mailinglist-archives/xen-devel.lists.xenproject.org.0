Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7041F9E973F
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 14:36:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851367.1265451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKdvR-0006Pi-IW; Mon, 09 Dec 2024 13:35:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851367.1265451; Mon, 09 Dec 2024 13:35:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKdvR-0006Mq-FC; Mon, 09 Dec 2024 13:35:49 +0000
Received: by outflank-mailman (input) for mailman id 851367;
 Mon, 09 Dec 2024 13:35:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKdvP-0006Mk-Fr
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 13:35:47 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ec8eb76-b632-11ef-a0d5-8be0dac302b0;
 Mon, 09 Dec 2024 14:35:46 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-385dece873cso2028688f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 05:35:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725a29caa61sm7493656b3a.38.2024.12.09.05.35.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 05:35:45 -0800 (PST)
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
X-Inumbo-ID: 7ec8eb76-b632-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733751346; x=1734356146; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Oym1n1gz6oYIDqjTLUGh0T4ay/Ij7gdHT1riqSgfr5k=;
        b=RIW4asfFLzvV4vf8o1Keri/WvU4zueGkiUBMK2c5eGsqMkfJESnuB0fg17Glh0dFV4
         0gk6t+bXPVjqf/dOOqADcrgGvPficCFUpBmqxHAptdzEY++boGrTgYVssLz6avRzPP35
         wtuA18Igngz8N10RWka3z2rg3UyYB/qqsjqNIasmv1/NSuxXiqH0EFRuE5pxGQQJ3mxC
         CpCV3tsJSLcckumjRUywK8hNbvoKILuSssoq4CE/1MtkxETW0JIQZeSSR76KMwQ/UCXn
         Cm8fyvpDDnPnJmp9CqrZRgsCKz0fthzZGAOUgfRZX02CBovM2JRBNyZcMXTaKXExIjBW
         s8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733751346; x=1734356146;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oym1n1gz6oYIDqjTLUGh0T4ay/Ij7gdHT1riqSgfr5k=;
        b=MHCvjvCnFwW4VW55EWdZzx5AnzHKnC3s129VgXufQMeV30Ep3DOSpqe0WCYMULLOo9
         IeM7EjkcieTb9JCX/qOqQPZ9DfZUchXLe+8hLsQbCPiY4vpymGwX89xAmOb32o56Fibl
         h/at/9UPPFQeRz+mRII1ILqwy1LNcabOkNWfEvED81vxgaJNORHxX2DqUOdqFF8zcOcO
         tV+kvxpHPm3onGUcHIkRsK1gyJnhCk2smvFAiV0daY2JUXW4ihdMr3qxhATdvzqXC0zD
         W3++4Xi4BoI/EmNBDzooYdVgFD6JE2niXMmZY83acUW3kA6xh2Sq9uxnGHv16+VJZLe6
         JGiw==
X-Forwarded-Encrypted: i=1; AJvYcCXmXdkNWg+kB9P9fFRGOuOubtDS89zXKbPn9DNkUAN+dvmCk0BZVn8dOehht35VZh+tqwV95xraChI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyMIQNvE8u7utJH5H9xwfha5wKQC6p62+Rn91o1TgYImquBVeZy
	ztAxN0gzimcfylZ94VQkuPXay7MKj6PE1h+CUBWtNrpozhkjBHkmibhDL86RoA==
X-Gm-Gg: ASbGncu79UYZxKmL6nZoWEZxJX8SDgSrgyJneUb55hVMsr9v/ojskO0O1dkuPk8p67t
	lsAknVAP6ExfMuUXkiq7kWJLNQ4Ek80l+st3xI2eyqCDLUR7m/C+WmU+7trssVGe3QWUFV8o/fH
	msNv4mG59IANmCnZ5Icfug5TL+jXLQ4T6ViZYNnYmcxD+b8gd9hKKubSzgOz/NiTgi+vxvP/K1Y
	6ogdw4+e0TQgSMkwAgWwQn2ojY3pcUTIvFNEwvm6xcY3QaV+iXL91rmL/QF5v9PpGYsWTvrCu6y
	99pRq2f/B+ORcsdX+sVybjOjw0wVwUHA4+Y=
X-Google-Smtp-Source: AGHT+IH6MQntuFB6sthY5UiB2NZIhxqe/q0bu5WnD+GRhWual/toTmrx0cj6D0GYvpuQ/TjljelTkg==
X-Received: by 2002:a05:6000:470a:b0:385:dfab:1643 with SMTP id ffacd0b85a97d-3862b378d0emr8099754f8f.27.1733751345930;
        Mon, 09 Dec 2024 05:35:45 -0800 (PST)
Message-ID: <4dff4744-8ef3-4586-9b7b-be1d42d150a8@suse.com>
Date: Mon, 9 Dec 2024 14:35:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 01/12] xen/common: add cache coloring common code
To: Michal Orzel <michal.orzel@amd.com>,
 Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech, marco.solieri@minervasys.tech,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241202165921.249585-1-carlo.nonato@minervasys.tech>
 <20241202165921.249585-2-carlo.nonato@minervasys.tech>
 <a5c7fde4-6db2-4c34-b4d2-7c5ec5a4cc0e@amd.com>
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
In-Reply-To: <a5c7fde4-6db2-4c34-b4d2-7c5ec5a4cc0e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.12.2024 10:55, Michal Orzel wrote:
> 
> 
> On 02/12/2024 17:59, Carlo Nonato wrote:
>>
>>
>> Last Level Cache (LLC) coloring allows to partition the cache in smaller
>> chunks called cache colors.
>>
>> Since not all architectures can actually implement it, add a HAS_LLC_COLORING
>> Kconfig option.
>> LLC_COLORS_ORDER Kconfig option has a range maximum of 10 (2^10 = 1024)
>> because that's the number of colors that fit in a 4 KiB page when integers
>> are 4 bytes long.
>>
>> LLC colors are a property of the domain, so struct domain has to be extended.
>>
>> Based on original work from: Luca Miccio <lucmiccio@gmail.com>
>>
>> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
>> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
>> Acked-by: Michal Orzel <michal.orzel@amd.com>
> 
> [...]
>>
>> +### llc-coloring (arm64)
>> +> `= <boolean>`
>> +
>> +> Default: `false`
> By default, it is disabled. If CONFIG_ is enabled but ...
> 
> [...]
> 
>> + * -1: not specified (disabled unless llc-size and llc-nr-ways present)
> the user doesn't specify any llc-* options, LLC feature should be disabled.
> In your case llc_coloring_enabled is -1 and due to 'if ( llc_coloring_enabled ... )' checks
> all around the code base, the LLC will be enabled even though it should not.
> 
> You can either set it to 0 if (llc_coloring_enabled < 0) and other llc-* options have not been provided
> (this would require modifying this comment to provide different meaning depending on the context) or
> you could do sth like that:

I agree the below is going to be better in terms of both readability and
consistency. A few minor comments though:

> --- a/xen/common/llc-coloring.c
> +++ b/xen/common/llc-coloring.c
> @@ -18,8 +18,10 @@
>   *  0: explicitly disabled through cmdline
>   *  1: explicitly enabled through cmdline
>   */
> -int8_t __ro_after_init llc_coloring_enabled = -1;
> -boolean_param("llc-coloring", llc_coloring_enabled);
> +int8_t __init opt_llc_coloring = -1;

__initdata

> +boolean_param("llc-coloring", opt_llc_coloring);
> +
> +bool __ro_after_init llc_coloring_enabled = false;
> 
>  static unsigned int __initdata llc_size;
>  size_param("llc-size", llc_size);
> @@ -147,15 +149,17 @@ void __init llc_coloring_init(void)
>  {
>      unsigned int way_size, i;
> 
> -    if ( (llc_coloring_enabled < 0) && (llc_size && llc_nr_ways) )
> +    if ( (opt_llc_coloring < 0) && (llc_size && llc_nr_ways) )

Excess parentheses (&& doesn't need parenthesizing against another &&).

>      {
>          llc_coloring_enabled = true;

This becomes appropriate only with the variable's type changing back
to bool.

Jan

