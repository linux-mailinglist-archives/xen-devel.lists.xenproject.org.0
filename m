Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F926C452E0
	for <lists+xen-devel@lfdr.de>; Mon, 10 Nov 2025 08:12:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158130.1486521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIM4E-0007gs-9L; Mon, 10 Nov 2025 07:11:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158130.1486521; Mon, 10 Nov 2025 07:11:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIM4E-0007eX-6G; Mon, 10 Nov 2025 07:11:58 +0000
Received: by outflank-mailman (input) for mailman id 1158130;
 Mon, 10 Nov 2025 07:11:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ugol=5S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vIM4D-0007eR-L0
 for xen-devel@lists.xenproject.org; Mon, 10 Nov 2025 07:11:57 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89dbc640-be04-11f0-980a-7dc792cee155;
 Mon, 10 Nov 2025 08:11:55 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-42b312a089fso704465f8f.2
 for <xen-devel@lists.xenproject.org>; Sun, 09 Nov 2025 23:11:55 -0800 (PST)
Received: from ?IPV6:2003:ca:b70c:6a8d:3447:d20d:2d49:c08?
 (p200300cab70c6a8d3447d20d2d490c08.dip0.t-ipconnect.de.
 [2003:ca:b70c:6a8d:3447:d20d:2d49:c08])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47763da0242sm102606345e9.0.2025.11.09.23.11.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Nov 2025 23:11:53 -0800 (PST)
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
X-Inumbo-ID: 89dbc640-be04-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762758714; x=1763363514; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ttuGbKCkdItCP9jPmadASk+Rq7sHRnNWhiGeJiQoEkc=;
        b=Wb3oAarux0njJqyE/7IHQRUoitgTQkXHF0rJj1dJ8HXLAHX0eUewkaX2MYU3CBLxqK
         7PQPUrFNxmypjMUcYqyQ9SfpyzW9R6NIgTen+fVc6jBPhWUJuIAJjLSCZ3u3RRzBrB2c
         sbIcy/xnuE0x6OmSNTuisgsE9PXxUIkOq8a1J3U3rS38s8aZ4FLAlCyvVRKiCWX/9ucP
         0e08pHG5GeNUDvFOgPGfSoj4ApgNFHJMLxjx79eDVEmBjHdmZeor2+naSDe1Qwa7WbYZ
         1fdeBb85DLwQQjRVXAtY/qAyEvWnm4EXMQjPYrO0cPmKVcAXuFvPu9/vXmE4CnGkDRQT
         oxdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762758714; x=1763363514;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ttuGbKCkdItCP9jPmadASk+Rq7sHRnNWhiGeJiQoEkc=;
        b=F1GzMeY4uZuthVkZrg8okl1KT1+GpTMMlETQqecUHS9KkMUclgnf3mZFyEAmJjge6R
         rbEOddqI/hecHs2Xa3M6+KGWo51FHboONIC11mVZaTRGO3LtRsQqtSz3uD4vLL86q2lx
         jEHLahHrANPUchqTihVcBYJkwc5WFWg21oJmRgmyTjdyomS7WpHHYa+LaoD4gsxMviPe
         qBPnqQN0zE8rpGePMyl6A3BxH1iBJZPPEsV9RbOATUSOdyRAYYZ9cXM8pklrUYeTtvNy
         HHS6vjfoFnW+9PAvrcZuth6bU1bNoZt3vGONA0vwM8aGoXn12gj9Su1nUJLI723S8gEY
         405g==
X-Forwarded-Encrypted: i=1; AJvYcCWitN2/4wGt0jUs3nhvG3CExSj7I35g7j/1oH7RgEwiUnjNtr54j/1RPoYcXTNURamLy+JYUoUF1nQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxVqifWU4x6rprYOg3TbIhtNmUirxXuB06mEvPwezwaUQBWAdW0
	GpO9WwMMkqg2FOuL8PQ/8aLCikKu8QzpMDtoFqhP/lQ2bb7u992FLSUalMVESzlcvA==
X-Gm-Gg: ASbGncvpmMObeIgcWgafftfpE/MoWVgu/SZPqjpGxI2bZ7DK3FsF6guVSkwzhTg4EUf
	qp6Qm03MhLaOvKi5ua7HtwnbePoQ6nsxSCr8gde7gg9ahWzN8T934tk1V1Pt6i9qBL+eJfqwBek
	+jIcRhUXkbHRMbRuRG/8KR5SaAMgDIO7yRdjhu7nKgNctHt7a9ssRRzfSrc/yREO2MzDOJdUU0N
	3r4yev0Hy/qiKDIX8HDclgkTKcYMSVe+ZxaTqtdjs/wuh1Pa6w/wA8GrLHvYW1mRAm5Z5S5K1vD
	BMEy8OsyXQ2Zj48YxBjRGdPpN/kvplSaiQ+rKPInwulHFa2Q7fdznsj5HBHVw841Q2gFVYIFZc5
	VePR7fKFXIYWhUTfFZPlDVMrNMqmuG2gk0OxQNayBhIVGG4WUSBk/TPV0BeO8BwgqtrsWXRcB1V
	C8CkMwR2CMhDF1KFmGLgM/zgRJ2aNaknp7D63HAQByF5NV3Regv7aT9TKr3RypwIvXC/UQV3mYS
	B3QTKd3RCYruV1VLAX9hH2KUsQQVtPYSPQfllORe1SWkg==
