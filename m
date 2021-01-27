Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBD330595C
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 12:15:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76018.137033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4inG-0001AB-GV; Wed, 27 Jan 2021 11:15:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76018.137033; Wed, 27 Jan 2021 11:15:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4inG-00019m-D4; Wed, 27 Jan 2021 11:15:26 +0000
Received: by outflank-mailman (input) for mailman id 76018;
 Wed, 27 Jan 2021 11:15:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kelV=G6=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l4inE-00019h-MR
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 11:15:24 +0000
Received: from mail-lf1-x135.google.com (unknown [2a00:1450:4864:20::135])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e684ef57-bd0f-4640-999b-2c895b7ea8ca;
 Wed, 27 Jan 2021 11:15:23 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id q8so2078589lfm.10
 for <xen-devel@lists.xenproject.org>; Wed, 27 Jan 2021 03:15:23 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id i204sm421216lfd.120.2021.01.27.03.15.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 03:15:18 -0800 (PST)
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
X-Inumbo-ID: e684ef57-bd0f-4640-999b-2c895b7ea8ca
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=LrgpldSgc6Xuaws76Zp7ZMsBCnDuI4flIBMGwyLl1cE=;
        b=PfxgUvQ+VAK4pbFVXfE4Vgc4pt2Qe2fmzJVfU3KbRW2epkSui3jovhEuRkoo2CGcdP
         rZdD3YsmCM8xQkgg/lCAvxEZ8VBbsLy0AQVI9peomvSWPxWAH2gTI5LasqMcMlWwIVIA
         cDdOSt5OMwcOcjJDEvyX14cPxjrdEmt5RgjElswOOUGXbEkNF1S6FPVaM9jVGrBL9tm+
         MxXOWcS0MEYlWIVnKECGAcRCTUp0YQ9KoYJjBnumM2rOXf6wo0/ZKiYtn9bCCewHFYCI
         pu7y1gSJfkkBqetVZNfFbS9Ph9WFJrUphFGOrlK2I6jowVQsPQRMqSp726rrCA3uGQHM
         eIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=LrgpldSgc6Xuaws76Zp7ZMsBCnDuI4flIBMGwyLl1cE=;
        b=VTkldaT2uOcqQaWqoiokInk4ErkJHX9pldQgynZYs6tDtcJh3Tk0LPPuQLe8RNxvxq
         nb85lhQUlVRIbRIM3y+FORn3moOkdNi2UBXcSEvcvFgXVw610c/gAZz04yeYVADTv3m7
         Etrm7D6fA8AmwZxAwP/XgLw8jmAIU3RCfKLxbSjgVPT/DfKCAfyhvD5mKQzq0U20Mlub
         jzyv2Vh4NuI8st55wpBiYTTF7sLaLRNCYaZM3MCPxe0pZ1a0KR/gRJ4Gf9SuooyyT1oa
         wMHh/EbInc5vKVd75HdiBLAYHLUYY7rq9gXdUfw+i385fAU1zWvjxZ80a257IOdQajyt
         ZdHg==
X-Gm-Message-State: AOAM5315L3cldicG7Zm+Gnc+Kw4sbqA/P0ntzPe0ju1t9cMhDCDgNH+x
	oX63SIK8MWeftZucdaeryrM=
X-Google-Smtp-Source: ABdhPJxZCq4eLchpguswyil/jF2NvGv7N32mjBU513OTKBcXOkGva0+A/bnPaESRBiiSHa5k2H6rmg==
X-Received: by 2002:a19:504b:: with SMTP id z11mr4949391lfj.26.1611746122488;
        Wed, 27 Jan 2021 03:15:22 -0800 (PST)
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
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <4e7c5fe5-ca2e-d96e-aaa6-2691cc6634d2@gmail.com>
Date: Wed, 27 Jan 2021 13:15:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6c5b6c07-8efa-be88-3885-a7c55d4ec400@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 27.01.21 12:51, Jan Beulich wrote:

