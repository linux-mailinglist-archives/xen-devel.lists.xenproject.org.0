Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3272B1961
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 11:53:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26328.54616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdWhq-00059t-2n; Fri, 13 Nov 2020 10:53:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26328.54616; Fri, 13 Nov 2020 10:53:26 +0000
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
	id 1kdWhp-00059U-Vq; Fri, 13 Nov 2020 10:53:25 +0000
Received: by outflank-mailman (input) for mailman id 26328;
 Fri, 13 Nov 2020 10:53:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5p9l=ET=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kdWho-00059P-LL
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 10:53:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7954e1db-e69d-4d60-965c-f70116b9a15f;
 Fri, 13 Nov 2020 10:53:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B94C1ABD1;
 Fri, 13 Nov 2020 10:53:22 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5p9l=ET=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kdWho-00059P-LL
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 10:53:24 +0000
X-Inumbo-ID: 7954e1db-e69d-4d60-965c-f70116b9a15f
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7954e1db-e69d-4d60-965c-f70116b9a15f;
	Fri, 13 Nov 2020 10:53:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605264802; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6i8swCRsHitjS9eQ4seJE16XU4kwrVEDUZy0+7L7ddI=;
	b=hpDvlPDFqitZVuv0CgVmHIprxQclEkXtkKwSA6VKOi682JmCzE3tE4o/y0PBG4bgcX7eMB
	N+iwLB88RMfW62o+3BsxeuJnWawOBINC+NQ3YRg1RmStOWhoCtUnETV1E8kiR95iGCRWta
	wGbQWnJfCEKvx6RR78VAZ5zlyVFmma0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B94C1ABD1;
	Fri, 13 Nov 2020 10:53:22 +0000 (UTC)
Subject: Re: [PATCH 06/10] vpci: Make every domain handle its own BARs
To: Julien Grall <julien@xen.org>
Cc: Oleksandr Andrushchenko <andr2000@gmail.com>,
 "Rahul.Singh@arm.com" <Rahul.Singh@arm.com>,
 "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "iwj@xenproject.org" <iwj@xenproject.org>, "wl@xen.org" <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
References: <20201109125031.26409-1-andr2000@gmail.com>
 <20201109125031.26409-7-andr2000@gmail.com>
 <20201112094002.bzk6gvp4iy4dgj4s@Air-de-Roger>
 <1b3f11c2-a5a2-da5c-25b3-851ef9465ab9@epam.com>
 <20201112144643.iyy5b34qyz5zi7mc@Air-de-Roger>
 <1fe15b9a-6f5d-1209-8ff5-af7c4fc0d637@epam.com>
 <b4697fbe-6896-ed64-409d-85620c08904a@suse.com>
 <fd656848-1eda-686d-d74c-f10e3ecfe49a@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <093f0acd-3ddb-84c7-a06e-c75de90ba288@suse.com>
Date: Fri, 13 Nov 2020 11:53:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <fd656848-1eda-686d-d74c-f10e3ecfe49a@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 13.11.2020 11:36, Julien Grall wrote:
> On 13/11/2020 10:25, Jan Beulich wrote:
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
>>>
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
>>
>> Even on x86 there's no guarantee that all devices have their BARs set
>> up by firmware.
>>
>> In a subsequent reply you've suggested to move init_bars from "add" to
>> "assign", but I'm having trouble seeing what this would change: It's
>> not Dom0 controlling assignment (to itself), but Xen assigns the device
>> towards the end of pci_add_device().
>>
>>> Things are getting even more
>>>
>>> complicated if the host PCI bridge is not ECAM like, so you cannot set mmio_handlers
>>>
>>> and trap hwdom's access to the config space to update BARs etc. This is why I have that
>>>
>>> ugly hack for rcar_gen3 to read actual BARs for hwdom.
>>
>> How to config space accesses work there? The latest for MSI/MSI-X it'll
>> be imperative that Xen be able to intercept config space writes.
> 
> I am not sure to understand your last sentence. Are you saying that we 
> always need to trap access to MSI/MSI-X message in order to sanitize it?
> 
> If one is using the GICv3 ITS (I haven't investigated other MSI 
> controller), then I don't believe you need to sanitize the MSI/MSI-X 
> message in most of the situation.

Well, if it's fine for the guest to write arbitrary values to message
address and message data, _and_ to arbitrarily enable/disable MSI / MSI-X,
then yes, no interception would be needed.

Jan

