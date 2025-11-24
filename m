Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A1EC80009
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 11:53:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170264.1495342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNUBm-0006vD-RU; Mon, 24 Nov 2025 10:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170264.1495342; Mon, 24 Nov 2025 10:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNUBm-0006ti-O1; Mon, 24 Nov 2025 10:52:58 +0000
Received: by outflank-mailman (input) for mailman id 1170264;
 Mon, 24 Nov 2025 10:52:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNUBl-0006t7-6y
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 10:52:57 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb12c3ba-c923-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 11:52:55 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-477ba2c1ca2so42882305e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 02:52:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf1f365fsm191292965e9.8.2025.11.24.02.52.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 02:52:54 -0800 (PST)
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
X-Inumbo-ID: bb12c3ba-c923-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763981574; x=1764586374; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EnMyMpsa3EDwflxEWCohYtKKYgNJwAtKayhparUd0k4=;
        b=DZ47t66k1J2Loaju01twzRzZ2AzbfLeTiz72XZL44qFLt3YHIbgseffdA8TTqPszII
         3uQZYWqgzq+BqIoQo4uePbhDpv2WcBwViJHX3zYf7LIvXtPpwklg8qO3KBbTbGVhb4qO
         En1yUvhAd5RxueeCZewm8AHSKyfi7rB7LQGFQJh/luM6ISfZk1AH/xAOj90gnA6xtMk5
         N6/L+AplIrw3KpY/tG7Hy/Oo85GG2BYWnGFE6gL7XRYi9vqzxXHXXTfWUa/QkD+Ruu8V
         g80L8+NA8M24kGCDwyWf45BDDROLEA6phvNrnNtaj5zrQJsrO6mifEdiBM5MIURB6rY4
         D1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763981574; x=1764586374;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EnMyMpsa3EDwflxEWCohYtKKYgNJwAtKayhparUd0k4=;
        b=AYARk3F/tHwyMkIQzmZftS5gxUOIviByyQuCWsJbegNXuKwPRy+YPloOy3QJnvO+Me
         zy/62VaDKTLeICB1nMTT+ul0V0xqStU/cdSgf7LAmjMm5/3ErjUWlD6G83DFTt+WpE18
         69JruUkTA9UL3QxE40dXTfe48C3qHfPk/zmyEIX9E9PI6w9c5+vl/ClEQlxdhSli/qHk
         EID0p9xk3NBs2yw/kETuEmhaEo3w0OdjIdH5RaCe1EyeFQt7VpFZHGgmuuT88SMnHHz8
         qOem+wIEZxOkAJ1B3HBsh1CtFhKO0R7C9B7x8JclEIAaOsClsi+yut+IJDzh/pjLFMuu
         BnOA==
X-Forwarded-Encrypted: i=1; AJvYcCUxXSLGzW6VUj4FqmZcJc1w5zyPUQTKEd2JkDVI/rCTzO2ACb5Y9yo+XdpgVRLuY3sSRNpH55U3+QY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwY/QiWO53DLntfeYQm4SCl1MzebQnkR+b4FZ9VgMG1DJIw0wOG
	ao7QYEHz1PuuJButBQhkeB++5xBB3mNvtSMNOZkNAAHlzncnlpoemTHMyI70hJDPPQ==
X-Gm-Gg: ASbGncvaY824gCWYHHsOVIaof/qY/5heVnHmrGjPrk2T8k6TND4EyzHvNR7Fob02S45
	AaOR2YG68lVYZgqAIEJDgW5csKSLCTWxHnXSD4lM/gbYnWy6vJiTZXjjo9iewK64VUamuGSnvjN
	7SHvY+ePiGKu4NKfuoEVXDxUxY4MSC+6Yo9VSRlBnVbKHJXWYymxyiAj9TyemoF+El7GnCZo0TU
	rjCo3XrYO8v0IYsw9OfzyORZdds8d6KJyFL7zx4SBJFCMWF8jXA4T2zu0DAKu3HK/8vrH4OnOmR
	pZuZRAZg/Y0U10artO2ZGcMIlcEGsRHMlIGGPHJw/Li/B29ce0gTJ3oUb0s8rJKHNImGbYqBa1t
	iGHtIZTh5QSK5DMPoST5TuQhEZO+eXMFbZTPDFKVdzo+3MmHlJkdGtATmgnZUiUgcRS6hAjvKKK
	IQ6vmMqpgHQ4EZSh5/AICwt4VIJ4fbJmONVp+uWKapD6f5bvK9bTzpx4LhxrW+VGqq4hZYMV9fU
	74=
X-Google-Smtp-Source: AGHT+IEBmw3ujqAFoWxvlaNNZ/FIVaUjUIFTXOho7DZbWlawoxLpT5rTKOoH+V8/df6dJ+/LazN58Q==
X-Received: by 2002:a7b:cb81:0:b0:477:9574:d641 with SMTP id 5b1f17b1804b1-477c01be3e7mr75186815e9.22.1763981574353;
        Mon, 24 Nov 2025 02:52:54 -0800 (PST)
Message-ID: <52664b6f-1114-455f-a7f8-14e95372acdc@suse.com>
Date: Mon, 24 Nov 2025 11:52:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] x86/irq: adjust bind_irq_vector() to take a single
 CPU as parameter
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20251120090637.25087-1-roger.pau@citrix.com>
 <20251120095826.25782-1-roger.pau@citrix.com>
 <20251120095826.25782-3-roger.pau@citrix.com>
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
In-Reply-To: <20251120095826.25782-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.11.2025 10:58, Roger Pau Monne wrote:
> The vector will be targeting a single CPU at a time, so passing a mask is
> not needed.  Simplify the interface and adjust callers to make use of it.

Considering the two callers we have, and considering the function is __init,
do we need the function parameter at all? Can't we uniformly use the BSP?

> --- a/xen/arch/x86/hpet.c
> +++ b/xen/arch/x86/hpet.c
> @@ -352,7 +352,7 @@ static int __init hpet_setup_msi_irq(struct hpet_event_channel *ch)
>       * Technically we don't want to bind the IRQ to any CPU yet, but we need to
>       * specify at least one online one here.  Use the BSP.
>       */
> -    ret = bind_irq_vector(ch->msi.irq, HPET_BROADCAST_VECTOR, cpumask_of(0));
> +    ret = bind_irq_vector(ch->msi.irq, HPET_BROADCAST_VECTOR, 0);

Irrespective of the remark above, the comment then will want re-wording some,
too.

Jan

