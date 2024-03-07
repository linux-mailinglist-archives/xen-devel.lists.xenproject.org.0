Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB61874D16
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 12:11:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689772.1075061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riBeT-0000Cj-Nj; Thu, 07 Mar 2024 11:11:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689772.1075061; Thu, 07 Mar 2024 11:11:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riBeT-0000AL-Ju; Thu, 07 Mar 2024 11:11:05 +0000
Received: by outflank-mailman (input) for mailman id 689772;
 Thu, 07 Mar 2024 11:11:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tO0P=KN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1riBeS-0000AF-6V
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 11:11:04 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62c34146-dc73-11ee-afda-a90da7624cb6;
 Thu, 07 Mar 2024 12:11:03 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a44e3176120so109193366b.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 03:11:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 lf12-20020a170906ae4c00b00a3f27031d7bsm8043800ejb.104.2024.03.07.03.11.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Mar 2024 03:11:02 -0800 (PST)
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
X-Inumbo-ID: 62c34146-dc73-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709809863; x=1710414663; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=71RSYLN/uz8qSBo9Kp7W+3dnHLjJGaoFokT6rdz7n5I=;
        b=QawMHwTrKwh6rTvcl8EaeaoZpgPSGH90emaNgMgASByC6bsi7daGDS/TIGRo8uWG4B
         BEltUQbNj9uFQNxETzfSGXUEDRe/WfYujhDyLfC94X39H/3hDYTGyS2qP/uYTuZf0zwo
         TXM2Cq2/cKjCZ7TCioHUGBt5rME9nkuzM6ax0LtgZ2ayeqYDpxwSkhOX0QXQ071N1K/V
         8pDVO/DaWZS5VN35BykT8UiWGhiZSa+c6/BNXwnchL5JYivZIFOOp/cacsBidU0HfTDE
         DGS9ZxDmpZFy7RFWNP4+IMBEey/wev8QaJzakgL0lHy8mMY5gMXTkTs1H/EK7d5fgEw5
         4WBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709809863; x=1710414663;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71RSYLN/uz8qSBo9Kp7W+3dnHLjJGaoFokT6rdz7n5I=;
        b=lQqQiXzkcflV4EoqZ0gO5Y4gO4rvK4MUGcqjB++Doi4wVH2bqaHEnLJZmqVihFhQ65
         6NTTmRuB4Z37GlbQ47wh9gwQAtNvrzMEuQSyaH7Dfk4wtwRMbMdDUmre/jbJ+EPWO1TK
         dTQ/VyZpdGrgfdOtV1ZrTStGdikSidYTVbUE4qtrHKym0SbvZznoO8ZnCwJ820TiXYOV
         gz6knwyYc9qhWI2oEEsZnA2uGpAzoYM+35G2NJrKb1G5Z+MLATx6p9k2IGf/FNUqbVpg
         pnurbgBIJPDrUg54J0Dw1RMMsNFQcaZvImoEk/b5G8+onWptsbK5aCs6Q7V/bej3XGfB
         JpLw==
X-Forwarded-Encrypted: i=1; AJvYcCWm3uqBIgEAmNRtBG51jQ2+tkAHfAWmg9hKXm5n45gIYYWJXcjrbn2gBPRPdnmJc9BpAX5c7h07CDO0rSJ3yMaAFLGSexQsCPmy2j6hHLU=
X-Gm-Message-State: AOJu0Yxs6lOo5rPMsZug3n/JYVAP+pTvMS6NO3Ye7ALsY3r8/K4QGsIn
	bQiUFfyP1rE4z67avyQmrZRVhs/OOWHWP8/lutvQPq1fOL2a11YR7mzJ2I2JVg==
X-Google-Smtp-Source: AGHT+IGc3YZK783YKajrmC3jm/u8JX2JHCTGRbhD7F9PPtvGG9IKrfNCO0cSygh8el9/MOXqQjry3A==
X-Received: by 2002:a17:906:d9d9:b0:a44:eab2:a57 with SMTP id qk25-20020a170906d9d900b00a44eab20a57mr10489727ejb.45.1709809862548;
        Thu, 07 Mar 2024 03:11:02 -0800 (PST)
