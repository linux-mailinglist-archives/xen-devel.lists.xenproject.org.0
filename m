Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2DF83884F
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 08:53:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670273.1042919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSBb1-00083M-8Y; Tue, 23 Jan 2024 07:53:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670273.1042919; Tue, 23 Jan 2024 07:53:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSBb1-00080G-5l; Tue, 23 Jan 2024 07:53:23 +0000
Received: by outflank-mailman (input) for mailman id 670273;
 Tue, 23 Jan 2024 07:53:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9pmr=JB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSBaz-000808-L8
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 07:53:21 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79dd899b-b9c4-11ee-98f4-6d05b1d4d9a1;
 Tue, 23 Jan 2024 08:53:20 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2cf12a9be5bso3744091fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jan 2024 23:53:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 3-20020a056e0220c300b00361bc7aa20bsm2109638ilq.11.2024.01.22.23.53.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jan 2024 23:53:19 -0800 (PST)
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
X-Inumbo-ID: 79dd899b-b9c4-11ee-98f4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705996400; x=1706601200; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cLsRTpIUOlBKq1lGMPDxP726lbbRJPfyITbW3xnmpBQ=;
        b=IXqTfxpbmeB6z60rqNwhg6qyeCc3NVSGN+rOPtS1rQwGIdTlg9BCKDEZJsjQ3jMtLH
         V1iWEIB2DWId0EH4ONXxckrLgU/LxiHBKbLU5UT07dkP/dxoFfPg/WHTeI9OBgluSZWP
         UsQdGX3lcFcedppC+3zYEBdNQcYNcLY2RUDjutEzpSPnbvgpka6avmnIYA4L/HAsSSfV
         7z0i1erPqgAZXv2j6xOYs7ak6qsQMSn2tJyv0e7UAPkFOTtU/gmLjI4h80k1WlWkK0+x
         Y8rqNjiPizZPFOUUaon6NyAz4HnEOlx+u9n7HLSGL5glqUJ2LhajJbrns1fI438RzmaA
         SLBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705996400; x=1706601200;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cLsRTpIUOlBKq1lGMPDxP726lbbRJPfyITbW3xnmpBQ=;
        b=t4Sh6RvTb2unnst75vQwoprS64LnF8UHbjeTZi51jRU3AzpdeklJwd5gGb6q2//3RJ
         oFWVFFwD3djZvP/NnPVkehdZAbGmTonHnIlXeS2pIr56sy4bxotrx/oVYmRFBDdSphfy
         BWzBv0Gm31V2AiyBPEt2XbOZXyBtXC1MHmFisoo7NXi/gmtKGWlzDeHUCFf/YcQdL8Hj
         v6WJoWov1600AWJFhFO5p4LVVUM4aihthUp2VXQnlUIAfhyfv4TdojFJEtL8PZs3ez2k
         wmTyCOk4UImCd+nsiG5VI22CmH7I4cugJHXZDwSdeNfAA/LtmMT28p7tNm1ie3guGrsJ
         v0XQ==
X-Gm-Message-State: AOJu0YwDYuXw1q52iMfkZC0OJfpBZg/34FNReGs+l0f4MVAI4zq/8XzE
	y94NsH2FKf3/faVKQ8TARu9wKLcsU5pX8s2BtsABZv0xBmV+pxwItxa3Zncr/Q==
X-Google-Smtp-Source: AGHT+IFRQMFyakGYQktiparn9y5c8qG0L2LfEc+8NlwlpfAauLi25EOCPORCtNPMk9Gu38SOxIbxYw==
X-Received: by 2002:a2e:9813:0:b0:2cc:eefc:20af with SMTP id a19-20020a2e9813000000b002cceefc20afmr2072154ljj.52.1705996399985;
        Mon, 22 Jan 2024 23:53:19 -0800 (PST)
