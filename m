Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC425CAC83B
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 09:37:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180157.1503395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSWjx-0007bh-6h; Mon, 08 Dec 2025 08:37:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180157.1503395; Mon, 08 Dec 2025 08:37:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSWjx-0007ZT-3h; Mon, 08 Dec 2025 08:37:05 +0000
Received: by outflank-mailman (input) for mailman id 1180157;
 Mon, 08 Dec 2025 08:37:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSWjw-0007ZL-6l
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 08:37:04 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11c4a2d7-d411-11f0-9d1b-b5c5bf9af7f9;
 Mon, 08 Dec 2025 09:37:02 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-42b38693c4dso1907576f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 00:37:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7cbfee66sm24215019f8f.11.2025.12.08.00.37.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 00:37:01 -0800 (PST)
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
X-Inumbo-ID: 11c4a2d7-d411-11f0-9d1b-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765183022; x=1765787822; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1dFM/rd/iM9NqVQpFftZFyYPXDptPEQILXn6lxOzrug=;
        b=HKrxIWZ6sphAM9bnGqtQ/3p2bojh/kBZ7dRw1p9wIO1gStBIWJ3VA08HPh44sQmIKw
         UKiifwaMYfjyi126i/Yn0HekSqMbHyBF+ZtPvrR1srSkFiYXArlq3kiXBQtg0DmIQVl7
         NM0iISWo0NAglJggOr/fpjkvhhmXK2k9Q3+Tfx6IvM7EkyrQRuHFhawFK19esWyhkLu7
         Rufcnicsp+/zeUD0SV1a3X0+XWwxtijIfwGdjXkxCpfkuW6S/cAo2Vn/5OZhwI0QRwiS
         grxZUOlxZLE3Q99WLcz4xll9g1xTK0H4YGjZe5z9ZaW7fqOyIq8ddV4SK2lP1nN+1NBB
         /3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765183022; x=1765787822;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1dFM/rd/iM9NqVQpFftZFyYPXDptPEQILXn6lxOzrug=;
        b=BBZPgwNKoETvaJhn67YKBHhaCgkFBtgQEuiWFfl/WR5Pkctc9BCGecvyiYWvbalL71
         AOZsfGYV/IxseC9oQz8rL4CimwRlPZDsYUNdXXMotcoeHa1nvErUTTqUiWnkTUQEeWxk
         HKDH1gFsGyr3rE1uFUw6CPly3U5N834nuSLGGLkxhrnBAK93ySytbW8ec2g+In3SXHtF
         j6SQl42q6/Mt1dmJWc97PbhBr8QGi3o7UYKoiXuNl+6CXH/R0sxtvIhWLBeIwo0VbM8a
         ev3CPxi6/s4OnaVsRzwOVHvGJsgei/kKmTBoRbkJfdhThCJFnBXfQSkGEVSnpEhKjYDx
         g1Zw==
X-Forwarded-Encrypted: i=1; AJvYcCVu75HHhBlqDCMSGBeuzgBUaDrD8CGvIcSW4CQ+rBhYMhRaRGJArC3V8vYnS5YLXwxsIpV+arnOhoY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxVoCaoVjEzoPt3s1DaXthmSfyi9NZ4RNBdV6A8/7qk3s7XcExF
	4tC8wY3nNxWz4Kii2nMGMqaXuwJIJWsDq7s3Dt9E5r+r/axBL87eVYTqxMJ6xj3SNA==
X-Gm-Gg: ASbGncsfLfAOrcKi3eqQvfopGaiU2WhoNyGHlr+mhtotuzU0e7wAdVZtWn/+Lth0GOB
	nU5NVrs0KPBhIPN2EsgELC8U/1kjN3M6ndRnX5GyktXvjkqmyvr/ym+FR2IhnCa3XDAZmwYFmdr
	hBsv69igojAfbrKRiQUTNJSFg72MLK00x/0h0Q+QSvqzXxoEJj3EvL/J/wbnsEuMkisEDsP3XuH
	cOryZe40nqjR8WoNcn27LuneY0PuKSQf8LJrfw3RFFGVchn84OM6X/TzRaIzH3lvq7RlPsZkiyj
	yb9GKv1uGlj4egD7Kj/GAGafXzC3x80kfhQ6ExkAhzxB4WUPVna1wFCw33oTyJOeOb2r/kUZHFf
	x9Ebl/bLidfv/U32T0ew+zaTC5EwOjossnX24gIagWlLm1EIvqFZrf7Hmqe4zRecAQiszq3xZ2G
	iUfV3jn1Ky3CZOnEr0x0aKZFwldU4Ax/6/xJ5ZcBTJSCJPMviS1pTl2ZOuTyQoMWruKhnEGKmj7
	Q8=
