Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36524AFADF1
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 10:02:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035282.1407502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYgnX-0007Kd-3A; Mon, 07 Jul 2025 08:01:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035282.1407502; Mon, 07 Jul 2025 08:01:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYgnX-0007IM-0D; Mon, 07 Jul 2025 08:01:59 +0000
Received: by outflank-mailman (input) for mailman id 1035282;
 Mon, 07 Jul 2025 08:01:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hmpo=ZU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uYgnW-0007IG-7j
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 08:01:58 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a672746c-5b08-11f0-b894-0df219b8e170;
 Mon, 07 Jul 2025 10:01:56 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a4e742dc97so2384504f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Jul 2025 01:01:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c8455d24esm81838355ad.112.2025.07.07.01.01.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jul 2025 01:01:54 -0700 (PDT)
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
X-Inumbo-ID: a672746c-5b08-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751875315; x=1752480115; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IjavmnHqSWxoARyjFbSsKc5hsbtx7Gk2ZtlfwtvdqTk=;
        b=gaJOrXVHR2kITzXZVH5hMx5pNLqvLrgiATdAnZTWoDpZflhvtZdYahwHnk5rtrIOPd
         XaAz/j1tKd/BmeST2KJoA+51TaWBqmGh6J5q/5nRE3HToZ9jgB2LFlI/PyEHbYQxZcJP
         Ku/2A3YC/aXFEqjk8WcTRwYqi5Yi7EMh4igYeOoPu5GYPkJD3Qqluh9BsMsaICcbHMZm
         2aMliLggUVErRjHhnw50sAD2PbkwANEe308HDAk8IgvlnLwjGKrwe9OBug/kaCNIzlAu
         +925f7n5hfn2taTUUKHNYemRRR9Hb/avpUy1kjNYOcxIopzwKrponufd5zup+KwyloCv
         RSMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751875315; x=1752480115;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IjavmnHqSWxoARyjFbSsKc5hsbtx7Gk2ZtlfwtvdqTk=;
        b=rp9QUJ2W5qqSnMeANv3C559+NxO/cngrm0hb5hCrB6IlV6xfYMtxaz/N1kvSwOm9M7
         BmY7xsq+YZcxdkn5jpFaM8S94dPjA4xMbM8Q6FhEfZ1fMKH/YCwAQK3BMQY+nspbZBbo
         Uzj+zlmqPJV1RjuhM7ws7QDP5U8jNXNwaj5BTDAjpjzyvbDdN5Tpy3nwdV4RCMbKgQCi
         RJ4iYFAqBLIMmlnm0ZwUW/jeTZGJev7vugTq2uDM+75pXYYhUkbwl0dxCrV7zdiDY+/v
         BBKgjIsQBP+Pmum+j7v2xFx9vujkDJMOys6vDBOLSA6UfXxsvti3gwgkNoXYaMKsh6uh
         wCrg==
X-Forwarded-Encrypted: i=1; AJvYcCWLw4vyFA997NOMQE+nXXS7C+cRE+HLer+CuBtcW/MQmYTJHsAXhScH+UbDTF2ojbEIHDgE4j15e5E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZHjHzzFdaGt1z+FyVPYnhIHPZIuF1fvqj27gWl+D9lvwPo1Eg
	P6RC1l717v3ZHHZ9tqYt0p1VqI7CzAEJfiqfLByVQC2I33XA/00mLRxbYLtlZ6T5nw==
X-Gm-Gg: ASbGncuoBdCKc51A+5zWUkGpVAzY8+izd9C80yLB1wQaVVLJ45xXkdGIHfm9ICv+MPw
	HtkVghDfZ0DesjQ/tanpRBl5kmtcn8me+j7yS/LgYT0g5cl68rqUU1hMrZAmb+qKJR5NwkRgMaL
	JdRjG6VIeYw337wh71rgC2Q6rC2WOp2oSr+u+B4J3dow+OsCollTkROD8MKszBS7+iHj1zdA25D
	fXxo3GJkCvVHxSZCWT2FizF866h0joH2Ym6oes4N+70Bd0MgRsUqP40Wdqn85w65eEpGlKO8xnp
	l8iy6MWXPCyOJXWBKDc1HFfxDdVOVbfWcuJggtuIx6SoPQq1K1JxJPJWhidZcCOddJYYKGILC5X
	lpzrzXjN4XzuHi5ULTUxJISf1P6EPKt82ynZ8aOCpItC8yuQ=