Hi Jan

> On 27.01.2021 11:13, Oleksandr wrote:
>> On 26.01.21 02:14, Oleksandr wrote:
>>> On 26.01.21 01:20, Julien Grall wrote:
>>>> On Mon, 25 Jan 2021 at 20:56, Stefano Stabellini
>>>> <sstabellini@kernel.org> wrote:
>>>>> This seems to be an arm randconfig failure:
>>>>>
>>>>> https://gitlab.com/xen-project/patchew/xen/-/pipelines/246632953
>>>>> https://gitlab.com/xen-project/patchew/xen/-/jobs/985455044
>>>> Thanks! The error is:
>>>>
>>>> #'target_mem_ref' not supported by expression#'memory.c: In function
> Btw, I found the first part of this line pretty confusing, to a
> degree that when seeing it initially I thought this must be some
> odd tool producing the odd error. But perhaps this is just
> unfortunate output ordering from different tools running in
> parallel.
>
>>>> 'do_memory_op':
>>>> memory.c:1210:18: error:  may be used uninitialized in this function
>>>> [-Werror=maybe-uninitialized]
>>>>    1210 |             rc = set_foreign_p2m_entry(currd, d, gfn_list[i],
>>>>         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>    1211 | _mfn(mfn_list[i]));
>>>>         | ~~~~~~~~~~~~~~~~~~
>>>>
>>>> I found a few references online of the error message, but it is not
>>>> clear what it means. From a quick look at Oleksandr's branch, I also
>>>> can't spot anything unitialized. Any ideas?
>>> It seems that error happens if *both* CONFIG_GRANT_TABLE and
>>> CONFIG_IOREQ_SERVER are disabled. Looks like that mfn_list is
>>> initialized either in acquire_grant_table() or in acquire_ioreq_server().
>>> If these options disabled then corresponding helpers are just stubs,
>>> so indeed that mfn_list gets uninitialized. But, I am not sure why gcc
>>> complains about it as set_foreign_p2m_entry() is *not* going to be
>>> called in that case???
>> This weird build error goes away if I simply add:
>>
>> diff --git a/xen/common/memory.c b/xen/common/memory.c
>> index 33296e6..d1bd57b 100644
>> --- a/xen/common/memory.c
>> +++ b/xen/common/memory.c
>> @@ -1136,7 +1136,7 @@ static int acquire_resource(
>>         * moment since they are small, but if they need to grow in future
>>         * use-cases then per-CPU arrays or heap allocations may be required.
>>         */
>> -    xen_pfn_t mfn_list[32];
>> +    xen_pfn_t mfn_list[32] = {0};
>>        int rc;
>>
>>        if ( !arch_acquire_resource_check(currd) )
>>
>>
>> Shall I make the corresponding patch?
> I'd prefer if we could find another solution, avoiding this
> pointless writing of 256 bytes of zeros (and really to be on the
> safe side I think it should rather be ~0 that gets put in there).
> Could you check whether clearing the array along the lines of
> this
>
>      default:
>          memset(mfn_list, ~0, sizeof(mfn_list));
>          rc = -EOPNOTSUPP;
>          break;
>
> helps (avoiding the writes in all normal cases)?

Yes, this helps (at least in my environment):

aarch64-poky-linux-gcc v8.2


> Of course this
> wouldn't be a guarantee that another compiler (version) won't
> warn yet again. But the only other alternative I can think of
> without having the writes on the common path would be something
> along the lines of older Linux'es uninitialized_var(). Maybe
> someone else has a better idea ...
>
>> But it is still unclear to me why the compiler doesn't recognize that
>> *non-yet-uninitialized* mfn_list[] won't be used if both
>> CONFIG_GRANT_TABLE and CONFIG_IOREQ_SERVER are not set...
> The combination of conditions may be too complex for it to
> figure. I suppose a warning like this can't be had without at
> least one of false positives or false negatives.

I got it.

-- 
Regards,

Oleksandr Tyshchenko


