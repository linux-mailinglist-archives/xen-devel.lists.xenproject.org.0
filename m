Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A9C24B56F
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 12:24:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8hjd-0003db-0X; Thu, 20 Aug 2020 10:23:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bq9Y=B6=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k8hjc-0003dW-99
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 10:23:52 +0000
X-Inumbo-ID: 5235a61d-8ce6-4e71-841e-89a7017bcce9
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5235a61d-8ce6-4e71-841e-89a7017bcce9;
 Thu, 20 Aug 2020 10:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=MRGWLTJcBlr13Gj4N7F2Tg5kQZCTcLK7Q7nQ06xGok4=; b=xIA8kbgpAzyk/9BVudf3IZ3UkC
 e2zyf1OorD24FQ+ChzgwDUhKoZ0SEbavnmyZLVgEpQX/mRig40Z4VYOc1SIJ4rwouACg3U9Q6DtpN
 6mGmqpTVblc2v7Fm/Cv9s+Mom3Og8veySJAVOEsIz4aNJYahSczM6MOYkwDx3cI63j/A=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k8hjY-0000A4-Nv; Thu, 20 Aug 2020 10:23:48 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k8hjY-0007IH-8e; Thu, 20 Aug 2020 10:23:48 +0000
Subject: Re: [PATCH v2] xen/arm: Convert runstate address during hypcall
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4647a019c7b42d40d3c2f5b0a3685954bea7f982.1595948219.git.bertrand.marquis@arm.com>
 <8d2d7f03-450c-d50c-630b-8608c6d42bb9@suse.com>
 <FCAB700B-4617-4323-BE1E-B80DDA1806C1@arm.com>
 <1b046f2c-05c8-9276-a91e-fd55ec098bed@suse.com>
 <alpine.DEB.2.21.2007291356060.1767@sstabellini-ThinkPad-T480s>
 <1a8bbcc7-9d0c-9669-db7b-e837af279027@suse.com>
 <73c8ade5-36a3-cc13-80b6-bda89e175cbb@xen.org>
 <6066b507-f956-8e7a-89f3-b21428b66d65@suse.com>
 <E39531EE-0265-4387-813D-22A57CD3F67B@arm.com>
 <alpine.DEB.2.21.2007310935350.1767@sstabellini-ThinkPad-T480s>
 <3230CBBC-0C63-44DA-A767-14977890547C@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3aa2958a-fec7-8a37-bf49-961b34141d9c@xen.org>
Date: Thu, 20 Aug 2020 11:23:45 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <3230CBBC-0C63-44DA-A767-14977890547C@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

Sorry for the late answer.

