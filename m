Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A411BB0C86A
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 18:05:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051638.1420005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udt1D-0000mb-V7; Mon, 21 Jul 2025 16:05:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051638.1420005; Mon, 21 Jul 2025 16:05:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udt1D-0000k3-S9; Mon, 21 Jul 2025 16:05:35 +0000
Received: by outflank-mailman (input) for mailman id 1051638;
 Mon, 21 Jul 2025 16:05:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=R5lD=2C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1udt1C-0000gk-IB
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 16:05:34 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86e7696f-664c-11f0-b894-0df219b8e170;
 Mon, 21 Jul 2025 18:05:31 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a536ecbf6fso2650974f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 09:05:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31cc3e5d6absm6330177a91.18.2025.07.21.09.05.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jul 2025 09:05:30 -0700 (PDT)
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
X-Inumbo-ID: 86e7696f-664c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753113931; x=1753718731; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ec/FrA5ItWqAevtgARzVm5nHpk+xoBmOp+95pQ1Vwjg=;
        b=Mryp+BR/Xx5cAe6LbgtkCkSyNewYJa0LO+6LI5RJ0qq+5rGBeRptyN9n7YMeWQBEUS
         xgllwEkQ7B3zo8kXOMOWQ5To+yE3KRPxJIzu986u/SWfUYH/N/8MsHgYUav2vjx+0oRZ
         mAQlAKP7+N3A2QI6Zlx4Hk9p1wZS61ReQArLvq7Eo+Q16mf1ttuAdw84X7wRsKhnJck3
         Nh8RTXwW0yUO5sq0CcjBIl8bDk9DVb4Efzu8clWygta7A1UNv8hY7W3NH1VW3RYmSi6j
         ZPhkQgkU1+YAtqA6exdp/E1OczbbDA5AcQxhD+rcDw9ubPCinVtEdaczSyjz/gVn3tii
         G2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753113931; x=1753718731;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ec/FrA5ItWqAevtgARzVm5nHpk+xoBmOp+95pQ1Vwjg=;
        b=lS9THxsiQoh9fjb8aR68uZ0/x4DwQiUbby/DV2G8W7+YUubm0yTiuKnaUPPNK5kMZy
         sqrsENlAzFxVLPvt+mIkKQqwNaaMuGUqUWfqkckzaiJgZARsuraIu/EMp8wGY5Irym63
         udClOp8tHnJCJmkjNloYUvcwK4OEL6at7eX+0A4xcXEQ7PVFrEJP/oLrbNsXXF+n11r/
         3ZZ6efSwHbGo2u5vVOXAIl8WMShRBx9IEOthd/efHRg6KT/1h3mZEu8GAbjzdxoYjSoh
         k+up+8QeJxS4pS2Dz0LKn0Go/MHEUXLovoU04aoF8RhTlkx9/7aMNyTKiUgKOjH3WyFx
         QIaA==
X-Gm-Message-State: AOJu0YzmxbbRtQUsh8BY2uTTkvgcW422k9SwfUsSU20p+G20aTD2dhyn
	EdM2YutGuRUm+UIpAesNO/yhOr+tEEx+rekciuzNpwCh3gwPiKH9WILc8k7eDKPoKQ==
X-Gm-Gg: ASbGnctilKrufXsy4hCnvWxtt5OvNpmDDiwodU/BrBVXzALdVGYigIlwCwk85KUHXvo
	U5Zq3qnWNadoy8deEEZGSh2V3jJXK/SEjEHTkGpK5OWKvgoa48uEnR+iHqTQZG9eZcH3UV+iLlc
	Ny0TD9dRQQmolA+IdKyDKhZgHtZCoThwubD/8/Uold37/4xRj9mpUeSOd5usRbYcxhkdXgWVS0N
	hqgNCf/FbnYdChK/dzCekjNcFpXP6dVuzPhj3g8ClNt3bF1zL7sjFxyqFkqEYSEda3TSH+1lPhN
	p8gICbcQmCyL4QHD1ShRpDdcDDcK1bg7Y5632KHfe5pHWulDddb7eTx2JIGtYgoDnd5+n49XvC8
	DXdCOFFBW6iK7R2hQ52bNLICvoaM35ytrBogytwac/p3Xe0m+VRf1egHVf6PfU7h397suvJQThc
	L1USqMQOc=
X-Google-Smtp-Source: AGHT+IHfb+AVU1Be9JpQZ/llaeshVOo8xLS2804NRUWJnCZOiRLpalAIgGXByZCfEVrBiURa/isUJw==
X-Received: by 2002:a05:6000:230b:b0:3b6:333:256f with SMTP id ffacd0b85a97d-3b613eb49f0mr13506997f8f.58.1753113930934;
        Mon, 21 Jul 2025 09:05:30 -0700 (PDT)
Message-ID: <92e2cb52-87e7-416f-b9af-8e31b2b3dbe5@suse.com>
Date: Mon, 21 Jul 2025 18:05:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: don't have gcc over-align data
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Chen Jiqian <Jiqian.Chen@amd.com>
References: <f68299c4-7aba-4bac-a50c-182f3cb5686e@suse.com>
 <aH5TWXWFJ1IOH220@macbook.local>
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
In-Reply-To: <aH5TWXWFJ1IOH220@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.07.2025 16:48, Roger Pau Monné wrote:
> On Wed, Jun 25, 2025 at 11:04:14AM +0200, Jan Beulich wrote:
>> For (aiui) backwards compatibility reasons, gcc defaults to a mode that
>> was the exclusive one up to gcc4.8, establishing 32-byte alignment for
>> aggregates larger than a certain size. We don't rely on such, and hence
>> we can do with the psABI-compliant 16-byte alignment.
>>
>> Savings in the build I'm looking at:
>> - .data.ro_after_init		 344 bytes
>> - .rodata + .data.rel.ro	1904 bytes
>> - .init.*data.cf_clobber	 232 bytes
>> - .init (overall)		 688 bytes
>> - .data.read_mostly		 864 bytes
>> - .data				 600 bytes
>> - .bss				1472 bytes
>>
>> Overall xen-syms' _end happens to move down there by 2 pages.
>>
>> Clang doesn't support the option, presumably because they never over-
>> aligned data.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/arch.mk
>> +++ b/xen/arch/x86/arch.mk
>> @@ -8,6 +8,9 @@ CFLAGS += -DXEN_IMG_OFFSET=$(XEN_IMG_OFF
>>  # Prevent floating-point variables from creeping into Xen.
>>  CFLAGS += -msoft-float
>>  
>> +# Don't needlessly over-align larger aggregates.
>> +CFLAGS-$(CONFIG_CC_IS_GCC) += -malign-data=abi
> 
> Instead of using CONFIG_CC_IS_GCC should be just use cc-option-add to
> check for the option begin present, regardless of the underlying
> compiler?

We could do so, but why would we want to, when all gcc versions we support
know of the option and Clang has never had a need for it? cc-option-add
is more overhead, and I think we want to avoid such, even if each individual
instance contributes only a tiny bit to overall build time.

Jan

