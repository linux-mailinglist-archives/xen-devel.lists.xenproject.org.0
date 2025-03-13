Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E87A5FA0D
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 16:34:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912559.1318825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tskZj-0003gr-2Y; Thu, 13 Mar 2025 15:34:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912559.1318825; Thu, 13 Mar 2025 15:34:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tskZi-0003fD-W7; Thu, 13 Mar 2025 15:34:22 +0000
Received: by outflank-mailman (input) for mailman id 912559;
 Thu, 13 Mar 2025 15:34:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tskZi-0003et-0V
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 15:34:22 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a23c5f67-0020-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 16:34:21 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cf680d351so14364545e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 08:34:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8975bdfsm2427800f8f.49.2025.03.13.08.34.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 08:34:19 -0700 (PDT)
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
X-Inumbo-ID: a23c5f67-0020-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741880060; x=1742484860; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1U6KbHgJk/A4QogaJcyi8hjwZ25d4EMtds+JZgCbC24=;
        b=OcU9x0oLnjvC9O/6XsUjrCInevIYbcsOn+TWL9zxkeko48lmDFXuwaeuo3qfXfjCMN
         vkClhyzbJk7Z2t4rX72SzxEdxbGWkkEsJfyiOCXoO2S8amVKWph5AZuG9AfhtY82y6wB
         u2gRb1qHNuqXcJBVTwxL5fHPpL4zkTSiXXOSSIkQjLLN07mCZBwBZwPb9BbIckXzpEoQ
         HMYB3x5fanIGDy9uTZY6/2FXEnw6zhzIY0nz7+IwB0ZC3iuATLaqubn3t8x5M6lHvj5i
         qGmPFaKkHZx8II5zfvFMtR/52imjx8VaP3RRGwv9edpiiA9k1Y4QlM9rIxKeZ7aPR0tF
         ox5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741880060; x=1742484860;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1U6KbHgJk/A4QogaJcyi8hjwZ25d4EMtds+JZgCbC24=;
        b=rTH/jlIjOTRbAKrxisWZIkwYw82eTg5ot9J49suTJ575JOAm0/fOVAz7sqcScMwGoR
         sq59D/O6TVSv8ri4j2xg8chlT9E4ukyyM1SiLko0rKEfR0LLXoPNzaZfmjyalSVkGwkl
         nVadIyFRjBkrmmaf6NbB2322GikiiDUVwHJlppGRjR4inVBHPNlVjsRramc0x8+f6btg
         cQp0gW/PRU2H3gF3TTx0GGsA3SkT6xnPi8OKT/BMIl9zMgETfbWMC1rGuuHwAclqTNZV
         R1QGXPa74iBPGNSz9LU82eC92YzB3yx/68NR8MUHOJIUxL+WcbkqCCuywPCbeA2MrOO5
         jqYw==
X-Forwarded-Encrypted: i=1; AJvYcCUzAgGNtfs+uEen71xLd0WTHKW2WfXrhGK5Dm0WjdCy69GzkXaoFxijyqUNCgioX2+WmV7l1OG9Rwo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5GHuvkxwTy8uLUr86CdOp/Wl3nIQgg2sVSiTbWbXLpxH1omu2
	O7w2d77a+Fsol8lqpsnMGOoiS2B2kDSrZ5EhUgjQe2iU5wO/MPtNfcjzkSqfFg==
X-Gm-Gg: ASbGncsfAdNfxImjumXsNuELiaAb290xogZZ4m7q7kZesUuqi3XKRvVDy7IpYUUTC39
	5BStu29imNwGXxcPuZT8u8MvnK3lI9cfAuOA2ZrTcPrH9N6jqYgQdF5ZbZC4jucIXsbelvjnUKy
	9WI1J7Vdx6HOK/m/bgUsHKLs1n72d1bjkO778khAzwZhpe3N7P6f6vcJPb8eex/b58jN327b9RC
	TSnI7eZz6IHBTEpRry0k77fOMorrym38TUi2RX8DePLgSyNB7GWEPzy9kak4IEDEEpGmLtU8gIH
	iiGUtwj25v1I7NqEq4ZSg+V6Qvovd3e/m30kU6Nmr1p0yQi+cbq5oYr36pqcb4vffDKeRx0nGB+
	rD4RyHZJVkqqLFduC3qVRdgBPMxtuOFDGWO51QHCT
