Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D273E490F
	for <lists+xen-devel@lfdr.de>; Mon,  9 Aug 2021 17:43:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165052.301627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD7Qn-0006YX-4V; Mon, 09 Aug 2021 15:43:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165052.301627; Mon, 09 Aug 2021 15:43:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD7Qn-0006V6-0r; Mon, 09 Aug 2021 15:43:13 +0000
Received: by outflank-mailman (input) for mailman id 165052;
 Mon, 09 Aug 2021 15:43:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mD7Qm-0006V0-8T
 for xen-devel@lists.xenproject.org; Mon, 09 Aug 2021 15:43:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mD7QX-00087J-23; Mon, 09 Aug 2021 15:42:57 +0000
Received: from [54.239.6.184] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mD7QW-0006XJ-PD; Mon, 09 Aug 2021 15:42:56 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=9Ubg4P2v1xV010QCMLwBavWWjednuzNhSDu06lqmCzE=; b=LCTUqN1+K8ppQl6dmGgBQqMcDO
	lZMvecDmHhkrUKf06JTz5aPo4GzSvi3HVMEe7ahCsgbBGeo+yE/mTGQb0vdVVOg4cFT4hUm0APNN1
	9QF14pbIczQQtjlvgBgemXHrjtddOfe4jiOHmDn4JGJdunqhqBXdLAjoj6ccN9qnZohU=;
Subject: Re: [RFC PATCH] xen/memory: Introduce a hypercall to provide
 unallocated space
To: Oleksandr <olekstysh@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
References: <1627489110-25633-1-git-send-email-olekstysh@gmail.com>
 <80fafc01-f063-d6e5-1c08-7ad64550310c@citrix.com>
 <e8db3021-78a5-e040-a70b-62ca5b500149@xen.org>
 <4de5ed21-379e-b618-44c8-924d88b1a519@citrix.com>
 <bbc7f597-5249-20a0-cac9-13f594268299@xen.org>
 <6a633f4e-13e0-4a2b-cf6e-35ef90ae977c@gmail.com>
 <alpine.DEB.2.21.2107301630510.10122@sstabellini-ThinkPad-T480s>
 <f6b2e6c6-bf58-960f-4a09-f05ebcf1f566@gmail.com>
 <5643d414-0b76-74a4-2c37-c7a99338d547@gmail.com>
 <c83378af-4d3b-9256-0e0d-f88c43c6de2f@xen.org>
 <alpine.DEB.2.21.2108051720210.18743@sstabellini-ThinkPad-T480s>
 <6596ad08-8398-64dd-ef62-cd7bc6f7333e@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <bc576a23-d107-c67d-8dca-62691e5eea1a@xen.org>
Date: Mon, 9 Aug 2021 16:42:53 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <6596ad08-8398-64dd-ef62-cd7bc6f7333e@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Oleksandr,

On 07/08/2021 18:03, Oleksandr wrote:
> 
> On 06.08.21 03:30, Stefano Stabellini wrote:
> 
> Hi Stefano
> 
>> On Wed, 4 Aug 2021, Julien Grall wrote:
>>>> +#define GUEST_SAFE_RANGE_BASE   xen_mk_ullong(0xDE00000000) /* 
>>>> 128GB */
>>>> +#define GUEST_SAFE_RANGE_SIZE   xen_mk_ullong(0x0200000000)
>>>>
>>>> While the possible new DT bindings has not been agreed yet, I re-used
>>>> existing "reg" property under the hypervisor node to pass safe range 
>>>> as a
>>>> second region,
>>>> https://elixir.bootlin.com/linux/v5.14-rc4/source/Documentation/devicetree/bindings/arm/xen.txt#L10: 
>>>>
>>> So a single region works for a guest today, but for dom0 we will need 
>>> multiple
>>> regions because it is may be difficult to find enough contiguous 
>>> space for a
>>> single region.
>>>
>>> That said, as dom0 is mapped 1:1 (including some guest mapping), 
>>> there is also
>>> the question where to allocate the safe region. For grant table, we 
>>> so far
>>> re-use the Xen address space because it is assumed it will space will 
>>> always
>>> be bigger than the grant table.
>>>
>>> I am not sure yet where we could allocate the safe regions. Stefano, 
>>> do you
>>> have any ideas?
>> The safest choice would be the address range corresponding to memory
>> (/memory) not already allocated to Dom0.
>>
>> For instance from my last boot logs:
>> (XEN) Allocating 1:1 mappings totalling 1600MB for dom0:
>> (XEN) BANK[0] 0x00000010000000-0x00000070000000 (1536MB)
>> (XEN) BANK[1] 0x00000078000000-0x0000007c000000 (64MB)
>>
>> All the other ranges could be given as unallocated space:
>>
>> - 0x0 - 0x10000000
>> - 0x70000000 - 0x78000000
>> - 0x8_0000_0000 - 0x8_8000_0000
> 
> Thank you for the ideas.
> 
> If I got the idea correctly, yes, as these ranges represent the real 
> RAM, so no I/O would be in conflict with them and as the result - no 
> overlaps would be expected.
> But, I wonder, would this work if we have IOMMU enabled for Dom0 and 
> need to establish 1:1 mapping for the DMA devices to work with grant 
> mappings...
> In arm_iommu_map_page() we call guest_physmap_add_entry() with gfn = 
> mfn, so the question is could we end up with this new gfn replacing the 
> valid mapping
> (with gfn allocated from the safe region)?

Right, when we enable the IOMMU for dom0, Xen will add an extra mapping 
with GFN == MFN for foreign and grant pages. This is because Linux is 
not aware that whether a device is protected by an IOMMU. Therefore it 
is assuming it is not and will use the MFN to configure for DMA transaction.

We can't remove the mapping without significant changes in Linux and 
Xen. I would not mandate them for this work.

That said, I think it would be acceptable to have different way to find 
the region depending on the dom0 configuration. So we could use the RAM 
not used by dom0 when the IOMMU is turned off.

>> The second best choice would be an hole: an address range not used by
>> anybody else (no reg property) and also not even mappable by a bus (not
>> covered by a ranges property). This is not the best choice because there
>> can cases where physical resources appear afterwards.

Are you saying that the original device-tree doesn't even describe them 
in any way (i.e. reserved...)?

> 
> Unfortunately, yes.

So the decision where the safe region is located will be done by Xen. 
There is no involvement of the domain (it will discover the region from 
the DT). Therefore, I don't think we need to think about everything 
right now as we could adapt this is exact region is not part of the 
stable ABI.

The hotplug is one I would defer because this is not supported (and 
quite likely not working) in Xen upstream today.

Now regarding the case where dom0 is using the IOMMU. The assumption is 
Xen will be able to figure out all the regions used from the firmware 
table (ACPI or DT).

AFAIK, this assumption would be correct for DT. However, for ACPI, I 
remember we were not able to find all the MMIOs region in Xen (see [1] 
and [2]). So even this solution would not work for ACPI.

If I am not mistaken, we don't support IOMMU with ACPI yet. So we could 
defer the problem to when this is going to be supported.

Cheers,

[1] https://marc.info/?l=linux-arm-kernel&m=148469169210500&w=2
[2] Xen commit 80f9c316708400cea4417e36337267d3b26591db

-- 
Julien Grall

