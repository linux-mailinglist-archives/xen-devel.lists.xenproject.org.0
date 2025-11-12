Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0BDC52DC3
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 16:00:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160001.1488243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJCJz-0007qF-HK; Wed, 12 Nov 2025 14:59:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160001.1488243; Wed, 12 Nov 2025 14:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJCJz-0007oc-E1; Wed, 12 Nov 2025 14:59:43 +0000
Received: by outflank-mailman (input) for mailman id 1160001;
 Wed, 12 Nov 2025 14:59:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJCJy-0007oW-An
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 14:59:42 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 343d750e-bfd8-11f0-980a-7dc792cee155;
 Wed, 12 Nov 2025 15:59:36 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b7321b03aecso165084966b.3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Nov 2025 06:59:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b732c87ccecsm294976466b.12.2025.11.12.06.59.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 06:59:35 -0800 (PST)
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
X-Inumbo-ID: 343d750e-bfd8-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762959575; x=1763564375; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A/dH8/QgWa9rA2OhyZhjy+UHDXs/Z59JiDmNuh0l0S0=;
        b=gzpO7zcyKpEYywsbeF5DVUOuavjZ2MNsUmd27+Ilnt/qw2AHUh4boCA1EQTXg1/1xN
         9BWBiXgMqoEKlCq8kS8/StEgMUTex8zrCrcxpvWtLKGAoNgeiw5HfJQgJehbOTpMVe60
         HfMgs/NN5J+2sbxYJOJiFLcvSFta9TB2AH3Bnkw1Nfn8meRf08o7LnDykUXMa6R1H8e4
         4Iucq+RYMbWS0XU3ldCXZapryDaLWvwDD0oLhSmETpzhfs2ldQTaSl9XLsHni5sxvD12
         FtdafNCIk2a1JhUZ2rYOIEIji9oXOrKA+0pZhgQp1l8nGtuMDAfbaapLatzyMP+oT3px
         WeHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762959575; x=1763564375;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/dH8/QgWa9rA2OhyZhjy+UHDXs/Z59JiDmNuh0l0S0=;
        b=nbrlTqDf67lBUahzXwFrb684Cd0IV1EpyVzqYEuNHDNV3nrCjVziYF7iQ0Sth7GI9E
         sXcC7VZp7bpombO9D9LqzJren7s58MrpzqX9W+9KcCSuSsTKyZ9GLxBW30mgl4g1kKTM
         0dTxUgNXoBnDuhxgv2wYceEYXHCXceyK7gIDTYc9ZhJ/v1lBRQBYOKIfRgWi7K0CdHgE
         eaaRdxAdbYQtxU5pmmxIC3QQqiCDp58luGmXGYgtbkd6a4JnHfq54z4kPaPe0qqDs1t6
         LyNBlOUvacuMB6uNIP1JUME3nZ25Bagrp1i994kEt3svftk4Dgepw0Kh6AKHjmie3B70
         lxnw==
X-Forwarded-Encrypted: i=1; AJvYcCXFx32aDjsQu4lApWotjpBWePindtTXLRfIdCdekC2J2wR3ZnasyvqpzPMr5ucJy7cBS4r0xtCUStM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy13qlcFcYi0HiZ5RI6m4x8nMmnvv9f3LlWdwrzC3K2q6rz45xx
	m3HXeUbYGbm/6ZzC5sPrZwe4LQxlV/kd9nYGhBiAjfM71vpvk13EiC61yxdBvOODjA==
X-Gm-Gg: ASbGncut4CnfHQgtQYgOVHqhow9GG2NoxJrYyeQXngQrtHgzQiCyxpwrxBi7O9nsM3N
	KIJwpsCwKCWs9XotIZXMT90OUCUlK5YY83idaitC1UJdrnWKlOfj4EKjz/mzyuTXStPNt3OU6Iq
	t32wzoL03Xb7Dfuoc2Q8ZLpl310xl3sWNB3ZOyI40E00elRwgQO0ZTiGQnaNpP07FB7CIUEWMcQ
	Bk8O5V6T9B0DJxCl7qmGno27NQGVNKR5YJZG+5mcr5x4z1ozGK4GoYtmsRP2rZ5uW43vQu1ExUJ
	PFySaVwlhXN+2YCHpWMeTkq230ZhjR6i6LxNZtP3gTVeDl2qIQrFfkZ31QxUnI7aAd7wbyAXXsE
	oA+7D5Nkq4SiHRh55sBoBOuUmFVXUtzuhlmlowWjHvthaHMXy4aB+b8aWvzYg29n79WAqKkBbES
	YPnzFGL8hVC/s1QxHf/axguIf5Acx5YUIpErxbDl2k07T4HBHf+qKtDXRVTclxkkS1ySPXOiwTV
	DM=
