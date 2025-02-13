Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAE6A34B1C
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 18:01:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887900.1297334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ticZo-00078U-RW; Thu, 13 Feb 2025 17:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887900.1297334; Thu, 13 Feb 2025 17:00:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ticZo-000772-Ox; Thu, 13 Feb 2025 17:00:36 +0000
Received: by outflank-mailman (input) for mailman id 887900;
 Thu, 13 Feb 2025 17:00:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ticZn-00076u-6O
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 17:00:35 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09eb0d13-ea2c-11ef-88c1-8ba37f82fa57;
 Thu, 13 Feb 2025 18:00:33 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ab7d451f7c4so170713766b.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 09:00:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba533bdd04sm163209266b.164.2025.02.13.09.00.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 09:00:32 -0800 (PST)
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
X-Inumbo-ID: 09eb0d13-ea2c-11ef-88c1-8ba37f82fa57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739466033; x=1740070833; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lClqP5OKbcIxcTu/iRDlAEbAlKCA6vOx8/mcBN7UG1g=;
        b=XevhgIWaXNk5wZRNEKiiVbLTsgbQL/0seZ3SUJ98z3GeEZFFlQaIvFaiabDO5KheNF
         agfJGx+sD9w4cL8f1ZPfptD9SDSNjkDx9wnCJJZOZM2k6vNidGf0vEnWBczveIJtBoS8
         5AmCTshFMw/pfeN9IS+2fRVVxPQFW2QfVpt7qNiir9qiSnOMGy7PQZS4s5esnabK6bJu
         bg8zDJGZRc5wLvCJceuSFM2QYzZAU6TAhDt0WArPm9Hb+37IJKFKbswSskQTKLLUSUq1
         SbefdA+NWEeqzRKnKUQk4tRevc8PYvz5oAfTZaAyBbrUjvwqtsu1nsf+8UbvykRLSn39
         3A1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739466033; x=1740070833;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lClqP5OKbcIxcTu/iRDlAEbAlKCA6vOx8/mcBN7UG1g=;
        b=q5T1pt+grbnNN1/wxXEC3b+PeDQgAIodLLZVE5QW2/6r11Vya1AZf2ihFMPJIuyHgw
         Pjz2miVqbJdX/20cS6hRQe9IVtv9/wb/v7knITPXA/mlo/lYs8KbezgzUkh9/sfzfSOp
         Mzj0dyiHWGwbnAH9LPuweWIAjTE3xNDtawKnjZG7o7XL+nqNwH7BCh5HO4UQoomStxkR
         HVqOuNA5DdMCHETQjRleC07vEF/huU6CR7VcrFzvxWSHyNUzKV1XbQJxHwKczdNAUNmG
         pP9MGH8kKXdhy2kpeK/7PZp2StydEAFCpj6qYl/1rhWc+h9he+OkKK5cEZSahhPwdKuX
         PbdA==
X-Forwarded-Encrypted: i=1; AJvYcCWhb2t6MVZDBx8O/BHbzXc5DDZTZ7eCGVULSS/Yzvq8U66pZnWkTw3FlYSP83plDe5uMJ3wrKCC/NI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwAF6uMFU80/6MLWKKJ/x2SF6G+EvFKrVHwCOflLLs96CD8nEq8
	n3B5fcDdl9FDBMY6H7MnssarumdcHRFJqCPGUyM844v8P/GNqH1CMOPYfri+Xg==
X-Gm-Gg: ASbGncttusYwIwSuOuNKBxA8mCW70yHILyXHwm59nTRtS/k5l2EyyxKojXXt7XQ8htg
	PwyWB7Dz1oOrMPH83sH61oYEQ4w0zbVLnqh7PaWrecRPLaum+pOiQlUk9tPbNoMdG9wW4SZYauE
	tqTVdOMcNGoF/cVFhWPpjBiBrUaVOhSNPqX1jZneyCcBnX41eC5uelkipt5YJ/WNEc6V0SY7odV
	/UZuffevqZ2wT/pXoYNm/lzSENqvyginW7qF1wFth6aeP1kuIeiv1dz5cZc5/KdK3sLPY1RUETr
	gZC0vvt5h6jr2PYWIGJM7F3bmslOWpM4q9KgWSgSXsPGrcvpG3zhWwbysclOYXgBXuUf9+yVOr0
	e
X-Google-Smtp-Source: AGHT+IEq9gml+Ntq6jtAjpQYvlQegZ69u8ipMSTgofUrePQJREHJmutgYSHHfP4TZ+dtA9d7GJbn5g==
X-Received: by 2002:a17:907:2da1:b0:ab7:e3cb:ca81 with SMTP id a640c23a62f3a-ab7f33d316amr888565266b.30.1739466032921;
        Thu, 13 Feb 2025 09:00:32 -0800 (PST)
Message-ID: <7f105533-f80c-41f3-bf3b-8cf8dabdf02c@suse.com>
Date: Thu, 13 Feb 2025 18:00:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/watchdog: Identify which domain watchdog fired
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250213164618.38167-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250213164618.38167-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.02.2025 17:46, Andrew Cooper wrote:
> When a watchdog fires, the domain is crashed and can't dump any state.
> 
> Xen allows a domain to have two separate watchdogs.  Therefore, for a
> domain running multiple watchdogs (e.g. one based around network, one
> for disk), it is important for diagnostics to know which watchdog
> fired.
> 
> As the printk() is in a timer callback, this is a bit awkward to
> arrange, but there are 12 spare bits in the bottom of the domain
> pointer owing to its alignment.
> 
> Reuse these bits to encode the watchdog id too, so the one which fired
> is identified when the domain is crashed.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>

You'll eventually need a scheduler maintainer's ack, yet you didn't Cc any
of them.

> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -1534,12 +1534,17 @@ long vcpu_yield(void)
>  
>  static void cf_check domain_watchdog_timeout(void *data)
>  {
> -    struct domain *d = data;
> +    /*
> +     * The data parameter encodes the watchdog id in the low bits of
> +     * the domain pointer.
> +     */
> +    struct domain *d = _p((unsigned long)data & PAGE_MASK);
> +    unsigned int id = (unsigned long)data & ~PAGE_MASK;
>  
>      if ( d->is_shutting_down || d->is_dying )
>          return;
>  
> -    printk("Watchdog timer fired for domain %u\n", d->domain_id);
> +    printk("Watchdog timer %u fired for %pd\n", id, d);

And apriori knowledge will be required to associate the number with whichever
watchdog it was (network or disk in your example)? (No question that logging
the number is better than not doing so.)

> @@ -1593,7 +1598,17 @@ void watchdog_domain_init(struct domain *d)
>      d->watchdog_inuse_map = 0;
>  
>      for ( i = 0; i < NR_DOMAIN_WATCHDOG_TIMERS; i++ )
> -        init_timer(&d->watchdog_timer[i], domain_watchdog_timeout, d, 0);
> +    {
> +        void *data = d;
> +
> +        BUILD_BUG_ON(NR_DOMAIN_WATCHDOG_TIMERS >= PAGE_SIZE);
> +
> +        /*
> +         * For the timer callback parameter, encode the watchdog id in
> +         * the low bits of the domain pointer.
> +         */
> +        init_timer(&d->watchdog_timer[i], domain_watchdog_timeout, data + i, 0);
> +    }

This way we'll be promising to ourselves that we're never going to alter
the allocation mechanism of struct domain instances, always requiring
them to have at least page alignment. If someone wanted to change that,
they'll have a hard time spotting the logic here. Sadly I have no good
suggestion towards improving the situation.

Jan

