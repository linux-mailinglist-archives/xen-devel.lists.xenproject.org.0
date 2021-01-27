Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F25773059B6
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 12:29:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76040.137081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4j0l-0002fo-Jn; Wed, 27 Jan 2021 11:29:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76040.137081; Wed, 27 Jan 2021 11:29:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4j0l-0002fP-G9; Wed, 27 Jan 2021 11:29:23 +0000
Received: by outflank-mailman (input) for mailman id 76040;
 Wed, 27 Jan 2021 11:29:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kelV=G6=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l4j0j-0002fK-MU
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 11:29:21 +0000
Received: from mail-lf1-x12e.google.com (unknown [2a00:1450:4864:20::12e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id db78f185-fce4-4ff6-8bb5-cbefa4806c14;
 Wed, 27 Jan 2021 11:29:20 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id q12so2118660lfo.12
 for <xen-devel@lists.xenproject.org>; Wed, 27 Jan 2021 03:29:20 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id r1sm420363lfp.306.2021.01.27.03.29.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 03:29:17 -0800 (PST)
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
X-Inumbo-ID: db78f185-fce4-4ff6-8bb5-cbefa4806c14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=FHiKQSmtiGAiAsMxPEjtFM/0RlStzddmMYAyNpxIyLI=;
        b=mrqYzPnV1dJ6LcpIXzwNziFa5X2PIKtiq4cuDEnmEibwup235LLwf7jZPc1E9Ow7Os
         oBb4qV1iSFax17OKqFfaqjEGgexXz/1J2f37k5+SdxNkyHO0jWeaQcfhlXyIuwkg8BbG
         HIm0yNhtGvAAv+9V9+t5NYho14dIr2FmuvMHoDffYbG/Xe1Ylq5d3kEBqaVh8nkMPcY+
         g86qMGjrQJ2JCAxFvNql6IZhzbHH+i2X6EDBaJpOZdqFsILC5IxOd2uTxDijo+6PQUR0
         lGhhdQfG0TzENUcqwgTxnBYPP8h+8GFDuAFwyuNCnEWOdFZ6KbrDZMlqXP0DJmmk66+2
         FscQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=FHiKQSmtiGAiAsMxPEjtFM/0RlStzddmMYAyNpxIyLI=;
        b=XtiAD0e+AJbtfR2oDv8oCdCDMEA4U//4vhnX2sGPvtQLLVAkeYTXNOC0/siyPZuKoz
         8Xlck8c2seU6ulXdtF+3O0hBUjPn5lglRoZeFkDv2xJUjRe0kkx8ar8L50faS0JF+eC4
         4VNffq+wyqXN0X6gu5GlRwh283KMSaUN0AMcnC2gBTpWPtO7jsQIgHGfiXfG+6vVYhZT
         kG1yfjjI6iVEUidr7B2pNmE/TFjsyEog98Prxd1OMky4UUlnbNHCuR412g/5ecWjIl3x
         O0OZSCSYckggDJnoMyBtfSrGKcc2Nm6YpH/hHtf7FDFQNeqpe25Uxfn6NKXTmLAk3A/9
         POow==
X-Gm-Message-State: AOAM530Gi5PZnjMOyOq9t+GcQ8ME8ZqS7vKC0V83qFFi2aLnWpS2Q/R8
	yabYRZgvx4x82NINXO3IVAc=
X-Google-Smtp-Source: ABdhPJxWMXQ/K43r7OV+kWIgsvMSWS8pL2MPbb0Dh+cHjV/B5zPCEP1mQhDfPcsqJe0qD2xsvy2IEA==
X-Received: by 2002:a19:6447:: with SMTP id b7mr4735747lfj.206.1611746959544;
        Wed, 27 Jan 2021 03:29:19 -0800 (PST)
Subject: Re: [PATCH V5 00/22] IOREQ feature (+ virtio-mmio) on Arm
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, famzheng@amazon.com,
 Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien.grall.oss@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <161160798888.13183.15031685460985886988@c667a6b167f6>
 <alpine.DEB.2.21.2101251255430.20638@sstabellini-ThinkPad-T480s>
 <CAJ=z9a2YpESuHGfZXoRTGj5mxhwar37Na3eYkX90QffYKf1r1Q@mail.gmail.com>
 <a277d66a-0bb4-22ea-badb-c3f415a5d09f@gmail.com>
 <e305357a-2c2c-7e48-7cdf-9bce97db6b4c@gmail.com>
 <6c5b6c07-8efa-be88-3885-a7c55d4ec400@suse.com>
 <4e7c5fe5-ca2e-d96e-aaa6-2691cc6634d2@gmail.com>
 <46bfa4de-f069-9fa9-995e-242a228f984c@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <ba8dc0c5-8ebc-2a7d-2864-941653cc7091@gmail.com>
Date: Wed, 27 Jan 2021 13:29:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <46bfa4de-f069-9fa9-995e-242a228f984c@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 27.01.21 13:22, Jan Beulich wrote:

Hi Jan

> On 27.01.2021 12:15, Oleksandr wrote:
>> On 27.01.21 12:51, Jan Beulich wrote:
>>> On 27.01.2021 11:13, Oleksandr wrote:
>>>> On 26.01.21 02:14, Oleksandr wrote:
>>>>> On 26.01.21 01:20, Julien Grall wrote:
>>>>>> On Mon, 25 Jan 2021 at 20:56, Stefano Stabellini
>>>>>> <sstabellini@kernel.org> wrote:
>>>>>>> This seems to be an arm randconfig failure:
>>>>>>>
>>>>>>> https://gitlab.com/xen-project/patchew/xen/-/pipelines/246632953
>>>>>>> https://gitlab.com/xen-project/patchew/xen/-/jobs/985455044
>>>>>> Thanks! The error is:
>>>>>>
>>>>>> #'target_mem_ref' not supported by expression#'memory.c: In function
>>> Btw, I found the first part of this line pretty confusing, to a
>>> degree that when seeing it initially I thought this must be some
>>> odd tool producing the odd error. But perhaps this is just
>>> unfortunate output ordering from different tools running in
>>> parallel.
>>>
>>>>>> 'do_memory_op':
>>>>>> memory.c:1210:18: error:  may be used uninitialized in this function
>>>>>> [-Werror=maybe-uninitialized]
>>>>>>     1210 |             rc = set_foreign_p2m_entry(currd, d, gfn_list[i],
>>>>>>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>>>     1211 | _mfn(mfn_list[i]));
>>>>>>          | ~~~~~~~~~~~~~~~~~~
>>>>>>
>>>>>> I found a few references online of the error message, but it is not
>>>>>> clear what it means. From a quick look at Oleksandr's branch, I also
>>>>>> can't spot anything unitialized. Any ideas?
>>>>> It seems that error happens if *both* CONFIG_GRANT_TABLE and
>>>>> CONFIG_IOREQ_SERVER are disabled. Looks like that mfn_list is
>>>>> initialized either in acquire_grant_table() or in acquire_ioreq_server().
>>>>> If these options disabled then corresponding helpers are just stubs,
>>>>> so indeed that mfn_list gets uninitialized. But, I am not sure why gcc
>>>>> complains about it as set_foreign_p2m_entry() is *not* going to be
>>>>> called in that case???
>>>> This weird build error goes away if I simply add:
>>>>
>>>> diff --git a/xen/common/memory.c b/xen/common/memory.c
>>>> index 33296e6..d1bd57b 100644
>>>> --- a/xen/common/memory.c
>>>> +++ b/xen/common/memory.c
>>>> @@ -1136,7 +1136,7 @@ static int acquire_resource(
>>>>          * moment since they are small, but if they need to grow in future
>>>>          * use-cases then per-CPU arrays or heap allocations may be required.
>>>>          */
>>>> -    xen_pfn_t mfn_list[32];
>>>> +    xen_pfn_t mfn_list[32] = {0};
>>>>         int rc;
>>>>
>>>>         if ( !arch_acquire_resource_check(currd) )
>>>>
>>>>
>>>> Shall I make the corresponding patch?
>>> I'd prefer if we could find another solution, avoiding this
>>> pointless writing of 256 bytes of zeros (and really to be on the
>>> safe side I think it should rather be ~0 that gets put in there).
>>> Could you check whether clearing the array along the lines of
>>> this
>>>
>>>       default:
>>>           memset(mfn_list, ~0, sizeof(mfn_list));
>>>           rc = -EOPNOTSUPP;
>>>           break;
>>>
>>> helps (avoiding the writes in all normal cases)?
>> Yes, this helps (at least in my environment):
>>
>> aarch64-poky-linux-gcc v8.2
> Good. I'd be okay if you folded this in (plus a comment of
> course), but others may have different views, not the least as
> this is only papering over the issue (yet an issue that's not
> ours, but the compiler's).

Great, I will wait a bit and if there are no objections I will fold this 
in.

-- 
Regards,

Oleksandr Tyshchenko


