Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E049D1524
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2024 17:14:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839408.1255211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD4O2-0006Cd-LF; Mon, 18 Nov 2024 16:14:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839408.1255211; Mon, 18 Nov 2024 16:14:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD4O2-0006A5-I2; Mon, 18 Nov 2024 16:14:02 +0000
Received: by outflank-mailman (input) for mailman id 839408;
 Mon, 18 Nov 2024 16:14:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JUlN=SN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tD4O0-00069x-KX
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 16:14:00 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b2bda27-a5c8-11ef-a0c8-8be0dac302b0;
 Mon, 18 Nov 2024 17:13:54 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-53b13ea6b78so3301218e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Nov 2024 08:13:54 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e045390sm554763966b.154.2024.11.18.08.13.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Nov 2024 08:13:52 -0800 (PST)
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
X-Inumbo-ID: 1b2bda27-a5c8-11ef-a0c8-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzYiLCJoZWxvIjoibWFpbC1sZjEteDEzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjFiMmJkYTI3LWE1YzgtMTFlZi1hMGM4LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxOTQ2NDM0LjA0NTE3Miwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731946433; x=1732551233; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uARw5fWHik/lbApAuGvnX3PHPijkBYHAANTsSpe8eL4=;
        b=SY+ClnCse6bIVIJkL7K+t4GZlNklzqvWhJS+vsAh8n1hNcSnjNdq65KJAOGsRLL4sZ
         dchMQZ/8yYLROYYn7UpP5Uo8rl1rZYSrmVI8QNvp/73pJF39aTW6Do7tT2kuyCQGhrh+
         K7JAETn2wNqYO1QPhSgTgru0krm2Vxg5ZPiLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731946433; x=1732551233;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uARw5fWHik/lbApAuGvnX3PHPijkBYHAANTsSpe8eL4=;
        b=J9XLdkYejNbeFQh14uxa7zrZ+jb6sBPc8EGlW0fnLAY9Tg4zi9T98L1jgsRmvdwyBD
         yN+StrcTMKNhFZMbhF3+wmk9zOPrVch9FI+Gu5cA7JI4vbHDz69qwfV5homI3kFSp3KQ
         dNAI9MuNKJpeHQ7Au+t+D+Shc7pdFuNGWMV6LOKDcqTvpXEECF7whN46y3OYeASfJPjX
         46MreJWutFeEPC0VCnGgYPZmJSVSgUrXZrs4WoD1deXYZXaJQoR/REl2A3wX+3mMl/Ct
         RRqKMi62gs2eZws8NxwXXEJebpVCrMtG+9g74mcqqQ6cwajmgytSZmLG9mFt178kP2ZG
         TXsw==
X-Forwarded-Encrypted: i=1; AJvYcCXNioTIYtG9NcMxo3glwOFO+f7IGUw3XPVqJOuu47q7SxdXL13UGkGpVHoakRLkvcTG+whxBZndqNA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwK0Bm+vpY+1D5DJJce3QfccZ6KZHQKZkFZHTQv6RaSpqIeLNEs
	xk0CxpXBFtYATOkxDwK7RtIBcY75Y2tsLxII+SxDFuiwuFr3K7sm129VwI6vO/c=
X-Google-Smtp-Source: AGHT+IGwvUHkzkIVXJz06OA1cVxczNGRys+FeOqKsFZlT1TMQOPU+mSyRpoRXr5mPfzXNOfCgWHGmA==
X-Received: by 2002:a05:6512:32c9:b0:52e:fa5f:b6a7 with SMTP id 2adb3069b0e04-53dab29e907mr7258997e87.13.1731946433374;
        Mon, 18 Nov 2024 08:13:53 -0800 (PST)
Message-ID: <d8747b61-9517-4584-9395-86818b372a46@citrix.com>
Date: Mon, 18 Nov 2024 16:13:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/6] x86/boot: introduce module release
To: Jason Andryuk <jason.andryuk@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241115131204.32135-1-dpsmith@apertussolutions.com>
 <20241115131204.32135-3-dpsmith@apertussolutions.com>
 <374d2387-6f8c-4a2b-a979-7066675dd247@amd.com>
 <3f61cc43-c29a-40e0-ac40-4f273fd4461e@apertussolutions.com>
 <f3aee76b-7ac1-4558-a036-c2c19c5b9154@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f3aee76b-7ac1-4558-a036-c2c19c5b9154@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/11/2024 5:18 pm, Jason Andryuk wrote:
> On 2024-11-15 12:16, Daniel P. Smith wrote:
>> On 11/15/24 11:50, Jason Andryuk wrote:
>>> On 2024-11-15 08:12, Daniel P. Smith wrote:
>>>>       /* Set up start info area. */
>>>>       si = (start_info_t *)vstartinfo_start;
>>>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>>>> index 495e90a7e132..0bda1326a485 100644
>>>> --- a/xen/arch/x86/setup.c
>>>> +++ b/xen/arch/x86/setup.c
>>>
>>>> +void __init free_boot_modules(void)
>>>>   {
>>>>       struct boot_info *bi = &xen_boot_info;
>>>>       unsigned int i;
>>>>       for ( i = 0; i < bi->nr_modules; ++i )
>>>>       {
>>>> -        uint64_t start = pfn_to_paddr(bi->mods[i].mod->mod_start);
>>>> -        uint64_t size  = bi->mods[i].mod->mod_end;
>>>> -
>>>> -        /*
>>>> -         * Sometimes the initrd is mapped, rather than copied,
>>>> into dom0.
>>>> -         * Size being 0 is how we're instructed to leave the
>>>> module alone.
>>>> -         */
>>>> -        if ( size == 0 )
>>>> +        if ( bi->mods[i].released )
>>>>               continue;
>>>> -        init_domheap_pages(start, start + PAGE_ALIGN(size));
>>>> +        release_boot_module(&bi->mods[i]);
>>>>       }
>>>> -
>>>> -    bi->nr_modules = 0;
>>>
>>> IIUC, zero-ing here was a safety feature to ensure boot modules
>>> could not be used after this point.  Should it be retained?
>>
>> The released flag displaced the need for this, but I realized it
>> would make it stronger if in bootstrap_map_bm() we add a check that
>> the released flag is not set before mapping. I think this is a
>> stronger approach without loosing information like the number of boot
>> modules were passed.
>
> Andrew> Clobbering this prevents the loop constructs from working.
>
> I thought the boot modules are unusable after free_boot_modules() is
> called, so I'm not clear on the utility of keeping the boot modules
> around and/or keeping the loop constructs working.  I wondered about,
> but didn't write, clearing the boot_module info in
> release_boot_module() to eliminate stale data hanging around.

Metadata about which module is which is potentially still interesting.

Either way, clobbering nr_modules was to make discard_initial_images()
idempotent, and the released flag is a better way of doing this now.

>
> Yes, a bootstrap_map_bm() check is a good idea.  Having said that,
> there is a lack of checking the return value of bootstrap_map_bm(), so
> would you panic?

This is a long-standing issue.

The only way to fail is prior to the directmap being set up and the sum
of bootstrap_map_*()'s since the last unmap() exceeding ~1G.

Some callers check, others don't.  Really there wants to be uniform
handling (probably a backtrace from the innermost layer), and callers
able to handle NULL.

But, e.g. with microcode handling, only being able to map the first 2M
or 4M of a 2G initrd would still be useful.  Then again, if we can't map
the initrd, then later parts of boot are still going to go wrong.


Either way - this patch is an improvement.  Other improvements can come
later.

~Andrew