X-Google-Smtp-Source: AGHT+IHdFIDlU55WriMZaB7S+hD3H6hZofmtkMb/AnNY8t6pQC9kQJNIu5Yj043q36MZ0mQnFZ8R8g==
X-Received: by 2002:a05:6000:40cb:b0:3a4:f722:a46b with SMTP id ffacd0b85a97d-3b4955752fbmr9618420f8f.15.1751875315225;
        Mon, 07 Jul 2025 01:01:55 -0700 (PDT)
Message-ID: <fd8ce200-320a-406f-85b1-8087b9cc90a2@suse.com>
Date: Mon, 7 Jul 2025 10:01:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] xen/arm: Support ARM standard PV time for domains
 created via toolstack
To: Koichiro Den <den@valinux.co.jp>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20250705142703.2769819-1-den@valinux.co.jp>
 <20250705142703.2769819-6-den@valinux.co.jp>
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
In-Reply-To: <20250705142703.2769819-6-den@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.07.2025 16:27, Koichiro Den wrote:
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -180,7 +180,21 @@ int xenmem_add_to_physmap_one(
>      case XENMAPSPACE_dev_mmio:
>          rc = map_dev_mmio_page(d, gfn, _mfn(idx));
>          return rc;
> +    case XENMAPSPACE_pv_time:
> +#ifdef CONFIG_ARM_64

These two lines want to change places, I think.

> +        ASSERT(IS_POWER_OF_TWO(sizeof(struct pv_time_region)));

BUILD_BUG_ON() please, so that an issue here can be spotted at build time
rather than only at runtime.

> +        if ( idx >= DIV_ROUND_UP(d->max_vcpus * sizeof(struct pv_time_region),
> +                                 PAGE_SIZE) )
> +            return -EINVAL;
> +
> +        if ( idx == 0 )
> +            d->arch.pv_time_regions_gfn = gfn;

This looks fragile, as it'll break once d->max_vcpus can grow large enough to
permit a non-zero idx by way of the earlier if() falling through. Imo you'll
need at least one further BUILD_BUG_ON() here.

>  
> +        mfn = virt_to_mfn(d->arch.pv_time_regions[idx]);
> +        t = p2m_ram_ro;

Is this the correct type to use here? That is, do you really mean guest write
attempts to be silently dropped, rather than being reported to the guest as a
fault? Then again I can't see such behavior being implemented on Arm, despite
the comment on the enumerator saying so (likely inherited from x86).

> +        break;
> +#endif
>      default:
>          return -ENOSYS;
>      }

As to style: Please, rather than absorbing the blank line that was there, make
sure non-fall-through case blocks are separated from adjacent ones by a blank
line.

> --- a/xen/include/public/memory.h
> +++ b/xen/include/public/memory.h
> @@ -217,6 +217,7 @@ DEFINE_XEN_GUEST_HANDLE(xen_machphys_mapping_t);
>                                        Stage-2 using the Normal Memory
>                                        Inner/Outer Write-Back Cacheable
>                                        memory attribute. */
> +#define XENMAPSPACE_pv_time      6 /* PV time shared region (ARM64 only) */

The comment isn't specific enough. As per the struct declaration in patch 4,
this interface is solely about stolen time. There's a wider PV interface,
which at least x86 Linux also uses, and which has been adopted by KVM as
well iirc. Hence this new type wants to clarify what exactly it's used for
right now, while leaving open other uses on other architectures.

Jan

