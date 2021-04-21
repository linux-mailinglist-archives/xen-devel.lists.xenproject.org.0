Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C14E366814
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 11:34:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114210.217560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9FB-00014B-5h; Wed, 21 Apr 2021 09:34:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114210.217560; Wed, 21 Apr 2021 09:34:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9FB-00013l-2X; Wed, 21 Apr 2021 09:34:01 +0000
Received: by outflank-mailman (input) for mailman id 114210;
 Wed, 21 Apr 2021 09:33:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZ9F9-00013d-C6
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 09:33:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 52777513-d7ed-4682-8ce1-944a3bed9a59;
 Wed, 21 Apr 2021 09:33:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 82556AF88;
 Wed, 21 Apr 2021 09:33:57 +0000 (UTC)
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
X-Inumbo-ID: 52777513-d7ed-4682-8ce1-944a3bed9a59
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618997637; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sj2W1dIWu0VjjkCF4tlltSv17ivQvae8brAXgsZMrU8=;
	b=P1bLkk1g/Qw7rUUdVLlPbna0Ov54HSdVPuO/isaFbGMBC5G6hDvoH7sNLc6ETQkRM1ndu5
	8cCq8G/7qd4HU91WUpg8eqEFieEuP3ZY/WcpaiP86uLwzNOq3BzDIoG4FWnW+KEorCZM2g
	eonPSp+abhf4Fs0EdpsRSX1MM8ylg50=
Subject: Re: [PATCH v2] xen/pci: Refactor PCI MSI interrupts related code
To: Rahul Singh <Rahul.Singh@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: Julien Grall <julien@xen.org>, xen-devel
 <xen-devel@lists.xenproject.org>, Bertrand Marquis
 <Bertrand.Marquis@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <YHg+6rLN0rBWXcTs@Air-de-Roger>
 <788665ad-9815-e3e9-2d5a-851b35c566d0@xen.org>
 <AD2BC1CD-74AF-48FF-8B42-2853C0E7A7BE@arm.com>
 <YH1CBP8At7lVoHCz@Air-de-Roger>
 <a365ffbd-5b88-85c3-9e68-46a9a730a6fa@suse.com>
 <0d5539e3-32e3-8275-f695-351eda49cb29@xen.org>
 <6291effa-1589-1013-e89d-c795bce44d9c@suse.com>
 <D2D9A348-3B21-47FD-A9C6-4C66C5778F11@arm.com>
 <a1beaee4-0d6b-e38e-07f7-90a014c504b6@suse.com>
 <30D00B1B-ECB9-4A5B-ACBD-37E532285CCD@arm.com>
 <YH/fQpgEQyhiaj1Y@Air-de-Roger>
 <DA4D72F4-CD1E-46D0-9D32-D8AB01F445F9@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <106baee5-014a-37bd-c8e9-e06b5db5e0e2@suse.com>
