Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A885E965925
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 09:55:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786239.1195804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjwTU-00079x-Gc; Fri, 30 Aug 2024 07:55:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786239.1195804; Fri, 30 Aug 2024 07:55:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjwTU-00077M-Ds; Fri, 30 Aug 2024 07:55:16 +0000
Received: by outflank-mailman (input) for mailman id 786239;
 Fri, 30 Aug 2024 07:55:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q2fe=P5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sjwTT-00077E-9l
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 07:55:15 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 309819ec-66a5-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 09:55:14 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a86984e035aso188245866b.2
 for <xen-devel@lists.xenproject.org>; Fri, 30 Aug 2024 00:55:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988ff289fsm183468066b.2.2024.08.30.00.55.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Aug 2024 00:55:13 -0700 (PDT)
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
X-Inumbo-ID: 309819ec-66a5-11ef-a0b1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725004514; x=1725609314; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yNVFw5K8lcM51c2sbYjyx0iCLVUBopbyPoaHs0Rv5p0=;
        b=bv5vA0Gd9rP20qVmDFnTYZZMYSp9iYxnywB+rmPNs7fp3FiINTddNtG9bXchXfqtdJ
         BJZ0hR9quIyHRq6X7UUK6ZW0YZBJvhkwH7fo7VhN+4heAY18HhV6K29o8E0SV3KtmxWL
         HyxynGyHuukiut8OG0hpbx5VDagDJog9fwfJWM9MBFAfGvGaEWIZv5QBvJ4IFHTIScAf
         C70is4Huqd/OOPQFSE36cElFBErElCVFKxyv4Vsqa36pJCAmVGCjfdcFh3XS1DTtd+Zm
         F4UseF/rX2nxEtFBWyU+0hUB5YnILjHCAtan7lVsnQzr8GcihIibxqNRV1WsjGrbhslZ
         jfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725004514; x=1725609314;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yNVFw5K8lcM51c2sbYjyx0iCLVUBopbyPoaHs0Rv5p0=;
        b=p4seVJ+XWTe8HDc3Ey3bLfvD3pqL7trP4ofSMM0CBsrzl05tAI09LGCUyXHvqtzif5
         gzxC14ZWO808mF0Ng9uPXI5vS3lQFiaqJ4rIVDzFtNnRJZGvjG+Qrz5n+L31o4sbhbao
         TSXmQnqe2Px36ThenwoBdOR1eHVC1/ESidWtin+Ac+g02DLxh/4qKJE8+9OzX/8rLdiv
         5HljfSTF+rB87bGCThN0zDrQzVA2EOfWeRwgS/ws6EV/r/+okjyUYpclkdUVjr/QBkV3
         KdFrKcEWvsBtBj1j9SdgQTj+CG+uyvtTayp6dMsNrSG7v/n928z01eEaY/+hp4epmq8h
         EX9A==
X-Forwarded-Encrypted: i=1; AJvYcCWWKOdEpEH1VZyMwkjmeWpWMeJcimk+7l2KJ9SFDcwUpXAlzEZZX9Cm9rszJkDZ4qQ3UnRL95KeVBw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw9tpM+r9GmB7/x+Mqss6WfwTvshkSrZkC7BCuhBwSuX1QD57n1
	iOvDdd2tM3Yym4tV6d3nvIax2W0XJB3RG08k7tppBSl/ikVx65NeARFmT4ewxA==
X-Google-Smtp-Source: AGHT+IEjDffswZMV26EbR81Yk62sj8PYFDCQqgN5aghek9JeEP2JP3KtpSdoDYP9SCamNj/OJeFkGw==
X-Received: by 2002:a17:907:d14:b0:a86:6ba1:44da with SMTP id a640c23a62f3a-a89a36728fcmr85364166b.32.1725004513704;
        Fri, 30 Aug 2024 00:55:13 -0700 (PDT)
Message-ID: <77e852b6-1336-4289-87f2-9cefe2e6fd04@suse.com>
Date: Fri, 30 Aug 2024 09:55:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/pv: Make cr4_pv32_mask be PV32-only
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240829183817.2807665-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240829183817.2807665-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.08.2024 20:38, Andrew Cooper wrote:
> The user of cr4_pv32_mask (the cr4_pv32_restore() function) only exists in a
> CONFIG_PV32 build, but right now the variable is unconditionally set up.
> 
> To start with, move the setup into set_in_cr4() and remove it from it's
> somewhat ad-hoc position in __start_xen().  This means the variable will be
> set up in two steps for a CONFIG_PV32=y build, but it's cleaner and more
> robust logic overall.
> 
> With that, there's no good reason for the variable to stay in setup.c.  Move
> it to x86/pv/traps.c (for want of any better place to live), and move the
> declaration to beside set_in_cr4() and mmu_cr4_features which is a better
> position than setup.h.
> 
> Guard the reference with CONFIG_PV32, and fix up a recent typo in an adjacent
> comment while at it.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with a suggestion:

> --- a/xen/arch/x86/pv/traps.c
> +++ b/xen/arch/x86/pv/traps.c
> @@ -18,6 +18,10 @@
>  #include <asm/traps.h>
>  #include <irq_vectors.h>
>  
> +#ifdef CONFIG_PV32
> +unsigned long __ro_after_init cr4_pv32_mask;
> +#endif

To save on the number of such #ifdef-s, how about moving this into an existing
one. pv/mm.c has one, albeit near the bottom of the file (which I'd be fine
with, but I could imagine you or others not liking such placement), and
pv/domain.c has one near the top which seems pretty well suited.

Jan

