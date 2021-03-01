Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6BA327B5B
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 10:59:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91406.172815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGfKQ-0002j8-9w; Mon, 01 Mar 2021 09:59:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91406.172815; Mon, 01 Mar 2021 09:59:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGfKQ-0002ii-6l; Mon, 01 Mar 2021 09:59:02 +0000
Received: by outflank-mailman (input) for mailman id 91406;
 Mon, 01 Mar 2021 09:59:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m81q=H7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lGfKO-0002iX-Rm
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 09:59:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a663c28-97b7-4f75-af72-e6139f22d2c5;
 Mon, 01 Mar 2021 09:58:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A18D2AAC5;
 Mon,  1 Mar 2021 09:58:58 +0000 (UTC)
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
X-Inumbo-ID: 2a663c28-97b7-4f75-af72-e6139f22d2c5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614592738; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lmJvU2yxrLG2j4y9KegRIA0ARLcJM5dSnacLdTPlvxE=;
	b=sNkUgJooJqSffzEn/LZ1FE5tSJOcEuaLWTR7URAD1eby4mUC6eGnVP4zrziLwhw8qo8xh0
	L9T00O14hM3UKOlLHdJ1xqUrVGquij1U/4fVx/KHFJnLco8pTvGs1eKNJbMSJxVNQmkz8O
	q5IS3hSbFh6L6W+N770Iy+LdvMAD+tY=
Subject: Re: [PATCH] VMX: use a single, global APIC access page
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>, "Cooper, Andrew" <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1b6a411b-84e7-bfb1-647e-511a13df838c@suse.com>
 <YCTuq5b130PR6G35@Air-de-Roger>
 <7abc515b-d652-3d39-6038-99966deafdf8@suse.com>
 <YCUSDSYpS5X+AZco@Air-de-Roger>
 <547b40f2-3b7b-10cb-30f6-9445c784eb0b@suse.com>
 <YCUiniCn+oT9CFwC@Air-de-Roger>
 <MWHPR11MB1886E452B181ACA872B7C6878C9A9@MWHPR11MB1886.namprd11.prod.outlook.com>
 <a11878e2-312c-a49a-ebe2-122906fc8d38@suse.com>
 <MWHPR11MB18860667A153820C2CB8D55B8C9A9@MWHPR11MB1886.namprd11.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a0595a8f-b3ad-c901-15d9-cae0b538858a@suse.com>
Date: Mon, 1 Mar 2021 10:58:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <MWHPR11MB18860667A153820C2CB8D55B8C9A9@MWHPR11MB1886.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01.03.2021 09:30, Tian, Kevin wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Monday, March 1, 2021 4:16 PM
>>
>> On 01.03.2021 03:18, Tian, Kevin wrote:
>>>> From: Roger Pau Monné <roger.pau@citrix.com>
>>>> Sent: Thursday, February 11, 2021 8:27 PM
>>>>
>>>> On Thu, Feb 11, 2021 at 12:22:41PM +0100, Jan Beulich wrote:
>>>>> On 11.02.2021 12:16, Roger Pau Monné wrote:
>>>>>> On Thu, Feb 11, 2021 at 11:36:59AM +0100, Jan Beulich wrote:
>>>>>>> On 11.02.2021 09:45, Roger Pau Monné wrote:
>>>>>>>> On Wed, Feb 10, 2021 at 05:48:26PM +0100, Jan Beulich wrote:
>>>>>>>>> --- a/xen/include/asm-x86/p2m.h
>>>>>>>>> +++ b/xen/include/asm-x86/p2m.h
>>>>>>>>> @@ -935,6 +935,9 @@ static inline unsigned int p2m_get_iommu
>>>>>>>>>          flags = IOMMUF_readable;
>>>>>>>>>          if ( !rangeset_contains_singleton(mmio_ro_ranges,
>> mfn_x(mfn)) )
>>>>>>>>>              flags |= IOMMUF_writable;
>>>>>>>>> +        /* VMX'es APIC access page is global and hence has no owner.
>>>> */
>>>>>>>>> +        if ( mfn_valid(mfn) && !page_get_owner(mfn_to_page(mfn)) )
>>>>>>>>> +            flags = 0;
>>>>>>>>
>>>>>>>> Is it fine to have this page accessible to devices if the page tables
>>>>>>>> are shared between the CPU and the IOMMU?
>>>>>>>
>>>>>>> No, it's not, but what do you do? As said elsewhere, devices
>>>>>>> gaining more access than is helpful is the price we pay for
>>>>>>> being able to share page tables. But ...
>>>>>>
>>>>>> I'm concerned about allowing devices to write to this shared page, as
>>>>>> could be used as an unintended way to exchange information between
>>>>>> domains?
>>>>>
>>>>> Well, such an abuse would be possible, but it wouldn't be part
>>>>> of an ABI and hence could break at any time. Similarly I
>>>>> wouldn't consider it an information leak if a guest abused
>>>>> this.
>>>>
>>>> Hm, I'm kind of worried about having such shared page accessible to
>>>> guests. Could Intel confirm whether pages in the 0xFEExxxxx range are
>>>> accessible to devices in any way when using IOMMU shared page
>>>> tables?
>>>
>>> 0xFEExxxxx range is special. Requests to this range are not subject to
>>> DMA remapping (even if a valid mapping for this range exists in the
>>> IOMMU page table). And this special treatment is true regardless of
>>> whether interrupt remapping is enabled (which comes only after an
>>> interrupt message to this range is recognized).
>>
>> For my/our education, could you outline what happens to device
>> accesses to that range when interrupt remapping is off? And
>> perhaps also what happens to accesses to this range that don't
>> match the pattern of an MSI initiation (dword write)? I don't
>> think I've been able to spot anything to this effect in the docs.
>>
> 
> In VT-d spec "3.14 Handling Requests to Interrupt Address Range"
> --
> On Intel® architecture platforms, physical address range 0xFEEx_xxxx is 
> designated as the interrupt address range. Requests without PASID to 
> this range are not subjected to DMA remapping (even if translation 
> structures specify a mapping for this range).
> --
> The following types of requests to this range are illegal requests. 
> They are blocked and reported as Interrupt Remapping faults.
> • Read requests without PASID that are not ZLR.
> • Atomics requests without PASID.
> • Non-DWORD length write requests without PASID. 
> --

Ah, I see. That's (according to the change bars) a relatively recent
addition. So the above clarifies things for the !PASID case. Am I
interpreting

"Requests-with-PASID with input address in range 0xFEEx_xxxx are
 translated normally like any other request-with-PASID through
 DMA-remapping hardware. However, if such a request is processed
 using pass-through translation, it will be blocked as described
 in the paragraph below.

 Software must not program paging-structure entries to remap any
 address to the interrupt address range. Untranslated requests and
 translation requests that result in an address in the interrupt
 range will be blocked with condition code LGN.4 or SGN.8.
 Translated requests with an address in the interrupt address
 range are treated as Unsupported Request (UR)."

right in that _with_ PASID translation entries for this range would
still be used, so long as they translate to an area outside of the
FEExxxxx range? If so this would mean that with PASID (whenever we
get to enabling this mode of operation) we'd need to avoid sharing
page tables, and we'd need to suppress mirroring of EPT insertions
for this range in the IOMMU page tables. (All of this independent
of the particular choice of the APIC access page.)

Jan

