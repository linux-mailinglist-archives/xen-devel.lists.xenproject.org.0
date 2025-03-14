Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 173C8A60A6D
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 08:53:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913858.1319722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tszqd-0002OZ-1y; Fri, 14 Mar 2025 07:52:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913858.1319722; Fri, 14 Mar 2025 07:52:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tszqc-0002Ls-Tt; Fri, 14 Mar 2025 07:52:50 +0000
Received: by outflank-mailman (input) for mailman id 913858;
 Fri, 14 Mar 2025 07:52:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tszqb-0002Lm-0n
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 07:52:49 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51b3697f-00a9-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 08:52:47 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso12070325e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 00:52:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1ffb62c1sm8733825e9.4.2025.03.14.00.52.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 00:52:45 -0700 (PDT)
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
X-Inumbo-ID: 51b3697f-00a9-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741938766; x=1742543566; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RxFYc2WR46xcU5k0WDMyRk2dWYxjJzpH3Nfh6b3bdrY=;
        b=InAKknFVWwjB2qvazotMAXgPRGYgNSVxcx2NBMhZLKCjvk5GjoAHqtS4kEFAN9Kk9J
         I6Yx3jPbiII9gxHyvIGGpNveT5mIkXWAJ6bSWQQ3saeIG+OiqbYqKHqtlGbZE46HtSS7
         x7bbcEi2sDXcTWAMsw7EpdgHsf58KRxHxFNismOGDvrg5QJ228mtQghACMu3v1KcQQuF
         PkAfSRLu2KNJjXtfkSrZpPeYPTL5Cfn04UVKkFsepUGz4vbGKpXhcRa6sOoZjbcczYTd
         Ao3179/YYKtiWtPDpm1sX4fOIlOMiuTiKJ4TB86aMgwuKOY6dGsqGSJuJE/dMY/5LK+d
         dgAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741938766; x=1742543566;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxFYc2WR46xcU5k0WDMyRk2dWYxjJzpH3Nfh6b3bdrY=;
        b=lSndF/RzrBvSX6GcnME3AAZrW2trThzu2krKCFN0VWvIXjgRO3G+UkU+nadKXZuM3n
         DAWaWGMkIuKpazo+NCayTj1N5MFoKBIfE25XD+O3JJs8/0kr9E2738puaCPzUaoS4rhC
         /l/kvedIEkTuNSf22sNgT/l11wEYXXB5WDp0pMMMYamjKC/wHi5qh/aZV9oxq7mwoCmu
         7OvWFqltQJp8GvKxaILsSKWlxeH9BXQLMh74pf7EzfihUMdKaaQdmn5p+hB3T17aXTRl
         g/5OuFtPPUsKOcNBPfcOS0KCPpQ6IpCqUnWGaWXmxv8+ctA6eBSDmZsifo+x0c0FKENu
         oxZw==
X-Forwarded-Encrypted: i=1; AJvYcCXxwCum/K+RMPXDquCfSuMw7bykI2yISJA4RncbnjmuJarz5QwucLrkLuyMwSgY5ErYfMua5hyG7Pc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyNVu/b+hs09cHU1fUPHnoQ2i57zfcUvXeBTNBTRctoPGSpcght
	BI5FjNSnUNrvmO1hKH0W9KrPx6vR09lzh5QMymeLyiijEEF+kq3hAg8JSRerfQ==
X-Gm-Gg: ASbGncv/5/41N5wNFnfYQwFSnUeidfOj7Y39QhQV79lWKWQFc3OXIkPh8XSD2QoeYGE
	5vLw5GVy14eI4gEtgghUrwOgpNz3fMu0A5dEqCTZvF3dchbFRb0O1AdHqqprnBBN84g/+nf0oOB
	H9pL+yMhNnwJkGxIHpBONuu2OcniSogIWtVM1VcnuHMY+mW+OPHBKAnLpgb50+AyZsbCyc7ZW7V
	wc2eKWozB0NLjpeC5M3dVAWxUTHMWuVfVXzqDLXWoyNL73M1zpJtGU+e2g44Vk49VFBpOkRd9G8
	gQGEUcThcS9FI76koEkH0TVp3TvczsF1ctYAimkWFD9FlqQ6zQ5Q63p2aOoABKCwbpJOiPCa/q6
	WUdop9PrQWm9i4a9h5D8uu+Vbt+0r4Q==
X-Google-Smtp-Source: AGHT+IEItZYugDlkpSgcHePfOYVm99OewHlQa6xaDxYnFs6yBFq0YyUSYIyh0txIv59mpVPW3wHNpA==
X-Received: by 2002:a05:600c:3ba6:b0:43c:eea9:f45d with SMTP id 5b1f17b1804b1-43d1eccbba1mr18824835e9.18.1741938766317;
        Fri, 14 Mar 2025 00:52:46 -0700 (PDT)
