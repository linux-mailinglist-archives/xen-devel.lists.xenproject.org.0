Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBAA24E01E
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 20:56:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k9CBs-0003DL-Aw; Fri, 21 Aug 2020 18:55:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OrCK=B7=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k9CBq-0003DG-Ga
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 18:55:02 +0000
X-Inumbo-ID: 0fc6ea2b-e689-4dcf-9472-d06cb9964983
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0fc6ea2b-e689-4dcf-9472-d06cb9964983;
 Fri, 21 Aug 2020 18:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=CU0FIj2TRT9hIPVsZqj9CPk5nvuaHlo+bCPKrirfhRw=; b=IK0jkvnvysuCBuwNU47+DSiJaJ
 CCm6PiQiYu+ZpeWb5MaFlAKaNNp4Lq6OwuMQRCoJ13umKyaV3A0WMlGTdzjOgx+urpBI8OSv6I7Sz
 DQX8yvUAUJtR5naCWx9acl5YD5RIRQl71bydwEZt4RxCSqJTN+btd+nONniZbKEe5KD4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k9CBc-0006g7-Bo; Fri, 21 Aug 2020 18:54:48 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k9CBb-0000nU-SJ; Fri, 21 Aug 2020 18:54:48 +0000
Subject: Re: [RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature common
To: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr <olekstysh@gmail.com>
Cc: paul@xen.org, xen-devel@lists.xenproject.org,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Jan Beulich' <jbeulich@suse.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Wei Liu' <wl@xen.org>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'Jun Nakajima' <jun.nakajima@intel.com>, 'Kevin Tian'
 <kevin.tian@intel.com>, 'Tim Deegan' <tim@xen.org>,
 'Julien Grall' <julien.grall@arm.com>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-2-git-send-email-olekstysh@gmail.com>
 <000c01d66a33$2bd56510$83802f30$@xen.org>
 <9f83a7ed-ca97-449f-c7b9-a1140644abe9@gmail.com>
 <f0c32cfe-5c33-30ae-b08a-3d72e935745a@xen.org>
 <alpine.DEB.2.21.2008041105510.5748@sstabellini-ThinkPad-T480s>
 <5df97055-67f9-16cc-a274-864672d67164@xen.org>
 <alpine.DEB.2.21.2008051121580.5748@sstabellini-ThinkPad-T480s>
 <1afb9ffd-088c-ef4e-131a-0f2b62142405@xen.org>
 <alpine.DEB.2.21.2008061352141.16004@sstabellini-ThinkPad-T480s>
 <598e2f35-e70e-36a7-1e5d-259ebb2e3cde@xen.org>
 <alpine.DEB.2.21.2008101433050.16004@sstabellini-ThinkPad-T480s>
 <3e9c1820-5a75-49d7-0a97-4c24b20986c3@xen.org>
 <alpine.DEB.2.21.2008111446500.15669@sstabellini-ThinkPad-T480s>
 <19d27a9a-ca14-cb86-52a1-6441bd24933a@xen.org>
 <30bf5755-8324-7612-9392-1a25a361e69f@gmail.com>
 <alpine.DEB.2.21.2008201620360.6005@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <4cbe37bd-abd2-3d02-535e-cca6f7497ef2@xen.org>
Date: Fri, 21 Aug 2020 19:54:44 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2008201620360.6005@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Stefano,

On 21/08/2020 01:53, Stefano Stabellini wrote:
> On Thu, 20 Aug 2020, Oleksandr wrote:
>>> On 11/08/2020 23:48, Stefano Stabellini wrote:
>>>>> I have the impression that we disagree in what the Device Emulator is
>>>>> meant to
>>>>> do. IHMO, the goal of the device emulator is to emulate a device in an
>>>>> arch-agnostic way.
>>>>
>>>> That would be great in theory but I am not sure it is achievable: if we
>>>> use an existing emulator like QEMU, even a single device has to fit
>>>> into QEMU's view of the world, which makes assumptions about host
>>>> bridges and apertures. It is impossible today to build QEMU in an
>>>> arch-agnostic way, it has to be tied to an architecture.
>>>
>>> AFAICT, the only reason QEMU cannot build be in an arch-agnostic way is
>>> because of TCG. If this wasn't built then you could easily write a machine
>>> that doesn't depend on the instruction set.
>>>
>>> The proof is, today, we are using QEMU x86 to serve Arm64 guest. Although
>>> this is only for PV drivers.
>>>
>>>>
>>>> I realize we are not building this interface for QEMU specifically, but
>>>> even if we try to make the interface arch-agnostic, in reality the
>>>> emulators won't be arch-agnostic.
>>>
>>> This depends on your goal. If your goal is to write a standalone emulator
>>> for a single device, then it is entirely possible to make it arch-agnostic.
>>>
>>> Per above, this would even be possible if you were emulating a set of
>>> devices.
>>>
>>> What I want to avoid is requiring all the emulators to contain arch-specific
>>> code just because it is easier to get QEMU working on Xen on Arm.
>>>
>>>> If we send a port-mapped I/O request
>>>> to qemu-system-aarch64 who knows what is going to happen: it is a code
>>>> path that it is not explicitly tested.
>>>
>>> Maybe, maybe not. To me this is mostly software issues that can easily be
>>> mitigated if we do proper testing...
>>
>> Could we please find a common ground on whether the PIO handling needs to be
>> implemented on Arm or not? At least for the current patch series.
> 
> Can you do a test on QEMU to verify which address space the PIO BARs are
> using on ARM? I don't know if there is an easy way to test it but it
> would be very useful for this conversation.

This is basically configured by the machine itself. See create_pcie() in 
hw/arm/virt.c.

So the hostcontroller is basically unaware that a MMIO region will be 
used instead of a PIO region.

> 
> 
>> Below my thoughts:
>>  From one side I agree that emulator shouldn't contain any arch-specific code,
>> yes it is hypervisor specific but it should be arch agnostic if possible. So
>> PIO case should be handled.
>>  From other side I tend to think that it might be possible to skip PIO handling
>> for the current patch series (leave it x86 specific for now as we do with
>> handle_realmode_completion()).
>> I think nothing will prevent us from adding PIO handling later on if there is
>> a real need (use-case) for that. Please correct me if I am wrong.
>>
>> I would be absolutely OK with any options.
>>
>> What do you think?
> 
> I agree that PIO handling is not the most critical thing right now given
> that we have quite a few other important TODOs in the series. I'd be
> fine reviewing another version of the series with this issue still
> pending.

For Arm64, the main user will be PCI. So this can be delayed until we 
add support for vPCI.

> 
> 
> Of course, PIO needs to be handled. The key to me is that QEMU (or other
> emulator) should *not* emulate in/out instructions on ARM.

I don't think anyone here suggested that we would emulate in/out 
instructions on Arm. There is actually none of them.

>  PIO ioreq
> requests should not be satisfied by using address_space_io directly (the
> PIO address space that requires special instructions to access it). In
> QEMU the PIO reads/writes should be done via address_space_memory (the
> normal memory mapped address space).
> 
> So either way of the following approaches should be OK:
> 
> 1) Xen sends out PIO addresses as memory mapped addresses, QEMU simply
>     reads/writes on them
> 2) Xen sends out PIO addresses as address_space_io, QEMU finds the
>     mapping to address_space_memory, then reads/writes on
>     address_space_memory
> 
>  From an interface and implementation perspective, 1) means that
> IOREQ_TYPE_PIO is unused on ARM, while 2) means that IOREQ_TYPE_PIO is
> still used as part of the ioreq interface, even if QEMU doesn't directly
> operate on those addresses.
> 
> My preference is 1) because it leads to a simpler solution.

