Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBE8B0F5CF
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 16:48:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054304.1423056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueale-00079K-HB; Wed, 23 Jul 2025 14:48:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054304.1423056; Wed, 23 Jul 2025 14:48:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueale-00077e-ER; Wed, 23 Jul 2025 14:48:26 +0000
Received: by outflank-mailman (input) for mailman id 1054304;
 Wed, 23 Jul 2025 14:48:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFh9=2E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueald-00077S-Ik
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 14:48:25 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15b9b2ef-67d4-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 16:48:24 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a50fc7ac4dso3185100f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 07:48:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6b490fsm98447195ad.112.2025.07.23.07.48.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 07:48:23 -0700 (PDT)
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
X-Inumbo-ID: 15b9b2ef-67d4-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753282104; x=1753886904; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Dj5pgKRl0wiLFmOB4UoJ569CDKt9MsxF7OH4bbDy/zE=;
        b=GbyS0B/M3NvmnsXZgNg2WtK0u2prTeTUqjs6ouGbsuNzlT0xt0hZlFx6mZNrq2Wium
         CnQwAYlOiP69kjG0gkp7M/H+DAbLX/jIN5Z/J5jk/fcmVGKLOtI1W3j+jq4Bukve5APZ
         jDE/FnKtHPizKgudWj/n7FluPtpuenTTssWRCF0mQs0kEDRYu4sKCgyrIxv2bLdyygaj
         +tj1qb8R33gT30yPf3jjF0MhdgEaBFUE6VEAkAPgJQxgBJV9kfmJyKJ15lS1xeF2/F05
         S3cgNFotZlGzRp+mBlS3q4yQd9g+vDgVRQ/oFdFH04BuUG9GwEpuzF7fnV/7io1hiJf/
         QUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753282104; x=1753886904;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dj5pgKRl0wiLFmOB4UoJ569CDKt9MsxF7OH4bbDy/zE=;
        b=gJbwTeGLVE1q7slN7foMX2gzehYMvcIPEmteLzvvMeRd1obyAOEy2OhrUW6gmtcirb
         Ufus6gjif24ybOSMwTNGax+6Pqwn7E3IIWVzrM/U3AKm6ydsEZsakCbAOajrm9m3jVxD
         V3wh8cZukU9uH/k/5kMH+H55L2lKYnYOrvIuOAeXONi0CZoPPJu6NywygxC8lo5dW9Lc
         EeQ5xwRdUjFigxyDCgFIuDx+0cqJG8skbmJU8FG2M94cRn/rGoUM2Hq4bGfj5K7shLC3
         MLSQ1dHXsR6xr1f15irgiZ1RAOU2vF+hzbkoR+81OjuUB4MSwFYSvTdj6kF+mZPvvaqF
         Zrxw==
X-Forwarded-Encrypted: i=1; AJvYcCWwZCYmR02yccVgPmHrDZUX/OntV547Jx02r43l7PRycmxiBlbuSUO+wAAlmaAGL8u+sj1O2eRUgRc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx9hIhLwsTRpmBazf7NDIivFMrBlOH3HdWlPUiDfds4P9/As7Rh
	6DyzoYl2msGdbgmbfMAVoUTOYcsnJ+lM9UiXp57mILLbxbpTlz/QuFFT1UFYzxvW8Q==
X-Gm-Gg: ASbGncvEGwnTvps8+4s4U8e8D6lrav8swQZVbEWAq5tne/kHDahArYxLflGlZjfJa4O
	LC4RRAnWv1tHMYZJuuzCutPsvzCCT/2wRCkg89abbiWTvXAqXtGDR+kv9d0aa8b4Af4VwUhKGth
	yQe+dTubY0PPZ7Jt+h9yn1bW1qEaEC6AfGVu0CxPPlnPamCxT8FgxQD7ZqtqQWXh+LJWBwEovq6
	5nSiz6MRJUfdayS8BEbfleLIFV5ViOKSinBAiCgXs3L50a+v9WnJX+fUpg+axTelFBn0FMI1RfI
	YnBITQsOcAiIk57cOA+DmZtdl9dd/dsV+YEo0P6eStJMtdI/uJsVkP0Y8laDbf8OQP6qdPx70mS
	KMkbLANrAAtL+1Ad23luVtJAJdZnSyCsyLTi+biiLlglm66SEmmYXJEU1Opp5A4mQtxyFWt+AJb
	NZeArU+9Y=