X-Google-Smtp-Source: AGHT+IGI+QcuhMphF3ddWZMfZD+WKN9odj6d9GiQdijY5nO5oj/gNsQ73OfVqEdNOvMajw9W4fnLTA==
X-Received: by 2002:a17:906:794e:b0:b70:a982:ad71 with SMTP id a640c23a62f3a-b7331aabddamr354821366b.33.1762959575415;
        Wed, 12 Nov 2025 06:59:35 -0800 (PST)
Message-ID: <90b52fb4-aa65-4673-b386-cf08f332c5b0@suse.com>
Date: Wed, 12 Nov 2025 15:59:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] xen: Strip xen.efi by default
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Demi Marie Obenour <demiobenour@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20251110153551.84813-1-frediano.ziglio@citrix.com>
 <4ac8284c-e7f1-4d6a-9241-d6c30155551b@suse.com>
 <CAHt6W4eJi2hPjwyd5nQM3RKi3+pyw7LMiZA9WQMdFa1vp0i+Rw@mail.gmail.com>
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
In-Reply-To: <CAHt6W4eJi2hPjwyd5nQM3RKi3+pyw7LMiZA9WQMdFa1vp0i+Rw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.11.2025 15:21, Frediano Ziglio wrote:
> On Mon, 10 Nov 2025 at 16:01, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 10.11.2025 16:35, Frediano Ziglio wrote:
>>> From: Frediano Ziglio <frediano.ziglio@cloud.com>
>>>
>>> For xen.gz file we strip all symbols and have an additional
>>> xen-syms.efi file version with all symbols.
>>> Make xen.efi more coherent stripping all symbols too.
>>> xen-syms.efi can be used for debugging.
>>>
>>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>>> ---
>>> Changes since v1:
>>> - avoid leaving target if some command fails.
>>>
>>> Changes since v2:
>>> - do not convert type but retain PE format;
>>> - use xen-syms.efi for new file name, more consistent with ELF.
>>>
>>> Changes since v3:
>>> - update documentation;
>>> - do not remove xen.efi.elf;
>>> - check endbr instruction before generating final target.
>>>
>>> Changes since v4:
>>> - simplify condition check;
>>> - avoid reuse of $@.tmp file.
>>> ---
>>>  docs/misc/efi.pandoc  |  8 +-------
>>>  xen/Kconfig.debug     |  9 ++-------
>>>  xen/Makefile          | 19 -------------------
>>>  xen/arch/x86/Makefile | 16 ++++++++++------
>>>  4 files changed, 13 insertions(+), 39 deletions(-)
>>>
>>> diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
>>> index 11c1ac3346..c66b18a66b 100644
>>> --- a/docs/misc/efi.pandoc
>>> +++ b/docs/misc/efi.pandoc
>>> @@ -20,13 +20,7 @@ Xen to load the configuration file even if multiboot modules are found.
>>>  Once built, `make install-xen` will place the resulting binary directly into
>>>  the EFI boot partition, provided `EFI_VENDOR` is set in the environment (and
>>>  `EFI_MOUNTPOINT` is overridden as needed, should the default of `/boot/efi` not
>>> -match your system). When built with debug info, the binary can be quite large.
>>> -Setting `INSTALL_EFI_STRIP=1` in the environment will cause it to be stripped
>>> -of debug info in the process of installing. `INSTALL_EFI_STRIP` can also be set
>>> -to any combination of options suitable to pass to `strip`, in case the default
>>> -ones don't do. The xen.efi binary will also be installed in `/usr/lib64/efi/`,
>>> -unless `EFI_DIR` is set in the environment to override this default. This
>>> -binary will not be stripped in the process.
>>> +match your system).
>>
>> This behavioral change likely also calls for a ChangeLog entry, btw.
> 
>   I'm not familiar with the format/style of this file.
> 
> Could it be simply
> 
> ### Removed
> - ...current list ...
> - INSTALL_EFI_STRIP environment was removed, xen.efi will be stripped.
> 
> ?

Not sure if it would better go under Removed or Changed. I'd also be a
little more verbose here, to provide context. E.g. "The install-time
environment variable INSTALL_EFI_STRIP is no longer supported, xen.efi
will is now always being stripped."

> For simplicity, should we always strip xen.efi and provide also
> xen-syms.efi only if debug info is enabled?
> It would probably be more consistent.

That's an option, I suppose.

Jan

