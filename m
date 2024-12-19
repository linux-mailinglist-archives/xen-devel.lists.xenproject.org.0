Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8919F771A
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 09:19:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860843.1272819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOBjc-0002iY-0J; Thu, 19 Dec 2024 08:18:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860843.1272819; Thu, 19 Dec 2024 08:18:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOBjb-0002g2-Tq; Thu, 19 Dec 2024 08:18:15 +0000
Received: by outflank-mailman (input) for mailman id 860843;
 Thu, 19 Dec 2024 08:18:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nfYH=TM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tOBja-0002fd-T3
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 08:18:14 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c92e2aac-bde1-11ef-99a3-01e77a169b0f;
 Thu, 19 Dec 2024 09:18:11 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-38634c35129so375651f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2024 00:18:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8471dcsm949709f8f.48.2024.12.19.00.18.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Dec 2024 00:18:10 -0800 (PST)
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
X-Inumbo-ID: c92e2aac-bde1-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734596291; x=1735201091; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=knXxuQVwoprSPpTNFZm+X8RG+WfI8NEnmWZQoeUT02o=;
        b=QLj41t5Vq8PC8NWwx0KeuNlcHm4uKSTdKkk/DaQxsnmUa6GC35sEnXzYrp0G+vO5ot
         RNqM8Uq988zJTUEc83pMBNFqzH/A5kHSm2/kiP8d9h3XSXhAx4Fnz3svvq8Z2CrFxU3P
         zaGj/axs74QLwedW91iv2s7KIchO2ZtQoWop/ZuHKuIK6Bro5DORCsA3yaqVctKN0Rws
         7CMRD9FUe69jr0FPmhkBfATYfrQhO+xA1SGI57xNA54iopjlTjDLmdR44UQepxd8Q4je
         BcUiudvIQsqYC7AOBy1HGQ18ArDLs5+dJcsbr9qXCfbdEXCeouyzPUzyvF8cPMErzvRR
         7iPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734596291; x=1735201091;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=knXxuQVwoprSPpTNFZm+X8RG+WfI8NEnmWZQoeUT02o=;
        b=P9782s0rOiFuzM0Xs3aDdk4PSQhwtFqJ4SHrdffvlhebS1CRDe9nLSYUoE+Bn4UAwm
         fE/COVbngI48jTnWpwPUHez9+uA0ntGop1MH/irniVtR3iR8uUleDo1OeDQZ3YKvvNlq
         r5lJ+u42E5H0jtCWrkzTWaT5lOwomS2ofvhk1tSbDVNGZlJAAO1cV30truhDJdAp2XRD
         uUNzE6jRPljge4ubw6MqFyV9jAA3KSRuzfQ+jK/diSpStR1SYTKb87q9hxG++jmLtRvP
         p3gB0IEAMUg+QVVbgq8hyKiSwt/2YwPM77KiLbEQg1pj6Byzq5XZ5kHBL7dfj9ZuhrCj
         +oGw==
X-Forwarded-Encrypted: i=1; AJvYcCUtrSmCYNiRSbLXnBm1oO23UFmgcWV+NnYrth/baMfUa/Ew2ii5CV9gHgUuCyePA6/ho0mJR6xiWKo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJL3p5ZNYHavBqmA4rYt8fgtw0HdkaE4elhLOF5Qvj1hj1xtvy
	tjvosnyZg4N6BoYMwThBoGHsTMgSdP7QB3SUnmmkgJy8otvTXP56vTJAKHwdeg==
X-Gm-Gg: ASbGncuxrnWXdgvn+nClRRamj/biSnIjYaS8/MT3wXDW7gexUuVtiXglfr799Fov8oM
	XGOpdgAx7xcpy+YcPCpm1+T7jmRmPzpYY3JmfOtzpBQI8YUz6O1810BVpqweFF2l15YvkVM0O+m
	Tmf4bGh2CAKB1zBi+N0oBfw/n3j7wJ8dQOGvqkQqyWcSpzWae+THfJI/H/6TvkDzIRVjy8hjIqJ
	o4GfBoNyh9BUcOQhX+MgVHgmyfUE0GP2ucC1nVaLBmCfQpju/R4h5dg4/Ye4t0y8BfRWGfuNmuT
	sGTAdTuNyreLXGQZfVi2ri1pXguHjn0U0wWxi3IQBA==
X-Google-Smtp-Source: AGHT+IGTfHKvCWxa7goRkS9w9mSbwKq4VzgBZvmPQnOzeec4rfuxRzTSDie28mrC3+GK48mCn78BCg==
X-Received: by 2002:a05:6000:1882:b0:388:c61d:43e0 with SMTP id ffacd0b85a97d-388e4d9c259mr4539737f8f.48.1734596290797;
        Thu, 19 Dec 2024 00:18:10 -0800 (PST)
Message-ID: <0f9766d4-cbd2-4c05-8ab0-e18a9757be0b@suse.com>
Date: Thu, 19 Dec 2024 09:18:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/hvm: Use constants for x86 modes
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <bf7146a8ccbf05ddc74d4f451a5fa586309b9a50.1733132729.git.teddy.astie@vates.tech>
 <20241218170820.364253-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241218170820.364253-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.12.2024 18:08, Andrew Cooper wrote:
> @@ -2952,11 +2954,11 @@ static const char *guest_x86_mode_to_str(int mode)
>  {
>      switch ( mode )
>      {
> -    case 0:  return "Real";
> -    case 1:  return "v86";
> -    case 2:  return "16bit";
> -    case 4:  return "32bit";
> -    case 8:  return "64bit";
> +    case X86_MODE_REAL:   return "Real";
> +    case X86_MODE_VM86:   return "v86";

I did ask for the string literal to also become "vm86". I'm simply
unaware of "v86" being used anywhere in the vendor docs.

> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -26,6 +26,20 @@ extern bool opt_hvm_fep;
>  #define opt_hvm_fep 0
>  #endif
>  
> +/*
> + * Results for hvm_guest_x86_mode().
> + *
> + * Note, some callers depend on the order of these constants.
> + *
> + * TODO: Rework this helper to avoid implying mixing the architectural
> + * concepts of mode and operand size.
> + */
> +#define X86_MODE_REAL  0
> +#define X86_MODE_VM86  1
> +#define X86_MODE_16BIT 2
> +#define X86_MODE_32BIT 4
> +#define X86_MODE_64BIT 8

As this block is no longer adjacent to hvm_guest_x86_mode()'s decl, perhaps
s/this/that/ in the comment?

Preferably with these adjustments:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

