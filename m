Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9236B15DF8
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 12:18:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063695.1429416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh3sv-0003YG-VH; Wed, 30 Jul 2025 10:18:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063695.1429416; Wed, 30 Jul 2025 10:18:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh3sv-0003WP-Re; Wed, 30 Jul 2025 10:18:09 +0000
Received: by outflank-mailman (input) for mailman id 1063695;
 Wed, 30 Jul 2025 10:18:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSpT=2L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uh3su-0003WJ-EL
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 10:18:08 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b97b17a-6d2e-11f0-b895-0df219b8e170;
 Wed, 30 Jul 2025 12:18:06 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3b78a034f17so2378009f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jul 2025 03:18:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4220e6a680sm801741a12.58.2025.07.30.03.18.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 03:18:04 -0700 (PDT)
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
X-Inumbo-ID: 7b97b17a-6d2e-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753870685; x=1754475485; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aV9eUiyqp0IxXqFaIR75B2STF17yFSV8Hi/kdxA/HF0=;
        b=WDv7+5CVVvm+BwnU9jGs0rXrqZthWinyYahlt2XcVuwM6K5jBzpQ+TsgUhP6Zf7aH6
         JSe9L6VqlfrttLha6ccg3fwFws4KOsFIOCMGZh0uwfmGjR1FaHcJIpGAagirJy9DlG2p
         jh41+hKbrLO31hzJifTO3iPtNrzO9ckmK26ptqp8Mel9FylvQF84hnc29ZrWLqHuvvY+
         /qQHkIYT2gQelhM6/NBQO7UnXYY/hUvwKnVi/uRlWA2I/iTpaDCZtAefe2sQmfwb3T0R
         ai/grt5j3njpf0ozSshP6PKG9XJafGmAtznGzw4xkTWL/YGjO7VcYA2jSmhgPda9F/6p
         9rtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753870685; x=1754475485;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aV9eUiyqp0IxXqFaIR75B2STF17yFSV8Hi/kdxA/HF0=;
        b=iU8XH+SWOybwfAOypcp4oqmYZrTqUezl98zeKbqHxEM+MHxvwyOJNgqXFRFgs6vwer
         wJDbIBmBL+BZnL3oLz2/9hLL3DMsscVNMOzE+rgoj00zeyxmDACfJl4bkvI9Zj0/g/Au
         xagFTFlxAnuVZYw76N83Ve5rrTeRU4ClypiDzSwhT/GHUnevWFbaovfKSsMOyjMlihFB
         Dr/8uWCGsqfsuE2A4TyJWtLSXuUcfa+GM1VbjNUSdCmnpEsJogtFZooobgqk9LpMC+Dc
         +BIGBu2upkZ6wFeZAAIHIpD2A39n5A6JD7r3L+ODXVJN/u6iEgsQ77EVIAxfYSkTd+97
         jf3A==
X-Forwarded-Encrypted: i=1; AJvYcCWeCMPxOf0CFnC5rxbSmA80l00v517FSH7QmCBWqM+TZ+lMXUMzMt+yIySW6o2wCneBF0QfqPTHxqU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy3BQU85oTjvl13aHNri+UgFzHHuJVEIs9lcf1VIO/GrKRCek4i
	haU3sDOzTxPtmO6KCYLZR3k19QDqOqvrFb+veZpu51OZjeoKJf7ym5E7FJKqA4m+vA==
X-Gm-Gg: ASbGncsa2BxEZkyis+MEtMzjsOieKyTOnP9ZbbFGhluuutZfDRvoECVKx4bch7lAAcV
	jLsqPgsjR+sl+c5mrat1/oNnn2NUCqCd8rM+K/dXbzUg/gR7iqrP+WsYYD7DtexwFbqmjL0adJz
	nBAVtQ01hk+Dxf8vM3bCBLz73ZOPzeVZWjIboQaOIW6UF5bIliio/+neWBqUTWWt3Ikgy4gXoyi
	BX2Rwyf1pRjcKwNL7623vkoXDwBFk6pCk/JQPs3SS1lULusEoUF3HiQVrYdNbVYUPl+1xOjiqng
	qaAHYrutCpVv3CPkYU0AQp19TuL6cUjPWMDf9p4BLiLGM6IzrPtjSqeJAofwax7Ru7WKpMZVRWn
	L1pJcxHJEoA5l4lv5WIi0+yNHFbC958FYblHCvUqtIAfvpLgrYIDvRTLRucenZF3rAW8D/7AnGm
	7D6RaFYgo=
X-Google-Smtp-Source: AGHT+IE5+stoPetRskx+N7QhdjBECrCrvlKDu96+ccNWT6uHExW3LXGqv6/AduXohS+EzRTTeMXPqg==
X-Received: by 2002:a05:6000:2083:b0:3a6:f2d7:e22b with SMTP id ffacd0b85a97d-3b794fd73a6mr2248420f8f.18.1753870685267;
        Wed, 30 Jul 2025 03:18:05 -0700 (PDT)
Message-ID: <90d5df6c-b431-4256-b39b-4567ab5bf8c9@suse.com>
Date: Wed, 30 Jul 2025 12:17:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/17] xsm/silo: Support hardware & xenstore domains
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250716211504.291104-1-jason.andryuk@amd.com>
 <20250716211504.291104-3-jason.andryuk@amd.com>
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
In-Reply-To: <20250716211504.291104-3-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.07.2025 23:14, Jason Andryuk wrote:
> In a disaggregated environment, dom0 is split into Control, Hardware,
> and Xenstore domains, along with domUs.

Here we are with terminology again. In a truly disaggregated env, yet
more (service) domains would come into play. What you mean here is
only coarse disaggregation, as you're trying to get away without using
Flask.

>  The is_control_domain() check
> is not sufficient to handle all these cases.  Add is_priv_domain() to
> support allowing for the various domains.
> 
> The purpose of SILO mode is to prevent domUs from interacting with each
> other.  But dom0 was allowed to communicate with domUs to provide
> services.
> 
> To provide xenstore connections, the Xenstore domain must be allowed to
> connect via grants and event channels.  Xenstore domain must also be
> allowed to connect to Control and Hardware to provide xenstore to them.
> 
> Hardware domain will provide PV devices to domains, so it must be
> allowed to connect to domains.
> 
> That leaves Control.  Xenstore and Hardware would already allow access
> to Control, so it can obtain services that way.  Control should be
> "privileged", which would mean it can make the connections.  But with
> Xenstore and Hardware providing their services to domUs, there may not
> be a reason to allow Control to use grants or event channels with domUs.

"may not be" is too weak for my taste to forbid such.

> This silo check is for grants, event channels and argo.  The dummy
> policy handles other calls, so Hardware is prevented from foreign
> mapping Control's memory with that.

By "foreign mapping" you only mean what would result in p2m_foreign
entries? But grant mapping is okay?

> @@ -29,8 +40,8 @@ static bool silo_mode_dom_check(const struct domain *ldom,
>  {
>      const struct domain *currd = current->domain;
>  
> -    return (is_control_domain(currd) || is_control_domain(ldom) ||
> -            is_control_domain(rdom) || ldom == rdom);
> +    return (is_priv_domain(currd) || is_priv_domain(ldom) ||
> +            is_priv_domain(rdom) || ldom == rdom);
>  }

IOW we're turning by 180°? Interesting ...

Jan

