Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 223AF2FB61F
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 13:41:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70343.126202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1qJc-0004UF-Oq; Tue, 19 Jan 2021 12:40:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70343.126202; Tue, 19 Jan 2021 12:40:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1qJc-0004Tq-LC; Tue, 19 Jan 2021 12:40:56 +0000
Received: by outflank-mailman (input) for mailman id 70343;
 Tue, 19 Jan 2021 12:40:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U8Ox=GW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l1qJa-0004Tl-Ty
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 12:40:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e41ca857-7566-4cba-8b6c-a8322f94c178;
 Tue, 19 Jan 2021 12:40:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 04FFDAB9F;
 Tue, 19 Jan 2021 12:40:53 +0000 (UTC)
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
X-Inumbo-ID: e41ca857-7566-4cba-8b6c-a8322f94c178
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611060053; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x/XFxTO1iF94mkNdVX5v/JdsuO9BGzrhxq2XWD3Rd2M=;
	b=MQ4KHG9GpdYucwFMDFCIcpre3GCLbJBR+68hGa4BxEVBVfWNVBJwALACnFsouovL86hbo7
	fz0hFBmKd4anSW5QqkHf7VlkiuR0XH7CDgRCz2kkHxeqP9Ur4E6ZH1NkBSfYqHpkzRn8VU
	WIqY/velmL6zLz1Hb7Q+H1JEYOaAoQ8=
Subject: Re: [PATCH] x86/CPUID: unconditionally set
 XEN_HVM_CPUID_IOMMU_MAPPINGS
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20210115150138.36087-1-roger.pau@citrix.com>
 <7535c962-bb3b-6bca-977a-9e8a3332a0f5@suse.com>
 <20210118155426.tnzw7kiceqyytqwa@Air-de-Roger>
 <f7b3c154-7557-ce1a-c8d8-560709f6cabc@suse.com>
 <20210118171040.6ube5htw5lk4hifc@Air-de-Roger>
 <071f8921-d0c4-6907-697f-25a4d905fe2e@citrix.com>
 <20210119111406.owyitwdwoat2obeq@Air-de-Roger>
 <a247baba-3be0-75da-f581-67a362325eea@citrix.com>
 <20210119114051.aslgkrh5n6t5a2yt@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a6bba6e2-a6ce-f566-417a-2189734a2e71@suse.com>
Date: Tue, 19 Jan 2021 13:40:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210119114051.aslgkrh5n6t5a2yt@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 19.01.2021 12:40, Roger Pau Monné wrote:
> On Tue, Jan 19, 2021 at 11:16:06AM +0000, Andrew Cooper wrote:
>> On 19/01/2021 11:14, Roger Pau Monné wrote:
>>> On Mon, Jan 18, 2021 at 05:48:37PM +0000, Andrew Cooper wrote:
>>>> On 18/01/2021 17:10, Roger Pau Monné wrote:
>>>>> On Mon, Jan 18, 2021 at 05:04:19PM +0100, Jan Beulich wrote:
>>>>>> On 18.01.2021 16:54, Roger Pau Monné wrote:
>>>>>>> On Mon, Jan 18, 2021 at 12:05:12PM +0100, Jan Beulich wrote:
>>>>>>>> On 15.01.2021 16:01, Roger Pau Monne wrote:
>>>>>>>>> --- a/xen/arch/x86/traps.c
>>>>>>>>> +++ b/xen/arch/x86/traps.c
>>>>>>>>> @@ -1049,11 +1049,10 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
>>>>>>>>>              res->a |= XEN_HVM_CPUID_X2APIC_VIRT;
>>>>>>>>>  
>>>>>>>>>          /*
>>>>>>>>> -         * Indicate that memory mapped from other domains (either grants or
>>>>>>>>> -         * foreign pages) has valid IOMMU entries.
>>>>>>>>> +         * Unconditionally set the flag to indicate this version of Xen has
>>>>>>>>> +         * been fixed to create IOMMU mappings for grant/foreign maps.
>>>>>>>>>           */
>>>>>>>>> -        if ( is_iommu_enabled(d) )
>>>>>>>>> -            res->a |= XEN_HVM_CPUID_IOMMU_MAPPINGS;
>>>>>>>>> +        res->a |= XEN_HVM_CPUID_IOMMU_MAPPINGS;
>>>>>>>> ... try to clarify the "Unconditionally" here?
>>>>>>> I guess Unconditionally doesn't make much sense, so would be better to
>>>>>>> start the sentence with 'Set ...' instead?
>>>>>> Hmm, this would further move us away from the goal of the comment
>>>>>> making sufficiently clear that a conditional shouldn't be (re-)
>>>>>> introduced here, I would think. Since I can't seem to think of a
>>>>>> good way to express this more briefly than in the description,
>>>>>> and if maybe you can't either, perhaps there's no choice then to
>>>>>> leave it as is, hoping that people would look at the commit before
>>>>>> proposing a further change here.
>>>>> /*
>>>>>  * Unconditionally set the flag to indicate this version of Xen has
>>>>>  * been fixed to create IOMMU mappings for grant/foreign maps.
>>>>>  *
>>>>>  * NB: this flag shouldn't be made conditional on IOMMU presence, as
>>>>>  * it could force guests to resort to using bounce buffers when using
>>>>>  * grant/foreign maps with devices.
>>>>>  */
>>>>>
>>>>> Would be better? (albeit too verbose maybe).
>>>> The comment should be rather more direct.
>>>>
>>>> 1) Xen 4.10 and older was broken WRT grant maps requesting a DMA
>>>> mapping, and forgot to honour the guest's request.
>>>> 2) 4.11 (and presumably backports) fixed the bug, so the map hypercall
>>>> actually did what the guest asked.
>>>> 3) To work around the bug, guests must bounce buffer all DMA, because it
>>>> doesn't know whether the DMA is originating from an emulated or a real
>>>> device.
>>>> 4) This flag tells guests it is safe not to bounce-buffer all DMA to
>>>> work around the bug.
>>> /*
>>>  * Old versions of Xen are broken when creating grant/foreign maps,
>>>  * and will never create IOMMU entries for such mappings. This was
>>>  * fixed in later versions of Xen, but guests wanting to work on
>>>  * unpatched versions will need to use a bounce buffer in order to
>>>  * avoid sending grant/foreign maps to devices. Whether such bounce
>>>  * buffer mechanism is not needed is indicated by the presence of the
>>>  * following CPUID flag.
>>>  */
>>>
>>> Does that seem better?
>>
>> Better, but the key point is that all DMA, emulated or real, needs
>> bounce buffering because the guest kernel doesn't know the difference. 
>> *This* is why the flag needs to be always present, because otherwise a
>> guest will bounce buffer DMA for emulated devices.
> 
> I think this is clear from the text as I explicitly say 'devices'
> (not emulated or passed through devices).
> 
> /*
>  * Old versions of Xen are broken when creating grant/foreign maps,
>  * and will never create IOMMU entries for such mappings. This was
>  * fixed in later versions of Xen, but guests wanting to work on
>  * unpatched versions will need to use a bounce buffer in order to
>  * avoid sending grant/foreign maps to devices. Whether such bounce
>  * buffer mechanism is not needed is indicated by the presence of the
>  * following CPUID flag. Not exposing the flag will force guests to
>  * fallback to bounce buffering when sending grant/foreign maps to any
>  * device.
>  */
> 
> If not I don't mind just using the list that you provided if Jan
> agrees.

I'd be okay with the latest version, but I think Andrew's list is
more clear, so I'd prefer that one.

Jan

