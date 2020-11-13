Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 918BB2B195F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 11:51:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26322.54604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdWfO-0004yK-IQ; Fri, 13 Nov 2020 10:50:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26322.54604; Fri, 13 Nov 2020 10:50:54 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdWfO-0004xv-F0; Fri, 13 Nov 2020 10:50:54 +0000
Received: by outflank-mailman (input) for mailman id 26322;
 Fri, 13 Nov 2020 10:50:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5p9l=ET=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kdWfN-0004xq-KB
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 10:50:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b77ede33-2ab6-42a3-9d26-50af521537b3;
 Fri, 13 Nov 2020 10:50:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A25DEAED6;
 Fri, 13 Nov 2020 10:50:51 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5p9l=ET=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kdWfN-0004xq-KB
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 10:50:53 +0000
X-Inumbo-ID: b77ede33-2ab6-42a3-9d26-50af521537b3
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b77ede33-2ab6-42a3-9d26-50af521537b3;
	Fri, 13 Nov 2020 10:50:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605264651; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LG+BPsY8bYqXw53+N/Hf+2Azim0UnBMMkFdkLxR89f4=;
	b=gwixdMqLBFLBxSbrknwADduUuN3KK8AlxbyxmQRKyu8liM/iim6Addjt/7bL3cEiKjar2C
	wnZKTTajEkazygDRg7QUMlxROqSy+BDqPyisHKpnV03yhRBmiKbu21qPyE1K9waQM0J6Xg
	UA+59abuXUuEOnfnyO2oBBbTkwAFjrs=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A25DEAED6;
	Fri, 13 Nov 2020 10:50:51 +0000 (UTC)
Subject: Re: [PATCH 06/10] vpci: Make every domain handle its own BARs
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: Oleksandr Andrushchenko <andr2000@gmail.com>,
 "Rahul.Singh@arm.com" <Rahul.Singh@arm.com>,
 "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "iwj@xenproject.org" <iwj@xenproject.org>, "wl@xen.org" <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20201109125031.26409-1-andr2000@gmail.com>
 <20201109125031.26409-7-andr2000@gmail.com>
 <20201112094002.bzk6gvp4iy4dgj4s@Air-de-Roger>
 <1b3f11c2-a5a2-da5c-25b3-851ef9465ab9@epam.com>
 <20201112144643.iyy5b34qyz5zi7mc@Air-de-Roger>
 <1fe15b9a-6f5d-1209-8ff5-af7c4fc0d637@epam.com>
 <b4697fbe-6896-ed64-409d-85620c08904a@suse.com>
 <3d6e5aab-ff89-7859-09c6-5ecb0c052511@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1c88fef1-8558-fde1-02c7-8a68f6ecf312@suse.com>
