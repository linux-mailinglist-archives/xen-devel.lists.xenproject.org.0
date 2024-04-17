Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8D78A8872
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 18:08:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707650.1105748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx7p6-0000Wv-1I; Wed, 17 Apr 2024 16:07:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707650.1105748; Wed, 17 Apr 2024 16:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx7p5-0000VP-U1; Wed, 17 Apr 2024 16:07:47 +0000
Received: by outflank-mailman (input) for mailman id 707650;
 Wed, 17 Apr 2024 16:07:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T4Tg=LW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rx7p4-0000Tr-Pf
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 16:07:46 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ff0e2aa-fcd4-11ee-94a3-07e782e9044d;
 Wed, 17 Apr 2024 18:07:44 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2d895138d0eso49051841fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 09:07:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 dk15-20020a0560000b4f00b00349ceadededsm1545794wrb.16.2024.04.17.09.07.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Apr 2024 09:07:43 -0700 (PDT)
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
X-Inumbo-ID: 9ff0e2aa-fcd4-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713370064; x=1713974864; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wOQ5CIi+Ljjku46E2m/PqUNfkY53GSfaHeFajaqXOdM=;
        b=JL6rIhCdLNfhOp1/RQDCh/gjLicfRQlXuYYEuApb57yPE40UHrv4wu3Ar0Z3f9SDka
         +f9z/Lb/c59GVN+HLoPWgg1jdUo6sv3dbv1+jp+57khr4ZkEmmt+MaESG9wmxS5AXuxv
         pf6u724c1UtMYZk9E3n4ZUV985EhH9flolxveD9ozyhJarjODT9Q5ScFq9VnBXZ++V0L
         MwSzNPu7LuPmSUkkBc4CifVx+JF6mC4ZoWzaXeyNxO4igCTTxhZ+KTSvnVWu6xUVPrdu
         VYa0Vt/4hAdGyBr143u7/wtJSmuMFnk8UYCU85mHVxqyFxK6kLkmF47ppoF26xRyNbf0
         evpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713370064; x=1713974864;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wOQ5CIi+Ljjku46E2m/PqUNfkY53GSfaHeFajaqXOdM=;
        b=IEGXGxvfybqQEYXywAitFpq2AdQ1ckfrQIvSoFoXZPQn5wsfufZKeWf8iHbDmWJ/iH
         52c8XuHjT4s30MYx1ATmtHFSijYc7IU9KxUB202dSMiU4coOJmYh7aeanVKts8PsXvhO
         jGoEb2BO4BdQaanhRvvbmwlpaQi+c4rgputTZTMZIOFEukZne5OSPmKYEYyPIg50JL7d
         WLPJUY5f0ravVqbwYkFQecHtIBie+czoUoT6WYww5VANRCBQ+npgNS6gcaRxJyo4g2Ha
         SRxesEoW8O+WSlD9PFrX8pYSBnBKSmKYGn3Ivb8xkUXgK+r8MoWNsOFdRN5x04/T1eF3
         YssA==
X-Forwarded-Encrypted: i=1; AJvYcCXDQtCumLQvX9YZgn4DtxUCCFcwNs9uAhFCINh0QWGTtmfn6b2F24f9qMooyeOlrVhEl6vEMVXjvXsIjsIzlVsGChEDL2mOKrybzUEtFj8=
X-Gm-Message-State: AOJu0YwDp6kIr+Jj6CFS2TYbY95Ovs5zFS9nykxU3HbuFYnwqfYNXXCX
	m1o77WrlNx7pu7GutoCuruCuGqVG1UdxSOX+fwI5g9SBfZc47KCUPctFD1yj1A==
X-Google-Smtp-Source: AGHT+IGHNVgMXNIbyJZnRY/aHWHaTKagT5Mnsdxhfdd6AhMWjAuRkLx4a4YcWmzvyQ52VN1ZBe4TbQ==
X-Received: by 2002:a2e:3509:0:b0:2d9:ecc1:6d56 with SMTP id z9-20020a2e3509000000b002d9ecc16d56mr11167344ljz.11.1713370063760;
        Wed, 17 Apr 2024 09:07:43 -0700 (PDT)
Message-ID: <cbfe7614-c202-4c6e-99a0-3792bfed763c@suse.com>
Date: Wed, 17 Apr 2024 18:07:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] x86: Add support for building a multiboot2 PE
 binary
Content-Language: en-US
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240328151106.1451104-1-ross.lagerwall@citrix.com>
 <20240328151106.1451104-2-ross.lagerwall@citrix.com>
 <c3c2ce12-0699-42b3-bcaf-5bddf0616566@suse.com>
 <CAG7k0EroeA=cRRDWnJqzH8esoaSmtg8-xjTwc-01og5R9JwPzg@mail.gmail.com>
 <0d84a96a-c1ec-4c4e-9cb5-44a6542e0d43@suse.com>
 <CAG7k0EpKRVpbfBOSA9tsQsGM9_nLCmrZNYzV6G9u5g46oZWKwQ@mail.gmail.com>
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
In-Reply-To: <CAG7k0EpKRVpbfBOSA9tsQsGM9_nLCmrZNYzV6G9u5g46oZWKwQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.04.2024 17:05, Ross Lagerwall wrote:
> On Wed, Apr 17, 2024 at 3:15 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 10.04.2024 11:41, Ross Lagerwall wrote:
>>> On Mon, Apr 8, 2024 at 11:25 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 28.03.2024 16:11, Ross Lagerwall wrote:
>>>>> * The image base address is set to 0 since it must necessarily be below
>>>>>   4 GiB and the loader will relocate it anyway.
>>>>
>>>> While technically okay, what is the reason for this adjustment?
>>>
>>> The multiboot2 spec generally uses 32 bit addresses for everything and
>>> says:
>>>
>>> "The bootloader must not load any part of the kernel, the modules, the
>>> Multiboot2 information structure, etc. higher than 4 GiB - 1."
>>>
>>> An image base address above 4 GiB causes trouble because multiboot2
>>> wasn't designed for this.
>>
>> Yet mb2 doesn't care about that PE header field at all, does it? In which
>> case my question remains: What purpose does this particular modification
>> of the image have?
>>
> 
> With the currently published version of mb2, it doesn't look at the PE
> header field since it has no knowledge about PE binaries.
> 
> With the proposal on the grub-devel list [1], mb2 would use the PE
> header to load the new xen-mbi binary in which case, the image base
> address is indeed relevant.

But then how can you strip .reloc? If the image base field is to be used,
and if the image can't be placed there, relocation needs to happen. (As
an aside, [1] looks to be talking of the entry point only, not the image
base?)

Jan

> [1] https://lists.gnu.org/archive/html/grub-devel/2024-03/msg00081.html


