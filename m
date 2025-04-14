Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE39A877C0
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 08:09:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949042.1345693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Cz4-00012d-ED; Mon, 14 Apr 2025 06:07:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949042.1345693; Mon, 14 Apr 2025 06:07:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Cz4-00010l-7G; Mon, 14 Apr 2025 06:07:54 +0000
Received: by outflank-mailman (input) for mailman id 949042;
 Mon, 14 Apr 2025 06:07:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ezPI=XA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4Cz2-00010f-0d
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 06:07:52 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb0f24e5-18f6-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 08:07:49 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so40481395e9.3
 for <xen-devel@lists.xenproject.org>; Sun, 13 Apr 2025 23:07:49 -0700 (PDT)
Received: from ?IPV6:2003:ca:b71f:2f7e:1407:af3a:2658:6d8d?
 (p200300cab71f2f7e1407af3a26586d8d.dip0.t-ipconnect.de.
 [2003:ca:b71f:2f7e:1407:af3a:2658:6d8d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f20625eeesm167994425e9.11.2025.04.13.23.07.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Apr 2025 23:07:48 -0700 (PDT)
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
X-Inumbo-ID: cb0f24e5-18f6-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744610869; x=1745215669; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8t06gzgOdTWoDSQBxQ3cADg37uy5aKG+WMTtTlbS5sw=;
        b=EcmGU2kaqANNsR9PdAmWRgL3i5v2PIRXTDav2/txU8POaupylKNJyn+zrw2WgYkjl5
         uAZNcCF/k3MIv7EHcEvTlsLgTZsrtGHnNgCNHjDFvJ0g0KfAiPl35ygwhUtdbFJq2Von
         Mo1m+0SYRlKAG9O8Cg/6nFKnDjLFnVaysLYPQsSWlzYdhj1Qwb4c9sbHqp8b80mKnusg
         PjgpLmWyNX3Jq620ia0RLnU/ujDfWY2bbaS4QiS8t7n/fCHPYfIpfBk1zStvVGUIpvnL
         DqxReOMoYTAnxnaff3V93HLOeY1+3HCwPnevfYtCT82IaxRWCEHXYabeIy9riwpbw+5L
         r03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744610869; x=1745215669;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8t06gzgOdTWoDSQBxQ3cADg37uy5aKG+WMTtTlbS5sw=;
        b=uO6wi5ow4H6dRKjciBhi/y0Tx6qE2HX4XvmFD4JwQMoDRmU33/Ojb2QYiUs5+mnGwp
         b9aUSdr+a4C039u609gnZoIDSXhkf38vI2ZLjqKjtHw7t2YLA4SWUz1wME/ZL7InXSZ9
         I26AqSE35dMuGxROZt6V74BuEKZ0vNmUH2wl21U9NDrgI+QJW5n5VxUNtzzPJzblut7f
         XdvCLEi/T3HH68/zq+qFY/VdZJtSNqUABOBEa3k/9iK/X79ypoSBEk+GvGWYoqmnUZTD
         mn5yWOT0aCp1v2eTMpIP0rhvuY2YDOe0G9awUIFLvB3aTkluI9VuRm+P0evnXg5+hKZ5
         LPkA==
X-Forwarded-Encrypted: i=1; AJvYcCUNbxoadmXtOHF/KEU+VM5W41LqzbBGfqCNcumThupSl5+joEyOgEVL5t/FfylmkWeqZZwkAsjpSwQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwF7G5H7VlwG58OlOdojSeeHkGPoGTzc6BnEAW9UI38b0AdBd9a
	SMJd3bWVFrdG4HEG06urdja8j/oAjqfW+ZrCq/U2lFWcWEjz4UjJKyupXpmH1Q==
X-Gm-Gg: ASbGnctBtXyG8/QQqnG+oNfywEQT7UOLIzoa3MgIsWg0Q/FJ9OPij142xXAj35NmgVj
	B/NfM/Wil0jwnjpJhhPMjLkoCeW6deUcDWt1/JbADrTBw7JcwufmV0fQkDe3Dh0DIeXGauj5Qhf
	sC/j9wZHpFXZWdUtOJMIu7bOyr9WQw3Ur1Q8avV4DqOPfWx1nCGo9XQyPOJgtwy3R562Ah/OqF4
	x/4Uhj3ZvLdqtI0Vte6kfgPOhB0S4YNvYrjOBpsevO3yXFr3R0LmbbBuYF6PAd4Rlj6E4Ya8bkx
	T751GSiKLw50aEt4xAOpamCFV2Ievq77D/li2ubY5EtnyUGFCxgTIe++4M50BlGElHwRTRwucoA
	b4xtyoqLhJnHqLd3D1TqUU4fD07VZY51VYVruP0wM1mMeqwq2HWZwuEJEg7gKURXzZ0P0nVkOKd
	4=
X-Google-Smtp-Source: AGHT+IGsNPqZtkQYEbSRCEZfNfinEETszg6Pg2OtzlnimGPemBjrztXckh3Gg+TT3gvO271mS8LHqQ==
X-Received: by 2002:a05:600c:1d08:b0:43c:fe9f:ab90 with SMTP id 5b1f17b1804b1-43f3a9aefc4mr68691985e9.28.1744610869069;
        Sun, 13 Apr 2025 23:07:49 -0700 (PDT)
Message-ID: <bd77106c-7e5c-4e6f-98f9-faacf4f9deef@suse.com>
Date: Mon, 14 Apr 2025 08:07:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] xen/io: provide helpers for multi size MMIO accesses
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250411105411.22334-1-roger.pau@citrix.com>
 <20250411105411.22334-3-roger.pau@citrix.com>
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
In-Reply-To: <20250411105411.22334-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.04.2025 12:54, Roger Pau Monne wrote:
> Several handlers have the same necessity of reading from an MMIO region
> using 1, 2, 4 or 8 bytes accesses.  So far this has been open-coded in the
> function itself.  Instead provide a new handler that encapsulates the
> accesses.
> 
> Since the added helpers are not architecture specific, introduce a new
> generic io.h header.

Except that ...

> --- /dev/null
> +++ b/xen/include/xen/io.h
> @@ -0,0 +1,63 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Generic helpers for doing MMIO accesses.
> + *
> + * Copyright (c) 2025 Cloud Software Group
> + */
> +#ifndef XEN_IO_H
> +#define XEN_IO_H
> +
> +#include <xen/bug.h>
> +
> +#include <asm/io.h>
> +
> +static inline uint64_t read_mmio(const volatile void __iomem *mem,
> +                                 unsigned int size)
> +{
> +    switch ( size )
> +    {
> +    case 1:
> +        return readb(mem);
> +
> +    case 2:
> +        return readw(mem);
> +
> +    case 4:
> +        return readl(mem);
> +
> +    case 8:
> +        return readq(mem);

... this and ...

> +    }
> +
> +    ASSERT_UNREACHABLE();
> +    return ~0UL;
> +}
> +
> +static inline void write_mmio(volatile void __iomem *mem, uint64_t data,
> +                              unsigned int size)
> +{
> +    switch ( size )
> +    {
> +    case 1:
> +        writeb(data, mem);
> +        break;
> +
> +    case 2:
> +        writew(data, mem);
> +        break;
> +
> +    case 4:
> +        writel(data, mem);
> +        break;
> +
> +    case 8:
> +        writeq(data, mem);
> +        break;

... this may (generally will) not work on 32-bit architectures. Add
CONFIG_64BIT conditionals? At which point return type / last parameter
type could move from uint64_t to unsigned long.

As to the top comment of the file: io.h is, to me at least, wider than
just dealing with MMIO accesses. IOW I fear that sentence may go stale
at some point, without anyone paying attention.

Jan

