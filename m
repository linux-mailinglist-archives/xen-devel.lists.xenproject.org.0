Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23622B0F5B1
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 16:46:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054286.1423034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueaih-0005ht-Rm; Wed, 23 Jul 2025 14:45:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054286.1423034; Wed, 23 Jul 2025 14:45:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueaih-0005b6-NQ; Wed, 23 Jul 2025 14:45:23 +0000
Received: by outflank-mailman (input) for mailman id 1054286;
 Wed, 23 Jul 2025 14:45:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFh9=2E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueaif-0005Yc-UZ
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 14:45:21 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7ec11ee-67d3-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 16:45:20 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4555f89b236so67076205e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 07:45:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6b6032sm98758665ad.86.2025.07.23.07.45.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 07:45:19 -0700 (PDT)
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
X-Inumbo-ID: a7ec11ee-67d3-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753281920; x=1753886720; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aeX6PS3eGU0Lwr6us8IUpdwHwDA5wyA2+Kuzb2dwviw=;
        b=aeWHLa2zDe4+KMPSB2k/oJGc8P9u8PuzRZ3mZ3kaDk4v+CxhCcnNp2wcFdo/obMOM1
         GoFREJQFnOXiAcpNL0NuOXtVH309t92snktscJTn+NpM3ZW394F9fWNdIaW+1fr0mVFx
         GDxg40BEQTRlwIrvn7E4yhqTd3BhnXBs85TfJLsvQ6aXtU0/pcrD2G2ccMgM2TuYHcl2
         2kGIQd+YBi4NI35E8ELUWLnLQ8Al5w9PfQiGJoXukHClmeaQ4VHxIF5kinIb0e2HYYPd
         3MRnLMiEIDHuZwKAHGBOdODxMmgxDfuXLkZA3o4zjm0bbV0pVbS5OhK2zq1thJ/prcgj
         zZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753281920; x=1753886720;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aeX6PS3eGU0Lwr6us8IUpdwHwDA5wyA2+Kuzb2dwviw=;
        b=Naf0qrqNCkdQERRupnBdxPbpeZz+HeKWRrBEMgznJmPkopd0+XPLF5vfyZ/5bOdzBO
         LnCpkgEIEOjHUsMXqgBbZ1kRt2BJZDgVNbFcg1IkE9uMFstHML/B7Mv6dbBqhpyib2oP
         ZmnvSQmXLBSeRSOAia+gZNEuF9RVO2TsFu7NesRdSVHznVOBiLObt21ox3/KnneOOwMe
         C338lcX99BqdIIMRAIegISnRsde0D/632laKtZkDnOJmupFG5XNMSmnMjm3BHqks1Kja
         jUTwYXjRIw1sMpwb2WE6vvpJujagd2/YoGI4cCerVPAvmqiQzQtXeC1FzdX+RLaZQlmn
         9b9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWOPiwpwBL3zxZFplTEoeMYvj8sqTNud8/5Wl4pcanRULllLQHlKWajqj6yFR3E3b7Kydquw/UgUEk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx0cBOgK4corHwjqjKpF25n6zGgt1ot/miS2wHyppUMHtSEKleU
	WJz+jTCqhu6vC5dUQYriUiUiJRlGBwNUjT74i2Y4JCsT7HTS6UkdTePLmAyk1F/Mqg==
X-Gm-Gg: ASbGncujTTZFd2PmZFAKRBXAq2N7plx86usuLu34gdfmM3IXcq11GXooinfKEayc8Ri
	hz5ZSOXrn+4KQqwdqzRDRKEEwumBP2XZLrdbBSX8qFVIggio1+qXu+ahZ7uTSWWmtLnH2NFll2O
	qHUvKeEcRigLHJvLAOsJmvn9TpIEACgEjrP989PjWqkc286P8YTu9mmXc9Fn1XDudAivdnxX7pN
	IWMgRjrPptmPXJjYYSZmKEL17O91r57CNrX8SzSv1QM10pkVv7Wsm4dudc20gU+P/O4y/gBWiNL
	ffRkLPQjn/Ic0ist3tgGLxIb6E5N1OWttL+FpO+QdIpwdxXnyzEwUs2c8XvhvhXhKGpE50AmJHJ
	HeQrsEsxVpxecOBdVQBj+s9pt9yK0RcE+lUeyAD+PZU8pWm/eurdjGflpruM9yzh0Fc7eRkZLlH
	pbBzD8B/o=
