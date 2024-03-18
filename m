Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A78287EB41
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 15:43:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694763.1083861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmED8-000416-II; Mon, 18 Mar 2024 14:43:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694763.1083861; Mon, 18 Mar 2024 14:43:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmED8-0003zK-Fe; Mon, 18 Mar 2024 14:43:34 +0000
Received: by outflank-mailman (input) for mailman id 694763;
 Mon, 18 Mar 2024 14:43:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=emy9=KY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmED7-0003zC-3f
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 14:43:33 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3a8472f-e535-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 15:43:31 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a46aaf6081fso239503766b.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 07:43:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 u6-20020a1709063b8600b00a45f2dc6795sm4917001ejf.137.2024.03.18.07.43.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 07:43:30 -0700 (PDT)
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
X-Inumbo-ID: e3a8472f-e535-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710773010; x=1711377810; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NMq7fp3DEzVpxOUkpNplTvXW3AR6X2LrAaxIpotthZc=;
        b=ZWKHnp46q4YQYP3K267N8zfvNGaMVo4C4E89X21Mp9IiT1LMJ76FdXrXYp25KQ9QB5
         +PW6d1si2by/bx1O/GhKSS0yfnwEuLqrgRl9Y+7Bk0aiQe28PGAU19gZvDBGnz4EAC9l
         vw2A9xloCz5vowVb0APBPji9chfciD1mriO52ydTsjZNO1WonbXBQcnZu6p5N/jK5WyV
         vN9NyctiIQWx0nS4Iumf+WILLeoT9RAOttNoqlNYbbDdJL1Ao93F5aEHwqGlq5aerV+w
         +EW7D9dD771RRZ2IsdBK0EqyvPtJr3ckEWyjcotaHI+k4R+cndmG4qPLV5XvIvHqTcF2
         C42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710773010; x=1711377810;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NMq7fp3DEzVpxOUkpNplTvXW3AR6X2LrAaxIpotthZc=;
        b=RdLnFCD6wpDaHfnutqbn8uRWLLEVji7UTNe6vlOtXuY0z/ID8KJuMiAL76onVB0pPn
         yprD0krY1gzafxVQOXT3uy7y0xF8Z+Iaucpu8N+S7sBl6TfVc/p8tIeJK0uIQyJj6zVp
         85wWIi905gzJwa13UIe3yrdj3OMcoyRXiHDJ7uKQiLAYl3C2zcDDb4cWRiBtaTKblqum
         Aas+VIjuDAqNpvRgIlwPDhtUfBhdAv4PHTu3Pl+sXZAvm77oMnY2hb+0lSuwmXsYc/rK
         a7ZJPmKnCl15rlcHF0lZBQ0pfhU1IwGxuaxfMotv6CW+LNLPSpQ51CBl2tNcOXRlS+SL
         W6NQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnrvocGAOZ9nElVrF8oDzlnQILWmRdUIu0x7coxYjM0jFlr/Kl5bCqB/aa9i9mQB9Rp/5OJFl70TkXnxsx+BgwvhRhoX32OUgdxF6S8lY=
X-Gm-Message-State: AOJu0YxR67RvGlqG+t0S4Vap5HmQlesT2u56Bcnpb2gybeVaD0HaHIH/
	BytdT/blSkXFXmlmEgDO5U0o5nFkJCl3WdRY3bUUXxlGYA4i7rjnz+UQRjOT3w==
X-Google-Smtp-Source: AGHT+IGr4BW7VhxMh6/CAG9fVotYIMOvtmu5+mKI47lTIgIiN8Kai+THtv6aOHMM6s2nq5T7+dkvZw==
X-Received: by 2002:a17:906:d8ad:b0:a46:13d5:46fe with SMTP id qc13-20020a170906d8ad00b00a4613d546femr7767014ejb.11.1710773010585;
        Mon, 18 Mar 2024 07:43:30 -0700 (PDT)
Message-ID: <1b8417b8-93aa-4976-a27a-701cfdf183b4@suse.com>
Date: Mon, 18 Mar 2024 15:43:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/13] xen/spinlock: add
 rspin_[un]lock_irq[save|restore]()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240314072029.16937-1-jgross@suse.com>
 <20240314072029.16937-5-jgross@suse.com>
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
In-Reply-To: <20240314072029.16937-5-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2024 08:20, Juergen Gross wrote:
> Instead of special casing rspin_lock_irqsave() and
> rspin_unlock_irqrestore() for the console lock, add those functions
> to spinlock handling and use them where needed.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with two remarks:

> --- a/xen/common/spinlock.c
> +++ b/xen/common/spinlock.c
> @@ -475,15 +475,31 @@ void _rspin_lock(rspinlock_t *lock)
>      lock->recurse_cnt++;
>  }
>  
> +unsigned long _rspin_lock_irqsave(rspinlock_t *lock)
> +{
> +    unsigned long flags;
> +
> +    local_irq_save(flags);
> +    _rspin_lock(lock);
> +
> +    return flags;
> +}
> +
>  void _rspin_unlock(rspinlock_t *lock)
>  {
>      if ( likely(--lock->recurse_cnt == 0) )
>      {
>          lock->recurse_cpu = SPINLOCK_NO_CPU;
> -        spin_unlock(lock);
> +        _spin_unlock(lock);

This looks like an unrelated change. I think I can guess the purpose, but
it would be nice if such along-the-way changes could be mentioned in the
description.

> --- a/xen/include/xen/spinlock.h
> +++ b/xen/include/xen/spinlock.h
> @@ -272,7 +272,15 @@ static always_inline void spin_lock_if(bool condition, spinlock_t *l)
>   */
>  bool _rspin_trylock(rspinlock_t *lock);
>  void _rspin_lock(rspinlock_t *lock);
> +#define rspin_lock_irqsave(l, f)                                \
> +    ({                                                          \
> +        BUILD_BUG_ON(sizeof(f) != sizeof(unsigned long));       \
> +        ((f) = _rspin_lock_irqsave(l));                         \

Perhaps in the context of another patch in the series I think I had
pointed out that the outer pair of parentheses is unnecessary in
constructs like this. I'd be fine adjusting this while committing, as
long as for the other item above you'd provide some text to add.

Jan