Date: Fri, 13 Nov 2020 11:50:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <3d6e5aab-ff89-7859-09c6-5ecb0c052511@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 13.11.2020 11:46, Oleksandr Andrushchenko wrote:
> On 11/13/20 12:25 PM, Jan Beulich wrote:
>> On 13.11.2020 07:32, Oleksandr Andrushchenko wrote:
>>> On 11/12/20 4:46 PM, Roger Pau Monné wrote:
>>>> On Thu, Nov 12, 2020 at 01:16:10PM +0000, Oleksandr Andrushchenko wrote:
>>>>> On 11/12/20 11:40 AM, Roger Pau Monné wrote:
>>>>>> On Mon, Nov 09, 2020 at 02:50:27PM +0200, Oleksandr Andrushchenko wrote:
>>>>>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>>>>> +static uint32_t bar_read_dispatch(const struct pci_dev *pdev, unsigned int reg,
>>>>>>> +                                  void *data)
>>>>>>> +{
>>>>>>> +    struct vpci_bar *vbar, *bar = data;
>>>>>>> +
>>>>>>> +    if ( is_hardware_domain(current->domain) )
>>>>>>> +        return bar_read_hwdom(pdev, reg, data);
>>>>>>> +
>>>>>>> +    vbar = get_vpci_bar(current->domain, pdev, bar->index);
>>>>>>> +    if ( !vbar )
>>>>>>> +        return ~0;
>>>>>>> +
>>>>>>> +    return bar_read_guest(pdev, reg, vbar);
>>>>>>> +}
>>>>>>> +
>>>>>>> +static void bar_write_dispatch(const struct pci_dev *pdev, unsigned int reg,
>>>>>>> +                               uint32_t val, void *data)
>>>>>>> +{
>>>>>>> +    struct vpci_bar *bar = data;
>>>>>>> +
>>>>>>> +    if ( is_hardware_domain(current->domain) )
>>>>>>> +        bar_write_hwdom(pdev, reg, val, data);
>>>>>>> +    else
>>>>>>> +    {
>>>>>>> +        struct vpci_bar *vbar = get_vpci_bar(current->domain, pdev, bar->index);
>>>>>>> +
>>>>>>> +        if ( !vbar )
>>>>>>> +            return;
>>>>>>> +        bar_write_guest(pdev, reg, val, vbar);
>>>>>>> +    }
>>>>>>> +}
>>>>>> You should assign different handlers based on whether the domain that
>>>>>> has the device assigned is a domU or the hardware domain, rather than
>>>>>> doing the selection here.
>>>>> Hm, handlers are assigned once in init_bars and this function is only called
>>>>>
>>>>> for hwdom, so there is no way I can do that for the guests. Hence, the dispatcher
>>>> I think we might want to reset the vPCI handlers when a devices gets
>>>> assigned and deassigned.
>>> In ARM case init_bars is called too early: PCI device assignment is currently
>>>
>>> initiated by Domain-0' kernel and is done *before* PCI devices are given memory
>>>
>>> ranges and BARs assigned:
>>>
>>> [    0.429514] pci_bus 0000:00: root bus resource [bus 00-ff]
>>> [    0.429532] pci_bus 0000:00: root bus resource [io 0x0000-0xfffff]
>>> [    0.429555] pci_bus 0000:00: root bus resource [mem 0xfe200000-0xfe3fffff]
>>> [    0.429575] pci_bus 0000:00: root bus resource [mem 0x30000000-0x37ffffff]
>>> [    0.429604] pci_bus 0000:00: root bus resource [mem 0x38000000-0x3fffffff pref]
>>> [    0.429670] pci 0000:00:00.0: enabling Extended Tags
>>> [    0.453764] pci 0000:00:00.0: -------------------- BUS_NOTIFY_ADD_DEVICE
>>>
>>> < init_bars >
>>>
>>> [    0.453793] pci 0000:00:00.0: -- IRQ 0
>>> [    0.458825] pci 0000:00:00.0: Failed to add - passthrough or MSI/MSI-X might fail!
>>> [    0.471790] pci 0000:01:00.0: -------------------- BUS_NOTIFY_ADD_DEVICE
>>>
>>> < init_bars >
>>>
>>> [    0.471821] pci 0000:01:00.0: -- IRQ 255
>>> [    0.476809] pci 0000:01:00.0: Failed to add - passthrough or MSI/MSI-X might fail!
>>>
>>> < BAR assignments below >
>>>
>>> [    0.488233] pci 0000:00:00.0: BAR 14: assigned [mem 0xfe200000-0xfe2fffff]
>>> [    0.488265] pci 0000:00:00.0: BAR 15: assigned [mem 0x38000000-0x380fffff pref]
>>>
>>> In case of x86 this is pretty much ok as BARs are already in place, but for ARM we
>>>
>>> need to take care and re-setup vPCI BARs for hwdom.
>> Even on x86 there's no guarantee that all devices have their BARs set
>> up by firmware.
> 
> This is true. But there you could have config space trapped in "x86 generic way",
> 
> please correct me if I'm wrong here
> 
>>
>> In a subsequent reply you've suggested to move init_bars from "add" to
>> "assign", but I'm having trouble seeing what this would change: It's
>> not Dom0 controlling assignment (to itself), but Xen assigns the device
>> towards the end of pci_add_device().
> 
> PHYSDEVOP_pci_device_add vs XEN_DOMCTL_assign_device
> 
> Currently we initialize BARs during PHYSDEVOP_pci_device_add and
> 
> if we do that during XEN_DOMCTL_assign_device things seem to change

But there can't possibly be any XEN_DOMCTL_assign_device involved in
booting of Dom0. 

>>>>    In order to do passthrough to domUs safely
>>>> we will have to add more handlers than what's required for dom0,
>>> Can you please tell what are thinking about? What are the missing handlers?
>>>>    and
>>>> having is_hardware_domain sprinkled in all of them is not a suitable
>>>> solution.
>>> I'll try to replace is_hardware_domain with something like:
>>>
>>> +/*
>>> + * Detect whether physical PCI devices in this segment belong
>>> + * to the domain given, e.g. on x86 all PCI devices live in hwdom,
>>> + * but in case of ARM this might not be the case: those may also
>>> + * live in driver domains or even Xen itself.
>>> + */
>>> +bool pci_is_hardware_domain(struct domain *d, u16 seg)
>>> +{
>>> +#ifdef CONFIG_X86
>>> +    return is_hardware_domain(d);
>>> +#elif CONFIG_ARM
>>> +    return pci_is_owner_domain(d, seg);
>>> +#else
>>> +#error "Unsupported architecture"
>>> +#endif
>>> +}
>>> +
>>> +/*
>>> + * Get domain which owns this segment: for x86 this is always hardware
>>> + * domain and for ARM this can be different.
>>> + */
>>> +struct domain *pci_get_hardware_domain(u16 seg)
>>> +{
>>> +#ifdef CONFIG_X86
>>> +    return hardware_domain;
>>> +#elif CONFIG_ARM
>>> +    return pci_get_owner_domain(seg);
>>> +#else
>>> +#error "Unsupported architecture"
>>> +#endif
>>> +}
>>>
>>> This is what I use to properly detect the domain that really owns physical host bridge
>> I consider this problematic. We should try to not let Arm's and x86'es
>> PCI implementations diverge too much, i.e. at least the underlying basic
>> model would better be similar. For example, if entire segments can be
>> assigned to a driver domain on Arm, why should the same not be possible
>> on x86?
> 
> Good question, probably in this case x86 == ARM and I can use
> 
> pci_is_owner_domain for both architectures instead of using is_hardware_domain for x86
> 
>>
>> Furthermore I'm suspicious about segments being the right granularity
>> here. On ia64 multiple host bridges could (and typically would) live
>> on segment 0. Iirc I had once seen output from an x86 system which was
>> apparently laid out similarly. Therefore, just like for MCFG, I think
>> the granularity wants to be bus ranges within a segment.
> Can you please suggest something we can use as a hint for such a detection logic?

The underlying information comes from ACPI tables, iirc. I don't
recall the details, though - sorry.

Jan

