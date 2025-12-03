Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6C8C9E759
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 10:25:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176528.1500995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQj6x-0006dg-0R; Wed, 03 Dec 2025 09:25:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176528.1500995; Wed, 03 Dec 2025 09:25:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQj6w-0006as-Tu; Wed, 03 Dec 2025 09:25:22 +0000
Received: by outflank-mailman (input) for mailman id 1176528;
 Wed, 03 Dec 2025 09:25:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kX12=6J=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vQj6v-0006YI-LG
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 09:25:21 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9a8d45a-d029-11f0-980a-7dc792cee155;
 Wed, 03 Dec 2025 10:25:15 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-42e2e47be25so2068548f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Dec 2025 01:25:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1c5c30b8sm38385981f8f.7.2025.12.03.01.25.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Dec 2025 01:25:13 -0800 (PST)
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
X-Inumbo-ID: f9a8d45a-d029-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764753914; x=1765358714; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c2pnRSpjpC7NU+2m5+UXqb22+OOJx5ih4jd4GZfRsEA=;
        b=Yx+p8s1nknJtrpjxPaVUvgc9ZMLJvCx1wN+KQK/3EHvy4+w5uYy0TfvCGONpOaZoUB
         a9octCML+jjPjwckiAOPBRSWDZS31KRfRatANV9cUC2Oy/+fHFYAYcxvKdh+cxS53JCM
         Xwf6NVQZS+l7Ub//pl52xAnQ8uRjBPIOWHzRDqgNwxIRc/McjKc/2YX+yiJt8jIi+6fT
         OWVVo2ghM93IjVGpMlONv7ZHF3LQHw5VqbwsVvEhOeZ4KUiAdlt7eaj8979iDYJRzI5N
         VedSAjelqqsUjJKGfBVE948x9BYyum6ChxWeELwQZ4LfMB0X+gOtcn/KoVH4cpBNli72
         hRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764753914; x=1765358714;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2pnRSpjpC7NU+2m5+UXqb22+OOJx5ih4jd4GZfRsEA=;
        b=cuDuPhUe7liwgdxSqFpHiXX8ZyIjdNiBEHj7UBLWwR7UoTZk3b4+xWmr6QTOv9sZ3X
         j3FVx9vt8IfRVAbmijGKTlmXIt50u50v94WlogQgtMAsQpW6Uu9xf4OOyppUwI/c9qUs
         AwikmtNI882yQzAc+D9yi6fNwdYqrEiDmP39s6NnfkBQxNzALZrmyOBnn2DMm2bLtskx
         E+wZamIdKqpLx7TlLpq8420JRA0q3G32QzCG1HB8Dw/L7MmUa+UO2ApiVnKqS5ZvkdLB
         YfG5OrC+4vY6lrJAaA42kHsNFyDIlbFU6p7ArWBa2HNaCX62a1JhIf7n01k4V0j0Dvfv
         yFgg==
X-Forwarded-Encrypted: i=1; AJvYcCUbXP4rjWP/Yswz8xPrdALMw3PokwEwG9+N4k8JfuS0JELeteF/DPSCXeHpXi7gI8BUSSMw3QcRRCY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwwZYL9VZrRpgQzm2MdGPOFUjcN3a88h4t6cjKI3SFsJP59Frh8
	XFWiJ6BzxbIr499YrZOouqHs/U/3DA5YiYVAO4lCiVqm/gBFOfWt+G+S3gTRBh2omUCdECmZG2j
	NCZw=
X-Gm-Gg: ASbGnctId9+dTm730wXu2TazQnYah4eoVqAMp1lmtw+m/HDluPl4ZideeU/k90pxybG
	VC1wrd59z9khv7ghw9nW8n4YHf8qJo2v1jdwh06e9SYNzVS9KMmIq9q7Y+4M+yElQFuMUCquTkJ
	YJ9mmPi7wZ1ii7rEu5xZa3zRtjxGHS+qy+AFCfzwbJy5I1sVdk4AkQpGoPWAaN46lvn8ZvZkZIF
	AZd4FZlWaevoNgOVLMqgNWTkJtE1nqaCV1HuVEuDrsZl5fRHcXIRuR1+gYegCI+i4SqfT1czV+h
	fwCEdHF7Mkmut0wGZiAeD0LEpbP998wbrS+mJDYY0/dYJckhjDWRtYQWxTYRvxUAu0Om4/u1d9K
	AgAIerrPudAuK7sE6gMi240GGxwkp+Yu+cS10hs62Eo6FlHDaGiRVUuHDy5USS/42szjOvOyHUY
	vNUl2NcV4ITdO+wvLwp3w893GA6ksL/VOgsbWZFNjY+W78ZFO06gfH5AaeW1CHk6n98DfJjM/Dh
	i8=
X-Google-Smtp-Source: AGHT+IEeCMa1uF3Vvu6VRRYt7yNJ0MRTBXDGrw3ZZ3hmptNQpiB/wxWA1+D+Kf1P2gMyiuZwIZzuuw==
X-Received: by 2002:a05:6000:26cb:b0:42b:3ccc:91ec with SMTP id ffacd0b85a97d-42f7318c12dmr1512685f8f.22.1764753914474;
        Wed, 03 Dec 2025 01:25:14 -0800 (PST)
Message-ID: <1fb180e4-b2c9-43d1-a9ad-10ef3eb2de7e@suse.com>
Date: Wed, 3 Dec 2025 10:25:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/gen_hypercall: Fix if indent
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251202221930.151264-1-jason.andryuk@amd.com>
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
In-Reply-To: <20251202221930.151264-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.12.2025 23:19, Jason Andryuk wrote:
> On x86, the opening if of call_handlers_*() is indented 4 spaces which
> breaks alignment.  The alignment is broken by printf("    "), but
> that actually aligns ARM's opening "if ( likely() )".  Move the indent
> to the if that needs it.
> 
> This results in x86 hypercall-defs.h changes like:
> 
>  #define call_handlers_hvm64(num, ret, a1, a2, a3, a4, a5) \
>  ({ \
>      uint64_t mask = (num) > 63 ? 0 : 1ULL << (num); \
> -        if ( likely(mask & ((1ULL << __HYPERVISOR_vcpu_op) | (1ULL << __HYPERVISOR_event_channel_op))) ) \
> +    if ( likely(mask & ((1ULL << __HYPERVISOR_vcpu_op) | (1ULL << __HYPERVISOR_event_channel_op))) ) \
>      { \
>          if ( (num) == __HYPERVISOR_vcpu_op ) \
> 
> ARM's hypercall-defs.h does not change.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


