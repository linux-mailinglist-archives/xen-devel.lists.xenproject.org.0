Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE1C85B908
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 11:29:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683372.1062850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcNMc-0000k0-K3; Tue, 20 Feb 2024 10:28:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683372.1062850; Tue, 20 Feb 2024 10:28:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcNMc-0000gz-Gg; Tue, 20 Feb 2024 10:28:38 +0000
Received: by outflank-mailman (input) for mailman id 683372;
 Tue, 20 Feb 2024 10:28:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSgb=J5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rcNMa-0000gt-VW
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 10:28:36 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd153205-cfda-11ee-98f5-efadbce2ee36;
 Tue, 20 Feb 2024 11:28:34 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-512b29f82d1so2839925e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 02:28:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w3-20020a05600c014300b0040fccf7e8easm13989864wmm.36.2024.02.20.02.28.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 02:28:33 -0800 (PST)
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
X-Inumbo-ID: cd153205-cfda-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708424914; x=1709029714; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=feBmHTk5QqT0alfBhak8qeu8UsMRRHWdWJtG8l7EVRc=;
        b=AjKtysfHRRoer1u25vOu0lU/US0HHnYVFu3gQuHCz5ImmA7Xyyi597xAt7WYCMpuCj
         B0IYV9x5VtSlPxSD0RJLdI+ilyhz3UbSLgginzmg3kaRFmj96ky4b9bjy5HXRg0eYkSP
         LgZq0mILs1l6vFMmpcbKYCFQGRZjj01QWtZwV5vyfR8OMGZK2wzSd/NVxd811Cfgq3ur
         i4wuUI6IYo3y6oJG93qPOQem2pbUl0kx62MV/v1712f3gOoUIKQV73YyOkmUcjN5Eoy4
         raOSAyHtFeowGWk+bTKTAzi9YmpLrQJdiJxY0ny18/238J0XYpenPuhEsBNbHqF7qXUS
         chuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708424914; x=1709029714;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=feBmHTk5QqT0alfBhak8qeu8UsMRRHWdWJtG8l7EVRc=;
        b=aEUXEKQI5mo2AykyboPk7geqqR4eI82D4e98AcQgnFGhjOPI+cb1CDsxK2sF+yyB5j
         w5ymXZ3krPI4N7f/36j2Cavsd5BJhy7XShtclxZvnhal6CzhkeW5tJANvX3f1VAve6gS
         jh3tya23cuWPvd1Vam9EXVfanAO3Sp0FZieo3gTZUdqiHB92K3kjIb8MVB4qpFEdVu17
         uRVP9/5CwnJZDdGubhdSKjFgm+0VnmVq15gt0ERofHsHYq0ttAzqqAIC6U97rm9X6ZKR
         8sMdCanKstZ2yUdOyVhMwRLqKK+SF5y3PAUI4J9CaS346e5FNLA2z1YbP53ktFneRj4y
         eiOA==
X-Forwarded-Encrypted: i=1; AJvYcCWwpLfF4sxdImVYdU8uVm/VzS0pWjS65WFOwEiVyiWQPZ+me3TJ4Oi+F9xWaAv2/zTPtDlBhk2aPi0YH0CgJTyKcrycKuqHH0jGG65eP3g=
X-Gm-Message-State: AOJu0YxxYEzuL870dCgrfWXUsise0HEqtPJztMJlGGo3wxvubr8cBIYK
	N9YnPDpGs0zNgtCSYzKK0ilVFGlk7qClv7dK1J4b5z8N6BhEreEsYnqBcsbAZQ==
X-Google-Smtp-Source: AGHT+IEKN6E3c/PKBoceaZsKS7pqEcQjszBO2aJk6zzkeYI9YSsAesCCIlc6pEXEsrrCNKNTcHg+yw==
X-Received: by 2002:a05:6512:3d04:b0:512:bf82:139f with SMTP id d4-20020a0565123d0400b00512bf82139fmr1801336lfv.25.1708424914148;
        Tue, 20 Feb 2024 02:28:34 -0800 (PST)
Message-ID: <7031861b-f925-479c-b236-8b1809996ede@suse.com>
Date: Tue, 20 Feb 2024 11:28:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 (resend) 09/27] x86/pv: Rewrite how building PV dom0
 handles domheap mappings
