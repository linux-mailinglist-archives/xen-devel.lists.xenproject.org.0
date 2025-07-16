Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03791B078F0
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 17:01:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045314.1415404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc3dE-0002PC-C7; Wed, 16 Jul 2025 15:01:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045314.1415404; Wed, 16 Jul 2025 15:01:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc3dE-0002N2-9R; Wed, 16 Jul 2025 15:01:16 +0000
Received: by outflank-mailman (input) for mailman id 1045314;
 Wed, 16 Jul 2025 15:01:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uc3dD-0002Mv-BO
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 15:01:15 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b15d75a4-6255-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 17:01:03 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a6d1369d4eso3866249f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 08:01:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de42abf9fsm132458745ad.59.2025.07.16.08.00.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 08:00:56 -0700 (PDT)
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
X-Inumbo-ID: b15d75a4-6255-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752678063; x=1753282863; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yVAJgdxVm3wD3Alhp+hd748LiF/Y5PhfWLChjg0z27w=;
        b=IlOTVDRv4pwOZKCtioRehofEU/aviznWp/sTXqv6Y+71C1tX8HqXz4arUsPNnGNZj7
         p1Acqnwmml77GI3mxaYy8qnnM2qYh3FWVHwxMsqDqFOQcLa0P5pz0YyxHoVckSR8mZyT
         McSZVdgerLyibg9lEYtoaanbtviYTXxuUHcKJ7Rtn86L+87tnI+BbqMSJ4SpuiFj0H3f
         g9c9oiXcd90P1c8HxpRhH/8PV7RZNRotS8Q1NWHs9cYqjmrIyVSUBBRK0kPMw7LTm1RN
         Z589++PGyWypI/ZFgjxhYIZO8GDIs00cOHL6ueLJesUe6XNLxf56u5JyPW1l2isx72FB
         yS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752678063; x=1753282863;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVAJgdxVm3wD3Alhp+hd748LiF/Y5PhfWLChjg0z27w=;
        b=SECjOv57lvXFvBpm+k5kyC0qFOwxcskZN+SsRpvQhP6wZozkgNRKaK/RpmcOUvTtLN
         mXnabMdFhdCT7FDxmH4z3segKWCqMGuIAOrvxYsM5xqpHpazgXg5JECK0Wu3PrXbiWU6
         xzU0wjRvgoVWfaDEXhHqpmLetDWECeWn30WMAk8+yI++EyBb57VFXEF9EHvRgDhzPtCS
         B860crW8hwHCLWBLFVVa5rC33S0kwNOUIrra3u7rr99zpf97kEGoCeVSz7EJZ7i+jqlx
         r41yCmwOIYLbjtuR4OGr5AQA5KwAhzSyT2SOLEElDn5pKEZ2GkrG61P/MpTb1UhE5Wk8
         vHMA==
X-Forwarded-Encrypted: i=1; AJvYcCXEC+sMleMonJG5+YLwGj445Dj17RxzPECeTBugcQYWhdGmc1V9VBmIYipYF8WNH3PvhvANmBmmaRQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzvt8e87b2RQe9Uqho+0JQee227RJwZrZtCmwCt2NLMv6j1aJP7
	LGHAb8TxJ76klhhrAJ28nbL7dP8CJBntL1MyMTOCuWlNgMrKJwMn4RgHFh/86V7Ko/2y9rlRe1K
	BaoE=
X-Gm-Gg: ASbGnctA6Fdh654oUkps36kkxyV+OI2Zp05k7/J+c9qrSUf/DA+FmvBX4T2JMRbv/8B
	4SK90vfBdbjY9sJRymDmBMZtrD2T0ETE0xFVeiHXo2B5N6DKIOLuw5C/WprlxApk0WesRVKiPzh
	bltze+j85o6SHZG1hGVuEs0TKGMGkoikWPy19qdUcAevEf50tKlRa944yuUHry6swxzhEZaIUkW
	mUf0jyIuthuEcQAuCKrhlFmLtqDwIK0hA74xH5VeB0QPMMKqBf9T0EkKThO6Fmg2mzvV1vX0MYC
	uy8BRnhSc1JDI80/w55LMTs529JBbN7eFtxxkJlKWdgzWn1Ukvw3dNGC7es0zl66rAe/8c7lkJ+
	ka5k2VFzGzVONyU5qXVwC06WbG4U/DB2bp4syTVBCrN05xM7l4OHiw7ztk2FeYFue+Rm8hDL3XP
	s17EeBJZE=
X-Google-Smtp-Source: AGHT+IFh2N0IgQYiZ0nyWRB1mUzqZuZ1Fu9mSJ5ubcSjKRkqnKZrzyRgeIaiw2IMA7ty8KUUTyL7vg==
X-Received: by 2002:a05:6000:2002:b0:3a3:7ba5:9618 with SMTP id ffacd0b85a97d-3b60dd95c7dmr2690456f8f.29.1752678062644;
        Wed, 16 Jul 2025 08:01:02 -0700 (PDT)
Message-ID: <e9bc1036-2ab4-4e9a-9d43-8e11d4f67776@suse.com>
Date: Wed, 16 Jul 2025 17:00:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/19] xen/cpufreq: refactor cmdline "cpufreq=xxx"
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, xen-devel@lists.xenproject.org
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-6-Penny.Zheng@amd.com>
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
In-Reply-To: <20250711035106.2540522-6-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.07.2025 05:50, Penny Zheng wrote:
> --- a/xen/drivers/cpufreq/cpufreq.c
> +++ b/xen/drivers/cpufreq/cpufreq.c
> @@ -64,12 +64,53 @@ LIST_HEAD_READ_MOSTLY(cpufreq_governor_list);
>  /* set xen as default cpufreq */
>  enum cpufreq_controller cpufreq_controller = FREQCTL_xen;
>  
> -enum cpufreq_xen_opt __initdata cpufreq_xen_opts[2] = { CPUFREQ_xen,
> -                                                        CPUFREQ_none };
> +enum cpufreq_xen_opt __initdata cpufreq_xen_opts[NR_CPUFREQ_OPTS] = {
> +    CPUFREQ_xen,
> +    CPUFREQ_none
> +};
>  unsigned int __initdata cpufreq_xen_cnt = 1;

Given this, isn't the array index 1 initializer quite pointless above? Or
else, if you really mean to explicitly fill all slots with CPUFREQ_none
(despite that deliberately having numeric value 0), why not
"[1 ... NR_CPUFREQ_OPTS - 1] = CPUFREQ_none" (or using ARRAY_SIZE(), as
per below)?

>  static int __init cpufreq_cmdline_parse(const char *s, const char *e);
>  
> +static bool __init cpufreq_opts_contain(enum cpufreq_xen_opt option)
> +{
> +    unsigned int count = cpufreq_xen_cnt;
> +
> +    while ( count-- )
> +    {
> +        if ( cpufreq_xen_opts[count] == option )
> +            return true;
> +    }
> +
> +    return false;
> +}
> +
> +static int __init handle_cpufreq_cmdline(enum cpufreq_xen_opt option)
> +{
> +    int ret = 0;
> +
> +    if ( cpufreq_opts_contain(option) )
> +        return 0;
> +
> +    cpufreq_controller = FREQCTL_xen;
> +    ASSERT(cpufreq_xen_cnt < NR_CPUFREQ_OPTS);

This would better use ARRAY_SIZE(), at which point NR_CPUFREQ_OPTS can go
away again. What's worse, though, is that on release builds ...

> +    cpufreq_xen_opts[cpufreq_xen_cnt++] = option;

... you then still overrun this array if something's wrong in this regard.

Jan

