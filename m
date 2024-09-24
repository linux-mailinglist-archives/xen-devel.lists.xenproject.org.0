Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 060DE98443B
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 13:10:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802619.1212914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st3Q6-0008PT-4I; Tue, 24 Sep 2024 11:09:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802619.1212914; Tue, 24 Sep 2024 11:09:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st3Q6-0008Mt-0Z; Tue, 24 Sep 2024 11:09:26 +0000
Received: by outflank-mailman (input) for mailman id 802619;
 Tue, 24 Sep 2024 11:09:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vfmb=QW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1st3Q4-0008Mn-DQ
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 11:09:24 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73abf95d-7a65-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 13:09:22 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a8d24f98215so723671766b.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 04:09:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f4fb87sm70763366b.56.2024.09.24.04.09.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2024 04:09:21 -0700 (PDT)
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
X-Inumbo-ID: 73abf95d-7a65-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727176162; x=1727780962; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ISPSz4AD7k9IRDQppCndT3S7Wguno4rRVjlQgGCUcX0=;
        b=EwU+XUHhIWuiBLiXwpMAaYkxynNql1a2eyNKX5OR4/f8tUJKiVvneu9Tt+exOPxJaS
         jz6hOAtzscQf5zhTXvlq6hUPo/YqFkanxlhdrUIlBYUPGmRCGYSDzGdmmDmMp8Yu2K/p
         xdfGS+Rx0+Hbjp2pFFqshN3fVRpOYbn9fBvVMNx8qqy1YY+AgT/5lEd9KcYlLsvaNmJ9
         x+sGshAa3hmh1vxhKRo0jrAbqDFgrL0RXQZwp9NtIHxpKMeF5ngZqEoSH9eHj2899h7m
         5uDPbB2ht76giNfEosR3Q5Nllm5ub91kO4GCcrdCuc8PzberYNFUjDcwEaUE6DZ0ArPw
         f7Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727176162; x=1727780962;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISPSz4AD7k9IRDQppCndT3S7Wguno4rRVjlQgGCUcX0=;
        b=tsDtr56Z/vXOkLQT7mjcH7earVALKG+6Ydg7o4HeSvEqpn2tkO2CnVhC3/G5BSoAgd
         OeFPKwzOyB4YwDFGfHR8coYe4tRLkI0EIplDMz1Q9XOw65PWZ3z75/DsMZNnkBtvZ201
         XDy2FQ27M4dORlFPoZFoXXxg7G5aIUt+6pQk9etA0BtppGG3/dfGGLN98SH6cNYcU6WT
         V3T5YGucTArPMwOYf4JBquP76km1XJ+tSA4bM47rcAreVu1U6hNYASK8H9SwrCvmgPsg
         vWFtRv3UnVh/GpnhWWCusHs0EWAy6WI24SzuoOqaaTA6KNIBznr4F7Sk8ajUn3/BEzeT
         wb5A==
X-Forwarded-Encrypted: i=1; AJvYcCUrBTFiEmimQGSnpe7FOt46E15XqRMkpiibb6rJEB1OcMa6zoHGLcme+4lCGSDLx3FQ5xUM2TQYTts=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy9qGicB05rVA+tIdZxLzyYDaf0UV33CR+/osmAUJ8a89WpcQip
	MQBIkEwyWt3Hv7ubvw16Pul2WLo4LV5hLgJHhLsirEIGXzZQE3sl0AKHlM9HGw==
X-Google-Smtp-Source: AGHT+IFCnjKFeFEMMi1Yl85Qdshp42DuHWxGQQDn73kJIQyeeo+NHlDhDnaeGdamfEptV+NFb8weGg==
X-Received: by 2002:a17:907:f1a2:b0:a7a:9144:e23b with SMTP id a640c23a62f3a-a90d4fdb618mr1370111066b.19.1727176161825;
        Tue, 24 Sep 2024 04:09:21 -0700 (PDT)
