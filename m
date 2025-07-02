Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5388AF5AA8
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 16:11:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031192.1404933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWyBX-0006kU-QD; Wed, 02 Jul 2025 14:11:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031192.1404933; Wed, 02 Jul 2025 14:11:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWyBX-0006is-Na; Wed, 02 Jul 2025 14:11:39 +0000
Received: by outflank-mailman (input) for mailman id 1031192;
 Wed, 02 Jul 2025 14:11:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWyBV-0006gv-M8
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 14:11:37 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74a99aa7-574e-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 16:11:32 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a5257748e1so3041404f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 07:11:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb2f2183sm139628905ad.75.2025.07.02.07.11.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 07:11:31 -0700 (PDT)
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
X-Inumbo-ID: 74a99aa7-574e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751465492; x=1752070292; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qPsadc86je2g0Drn3J2MNKd8+8+WNum406THIhJtoTk=;
        b=bPrB1hlJHLXlMHS32Dou12s3KgMNuX1HCh+p34s2qZW6t66l2DTpIEg+MxnvEFxScY
         MgPpyEJlCz7zf12yQQGayfs1bJU6U2EVWLTtPXhFc2JwbQhX0v9juWi/XiQQ2lEAK/hY
         leJzbnBWK+I0RfnNPdpsf8Lbc3WIJ/aurXSbPImhA/dQVH3HLfy6aM2AWhSdQWhjrsdF
         O1M11PTmN6Kw/VrbJ7C72Oo291N9GOA1A1qaPcBYwo9KLQbegBjjkYjfT+b+mJuBzhhP
         9E4VRL+atPTZibZbV871hF4fMpKJzglUZX2FjxfwHXcUot4AmEGgzGWnLEVakKZKOTBD
         5YLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751465492; x=1752070292;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPsadc86je2g0Drn3J2MNKd8+8+WNum406THIhJtoTk=;
        b=WWVryDvRlZ9WPmN6CgcgFbe4JFYrSKm3TP8pdsLWIN8eMAlhSyk3NqUmcMrByz9Vzy
         vIUA24p8qt67K/IufszhS+htrZp5W2h/PG0xkqv/HmUSnTqwI6uTnp6rqW98t9B6c/p9
         jKKjAnPmN5yW302czxkClhT7fNkzA9TKJjxMtkMXOZPWbcdUTiHrro5/zKMBT8TnXW7I
         n+BA7tCRGp9IGthcUgV9hVx3b6qxkSIDJ7sj4H1wCISE0O5ZauviuaHk4w1m7FqldhF0
         IupMlcsvlkLsguETmCJYu2OTws9U7DZtuyGQCewgU323ul1nerS+3l8C97yQewWxrSz1
         CJVw==
X-Forwarded-Encrypted: i=1; AJvYcCVE+G9Wf+WrD+aepISdChhWb94mFGS2wiuLK8QTXFvyewwSWiMFhE0WspOUzoU2BARNkyAqhatYI3I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzdRCxej/rRE/Qvy+COzNUAJJG7EiUfPQpIuFh8VjzbvqP6cUSq
	lb9Ub1FWAeLl2USuGJeNZ4R10XeX+C7GtOGtElnNRo18AF8v/Mc90P9zCQsBytNACw==
X-Gm-Gg: ASbGncvDrHfzroxmd70TJHcIItOf5mfNx4MyRC4ungOWDETjSRibZp8QCmbtknt1tkU
	pbh6w3zzVds6y9K2Q0mKZxbzowv3Jyeec4JLIj8KMLKPH+wGRHJi//nVn17QfYfnvw7zjJao93Z
	GeYcGXgH4fdEEKNYbj5wshwm/sqM7Khd6pFXfCS9wiHvHXjkY9XLt7kx7TCawBDNtTpptPwPD4J
	eyv0mIeppCCoRpHoZu4VltHdxIWn7m7NwMvriWhh2eUwBZNvh8qc7LGSdF4OMXCFBkBOEFlf/kz
	KYm2L97cSDYU+ignmxe+zavmOXZTXujA2EYbomTmX0MqzW0QbeACH5DmtZlqARphLa6KmlAkNOS
	qqV5Wdic5uK93PXMHBfC6Ef1191ywVK7asnhiR22mRwFodKA=
X-Google-Smtp-Source: AGHT+IG1bV1eaDiZkRazPW1xwpExPUCbctrpanfm8sHBKmOCKa6555H6ksRFgqXWu2uAwPTmFfFDFg==
X-Received: by 2002:a05:6000:2c11:b0:3a6:d255:7eda with SMTP id ffacd0b85a97d-3b20095cf70mr2070066f8f.28.1751465491814;
        Wed, 02 Jul 2025 07:11:31 -0700 (PDT)
