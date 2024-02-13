Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20954852A30
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 08:38:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679764.1057439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZnMo-0007p0-GY; Tue, 13 Feb 2024 07:38:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679764.1057439; Tue, 13 Feb 2024 07:38:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZnMo-0007m8-DP; Tue, 13 Feb 2024 07:38:10 +0000
Received: by outflank-mailman (input) for mailman id 679764;
 Tue, 13 Feb 2024 07:38:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W/Jz=JW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZnMn-0007m2-Ai
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 07:38:09 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d494857d-ca42-11ee-8a4d-1f161083a0e0;
 Tue, 13 Feb 2024 08:38:08 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-337d05b8942so3357945f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 23:38:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bt25-20020a056000081900b0033b792ed609sm6602714wrb.91.2024.02.12.23.38.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 23:38:07 -0800 (PST)
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
X-Inumbo-ID: d494857d-ca42-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707809887; x=1708414687; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g2TUnxqUFEUuds5VoosuLXLTLztNDPp3bX3riYGqOcU=;
        b=UIVn8kEqWVMUUwQ9tAT2zyZobITnbsym+pqVwf8MWrD/Vyt489CCVLheJLTdQPklaP
         TApozAVn6tAHmqLkRLJu3In9Ok5f3qv0vQi7W7YQe6gew2H+MB5wMDfKLKuZwYc9lHZQ
         KASaRtKVZ1Ya/kLjpCy04gXe+a++3AwJTYkg/rhD5U2+XYfa1quAiyVGmVnO1a3JLBDn
         8jQFQk8K6vcrB7FVf3DpfU4o3BGUt4ibTGUIPoKwv7AwknBJVuXmZH+5ibmLDtEv6OoC
         0kkUfrcPCix1n07LdOfJgHYtV4F1uinnpDFIfvdF/uQNxqGRqUJfXqt5RDwmrRa5bXR3
         a59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707809887; x=1708414687;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g2TUnxqUFEUuds5VoosuLXLTLztNDPp3bX3riYGqOcU=;
        b=pEAUQaEVz6nb9bTaGX/snxEW4z64dz+4wT+72+d4m5/ILIbzKGbsZvzYMeIjSq5MY4
         0t0f9t1NVWHjTOG18+dMro9nwODHxMkz1liPy0UTGdxE9To/RjQoUevfxrr7KozcLvq9
         EwdHWyOhCCCfUpz9zIHIKOGI87YtRo/NBRhDiiG6iWvL049IiCb4qzZYRPrknL7qQZ/v
         WZnc2KUPN9m9cZz7p8mHxIIPG3dyQQzdJg8mSqfofas4AfmZrHjrLVuv2AJ5DVk1eulS
         lqOvXUsHOhWJws2aAFMLyJk9PBIuluPlXhVb3BEG7yl6XAVG9FrSqxAob2bIujOf8aBh
         KFQg==
X-Gm-Message-State: AOJu0Yy8XNeGyUMxlwrUj93sBikVJmjCuCK1VojR2Hd2QSw6IkwhfAOX
	5EFMxDJjPtLEyyCRnftGRSiVsep0SpHB6ZZdfta/XJS+6BBaTBs7+1q6exAjOQ==
X-Google-Smtp-Source: AGHT+IFVmCk/GcVZ1U5c6YbSrUVLcj5Me8xy5p8vSQCPar7Dm48mdRqUMDtFPSVxXpCJZluTWtHsWQ==
X-Received: by 2002:adf:e68a:0:b0:33b:433d:e1d7 with SMTP id r10-20020adfe68a000000b0033b433de1d7mr6639764wrm.1.1707809887381;
        Mon, 12 Feb 2024 23:38:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVVzJVHDs1sbXPfI79/DDojUlFZPHXEugtMnUi5pwNgHTUHFCWQp6fVVDkmeX0L2+lWo4n3WP1pLk0B7QbdDk4J3RMlf/zFB9lGVdCHNWbJdl55WdbggEmpJPeY4WzWL4hGjp4QCnWBAVMiTTOiGgFut0K6KvXShuA8g1FQLlyJYdH9aC3ewBaPv0P3x+Qk2ez7W4Jm+//8Gt4n/s8hdz7Bz2Bgtdjl/hrhltiDxRyevoM0Mrew5YENCZv9IE6+EPwnv0ZkutXatal9t5Kqxy2AiiD0Gjs9QSxr+V9gGv6E5/nJxcs=