Message-ID: <5d090922-4d3e-4b9c-9d0f-e6b2ab310f18@suse.com>
Date: Fri, 14 Mar 2025 08:52:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] symbols: arrange to know where functions end
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <58b3d7dc-5966-432c-8def-e841feaee1c8@suse.com>
 <51f2cd39-e92f-4745-8053-e51ada22d601@suse.com>
 <aace0fab-ce3f-4b9f-87c7-2daafd8442ba@citrix.com>
 <9bf90547-43de-416e-b064-b54c0e79fc93@suse.com>
 <ea40ec3a-2f6d-42b5-8e98-ab5f4db5d4b4@citrix.com>
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
In-Reply-To: <ea40ec3a-2f6d-42b5-8e98-ab5f4db5d4b4@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.03.2025 18:13, Andrew Cooper wrote:
> On 13/03/2025 4:48 pm, Jan Beulich wrote:
>> On 13.03.2025 17:39, Andrew Cooper wrote:
>>> On 13/03/2025 1:54 pm, Jan Beulich wrote:
>>>> When determining the symbol for a given address (e.g. for the %pS
>>>> logging format specifier), so far the size of a symbol (function) was
>>>> assumed to be everything until the next symbol. There may be gaps
>>>> though, which would better be recognizable in output (often suggesting
>>>> something odd is going on).
>>> Do you have an example %pS for this new case?
>> I haven't encountered one yet, and I wasn't particularly trying to
>> make up one.
>>
>>>> Insert "fake" end symbols in the address table, accompanied by zero-
>>>> length type/name entries (to keep lookup reasonably close to how it
>>>> was).
>>>>
>>>> Note however that this, with present GNU binutils, won't work for
>>>> xen.efi: The linker loses function sizes (they're not part of a normal
>>>> symbol table entry), and hence nm has no way of reporting them.
>>> By "present GNU binutils", does this mean that you've got a fix in mind
>>> (or in progress), or that it's an open problem to be solved?
>> The latter; I can't even tell yet whether this is legitimate to be
>> arranged for in a PE executable's symbol table.
> 
> In which case, I'd suggest using the phrase "open problem" to make it
> clear that there's no fix.

I'd like to leave it as is; right here it's not overly important what
state the binutils side is. Furthermore, by the time this goes in the
binutils side may have changed state already (e.g. from "open problem" to
"fix in progress").

>>>> Older GNU ld retains section symbols, which nm then also lists. Should
>>>> we perhaps strip those as we read in nm's output? They don't provide any
>>>> useful extra information, as our linker scripts add section start
>>>> symbols anyway. (For the purposes here, luckily such section symbols are
>>>> at least emitted without size.)
>>> Will symbols_lookup() ever produce these?  If not, it might be better to
>>> ignore the problem.
>>>
>>> Taking extra logic to work around a benign issue in older toolchains
>>> isn't necessarily ideal.
>> Afaict it's unpredictable from Xen's pov. All depends on the order of
>> entries after we sorted the table by address. The only criteria the
>> tool's compare_value() applies for multiple symbols at the same address
>> is to prefer global over local. As long as the first symbol in a section
>> is global, we wouldn't see section symbols as lookup result.
> 
> Hmm, thinking about it, the global-ness does cause problems.
> 
> e.g. we get _stextentry()+x rather than restore_all_guest()+x, and RAG
> is more likely than some to show up in a backtrace.
> 
> So maybe we should strip section symbols, even the explicit linker ones,
> from the symbol table.

So one thing we could do is to prefer FUNC/OBJECT symbols over NOTYPE
ones, and only use global-ness as a last resort criteria.

But "prefer" != "strip" in any event.

Stripping section symbols is reasonably easy for ELF, as rather than
being NOTYPE they have no type at all. Stripping section start symbols,
otoh, can only be done by name, and hence we'd need to maintain a list
of them in the symbols tool. Not overly nice, but doable of course.

An intrusive - to the symbol table - alternative may be to simply strip
all NOTYPE symbols. Yet that would take as a prereq marking quite a few
more as FUNC or OBJECT.

>  I can't offhand think of a case where we want to
> look up a symbol by address and get back a section name.

We also need to keep in mind the opposite (lookup by name) for livepatch.
I for one have no idea how (un)likely it might be for there to be a need
to lookup a section symbol (then we'd be in trouble with newer binutils)
or a section start symbol.

> (Feel free to leave this as a todo.  I wasn't intending to scope creep
> like this, but it would be a nice to have.)

If we can agree on what behavior we want, I can see about adding further
patches to the series.

Jan

