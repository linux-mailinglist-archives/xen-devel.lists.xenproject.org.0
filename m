Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE25A2239D9
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 12:56:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwO2P-000463-Nu; Fri, 17 Jul 2020 10:56:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1N/p=A4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jwO2O-00045y-Ef
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 10:56:20 +0000
X-Inumbo-ID: 24394d20-c81c-11ea-95b8-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 24394d20-c81c-11ea-95b8-12813bfff9fa;
 Fri, 17 Jul 2020 10:56:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 12FD5AE56;
 Fri, 17 Jul 2020 10:56:22 +0000 (UTC)
Subject: Re: [PATCH 1/2] common: map_vcpu_info() cosmetics
To: Julien Grall <julien@xen.org>, Julien Grall <julien.grall.oss@gmail.com>
References: <fef45e49-bcb4-dc11-8f7f-b2f5e4bf1a73@suse.com>
 <2a0341c7-3836-a8c0-9516-b6a08e2720ec@suse.com>
 <20200716114128.GO7191@Air-de-Roger>
 <03a4d446-c26b-f171-57fd-a1eb13dad6c0@suse.com>
 <20200716144219.GQ7191@Air-de-Roger>
 <d64ee03f-4663-39ce-fd72-5702029e0182@suse.com>
 <CAJ=z9a2gCm7LNOpJUO4nbwUExmtd8KH2TBvt4VXCaqiAeXuCcg@mail.gmail.com>
 <7b9dc9b2-e117-6bbb-05a7-e82c4529e5e7@suse.com>
 <be5e1706-55de-e7b7-c302-5440f4c321a8@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c8a341b7-0252-7c42-0375-130a1542c731@suse.com>
Date: Fri, 17 Jul 2020 12:56:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <be5e1706-55de-e7b7-c302-5440f4c321a8@xen.org>
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

On 17.07.2020 11:22, Julien Grall wrote:
> 
> 
> On 17/07/2020 09:16, Jan Beulich wrote:
>> On 16.07.2020 18:17, Julien Grall wrote:
>>> On Thu, 16 Jul 2020, 17:01 Jan Beulich, <jbeulich@suse.com> wrote:
>>>
>>>> On 16.07.2020 16:42, Roger Pau Monné wrote:
>>>>> On Thu, Jul 16, 2020 at 01:48:51PM +0200, Jan Beulich wrote:
>>>>>> On 16.07.2020 13:41, Roger Pau Monné wrote:
>>>>>>> On Wed, Jul 15, 2020 at 12:15:10PM +0200, Jan Beulich wrote:
>>>>>>>> Use ENXIO instead of EINVAL to cover the two cases of the address not
>>>>>>>> satisfying the requirements. This will make an issue here better stand
>>>>>>>> out at the call site.
>>>>>>>
>>>>>>> Not sure whether I would use EFAULT instead of ENXIO, as the
>>>>>>> description of it is 'bad address' which seems more inline with the
>>>>>>> error that we are trying to report.
>>>>>>
>>>>>> The address isn't bad in the sense of causing a fault, it's just
>>>>>> that we elect to not allow it. Hence I don't think EFAULT is
>>>>>> suitable. I'm open to replacement suggestions for ENXIO, though.
>>>>>
>>>>> Well, using an address that's not properly aligned to the requirements
>>>>> of an interface would cause a fault? (in this case it's a software
>>>>> interface, but the concept applies equally).
>>>>
>>>> Not necessarily, see x86'es behavior. Also even on strict arches
>>>
>>> it is typically possible to cover for the misalignment by using
>>>> suitable instructions; it's still an implementation choice to not
>>>> do so.
>>>
>>>
>>> I am not sure about your argument here... Yes it might be possible, but at
>>> what cost?
>>
>> The cost is what influences the decision whether to support it. Nevertheless
>> it remains an implementation decision rather than a hardware imposed
>> restriction, and hence I don't consider -EFAULT suitable here.
>>
>>>>> Anyway, not something worth arguing about I think, so unless someone
>>>>> else disagrees I'm fine with using ENXIO.
>>>>
>>>> Good, thanks.
>>>>
>>>
>>> -EFAULT can be described as "Bad address". I think it makes more sense than
>>> -ENXIO here even if it may not strictly result to a fault on some arch.
>>
>> As said - I don't consider EFAULT applicable here;
> 
> AFAICT, you don't consider it because you think that using the address 
> means it will always lead to a fault. However, this is just a strict 
> interpretation of the error code. A less strict interpretation is it 
> could be used for any address that is considered to be invalid.
> 
> -ENXIO makes less sense because the address exists. To re-use your 
> argument, this is just an implementation details.

To be honest, with all the errno values (and with how we use them in
Xen) I rarely pay attention to the text that's associated with them,
but rather what their symbolic name says. For ENXIO, I don't consider
"No such device or address" any more sensible than "Bad address" for
EFAULT.

Since I'm against EFAULT (and EINVAL) and you're against ENXIO, how
about you suggest a 3rd alternative? EPERM comes to mind, but could
easily be mistaken for yet something else. My goal really is to use
an error code here which makes it immediately clear what the actual
problem was, with no ambiguity to other possible error sources on
this hypercall handling path. I don't really care about which of the
ones we use here that aren't already used anywhere on this path. I'd
even be fine with presumably (at least to some people) absurd ones
like EILSEQ or EXDEV, which we use elsewhere, and hardly in the sense
they were originally meant, but again for the purpose of making the
cause of the error easily identifiable.

For this purpose, to me ENXIO seemed to be a reasonable fit. So again
- I'm open to suggestions, but it has to be a not commonly used error
code.

Jan

