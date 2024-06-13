Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A47AF906DC2
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2024 14:03:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739867.1146811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHjAq-0005Sn-3y; Thu, 13 Jun 2024 12:03:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739867.1146811; Thu, 13 Jun 2024 12:03:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHjAq-0005Qt-19; Thu, 13 Jun 2024 12:03:24 +0000
Received: by outflank-mailman (input) for mailman id 739867;
 Thu, 13 Jun 2024 12:03:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sHjAo-0005Qn-Jo
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2024 12:03:22 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ecd39031-297c-11ef-b4bb-af5377834399;
 Thu, 13 Jun 2024 14:03:20 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-57cad4475e0so2575829a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jun 2024 05:03:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56ecdd79sm65525166b.132.2024.06.13.05.03.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jun 2024 05:03:18 -0700 (PDT)
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
X-Inumbo-ID: ecd39031-297c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718280199; x=1718884999; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0xKJLy2ZRf6uWK4lv0zRdTNoXfGkNhCoBlUq8csk0vo=;
        b=aydMLUDXa4yOF1+fy982yuIg7itKPxo8dqTzNJ7KCDRZZoN5x40gDmDtXeprNr7eKU
         IHFg0YCfN1VwHSsw3UljpPBqgRTLSXw2XyXwmoIy75bBIVOSfMPRkKzjLJq6XYfQ4Tzi
         fKvlMavw3Q1w3inMG5mmzYTWUeNm6XcVN9jW2r2m0EAYip7y6OMytDsOCW6HA1ZZeZf0
         +WWJdmIr8m3Z565PEwr+cwHQNXIq3ILgz1q4aGwJZKXre6H6mhAvD8TsNRuPJxSghoVa
         tBdsrjV+p+62ob3atgFrrtmpRzTnZgmNFPM6tpRe0QNqi1xCikPXYdVBd4hhB9lP1FSD
         ks8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718280199; x=1718884999;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0xKJLy2ZRf6uWK4lv0zRdTNoXfGkNhCoBlUq8csk0vo=;
        b=S/NFOQQKxLOz3YSgkQUV6eQiCmQzgztrtszX7mLJllYzMe5eLIdDD0ru3hf+0ijb7D
         vfpSq3nkg9tRuCsdz+34MOhFHt0OqeS3KXpzWXOf4gxGv+W8bMX0m+dyeRwIH/Q0z2kb
         IJMgv6QVQ1vaxrz1lpmjW+dKHtAalubba5oHF2lIhbXwJTB+ULKyXIkU7HqoLVmwCnU9
         /EAc/c2jJFwopU2hV9ehfxOGddeoCpgYym1v2YWuyQlfOnWuOAB2xCE8tblXsStBxRi/
         6ZY9/fLIiUN1MXt4Ci0hGcyaNQy2uiQ9CgaovRHhG3x/hD2CGjZT/JKkTfWabW1NPZYN
         n/Hw==
X-Forwarded-Encrypted: i=1; AJvYcCWOd2q1ruwfEp3aT6wpMVJvwmktMFEqGMFYXo4pgXruBieG1fv/wgte82/C3icw1rXCgCUIVRwrrkbLIXfx9FVvRiNx9k7ItX2JEzPaox0=
X-Gm-Message-State: AOJu0YwzAxEruum2zs4GqG5EtLgjcldS7ICttQzlFh9vxvlkZMXxiWxV
	IjbPcSo/s8B5h1h9bQ/HhwfSBsn1gk9CVyaBxhsPECYY8DDJv1DISEawNNAjFw==
X-Google-Smtp-Source: AGHT+IENdr+AUe+h4QngRQ/mAesLRdy8QdZGMEqNEZAoX3//ujevGlRkkRNwN4Mf+RPBljZAoxK0mQ==
X-Received: by 2002:a17:906:f59f:b0:a6f:1bf8:658d with SMTP id a640c23a62f3a-a6f524742b2mr196888266b.37.1718280199244;
        Thu, 13 Jun 2024 05:03:19 -0700 (PDT)
Message-ID: <4a49fe9b-66fd-4a32-ad01-14ed4c5fc34c@suse.com>
Date: Thu, 13 Jun 2024 14:03:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19? v6 6/9] xen: Make the maximum number of altp2m
 views configurable for x86
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <cover.1718038855.git.w1benny@gmail.com>
 <fee20e24a94cb29dea81631a6b775933d1151da4.1718038855.git.w1benny@gmail.com>
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
In-Reply-To: <fee20e24a94cb29dea81631a6b775933d1151da4.1718038855.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.06.2024 19:10, Petr Beneš wrote:
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -724,16 +724,42 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>          return -EINVAL;
>      }
> 
> -    if ( altp2m_mode && nested_virt )
> +    if ( altp2m_mode )
>      {
> -        dprintk(XENLOG_INFO,
> -                "Nested virt and altp2m are not supported together\n");
> -        return -EINVAL;
> -    }
> +        if ( nested_virt )
> +        {
> +            dprintk(XENLOG_INFO,
> +                    "Nested virt and altp2m are not supported together\n");
> +            return -EINVAL;
> +        }
> +
> +        if ( !hap )
> +        {
> +            dprintk(XENLOG_INFO, "altp2m is only supported with HAP\n");
> +            return -EINVAL;
> +        }
> +
> +        if ( !hvm_altp2m_supported() )
> +        {
> +            dprintk(XENLOG_INFO, "altp2m is not supported\n");
> +            return -EINVAL;
> +        }

Wouldn't this better be first in the group?

> @@ -510,13 +526,13 @@ int p2m_change_altp2m_gfn(struct domain *d, unsigned int idx,
>      mfn_t mfn;
>      int rc = -EINVAL;
> 
> -    if ( idx >=  min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
> +    if ( idx >= d->nr_altp2m ||
>           d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] ==

This ends up being suspicious: The range check is against a value different
from what is passed to array_index_nospec(). The two weren't the same
before either, but there the range check was more strict (which now isn't
visible anymore, even though I think it would still be true). Imo this
wants a comment, or an assertion effectively taking the place of a comment.
(I actually wonder whether we really [still] need to allocate a full page
for d->arch.altp2m_eptp.)

> @@ -659,12 +675,13 @@ int p2m_set_suppress_ve_multi(struct domain *d,
> 
>      if ( sve->view > 0 )
>      {
> -        if ( sve->view >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
> +        if ( sve->view >= d->nr_altp2m ||
>               d->arch.altp2m_eptp[array_index_nospec(sve->view, MAX_EPTP)] ==
>               mfn_x(INVALID_MFN) )
>              return -EINVAL;

Same again here and at least twice more further down, and yet more of those
elsewhere. Since they're all "is this slot populated" checks, maybe we want
an is_altp2m_eptp_valid() helper?

> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -103,7 +103,10 @@ struct xen_domctl_createdomain {
>  /* Altp2m mode signaling uses bits [0, 1]. */
>  #define XEN_DOMCTL_ALTP2M_mode_mask  (0x3U)
>  #define XEN_DOMCTL_ALTP2M_mode(m)    ((m) & XEN_DOMCTL_ALTP2M_mode_mask)
> -        uint32_t opts;
> +        uint16_t opts;
> +
> +        /* Number of altp2ms to allocate. */
> +        uint16_t nr;
>      } altp2m;

Nit: I wouldn't say "allocate" here, but "permit" or "support" or some such.
Whether any form of per-altp2m allocation is necessary is an implementation
detail.

Jan