Content-Language: en-US
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: julien@xen.org, pdurrant@amazon.com, dwmw@amazon.com,
 Hongyan Xia <hongyxia@amazon.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20240116192611.41112-1-eliasely@amazon.com>
 <20240116192611.41112-10-eliasely@amazon.com>
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
In-Reply-To: <20240116192611.41112-10-eliasely@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.01.2024 20:25, Elias El Yandouzi wrote:
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -382,6 +382,10 @@ int __init dom0_construct_pv(struct domain *d,
>      l3_pgentry_t *l3tab = NULL, *l3start = NULL;
>      l2_pgentry_t *l2tab = NULL, *l2start = NULL;
>      l1_pgentry_t *l1tab = NULL, *l1start = NULL;
> +    mfn_t l4start_mfn = INVALID_MFN;
> +    mfn_t l3start_mfn = INVALID_MFN;
> +    mfn_t l2start_mfn = INVALID_MFN;
> +    mfn_t l1start_mfn = INVALID_MFN;

The reason initializers are needed here is, aiui, the overly large scope
of these variables. For example ...

> @@ -708,22 +712,32 @@ int __init dom0_construct_pv(struct domain *d,
>          v->arch.pv.event_callback_cs    = FLAT_COMPAT_KERNEL_CS;
>      }
>  
> +#define UNMAP_MAP_AND_ADVANCE(mfn_var, virt_var, maddr) \
> +do {                                                    \
> +    unmap_domain_page(virt_var);                        \
> +    mfn_var = maddr_to_mfn(maddr);                      \
> +    maddr += PAGE_SIZE;                                 \
> +    virt_var = map_domain_page(mfn_var);                \
> +} while ( false )
> +
>      if ( !compat )
>      {
>          maddr_to_page(mpt_alloc)->u.inuse.type_info = PGT_l4_page_table;
> -        l4start = l4tab = __va(mpt_alloc); mpt_alloc += PAGE_SIZE;
> +        UNMAP_MAP_AND_ADVANCE(l4start_mfn, l4start, mpt_alloc);
> +        l4tab = l4start;
>          clear_page(l4tab);
> -        init_xen_l4_slots(l4tab, _mfn(virt_to_mfn(l4start)),
> -                          d, INVALID_MFN, true);
> -        v->arch.guest_table = pagetable_from_paddr(__pa(l4start));
> +        init_xen_l4_slots(l4tab, l4start_mfn, d, INVALID_MFN, true);
> +        v->arch.guest_table = pagetable_from_mfn(l4start_mfn);

... looks to be required only here, while ...

>      }
>      else
>      {
>          /* Monitor table already created by switch_compat(). */
> -        l4start = l4tab = __va(pagetable_get_paddr(v->arch.guest_table));
> +        l4start_mfn = pagetable_get_mfn(v->arch.guest_table);
> +        l4start = l4tab = map_domain_page(l4start_mfn);

... in principle the use of the variable could be avoided here. Below
from here there's no further use of it.

> @@ -781,30 +797,34 @@ int __init dom0_construct_pv(struct domain *d,
>  
>      if ( compat )
>      {
> -        l2_pgentry_t *l2t;
> -
>          /* Ensure the first four L3 entries are all populated. */
>          for ( i = 0, l3tab = l3start; i < 4; ++i, ++l3tab )
>          {
>              if ( !l3e_get_intpte(*l3tab) )
>              {
>                  maddr_to_page(mpt_alloc)->u.inuse.type_info = PGT_l2_page_table;
> -                l2tab = __va(mpt_alloc); mpt_alloc += PAGE_SIZE;
> -                clear_page(l2tab);
> -                *l3tab = l3e_from_paddr(__pa(l2tab), L3_PROT);
> +                UNMAP_MAP_AND_ADVANCE(l2start_mfn, l2start, mpt_alloc);
> +                clear_page(l2start);
> +                *l3tab = l3e_from_mfn(l2start_mfn, L3_PROT);
>              }

The updating of l2start is only conditional here, yet ...

>              if ( i == 3 )
>                  l3e_get_page(*l3tab)->u.inuse.type_info |= PGT_pae_xen_l2;
>          }
>  
> -        l2t = map_l2t_from_l3e(l3start[3]);
> -        init_xen_pae_l2_slots(l2t, d);
> -        unmap_domain_page(l2t);
> +        init_xen_pae_l2_slots(l2start, d);

... here you assume it points at the page referenced by the 3rd L3 entry.
Question is why the original code is being replaced here in the first
place: It was already suitably mapping the page in question.

Jan