Message-ID: <ab34df2d-ba47-46c0-a0f2-9c051f640906@suse.com>
Date: Tue, 23 Jan 2024 08:53:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] x86/livepatch: align functions to ensure minimal
 distance between entry points
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20240122110244.14091-1-roger.pau@citrix.com>
 <013210fd-6ea3-4719-afcd-1da97d9cd17f@suse.com> <Za6laZtVdQtFP4F5@macbook>
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
In-Reply-To: <Za6laZtVdQtFP4F5@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.01.2024 18:27, Roger Pau Monné wrote:
> On Mon, Jan 22, 2024 at 12:21:47PM +0100, Jan Beulich wrote:
>> On 22.01.2024 12:02, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/xen.lds.S
>>> +++ b/xen/arch/x86/xen.lds.S
>>> @@ -99,6 +99,10 @@ SECTIONS
>>>         *(.text)
>>>  #ifdef CONFIG_CC_SPLIT_SECTIONS
>>>         *(.text.*)
>>> +#endif
>>> +#ifdef CONFIG_FUNCTION_ALIGNMENT
>>> +       /* Ensure enough distance with the next placed section. */
>>> +       . = ALIGN(CONFIG_FUNCTION_ALIGNMENT);
>>>  #endif
>>>         *(.text.__x86_indirect_thunk_*)
>>
>> I continue to fail to see how an alignment directive can guarantee minimum
>> distance. In the worst case such a directive inserts nothing at all.
> 
> I'm confused, you did provide a RB for this in v4:
> 
> https://lore.kernel.org/xen-devel/4cad003f-dda0-4e22-a770-5a5ff56f4d35@suse.com/
> 
> Which is basically the same code with a few comments and wording
> adjustments.

Hmm, yes. I think the aspect above was raised before, but then (perhaps)
kind of addressed. (I'm puzzled then too: Why did you drop the R-b, when
nothing substantially changed?) Yet re-reading the description, there's
nothing said to this effect. Specifically ...

>> IOW
>> at the very least there's a non-spelled-out assumption here about the last
>> item in the earlier section having suitable alignment and thus, if small
>> in size, being suitably padded.
> 
> Please bear with me, but I'm afraid I don't understand your concerns.
> 
> For livepatch build tools (which is the only consumer of such
> alignments) we already have the requirement that a function in order
> to be suitable for being live patched must reside in it's own
> section.
> 
> We do want to aim for functions (even assembly ones) to live in their
> own sections in order to be live patched, and to be properly aligned.
> However it's also fine for functions to use a different (smaller)
> alignment, the livepatch build tools will detect this and use the
> alignment reported.

... I don't think this and ...

> While we want to get to a point where everything that we care to patch
> lives in it's own section, and is properly padded to ensure minimal
> required space, I don't see why the proposed approach here should be
> blocked, as it's a step in the right direction of achieving the
> goal.
> 
> Granted, there's still assembly code that won't be suitably padded,
> but the livepatch build tools won't assume it to be padded.

... this is being pointed out. Which I think is relevant to make
explicit not the least because the build tools aren't part of the main
Xen tree. Plus many (like me) may not be overly familiar with how they
work.

>  After
> your series to enable assembly annotations we can also make sure the
> assembly annotated functions live in separate sections and are
> suitably aligned.
> 
>> Personally I don't think merely spelling
>> out such a requirement would help - it would end up being a trap for
>> someone to fall into.
> 
>> I'm further curious why .text.__x86_indirect_thunk_* is left past the
>> inserted alignment. While pretty unlikely, isn't it in principle possible
>> for the thunks there to also need patching? Aren't we instead requiring
>> then that assembly functions (and thunks) all be suitably aligned as well?
> 
> Those are defined in assembly, so requires CONFIG_FUNCTION_ALIGNMENT
> to also be applied to the function entry points in assembly files.

I see. Yet the question then remains: Why is the alignment not inserted
after them? Or will the insertion need to move later on (which would feel
odd)?

Jan

