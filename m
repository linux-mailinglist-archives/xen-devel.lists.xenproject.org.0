Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 233D9B2C528
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 15:20:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086606.1444803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoMFq-0003cr-VP; Tue, 19 Aug 2025 13:19:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086606.1444803; Tue, 19 Aug 2025 13:19:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoMFq-0003ae-SY; Tue, 19 Aug 2025 13:19:58 +0000
Received: by outflank-mailman (input) for mailman id 1086606;
 Tue, 19 Aug 2025 13:19:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xm9j=27=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uoMFp-0003aV-BB
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 13:19:57 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 324d25d4-7cff-11f0-b898-0df219b8e170;
 Tue, 19 Aug 2025 15:19:55 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-afcb73394b4so792837266b.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Aug 2025 06:19:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce53eccsm1016832866b.19.2025.08.19.06.19.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 06:19:54 -0700 (PDT)
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
X-Inumbo-ID: 324d25d4-7cff-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755609594; x=1756214394; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=a1wieFv2ae7gx6tGdoWuGagcm2RFtJCxUoP67zyobt4=;
        b=aEK4aBw26oJNc+Ak8Ise/aYcHUEvRuiXsiTZTH9z9JgVHE2Sm0o3NeR/Z95Qy+kwhp
         keofnlmLzYNSimRxSYOOgMKfcEsQC1EJB+DRMljFWOC/mKg3k1zKuqlCXu0TsIaZcH79
         6AK7gYirTjufoJlnP5Y2GXnUpx1CC5vqdxfSsXcMCesiMwQArpTIO2Dhwr09+06A7Ynf
         zV6l670I83r8vBBkzGPepauX1QjCEYFQ+6Y71+/iEutC556RiMjmU4pbVqFvLbp0M0ov
         kXtm3J/IVgZaZ0HSW1TtfLX+k7GNdlDCJDeOKmcHOrD/j5LGMSaNUmKmlH7Q7ULeUaVJ
         zBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755609594; x=1756214394;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a1wieFv2ae7gx6tGdoWuGagcm2RFtJCxUoP67zyobt4=;
        b=wtSXuFCVbXa2f1FU3Fdp1X2zO3wkxbeOmKVpwbCB7d/7Aa4/Yv5996JZZtY7Aeh8XS
         voi/Km9wqP7xNrXGhGtGhxQkQqEAciSLVMsASlpjp7qm/gJIe0arAP7wiWUwAH27/vZM
         PDuGx52DGg0OQ1W6at+HXiRRpKmcDC2rmDyFXOz2sHqkI2wacKoqiHjukBaHaMPcKtuP
         L5lsloTwkheptLXX0laHZ9RBXYRRMfINSqO26xFSr1GdB8h5R4zf5/p9OqEFYvPfdO6h
         dz21/Z09SH6fK85aNDTCpCY3peJsdGejsDpzFrhsUIPHjzrduIhi7dPAWke6YJfVfPQz
         4fZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW292LpTOvaut+beeSH8BLDAi2RNd4nepMIBSQJ2cP82/g7FWa4M3IQTsS7p4Csg2WAkc/LvJOnm/w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwbNwe5IeLOWFZPrwsBtM6QqzDxsBc0vvFempebpdIF1scrd8m/
	KTaP+NCEwZJd6N7JmVqGTqww1ctVuS2rS7PTFQtkDo8a4RWZivrUy7IzjE6Wt1dx/Q==
X-Gm-Gg: ASbGncuy9IR6+Ft9/FGrQd1qDpJVJ6uFUv7lAkAjYyoRzViJGtTf6GlENDKDKdTw0RV
	oe/cSg17vax/3XSq1i7ksEfeBIxH2v51Pk3zgAshGKvn+C8Zjmrmi6ilCFV/+MCQHLX1XM8+Sod
	0nLuR9xSzMafcX6hBn8Rju4PYBVbYp8jJ8pnKkjwuGNXUZqXVo9Xsj28chnZQIRtw7Z2Sec53d5
	dT5alozERhm+0xz0ocUDsDo/6IVwLb5/ikFcaBtwY6ELF7xmPKpaudA1JU+iu3Rwd+I5n266MQN
	E99FwDwMX6GyqcQvBjf9IbxgKDs7uAEG7OXFwIElzCwmqS4cMSPBhe+MBUUB194WsmMaaep45n1
	vteq5gtFgiSyfPVA54pAbuVMEbEKeXYmfXI2fxM3H+7dGtlFhUhx4zWf5ehzNTRSAiiy1bPyh2e
	Z4iAqs2Zs=
X-Google-Smtp-Source: AGHT+IH+He7ZniET3r1N5Z7U6+BXezpL7aLqBfUyeLzFBA5DCof21NZpjhWC8LOFUn6apeCXZwPKhw==
X-Received: by 2002:a17:907:7e91:b0:ae3:6f35:36fe with SMTP id a640c23a62f3a-afddd1fb2eamr207831166b.47.1755609594531;
        Tue, 19 Aug 2025 06:19:54 -0700 (PDT)
Message-ID: <e1444bbf-89b8-4685-ada6-3092d65fb9c6@suse.com>
Date: Tue, 19 Aug 2025 15:19:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/16] x86/fsgsbase: Improve code generation in
 read_registers()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
 <20250815204117.3312742-17-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250815204117.3312742-17-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.08.2025 22:41, Andrew Cooper wrote:
> It turns out that using the higher level helpers adjacent like this leads to
> terrible code generation.  Due to -fno-strict-alising, the store into state->
> invalidates the read_cr4() address calculation (which is really cpu_info->cr4
> under the hood), meaning that it can't be hoisted.
> 
> As a result we get "locate the top of stack block, get cr4, and see if
> FSGSBASE is set" repeated 3 times, and an unreasoanble number of basic blocks.
> 
> Hoist the calculation manually, which results in two basic blocks.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Otoh the function here isn't really performance or size critical. I'm undecided
whether the undesirable open-coding or the bad code gen are the lesser evil.

> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -118,9 +118,18 @@ static void read_registers(struct extra_state *state)
>      state->cr3 = read_cr3();
>      state->cr4 = read_cr4();
>  
> -    state->fsb = read_fs_base();
> -    state->gsb = read_gs_base();
> -    state->gss = read_gs_shadow();
> +    if ( state->cr4 & X86_CR4_FSGSBASE )
> +    {
> +        state->fsb = __rdfsbase();
> +        state->gsb = __rdgsbase();
> +        state->gss = __rdgskern();

This, btw, supports my desire to not use "kern" but "shadow" in the new helper's
name.

Jan

