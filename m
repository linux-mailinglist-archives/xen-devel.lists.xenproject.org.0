Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC10EA5F9CE
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 16:27:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912480.1318725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tskSp-0004Vk-H0; Thu, 13 Mar 2025 15:27:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912480.1318725; Thu, 13 Mar 2025 15:27:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tskSp-0004Tt-EK; Thu, 13 Mar 2025 15:27:15 +0000
Received: by outflank-mailman (input) for mailman id 912480;
 Thu, 13 Mar 2025 15:27:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tskSn-0004Tn-V2
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 15:27:13 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a27a1242-001f-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 16:27:12 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43cec5cd73bso7512925e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 08:27:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a8c5cbfsm56258725e9.30.2025.03.13.08.27.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 08:27:10 -0700 (PDT)
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
X-Inumbo-ID: a27a1242-001f-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741879631; x=1742484431; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=alBDaBhSc5c+ErX7HU9SuN15fStMCIq+BlkRU6K+X5Y=;
        b=TrBzCHIh/Cp4/V/WWk8pk+/4BXgN9QuRCMBY3PotltRUo0qoZyyzbPrmRVoQG8J2WH
         drCsDyWh/j621thh1t/BGH/cmRzacMLnry3Q19IRkGUwPoEiZQTm9rRpFrc+VJX3lQuR
         cQbhb3cKKfE1ANHlx8ZCersezHERdxx4M7B/7hYV4x20qrDQztyDpXTX4bgo3lj9OYnh
         bl9pV3EYoxLlbUO2HrUl4nwina6fxyI0G6n1UNiTwDQLLI8JdlPKrDHQ/RYhB1oXQYgO
         dG+fx0McoMLvONRmlabGPZyd+yPwS23iL66odXmp22R7lDM2cDjCzxOu2k5kWnLIOJRd
         Bfxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741879631; x=1742484431;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=alBDaBhSc5c+ErX7HU9SuN15fStMCIq+BlkRU6K+X5Y=;
        b=OaoaZ1RTthE3z9UkjXpnufhRDQoHtSNpVSPBwJK3EADGocC7qmgJ2ROwkSSxygy8Qe
         oQoR+NsPQN+vMHRvvOEBfaw5EcRW+ucIuvYQJKYEafgHTkn6aVfF25r2C0IpIbqi/FVl
         U8dVFO3GHf8PRFZnIK/5zLY/M2t/81oe1cj8C8qw7QuvqFAm5NoR1MRGbekgmq8KImKy
         l9tS6a7bd/Oteru8KtMxOcu6yCje6rq/+p7XoT9I8/WHVpplkfs7DtK7RXS81bhBYCt0
         cY9JC696lH1X9/j9RQpRuT0ThHDj+nExRnLB5D9valCwU6oR6IJC698yL0mBu6qU3c/M
         uEUg==
X-Forwarded-Encrypted: i=1; AJvYcCUo4Ovt7K+qSGPc90Geg/it3wW6sbVf60jVLbUNPd0krF0Nvn6u9AV01W+NbHa4oWc95Ohjp42AGk4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzCVBcDfKiI46LXiVekZrLezqVQooLJg7fs81uB7gLVaXgKlQyq
	EX55pmylZW+KCendc9UYIyEKVSBYIl1ILi6GGAn80l5xsf7a0+sY2XQSqtGSMg==
X-Gm-Gg: ASbGncvQ3uI7+qbb3lqteS9SByr9IMpstVcNsRjGOS2Nt3rl9PE41TI3lOaRJ1vP4Rq
	DtfY8RcgWVjwCCai5saXdCWaKC6s5execON0dcuK5Stzm2WfNg6C1n88s7NHI6/IT8A3NIY1V67
	TPhKO4lbUDCqtx82uTALIBpuw871+IAjgjc5kjPCrqbg8U16su7jTLaKRa/77UdMMOmyP6KoPTE
	IYdjAf1jG8SGvZU1GoSMHdRX+GdpAnNyyzuNnGMBNVg7bnJITjRjT+f3aUdFU/hVlM2JIHXqvzr
	oSKXoXNx189sYsYaOjXxE9FuDQR9a/C0W4Mq9UFYUccKrkIJvSzhQ+GOaGKjcLyj5NDWqSTxn2E
	JmXiJHcDQ2kStu5Hzd+0sR8HXDufujA==
