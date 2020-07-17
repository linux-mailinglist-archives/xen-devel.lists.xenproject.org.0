Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FCF223829
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 11:23:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwMZR-0004Va-P2; Fri, 17 Jul 2020 09:22:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/fKj=A4=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jwMZP-0004VV-Mx
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 09:22:19 +0000
X-Inumbo-ID: 02fbc2a8-c80f-11ea-bca7-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 02fbc2a8-c80f-11ea-bca7-bc764e2007e4;
 Fri, 17 Jul 2020 09:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ddxKEY0lA45qy6ua1yonzSg5nBItlF+1Mxkg7U80taU=; b=PnhcnAj+NTVKjS50m7Lkh0QySj
 JrfvrTYunAZcdtBY4BEYsw9kbsRc5wPSCdBOIFxQ0nY3wIkm49Y9FSj4dHHDLKNXsAOIUhLaFaP87
 DndTHpOe2a7DhNzHjcLoAeZXocSBqFMbG25IGvLBBYIy1Ag/ON3p9J5k8ipTAXWcaRbk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jwMZM-0001RK-Pc; Fri, 17 Jul 2020 09:22:16 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jwMZM-0002Mb-GU; Fri, 17 Jul 2020 09:22:16 +0000
Subject: Re: [PATCH 1/2] common: map_vcpu_info() cosmetics
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien.grall.oss@gmail.com>
References: <fef45e49-bcb4-dc11-8f7f-b2f5e4bf1a73@suse.com>
 <2a0341c7-3836-a8c0-9516-b6a08e2720ec@suse.com>
 <20200716114128.GO7191@Air-de-Roger>
 <03a4d446-c26b-f171-57fd-a1eb13dad6c0@suse.com>
 <20200716144219.GQ7191@Air-de-Roger>
 <d64ee03f-4663-39ce-fd72-5702029e0182@suse.com>
 <CAJ=z9a2gCm7LNOpJUO4nbwUExmtd8KH2TBvt4VXCaqiAeXuCcg@mail.gmail.com>
 <7b9dc9b2-e117-6bbb-05a7-e82c4529e5e7@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <be5e1706-55de-e7b7-c302-5440f4c321a8@xen.org>
Date: Fri, 17 Jul 2020 10:22:14 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7b9dc9b2-e117-6bbb-05a7-e82c4529e5e7@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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



On 17/07/2020 09:16, Jan Beulich wrote:
> On 16.07.2020 18:17, Julien Grall wrote:
>> On Thu, 16 Jul 2020, 17:01 Jan Beulich, <jbeulich@suse.com> wrote:
>>
>>> On 16.07.2020 16:42, Roger Pau Monné wrote:
>>>> On Thu, Jul 16, 2020 at 01:48:51PM +0200, Jan Beulich wrote:
>>>>> On 16.07.2020 13:41, Roger Pau Monné wrote:
>>>>>> On Wed, Jul 15, 2020 at 12:15:10PM +0200, Jan Beulich wrote:
>>>>>>> Use ENXIO instead of EINVAL to cover the two cases of the address not
>>>>>>> satisfying the requirements. This will make an issue here better stand
>>>>>>> out at the call site.
>>>>>>
>>>>>> Not sure whether I would use EFAULT instead of ENXIO, as the
>>>>>> description of it is 'bad address' which seems more inline with the
>>>>>> error that we are trying to report.
>>>>>
>>>>> The address isn't bad in the sense of causing a fault, it's just
>>>>> that we elect to not allow it. Hence I don't think EFAULT is
>>>>> suitable. I'm open to replacement suggestions for ENXIO, though.
>>>>
>>>> Well, using an address that's not properly aligned to the requirements
>>>> of an interface would cause a fault? (in this case it's a software
>>>> interface, but the concept applies equally).
>>>
>>> Not necessarily, see x86'es behavior. Also even on strict arches
>>
>> it is typically possible to cover for the misalignment by using
>>> suitable instructions; it's still an implementation choice to not
>>> do so.
>>
>>
>> I am not sure about your argument here... Yes it might be possible, but at
>> what cost?
> 
> The cost is what influences the decision whether to support it. Nevertheless
> it remains an implementation decision rather than a hardware imposed
> restriction, and hence I don't consider -EFAULT suitable here.
> 
>>>> Anyway, not something worth arguing about I think, so unless someone
>>>> else disagrees I'm fine with using ENXIO.
>>>
>>> Good, thanks.
>>>
>>
>> -EFAULT can be described as "Bad address". I think it makes more sense than
>> -ENXIO here even if it may not strictly result to a fault on some arch.
> 
> As said - I don't consider EFAULT applicable here;

AFAICT, you don't consider it because you think that using the address 
means it will always lead to a fault. However, this is just a strict 
interpretation of the error code. A less strict interpretation is it 
could be used for any address that is considered to be invalid.

-ENXIO makes less sense because the address exists. To re-use your 
argument, this is just an implementation details.

> I also consider EINVAL
> as too generic. I'll be happy to see replacement suggestions for my ENXIO
> choice, but obviously I'm not overly happy to see options re-suggested
> which I did already say I've ruled out.

I think I am allowed to express my opinion even if it means this was 
already said... However, I should have been clearer and say that I agree 
with Roger's suggestion about -EFAULT.

Cheers,

-- 
Julien Grall

