Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 094D9D3C56C
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 11:35:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208641.1520780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi94x-0006Bl-Gz; Tue, 20 Jan 2026 10:35:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208641.1520780; Tue, 20 Jan 2026 10:35:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi94x-00069S-Dk; Tue, 20 Jan 2026 10:35:19 +0000
Received: by outflank-mailman (input) for mailman id 1208641;
 Tue, 20 Jan 2026 10:35:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EVnc=7Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vi94v-00069M-Bw
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 10:35:17 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b57368d9-f5eb-11f0-b15e-2bf370ae4941;
 Tue, 20 Jan 2026 11:35:16 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-430f3ef2d37so4155213f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jan 2026 02:35:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4356997eb2asm28886123f8f.37.2026.01.20.02.35.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jan 2026 02:35:15 -0800 (PST)
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
X-Inumbo-ID: b57368d9-f5eb-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768905315; x=1769510115; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AXZwvmj271zYvLNWkodrwZ3eJeR2Z4f2M0MqwFU/dUs=;
        b=bJFtZcIW2a74tgAQKWvsY+8WK0Su6Hh0o9hB0jxgPvGyiSzEsMoHQ0RN8gLC6ZPi8K
         cfYAFLXru68yhKfee2CbPJ7F6PCo2BgEhSLtvbeKddmEdUFnDSIDLEdMB8hltEo21bGj
         F+lxlxvBtM9RpqgZUM9c4KtDTHwrwP2uEFkJ6cuHIINhQzzOKvaq8/3AaLAwBKtQMt3G
         FvQmSbspml7/Undq3UN26c10awuv+UfA/08qa28paaJPEVY3j/jFYI4GN4u7xpZKdrpf
         bvqyXO3pIKiorziTLCpFxb2v0crR3UDO0kJyoMuf+HSTh3NIzbGA2vzZc6jYec3r95fg
         tMIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768905315; x=1769510115;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXZwvmj271zYvLNWkodrwZ3eJeR2Z4f2M0MqwFU/dUs=;
        b=OEjrADN4paQ9ekus9V5KLVWiCSq/wyYETdsio/sAITldqT4bwgDBPCJi4x+cgkAu/H
         qrc0qGRrvYFo2fETp92N+fFLDeHM/G5Na/jKoWTEwEywJiRp3m1DbHmjX5Iu153hrDuW
         v0UzrG2WIKllzWA3ekikI+W+WhzEn9WT93C54q0rn9XrMY6kwt1ISAD3rpQPS+DnQa9D
         h5Egn+EQxDoKWVTQM33dfHs8mN+67dSiIuYVJ27UBxnnJMLogw4ICFTXR2Mm8T/Hc4H7
         Y5xqXLKplNCWbL4D0cAXveyP6SXrsjmX9oVWDOk8faZJOzK2fkZPdKiRN5/B7DWBCoAQ
         2epg==
X-Forwarded-Encrypted: i=1; AJvYcCVL04m5YHwX8NlGUj3lfSxkN3vVLDLeV5x8WVNs3x1JBnu6wFt7DPPPGWDGMRHVb2KYqa6NfUCu4xw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx1FPy2lr1rLPTps9Igg30p5CKO1k1y4mHT5QJ5LzbGy22bSNxP
	N7M2D5voWccexbUOSbVFAmfG5sz5/vXy2FRr0FBvRmmYrA1jsAFnYoN9dxVE8e41gQ==
X-Gm-Gg: AZuq6aKoV1+BwMqS9PPr0iLT7xBARQgqqbWz/BQRAS26npofUEFBkkQGHTewrpjUEzQ
	NQ6Qw6INzhvzeDRhBJ4vh/pL3+0LcnqtkZ4qQwcZ2p2fq9LyrYEt/m9YGW7DPNv74GwLE7Vyp7S
	WoNywMtddOpzI5k0ZYqPKUrlPi8AJBn0J1KSvc6AgohwSosNXOsR0XO1PrmI/ktqV+YwTZPH48L
	xUTQ48lrLmPHwoY2ExM4SPFBCZx22ZlNAZfXryP3Koe/tabjHbB4sEGXh+mFpsChw/wHW5hr4f8
	HPExoQktn8KUh7ZL+26V6P3JSHbC53BTor0eTo7e9AKqj/eXV7RPKJB/FwEQ5A4AhJZ4ThVk5eu
	0sMmxnpHJPI3CC3pJP0tEyJQ1XqahJMEY6Z92hx4jkDwK8Bh5hjWjtVhHD4Pi05vCb+S2XEEI56
	x07G6VS637f8VOQk7nANlh5skgyQ7Rnc0167RHHV4nvjo+NRMmS499GroJh9WSZptjjMA/gyg2E
	hzgTV3oAwulGw==
X-Received: by 2002:a05:6000:2284:b0:430:fdfc:7ddf with SMTP id ffacd0b85a97d-4358ff611cbmr2037284f8f.42.1768905315398;
        Tue, 20 Jan 2026 02:35:15 -0800 (PST)
Message-ID: <3213454a-38cd-4e5d-8a30-853e37f70c18@suse.com>
Date: Tue, 20 Jan 2026 11:35:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: Expose time_offset in struct arch_shared_info
To: Tu Dinh <ngoc-tu.dinh@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20260120095657.237-1-ngoc-tu.dinh@vates.tech>
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
In-Reply-To: <20260120095657.237-1-ngoc-tu.dinh@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.01.2026 10:57, Tu Dinh wrote:
> time_offset is currently always added to wc_sec. This means that without
> the actual value of time_offset, guests have no way of knowing what's
> the actual host clock. Once the guest clock drifts beyond 1 second,
> updates to the guest RTC would themselves change time_offset and make it
> impossible to resync guest time to host time.

Despite my earlier comments this part of the description looks unchanged.
I still don't see why host time (or in fact about any host property) should
be exposed to guests.

> Since there's no way to add more fields to struct shared_info, the
> addition has to be done through struct arch_shared_info instead. Add two
> fields in arch_shared_info representing time_offset's low and high
> 32-bit halves.

Again, despite my earlier question, reasoning of why two halves rather than
a (signed) 64-bit value isn't supplied here.

> Provide a new feature bit XENFEAT_shared_info_time_offset for this
> functionality.
> 
> Signed-off-by: Tu Dinh <ngoc-tu.dinh@vates.tech>
> ---
> v2: Remove unnecessary casts.

Did you really? What about ...

> --- a/xen/common/time.c
> +++ b/xen/common/time.c
> @@ -118,6 +118,11 @@ void update_domain_wallclock_time(struct domain *d)
>      shared_info(d, wc_sec_hi) = sec >> 32;
>  #endif
>  
> +    shared_info(d, arch.time_offset) =
> +        (uint32_t)d->time_offset.seconds;
> +    shared_info(d, arch.time_offset_hi) =
> +        (uint32_t)(d->time_offset.seconds >> 32);

... both of these?

Jan

