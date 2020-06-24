Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BFC207214
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 13:30:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jo3bC-00016i-A3; Wed, 24 Jun 2020 11:29:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ah2w=AF=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jo3bA-00016d-OZ
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 11:29:48 +0000
X-Inumbo-ID: 0229ab82-b60e-11ea-80a0-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0229ab82-b60e-11ea-80a0-12813bfff9fa;
 Wed, 24 Jun 2020 11:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jxrqvPQcQTqxloYNyiAHBubQgck/QE2PPCyDRQMYLYA=; b=cx3b++vm/zyC6O7qC5a4KvEsJC
 yZGBuKvomIiArf2C7sm/L3i9v6xaj71+Bqh5vf5SDguEPYTu7ZpQnAPKXy2uet3bzkXKX6EKcwu6w
 5zfQlgD9GGicvopiSXGnIUuikIr+NWy+W1ppKbdDajg16xpOKVjnZCgpM5JYo00qp4Ps=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jo3b3-0008Az-HA; Wed, 24 Jun 2020 11:29:41 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jo3b3-00038G-6B; Wed, 24 Jun 2020 11:29:41 +0000
Subject: Re: [INPUT REQUESTED][PATCH v3 for-4.14] pvcalls: Document correctly
 and explicitely the padding for all arches
To: Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall.oss@gmail.com>,
 "committers@xenproject.org" <committers@xenproject.org>
References: <20200613184132.11880-1-julien@xen.org>
 <alpine.DEB.2.21.2006151343430.9074@sstabellini-ThinkPad-T480s>
 <35c8373f-b691-d95e-17de-021c72faf216@xen.org>
 <alpine.DEB.2.21.2006161322210.24982@sstabellini-ThinkPad-T480s>
 <CAJ=z9a2cnMUiYBz+hA2_hjf5ShVh66tUwE9kbjqSM-H0TkTbyw@mail.gmail.com>
 <alpine.DEB.2.21.2006171146510.14005@sstabellini-ThinkPad-T480s>
 <cefe0cc7-5b1c-4ae2-a160-3857cc131a3d@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <691258d9-a0e7-ab72-74a3-5c5f6026a7e9@xen.org>
Date: Wed, 24 Jun 2020 12:29:38 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <cefe0cc7-5b1c-4ae2-a160-3857cc131a3d@xen.org>
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi

Gentle ping. It would be good to get this resolved for Xen 4.14.

