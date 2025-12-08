Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCF3CACA06
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 10:17:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180268.1503485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSXMg-00019h-Ur; Mon, 08 Dec 2025 09:17:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180268.1503485; Mon, 08 Dec 2025 09:17:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSXMg-00018B-Ry; Mon, 08 Dec 2025 09:17:06 +0000
Received: by outflank-mailman (input) for mailman id 1180268;
 Mon, 08 Dec 2025 09:17:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSXMf-000185-GP
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 09:17:05 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8a96d93-d416-11f0-980a-7dc792cee155;
 Mon, 08 Dec 2025 10:17:03 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-42e2e167067so1813532f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 01:17:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7cbfeb38sm24160106f8f.12.2025.12.08.01.17.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 01:17:02 -0800 (PST)
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
X-Inumbo-ID: a8a96d93-d416-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765185423; x=1765790223; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TFPOJzpt+3xOHs+Vf1YpOTXAtessmORrgUmgZl54Mss=;
        b=fm+x9h6EOWJ5Hr5x3pb8WHGj75uhRG8eG8gnwXGiS9wO/JhK0RKS31SuYuR+MlHxTi
         a0wAYaYJXVYA2pcgeZVyyKykO/erUrCLJcyFalJG7MQs44umT27evqH81QkI19ryDQYe
         mqEyM+dT9IZ+RYwruNprPQ+k5iePCH2wp0YoWsKXZT3eIuQyTeRCpK69d+X0uOT43VjS
         Xn9Qej8l5bauFyi4mimWH84BXuRyPRjgMXoux8V1vv2vQSoenLLq2dS2qs9PxyYBdMex
         DUD5/yuJUbXZMLNP/8KSjv18/Gp9cZ2rB1HQWVsq2aXtpWLuyN2PDhKdZDvabevSg1vF
         HShw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765185423; x=1765790223;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFPOJzpt+3xOHs+Vf1YpOTXAtessmORrgUmgZl54Mss=;
        b=L82V6si/bkwIU1sieANv2YNBAHBc5LHDajpClxPqkL0w1bR7zx0ydnmuUqeUkwejeb
         RPKt1rT4k24CoRO14UM5+vo09mmuApd1sSA5oCi7/TEhfwZw5ftX3AzQni+/pizT0VAf
         dnfhpgwDZzsG1iq4YAd6qPrSCE4eFYmPXhghAT7HaXS5k2O5GLp+n/MOQuMLQN4jvfZq
         +zdS/j0Uqu3HGrPZ2Dmy4cXCi2TXhJeFQVRky/4uLtNaAW8LVFj88t9b6UMEkO+4QLYm
         ihFf7lLSUsdGGmA3G+eRho+/1xBajQdkY03esuNadDBQUPKLjYIlKRdpNRLAjTyPuaFm
         cKDg==
X-Forwarded-Encrypted: i=1; AJvYcCWYmOivgwZGqmo9z8gWuzZSCnTzjHHqOJL0lqtgZQghbBn7ywbPz6dnr1PEhep4RlXvJKG9/vdzy1s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyFnKelo3M+jn1OHEQBeR5Bj1gtwG4cJxWN3uJSJEZ9TS0pGToT
	gOH+pdG+73YYuGjM9HLOVzmV+UfePcV9u9KYthDRbsJlygZl9qCPUkWF7Kt3mzPYNw==
X-Gm-Gg: ASbGncuaJ+bxHx1EzAex3S/lGInLfJRVVe5B/gfgLBqaWlhgz8hoR9nGieOTqbjYb79
	jM3oQ2wXdHtdrwh3UbUQYPjzNQuKTP+DOc2zwb2/E7CAaAwEsvm0mLgupk1B09H16/noW1wa5T9
	KRhqYnvD0lcxOt+25hnZiL0iH8MUaDRcFLRcRoG6bxqOjmVc2WpbA51kub6o5cHVnM2/jAsrAMa
	b7jWGQp540v3IfWdBwXQ2MyE0gPFtm5NliQ+OKJrVFFacaPZC9mCJkOn59SJgOf7SC4kXdjEl0u
	/3qzkOhT/5IGXaD/iS4Fch0uMMLyGhU7JyyBWEJs9NrShVGnYwVdNgl9YyEIJRwevbRH8T0xIzs
	FLQHne6yy4USj4bCm3qm4E4ZF+RUUv5bObnBGA8oTLUCb/58y0/TrvKVv/lIy51Nz9d+t3VkfbU
	R+4Q41gdGBorc65FsSBiQmxwzxhw1wltUYJCr/p4PyNh8ASlq8SKIVO+Lq9WTpFKiTnYKA0p+2V
	qU=
X-Google-Smtp-Source: AGHT+IG1C0kb/+DTvo4veVGF4wISU74hwEOB85t41tCQqiqMFq4nd5P2XJZfCyBflsYvVjba1tvuhw==
X-Received: by 2002:a05:6000:2003:b0:42b:3e60:189d with SMTP id ffacd0b85a97d-42f89f0e212mr6973458f8f.24.1765185422670;
        Mon, 08 Dec 2025 01:17:02 -0800 (PST)
Message-ID: <55f40e49-027b-4162-94f0-54573fb1abc0@suse.com>
Date: Mon, 8 Dec 2025 10:17:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/amd: Fold another DE_CFG edit into
 amd_init_de_cfg()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251202105710.1472927-1-andrew.cooper3@citrix.com>
 <20251202105710.1472927-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251202105710.1472927-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.12.2025 11:57, Andrew Cooper wrote:
> Fam12h processors aren't SMT-capable so there are no race condition worries
> with this path.  Nevertheless, group it together with the other DE_CFG
> modifications.

With this, ...

> Fixes: d0c75dc4c028 ("x86/amd: Fix race editing DE_CFG")

... isn't this more like Amends:? Aiui this wouldn't need backporting.

> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -920,6 +920,13 @@ void amd_init_de_cfg(const struct cpuinfo_x86 *c)
>      if ( zenbleed_use_chickenbit() )
>          new |= (1 << 9);
>  
> +    /*
> +     * Erratum #665, doc 44739.  Integer divide instructions may cause
> +     * unpredictable behaviour.
> +     */
> +    if ( c->family == 0x12 )
> +        new |= 1U << 31;
> +
>      /* Avoid reading DE_CFG if we don't intend to change anything. */
>      if ( !new )
>          return;
> @@ -1201,15 +1208,6 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
>  					    smp_processor_id());
>  			wrmsrl(MSR_AMD64_LS_CFG, value | (1 << 15));
>  		}
> -	} else if (c->x86 == 0x12) {
> -		rdmsrl(MSR_AMD64_DE_CFG, value);
> -		if (!(value & (1U << 31))) {
> -			if (c == &boot_cpu_data || opt_cpu_info)
> -				printk_once(XENLOG_WARNING
> -					    "CPU%u: Applying workaround for erratum 665\n",
> -					    smp_processor_id());
> -			wrmsrl(MSR_AMD64_DE_CFG, value | (1U << 31));
> -		}
>  	}

Are you deliberately getting rid of the log message?

And I assume it is deliberate that the adjustment no longer is done when we're
running virtualized ourselves?

Both imo want making explicit in the description.

Jan