On 14/08/2020 10:25, Bertrand Marquis wrote:
> 
> 
>> On 1 Aug 2020, at 00:03, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>
>> On Fri, 31 Jul 2020, Bertrand Marquis wrote:
>>>> On 31 Jul 2020, at 12:18, Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 31.07.2020 12:12, Julien Grall wrote:
>>>>> On 31/07/2020 07:39, Jan Beulich wrote:
>>>>>> We're fixing other issues without breaking the ABI. Where's the
>>>>>> problem of backporting the kernel side change (which I anticipate
>>>>>> to not be overly involved)?
>>>>> This means you can't take advantage of the runstage on existing Linux
>>>>> without any modification.
>>>>>
>>>>>> If the plan remains to be to make an ABI breaking change,
>>>>>
>>>>> For a theoritical PoV, this is a ABI breakage. However, I fail to see
>>>>> how the restrictions added would affect OSes at least on Arm.
>>>>
>>>> "OSes" covering what? Just Linux?
>>>>
>>>>> In particular, you can't change the VA -> PA on Arm without going
>>>>> through an invalid mapping. So I wouldn't expect this to happen for the
>>>>> runstate.
>>>>>
>>>>> The only part that *may* be an issue is if the guest is registering the
>>>>> runstate with an initially invalid VA. Although, I have yet to see that
>>>>> in practice. Maybe you know?
>>>>
>>>> I'm unaware of any such use, but this means close to nothing.
>>>>
>>>>>> then I
>>>>>> think this will need an explicit vote.
>>>>>
>>>>> I was under the impression that the two Arm maintainers (Stefano and I)
>>>>> already agreed with the approach here. Therefore, given the ABI breakage
>>>>> is only affecting Arm, why would we need a vote?
>>>>
>>>> The problem here is of conceptual nature: You're planning to
>>>> make the behavior of a common hypercall diverge between
>>>> architectures, and in a retroactive fashion. Imo that's nothing
>>>> we should do even for new hypercalls, if _at all_ avoidable. If
>>>> we allow this here, we'll have a precedent that people later
>>>> may (and based on my experience will, sooner or later) reference,
>>>> to get their own change justified.
>>
>> Please let's avoid "slippery slope" arguments
>> (https://en.wikipedia.org/wiki/Slippery_slope)
>>
>> We shouldn't consider this instance as the first in a long series of bad
>> decisions on hypercall compatibility. Each new case, if there will be
>> any, will have to be considered based on its own merits. Also, let's
>> keep in mind that there have been no other cases in the last 8 years. (I
>> would like to repeat my support for hypercall ABI compatibility.)
>>
>>
>> I would also kindly ask not to put the discussion on a "conceptual"
>> level: there is no way to fix all guests and also keep compatibility.
>>  From a conceptual point of view, it is already game over :-)
>>
>>
>>> After a discussion with Jan, he is proposing to have a guest config setting to
>>> turn on or off the translation of the address during the hypercall and add a
>>> global Xen command line parameter to set the global default behaviour.
>>> With this was done on arm could be done on x86 and the current behaviour
>>> would be kept by default but possible to modify by configuration.
>>>
>>> @Jan: please correct me if i said something wrong
>>> @others: what is your view on this solution ?
>>
>> Having options to turn on or off the new behavior could be good-to-have
>> if we find a guest that actually requires the old behavior. Today we
>> don't know of any such cases. We have strong reasons to believe that
>> there aren't any on ARM (see Julien's explanation in regards to the
>> temporary invalid mappings.) In fact, it is one of the factors that led
>> us to think this patch is the right approach.
>>
>> That said, I am also OK with adding such a parameter now, but we need to
>> choose the default value carefully.

I agree with that :).

> 
> This would also mean keeping support in the code for old and new behaviour
> which might make the code bigger and more complex.

I am concerned with that as well. However, this concern is also going to 
be true if we introduce an hypercall using a physical address as 
parameter. Indeed, the old hypercall will not go away.

If we introduce a second hypercall, you will also have to think about 
the interactions between the two. For instance:
     - The firmware may register the runstate using the old hypercall, 
while the OS may register using the new hypercall.
     - Can an OS use a mix of the two hypercalls?

For more details, you can have a look at the original attempt for a new 
hypercall (see [1]).

The approach you discussed with Jan has the advantage to not require any 
change in the guest software stack. So this would be my preference over 
a new hypercall.

>>
>>
>> We need the new behavior as default on ARM because we need the fix to
>> work for all guests. I don't think we want to explain how you always
>> need to set config_foobar otherwise things don't work. It has to work
>> out of the box.
>>
>> It would be nice if we had the same default on x86 too, although I
>> understand if Jan and Andrew don't want to make the same change on x86,
>> at least initially.
> 
> So you mean here adding a parameter but only on Arm ?
> Should it be a command line parameter ? a configuration parameter ? both ?
> 
> It seems that with this patch i touched some kind of sensible area.
> Should i just abandon it and see later to work on adding a new hypercall using
> a physical address as parameter ?

I would suggest to mention the thread in the next community call.

Cheers,

[1] <1558721577-13958-3-git-send-email-andrii.anisov@gmail.com>


-- 
Julien Grall

