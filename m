Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 892807EF779
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 19:30:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635354.991232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r43bW-0006AU-34; Fri, 17 Nov 2023 18:30:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635354.991232; Fri, 17 Nov 2023 18:30:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r43bW-00068M-0K; Fri, 17 Nov 2023 18:30:10 +0000
Received: by outflank-mailman (input) for mailman id 635354;
 Fri, 17 Nov 2023 18:30:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r43bU-00068G-5I
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 18:30:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r43bQ-0006AP-2G; Fri, 17 Nov 2023 18:30:04 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.17.66]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r43bP-0001e9-Rf; Fri, 17 Nov 2023 18:30:03 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=QsEAN6NLU6dZsKSF6Jqz+IYBctAEEtO6lnm/DI0Ghbg=; b=pCYDC3bsZVhcVVATt4+L0ABIeJ
	SA0mV5sjBtfQ6cRdHpZJKydYARwbIPkJGDpJuinZjDatOkt9edQrCMAuXvflx3iA/CNX98zah2Bnk
	edLy8IJ+Od+tzW+42sT0GC+9Rj7Xzzp3NHS/C42vHlRoDP6pVcYGOq0egrNE5dq21ZAE=;
Message-ID: <770aaef8-09f4-480a-95b8-cc0448ad07ff@xen.org>
Date: Fri, 17 Nov 2023 18:30:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 13/17] vpci: add initial support for virtual PCI bus
 topology
Content-Language: en-GB
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
 <20231012220854.2736994-14-volodymyr_babchuk@epam.com>
 <d6a58e73-da51-40f1-a2f7-576274945585@xen.org>
 <alpine.DEB.2.22.394.2311161513210.773207@ubuntu-linux-20-04-desktop>
 <87o7ft44bv.fsf@epam.com>
 <alpine.DEB.2.22.394.2311161651090.773207@ubuntu-linux-20-04-desktop>
 <87a5rc4gk7.fsf@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <87a5rc4gk7.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Volodymyr,

On 17/11/2023 14:09, Volodymyr Babchuk wrote:
> 
> Hi Stefano,
> 
> Stefano Stabellini <sstabellini@kernel.org> writes:
> 
>> On Fri, 17 Nov 2023, Volodymyr Babchuk wrote:
>>>> I still think, no matter the BDF allocation scheme, that we should try
>>>> to avoid as much as possible to have two different PCI Root Complex
>>>> emulators. Ideally we would have only one PCI Root Complex emulated by
>>>> Xen. Having 2 PCI Root Complexes both of them emulated by Xen would be
>>>> tolerable but not ideal.
>>>
>>> But what is exactly wrong with this setup?
>>
>> [...]
>>
>>>> The worst case I would like to avoid is to have
>>>> two PCI Root Complexes, one emulated by Xen and one emulated by QEMU.
>>>
>>> This is how our setup works right now.
>>
>> If we have:
>> - a single PCI Root Complex emulated in Xen
>> - Xen is safety certified
>> - individual Virtio devices emulated by QEMU with grants for memory
>>
>> We can go very far in terms of being able to use Virtio in safety
>> use-cases. We might even be able to use Virtio (frontends) in a SafeOS.
>>
>> On the other hand if we put an additional Root Complex in QEMU:
>> - we pay a price in terms of complexity of the codebase
>> - we pay a price in terms of resource utilization
>> - we have one additional problem in terms of using this setup with a
>>    SafeOS (one more device emulated by a non-safe component)
>>
>> Having 2 PCI Root Complexes both emulated in Xen is a middle ground
>> solution because:
>> - we still pay a price in terms of resource utilization
>> - the code complexity goes up a bit but hopefully not by much
>> - there is no impact on safety compared to the ideal scenario
>>
>> This is why I wrote that it is tolerable.
> 
> Ah, I see now. Yes, I am agree with this. Also I want to add some more
> points:
> 
> - There is ongoing work on implementing virtio backends as a separate
>    applications, written in Rust. Linaro are doing this part. Right now
>    they are implementing only virtio-mmio, but if they want to provide
>    virtio-pci as well, they will need a mechanism to plug only
>    virtio-pci, without Root Complex. This is argument for using single Root
>    Complex emulated in Xen.
> 
> - As far as I know (actually, Oleksandr told this to me), QEMU has no
>    mechanism for exposing virtio-pci backends without exposing PCI root
>    complex as well. Architecturally, there should be a PCI bus to which
>    virtio-pci devices are connected. Or we need to make some changes to
>    QEMU internals to be able to create virtio-pci backends that are not
>    connected to any bus. Also, added benefit that PCI Root Complex
>    emulator in QEMU handles legacy PCI interrupts for us. This is
>    argument for separate Root Complex for QEMU.
> 
> As right now we have only virtio-pci backends provided by QEMU and this
> setup is already working, I propose to stick to this
> solution. Especially, taking into account that it does not require any
> changes to hypervisor code.

I am not against two hostbridge as a temporary solution as long as this 
is not a one way door decision. I am not concerned about the hypervisor 
itself, I am more concerned about the interface exposed by the toolstack 
and QEMU.

To clarify, I don't particular want to have to maintain the two 
hostbridges solution once we can use a single hostbridge. So we need to 
be able to get rid of it without impacting the interface too much.

Cheers,

-- 
Julien Grall