X-Google-Smtp-Source: AGHT+IGmVR/TOUzIToShXO3FgHWt/dMtni1Ow7ibAk/O4+8qKajuB70IkZVHEqGGzP4DAiOOJSO7/Q==
X-Received: by 2002:a05:600c:1c8f:b0:43c:ec28:d301 with SMTP id 5b1f17b1804b1-43d1d8eb09cmr380555e9.26.1741879631321;
        Thu, 13 Mar 2025 08:27:11 -0700 (PDT)
Message-ID: <ddbf31ae-5877-4df2-a6c7-8b0251ce2b01@suse.com>
Date: Thu, 13 Mar 2025 16:27:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/16] xen/arm: introduce a separate struct for watchdog
 timers
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>, Mykyta Poturai
 <mykyta_poturai@epam.com>, Mykola Kvach <mykola_kvach@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1741164138.git.xakep.amatop@gmail.com>
 <18a8a86ca0c1b884278d635fb18b3b53e062f10e.1741164138.git.xakep.amatop@gmail.com>
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
In-Reply-To: <18a8a86ca0c1b884278d635fb18b3b53e062f10e.1741164138.git.xakep.amatop@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.03.2025 10:11, Mykola Kvach wrote:
> From: Mirela Simonovic <mirela.simonovic@aggios.com>
> 
> Introduce a separate struct for watchdog timers. It is needed to properly
> implement the suspend/resume actions for the watchdog timers. To be able
> to restart watchdog timer after suspend we need to remember their
> frequency somewhere. To not bloat the struct timer a new struct
> watchdog_timer is introduced, containing the original timer and the last
> set timeout.
> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>

A From: with no corresponding S-o-b: is potentially problematic. You also
can't simply add one with her agreement, though.

> ---
> This commit was introduced in patch series V2.

Yet, btw, the whole series isn't tagged with a version.

> --- a/xen/common/keyhandler.c
> +++ b/xen/common/keyhandler.c
> @@ -305,7 +305,7 @@ static void cf_check dump_domains(unsigned char key)
>          for ( i = 0 ; i < NR_DOMAIN_WATCHDOG_TIMERS; i++ )
>              if ( test_bit(i, &d->watchdog_inuse_map) )
>                  printk("    watchdog %d expires in %d seconds\n",
> -                       i, (u32)((d->watchdog_timer[i].expires - NOW()) >> 30));
> +                       i, (u32)((d->watchdog_timer[i].timer.expires - NOW()) >> 30));

I realize you mean to just do a mechanical replacement here, yet the use of
u32 is not only against our style (should be uint32_t then), but it's also
not clear to me that this subtraction can't ever yield a negative result.
Hence the use of %d looks more correct to me than the cast to an unsigned
type.

In any event the already long line now grows too long and hence needs
wrapping.

> @@ -569,7 +570,7 @@ struct domain
>  #define NR_DOMAIN_WATCHDOG_TIMERS 2
>      spinlock_t watchdog_lock;
>      uint32_t watchdog_inuse_map;
> -    struct timer watchdog_timer[NR_DOMAIN_WATCHDOG_TIMERS];
> +    struct watchdog_timer watchdog_timer[NR_DOMAIN_WATCHDOG_TIMERS];

An alternative would be to have a separate array for the timeout values.
This would also save some space, seeing that on 64-bit arches you
introduce 32 bits of tail padding in the struct.

If we go the struct watchdog_timer route, may I at least suggest to rename
the field to just "watchdog", so things like &d->watchdog_timer[i].timer
don't say "timer" twice?

> --- a/xen/include/xen/watchdog.h
> +++ b/xen/include/xen/watchdog.h
> @@ -8,6 +8,12 @@
>  #define __XEN_WATCHDOG_H__
>  
>  #include <xen/types.h>
> +#include <xen/timer.h>
> +
> +struct watchdog_timer {
> +    struct timer timer;
> +    uint32_t timeout;

This wants a brief comment mentioning the granularity.

Jan

