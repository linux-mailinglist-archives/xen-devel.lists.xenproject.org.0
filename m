Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCCDACC0B4
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 09:04:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004035.1383687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMLh0-0006Z1-RH; Tue, 03 Jun 2025 07:04:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004035.1383687; Tue, 03 Jun 2025 07:04:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMLh0-0006Xc-Nw; Tue, 03 Jun 2025 07:04:14 +0000
Received: by outflank-mailman (input) for mailman id 1004035;
 Tue, 03 Jun 2025 07:04:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/YrW=YS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uMLgz-0006XR-3o
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 07:04:13 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2f0a92c-4048-11f0-b894-0df219b8e170;
 Tue, 03 Jun 2025 09:04:10 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a50fc7ac4dso838368f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Jun 2025 00:04:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506bdd06fsm81387255ad.101.2025.06.03.00.04.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jun 2025 00:04:10 -0700 (PDT)
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
X-Inumbo-ID: f2f0a92c-4048-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748934250; x=1749539050; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ORnZR+XmtviWUd4DceF+imR5GCBsuWqg3AXM9xbvPwk=;
        b=E/z0m/+OYkUDlv6MwahqSnqkCFyawzDbM3aorIYRa7pebgkkoK+b2eYbWi5L+H1ArO
         Exy1iXLbW65omaUZLCLag4kQjAJCUKWVUMUJNWPd6u1ch/j64BrzEZY7sA+b8vTdchpZ
         /crLEPCOd7qdJFOQaya0YsbJ8ruXOlw2AcBXF7qyXfLN6Tj5libiM32xkPPQnr56p0L7
         sLdgg3xGHoWLbDc4+6kq2xDTyoPmiRUodXbYFepTz4awcy4u6K559BpuSR1sDqm9LTk8
         8mGfvAPIGb87WE5Sx8cArROh9d0xq4B7JPZxIRPHMpGsSmggBqbmWZ1w/Hqc3uwh8V/b
         8k3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748934250; x=1749539050;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ORnZR+XmtviWUd4DceF+imR5GCBsuWqg3AXM9xbvPwk=;
        b=pcTOFl/TmlplwDo+qE1LceDibsoY0gmex5kkfpZfEjWT3KnAye0UCWYPx3glUKfJPs
         J6KbDXW+lY725GdCr3rWb7VaD5F3LydPM2s7kv0c3IjU81bqXXCqWBHCPlsGAmel4iOY
         ogbrfB2v8GnrqwbJMK00UNIKsCO7Y1Yif06bm8rwMOpZi0Idk7lazXH1UtUrZPIABOrl
         w4xPRwaiviastj+b8XSKA/Lx8EbzTrQvS99p6BWVhIbIKkfhEV6Z8y3tN7Ui+Etw0NB2
         KV40v/p+o+3c7ApIx/qMK5qiKNZyonCAZx2cPbMEBfYdfhH8YbZjFK//YSN283yq20hR
         MdZg==
X-Forwarded-Encrypted: i=1; AJvYcCXJWjvI4zWXn1sdO1++5kyHoM8mlYpQEUBTEuoaxoNn5IiCjHhGFs0PI7FGcxA1n/dJ/7QJsVqnnYE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxI11fmLzo038f379McD/+NxivKtw+sqiEuwQ4YVvp4kfq3jCN7
	8Uc6WCMkoV7lHAzdRY9N5Rl0k3HlcYUpLBwOUgXFkmyRZ93RZuBrD3U/Xjn7/NYBcw==
X-Gm-Gg: ASbGnctsvqzjDgL8DOcxq2NLRsdOUNeBLPZyQZd4yslH8iobNxpXGgufq8VkSKJiuci
	Tm6HGN9CAqXLnxGng7sWpQn5/fXrAAs9h2oOkqnKzWqbAj0jfOujLRUELAYh6NnGjuDTGIHNQZq
	PhIWyIUm5DPNvyMPFcIDT8YUa3iTZI/eIXgOol/j0E2Gz/Tg2qJAYWMv5p477aDAkcsO4ct1Cpl
	hdE4qW2BDXUwC8Myh05YlvEig4b7jRiXQnjGqVtI6vBh9TKtcpRMuAoNMo+EJPm8of++eVwRZii
	0p1snrgU+MjW2sC6v+FtUuxT3ClWEDeJcr3zcOC6IIYIDNL0j4PLrFwbBF8e/BIeSK8xRaidWjQ
	wOJbK4DFCNGyJ2dsTgkrxxaJgK/LnS9zP9lN7byX4RIIpLEI=