Date: Wed, 21 Apr 2021 11:33:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <DA4D72F4-CD1E-46D0-9D32-D8AB01F445F9@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 21.04.2021 11:15, Rahul Singh wrote:
> Hi Roger,
> 
>> On 21 Apr 2021, at 9:16 am, Roger Pau Monné <roger.pau@citrix.com> wrote:
>>
>> On Wed, Apr 21, 2021 at 08:07:08AM +0000, Rahul Singh wrote:
>>> Hi Jan,
>>>
>>>> On 20 Apr 2021, at 4:36 pm, Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 20.04.2021 15:45, Rahul Singh wrote:
>>>>>> On 19 Apr 2021, at 1:33 pm, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>> On 19.04.2021 13:54, Julien Grall wrote:
>>>>>>> For the time being, I think move this code in x86 is a lot better than 
>>>>>>> #ifdef or keep the code in common code.
>>>>>>
>>>>>> Well, I would perhaps agree if it ended up being #ifdef CONFIG_X86.
>>>>>> I would perhaps not agree if there was a new CONFIG_* which other
>>>>>> (future) arch-es could select if desired.
>>>>>
>>>>> I agree with Julien moving the code to x86 file as currently it is referenced only in x86 code
>>>>> and as of now we are not sure how other architecture will implement the Interrupt remapping
>>>>> (via IOMMU or any other means).  
>>>>>
>>>>> Let me know if you are ok with moving the code to x86.
>>>>
>>>> I can't answer this with "yes" or "no" without knowing what the alternative
>>>> would be. As said, if the alternative is CONFIG_X86 #ifdef-ary, then yes.
>>>> If a separate CONFIG_* gets introduced (and selected by X86), then a
>>>> separate file (getting built only when that new setting is y) would seem
>>>> better to me.
>>>
>>> I just made a quick patch. Please let me know if below patch is ok. I move the definition to  "passthrough/x86/iommu.c” file.
>>>
>>> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
>>> index 705137f8be..199ce08612 100644
>>> --- a/xen/drivers/passthrough/pci.c
>>> +++ b/xen/drivers/passthrough/pci.c
>>> @@ -1303,13 +1303,6 @@ static int __init setup_dump_pcidevs(void)
>>> }
>>> __initcall(setup_dump_pcidevs);
>>>
>>> -int iommu_update_ire_from_msi(
>>> -    struct msi_desc *msi_desc, struct msi_msg *msg)
>>> -{
>>> -    return iommu_intremap
>>> -           ? iommu_call(&iommu_ops, update_ire_from_msi, msi_desc, msg) : 0;
>>> -}
>>> -
>>> static int iommu_add_device(struct pci_dev *pdev)
>>> {
>>>     const struct domain_iommu *hd;
>>> diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
>>> index b90bb31bfe..cf51dec564 100644
>>> --- a/xen/drivers/passthrough/x86/iommu.c
>>> +++ b/xen/drivers/passthrough/x86/iommu.c
>>> @@ -340,6 +340,13 @@ bool arch_iommu_use_permitted(const struct domain *d)
>>>             likely(!p2m_get_hostp2m(d)->global_logdirty));
>>> }
>>>
>>> +int iommu_update_ire_from_msi(
>>> +    struct msi_desc *msi_desc, struct msi_msg *msg)
>>> +{
>>> +    return iommu_intremap
>>> +           ? iommu_call(&iommu_ops, update_ire_from_msi, msi_desc, msg) : 0;
>>> +}
>>> +
>>> /*
>>>  * Local variables:
>>>  * mode: C
>>> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
>>> index ea0cd0f1a2..bd42d87b72 100644
>>> --- a/xen/include/xen/iommu.h
>>> +++ b/xen/include/xen/iommu.h
>>> @@ -243,7 +243,6 @@ struct iommu_ops {
>>>                            u8 devfn, device_t *dev);
>>> #ifdef CONFIG_HAS_PCI
>>>     int (*get_device_group_id)(u16 seg, u8 bus, u8 devfn);
>>> -    int (*update_ire_from_msi)(struct msi_desc *msi_desc, struct msi_msg *msg);
>>> #endif /* HAS_PCI */
>>>
>>>     void (*teardown)(struct domain *d);
>>> @@ -272,6 +271,7 @@ struct iommu_ops {
>>>     int (*adjust_irq_affinities)(void);
>>>     void (*sync_cache)(const void *addr, unsigned int size);
>>>     void (*clear_root_pgtable)(struct domain *d);
>>> +    int (*update_ire_from_msi)(struct msi_desc *msi_desc, struct msi_msg *msg);
>>
>> You also need to move the function prototype
>> (iommu_update_ire_from_msi) from iommu.h into asm-x86/iommu.h, or
>> maybe you could just define the function itself as static inline in
>> asm-x86/iommu.h?
> 
> 
> Ok. I will move function prototype (iommu_update_ire_from_msi) from 
> iommu.h into asm-x86/iommu.h.
> 
> I first tried to make the function as static inline in "asm-x86/iommu.h" but after 
> that I observe the compilation error for debug build because "asm/iommu.h” 
> is included in "xen/iommu.h” before iommu_call() is defined in "xen/iommu.h”.
> That's why I decided to move it to the "passthrough/x86/iommu.c” file.

Which in turn would be an argument for keeping it in xen/iommu.h and
wrap it in an #ifdef.

Jan

