Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E1A1BBB14
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 12:20:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTNL9-0005xZ-23; Tue, 28 Apr 2020 10:19:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DYx7=6M=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jTNL7-0005xU-75
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 10:19:45 +0000
X-Inumbo-ID: c7411d62-8939-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7411d62-8939-11ea-9887-bc764e2007e4;
 Tue, 28 Apr 2020 10:19:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E60A4AED6;
 Tue, 28 Apr 2020 10:19:41 +0000 (UTC)
Subject: Re: [PATCH] xen/swiotlb: correct the check for
 xen_destroy_contiguous_region
To: Peng Fan <peng.fan@nxp.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
References: <1588059225-11245-1-git-send-email-peng.fan@nxp.com>
 <1c01e97a-adcd-a703-55b5-8975b4ce4d2c@suse.com>
 <DB6PR0402MB2760A05135338B0CBB28123488AC0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <dba804ea-4268-24ff-7447-ddef00e9e20c@suse.com>
Date: Tue, 28 Apr 2020 12:19:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB2760A05135338B0CBB28123488AC0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.04.20 10:25, Peng Fan wrote:
>> Subject: Re: [PATCH] xen/swiotlb: correct the check for
>> xen_destroy_contiguous_region
>>
>> On 28.04.20 09:33, peng.fan@nxp.com wrote:
>>> From: Peng Fan <peng.fan@nxp.com>
>>>
>>> When booting xen on i.MX8QM, met:
>>> "
>>> [    3.602128] Unable to handle kernel paging request at virtual address
>> 0000000000272d40
>>> [    3.610804] Mem abort info:
>>> [    3.613905]   ESR = 0x96000004
>>> [    3.617332]   EC = 0x25: DABT (current EL), IL = 32 bits
>>> [    3.623211]   SET = 0, FnV = 0
>>> [    3.626628]   EA = 0, S1PTW = 0
>>> [    3.630128] Data abort info:
>>> [    3.633362]   ISV = 0, ISS = 0x00000004
>>> [    3.637630]   CM = 0, WnR = 0
>>> [    3.640955] [0000000000272d40] user address but active_mm is
>> swapper
>>> [    3.647983] Internal error: Oops: 96000004 [#1] PREEMPT SMP
>>> [    3.654137] Modules linked in:
>>> [    3.677285] Hardware name: Freescale i.MX8QM MEK (DT)
>>> [    3.677302] Workqueue: events deferred_probe_work_func
>>> [    3.684253] imx6q-pcie 5f000000.pcie: PCI host bridge to bus 0000:00
>>> [    3.688297] pstate: 60000005 (nZCv daif -PAN -UAO)
>>> [    3.688310] pc : xen_swiotlb_free_coherent+0x180/0x1c0
>>> [    3.693993] pci_bus 0000:00: root bus resource [bus 00-ff]
>>> [    3.701002] lr : xen_swiotlb_free_coherent+0x44/0x1c0
>>> "
>>>
>>> In xen_swiotlb_alloc_coherent, if !(dev_addr + size - 1 <= dma_mask)
>>> or range_straddles_page_boundary(phys, size) are true, it will create
>>> contiguous region. So when free, we need to free contiguous region use
>>> upper check condition.
>>
>> No, this will break PV guests on x86.
> 
> Could you share more details why alloc and free not matching for the check?

xen_create_contiguous_region() is needed only in case:

- the bus address is not within dma_mask, or
- the memory region is not physically contiguous (can happen only for
   PV guests)

In any case it should arrange for the memory to be suitable for the
DMA operation, so to be contiguous and within dma_mask afterwards. So
xen_destroy_contiguous_region() should only ever called for areas
which match above criteria, as otherwise we can be sure
xen_create_contiguous_region() was not used for making the area DMA-able
in the beginning.

And this is very important in the PV case, as in those guests the page
tables are containing the host-PFNs, not the guest-PFNS, and
xen_create_contiguous_region() will fiddle with host- vs. guest-PFN
arrangements, and xen_destroy_contiguous_region() is reverting this
fiddling. Any call of xen_destroy_contiguous_region() for an area it
was not intended to be called for might swap physical pages beneath
random virtual addresses, which was the reason for this test to be
added by me.


Juergen

> 
> Thanks,
> Peng.
> 
>>
>> I think there is something wrong with your setup in combination with the ARM
>> xen_create_contiguous_region() implementation.
>>
>> Stefano?
>>
>>
>> Juergen
>>
>>>
>>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>>> ---
>>>    drivers/xen/swiotlb-xen.c | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
>>> index b6d27762c6f8..ab96e468584f 100644
>>> --- a/drivers/xen/swiotlb-xen.c
>>> +++ b/drivers/xen/swiotlb-xen.c
>>> @@ -346,8 +346,8 @@ xen_swiotlb_free_coherent(struct device *hwdev,
>> size_t size, void *vaddr,
>>>    	/* Convert the size to actually allocated. */
>>>    	size = 1UL << (order + XEN_PAGE_SHIFT);
>>>
>>> -	if (!WARN_ON((dev_addr + size - 1 > dma_mask) ||
>>> -		     range_straddles_page_boundary(phys, size)) &&
>>> +	if (((dev_addr + size - 1 > dma_mask) ||
>>> +	    range_straddles_page_boundary(phys, size)) &&
>>>    	    TestClearPageXenRemapped(virt_to_page(vaddr)))
>>>    		xen_destroy_contiguous_region(phys, order);
>>>
>>>
> 


