Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CB0453920
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 19:02:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226520.391459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn2mr-00017S-IE; Tue, 16 Nov 2021 18:02:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226520.391459; Tue, 16 Nov 2021 18:02:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn2mr-00014p-F6; Tue, 16 Nov 2021 18:02:29 +0000
Received: by outflank-mailman (input) for mailman id 226520;
 Tue, 16 Nov 2021 18:02:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mn2mp-00014j-Jq
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 18:02:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mn2mm-0001Mc-Kv; Tue, 16 Nov 2021 18:02:24 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=[10.85.43.125])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mn2mm-0002hL-EK; Tue, 16 Nov 2021 18:02:24 +0000
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
	bh=XLCjBk8zbBOIqdNHN7ODoQFXK0AHmrQNVqt4z9JPZDc=; b=FLQsKqKnXho1mUY1YskGqUvNPq
	oQ8HSPIgUeFwXivWFq28EiAxyTEP3X/c9JHJE2lpJFfIakcU4Pu96NQhAa0Li+SiuuBYDf0GeYzjZ
	SAhLC1eNEQ5RFuxNj0UHpHB3OTVJoYSFKH3uAU7/BrVbrFRHZX7vcrG/SZVJAcBRZlgI=;
Message-ID: <8168668f-c89b-cc5b-295f-1d472164a5f6@xen.org>
Date: Tue, 16 Nov 2021 18:02:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Jan Beulich <jbeulich@suse.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-3-andr2000@gmail.com>
 <5bd70935-4968-b8d4-4d6c-7ec0fc54ee6a@suse.com>
 <4e12f7de-19cb-bc79-4df0-6fb52538a944@epam.com>
 <5b47cd28-5264-9f24-38a0-e9dec6c2c1b4@suse.com>
 <b87a51d2-cd96-d0ac-8718-7f2b2feed531@epam.com>
 <ad01ebdc-7fb8-3c76-d953-08b73b4b0c25@epam.com>
 <fc1fdee4-e567-038f-a90b-127548a8da02@suse.com>
 <55a95ff3-6717-780b-25f9-c43728b6270b@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <55a95ff3-6717-780b-25f9-c43728b6270b@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 16/11/2021 14:24, Oleksandr Andrushchenko wrote:
> 
> 
> On 16.11.21 16:12, Jan Beulich wrote:
>> On 16.11.2021 14:41, Oleksandr Andrushchenko wrote:
>>>
>>> On 16.11.21 10:23, Oleksandr Andrushchenko wrote:
>>>> On 16.11.21 10:01, Jan Beulich wrote:
>>>>> On 16.11.2021 08:32, Oleksandr Andrushchenko wrote:
>>>>>> On 15.11.21 18:56, Jan Beulich wrote:
>>>>>>> On 05.11.2021 07:56, Oleksandr Andrushchenko wrote:
>>>>>>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>>>>>>
>>>>>>>> When a vPCI is removed for a PCI device it is possible that we have
>>>>>>>> scheduled a delayed work for map/unmap operations for that device.
>>>>>>>> For example, the following scenario can illustrate the problem:
>>>>>>>>
>>>>>>>> pci_physdev_op
>>>>>>>>         pci_add_device
>>>>>>>>             init_bars -> modify_bars -> defer_map -> raise_softirq(SCHEDULE_SOFTIRQ)
>>>>>>>>         iommu_add_device <- FAILS
>>>>>>>>         vpci_remove_device -> xfree(pdev->vpci)
>>>>>>>>
>>>>>>>> leave_hypervisor_to_guest
>>>>>>>>         vpci_process_pending: v->vpci.mem != NULL; v->vpci.pdev->vpci == NULL
>>>>>>>>
>>>>>>>> For the hardware domain we continue execution as the worse that
>>>>>>>> could happen is that MMIO mappings are left in place when the
>>>>>>>> device has been deassigned
>>>>>>> Is continuing safe in this case? I.e. isn't there the risk of a NULL
>>>>>>> deref?
>>>>>> I think it is safe to continue
>>>>> And why do you think so? I.e. why is there no race for Dom0 when there
>>>>> is one for DomU?
>>>> Well, then we need to use a lock to synchronize the two.
>>>> I guess this needs to be pci devs lock unfortunately
>>> The parties involved in deferred work and its cancellation:
>>>
>>> MMIO trap -> vpci_write -> vpci_cmd_write -> modify_bars -> defer_map
>>>
>>> Arm: leave_hypervisor_to_guest -> check_for_vcpu_work -> vpci_process_pending
>>>
>>> x86: two places -> hvm_do_resume -> vpci_process_pending
>>>
>>> So, both defer_map and vpci_process_pending need to be synchronized with
>>> pcidevs_{lock|unlock).
>> If I was an Arm maintainer, I'm afraid I would object to the pcidevs lock
>> getting used in leave_hypervisor_to_guest.
> I do agree this is really not good, but it seems I am limited in choices.
> @Stefano, @Julien, do you see any better way of doing that?

I agree with Jan about using the pcidevs_{lock|unlock}. The lock is not 
fine-grained enough for been call in vpci_process_pending().

I haven't yet looked at the rest of the series to be able to suggest the 
exact lock. But we at least want a per-domain spinlock.

> 
> We were thinking about introducing a dedicated lock for vpci [1],
> but finally decided to use pcidevs_lock for now

Skimming through the thread, you decided to use pcidevs_lock because it 
was simpler and sufficient for the use case discussed back then. Now, we 
have a use case where it would be a problem to use pcidevs_lock. So I 
think the extra complexity is justified.

Cheers,

-- 
Julien Grall