X-Google-Smtp-Source: AGHT+IG+CWe/HjbIXM90y6aHx3HmB32fYNh+/RGy4ouGziNztYicME/gNMmS8KBDnXReolDSpKZ5LQ==
X-Received: by 2002:a05:6000:288f:b0:3a6:d296:feaf with SMTP id ffacd0b85a97d-3b768edb94fmr2729548f8f.24.1753282103865;
        Wed, 23 Jul 2025 07:48:23 -0700 (PDT)
Message-ID: <02bbe5a1-cd16-4fc7-8bc1-3753ba8032a4@suse.com>
Date: Wed, 23 Jul 2025 16:48:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: fix xen.efi boot crash from some bootloaders
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Yann Sionneau <yann.sionneau@vates.tech>, xen-devel@lists.xenproject.org
References: <20250723135620.1327914-1-yann.sionneau@vates.tech>
 <fb0cc1f6-bbc0-4413-998a-6fa55192f73a@citrix.com>
 <1f0e94a1-09eb-470f-9eea-af3d4d310cde@suse.com>
 <75a98ec2-f88d-471f-a64d-1c702d2d62fd@citrix.com>
 <8b071f7a-bc5b-4e80-b0dc-bdb2b9424f35@suse.com>
Content-Language: en-US
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
In-Reply-To: <8b071f7a-bc5b-4e80-b0dc-bdb2b9424f35@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.07.2025 16:45, Jan Beulich wrote:
> On 23.07.2025 16:38, Andrew Cooper wrote:
>> On 23/07/2025 3:21 pm, Jan Beulich wrote:
>>> On 23.07.2025 16:13, Andrew Cooper wrote:
>>>> On 23/07/2025 2:56 pm, Yann Sionneau wrote:
>>>>> xen.efi PE does not boot when loaded from shim or some patched
>>>>> downstream grub2.
>>>>>
>>>>> What happens is the bootloader would honour the MEM_DISCARDABLE
>>>>> flag of the .reloc section meaning it would not load its content
>>>>> into memory.
>>>>>
>>>>> But Xen is parsing the .reloc section content twice at boot:
>>>>> * https://elixir.bootlin.com/xen/v4.20.1/source/xen/common/efi/boot.c#L1362
>>>>> * https://elixir.bootlin.com/xen/v4.20.1/source/xen/arch/x86/efi/efi-boot.h#L237
>>>>>
>>>>> Therefore it would crash with the following message:
>>>>> "Unsupported relocation type" as reported there:
>>>>>
>>>>> * https://github.com/QubesOS/qubes-issues/issues/8206#issuecomment-2619048838
>>>>> * https://lore.kernel.org/xen-devel/7e039262-1f54-46e1-8f70-ac3f03607d5a@suse.com/T/#me122b9e6c27cd98db917da2c9f67e74a2c6ad7a5
>>>>>
>>>>> This commit adds a small C host tool named keeprelocs
>>>>> that is called after xen.efi is produced by the build system
>>>>> in order to remove this bit from its .reloc section header.
>>>>>
>>>>> Signed-off-by: Yann Sionneau <yann.sionneau@vates.tech>
>>>>> ---
>>>>>  xen/Makefile           |   5 +-
>>>>>  xen/arch/x86/Makefile  |   1 +
>>>>>  xen/tools/Makefile     |   3 ++
>>>>>  xen/tools/keeprelocs.c | 119 +++++++++++++++++++++++++++++++++++++++++
>>>>>  4 files changed, 127 insertions(+), 1 deletion(-)
>>>>>  create mode 100644 xen/tools/keeprelocs.c
>>>> I'm sick and tired of the hoops we have to jump through for broken
>>>> tooling.  This is now rewriting the PE+ metadata because apparently the
>>>> linker can't do it correctly.
>>> The linker is doing it correctly. It is us (and very likely just us) who
>>> have special needs here.
>>>
>>>> Either fix the linker (or the way we drive it/etc), or we're doing away
>>>> with PE+ emulation entirely and writing the MZ/PE headers by hand like
>>>> literally every other kernel does.
>>> "Fixing" the linker was suggested, but with my binutils maintainer hat on
>>> I'm inclined to not accept a Xen-only option into the linker.
>>
>> Either Xen is doing something wrong, and should be doing it differently,
> 
> Well, no-one else would require access to its own executable's .reloc
> section. Of course we can do things differently (like duplicate .reloc
> into .init.data), but why have the same data in two places?
> 
>> or Xen is doing something right and the tooling is
>> wrong/incomplete/whatever.

One more aspect, for completeness: Xen's need to self-relocate stems from
the fact that we combine OS loader and OS into a single binary. The original
EFI concept was to have an OS loader as EFI binary, which would then load
the OS kernel binary in whatever format it likes. That way, the OS loader
can run at wherever EFI loads it, and the OS kernel can be loaded right at
its designated address.

Jan

