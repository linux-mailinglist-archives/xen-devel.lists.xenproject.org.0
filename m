Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FD18303C3
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 11:41:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668366.1040506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ3LP-0004bZ-5s; Wed, 17 Jan 2024 10:40:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668366.1040506; Wed, 17 Jan 2024 10:40:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ3LP-0004ZF-2m; Wed, 17 Jan 2024 10:40:27 +0000
Received: by outflank-mailman (input) for mailman id 668366;
 Wed, 17 Jan 2024 10:40:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yGoF=I3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rQ3LO-0004Z9-3t
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 10:40:26 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2472f89-b524-11ee-98f2-6d05b1d4d9a1;
 Wed, 17 Jan 2024 11:40:24 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2cddf596321so18518471fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jan 2024 02:40:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 q11-20020a02c8cb000000b0046e50cca693sm343973jao.4.2024.01.17.02.40.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jan 2024 02:40:23 -0800 (PST)
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
X-Inumbo-ID: d2472f89-b524-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705488024; x=1706092824; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MF6y/tF24JXdoAFBG+DBL49jGWEbFq6auPY3ZL2jjec=;
        b=CTbAPuOuNHuDpyIxGCudaRhHbZWOShmlDv4IAjnmmQALmk1MAXIntoyvIh5Je5jtVK
         kDeDg6I+5B7/2POuJ+lTS+j+5Cc3uG2HzaqjOW6BpTUAhs/P0aZUdE6oFzhM0xljAat6
         6a0cyrSuzewgFvNfmV5QhT5QSenqRq4vMOvDgni9vOL7ETDRVNix4U84MsKS+kM8Tife
         C2BGPyrjRSMpZ7hnH43HZ+k2Je1koVPOQzPyVRGKkg5eUlTtJr5qg5aUR0ZIeerxlPaf
         n5poll480hOJ+7QRVy2UHdE8T+Z8Itdv/HsMpVsCOAeORyJLc8MeAEZOgAohnQ1eHlqh
         xFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705488024; x=1706092824;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MF6y/tF24JXdoAFBG+DBL49jGWEbFq6auPY3ZL2jjec=;
        b=lthp87ZCFzbfxDAnNSD3dD/sIiJ7zzjHF7/iAdgel4AkjjHehWKpXIRxuVFSEHBQUD
         Oeoh/HecCs3tfR3iWVOxHI0urdtBrIrxnr0p2PdrXKP/VxvwwNbZOZ2XUgnNSixqhpE4
         mPEHntyWH3pFXeDA7CvyWPh4jFdxhwTNMA2sX9ZAtpeN8uH53+JKHnrS4GYbvvGsrDDK
         ahHP4vUkuZLNdadNfyLCqmyXthVhHuFpItYIJpEIFNDj9efCLK6qc9YwfgbfDgu5lh9E
         ppSw5ceCAsMWC3M5e83Mn76JalDWqAiDArvTQputtpj/yqWzSagw9tmdrVQYZYPqm1/Q
         M5Gg==
X-Gm-Message-State: AOJu0YxCJGbTYJrxwx8+L5QEdobIndmY4BE0ojxnhJbPHHcOQKsOp1HA
	AbIXwg1loUkEn1fODtWMN+JFAxyi4FEw
X-Google-Smtp-Source: AGHT+IFVENkTUqECNbBT/owJlNvyMbUq1QTIvSdtZ2JYlFvyxaVzPWNMYYx6Lfaldyy2g02mUVQf+g==
X-Received: by 2002:a05:651c:150c:b0:2cd:a873:473d with SMTP id e12-20020a05651c150c00b002cda873473dmr4867289ljf.0.1705488024063;
        Wed, 17 Jan 2024 02:40:24 -0800 (PST)
Message-ID: <15dcef46-aaa8-4f71-bd5c-355001dd9188@suse.com>
Date: Wed, 17 Jan 2024 11:40:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: E820 memory allocation issue on Threadripper platforms
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Patrick Plenefisch <simonpatp@gmail.com>, xen-devel@lists.xenproject.org,
 Juergen Gross <jgross@suse.com>
References: <CAOCpoWdOH=xGxiQSC1c5Ueb1THxAjH4WiZbCZq-QT+d_KAk3SA@mail.gmail.com>
 <1708c3d7-662a-44bc-b9b3-4ab9f8642d7b@suse.com>
 <dcaf9d8d-ad5a-4714-936b-79ed0e587f9d@suse.com>
 <CAOCpoWeowZPuQTeBp9nu8p8CDtE=u++wN_UqRoABZtB57D50Qw@mail.gmail.com>
 <ac742d12-ec91-4215-bb42-82a145924b4f@suse.com>
 <CAOCpoWfQmkhN3hms1xuotSUZzVzR99i9cNGGU2r=yD5PjysMiQ@mail.gmail.com>
 <fa23a590-5869-4e11-8998-1d03742c5919@suse.com> <ZaeoWBV8IEZap2mr@macbook>
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
In-Reply-To: <ZaeoWBV8IEZap2mr@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.01.2024 11:13, Roger Pau Monné wrote:
> On Wed, Jan 17, 2024 at 09:46:27AM +0100, Jan Beulich wrote:
>> Whereas I assume the native kernel can deal with that as long as
>> it's built with CONFIG_RELOCATABLE=y. I don't think we want to
>> get into the business of interpreting the kernel's internal
>> representation of the relocations needed, so it's not really
>> clear to me what we might do in such a case. Perhaps the only way
>> is to signal to the kernel that it needs to apply relocations
>> itself (which in turn would require the kernel to signal to us
>> that it's capable of doing so). Cc-ing Roger in case he has any
>> neat idea.
> 
> Hm, no, not really.
> 
> We could do like multiboot2: the kernel provides us with some
> placement data (min/max addresses, alignment), and Xen let's the
> kernel deal with relocations itself.

Requiring the kernel's entry point to take a sufficiently different
flow then compared to how it's today, I expect.

> Additionally we could support the kernel providing a section with the
> relocations and apply them from Xen, but that's likely hm, complicated
> at best, as I don't even know which kinds of relocations we would have
> to support.

If the kernel was properly linked to a PIE, there'd generally be only
one kind of relocation (per arch) that ought to need dealing with -
for x86-64 that's R_X86_64_RELATIVE iirc. Hence why (I suppose) they
don't use ELF relocation structures (for being wastefully large), but
rather a more compact custom representation. Even without building PIE
(presumably in part not possible because of how per-CPU data needs
dealing with), they get away with handling just very few relocs (and
from looking at the reloc processing code I'm getting the impression
they mistreat R_X86_64_32 as being the same as R_X86_64_32S, when it
isn't; needing to get such quirks right is one more aspect of why I
think we should leave relocation handling to the kernel).

> I'm not sure how Linux deals with this in the bare metal case, are
> relocations done after decompressing and before jumping into the entry
> point?

That's how it was last time I looked, yes.

Jan

> I would also need to check FreeBSD at least to have an idea of how
> it's done there.
> 
> Thanks, Roger.