"simpler" is actually very subjective :). So maybe you can clarify some 
of my concerns with this approach.

One part that have been barely discussed is the configuration part.

The discussion below is based on having the virtual PCI hostbridges 
implemented in Xen.

In the case of MMIO BAR, then the emulator doesn't need to know where is 
aperture in advance. This is because the BAR will contain the an 
absolute MMIO address so it can configure the trap correctly.

In the case of PIO BAR, from my understanding, the BAR will contain a 
relative offset from the base of PIO aperture. So the emulator needs to 
know the base address of the PIO aperture. How do you plan to pass the 
information to emulator? How about the case where there are multiple 
hostbridges?

Furthermore, most of the discussions has been focused towards device 
model that will provide emulation for all your devices (e.g. QEMU). 
However, I think this is going to be less common of device model that 
will emulate a single device (e.g. DEMU). This fits more in the 
disaggregation model.

An emulator for a single PCI device is basically the same as a real PCI 
device. Do you agree with that?

The HW engineer designing the PCI device doesn't need to know about the 
architecture. It just needs to understand the interface with the 
hostbridge. The hostbridge will then take care of the differences with 
the architecture.

A developper should really be able to do the same with the emulator. 
I.e. write it for x86 and then just recompile for Arm. With your 
approach, he/she would have to understand how the architecture works.

I still don't quite understand why we are trying to differ here. Why 
would our hostbridge implementation would not abstract the same way as a 
real one does? Can you clarify it?

Maybe the problem is just the naming issue?

Cheers,

-- 
Julien Grall

