Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 054E8866AA6
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 08:27:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685264.1065704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reVNp-0005kr-J2; Mon, 26 Feb 2024 07:26:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685264.1065704; Mon, 26 Feb 2024 07:26:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reVNp-0005js-FA; Mon, 26 Feb 2024 07:26:41 +0000
Received: by outflank-mailman (input) for mailman id 685264;
 Mon, 26 Feb 2024 07:26:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1reVNo-0005jR-85
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 07:26:40 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 607b8556-d478-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 08:26:37 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a4348aaa705so71435766b.0
 for <xen-devel@lists.xenproject.org>; Sun, 25 Feb 2024 23:26:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 mj9-20020a170906af8900b00a3e94142018sm2130011ejb.132.2024.02.25.23.26.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Feb 2024 23:26:36 -0800 (PST)
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
X-Inumbo-ID: 607b8556-d478-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708932397; x=1709537197; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cbE0HxKHF5m/mQDiNYWry/QZ2qCtnZ+KpgaeK35W+aE=;
        b=M17zKsfLl6kZiTyvr8yIEA//Q900QLZzGmO/nXzUf6uxA67sFEUghKrPFcWRoKZWOW
         hFheIlpZ0WerOMf52vTgW5QFHEOr1pQxEJlGNY5okvJpH5rWlBHRstG++zZZv0wj2Z5z
         P2WNCsyYfH221Ic4CoD/piDNs+V3OHjMgIAqB3NMIefn0fQwtMxsmgmEjedcPAhELhIA
         YXYWr38BqO6oc8gM+fmOiKNrJmUK6gUtN0/EiWYIDh/WSAXn40VE7K/SFvJ6ZqcyMud2
         vB1LUNorwUh7pjVUhp+rigUU3yAiYyGPNqkGg7FCW7bVVtujV78ZfBrcgxuIvIXGyTZ4
         zR9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708932397; x=1709537197;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cbE0HxKHF5m/mQDiNYWry/QZ2qCtnZ+KpgaeK35W+aE=;
        b=ixl3a40F+wYFgpqEs47Vvo1W+1KH3GFjbqRmEuLvogNTHu/kiwHepCraY+NkiTiaoI
         XYlL2i0pRjz1iDShiFOPscVwSke8XchI9Y2G+l3KnG/KUz5+P2WMurnHjJhsiq5Ktnfr
         wfrT3EN1A6SXwbxpAizN5dsBdlED0YGdyTz348mLqi2Sqjnd2oPWk56vt1DT1lNW3ZX4
         oxZrnZ5UlFhOSBs1lNB8ItLBus8sSWA+HMKeMbJjOHbB3IATpSyFNrgkydF3xdc4DhuA
         NclI6o7iHObWElByC4oiATiQS8XPzAqDYNsQA8vRyyckYVCTVsnsasy/6u6g3zX/qfBr
         5OQw==
X-Forwarded-Encrypted: i=1; AJvYcCVpo6XaA6iObI4L3dJWeRc0nojOfV5kNp3cl4nLQWK1ZG20LBwg87dKZHMNTfauUTHMzXeJTSJ6BvBOqK4uT8nl7Gh9+wjt5Y+Tr1r0p6E=
X-Gm-Message-State: AOJu0YxcsAaXqu9fGRhi5Rlbq6pX51X3KpYmb+6f0iaRuNR8W+0mqKAM
	QrKlTImk3iXDr2EaKjYSj/bBr9J5UxphsDK68F8IndWI0ZD/T/59QSQAWsrEZA==
X-Google-Smtp-Source: AGHT+IF/pZBU9ErNsuF/xnt1bFkVHK+wYsQ4q1ooM5syOa0t1ozLF+y8SNN8p5X2G83i28e1IoecIA==
X-Received: by 2002:a17:906:3659:b0:a3e:da6:85f8 with SMTP id r25-20020a170906365900b00a3e0da685f8mr3976031ejb.30.1708932397082;
        Sun, 25 Feb 2024 23:26:37 -0800 (PST)