Message-ID: <8733c6f6-27a6-4b5a-b921-e7f587d9baa6@suse.com>
Date: Wed, 2 Jul 2025 16:11:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/7] xen: Make the maximum number of altp2m views
 configurable for x86
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <cover.1751397919.git.w1benny@gmail.com>
 <c67fa5eca61e1058615d79ba836a9decf8d0fc89.1751397919.git.w1benny@gmail.com>
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
In-Reply-To: <c67fa5eca61e1058615d79ba836a9decf8d0fc89.1751397919.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.07.2025 21:54, Petr Beneš wrote:
> From: Petr Beneš <w1benny@gmail.com>
> 
> This commit introduces the ability to configure the maximum number of altp2m
> views for the domain during its creation. Previously, the limits were hardcoded
> to a maximum of 10. This change allows for greater flexibility in environments
> that require more or fewer altp2m views.
> 
> The maximum configurable limit for nr_altp2m on x86 is now set to
> MAX_NR_ALTP2M (which currently holds the MAX_EPTP value - 512). This cap is
> linked to the architectural limit of the EPTP-switching VMFUNC, which supports
> up to 512 entries. Despite there being no inherent need for limiting nr_altp2m
> in scenarios not utilizing VMFUNC, decoupling these components would necessitate
> substantial code changes.
> 
> xen_domctl_createdomain::altp2m is extended for a new field `nr`, that will
> configure this limit for a domain. Additionally, previous altp2m.opts value
> has been reduced from uint32_t to uint16_t so that both of these fields occupy
> as little space as possible.
> 
> Accesses to the altp2m_p2m array are modified to respect the new nr_altp2m
> value. Accesses to the altp2m_(visible_)eptp arrays are unmodified, since
> these arrays always have fixed size of MAX_EPTP.
> 
> A dummy hvm_altp2m_supported() function is introduced for non-HVM builds, so
> that the compilation won't fail for them.

I can't spot such an introduction; instead I can spot such a stub already in
the tree.

> --- a/xen/arch/x86/include/asm/altp2m.h
> +++ b/xen/arch/x86/include/asm/altp2m.h
> @@ -13,12 +13,32 @@
>  #include <xen/sched.h>         /* for struct vcpu, struct domain */
>  #include <asm/hvm/vcpu.h>      /* for vcpu_altp2m */
>  
> +static inline bool altp2m_is_eptp_valid(const struct domain *d,
> +                                        unsigned int idx)
> +{
> +    ASSERT(d->nr_altp2m <= MAX_EPTP);
> +
> +    /*
> +     * EPTP index is correlated with altp2m index and should not exceed
> +     * d->nr_altp2m.
> +     */

If the two were merely correlated, that wouldn't be enough for ...

> +    return idx < d->nr_altp2m &&
> +        d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] !=

... this to be safe. The two match, don't they? And to better make the
connection here, maybe also add BUILD_BUG_ON(MAX_EPTP < MAX_NR_ALTP2M)?
Perhaps along with making the ASSERT() above use MAX_NR_ALTP2M.

> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -258,11 +258,12 @@ struct paging_vcpu {
>      struct shadow_vcpu shadow;
>  };
>  
> -#define MAX_NESTEDP2M 10
> +#define MAX_EPTP        (PAGE_SIZE / sizeof(uint64_t))
> +#define MAX_NR_ALTP2M   MAX_EPTP
> +#define MAX_NESTEDP2M   10
>  
> -#define MAX_ALTP2M      10 /* arbitrary */
>  #define INVALID_ALTP2M  0xffff
> -#define MAX_EPTP        (PAGE_SIZE / sizeof(uint64_t))

You touch many of the uses of MAX_EPTP anyway. I wonder if this wasn't a good
opportunity to correct its name (to e.g. NR_EPTP or NUM_EPTP). But maybe that
would better be a follow-on change ...

> @@ -122,7 +128,12 @@ int p2m_init_altp2m(struct domain *d)
>      struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
>  
>      mm_lock_init(&d->arch.altp2m_list_lock);
> -    for ( i = 0; i < MAX_ALTP2M; i++ )
> +    d->arch.altp2m_p2m = xzalloc_array(struct p2m_domain *, d->nr_altp2m);

Note that new code is now expected to use the xv*alloc*() family of functions.

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -619,6 +619,8 @@ struct domain
>          unsigned int guest_request_sync          : 1;
>      } monitor;
>  
> +    unsigned int nr_altp2m;    /* Number of altp2m tables. */

We may have had that discussion earlier on, but it has been too long ago now:
Why is this not an x86-only field (i.e. in struct arch_domain)? Or one
dependent upon CONFIG_ALTP2M?

Jan