Message-ID: <8ef64462-d810-4be1-923f-973de340cda2@suse.com>
Date: Thu, 7 Mar 2024 12:11:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/23] xen/riscv: introduce cmpxchg.h
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
 <ce7604de39b3480553eeaeafc11138494016983f.1708962629.git.oleksii.kurochko@gmail.com>
 <23ff1c20-91f3-4c60-9562-7f1cd57c1043@suse.com>
 <f6e16589bfbcd94d6f62c34f080cbcd3406eca6f.camel@gmail.com>
 <dd45b338-7b43-442d-85cd-307b3d228d87@suse.com>
 <af6e59c7abd930bb356ba399fa890a7a541c2aae.camel@gmail.com>
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
In-Reply-To: <af6e59c7abd930bb356ba399fa890a7a541c2aae.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.03.2024 12:01, Oleksii wrote:
> On Thu, 2024-03-07 at 11:46 +0100, Jan Beulich wrote:
>> On 07.03.2024 11:35, Oleksii wrote:
>>> On Wed, 2024-03-06 at 15:56 +0100, Jan Beulich wrote:
>>>> On 26.02.2024 18:38, Oleksii Kurochko wrote:
>>>>> The header was taken from Linux kernl 6.4.0-rc1.
>>>>>
>>>>> Addionally, were updated:
>>>>> * add emulation of {cmp}xchg for 1/2 byte types using 32-bit
>>>>> atomic
>>>>>   access.
>>>>> * replace tabs with spaces
>>>>> * replace __* variale with *__
>>>>> * introduce generic version of xchg_* and cmpxchg_*.
>>>>>
>>>>> Implementation of 4- and 8-byte cases were left as it is done
>>>>> in
>>>>> Linux kernel as according to the RISC-V spec:
>>>>> ```
>>>>> Table A.5 ( only part of the table was copied here )
>>>>>
>>>>> Linux Construct       RVWMO Mapping
>>>>> atomic <op> relaxed    amo<op>.{w|d}
>>>>> atomic <op> acquire    amo<op>.{w|d}.aq
>>>>> atomic <op> release    amo<op>.{w|d}.rl
>>>>> atomic <op>            amo<op>.{w|d}.aqrl
>>>>>
>>>>> Linux Construct       RVWMO LR/SC Mapping
>>>>> atomic <op> relaxed    loop: lr.{w|d}; <op>; sc.{w|d}; bnez
>>>>> loop
>>>>> atomic <op> acquire    loop: lr.{w|d}.aq; <op>; sc.{w|d}; bnez
>>>>> loop
>>>>> atomic <op> release    loop: lr.{w|d}; <op>; sc.{w|d}.aqrl∗ ;
>>>>> bnez
>>>>> loop OR
>>>>>                        fence.tso; loop: lr.{w|d}; <op>;
>>>>> sc.{w|d}∗ ;
>>>>> bnez loop
>>>>> atomic <op>            loop: lr.{w|d}.aq; <op>; sc.{w|d}.aqrl;
>>>>> bnez
>>>>> loop

Note the load and store forms mentioned here. How would ...

>>>>> The Linux mappings for release operations may seem stronger
>>>>> than
>>>>> necessary,
>>>>> but these mappings are needed to cover some cases in which
>>>>> Linux
>>>>> requires
>>>>> stronger orderings than the more intuitive mappings would
>>>>> provide.
>>>>> In particular, as of the time this text is being written, Linux
>>>>> is
>>>>> actively
>>>>> debating whether to require load-load, load-store, and store-
>>>>> store
>>>>> orderings
>>>>> between accesses in one critical section and accesses in a
>>>>> subsequent critical
>>>>> section in the same hart and protected by the same
>>>>> synchronization
>>>>> object.
>>>>> Not all combinations of FENCE RW,W/FENCE R,RW mappings with
>>>>> aq/rl
>>>>> mappings
>>>>> combine to provide such orderings.
>>>>> There are a few ways around this problem, including:
>>>>> 1. Always use FENCE RW,W/FENCE R,RW, and never use aq/rl. This
>>>>> suffices
>>>>>    but is undesirable, as it defeats the purpose of the aq/rl
>>>>> modifiers.
>>>>> 2. Always use aq/rl, and never use FENCE RW,W/FENCE R,RW. This
>>>>> does
>>>>> not
>>>>>    currently work due to the lack of load and store opcodes
>>>>> with aq
>>>>> and rl
>>>>>    modifiers.
>>>>
>>>> As before I don't understand this point. Can you give an example
>>>> of
>>>> what
>>>> sort of opcode / instruction is missing?
>>> If I understand the spec correctly then l{b|h|w|d} and s{b|h|w|d}
>>> instructions don't have aq or rl annotation.
>>
>> How would load insns other that LR and store insns other than SC come
>> into play here?
> 
> This part of the spec. is not only about LR and SC which cover Load-
> Exclusive and Store-Exclusive cases, but also about non-Exclusive cases
> for each l{b|h|w|d} and s{b|h|w|d} are used.

... the spec (obviously covering other forms, too) be relevant when
reasoning whether just suffixes or actual barrier insns need using?

Jan

