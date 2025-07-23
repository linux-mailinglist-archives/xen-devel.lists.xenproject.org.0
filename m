Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EC2B0F780
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 17:53:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054461.1423267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uebm9-0001zz-3C; Wed, 23 Jul 2025 15:53:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054461.1423267; Wed, 23 Jul 2025 15:53:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uebm9-0001xy-0S; Wed, 23 Jul 2025 15:53:01 +0000
Received: by outflank-mailman (input) for mailman id 1054461;
 Wed, 23 Jul 2025 15:53:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFh9=2E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uebm8-0001xs-05
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 15:53:00 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a580604-67dd-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 17:52:57 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-456108bf94bso48675945e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 08:52:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb1569d8sm10029402b3a.93.2025.07.23.08.52.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 08:52:56 -0700 (PDT)
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
X-Inumbo-ID: 1a580604-67dd-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753285977; x=1753890777; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TueT17cVtGQHd95W+i6oidyl9zWIo3aQWo2OJhk+PtU=;
        b=Hf6PSJihqd/UJkdRyJjBX/Thv/vuh/TjENLL/mrAMZWD/8Lmx4BOkG0xVkhwD6+y2L
         JhuH9bsXBTQP2jWrFSCyaLCMCH0HJVqL5b+gpVCXQ3B++0wMZig1GuyCAuVPEskQOo+b
         qnWpNmxUoGg66gzAKOfSEfDKCTLev143S25e79D2HP8pRIhNK3o44iV20NQZIZpEljPw
         4TNAFlUbRbfmWfj5Db35/lbOEcdT2olyuDwm4EYsEk78z9y5FErhHEc1dV5QHS4UUIHb
         4nOwWANS+Jf8X1jdn2ZNv7Ld705dISFHy9EFihLn181Wh5VrBl6g1C32/ndSsb+cwcUv
         1d3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753285977; x=1753890777;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TueT17cVtGQHd95W+i6oidyl9zWIo3aQWo2OJhk+PtU=;
        b=PTrThlvdiSej9NFLtMTGjDw0ILGRw6LnQcdZlxZgvwW0XHbM8WWjhkRqVsHAaVyGJS
         iXsjJoErGRAUqNm8Ozqp+zbvT/aOAwHMsAS8ocPRTFPt2iJthnEsZKu7IYG15WlOienV
         UjaS39oxdV1m/C5rJnbFeHW8qWeeouvj7R52Tnfi/a809DQ0AL8434XXLrfK4vQI8XTB
         Os8wyzEAHMGcBA0HYtyz32hSLgygd408+B/NFZSYrXqrDxqYajmgBgnqCpBYF+VKJ4m+
         ZE+DSpOfIlKqT3k/syT6qQe5Xi4Z/ge8H5ae18LtqmxUp+r8TcH1w/+TeHPx7hFUrQ2P
         4t8A==
X-Forwarded-Encrypted: i=1; AJvYcCWhi2HZaeXg66Hmn4W/BOAn/NpQu1tgFs6q5lCXLAzdSDoD9drKfSbaYx7lxBXn1iEtPDWpA0kKTYg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw+fwQm0sJg5BfL9amNDZIXZC3tg8ttptzJJVs+LLxnN6mnsgm5
	Nau+kJQPJyNantHvIYrGRDBsB8TzOEup7WHiqF7t53O4mJKguJdVIHwHaFTHu0hpsQ==
X-Gm-Gg: ASbGncuJECAuUz+zrqklYHxfKXuiDbEfK1yajthxsuKLfEo/snmT86kdqeHUVK7CZp/
	sEkZkODJt90tIMvS7rnA/8G4gxxi1fUA6/YJneh54GSskVN0eH9c0mT94zG3SB5hum7AOUtCrIY
	U4jp515EDapXhvQ07phiCn8z3Db9bNcUJkkUjjqmPqXLqD5lP/PbX5zoxbFtJYxS5/KaO758zpG
	DGnYpDO2k4Jm5aJRCxpUduwrxPRu+cfdozKxF+7INMa05NpQDXkcwy8sMgStuWUmra+jdo6yVEF
	DGgGP2FmY430bNaQjpg0UhAemT1r709zw9AY2+i7jcPIVfq8xtuTN+tnkHlh1s92Wp9BZPnRdKD
	jqJwu0Xfl2pdoEZUVwt2ByibabU3AiIHKXIPJ91bxmpvOFapizhsZ61PxmqsneBg1CCbcApmyl+
	A/J1rdP1I=