X-Google-Smtp-Source: AGHT+IFl+D5evpBkc7jZ21P/MQTRyyN4dFhgSSdsTNfYGfQW1lmBu/wmgFIsfL2s5cDeyDUDGOf0LQ==
X-Received: by 2002:a05:6000:4028:b0:42b:4177:7136 with SMTP id ffacd0b85a97d-42f89f63449mr7475622f8f.32.1765183022143;
        Mon, 08 Dec 2025 00:37:02 -0800 (PST)
Message-ID: <6e09b3db-6e9a-4fca-808a-01e3db5ccd83@suse.com>
Date: Mon, 8 Dec 2025 09:37:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v2] coverage: extend coverage on .init and lib code
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251205193411.1368659-1-grygorii_strashko@epam.com>
 <d9a632d1-8587-45bb-bc13-8dab8d346cb2@citrix.com>
 <4fc76270-98e6-46c4-a6a4-d73772e079c9@epam.com>
 <483d50d9-a076-4698-bd14-28afabd5d369@citrix.com>
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
In-Reply-To: <483d50d9-a076-4698-bd14-28afabd5d369@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.12.2025 15:15, Andrew Cooper wrote:
> On 06/12/2025 9:10 am, Grygorii Strashko wrote:
>>
>>
>> On 05.12.25 22:00, Andrew Cooper wrote:
>>> On 05/12/2025 7:34 pm, Grygorii Strashko wrote:
>>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>
>>>> Extend coverage support on .init and lib code.
>>>> Add two hidden Kconfig options:
>>>> - RELAX_INIT_CHECK "Relax strict check for .init sections only in
>>>> %.init.o
>>>> files"
>>>> - DO_NOT_FREE_INIT_MEMORY "Prevent freeing of .init sections at the
>>>> end of
>>>> Xen boot."
>>>>
>>>> Both selected selected when COVERAGE=y, as getting coverage report for
>>>> ".init" code is required:
>>>> - to bypass strict check for .init sections only in %.init.o files;
>>>> - the .init code stay in memory after Xen boot.
>>>>
>>>> RELAX_INIT_CHECK/DO_NOT_FREE_INIT_MEMORY could be used by other debug
>>>> features in the future.
>>>>
>>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>>> ---
>>>> changes in v2:
>>>>   - add RELAX_INIT_CHECK and DO_NOT_FREE_INIT_MEMORY, those are two
>>>> different things,
>>>>     both potentially reusable
>>>>   - enable coverage for libfdt/libelf always
>>>>   - enable colverage for .init always
>>>
>>> This is a lot nicer (i.e. more simple).
>>>
>>> But, I still don't know why we need to avoid freeing init memory to make
>>> this work.  What explodes if we dont?
>>>
>>
>> It will just crash when coverage data is collected.
>>
>> First I made changes in make file to get .init covered
>> then I hit a crash
>> then I checked %.init.o
>> conclusion was obvious.

Maybe in that context. In the patch submission this isn't obvious at all, I
would say. Please add some explanation in such a case.

>> For example:
>> objdump -x bzimage.init.o | grep gcov
>>
>> 0000000000000010 l     O .bss    0000000000000028 __gcov0.bzimage_check
>> 0000000000000040 l     O .bss    0000000000000040
>> __gcov0.bzimage_headroom
>> 0000000000000000 l     O .bss    0000000000000008 __gcov0.output_length
>> 0000000000000080 l     O .bss    0000000000000060 __gcov0.bzimage_parse
>> 0000000000000098 l     O .init.data.rel.local    0000000000000028
>> __gcov_.bzimage_parse
>> 0000000000000070 l     O .init.data.rel.local    0000000000000028
>> __gcov_.bzimage_headroom
>> 0000000000000048 l     O .init.data.rel.local    0000000000000028
>> __gcov_.bzimage_check
>> 0000000000000020 l     O .init.data.rel.local    0000000000000028
>> __gcov_.output_length
>> 0000000000000000         *UND*    0000000000000000 __gcov_init
>> 0000000000000000         *UND*    0000000000000000 __gcov_exit
>> 0000000000000000         *UND*    0000000000000000 __gcov_merge_add
>> 0000000000000008 R_X86_64_PLT32    __gcov_init-0x0000000000000004
>> 0000000000000012 R_X86_64_PLT32    __gcov_exit-0x0000000000000004
>> 0000000000000020 R_X86_64_64       __gcov_merge_add
> 
> Aah, we should exclude the OJBCOPY too.  That's what's moving
> .data.rel.local amongst other sections we target with attributes directly.

Yet then do we still need to suppress the freeing of .init.*?

Jan

