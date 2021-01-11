Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7BF2F0EC3
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 10:14:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64695.114315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kytGw-0001DD-Ht; Mon, 11 Jan 2021 09:13:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64695.114315; Mon, 11 Jan 2021 09:13:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kytGw-0001CW-EY; Mon, 11 Jan 2021 09:13:58 +0000
Received: by outflank-mailman (input) for mailman id 64695;
 Mon, 11 Jan 2021 09:13:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ekcf=GO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kytGu-0001CM-BS
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 09:13:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d271839-cb3b-41bc-a6ad-1c911af8589e;
 Mon, 11 Jan 2021 09:13:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5A99DAD11;
 Mon, 11 Jan 2021 09:13:54 +0000 (UTC)
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
X-Inumbo-ID: 9d271839-cb3b-41bc-a6ad-1c911af8589e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610356434; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HdupICnRhAyGEBKNt67ZPQH+PpCwycXCPhNc7M1+5Vk=;
	b=XuEOEk27aMDyeOQxVMR+CREtbltUUKkA5dq7kDnbAsKtnE49FVOzgOz2FDw2nMj9i62ngx
	FlRqBkawJoKo6rG+lQkX8zdeGcIavJqlveQUbQBnP7J2Tba7qsV8heP8mwWaskh8JrEmjs
	CKD3u/VvYtdjS+CQjkFKRlOV044/7rs=
Subject: Re: [PATCH 1/2] viridian: remove implicit limit of 64 VPs per
 partition
To: paul@xen.org, 'Igor Druzhinin' <igor.druzhinin@citrix.com>
Cc: wl@xen.org, iwj@xenproject.org, anthony.perard@citrix.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org,
 sstabellini@kernel.org, roger.pau@citrix.com, xen-devel@lists.xenproject.org
References: <1610066796-17266-1-git-send-email-igor.druzhinin@citrix.com>
 <009d01d6e598$bfdd0110$3f970330$@xen.org>
 <ce4814a8-4f18-c17c-c3e2-99a0ad18e4f1@citrix.com>
 <00ad01d6e7f6$1ebbe610$5c33b230$@xen.org>
 <33322763-6810-3bfc-9573-1e326b38293e@suse.com>
 <00b001d6e7f9$80937a30$81ba6e90$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <84725209-3c0a-a83a-e8d7-b690d71eb9d7@suse.com>