X-Google-Smtp-Source: AGHT+IHjSNLptZpYd8XOuX+lpIuhFCRvnUia4MgQMZKdkVWCJ1ftsgaeObjG4lsmyhpFTWfSxc8Gew==
X-Received: by 2002:a05:6000:18ac:b0:3a4:f6ba:51da with SMTP id ffacd0b85a97d-3b768e9f87amr3671191f8f.15.1753285976971;
        Wed, 23 Jul 2025 08:52:56 -0700 (PDT)
Message-ID: <2478643b-40f4-488c-a5dd-feace902ce30@suse.com>
Date: Wed, 23 Jul 2025 17:52:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: fix xen.efi boot crash from some bootloaders
To: Yann Sionneau <yann.sionneau@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250723135620.1327914-1-yann.sionneau@vates.tech>
 <8071bf13-0661-4809-b5f9-ff101d9828b5@suse.com>
 <16d9bf13-d76b-40a9-8f39-d2476ecdf49e@vates.tech>
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
In-Reply-To: <16d9bf13-d76b-40a9-8f39-d2476ecdf49e@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.07.2025 17:39, Yann Sionneau wrote:
> On 7/23/25 16:18, Jan Beulich wrote:
>> On 23.07.2025 15:56, Yann Sionneau wrote:
>>> xen.efi PE does not boot when loaded from shim or some patched
>>> downstream grub2.
>>>
>>> What happens is the bootloader would honour the MEM_DISCARDABLE
>>> flag of the .reloc section meaning it would not load its content
>>> into memory.
>>>
>>> But Xen is parsing the .reloc section content twice at boot:
>>> * https://elixir.bootlin.com/xen/v4.20.1/source/xen/common/efi/boot.c#L1362
>>> * https://elixir.bootlin.com/xen/v4.20.1/source/xen/arch/x86/efi/efi-boot.h#L237
>>>
>>> Therefore it would crash with the following message:
>>> "Unsupported relocation type" as reported there:
>>>
>>> * https://github.com/QubesOS/qubes-issues/issues/8206#issuecomment-2619048838
>>> * https://lore.kernel.org/xen-devel/7e039262-1f54-46e1-8f70-ac3f03607d5a@suse.com/T/#me122b9e6c27cd98db917da2c9f67e74a2c6ad7a5
>>>
>>> This commit adds a small C host tool named keeprelocs
>>> that is called after xen.efi is produced by the build system
>>> in order to remove this bit from its .reloc section header.
>>
>> As indicated on Matrix, giving this tool such a specific name doesn't
>> lend it to use for further editing later on.
> 
> What would you like to call it?

peedit or editpe or some such? And then of course have it have a command
line option indicating to remove the one flag from the one section.

Thinking of it, binutils having elfedit, it may be an option to actually
have peedit there, in sufficiently generalized form.

>> Also such an entirely new tool imo wants to use Xen style, not Linux(?)
>> one. Unless of course it is taken from somewhere, but nothing is being
>> said along these line.
> 
> Ah, sorry I didn't know about the coding style, I'll reformat it then.
> Is there a correct .clang-format file somewhere or a checkpatch.pl 
> equivalent?

Sadly not. All we have is ./CODING_STYLE and a lot of unwritten rules.

>>> +		case 'q':
>>> +			quiet = 1;
>>> +			break;
>>> +		case 'h':
>>> +			print_usage(prog_name);
>>> +			return 0;
>>> +			break;
>>
>> "break" after "return"?
> This needs to go.
>>
>>> +		case '?':
>>
>> Why is this not the same as 'h'?
> One returns 0 because help is asked for so it's not an error.
> The other one is when using non-existing argument which is an error.

But a user passing -? deserves to be shown help output, just like you
do for -h?

>>> +	if (pe->opt_hdr_size == 0) {
>>> +		printf("file has empty OptionalHeader\n");
>>> +		return -1;
>>> +	}
>>
>> Code further down doesn't really require this check, as it looks. IOW
>> either this check wants dropping, or it wants to be more strict than
>> just checking for zero.
> 
> Based on 
> https://learn.microsoft.com/en-us/windows/win32/debug/pe-format#coff-file-header-object-and-image
> My understanding is that SizeOfOptionalHeader member can be 0, for 
> object files.
> But we don't want an object file here, we want an image file.
> However, the optional header is required for image files (thus the != 0 
> check):
> 
> "Every image file has an optional header that provides information to 
> the loader."
> 
> But, we really don't know its size, moreover it's even different for 
> PE32 vs PE32+.

Yet surely we know 1 is still too little, for example?

Jan