X-Google-Smtp-Source: AGHT+IF1s+6lS5rcWOJNrN4NGVQGRVLBypEb210vmvV8hlAtjsI9ixBFQH2MtM2kiGisFt6Kn/Iekg==
X-Received: by 2002:a05:6000:258a:b0:3a3:6e85:a529 with SMTP id ffacd0b85a97d-3b768f16099mr2751671f8f.51.1753281919506;
        Wed, 23 Jul 2025 07:45:19 -0700 (PDT)
Message-ID: <8b071f7a-bc5b-4e80-b0dc-bdb2b9424f35@suse.com>
Date: Wed, 23 Jul 2025 16:45:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: fix xen.efi boot crash from some bootloaders
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
In-Reply-To: <75a98ec2-f88d-471f-a64d-1c702d2d62fd@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.07.2025 16:38, Andrew Cooper wrote:
> On 23/07/2025 3:21 pm, Jan Beulich wrote:
>> On 23.07.2025 16:13, Andrew Cooper wrote:
>>> On 23/07/2025 2:56 pm, Yann Sionneau wrote:
>>>> xen.efi PE does not boot when loaded from shim or some patched
>>>> downstream grub2.
>>>>
>>>> What happens is the bootloader would honour the MEM_DISCARDABLE
>>>> flag of the .reloc section meaning it would not load its content
>>>> into memory.
>>>>
>>>> But Xen is parsing the .reloc section content twice at boot:
>>>> * https://elixir.bootlin.com/xen/v4.20.1/source/xen/common/efi/boot.c#L1362
>>>> * https://elixir.bootlin.com/xen/v4.20.1/source/xen/arch/x86/efi/efi-boot.h#L237
>>>>
>>>> Therefore it would crash with the following message:
>>>> "Unsupported relocation type" as reported there:
>>>>
>>>> * https://github.com/QubesOS/qubes-issues/issues/8206#issuecomment-2619048838
>>>> * https://lore.kernel.org/xen-devel/7e039262-1f54-46e1-8f70-ac3f03607d5a@suse.com/T/#me122b9e6c27cd98db917da2c9f67e74a2c6ad7a5
>>>>
>>>> This commit adds a small C host tool named keeprelocs
>>>> that is called after xen.efi is produced by the build system
>>>> in order to remove this bit from its .reloc section header.
>>>>
>>>> Signed-off-by: Yann Sionneau <yann.sionneau@vates.tech>
>>>> ---
>>>>  xen/Makefile           |   5 +-
>>>>  xen/arch/x86/Makefile  |   1 +
>>>>  xen/tools/Makefile     |   3 ++
>>>>  xen/tools/keeprelocs.c | 119 +++++++++++++++++++++++++++++++++++++++++
>>>>  4 files changed, 127 insertions(+), 1 deletion(-)
>>>>  create mode 100644 xen/tools/keeprelocs.c
>>> I'm sick and tired of the hoops we have to jump through for broken
>>> tooling.  This is now rewriting the PE+ metadata because apparently the
>>> linker can't do it correctly.
>> The linker is doing it correctly. It is us (and very likely just us) who
>> have special needs here.
>>
>>> Either fix the linker (or the way we drive it/etc), or we're doing away
>>> with PE+ emulation entirely and writing the MZ/PE headers by hand like
>>> literally every other kernel does.
>> "Fixing" the linker was suggested, but with my binutils maintainer hat on
>> I'm inclined to not accept a Xen-only option into the linker.
> 
> Either Xen is doing something wrong, and should be doing it differently,

Well, no-one else would require access to its own executable's .reloc
section. Of course we can do things differently (like duplicate .reloc
into .init.data), but why have the same data in two places?

> or Xen is doing something right and the tooling is
> wrong/incomplete/whatever.
> 
> As a related question, is anyone other than Xen using PE+ emulation in
> anger?  Every other kernel/OS level tool I'm aware of writes the MZ/PE
> header by hand, and frankly, the list of bugs we've found in PE+
> emulation would strongly suggest that noone else is using it.

Both Cygwin and MinGW definitely are using it. And in Windows it's the
PE loader which reads the .reloc section. The executables themselves
wouldn't access the section, at least not normally.

One problem is that Cygwin and MinGW are lacking proper maintainers in
binutils. Hence changes are being made and approved by people (including
me) who may overlook certain aspects. Another problem is that testsuite
coverage is far more scarce for PE than it is for ELF. And then,
specifically for us, we're further making use of an entirely untested
(upstream) code path, linking ELF objects into PE binaries.

Jan

