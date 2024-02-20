Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 622A985B892
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 11:08:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683360.1062830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcN2G-00050C-Op; Tue, 20 Feb 2024 10:07:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683360.1062830; Tue, 20 Feb 2024 10:07:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcN2G-0004xc-Lx; Tue, 20 Feb 2024 10:07:36 +0000
Received: by outflank-mailman (input) for mailman id 683360;
 Tue, 20 Feb 2024 10:07:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSgb=J5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rcN2E-0004xT-Ns
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 10:07:34 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd102e6f-cfd7-11ee-8a52-1f161083a0e0;
 Tue, 20 Feb 2024 11:07:32 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2d21e2b2245so52191971fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 02:07:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 13-20020a05600c230d00b00411d640085csm13931459wmo.43.2024.02.20.02.07.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 02:07:32 -0800 (PST)
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
X-Inumbo-ID: dd102e6f-cfd7-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708423652; x=1709028452; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ti7KMHS/c5+d834QwZjjEwyyFQjvBe63dd9N36vHXJw=;
        b=JQtAWtpShSeqGdG/A0/+0FFnc9w3hzhhWHaivctre4Y2HFSnKS88FVCQ6qsy2Y46I/
         aEng2tffF3Z3sTa+KpD/9c2rXh15KJ2bfMkDdvoSKbv46qrbMBJic+7qrAnfbyGGG8JQ
         jKclsawqZR66Zdsd0o4/qMPsg0SLAUC5rMFpEHnS2BchD4P8myxdt/UCbqvRLiUZpUjF
         D8MboqYV6uMzdcxUiiBUC/x6jde+7IPkqH5+ZlMw+3Y3s9hCmnTf2ej9M+XS/Tyt907+
         4pSMhrr91oweAp5Vwf8EVY18y++FdAY47FX4r3Zj/UB3zmB2dfhbFvExGL2EzglBwAcJ
         rB5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708423652; x=1709028452;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ti7KMHS/c5+d834QwZjjEwyyFQjvBe63dd9N36vHXJw=;
        b=mBvLgGXK56d8JNU/XKlz4d2UNEx7C7MgMiHGoFICExbcjuntwzHHI6qNESRoFv5KHn
         wJ3F6FMZ3lngrlrQKmOjaSwAUFqm+9k5zhwmyMRkp2F8QaDWe+yuyOaA3fEdMd8R9B60
         CD0mXFvTna8KZ1SpZLUeoSjqL9zOGljdqLelEdfah1Ewg/MYEHfDSzSuY8NWqsf24vff
         DeFHfGXKvF99jUrBiu99k9t41WP60HOIxX/apCgGl8fUlSY9dWG/akankmqN5GaoFpIr
         E+MnvmmFWZdlW4tNMsMbr1z9yiYed9CZc4ZoYNP7KsUbORrwqK1Ugn9sSQLAt0xWrwPn
         5SKA==
X-Forwarded-Encrypted: i=1; AJvYcCVR8lTGHmtxVe07z4z/QWGNp3Xm5Xhc1X4KaPODJVQNU/avCDnjXT7Hs217qL5mB6eMResy2+sAkxSAE5Okdd0XOgaudRyrTmAFRgH3x6M=
X-Gm-Message-State: AOJu0YwNMv5cSJv2Z1StQ4UZcVE1Uk85yfP/btkKy5ZgeFW/BjqeZp11
	K14iCeHAtdsdNRnacfmoRCdcJ/sp2hzDpjPti959NKcddDwYS2FNcjmgIEh0tA==
X-Google-Smtp-Source: AGHT+IGD2VCr6iRahOO1qKyKFmIRSKz6Q5Sa0vXaV0AEAM2cO9cL18DP/9kx3i/v4ol+AymbNEYJBg==
X-Received: by 2002:a2e:92ce:0:b0:2d0:b27e:2437 with SMTP id k14-20020a2e92ce000000b002d0b27e2437mr9437262ljh.39.1708423652428;
        Tue, 20 Feb 2024 02:07:32 -0800 (PST)
Message-ID: <55d42c31-2a10-4edf-8459-66929057c0db@suse.com>
Date: Tue, 20 Feb 2024 11:07:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 (resend) 08/27] x86/pv: Domheap pages should be mapped
 while relocating initrd
Content-Language: en-US
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: julien@xen.org, pdurrant@amazon.com, dwmw@amazon.com,
 Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Wei Wang <wawei@amazon.de>, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org
References: <20240116192611.41112-1-eliasely@amazon.com>
 <20240116192611.41112-9-eliasely@amazon.com>
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
In-Reply-To: <20240116192611.41112-9-eliasely@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.01.2024 20:25, Elias El Yandouzi wrote:
> From: Wei Liu <wei.liu2@citrix.com>
> 
> Xen shouldn't use domheap page as if they were xenheap pages. Map and
> unmap pages accordingly.

The title could to with mentioning Dom0. Since it's already a little long,
the mentioning of domheap pages could be left to the description. E.g.
"map pages while relocating Dom0 initrd"?

> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -615,18 +615,25 @@ int __init dom0_construct_pv(struct domain *d,
>          if ( d->arch.physaddr_bitsize &&
>               ((mfn + count - 1) >> (d->arch.physaddr_bitsize - PAGE_SHIFT)) )
>          {
> +            unsigned long nr_pages;
> +
>              order = get_order_from_pages(count);
>              page = alloc_domheap_pages(d, order, MEMF_no_scrub);
>              if ( !page )
>                  panic("Not enough RAM for domain 0 initrd\n");
> +
> +            nr_pages = 1UL << order;

Nit: Is there anything wrong with making this the initializer of the
variable?

>              for ( count = -count; order--; )
>                  if ( count & (1UL << order) )
>                  {
>                      free_domheap_pages(page, order);
>                      page += 1UL << order;
> +                    nr_pages -= 1UL << order;
>                  }
> -            memcpy(page_to_virt(page), mfn_to_virt(initrd->mod_start),
> -                   initrd_len);
> +
> +            for ( i = 0; i < nr_pages; i++ )
> +                copy_domain_page(page_to_mfn(page + i), _mfn(initrd_mfn + i));

There's a type discrepancy between "i" and "nr_pages". If we truly expect
initrd-s of more than 16Tb size, "nr_pages" indeed needs to be unsigned
long, but then "i" can't remain as int. I for one think that having
"nr_pages" be unsigned int is more than enough. It might then still be
good to switch "i" from plain int to unsigned int, albeit maybe in a
(tiny) separate patch.

I further wonder whether it wouldn't be more consistent with the "else"
branch of the containing "if()" if instead of "initrd_mfn" "mfn" would
be used here (and incremented as we go). At which point I think the use
of "i" could be avoided here altogether:

            for ( ; nr_pages--; page++, mfn++ )
                copy_domain_page(page_to_mfn(page), _mfn(mfn));

or something substantially similar (e.g. re-written as while() loop).

Jan

