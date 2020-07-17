Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A5C2236C4
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 10:16:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwLXX-0006Yd-8r; Fri, 17 Jul 2020 08:16:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1N/p=A4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jwLXV-0006YY-24
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 08:16:17 +0000
X-Inumbo-ID: c8e8de42-c805-11ea-b7bb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c8e8de42-c805-11ea-b7bb-bc764e2007e4;
 Fri, 17 Jul 2020 08:16:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D9AB3ADF0;
 Fri, 17 Jul 2020 08:16:19 +0000 (UTC)
Subject: Re: [PATCH 1/2] common: map_vcpu_info() cosmetics
To: Julien Grall <julien.grall.oss@gmail.com>
References: <fef45e49-bcb4-dc11-8f7f-b2f5e4bf1a73@suse.com>
 <2a0341c7-3836-a8c0-9516-b6a08e2720ec@suse.com>
 <20200716114128.GO7191@Air-de-Roger>
 <03a4d446-c26b-f171-57fd-a1eb13dad6c0@suse.com>
 <20200716144219.GQ7191@Air-de-Roger>
 <d64ee03f-4663-39ce-fd72-5702029e0182@suse.com>
 <CAJ=z9a2gCm7LNOpJUO4nbwUExmtd8KH2TBvt4VXCaqiAeXuCcg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7b9dc9b2-e117-6bbb-05a7-e82c4529e5e7@suse.com>
Date: Fri, 17 Jul 2020 10:16:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJ=z9a2gCm7LNOpJUO4nbwUExmtd8KH2TBvt4VXCaqiAeXuCcg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16.07.2020 18:17, Julien Grall wrote:
> On Thu, 16 Jul 2020, 17:01 Jan Beulich, <jbeulich@suse.com> wrote:
> 
>> On 16.07.2020 16:42, Roger Pau Monné wrote:
>>> On Thu, Jul 16, 2020 at 01:48:51PM +0200, Jan Beulich wrote:
>>>> On 16.07.2020 13:41, Roger Pau Monné wrote:
>>>>> On Wed, Jul 15, 2020 at 12:15:10PM +0200, Jan Beulich wrote:
>>>>>> Use ENXIO instead of EINVAL to cover the two cases of the address not
>>>>>> satisfying the requirements. This will make an issue here better stand
>>>>>> out at the call site.
>>>>>
>>>>> Not sure whether I would use EFAULT instead of ENXIO, as the
>>>>> description of it is 'bad address' which seems more inline with the
>>>>> error that we are trying to report.
>>>>
>>>> The address isn't bad in the sense of causing a fault, it's just
>>>> that we elect to not allow it. Hence I don't think EFAULT is
>>>> suitable. I'm open to replacement suggestions for ENXIO, though.
>>>
>>> Well, using an address that's not properly aligned to the requirements
>>> of an interface would cause a fault? (in this case it's a software
>>> interface, but the concept applies equally).
>>
>> Not necessarily, see x86'es behavior. Also even on strict arches
> 
> it is typically possible to cover for the misalignment by using
>> suitable instructions; it's still an implementation choice to not
>> do so.
> 
> 
> I am not sure about your argument here... Yes it might be possible, but at
> what cost?

The cost is what influences the decision whether to support it. Nevertheless
it remains an implementation decision rather than a hardware imposed
restriction, and hence I don't consider -EFAULT suitable here.

>>> Anyway, not something worth arguing about I think, so unless someone
>>> else disagrees I'm fine with using ENXIO.
>>
>> Good, thanks.
>>
> 
> -EFAULT can be described as "Bad address". I think it makes more sense than
> -ENXIO here even if it may not strictly result to a fault on some arch.

As said - I don't consider EFAULT applicable here; I also consider EINVAL
as too generic. I'll be happy to see replacement suggestions for my ENXIO
choice, but obviously I'm not overly happy to see options re-suggested
which I did already say I've ruled out.

Jan

