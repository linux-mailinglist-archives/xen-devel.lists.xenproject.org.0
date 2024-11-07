Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 942639C0459
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 12:42:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831712.1247063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t90ty-0001uy-Ca; Thu, 07 Nov 2024 11:42:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831712.1247063; Thu, 07 Nov 2024 11:42:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t90ty-0001sk-9y; Thu, 07 Nov 2024 11:42:14 +0000
Received: by outflank-mailman (input) for mailman id 831712;
 Thu, 07 Nov 2024 11:42:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aElt=SC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t90tw-0001se-Sk
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 11:42:12 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52cf32f1-9cfd-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 12:42:10 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-37d4fd00574so472731f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 03:42:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b0562642sm21311245e9.21.2024.11.07.03.42.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Nov 2024 03:42:09 -0800 (PST)
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
X-Inumbo-ID: 52cf32f1-9cfd-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmQiLCJoZWxvIjoibWFpbC13cjEteDQyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjUyY2YzMmYxLTljZmQtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTc5NzMwLjM2ODcyNiwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730979730; x=1731584530; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4i3EIorw66PDv2ixCYy6jyxTps6uALkK7M+QJjfvtBw=;
        b=HAWRx2ZS0a+2OlSEyP4jhIJ+UuX601ECxuNFlIOk+AAlqvFFtxFK3c4XEpLeLgwurb
         Lu5Tc9PIEPlTbVa8KTWpsliHH3onI/YNqRj/55RJT9F7XeX223hA+cXdavCkLqe56ZHd
         0YIEncz14p9BifbMpjykGYWk7bFXSDUDPIivYWHO3Q31EnmjWesiD9j3cBDZ0B+ON7zu
         ftJ7HXL2KNFEVWkwP3/W9Mqs78JymmdhH3LcrRjsemiW98RrSm7yNM7FMne9xbJy8qxw
         FqRSes/Egx16rjb9nI3pis3rwtNBkaqU6KG0aZVdjsc5fBd/IR08P1w+doJ+U8h6POhq
         ETMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730979730; x=1731584530;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4i3EIorw66PDv2ixCYy6jyxTps6uALkK7M+QJjfvtBw=;
        b=UA9L79kVniPBGtwUo25remfE6zBXvAiS/OiYr43QALC4KphVtAnxLpiC3PmcTbUQ4i
         d89gn27Y9iBP48SJ1Glpf/gIyTRbSfuKbETSY5mF4mBs7eA0TsV/Vw8W2nJDiXwadPKe
         VKy3aMXuIn5gYV2svyLgsYY3WL0N+AK1RZwu72nQbo09cBFgKYtLwG0gtfEtxa62713V
         n75XW58jjGIDl0PvKHDH9cyZsQwz2PXhZFoTNjmC+L5MGIeeoEpoMYczCzDYs4CJVhFu
         1K3H9EkqXj3Y4+qtCYijQww/Kq83IjV+qC255glbX8mcrIpUI3y+sV3yquhPQNiFRblE
         aphg==
X-Gm-Message-State: AOJu0YyKLpbn5sT11L7u60BnuhvYaqNv4KuyT7vZ1/IwlR50huquOkBR
	dSqNBV1w4d2VYwqjTpyOemOAm4E0DXTaSZ5IlWq/9En4u3nl8vi3C1lja+EQEg==
X-Google-Smtp-Source: AGHT+IH51t3VEabAuYpPft4vZ/EpXR1iNfkzxWMp1r77PtiTPKUeZXP1CCzGhsUMDTcAFHKXKeCAzA==
X-Received: by 2002:a05:6000:178a:b0:374:b9ca:f1e8 with SMTP id ffacd0b85a97d-381ec607160mr2175329f8f.20.1730979729730;
        Thu, 07 Nov 2024 03:42:09 -0800 (PST)
Message-ID: <3dc45d47-7400-4c17-9e89-9604b01bdac4@suse.com>
Date: Thu, 7 Nov 2024 12:42:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/Kconfig: livepatch-build-tools requires debug
 information
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20241107084927.37748-1-roger.pau@citrix.com>
 <66fd7b53-25f5-459b-8563-e33fccba90ef@citrix.com> <ZyyLAj6MZ3fvOFBC@macbook>
 <22c59035-67e3-4e43-bfe0-26675a93e9ae@suse.com> <Zyyjmu9tm1KEGiqQ@macbook>
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
In-Reply-To: <Zyyjmu9tm1KEGiqQ@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.11.2024 12:25, Roger Pau Monné wrote:
> On Thu, Nov 07, 2024 at 10:48:21AM +0100, Jan Beulich wrote:
>> On 07.11.2024 10:40, Roger Pau Monné wrote:
>>> On Thu, Nov 07, 2024 at 09:21:26AM +0000, Andrew Cooper wrote:
>>>> On 07/11/2024 8:49 am, Roger Pau Monne wrote:
>>>>> The tools infrastructure used to build livepatches for Xen
>>>>> (livepatch-build-tools) consumes some DWARF debug information present in
>>>>> xen-syms to generate a livepatch (see livepatch-build script usage of readelf
>>>>> -wi).
>>>>>
>>>>> The current Kconfig defaults however will enable LIVEPATCH without DEBUG_INFO
>>>>> on release builds, thus providing a default Kconfig selection that's not
>>>>> suitable for livepatch-build-tools even when LIVEPATCH support is enabled,
>>>>> because it's missing the DWARF debug section.
>>>>>
>>>>> Fix by forcing the selection of DEBUG_INFO from LIVEPATCH.
>>>>>
>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>
>>>> Oops, yes.
>>>>
>>>> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>
>>>> Fixes tag ?
>>>
>>> Was borderline on adding one, but wasn't sure since it's strictly
>>> livepatch-build-tools that requires the DWARF data, but custom made
>>> livepatches (like the examples in tests) do not require such
>>> information.
>>
>> At which point: Is "select" really appropriate then? Wouldn't it be more
>> logical then to change DEBUG_INFO's default to take LIVEPATCH into account
>> (still permitting people to turn debug info off if they know they won't
>> need it)?
> 
> At least right now the only way to build useful livepatches for Xen
> (not dummy tests) is using livepatch-build-tools (that requires DWARF
> sections).  My concern with using the Fixes tag was that I don't know
> whether initially the DWARF info was needed or not, or maybe whether
> people used a different tool rather than livepatch-build-tools.
> 
> I don't mind changing, but I also don't think an hypervisor built with
> LIVEPATCH but without DEBUG_INFO is going to be useful to anyone given
> the requirements of the tools we provide to build livepatches.

Well, okay, especially Andrew looks to be pretty strong about this. I
don't want to stand in the way ...

Jan