X-Google-Smtp-Source: AGHT+IHs4quEVGCJ7ej0+1HlDO/LlNkZHALscGjlkCI9Lah6RGuFonPNb1lWg/APbdiL76LHV8eyVA==
X-Received: by 2002:a05:600c:3b1f:b0:46f:b42e:e360 with SMTP id 5b1f17b1804b1-4777329c723mr60186835e9.40.1762758714526;
        Sun, 09 Nov 2025 23:11:54 -0800 (PST)
Message-ID: <47f86a44-007f-4b90-9656-b2440238b2ba@suse.com>
Date: Mon, 10 Nov 2025 08:11:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v3] xen/x86: guest_access: optimize raw_x_guest() for
 PV and HVM combinations
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251107181739.3034098-1-grygorii_strashko@epam.com>
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
In-Reply-To: <20251107181739.3034098-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.11.2025 19:17, Grygorii Strashko wrote:
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -71,7 +71,7 @@ obj-y += time.o
>  obj-y += traps-setup.o
>  obj-y += traps.o
>  obj-$(CONFIG_INTEL) += tsx.o
> -obj-y += usercopy.o
> +obj-$(CONFIG_PV) += usercopy.o

Imo, if this was indeed doable (see below) the file would rather want moving
to pv/.

> --- a/xen/arch/x86/include/asm/guest_access.h
> +++ b/xen/arch/x86/include/asm/guest_access.h
> @@ -13,26 +13,64 @@
>  #include <asm/hvm/guest_access.h>
>  
>  /* Raw access functions: no type checking. */
> -#define raw_copy_to_guest(dst, src, len)        \
> -    (is_hvm_vcpu(current) ?                     \
> -     copy_to_user_hvm((dst), (src), (len)) :    \
> -     copy_to_guest_pv(dst, src, len))
> -#define raw_copy_from_guest(dst, src, len)      \
> -    (is_hvm_vcpu(current) ?                     \
> -     copy_from_user_hvm((dst), (src), (len)) :  \
> -     copy_from_guest_pv(dst, src, len))
> -#define raw_clear_guest(dst,  len)              \
> -    (is_hvm_vcpu(current) ?                     \
> -     clear_user_hvm((dst), (len)) :             \
> -     clear_guest_pv(dst, len))
> -#define __raw_copy_to_guest(dst, src, len)      \
> -    (is_hvm_vcpu(current) ?                     \
> -     copy_to_user_hvm((dst), (src), (len)) :    \
> -     __copy_to_guest_pv(dst, src, len))
> -#define __raw_copy_from_guest(dst, src, len)    \
> -    (is_hvm_vcpu(current) ?                     \
> -     copy_from_user_hvm((dst), (src), (len)) :  \
> -     __copy_from_guest_pv(dst, src, len))
> +static inline bool raw_use_hvm_access(const struct vcpu *v)
> +{
> +    return IS_ENABLED(CONFIG_HVM) && (!IS_ENABLED(CONFIG_PV) || is_hvm_vcpu(v));
> +}

Without a full audit (likely tedious and error prone) this still is a
behavioral change for some (likely unintended) use against a system domain
(likely the idle one): With HVM=y PV=n we'd suddenly use the HVM accessor
there. IOW imo the "system domains are implicitly PV" aspect wants
retaining, even if only "just in case". It's okay not to invoke the PV
accessor (but return "len" instead), but it's not okay to invoke the HVM
one.

> +static inline unsigned int raw_copy_to_guest(void *dst, const void *src,
> +                                             unsigned int len)
> +{
> +    if ( raw_use_hvm_access(current) )
> +        return copy_to_user_hvm(dst, src, len);
> +    else if ( IS_ENABLED(CONFIG_PV) )
> +        return copy_to_guest_pv(dst, src, len);
> +    else
> +        return len;
> +}
> +
> +static inline unsigned int raw_copy_from_guest(void *dst, const void *src,
> +                                               unsigned int len)
> +{
> +    if ( raw_use_hvm_access(current) )
> +        return copy_from_user_hvm(dst, src, len);
> +    else if ( IS_ENABLED(CONFIG_PV) )
> +        return copy_from_guest_pv(dst, src, len);
> +    else
> +        return len;
> +}
> +
> +static inline unsigned int raw_clear_guest(void *dst, unsigned int len)
> +{
> +    if ( raw_use_hvm_access(current) )
> +        return clear_user_hvm(dst, len);
> +    else if ( IS_ENABLED(CONFIG_PV) )
> +        return clear_guest_pv(dst, len);
> +    else
> +        return len;
> +}
> +
> +static inline unsigned int __raw_copy_to_guest(void *dst, const void *src,
> +                                               unsigned int len)
> +{
> +    if ( raw_use_hvm_access(current) )
> +        return copy_to_user_hvm(dst, src, len);
> +    else if ( IS_ENABLED(CONFIG_PV) )
> +        return __copy_to_guest_pv(dst, src, len);
> +    else
> +        return len;
> +}
> +
> +static inline unsigned int __raw_copy_from_guest(void *dst, const void *src,
> +                                                 unsigned int len)
> +{
> +    if ( raw_use_hvm_access(current) )
> +        return copy_from_user_hvm(dst, src, len);
> +    else if ( IS_ENABLED(CONFIG_PV) )
> +        return __copy_from_guest_pv(dst, src, len);
> +    else
> +        return len;
> +}

I have to admit that I'm not quite happy about the redundancy here (leaving
aside the imo Misra-conflicting uses of "else"). It looks as if some macro-
ization could still help. Not sure what others think, though.

Jan

