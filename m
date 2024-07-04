Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD3B927738
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2024 15:34:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753826.1162113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPMaO-0007W1-3p; Thu, 04 Jul 2024 13:33:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753826.1162113; Thu, 04 Jul 2024 13:33:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPMaO-0007Tw-0u; Thu, 04 Jul 2024 13:33:20 +0000
Received: by outflank-mailman (input) for mailman id 753826;
 Thu, 04 Jul 2024 13:33:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V0d6=OE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sPMaM-0007Tj-5v
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2024 13:33:18 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f784b5a7-3a09-11ef-8776-851b0ebba9a2;
 Thu, 04 Jul 2024 15:33:15 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ee794ec046so6897741fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jul 2024 06:33:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fb1eb121b0sm28774955ad.253.2024.07.04.06.33.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jul 2024 06:33:14 -0700 (PDT)
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
X-Inumbo-ID: f784b5a7-3a09-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720099995; x=1720704795; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KkT7W1sHe6ybpqjBROrJ+KxnIUBZQGM5oguo2XXQQAE=;
        b=TssKD3+0hZbwm+ii0j2vghOMl1M2r4yDSse0qoYwiZpc3KnHshh/OWPP2TikUeX5i3
         QdNnGkIefFNXLAEvjcxyrCGE2FJ565rQ7j601MuoCY2WhmrnYgljvPkOnWysOQ2iU9fz
         rpSzt/AJaMDV+wb+UuSeYn0GgxZFQoyiqLwHCcrgoseiCb5j+8QF0MWl9/ovIGaIQt7U
         rPdvmTUBmxskPK/ZFxALB8I36Q7LBFJCzRMlwfB/XfIkpJOdMyNo4b9XAEjrjwqWH8yC
         /pk4Res7L1FV3lsHMqWl3+vESa2dDXDfhF/3ZNONCaqFzdjq26S6tlpwe/ppJXouwKna
         QE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720099995; x=1720704795;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KkT7W1sHe6ybpqjBROrJ+KxnIUBZQGM5oguo2XXQQAE=;
        b=jnNOK//x2305B9ixEfwm/SBmmUGEyH+UKAYazq5btoQBG+pvHwVDLK0YsCw8bGU/sg
         W8w0S3hNI/F8wQgGA2MPmxw73rNKxERSC+UXDsbMqBmBXlFfSQaByUrqogv1N/ZjsSjL
         RPjaXp59I78wiq+bzkEUniXADRO7oqnuvPZUlHHFKKhcLO5vJXvpjYCMZvWBSbYNRtlM
         z5/f43nDmzx2vvpcXF4ZG+sgqZ+dqjVV47uWY+jy3FBo0C60Pr2y4JnRAhAO6I8p7jSi
         Cui/eJsRqIadKmPQcflvF1+VRgU7m8SwNPaEkpxtFNGj9CBVQ35cK5bo77SkSRyXv3TY
         RRXg==
X-Forwarded-Encrypted: i=1; AJvYcCW2F4NoZEbXu9yK7RTJVHb92IWnVA7Ips9KiW81mWnlCRqFLGR+zp8kXifNFdrcYH0ECqU/kMwhxhyJcCjdTuJDopMCGpQq8D36ABSnkCI=
X-Gm-Message-State: AOJu0Yz8RLHPWdi+V+WqoPP0b7u+z4r68V7kR3SobPR/dgmldcxWZjRk
	YQzGPT2sFbbm3Sfx3D6yqf1R7tevyEyafKzGtiTrE9ZeN3N3/ZngwBk2XEpISg==
X-Google-Smtp-Source: AGHT+IEz5Z6ObJcfJMB7YkPh+/nGVIJxBiwW7Tra+wNVJMB98UF721eThyAoGRqTRAs9EI2sNkKenw==
X-Received: by 2002:a05:651c:2120:b0:2ee:4b17:dab9 with SMTP id 38308e7fff4ca-2ee8ed62e47mr10950021fa.4.1720099994876;
        Thu, 04 Jul 2024 06:33:14 -0700 (PDT)
Message-ID: <a02cea93-b04b-484c-b3e0-dd5f6823196e@suse.com>
Date: Thu, 4 Jul 2024 15:33:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v11 5/8] x86/domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <Ray.Huang@amd.com>, xen-devel@lists.xenproject.org
References: <20240630123344.20623-1-Jiqian.Chen@amd.com>
 <20240630123344.20623-6-Jiqian.Chen@amd.com>
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
In-Reply-To: <20240630123344.20623-6-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.06.2024 14:33, Jiqian Chen wrote:
> @@ -237,6 +238,38 @@ long arch_do_domctl(
>          break;
>      }
>  
> +    case XEN_DOMCTL_gsi_permission:
> +    {
> +        int irq;
> +        uint8_t mask = 1;
> +        unsigned int gsi = domctl->u.gsi_permission.gsi;
> +        bool allow = domctl->u.gsi_permission.allow_access;
> +
> +        /* Check all bits and pads are zero except lowest bit */
> +        ret = -EINVAL;
> +        if ( domctl->u.gsi_permission.allow_access & ( !mask ) )
> +            goto gsi_permission_out;

I'm pretty sure that if you had, as would have been expected, added a
#define to the public header for just the low bit you assign meaning to,
you wouldn't have caused yourself problems here. For one, the
initializer for "allow" will be easy to miss if meaning is assigned to
another of the bits. It sadly _still_ takes the full 8 bits and
converts those to a boolean. And then the check here won't work either.
I don't see what use the local variable "mask" is, but at the very
least I expect in place of ! you mean ~ really.

> +        for ( i = 0; i < ARRAY_SIZE(domctl->u.gsi_permission.pad); ++i )
> +            if ( domctl->u.gsi_permission.pad[i] )
> +                goto gsi_permission_out;
> +
> +        if ( gsi >= nr_irqs_gsi || ( irq = gsi_2_irq(gsi) ) < 0 )

nr_irqs_gsi is the upper bound on IRQs representing a GSI; as said before,
GSIs and IRQs are different number spaces, and hence you can't compare
gsi against nr_irqs_gsi. The (inclusive) upper bound on (valid) GSIs is
mp_ioapic_routing[nr_ioapics - 1].gsi_end, or the return value of
highest_gsi().

Also, style nit: Blanks belong immediately inside parentheses only for the
outer pair of control statements; no inner expressions should have them this
way.

Finally I'd like to ask that you use "<= 0", as we do in various places
elsewhere. IRQ0 is the timer interrupt; we never want to have that used by
any entity outside of Xen itself.

> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -464,6 +464,12 @@ struct xen_domctl_irq_permission {
>      uint8_t pad[3];
>  };
>  
> +/* XEN_DOMCTL_gsi_permission */
> +struct xen_domctl_gsi_permission {
> +    uint32_t gsi;
> +    uint8_t allow_access;    /* flag to specify enable/disable of x86 gsi access */

See above. It's not the field that serves as a flag for the purpose you
state, but just the low bit. You want to rename the field (flags?) and
#define a suitable constant.

Jan