On 18/06/2020 16:00, Julien Grall wrote:
> (+ Committers)
> 
> On 18/06/2020 02:34, Stefano Stabellini wrote:
>> On Tue, 16 Jun 2020, Julien Grall wrote:
>>> On Tue, 16 Jun 2020 at 21:57, Stefano Stabellini 
>>> <sstabellini@kernel.org> wrote:
>>>>
>>>> On Tue, 16 Jun 2020, Julien Grall wrote:
>>>>> On 16/06/2020 02:00, Stefano Stabellini wrote:
>>>>>> On Sat, 13 Jun 2020, Julien Grall wrote:
>>>>>>> From: Julien Grall <jgrall@amazon.com>
>>>>>>>
>>>>>>> The documentation of pvcalls suggests there is padding for 32-bit 
>>>>>>> x86
>>>>>>> at the end of most the structure. However, they are not described in
>>>>>>> in the public header.
>>>>>>>
>>>>>>> Because of that all the structures would be 32-bit aligned and not
>>>>>>> 64-bit aligned for 32-bit x86.
>>>>>>>
>>>>>>> For all the other architectures supported (Arm and 64-bit x86), the
>>>>>>> structure are aligned to 64-bit because they contain uint64_t field.
>>>>>>> Therefore all the structures contain implicit padding.
>>>>>>>
>>>>>>> The paddings are now corrected for 32-bit x86 and written 
>>>>>>> explicitly for
>>>>>>> all the architectures.
>>>>>>>
>>>>>>> While the structure size between 32-bit and 64-bit x86 is 
>>>>>>> different, it
>>>>>>> shouldn't cause any incompatibility between a 32-bit and 64-bit
>>>>>>> frontend/backend because the commands are always 56 bits and the 
>>>>>>> padding
>>>>>>> are at the end of the structure.
>>>>>>>
>>>>>>> As an aside, the padding sadly cannot be mandated to be 0 as they 
>>>>>>> are
>>>>>>> already present. So it is not going to be possible to use the 
>>>>>>> padding
>>>>>>> for extending a command in the future.
>>>>>>>
>>>>>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>>>>>
>>>>>>> ---
>>>>>>>       Changes in v3:
>>>>>>>           - Use __i386__ rather than CONFIG_X86_32
>>>>>>>
>>>>>>>       Changes in v2:
>>>>>>>           - It is not possible to use the same padding for 32-bit 
>>>>>>> x86 and
>>>>>>>           all the other supported architectures.
>>>>>>> ---
>>>>>>>    docs/misc/pvcalls.pandoc        | 18 ++++++++++--------
>>>>>>>    xen/include/public/io/pvcalls.h | 14 ++++++++++++++
>>>>>>>    2 files changed, 24 insertions(+), 8 deletions(-)
>>>>>>>
>>>>>>> diff --git a/docs/misc/pvcalls.pandoc b/docs/misc/pvcalls.pandoc
>>>>>>> index 665dad556c39..caa71b36d78b 100644
>>>>>>> --- a/docs/misc/pvcalls.pandoc
>>>>>>> +++ b/docs/misc/pvcalls.pandoc
>>>>>>> @@ -246,9 +246,9 @@ The format is defined as follows:
>>>>>>>                            uint32_t domain;
>>>>>>>                            uint32_t type;
>>>>>>>                            uint32_t protocol;
>>>>>>> -                         #ifdef CONFIG_X86_32
>>>>>>> +                 #ifndef __i386__
>>>>>>>                            uint8_t pad[4];
>>>>>>> -                         #endif
>>>>>>> +                 #endif
>>>>>>
>>>>>>
>>>>>> Hi Julien,
>>>>>>
>>>>>> Thank you for doing this, and sorry for having missed v2 of this 
>>>>>> patch, I
>>>>>> should have replied earlier.
>>>>>>
>>>>>> The intention of the #ifdef blocks like:
>>>>>>
>>>>>>     #ifdef CONFIG_X86_32
>>>>>>       uint8_t pad[4];
>>>>>>     #endif
>>>>>>
>>>>>> in pvcalls.pandoc was to make sure that these structs would be 64bit
>>>>>> aligned on x86_32 too.
>>>>>>
>>>>>> I realize that the public header doesn't match, but the spec is the
>>>>>> "master copy".
>>>>>
>>>>> So far, the public headers are the defacto official ABI. So did you 
>>>>> mark the
>>>>> pvcall header as just a reference?
>>>>
>>>> No, there is no document that says that the canonical copy of the
>>>> interface is pvcalls.pandoc. However, it was clearly spelled out from
>>>> the start on xen-devel (see below.)
>>>> In fact, if you notice, this is the
>>>> first document under docs/misc that goes into this level of details in
>>>> describing a new PV protocol. Also note the title of the document which
>>>> is "PV Calls Protocol version 1".
>>>
>>> While I understand this may have been the original intention, you
>>> can't expect a developer to go through the archive to check whether
>>> he/she should trust the header of the document.
>>>
>>>>
>>>>
>>>> In reply to Jan:
>>>>> A public header can't be "fixed" if it may already be in use by
>>>>> anyone. We can only do as Andrew and you suggest (mandate textual
>>>>> descriptions to be "the ABI") when we do so for _new_ interfaces from
>>>>> the very beginning, making clear that the public header (if any)
>>>>> exists just for reference.
>>>>
>>>> What if somebody took the specification of the interface from
>>>> pvcalls.pandoc and wrote their own headers and code? It is definitely
>>>> possible.
>>>
>>> As it is possible for someone to have picked the headers from Xen as
>>> in the past public/ has always been the authority.
>>
>> We never had documents under docs/ before specifying the interfaces
>> before pvcalls. It is not written anywhere that the headers under
>> public/ are the authoritative interfaces either, it is just that it was
>> the only thing available before. If you are new to the project you might
>> go to docs/ first.
>>
>>
>>>> At the time, it was clarified that the purpose of writing such
>>>> a detailed specification document was that the document was the
>>>> specification :-)
>>>
>>> At the risk of being pedantic, if it is not written in xen.git it
>>> doesn't exist ;).
>>>
>>> Anyway, no matter the decision you take here, you are going to
>>> potentially break one set of the users.
>>>
>>> I am leaning towards the header as authoritative because this has
>>> always been the case in the past and nothing in xen.git says
>>> otherwise. However I am not a user of pvcalls, so I don't really have
>>> any big incentive to go either way.
>>
>> Yeah, we are risking breaking one set of users either way :-/
>> In reality, we are using pvcalls on arm64 in a new project (but it is
>> still very green). I am not aware of anybody using pvcalls on x86
>> (especially x86_32).
>>
>> I would prefer to honor the pvcalls.pandoc specification because that is
>> what it was meant to be, and also leads to a better protocol
>> specification.
> 
> As Jan and you disagree on the approach, I would like to get more input.
> 
> To summarize the discussion, the document for PV calls and the public 
> headers don't match when describing the padding. There is a disagreement 
> on which of the two are the authority and therefore which one to fix.
> 
> Does anyone else have a preference on the approach?
> 
>>
>>
>>> For the future, I would highly suggest writing down the support
>>> decision in xen.git. This would avoid such debate on what is the
>>> authority...
>>
>> Yes that's the way to go
>>
> 

-- 
Julien Grall