X-Google-Smtp-Source: AGHT+IHsdaYcNyrNU+Id3PVF8IRLEKMaXxo6kEhE3RVVH2DmD+rnbGVJ2bx23ZBAvUsBkeMwCMoPwQ==
X-Received: by 2002:a05:600c:3143:b0:439:4c1e:d810 with SMTP id 5b1f17b1804b1-43d1808593dmr26199555e9.9.1741880060426;
        Thu, 13 Mar 2025 08:34:20 -0700 (PDT)
Message-ID: <428f538a-0761-4d06-9c4f-ba74cf441b0d@suse.com>
Date: Thu, 13 Mar 2025 16:34:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/16] xen/arm: add watchdog domain suspend/resume helpers
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Dario Faggioli
 <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Mirela Simonovic <mirela.simonovic@aggios.com>,
 Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
 Mykyta Poturai <mykyta_poturai@epam.com>, xen-devel@lists.xenproject.org
References: <cover.1741164138.git.xakep.amatop@gmail.com>
 <15604985aae5333670467a84cccbaaa403a10000.1741164138.git.xakep.amatop@gmail.com>
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
In-Reply-To: <15604985aae5333670467a84cccbaaa403a10000.1741164138.git.xakep.amatop@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.03.2025 10:11, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> This patch implements suspend/resume helpers for the watchdog.
> While a domain is suspended its watchdogs must be paused. Otherwise,
> if the domain stays in the suspend state for a longer period of time
> compared to the watchdog period, the domain would be shutdown on resume.
> Proper solution to this problem is to stop (suspend) the watchdog timers
> after the domain suspends and to restart (resume) the watchdog timers
> before the domain resumes. The suspend/resume of watchdog timers is done
> in Xen and is invisible to the guests.
> 
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>

From: != first S-o-b: is always raising the question of who's the original
author of a patch.

> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -1605,6 +1605,45 @@ void watchdog_domain_destroy(struct domain *d)
>          kill_timer(&d->watchdog_timer[i].timer);
>  }
>  
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +
> +void watchdog_domain_suspend(struct domain *d)
> +{
> +    unsigned int i;
> +
> +    spin_lock(&d->watchdog_lock);
> +
> +    for ( i = 0; i < NR_DOMAIN_WATCHDOG_TIMERS; i++ )
> +    {
> +        if ( test_bit(i, &d->watchdog_inuse_map) )
> +        {
> +            stop_timer(&d->watchdog_timer[i].timer);
> +        }

We generally prefer to omit the braces if the body of an if() (or
whatever it is) is a single statement / line.

> +    }
> +
> +    spin_unlock(&d->watchdog_lock);
> +}
> +
> +void watchdog_domain_resume(struct domain *d)
> +{
> +    unsigned int i;
> +
> +    spin_lock(&d->watchdog_lock);
> +
> +    for ( i = 0; i < NR_DOMAIN_WATCHDOG_TIMERS; i++ )
> +    {
> +        if ( test_bit(i, &d->watchdog_inuse_map) )
> +        {
> +            set_timer(&d->watchdog_timer[i].timer,
> +                      NOW() + SECONDS(d->watchdog_timer[i].timeout));

The timeout may have almost expired before suspending; restoring to the
full original period feels wrong. At the very least, if that's indeed
intended behavior, imo this needs spelling out explicitly.

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -1109,6 +1109,15 @@ void scheduler_disable(void);
>  void watchdog_domain_init(struct domain *d);
>  void watchdog_domain_destroy(struct domain *d);
>  
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +/*
> + * Suspend/resume watchdogs of domain (while the domain is suspended its
> + * watchdogs should be on pause)
> + */
> +void watchdog_domain_suspend(struct domain *d);
> +void watchdog_domain_resume(struct domain *d);
> +#endif /* CONFIG_SYSTEM_SUSPEND */

I don't think the #ifdef is strictly needed here?

Jan

