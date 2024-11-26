Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 201549D986E
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 14:22:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843714.1259326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFvUq-0006sN-Ti; Tue, 26 Nov 2024 13:20:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843714.1259326; Tue, 26 Nov 2024 13:20:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFvUq-0006q7-QG; Tue, 26 Nov 2024 13:20:52 +0000
Received: by outflank-mailman (input) for mailman id 843714;
 Tue, 26 Nov 2024 13:20:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zjIj=SV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFvUo-0006px-Sx
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 13:20:50 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e4a2471-abf9-11ef-a0cd-8be0dac302b0;
 Tue, 26 Nov 2024 14:20:45 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-434a14d6bf4so15614095e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 05:20:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4349cf7e4fesm94912855e9.22.2024.11.26.05.20.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 05:20:44 -0800 (PST)
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
X-Inumbo-ID: 3e4a2471-abf9-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmEiLCJoZWxvIjoibWFpbC13bTEteDMyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjNlNGEyNDcxLWFiZjktMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNjI3MjQ1LjQ4NDgxNSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732627245; x=1733232045; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ie0mWLpOW0oUrSVSj+ll90vwMo8ta7P223PIY0zLVC8=;
        b=bIrQsMtspN7t1IJhMTM4R7yus5V0LXxjNjXm4rxh7I2ubnOOn+Xoa3qKC8a3JIKg56
         G0a89IUWvheA4gqttSRP+4SoFfRhcSLWgNgrnk3x9pIlZdoVryVbOCOhwJmX9Dzt2FU5
         d6AjjF5FqKgQiI8ax8CGvDDsGTGKwCvI0xPt7UepgroajBdTbopB15O9uIJKFKN1tljB
         loN4xlzzKWisnr26UN2GNa8tx7XzyzXw7qHbgf+ddTMQoUn0CwPaJ7OUulJavNP+KAA8
         vhHxA99sRAwzY5Xl/ESpnLAU8HyIHD3GCASF1Kcl8uOEdo2pPcZHUmXjuzP5cjx6mFGV
         7ZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732627245; x=1733232045;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ie0mWLpOW0oUrSVSj+ll90vwMo8ta7P223PIY0zLVC8=;
        b=NEmqTGiI2QyWIaq6iRu7HtlWA7BnRypo4ssFiqy4G/1qGDHV+1LgC+BVv2U8TOxg8f
         P9MCxb7SPWS3jTQgOfZWncbKs4Egb//hgJZ0eMAxUkBH0jBZUl3GFs8EPEvrIivIJZW2
         tMKbNm0pwJ4L/a1Ru4AYy/k4WkG0A2fbhPstj1aMC9KwyOwQOrIZyRWU2QiSnJGOdAi5
         ugSXdw5cMfSxL+9O6thicCub6zlIxbQ8uRwEwYAYQMITlOgEvkqE+Xf+NK1RTRRxsrVy
         dqti8QIORpT419Nt/AmlfU5//UKdLyXsXd8hJGllJn67WrnhrjjDMs2BZB73hVigftXh
         kQRg==
X-Forwarded-Encrypted: i=1; AJvYcCW73mDPwzkRdxwaq/yiQBsGNTA8aUfOuhbVDcRYztWlSPJ5nvTE0XVKjDDuyw4XRaC1wFkgzvF8vGY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz9o8F7Zd866Y68LnpOHdm6xw/wAc2/IlNe44KhnRBcTD17MnFF
	XkXop570Ek+D1LsgIHOwimEx06MovFvkYiTzIemeYqveTOVkd45UGD0dixHCZw==
X-Gm-Gg: ASbGncsCIKZclyUe4zMd7Ax9eSipoN+rK0DATbVi9NWERMVN6AqBe+953wvbY3Q5IcJ
	GIdNO1eW8K7IxXNmHhMLy9f53PvsVqwJ9rPQ2IwiIAwSHDLrb4umWNC/xvdABKld7CTl8dl8Njj
	BgsFnHuE+ln3hNeTewGmWohFuYdsOwvPO2RULUiIzVrLaMurMgmkZZHuANYYKkmF9x51ja4THQS
	02mMkL1uH9KyLcuGciwc8+/uMVvE8gw3HxEcxoKmG/N87a6UFf2yhHUNDI3gVxoZYoBvJPB0lHC
	OwOA0YZtTGZJpKsfkxwTtZ02WM9JkQrKKys=
X-Google-Smtp-Source: AGHT+IHHjCo0uYOwKMuTSNPxSjwrneaiW25NBfmXX4UwudpaXyKhJUzlZAxOhdpeS8Mr2v+jZjoDLg==
X-Received: by 2002:a05:600c:35c4:b0:431:93d8:e1a1 with SMTP id 5b1f17b1804b1-433ce4c1f1bmr143799315e9.27.1732627244765;
        Tue, 26 Nov 2024 05:20:44 -0800 (PST)
