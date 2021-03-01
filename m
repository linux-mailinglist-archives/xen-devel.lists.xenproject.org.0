Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1DF3278FE
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 09:16:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91336.172597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGdik-00086V-T1; Mon, 01 Mar 2021 08:16:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91336.172597; Mon, 01 Mar 2021 08:16:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGdik-000866-PZ; Mon, 01 Mar 2021 08:16:02 +0000
Received: by outflank-mailman (input) for mailman id 91336;
 Mon, 01 Mar 2021 08:16:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m81q=H7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lGdii-000861-TY
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 08:16:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c78fb315-9691-428d-a6ad-545080b2472b;
 Mon, 01 Mar 2021 08:15:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E3B96AA4F;
 Mon,  1 Mar 2021 08:15:58 +0000 (UTC)
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
X-Inumbo-ID: c78fb315-9691-428d-a6ad-545080b2472b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614586559; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5ofFX9alUHmnWh7rLXoiRIRxd5GFw4k820+4nvB8bV0=;
	b=FjVecW7z3QJWG9udQe+smhRa6nGNh5u79uDDsuZM4UzSMiYaJxyNYwWwQtII6mT8AgOJ1g
	4KN1l1uT+diPnzPHFKmw0b/d75pcUFAeEWBGXYVO3UBh+TFYpT/gDxekQ9FAQS9Fya99o+
	JxgnD1nYPNKlGYoDktvkOJudynQBsLc=
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a11878e2-312c-a49a-ebe2-122906fc8d38@suse.com>
Date: Mon, 1 Mar 2021 09:15:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <MWHPR11MB1886E452B181ACA872B7C6878C9A9@MWHPR11MB1886.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01.03.2021 03:18, Tian, Kevin wrote:
>> From: Roger Pau Monné <roger.pau@citrix.com>
>> Sent: Thursday, February 11, 2021 8:27 PM
>>
>> On Thu, Feb 11, 2021 at 12:22:41PM +0100, Jan Beulich wrote:
>>> On 11.02.2021 12:16, Roger Pau Monné wrote:
>>>> On Thu, Feb 11, 2021 at 11:36:59AM +0100, Jan Beulich wrote:
>>>>> On 11.02.2021 09:45, Roger Pau Monné wrote:
>>>>>> On Wed, Feb 10, 2021 at 05:48:26PM +0100, Jan Beulich wrote:
>>>>>>> --- a/xen/include/asm-x86/p2m.h
>>>>>>> +++ b/xen/include/asm-x86/p2m.h
>>>>>>> @@ -935,6 +935,9 @@ static inline unsigned int p2m_get_iommu
>>>>>>>          flags = IOMMUF_readable;
>>>>>>>          if ( !rangeset_contains_singleton(mmio_ro_ranges, mfn_x(mfn)) )
>>>>>>>              flags |= IOMMUF_writable;
>>>>>>> +        /* VMX'es APIC access page is global and hence has no owner.
>> */
>>>>>>> +        if ( mfn_valid(mfn) && !page_get_owner(mfn_to_page(mfn)) )
>>>>>>> +            flags = 0;
>>>>>>
>>>>>> Is it fine to have this page accessible to devices if the page tables
>>>>>> are shared between the CPU and the IOMMU?
>>>>>
>>>>> No, it's not, but what do you do? As said elsewhere, devices
>>>>> gaining more access than is helpful is the price we pay for
>>>>> being able to share page tables. But ...
>>>>
>>>> I'm concerned about allowing devices to write to this shared page, as
>>>> could be used as an unintended way to exchange information between
>>>> domains?
>>>
>>> Well, such an abuse would be possible, but it wouldn't be part
>>> of an ABI and hence could break at any time. Similarly I
>>> wouldn't consider it an information leak if a guest abused
>>> this.
>>
>> Hm, I'm kind of worried about having such shared page accessible to
>> guests. Could Intel confirm whether pages in the 0xFEExxxxx range are
>> accessible to devices in any way when using IOMMU shared page
>> tables?
> 
> 0xFEExxxxx range is special. Requests to this range are not subject to
> DMA remapping (even if a valid mapping for this range exists in the 
> IOMMU page table). And this special treatment is true regardless of
> whether interrupt remapping is enabled (which comes only after an 
> interrupt message to this range is recognized).

For my/our education, could you outline what happens to device
accesses to that range when interrupt remapping is off? And
perhaps also what happens to accesses to this range that don't
match the pattern of an MSI initiation (dword write)? I don't
think I've been able to spot anything to this effect in the docs.

Jan

