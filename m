Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5C9A64583
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 09:31:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916263.1321381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu5s0-0002Ex-N5; Mon, 17 Mar 2025 08:30:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916263.1321381; Mon, 17 Mar 2025 08:30:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu5s0-0002CZ-K9; Mon, 17 Mar 2025 08:30:48 +0000
Received: by outflank-mailman (input) for mailman id 916263;
 Mon, 17 Mar 2025 08:30:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tu5rz-0002CT-E7
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 08:30:47 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f047635-030a-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 09:30:45 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-399676b7c41so221603f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 01:30:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df3506sm14644295f8f.11.2025.03.17.01.30.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 01:30:44 -0700 (PDT)
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
X-Inumbo-ID: 1f047635-030a-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742200245; x=1742805045; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nqhNHFPzuiPPK0CjGfDDt9L/mSwR4v8+uH8qZjs615g=;
        b=afpAZk7uVBfn7A+6DG2fOI8VZzX9tuJX12a7/DGHTuv3P/HubMAnEu6nEe6LQiiSgc
         0qO0M6ZxX1wzZu5ypktDopymDIcp2A+53bKd0+Zsj8AHDWdomkjfOyhpondEU3OB7gDY
         fc/WFYZcskAYvedlwQALzVP8SsDZdydY42pkJhxhHjDG2SOE0aAIfMVGrUrrdGqtB3S7
         PeeSa1lAFO3CqQg//aSrDWlq1LCwTnFG4eiwMvcAlaL9noMmz7wr1GGtAgwAbawOIG+R
         NAIHlW3aJ+mDW6JXEZwrEr2fhdPUzLZhFrNHbrVOrVfepFRoF0TI8Jt2bUnwxJ30PzvU
         yG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742200245; x=1742805045;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nqhNHFPzuiPPK0CjGfDDt9L/mSwR4v8+uH8qZjs615g=;
        b=TxfKCsEJ/w8hYhgq0y6HnaeqBCv3SD8+w1LT0aDX2kT2gcE0xhafe6RUCkG83zydX5
         /2atbLC8mSRfVCS1Aiv7fZwnaNQjk/FQ9E2x1jHn0E+7KXJ1Pqp1FEvArgte6blup+0M
         Ndq2096cJ8qyjlY4GRfCjHhutiXjmrgADfcHshJfgrTiZ6R1xqIxmiZ6eZYRIN/yV6rh
         HzRrKoO8HohhoTVpZo2ZhnxoeKb/dYBhy1mHVD30IPCPloh/Ii59daKBKmOxQY7L3slT
         IycvvjXz3DywJRxW9tjjgAjrYcgfMxQZJtrv3KK8Wdiq0x27RGTZTsmCUgFFx0wnq6cc
         7wiQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0FZSd5bVioeE01UI6vNgfSIOuLoQAm5xdslkiLprlesLBllJZYX47ce8A2TeVuIvVhiRwZslwX4c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyXT4lPJ348p8UcmELbWXodkst2BP+HpveC2w9KRn6TBd3S9E4b
	QID7DuOrpl7Gub3zhmRiqLt+yLCAkSgsHL47tO8wSv7wjjZ0R8D3wHfdcG+f4g==
X-Gm-Gg: ASbGncsnDtnzi+wHHcOmy39Nt0arxVxZF/7qkHw6NbaHAiialwi5qVKymRgdeCe8Ks7
	KsJ9dkZ2sVoD5fnluxF01IDSQIBfsPKy47DBpOsrL9D45IOrvvb7DLEO0rP43PC34J73UsrnAmh
	FH7X7UXhiHwvTyHxSVnYTzbZd0cn7jHUUhx9QKZHajQ509IOPFg7d2uy+NmTFNxuQAdCTeG+WQC
	gT+PLnaKh4zjOK467AmXBocXHXE/yvZeUPKEBICkIvXBtANvvt/nA/WHfqjC0IBP7EFHa/v4/QI
	8JEcTuqLj1njg6g5gDZDsJx9XbGdPI69RypsC7V3wA7KBa6H2SX6mUhvaTWRHwIilYyHa+78l7P
	+qYK7yMrfbll2lIA7VKzNSzgA/Qv19JGhklhtIU4f
X-Google-Smtp-Source: AGHT+IGijf6EjQjIh19R1iyP5Q/f+YUQtiv13qCILGxn/ydT63TmNINgZieuvwgtNCxww9WYM6ninw==
X-Received: by 2002:a5d:5888:0:b0:390:e158:a1b8 with SMTP id ffacd0b85a97d-3971fadc3ddmr11828381f8f.43.1742200244856;
        Mon, 17 Mar 2025 01:30:44 -0700 (PDT)
Message-ID: <c14f9eef-1bb8-4259-a3f4-44c739ed3258@suse.com>
Date: Mon, 17 Mar 2025 09:30:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86/irq: introduce APIC_VECTOR_VALID
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250315010033.2917197-1-dmukhin@ford.com>
 <20250315010033.2917197-4-dmukhin@ford.com>
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
In-Reply-To: <20250315010033.2917197-4-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.03.2025 02:00, dmkhn@proton.me wrote:
> Add new symbol APIC_VECTOR_VALID to replace open-coded value 16 in
> LAPIC and virtual LAPIC code.

First a good name is needed to make such a change. APIC_VECTOR_VALID
could imo be the name of a predicate macro, but it can't be a mere
number.

Then ...

> --- a/xen/arch/x86/cpu/mcheck/mce_intel.c
> +++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
> @@ -136,7 +136,7 @@ static void intel_init_thermal(struct cpuinfo_x86 *c)
>       * is required to set the same value for all threads/cores).
>       */
>      if ( (val & APIC_DM_MASK) != APIC_DM_FIXED
> -         || (val & APIC_VECTOR_MASK) > 0xf )
> +         || (val & APIC_VECTOR_MASK) > APIC_VECTOR_VALID )

... care needs to be taken that replacements are done such that the
"no functional change" claim is actually correct. (The 0xf, i.e. 15,
is replaced by 16 here. I didn't check if there are other similar
issues.)

> --- a/xen/arch/x86/include/asm/apicdef.h
> +++ b/xen/arch/x86/include/asm/apicdef.h
> @@ -78,6 +78,7 @@
>  #define			APIC_DM_STARTUP		0x00600
>  #define			APIC_DM_EXTINT		0x00700
>  #define			APIC_VECTOR_MASK	0x000FF
> +#define			APIC_VECTOR_VALID	(16)
>  #define		APIC_ICR2	0x310

Nit: No real need for parentheses here; adjacent #define-s don't have
any, so it's a little hard to see why you added them.

Jan