Message-ID: <89208fd4-eef5-4bb3-b9bb-b1ee6cd0dfb0@suse.com>
Date: Tue, 24 Sep 2024 13:09:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] x86: Align output sections for UEFI CA memory
 mitigation requirements
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240919080021.20155-1-frediano.ziglio@cloud.com>
 <20240919080021.20155-4-frediano.ziglio@cloud.com>
 <f928cf8a-e047-43f0-bf1d-c864d5d0e317@suse.com>
 <CACHz=ZiFyiSaihgTL_rSqfNNag761+1QyAhytQhn5zM6tOUSsw@mail.gmail.com>
 <ac8a299d-ec25-431a-aa56-d8a10ca1220a@suse.com>
 <CACHz=Zh_Cr_Qfpz4vntBZfZ-HqYGH+DspEAJkVmeBKMNk_z-_g@mail.gmail.com>
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
In-Reply-To: <CACHz=Zh_Cr_Qfpz4vntBZfZ-HqYGH+DspEAJkVmeBKMNk_z-_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.09.2024 12:22, Frediano Ziglio wrote:
> There are indeed some oddities in the final executable(s):
> 
> From "objdump -x":
> 
> xen/normal/xen.efi:     file format pei-x86-64
> xen/normal/xen.efi
> architecture: i386:x86-64, flags 0x0000013b:
> HAS_RELOC, EXEC_P, HAS_DEBUG, HAS_SYMS, HAS_LOCALS, D_PAGED
> start address 0xffff82d04062bfdc
> ...
> The Data Directory
> Entry 0 0000000000000000 00000000 Export Directory [.edata (or where
> ever we found it)]
> Entry 1 0000000000000000 00000000 Import Directory [parts of .idata]
> Entry 2 0000000000000000 00000000 Resource Directory [.rsrc]
> Entry 3 0000000000000000 00000000 Exception Directory [.pdata]
> Entry 4 0000000000000000 00000000 Security Directory
> Entry 5 00000000009489a0 000016c0 Base Relocation Directory [.reloc]
> Entry 6 00000000004871c8 0000001c Debug Directory
> Entry 7 0000000000000000 00000000 Description Directory
> Entry 8 0000000000000000 00000000 Special Directory
> ...
> There is a debug directory in .buildid at 0xffff82d0404871c8
> ...
> Sections:
> Idx Name          Size      VMA               LMA               File off  Algn
>  0 .text         0018c5f6  ffff82d040200000  ffff82d040200000  00001000  2**4
>                  CONTENTS, ALLOC, LOAD, CODE
>  1 .rodata       000871c8  ffff82d040400000  ffff82d040400000  0018e000  2**2
>                  CONTENTS, ALLOC, LOAD, DATA
>  2 .buildid      00000035  ffff82d0404871c8  ffff82d0404871c8  002151e0  2**2
>                  CONTENTS, ALLOC, LOAD, READONLY, DATA
>  3 .init.text    0004775b  ffff82d040600000  ffff82d040600000  00215220  2**2
>                  CONTENTS, ALLOC, LOAD, READONLY, CODE
> ....
> 
> Some notes:
> 1- I don't understand why the debug directory points to .buildid section
>   (I suppose that's the reason for the "There is a debug directory..." message);

Like in ELF final executables, in PE ones information like this should
be locatable by means other than looking up sections by name and then
hoping they contain what's expected. Short of program headers and
dynamic tags, this is the scheme people invented to make the build ID
actually locatable. If you look at how this works in our build system,
you'll find that this even requires passing a COFF object to the linker
(i.e. involving a little bit of trickery).

> 2- .buildid follows .rodata (this is expected);
> 3- .buildid is not page aligned but the loader I tried seems to be
> happy with that,
>   I think it should be aligned;

Generally it doesn't need to be. If the secure boot stuff requires it
to be, then we need to live with that (and the wasted page). Preferably
it could continue to use (in the common case) a few bytes on the last
.rodata page. Or we could see whether folding .buildid into .rodata
works (I don't recall whether I tried that back at the time).

> 4- .rodata for some reason is not marked as READONLY, even on ELF you
> get the same issue.

I can confirm this oddity, without having an explanation. It must be
one of the inputs; I've checked that prelink.o's .rodata is r/o. So it
can only be some other constituent.

Jan