Message-ID: <e40ed7c2-6111-468e-8655-884953bd33e7@suse.com>
Date: Tue, 26 Nov 2024 14:20:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 12/25] xen: Replace sysctl/readconsole with
 autogenerated version
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
 <20241115115200.2824-13-alejandro.vallejo@cloud.com>
 <0a5a66d9-4fd4-4084-b7f9-0923d5a4c6d5@suse.com>
 <D5VHI2OA8QTK.1H4ZDUSP5EZX5@cloud.com>
 <737292fd-1c4a-4fd6-ae98-a701adb0b88e@suse.com>
 <D5W3YYDE2F09.IHJMRBUBE6EV@cloud.com>
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
In-Reply-To: <D5W3YYDE2F09.IHJMRBUBE6EV@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.11.2024 13:27, Alejandro Vallejo wrote:
> On Tue Nov 26, 2024 at 9:40 AM GMT, Jan Beulich wrote:
>> On 25.11.2024 19:51, Alejandro Vallejo wrote:
>>> On Mon Nov 25, 2024 at 12:05 PM GMT, Jan Beulich wrote:
>>>> On 15.11.2024 12:51, Alejandro Vallejo wrote:
>>>>> Describe sysctl/readconsole as a TOML specification, remove old
>>>>> hand-coded version and replace it with autogenerated file.
>>>>>
>>>>> While at it, transform the console driver to use uint8_t rather than
>>>>> char in order to mandate the type to be unsigned and ensure the ABI is
>>>>> not defined with regards to C-specific types.
>>>>
>>>> Yet the derived C representation imo then should still be using char, not
>>>> uint8_t.
>>>
>>> There's 2 issued addressed by this patch.
>>>
>>>   1. The removal of char from the external headers (and the Xen driver).
>>>   2. The replacement of the existing struct by the autogenerated one.
>>>
>>> (1) wants doing irrespective of (2). char has neither a fixed width nor a fixed
>>> sign. Which is irrelevant for ABI purposes in this case because what we really
>>> meant is "give me a pointer" in this hypercall, but it may be important in
>>> other cases.
>>>
>>> IOW, char should've never made it to the definition of the public ABI, and I'm
>>> merely taking the chance to take it out. Happy to extract this patch and send
>>> it separately.
>>
>> Well, work towards fully getting char out of the public headers may indeed be
>> worthwhile. Otoh with char being the basic addressing granularity, I think
>> the ABI is pretty much tied to sizeof(char) == 1, imo limiting the
>> worthwhile-ness quite a bit.
> 
> Let me put it another way. If I were to create a separate patch stripping char
> and using uint8_t instead, what are my chances of getting an Acked-by? Or not a
> NAK, at least. (there's other maintainers that I need that from, but one step
> at a time).

That would to some degree depend on what other maintainers think. Not a straight
NAK in any event.

>> Signed-ness of plain char doesn't really matter as long as it's used only for
>> what really are characters (or strings thereof). And that looks the be pretty
>> much the case throughout the public headers.
> 
> Maybe. Still, as a general principle caller and callee ought to agree on size,
> alignment and sign for every type. I'd rather not make exceptions for that
> invariant unless truly well motivated. And in this case it's a case of
> requiring trivial non-functional changes.

In how far they're non-functional will need to be seen. You also need to keep
consumers in mind: They may face sudden type disagreement that compilers may
complain about. Yet "stable" for the public headers means not just the ABI
itself being stable, but updated headers also being usable as drop-in
replacements for older versions.

>>>> Nit: For anything that is committed, it would be nice if those files were as
>>>> tidy as possible style-wise. Most of the above looks entirely okay, just
>>>> that there is an unnecessary trailing blank line.
>>>
>>> I did go out of my way to prettify the output.
>>>
>>> The trailing newline was intentional to make it C++03-compatible. I can get rid
>>> of it, as it doesn't matter a whole lot.
>>
>> I haven't followed the development of C++ very closely; my experience with it
>> is mostly from far more than 20 years ago. What's that C++03 compatibility
>> requirement?
> 
> It's really unimportant. -Wnewline-eof, I think it was. There's a pedantic
> paragraph in the C++ spec from 2003 that states that if a file is not
> newline-terminated it's UB to parse it. I tend to newline-terminate my files
> for easy `cat`-ing them together in the rare occasions where that's useful for
> something.

Unimportant or not - there must then be some misunderstanding on either my
side or yours. Even the assembler insists on a final newline, as does plain
C. Yet that means one newline, not two (i.e. not a trailing blank line).

Jan