Message-ID: <d7295c43-c415-4113-8d9c-e6e3d688763e@suse.com>
Date: Tue, 13 Feb 2024 08:38:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] docs/misra/rules.rst: catch up with accepted rules
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org,
 bertrand.marquis@arm.com, roger.pau@citrix.com, roberto.bagnara@bugseng.com,
 federico.serafini@bugseng.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2402091653110.1925432@ubuntu-linux-20-04-desktop>
 <9504e77d-6f52-489c-a91a-f4d1a6ce9a33@suse.com>
 <alpine.DEB.2.22.394.2402121512050.1925432@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2402121512050.1925432@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.02.2024 00:18, Stefano Stabellini wrote:
> On Mon, 12 Feb 2024, Jan Beulich wrote:
>> On 10.02.2024 02:00, Stefano Stabellini wrote:
>>> Update docs/misra/rules.rst to reflect the MISRA C rules accepted in the
>>> last couple of months.
>>>
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>> ---
>>>
>>> In the notes section I added some info about the deviations, but in any
>>> case the appropriate info will also be added to deviations.rst,
>>> safe.json, etc.
>>>
>>> I also added Rule 14.4, which is older, but when I first tried to add it
>>> to rules.rst, Jan had a question I couldn't reply clearly:
>>> https://marc.info/?l=xen-devel&m=169828285627163
>>>
>>> I think now with this series, the impact of Rule 14.4 is clearer:
>>> https://marc.info/?l=xen-devel&m=170194257326186
>>
>> This series is about enums only afaics. Yet the rule is much wider, and iirc
>> we had agreed that for integer and pointer types the normal language
>> conversion to boolean meaning is fine as well. Not only do you not mention
>> this case in the entry,
> 
> I can add a note about it.
> 
> 
>> but it also continue to mean that effectively we
>> limit the rule to a very narrow case. Which continue to leave open the
>> question of whether the rule is worthwhile to accept in the first place.
> 
> When someone does a safety certification, there is a difference between
> deviating a rule as a whole or accepting the rule and only deviating
> certain aspects of it (simply ignoring the rule is typically not an
> option in safety certification context.) So here I think it would help
> downstreams interested in safety if we added the rule, with specific
> deviations.

Yet then in other cases you refer to Bertrand's general statement of it
not being helpful when too little of a rule is left by deviating.

> Do you have any comments on the other parts of this patch? If not, I
> would be happy to resent the rest unmodified, and update only 14.4 in
> its own separate patch where we can discuss further.

Well. We're in territory now where I'm not really happy anymore with the
full scope of what is being added to the "accepted" list. Leaving 14.4
aside, what you have in the patch all looks like what was agreed upon,
but then I'm not taking notes during meetings, and hence I can't help
the impression that e.g. for 5.5 there was more than just the one
"permitted" pattern. Therefore, while I deliberately didn't comment
there (for not having a concrete case in mind), I'm afraid I also don't
feel anymore like acking such multi-rule patches. If you strictly went
one by one, it is certainly possible that I might ack this and that.

As attempted to voice several times during the meetings, I pretty
strongly disagree with many of the "developer confusion" aspects, when
they take away options the language quite obviously and naturally
provides. We're talking about hypervisor code here, not some random
tool that was thrown together in a haste. At the risk of sounding
arrogant, people being easily confused by what I'd call normal code
should simply not touch code like this. Whereas the spirit of many of
these rules looks to rather go in the direction that basically anyone
knowing a little bit of C should be qualified enough to maintain code
made subject to all of these rules.

I'm sorry, Jan