Date: Mon, 11 Jan 2021 10:13:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <00b001d6e7f9$80937a30$81ba6e90$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11.01.2021 10:09, Paul Durrant wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 11 January 2021 09:00
>> To: paul@xen.org
>> Cc: wl@xen.org; iwj@xenproject.org; anthony.perard@citrix.com; andrew.cooper3@citrix.com;
>> george.dunlap@citrix.com; julien@xen.org; sstabellini@kernel.org; roger.pau@citrix.com; xen-
>> devel@lists.xenproject.org; 'Igor Druzhinin' <igor.druzhinin@citrix.com>
>> Subject: Re: [PATCH 1/2] viridian: remove implicit limit of 64 VPs per partition
>>
>> On 11.01.2021 09:45, Paul Durrant wrote:
>>>> -----Original Message-----
>>>> From: Igor Druzhinin <igor.druzhinin@citrix.com>
>>>> Sent: 09 January 2021 00:56
>>>> To: paul@xen.org; xen-devel@lists.xenproject.org
>>>> Cc: wl@xen.org; iwj@xenproject.org; anthony.perard@citrix.com; andrew.cooper3@citrix.com;
>>>> george.dunlap@citrix.com; jbeulich@suse.com; julien@xen.org; sstabellini@kernel.org;
>>>> roger.pau@citrix.com
>>>> Subject: Re: [PATCH 1/2] viridian: remove implicit limit of 64 VPs per partition
>>>>
>>>> On 08/01/2021 08:32, Paul Durrant wrote:
>>>>>> -----Original Message-----
>>>>>> From: Igor Druzhinin <igor.druzhinin@citrix.com>
>>>>>> Sent: 08 January 2021 00:47
>>>>>> To: xen-devel@lists.xenproject.org
>>>>>> Cc: paul@xen.org; wl@xen.org; iwj@xenproject.org; anthony.perard@citrix.com;
>>>>>> andrew.cooper3@citrix.com; george.dunlap@citrix.com; jbeulich@suse.com; julien@xen.org;
>>>>>> sstabellini@kernel.org; roger.pau@citrix.com; Igor Druzhinin <igor.druzhinin@citrix.com>
>>>>>> Subject: [PATCH 1/2] viridian: remove implicit limit of 64 VPs per partition
>>>>>>
>>>>>> TLFS 7.8.1 stipulates that "a virtual processor index must be less than
>>>>>> the maximum number of virtual processors per partition" that "can be obtained
>>>>>> through CPUID leaf 0x40000005". Furthermore, "Requirements for Implementing
>>>>>> the Microsoft Hypervisor Interface" defines that starting from Windows Server
>>>>>> 2012, which allowed more than 64 CPUs to be brought up, this leaf can now
>>>>>> contain a value -1 basically assuming the hypervisor has no restriction while
>>>>>> 0 (that we currently expose) means the default restriction is still present.
>>>>>>
>>>>>> Along with previous changes exposing ExProcessorMasks this allows a recent
>>>>>> Windows VM with Viridian extension enabled to have more than 64 vCPUs without
>>>>>> going into immediate BSOD.
>>>>>>
>>>>>
>>>>> This is very odd as I was happily testing with a 128 vCPU VM once ExProcessorMasks was
>>>> implemented... no need for the extra leaf.
>>>>> The documentation for 0x40000005 states " Describes the scale limits supported in the current
>>>> hypervisor implementation. If any
>>>>> value is zero, the hypervisor does not expose the corresponding information". It does not say (in
>>>> section 7.8.1 or elsewhere AFAICT)
>>>>> what implications that has for VP_INDEX.
>>>>>
>>>>> In " Requirements for Implementing the Microsoft Hypervisor Interface" I don't see anything saying
>>>> what the semantics of not
>>>>> implementing leaf 0x40000005 are, only that if implementing it then -1 must be used to break the
>> 64
>>>> VP limit. It also says that
>>>>> reporting -1 in 0x40000005 means that 40000004.EAX bits 1 and 2 *must* be clear, which is clearly
>>>> not true if ExProcessorMasks is
>>>>> enabled. That document is dated June 13th 2012 so I think it should be taken with a pinch of salt.
>>>>>
>>>>> Have you actually observed a BSOD with >64 vCPUs when ExProcessorMasks is enabled? If so, which
>>>> version of Windows? I'd like to get
>>>>> a repro myself.
>>>>
>>>> I return with more testing that confirm both my and your results.
>>>>
>>>> 1) with ExProcessorMask and 66 vCPUs assigned both current WS19 build and
>>>> pre-release 20270 of vNext boot correctly with no changes
>>>>
>>>> and that would be fine but the existing documentation for ex_processor_masks
>>>> states that:
>>>> "Hence this enlightenment must be specified for guests with more
>>>> than 64 vCPUs if B<hcall_remote_tlb_flush> and/or B<hcall_ipi> are also
>>>> specified."
>>>>
>>>> You then would expect 64+ vCPU VM to boot without ex_processors_mask,
>>>> hcall_remote_tlb_flush and hcall_ipi.
>>>
>>> Indeed.
>>>
>>>>
>>>> So,
>>>> 2) without ExProcessorMaks and 66 vCPUs assigned and with hcall_remote_tlb_flush
>>>> and hcall_ipi disabled: WS19 BSODs and vNext fails to initialize secondary CPUs
>>>>
>>>
>>> This is not what I recall from testing but I can confirm I see the same now.
>>>
>>>> After applying my change,
>>>> 3) without ExProcessorMaks and 66 vCPUs assigned and with hcall_remote_tlb_flush
>>>> and hcall_ipi disabled WS19 and vNext boot correctly
>>>>
>>>> So we either need to change documentation and require ExProcessorMasks for all
>>>> VMs with 64+ vCPUs or go with my change.
>>>>
>>>
>>> I think we go with your change. I guess we can conclude then that the separate viridian flag as part
>> of the base set is the right way to go (to stop the leaf magically appearing on migrate of existing
>> guests) and leave ex_processor_masks (and the documentation) as-is.
>>>
>>> You can add my R-b to the patch.
>>
>> That's the unchanged patch then, including the libxl change that
>> I had asked about and that I have to admit I don't fully follow
>> Igor's responses? I'm hesitant to give an ack for that aspect of
>> the change, yet I suppose the libxl maintainers will defer to
>> x86 ones there. Alternatively Andrew or Roger could of course
>> ack this ...
>>
> 
> I don't think we really need specific control in xl.cfg as this is a fix for some poorly documented semantics in the spec. The flag simply prevents the leaf magically appearing on migrate and I think that's enough. 

Well, okay then. I can throw in this patch unchanged; it is my
understanding that there'll be a v2 for patch 2.

Jan