Message-ID: <65c33a27-3c8d-4943-8ce7-4fe50ebb45d0@suse.com>
Date: Mon, 26 Feb 2024 08:26:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 25/30] xen/riscv: add minimal stuff to processor.h to
 build full Xen
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <9efbc232f64b6192cf83f865b8987846fe082720.1707146506.git.oleksii.kurochko@gmail.com>
 <6be5102a-624c-463a-9821-c618d110ce7a@suse.com>
 <095b8031eaaa5324cdae9fee75f9521a795feb46.camel@gmail.com>
 <2f1e4d2d-5b33-47ff-912b-c4693744d0e9@suse.com>
 <0bafef389b30251bc9898bb61604aa3efaabe48c.camel@gmail.com>
 <5de8f721-461c-4a0e-a11d-63aa7c93a742@suse.com>
 <6cd4d415ccf2163d9fdf690f29d898d61b077472.camel@gmail.com>
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
In-Reply-To: <6cd4d415ccf2163d9fdf690f29d898d61b077472.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.02.2024 18:00, Oleksii wrote:
> On Mon, 2024-02-19 at 09:06 +0100, Jan Beulich wrote:
>> On 16.02.2024 12:16, Oleksii wrote:
>>> On Thu, 2024-02-15 at 17:43 +0100, Jan Beulich wrote:
>>>> On 15.02.2024 17:38, Oleksii wrote:
>>>>> On Tue, 2024-02-13 at 14:33 +0100, Jan Beulich wrote:
>>>>>> On 05.02.2024 16:32, Oleksii Kurochko wrote:
>>>>>>> +	depends on LLD_VERSION >= 150000 || LD_VERSION >=
>>>>>>> 23600
>>>>>>
>>>>>> What's the linker dependency here? Depending on the answer I
>>>>>> might
>>>>>> further
>>>>>> ask why "TOOLCHAIN" when elsewhere we use CC_HAS_ or HAS_CC_
>>>>>> or
>>>>>> HAS_AS_.
>>>>> I missed to introduce {L}LLD_VERSION config. It should output
>>>>> from
>>>>> the
>>>>> command:
>>>>>   riscv64-linux-gnu-ld --version
>>>>
>>>> Doesn't answer my question though where the linker version
>>>> matters
>>>> here.
>>> Then I misinterpreted your initial question.
>>> Could you please provide further clarification or rephrase it for
>>> better understanding?
>>>
>>> Probably, your question was about why linker dependency is needed
>>> here,
>>> then
>>> it is not sufficient to check if a toolchain supports a particular 
>>> extension without checking if the linker supports that extension   
>>> too.
>>> For example, Clang 15 supports Zihintpause but GNU bintutils
>>> 2.35.2 does not, leading build errors like so:
>>>     
>>>    riscv64-linux-gnu-ld: -march=rv64i_zihintpause2p0: Invalid or
>>>    unknown z ISA extension: 'zihintpause'
>>
>> Hmm, that's certainly "interesting" behavior of the RISC-V linker.
>> Yet
>> isn't the linker capability expected to be tied to that of gas? I
>> would
>> find it far more natural if a gas dependency existed here. If such a
>> connection cannot be taken for granted, I'm pretty sure you'd need to
>> probe both then anyway.
> 
> Wouldn't it be enough in this case instead of introducing of new
> configs and etc, just to do the following:
>    +ifeq ($(CONFIG_RISCV_64),y)
>    +has_zihintpause = $(call as-insn,$(CC) -mabi=lp64 -
>    march=rv64i_zihintpause, "pause",_zihintpause,)
>    +else
>    +has_zihintpause = $(call as-insn,$(CC) -mabi=ilp32 -
>    march=rv32i_zihintpause, "pause",_zihintpause,)
>    +endif
>    +
>     riscv-march-$(CONFIG_RISCV_ISA_RV64G) := rv64g
>     riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
>    -riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE) := $(riscv-march-
>    y)_zihintpause
>     
>     # Note that -mcmodel=medany is used so that Xen can be mapped
>     # into the upper half _or_ the lower half of the address space.
>     # -mcmodel=medlow would force Xen into the lower half.
>     
>    -CFLAGS += -march=$(riscv-march-y) -mstrict-align -mcmodel=medany
>    +CFLAGS += -march=$(riscv-march-y)$(has_zihintpause) -mstrict-align
>    -
>    mcmodel=medany

Yes, this is kind of what I'd expect.

> Probably, it would be better:
>    ...
>    +CFLAGS += -march=$(riscv-march-y)$(call or,$(has_zihintpause)) -
>    mstrict-align -
>    mcmodel=medany

Why the use of "or"? IOW right now I don't see what's "better" here.

Jan