X-Google-Smtp-Source: AGHT+IE8pK7zGtL1AJLsB0tbOLPxh5UomnWluJkrrR1rQ1O1WCjrbkYPSeQoGBW/KDKt4b+NOLg7Qw==
X-Received: by 2002:a05:6000:4025:b0:3a3:63d3:369a with SMTP id ffacd0b85a97d-3a4f7a63dfcmr12894877f8f.25.1748934250542;
        Tue, 03 Jun 2025 00:04:10 -0700 (PDT)
Message-ID: <87224eb9-d4a6-4589-8cc2-e222619f8dde@suse.com>
Date: Tue, 3 Jun 2025 09:04:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/19] arm/gnttab: Break cycle between asm/grant_table.h
 and xen/grant_table.h
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
 <20250530120242.39398-8-agarciav@amd.com>
 <5f3de127-70cd-422f-a368-6c23d83c6cf9@suse.com>
 <DAC4BPMR5N3A.3JYN5WXUSRGBG@amd.com>
 <6cc4d172-793b-4d3e-990e-f8fd0d4bbabc@suse.com>
 <DAC723JETPVO.2262JS2GW584S@amd.com>
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
In-Reply-To: <DAC723JETPVO.2262JS2GW584S@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.06.2025 18:39, Alejandro Vallejo wrote:
> On Mon Jun 2, 2025 at 4:51 PM CEST, Jan Beulich wrote:
>> On 02.06.2025 16:30, Alejandro Vallejo wrote:
>>> On Mon Jun 2, 2025 at 9:53 AM CEST, Jan Beulich wrote:
>>>> On 30.05.2025 14:02, Alejandro Vallejo wrote:> --- a/xen/include/xen/grant_table.h
>>>>> +++ b/xen/include/xen/grant_table.h
>>>>> @@ -27,7 +27,7 @@
>>>>>  #include <xen/rwlock.h>
>>>>>  #include <public/grant_table.h>
>>>>>  
>>>>> -#ifdef CONFIG_GRANT_TABLE
>>>>> +#if __has_include("asm/grant_table.h")
>>>>>  #include <asm/grant_table.h>
>>>>>  #endif
>>>>
>>>> This change looks wrong (or otherwise is lacking justification): With GRANT_TABLE=n
>>>> the arch header isn't supposed to be included.
>>>
>>> It's not equivalent to the previous code; but that's a feature, not a bug.
>>>
>>> Not including the header with GRANT_TABLE=n  was the best we could with
>>> the older toolchains in order to not try to include a header that might not
>>> exist. The high number of sequential inclusions of xen/grant_table.h and
>>> asm/grant_table.h seem to attest to that.
>>>
>>> I can ammend the commit message to be clearer, but IMO this is what it was always
>>> meant to be. I can replace the current commit message with:
>>>
>>>   "The previous toolchain base version didn't provide __has_include(), which
>>>    allows conditional inclusion based on a header's existence. Lacking that
>>>    feature the inclusion was guarded by the GRANT_TABLE option being present
>>>    but even then sometimes the arch-specific header is required even when
>>>    the option is not selected. This causes inclusion sites to needlessly
>>>    include both asm/grant_table.h and xen/grant_table.h.
>>>
>>>    Using __has_include() removes this requirement at inclusion sites."
>>>
>>> Thoughts?
>>
>> So why would we include a header we don't need when GRANT_TABLE=n? Overall
>> we're trying to reduce dependency trees rather than growing them further.
> 
> Because we do need it or the code doesn't compile. gnttab_dom0_frames(), for
> instance, exists and is used in unguarded statements.

I fear I don't understand this: Things are building fine right now, aren't
they?

> There's more case like
> that. It may be possible to break those dependencies so the inclusion is
> not always expected, but the reality is that you tend to need the other header
> for pretty much the same class of reasons you needed xen/grant_table.h to begin
> with.
> 
> Forcing the code to include both seems counter-productive to me.

Depends on how frequent the double inclusion is, imo.

Jan

