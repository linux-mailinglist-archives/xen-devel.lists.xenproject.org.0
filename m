Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AEBA6A175
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 09:35:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921457.1325298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvBMO-0002fF-Re; Thu, 20 Mar 2025 08:34:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921457.1325298; Thu, 20 Mar 2025 08:34:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvBMO-0002dm-Nk; Thu, 20 Mar 2025 08:34:40 +0000
Received: by outflank-mailman (input) for mailman id 921457;
 Thu, 20 Mar 2025 08:34:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tvBMN-0002dg-94
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 08:34:39 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28d9dd00-0566-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 09:34:38 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43cebe06e9eso3043925e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 01:34:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f47ba7sm41005515e9.16.2025.03.20.01.34.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 01:34:36 -0700 (PDT)
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
X-Inumbo-ID: 28d9dd00-0566-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742459677; x=1743064477; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9yYDfcuioVZUSfXGaxCa/LgS5HF46sQaujNzkA05Onw=;
        b=G3affWnNvr+iMBARRogy1gubwKkcrM5ZIyNfkETmU+b/AZGv8njFU6gxqTfgHzMi0m
         7RWnpaoIxLRkAlK6MuK0FuRl/Y4tH6yeKrbgAWGwDY5JRuZnIeRHEHUBtPWgzsqhPgKi
         Y+dlrL8dCIYbcr6PQCHFo4nqVBc5D7kx6M/piMeGoHvI/onQYMi8qWhErOyFcvHDCoJr
         JdmjWnRx7GctlSllRisf2ZQsjqvCidqQuaaG+E6Mb9KhAJ1vFGF1Yd1uO7VdzlDRnLhy
         6odyZlZ6FCc/KBAAWOiLAXUz92KEcOftOlzAwynNZ88JwcuRDhhUBfu8YMuoCiry9p8p
         eI+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742459677; x=1743064477;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yYDfcuioVZUSfXGaxCa/LgS5HF46sQaujNzkA05Onw=;
        b=ljUUTsLIKvNTa3vUi/3Ucdjrh9iU7kUFKt9V6+3QXBdX3d+11Xvv7c+aS1cbkd+L+q
         MIOSC0CTjns6BLpRiqX0p1tZETeQe/s8AgI5iwew5+1fL8+pMdmhSeWuUZl8eksR/L2S
         FF6Gqc1Fv9wdEwXKZcdk8EOLSYmCsXah3Fp/zOf4mMDnUt6PxLEOrZxAqbQjjgRFFuv9
         QXYIeUUaBI6+jDwwKnze4vwmyov1YSPB5TwMoEzLX3RgRNXQkNPRs4pMroEsFi8izEVV
         tVCAN3dZ9U6blkX4qFYxQnqeLrlqzgUEcaSJJCr3hB0uxIPyB4fwo+0GqEo74jZIeev2
         buAA==
X-Forwarded-Encrypted: i=1; AJvYcCXXNArCN02YltJN6GC3fP5YxIjloGQpZTYLydr0OKwbaFOdafYQuGGygG1VHUUo0R4RUuKiF8lkxGg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyaGTZTwXzgd7Yq46x5B0byW6eff3DSpVa3+e6uW756OqUeWV55
	zHCZoku7Do0YMCIAbrvWmrT+d0wtoPKS3N5W0sBGj5jQy/bC7cg5bBZ/tFCusQ==
X-Gm-Gg: ASbGncvNz9Go3dHc5HZg828HFh4BX6VpJ9RaTTc9oyoyjBjHbgh1z5UvsJmX3MT2+T6
	sXUbMEiL4ZnDnHdcFVHrl1c5Pta+ImsReoQOgIdyOI40SJ+u7NsuVfpSRYpFs5cJei2GXhNcqza
	tDEVtspvk7QB44ufiwTOykuTsFMuOyoK5DsiHUhmgfsA7VPIowi1MKBO6SC5Pwbj/UM0d+g5jRp
	s//AVD5HWANBW+HOFb1A2X2aF9n2xQCC09R1xKLw0GUmp6EDQhO2KhdY/M6RDb4RYNQHfbvJoWX
	ZZxgw27SWc6e8j66h8CDw22QzAt7hLWozp3YowSC048TtFaoEyIkGBqQMzyrAUDzaK0esEqFO1Z
	msg/CtpQRJEu8SiAX1AKHvhrbTv785nEoD699AEel
X-Google-Smtp-Source: AGHT+IFDBotZj3WTZfS3zTosdLuTqA18vKBNrasejTocYrmsoaNWrGTQwVsXeErxSgaka3BIl4Ov6w==
X-Received: by 2002:a05:600c:1ca1:b0:43c:ea1a:720a with SMTP id 5b1f17b1804b1-43d46b5a82fmr31571845e9.1.1742459677318;
        Thu, 20 Mar 2025 01:34:37 -0700 (PDT)
Message-ID: <0da7c7dd-bfbc-4e41-98ed-6e98793e6f50@suse.com>
Date: Thu, 20 Mar 2025 09:34:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] x86/mkreloc: remove warning about relocations to RO
 section
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250318173547.59475-1-roger.pau@citrix.com>
 <20250318173547.59475-6-roger.pau@citrix.com>
 <a3c70637-b354-40f4-9a67-9d2aa7bcdcb0@suse.com>
 <27ebf169-ab63-4def-a98b-751ae1758293@suse.com>
 <Z9vOc5I828aV49rI@macbook.local>
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
In-Reply-To: <Z9vOc5I828aV49rI@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.03.2025 09:14, Roger Pau Monné wrote:
> On Wed, Mar 19, 2025 at 11:46:22AM +0100, Jan Beulich wrote:
>> On 19.03.2025 11:32, Jan Beulich wrote:
>>> On 18.03.2025 18:35, Roger Pau Monne wrote:
>>>> Relocations are now applied after having moved the trampoline,
>>>
>>> That's two entirely different sets of relocations, isn't it? 
> 
> Right, this is the plain .reloc, while the trampoline one is
> .trampoline_{rel,seg}
> 
>>> What we generate
>>> here is what is to be encoded in the PE binary's .reloc section, for the PE
>>> loader to process. And for us to then process again once we move Xen back to
>>> its linked position (by virtue of leaving physical mode). Therefore what
>>> matters here is whether these relocations are still carried out while on the
>>> page tables to boot loader created, or when already on page tables we control.
>>> In the former case any relocation to a non-writable section would be liable
>>> to fault when applied.
>>
>> And yes - both calls to efi_arch_relocate_image() are ahead of switching page
>> tables. The first call is benign - no writes occur there. The second call
>> would cause #PF though for any relocs applied to .text or .rodata or .init.text
>> or whatever else is non-writable.
> 
> I wonder how this worked then, as I've tested with the xen.efi smoke
> test in gitlab CI.  Maybe ovmf doesn't acknowledge the RX sections and
> unconditionally sets all mappings as writable?

Possible. And that would be in line with the mode being call "physical mode":
There are no permissions to enforce there. It just so happens that x86-64
requires paging to be enabled to be able to run 64-bit code.

My experience with OVMF has been that it's hard to find where certain code
lives. Perhaps I should try whether I can find respective code there. Then
again if I find nothing, there wouldn't be any guarantee that I merely didn't
spot the right place.

Jan

