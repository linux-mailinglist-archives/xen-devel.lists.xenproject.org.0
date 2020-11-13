Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C40B2B192A
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 11:36:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26283.54538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdWRE-0002kC-3o; Fri, 13 Nov 2020 10:36:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26283.54538; Fri, 13 Nov 2020 10:36:16 +0000
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
	id 1kdWRE-0002jq-0T; Fri, 13 Nov 2020 10:36:16 +0000
Received: by outflank-mailman (input) for mailman id 26283;
 Fri, 13 Nov 2020 10:36:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kdWRC-0002jl-Ew
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 10:36:14 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kdWRC-0001LK-0x; Fri, 13 Nov 2020 10:36:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kdWRC-0002jl-Ew
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 10:36:14 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kdWRC-0001LK-0x; Fri, 13 Nov 2020 10:36:14 +0000
Subject: Re: [PATCH 06/10] vpci: Make every domain handle its own BARs
To: Jan Beulich <jbeulich@suse.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
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
From: Julien Grall <julien@xen.org>
Message-ID: <fd656848-1eda-686d-d74c-f10e3ecfe49a@xen.org>
Date: Fri, 13 Nov 2020 10:36:11 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <b4697fbe-6896-ed64-409d-85620c08904a@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 13/11/2020 10:25, Jan Beulich wrote:
> On 13.11.2020 07:32, Oleksandr Andrushchenko wrote:
>> On 11/12/20 4:46 PM, Roger Pau Monné wrote:
>>> On Thu, Nov 12, 2020 at 01:16:10PM +0000, Oleksandr Andrushchenko wrote:
>>>> On 11/12/20 11:40 AM, Roger Pau Monné wrote:
>>>>> On Mon, Nov 09, 2020 at 02:50:27PM +0200, Oleksandr Andrushchenko wrote:
>>>>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>>>> +static uint32_t bar_read_dispatch(const struct pci_dev *pdev, unsigned int reg,
>>>>>> +                                  void *data)
>>>>>> +{
>>>>>> +    struct vpci_bar *vbar, *bar = data;
>>>>>> +
>>>>>> +    if ( is_hardware_domain(current->domain) )
>>>>>> +        return bar_read_hwdom(pdev, reg, data);
>>>>>> +
>>>>>> +    vbar = get_vpci_bar(current->domain, pdev, bar->index);
>>>>>> +    if ( !vbar )
>>>>>> +        return ~0;
>>>>>> +
>>>>>> +    return bar_read_guest(pdev, reg, vbar);
>>>>>> +}
>>>>>> +
>>>>>> +static void bar_write_dispatch(const struct pci_dev *pdev, unsigned int reg,
>>>>>> +                               uint32_t val, void *data)
>>>>>> +{
>>>>>> +    struct vpci_bar *bar = data;
>>>>>> +
>>>>>> +    if ( is_hardware_domain(current->domain) )
>>>>>> +        bar_write_hwdom(pdev, reg, val, data);
>>>>>> +    else
>>>>>> +    {
>>>>>> +        struct vpci_bar *vbar = get_vpci_bar(current->domain, pdev, bar->index);
>>>>>> +
>>>>>> +        if ( !vbar )
>>>>>> +            return;
>>>>>> +        bar_write_guest(pdev, reg, val, vbar);
>>>>>> +    }
>>>>>> +}
>>>>> You should assign different handlers based on whether the domain that
>>>>> has the device assigned is a domU or the hardware domain, rather than
>>>>> doing the selection here.
>>>> Hm, handlers are assigned once in init_bars and this function is only called
>>>>
>>>> for hwdom, so there is no way I can do that for the guests. Hence, the dispatcher
>>> I think we might want to reset the vPCI handlers when a devices gets
>>> assigned and deassigned.
>>
>> In ARM case init_bars is called too early: PCI device assignment is currently
>>
>> initiated by Domain-0' kernel and is done *before* PCI devices are given memory
>>
>> ranges and BARs assigned:
>>
>> [    0.429514] pci_bus 0000:00: root bus resource [bus 00-ff]
>> [    0.429532] pci_bus 0000:00: root bus resource [io 0x0000-0xfffff]
>> [    0.429555] pci_bus 0000:00: root bus resource [mem 0xfe200000-0xfe3fffff]
>> [    0.429575] pci_bus 0000:00: root bus resource [mem 0x30000000-0x37ffffff]
>> [    0.429604] pci_bus 0000:00: root bus resource [mem 0x38000000-0x3fffffff pref]
>> [    0.429670] pci 0000:00:00.0: enabling Extended Tags
>> [    0.453764] pci 0000:00:00.0: -------------------- BUS_NOTIFY_ADD_DEVICE
>>
>> < init_bars >
>>
>> [    0.453793] pci 0000:00:00.0: -- IRQ 0
>> [    0.458825] pci 0000:00:00.0: Failed to add - passthrough or MSI/MSI-X might fail!
>> [    0.471790] pci 0000:01:00.0: -------------------- BUS_NOTIFY_ADD_DEVICE
>>
>> < init_bars >
>>
>> [    0.471821] pci 0000:01:00.0: -- IRQ 255
>> [    0.476809] pci 0000:01:00.0: Failed to add - passthrough or MSI/MSI-X might fail!
>>
>> < BAR assignments below >
>>
>> [    0.488233] pci 0000:00:00.0: BAR 14: assigned [mem 0xfe200000-0xfe2fffff]
>> [    0.488265] pci 0000:00:00.0: BAR 15: assigned [mem 0x38000000-0x380fffff pref]
>>
>> In case of x86 this is pretty much ok as BARs are already in place, but for ARM we
>>
>> need to take care and re-setup vPCI BARs for hwdom.
> 
> Even on x86 there's no guarantee that all devices have their BARs set
> up by firmware.
> 
> In a subsequent reply you've suggested to move init_bars from "add" to
> "assign", but I'm having trouble seeing what this would change: It's
> not Dom0 controlling assignment (to itself), but Xen assigns the device
> towards the end of pci_add_device().
> 
>> Things are getting even more
>>
>> complicated if the host PCI bridge is not ECAM like, so you cannot set mmio_handlers
>>
>> and trap hwdom's access to the config space to update BARs etc. This is why I have that
>>
>> ugly hack for rcar_gen3 to read actual BARs for hwdom.
> 
> How to config space accesses work there? The latest for MSI/MSI-X it'll
> be imperative that Xen be able to intercept config space writes.

I am not sure to understand your last sentence. Are you saying that we 
always need to trap access to MSI/MSI-X message in order to sanitize it?

If one is using the GICv3 ITS (I haven't investigated other MSI 
controller), then I don't believe you need to sanitize the MSI/MSI-X 
message in most of the situation.

Cheers,

-- 
Julien Grall

