Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7169305FFD
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 16:46:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76182.137354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4n1D-0003GP-Vo; Wed, 27 Jan 2021 15:46:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76182.137354; Wed, 27 Jan 2021 15:46:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4n1D-0003G0-SE; Wed, 27 Jan 2021 15:46:07 +0000
Received: by outflank-mailman (input) for mailman id 76182;
 Wed, 27 Jan 2021 15:46:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Shlr=G6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4n1B-0003Fl-T0
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 15:46:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e58617e6-bfb8-4f55-a665-f2ba97d0d8fe;
 Wed, 27 Jan 2021 15:46:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A2D3FADE0;
 Wed, 27 Jan 2021 15:46:03 +0000 (UTC)
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
X-Inumbo-ID: e58617e6-bfb8-4f55-a665-f2ba97d0d8fe
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611762363; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=39aSvY7hJ4Az86GjExjFG9zsbNd13iDeARbISkitfh4=;
	b=dGtWOYQ2YC03mv201PY3KB1Lhf6dWPPE2raR1/l7OtmCkm7p0/kq82Qg9WgTdYrsHP79Q8
	NkcBmbzwoHM7sahQJH5X2OZ9h4dJ0RsGPlAmni317R0aYfqwdONhXB/TQ0XhdMSMcN1tMW
	ajJxCoso2Pvhs5Imk5m5JpmumkMzpl4=
Subject: Re: [PATCH V5 00/22] IOREQ feature (+ virtio-mmio) on Arm
To: Julien Grall <julien@xen.org>, Oleksandr <olekstysh@gmail.com>
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
 <5343d245-3dea-fb4e-147e-cfa7b9b0c227@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c18ac657-b7aa-332e-1517-3edce27c0bd8@suse.com>
Date: Wed, 27 Jan 2021 16:46:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <5343d245-3dea-fb4e-147e-cfa7b9b0c227@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 27.01.2021 16:29, Julien Grall wrote:
> 
> 
> On 27/01/2021 10:51, Jan Beulich wrote:
>> On 27.01.2021 11:13, Oleksandr wrote:
>>> On 26.01.21 02:14, Oleksandr wrote:
>>>> On 26.01.21 01:20, Julien Grall wrote:
>>>>> On Mon, 25 Jan 2021 at 20:56, Stefano Stabellini
>>>>> <sstabellini@kernel.org> wrote:
>>>>>> This seems to be an arm randconfig failure:
>>>>>>
>>>>>> https://gitlab.com/xen-project/patchew/xen/-/pipelines/246632953
>>>>>> https://gitlab.com/xen-project/patchew/xen/-/jobs/985455044
>>>>> Thanks! The error is:
>>>>>
>>>>> #'target_mem_ref' not supported by expression#'memory.c: In function
>>
>> Btw, I found the first part of this line pretty confusing, to a
>> degree that when seeing it initially I thought this must be some
>> odd tool producing the odd error. But perhaps this is just
>> unfortunate output ordering from different tools running in
>> parallel.
> 
> This message is actually coming from GCC. There are quite a few reports 
> online.
> 
> Although, I am not sure whether this was intended.
> 
>>
>>>>> 'do_memory_op':
>>>>> memory.c:1210:18: error:  may be used uninitialized in this function
>>>>> [-Werror=maybe-uninitialized]
>>>>>    1210 |             rc = set_foreign_p2m_entry(currd, d, gfn_list[i],
>>>>>         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>>    1211 | _mfn(mfn_list[i]));
>>>>>         | ~~~~~~~~~~~~~~~~~~
>>>>>
>>>>> I found a few references online of the error message, but it is not
>>>>> clear what it means. From a quick look at Oleksandr's branch, I also
>>>>> can't spot anything unitialized. Any ideas?
>>>> It seems that error happens if *both* CONFIG_GRANT_TABLE and
>>>> CONFIG_IOREQ_SERVER are disabled. Looks like that mfn_list is
>>>> initialized either in acquire_grant_table() or in acquire_ioreq_server().
>>>> If these options disabled then corresponding helpers are just stubs,
>>>> so indeed that mfn_list gets uninitialized. But, I am not sure why gcc
>>>> complains about it as set_foreign_p2m_entry() is *not* going to be
>>>> called in that case???
>>>
>>> This weird build error goes away if I simply add:
>>>
>>> diff --git a/xen/common/memory.c b/xen/common/memory.c
>>> index 33296e6..d1bd57b 100644
>>> --- a/xen/common/memory.c
>>> +++ b/xen/common/memory.c
>>> @@ -1136,7 +1136,7 @@ static int acquire_resource(
>>>         * moment since they are small, but if they need to grow in future
>>>         * use-cases then per-CPU arrays or heap allocations may be required.
>>>         */
>>> -    xen_pfn_t mfn_list[32];
>>> +    xen_pfn_t mfn_list[32] = {0};
>>>        int rc;
>>>
>>>        if ( !arch_acquire_resource_check(currd) )
>>>
>>>
>>> Shall I make the corresponding patch?
>>
>> I'd prefer if we could find another solution, avoiding this
>> pointless writing of 256 bytes of zeros (and really to be on the
>> safe side I think it should rather be ~0 that gets put in there).
>> Could you check whether clearing the array along the lines of
>> this
>>
>>      default:
>>          memset(mfn_list, ~0, sizeof(mfn_list));
>>          rc = -EOPNOTSUPP;
>>          break;
>>
>> helps (avoiding the writes in all normal cases)? Of course this
>> wouldn't be a guarantee that another compiler (version) won't
>> warn yet again. But the only other alternative I can think of
>> without having the writes on the common path would be something
>> along the lines of older Linux'es uninitialized_var(). Maybe
>> someone else has a better idea ...
> 
> So GCC is complaining specifically about mfn_list[0]. For instance, I 
> wrote the following:
> 
> diff --git a/xen/common/memory.c b/xen/common/memory.c
> index 33296e65cb04..81b4645047e7 100644
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1139,6 +1139,8 @@ static int acquire_resource(
>       xen_pfn_t mfn_list[32];
>       int rc;
> 
> +    mfn_list[0] = 0;
> +
>       if ( !arch_acquire_resource_check(currd) )
>           return -EACCES;
> 
> It will silence GCC. But the follwing will not:
> 
> diff --git a/xen/common/memory.c b/xen/common/memory.c
> index 33296e65cb04..cf558a6b9fa4 100644
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1139,6 +1139,8 @@ static int acquire_resource(
>       xen_pfn_t mfn_list[32];
>       int rc;
> 
> +    mfn_list[1] = 0;
> +
>       if ( !arch_acquire_resource_check(currd) )
>           return -EACCES;

Interesting.

> I also try to set mfn_list[0] to 0 in different part of the switch. It 
> doesn't help, if I add it in the default. But it does, if I put in the 
> grant table path.

Even more interesting. All pretty odd, so yes, ...

> So it looks like the grant table path is the issue.
> 
> I can confirm that your solution will silenece GCC, but I am a bit worry 
> that this may only hide a different bug because the failure seems to be 
> widespread on arm (gitlab reported the error with GCC 9.2.1 and I have 
> managed to reproduced on GCC 7.5.0).
> 
> Given this is a randconfig where CONFIG_GRANT_TABLE is disabled (we 
> technically don't grant table disabled), I would rather take a bit more 
> time to understand the problem rather than rushing it.

... this would certainly be fine with me.

Jan

