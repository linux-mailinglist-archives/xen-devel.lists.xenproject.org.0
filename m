Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD240971519
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 12:15:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794174.1202924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snbQY-0004Ds-Iq; Mon, 09 Sep 2024 10:15:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794174.1202924; Mon, 09 Sep 2024 10:15:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snbQY-0004B8-Fs; Mon, 09 Sep 2024 10:15:22 +0000
Received: by outflank-mailman (input) for mailman id 794174;
 Mon, 09 Sep 2024 10:15:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qOm0=QH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1snbQX-0004B2-GA
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 10:15:21 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a85493e-6e94-11ef-99a1-01e77a169b0f;
 Mon, 09 Sep 2024 12:15:19 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a7a9cf7d3f3so530513066b.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 03:15:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c80a24sm319802766b.137.2024.09.09.03.15.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 03:15:18 -0700 (PDT)
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
X-Inumbo-ID: 6a85493e-6e94-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725876919; x=1726481719; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FjIh08O20lCCZPk7ogFrVWhQyufORcAVkku2jseV5xY=;
        b=QP+w2w8q0aedHNNZCZ64Q7+8qWnZK7vD4nfg5Djt6UrzqgOZqPrQ7qoShPIyuosb35
         y3O63Xlwh9n2tv9z+5a25TQZh/CE74gKgNkhlyVntsKK2qd485zdK7HvYKeC1fcJZX2l
         3Hy0BU9+HeoIUOdO/4rEnNp44RZhGM6te0mjMxLjJeGoQZaAVqZYb4GhMNfx+KsYnAvJ
         lSP7/0CA62eBT/YS3wjqxG7I61qCcFg4tk3p/EFMMIOrbAx0z14LnzXE/AjTgqsMXPVs
         ltQf3RsL4wg2qsKsIumro416G6aSOHAyzZJSAkSBoT7A3bZwFgSnXe22BGFz84RkUTiH
         VujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725876919; x=1726481719;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FjIh08O20lCCZPk7ogFrVWhQyufORcAVkku2jseV5xY=;
        b=OlaDJ1iO2Af8GN7l34R+mIAfVzSVgh3yc0kfQMSkru29D+oPNy7mp5qPrfOiLej4B3
         k7K5OtzR9+bz/4NbanttfnAvPzDiNfsvv6j0NPYcMri2JOxmdrvkyQfqq9lxCi+eijbg
         +qHXpk0MCvUd7jBaNWVIojlrJfe/CziZ9pvs02gOeGiKWPacAo64x3oXab1ug4Gro+FL
         /sLlUOJZDlZgweNHFwv5EEgQU6H/4S5OQiH/kF7X2baDPHf9BnqDsmulofHmTmTU1NJI
         GRDY6kZQ0qt0f4TVK1uALfSJxqVw13ao9XiZsxkJl12JFt7X07l5aran8h+Nd/UnXamX
         hwAA==
X-Forwarded-Encrypted: i=1; AJvYcCWgE5CqO6DxeVVAKdUMhTW8vS56GksYQMLPPT6BbNZ6RJd+8zvmzv1NTriy2fe5Om847dUjg6YTy8E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyF7Ubsfr6EeF4Pzs897gdazDBsRATxlv3vkEvYqIZfeNGPxGci
	eEJiC/tJyojAfX2BFeHQuMrnHwVx/disVZVQdtvXUUiu0f5B41ohWFPZCXbefQ==
X-Google-Smtp-Source: AGHT+IGYhPfLue898rl7tsE8YFjAXoaBCOrzzrUhNoFPG+a0ykmtUt+4BCtV0miQrfgL31Ovc4Isaw==
X-Received: by 2002:a17:907:60d2:b0:a8d:4e13:55f9 with SMTP id a640c23a62f3a-a8d4e13567cmr253084466b.19.1725876918664;
        Mon, 09 Sep 2024 03:15:18 -0700 (PDT)
Message-ID: <cc83015c-1e9a-487f-8b33-55e31d4be0ea@suse.com>
Date: Mon, 9 Sep 2024 12:15:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/5] Reuse 32 bit C code more safely
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20240904145648.33707-1-frediano.ziglio@cloud.com>
 <772a9d43-6338-40be-9499-1055ac94cfe6@citrix.com>
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
In-Reply-To: <772a9d43-6338-40be-9499-1055ac94cfe6@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.09.2024 17:59, Andrew Cooper wrote:
> On 04/09/2024 3:56 pm, Frediano Ziglio wrote:
>> This RFC series attempt to:
>> - use more C code, that is replace some assembly code with C;
>> - avoid some code duplication between C and assembly;
>> - prevent some issues having relocations in C code.
>>
>> The idea is extending the current C to binary code conversion
>> done for 32 bit C code called from head.S making sure relocations
>> are safe and allowing external symbols usage from C code.
>>
>> Note that, as an addition, scripts generating code check for no
>> data to allow code and data separation.
>>
>> More details of the implementation are in commit message 2/5,
>> which is the largest patch.
>> Patch 1/5 is to prepare code and avoid data.
>> Patch 3/5 is an example of code reuse between 32 and 64 bit.
>> Patch 4/5 is also another example of code reuse but is more hacky and
>> dirty due to not being possible include use some headers.
>>
>> Code boot successfully using:
>> - BIOS boot;
>> - EFI boot with Grub2 and ELF file;
>> - direct EFI boot without Grub.
>>
>> Suggestions/opinions are welcome.
>>
>> Code is currently based on "staging" branch, currently commit
>> 6471badeeec92db1cb8155066551f7509cd82efd.
> 
> I fully support taking logic out of asm and writing it in C, as well as
> taking steps to dedup the EFI and non-EFI paths.  A couple of
> observations before diving into the details.
> 
> The visibility pragmas mean that you've lost the `-include xen/config.h`
> from the $(CC) invocation.  We use this to get some Xen-wide settings
> everywhere, which includes handling visibility.
> 
> The symlinks for dual builds are going to cause problems for tarball
> archives.  Instead you can encode this with make rules.  e.g.
> 
>     obj-y += foo32.o foo64.o
> 
>     %32.o: %.c
>         $(CC) -m32 ...
> 
>     %64.o: %.c
>         $(CC) -m64 ...
> 
> will build two different .o's from the same .c.  This is how XTF builds
> different tests from the same source.
> 
> 
> I'm on the fence with the ifdefary and bit suffixes.  I don't think we
> need the error case because x86_128 isn't coming along any time soon.
> 
> For completeness, there's a trick used by the shadow code (see
> SHADOW_INTERNAL_NAME()) which adds a suffix without local ifdefary. 
> It's nicer to read, but breaks grep/cscope/etc.  I'm torn as to which is
> the lesser evil.

While generally I prefer that approach shadow code takes, I think the
#ifdef-ary is acceptably bounded here. What I'm more worried by are the
fair number of #define-s for the 32-bit case of setting up page tables.

Jan

