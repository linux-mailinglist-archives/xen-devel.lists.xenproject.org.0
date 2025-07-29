Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 311BCB14AD7
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 11:11:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062326.1427977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uggMu-0005EF-HG; Tue, 29 Jul 2025 09:11:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062326.1427977; Tue, 29 Jul 2025 09:11:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uggMu-0005B8-EP; Tue, 29 Jul 2025 09:11:32 +0000
Received: by outflank-mailman (input) for mailman id 1062326;
 Tue, 29 Jul 2025 09:11:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uggMs-0005B2-Fr
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 09:11:30 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02a64020-6c5c-11f0-a31e-13f23c93f187;
 Tue, 29 Jul 2025 11:11:28 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3b791736d12so266611f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 02:11:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f7f6ae8bcsm6575062a12.46.2025.07.29.02.11.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 02:11:27 -0700 (PDT)
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
X-Inumbo-ID: 02a64020-6c5c-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753780288; x=1754385088; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tHBkdccADiS9LpGZe+sCGN0n9GDyCNbJM1F+VRsueDk=;
        b=V+9+VYbnwS7Jy/zyWLKzCFTja11bKw6hcykvKcGFBKGGE9TIm7ITrV2LiR5+UagC+D
         xc5ZEcq1NFR7inj5oM0SSSMBAqPG7CmGbGHGHKbVSsg8Hb+ePi5UPrmC/TYM69Y6yfNL
         YmcUyGi58WxQDhCSq35yPHjCkY0dC9mCDuD+oJcsi2Kkc0Rhk3mdZ8Vg/xd1zqmSGGAp
         xzvoDjQMCeRSTwlc5pyE/AwurmdeTylqb92hHuo2DQNj1hxaBtaropjJjfJuz6FRm2wg
         qLdwvujAjPLdWw/gZn+aVlUETSGcucQVJQ/Xp41iAMOmoi/eccJSyY9p7HFaQvHfVxdm
         8l1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753780288; x=1754385088;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHBkdccADiS9LpGZe+sCGN0n9GDyCNbJM1F+VRsueDk=;
        b=WvQFMPa8IsybFp5o9qhHGRGsrTo236gLH3hEuLKYUpiNCSW4VCuTUaVXO4ouY0X4ak
         DpyMrl+6qa3eIQtqFnEbkV8tXeu7iFy6/BwClxwzNwDOR/vEgSMrxBxONNd5T6hsInCV
         +cF3J/NhfJ7DB3puMv8E/XIrxhtho13iOhmylGwhby4YA0teW6ap+s7LXO0uaX4//l4l
         nmURiGNx8tdhGwaEBrOQ6lg9zrz14NGoz8EK+GHHiIyzA5gFsv2CDs7z4WGfrcdYRYDy
         VFHOViPguuajl1ypnGWHaVC7P1pgA3Tl2Y3zMM16XT5USgWdBCMk+qleGJtvB6BKzV4W
         yWNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWG79uJKLvCnI29rlnIPBbxKFp0K4SdEQ4TNfjXn6qh2Gl8MeKWMsJCcfOKcKoKF5mQgos1wiKYeT8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx/mEGi4P7vtiPLEJmf3cJZ0VQT4fJzKJU2iaiWT/fRo1Pe/9YX
	P/JYoX2OWWcX9O+7uXVEwxvxv6l9hJ9PCnWI2F3t94RYRmvA0b/OpNKZJYrf14uSyw==
X-Gm-Gg: ASbGncs3dNIzlh84LmMrjT2iChq/NHv8dwtpAECcLtgAN+ST9leTZzEKV0ve0nqFE6G
	jZ4+obEiKly1SnHgpPkqOWxLy+owikl+wO46w0K8DMA9ZMxV8Cgb2zaGBkSm0lk8ncKqVnHcMdQ
	b7BQEzqdQ3xibDXdEy1yZ5RhTuaM/5nzmxIEWfBpznY15ehUxjTk0sdG3zET8PXFxbxpbMZdRPH
	Ccj7utqbW0tQMmPwe/jqEc8LSa6POjjofoesCD6eE1Dl4hHY0UPhkQD33FiSQsmd/hY0xO/9L10
	RIQDbqbijl74cOujZzoYBeJLYRSGIYAo+OpjYcWPG5xVlt/HuSxeJT7OMQP6Un2ohLb3mdPdEzg
	aTLxrT+zeZ9vy9JFkP388WAc3gm0Om2r8+8WnBG3ylnN/s18UQDXcYV4NHYphkArkRzz7ur50yj
	gDjeffsus=
X-Google-Smtp-Source: AGHT+IF49MqTqEW7y0HVpRL/oS7vyt8t8ciJxsIvbXei90uobD0PTErjhGatMhItmv3nkhdtXHpPWQ==
X-Received: by 2002:a05:6000:2083:b0:3b7:924a:998f with SMTP id ffacd0b85a97d-3b7924a9d34mr969877f8f.5.1753780288238;
        Tue, 29 Jul 2025 02:11:28 -0700 (PDT)
Message-ID: <2e43ded3-d14d-49f8-bf98-f3d58d0b39af@suse.com>
Date: Tue, 29 Jul 2025 11:11:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
 guests
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1753778926.git.mykola_kvach@epam.com>
 <45e670391c37ab54f721b6576a41ded2e543d6db.1753778926.git.mykola_kvach@epam.com>
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
In-Reply-To: <45e670391c37ab54f721b6576a41ded2e543d6db.1753778926.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.07.2025 10:52, Mykola Kvach wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1334,16 +1334,15 @@ int domain_shutdown(struct domain *d, u8 reason)
>      return 0;
>  }
>  
> -void domain_resume(struct domain *d)
> +#ifdef CONFIG_ARM
> +void domain_resume_nopause(struct domain *d)
> +#else
> +static void domain_resume_nopause(struct domain *d)
> +#endif

#ifndef CONFIG_ARM
static
#endif
void domain_resume_nopause(struct domain *d)

to have as little redundancy as possible.

>  {
>      struct vcpu *v;
>  
> -    /*
> -     * Some code paths assume that shutdown status does not get reset under
> -     * their feet (e.g., some assertions make this assumption).
> -     */
> -    domain_pause(d);
> -
> +    domain_lock(d);

This addition of locking affects domain_resume() as well. Neither need nor
correctness are discussed in the description. If the locking was really
needed for domain_resume() as well, I suppose adding that would better be
a separate change anyway.

The addition of this locking is particularly interesting considering that
...

>      spin_lock(&d->shutdown_lock);

... is what follows right after.

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -814,6 +814,9 @@ void domain_destroy(struct domain *d);
>  int domain_kill(struct domain *d);
>  int domain_shutdown(struct domain *d, u8 reason);
>  void domain_resume(struct domain *d);
> +#ifdef CONFIG_ARM
> +void domain_resume_nopause(struct domain *d);
> +#endif
>  
>  int domain_soft_reset(struct domain *d, bool resuming);
>  
> @@ -1010,6 +1013,10 @@ static inline struct domain *next_domain_in_cpupool(
>  /* VCPU is parked. */
>  #define _VPF_parked          8
>  #define VPF_parked           (1UL<<_VPF_parked)
> +/* VCPU is suspended. */
> +#define _VPF_suspended       9
> +#define VPF_suspended        (1UL<<_VPF_suspended)

Irrespective of the style violations in pre-existing code, can you please
not add further violations, by inserting the missing blanks?

> +
>  

Please also don't introduce double blank lines.

Jan

