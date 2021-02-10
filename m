Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8793170A3
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 20:53:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83705.156473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9vXD-0002jV-J0; Wed, 10 Feb 2021 19:52:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83705.156473; Wed, 10 Feb 2021 19:52:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9vXD-0002j6-Fe; Wed, 10 Feb 2021 19:52:23 +0000
Received: by outflank-mailman (input) for mailman id 83705;
 Wed, 10 Feb 2021 19:52:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l9vXC-0002j1-1m
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 19:52:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l9vXA-0000OT-Hd; Wed, 10 Feb 2021 19:52:20 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l9vXA-0001Dw-4G; Wed, 10 Feb 2021 19:52:20 +0000
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
	bh=QGygwq+XlRGby/6WU6Lyuq55EHTsHrtDGEFeegO9yks=; b=m/uPE0S46QuBNDBGv0fw9FMR1Q
	gALuollxYpRI1AQKu8Y18V9W8l+BB+fJtUZZedEg0L9hQlsrvCnf2VaNolozH1cdcdZQqkHbW3x6l
	FLcQM3p2amyQw4Fq5K1Id9Mkrl6HI9ahejKydWP4SUNmPraeye881Ybn7Y7wUvM7K7lA=;
Subject: Re: [PATCH v2] xen/arm: fix gnttab_need_iommu_mapping
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "lucmiccio@gmail.com" <lucmiccio@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20210208184932.23468-1-sstabellini@kernel.org>
 <B96B5E21-0600-4664-899D-D38A18DE7A8C@arm.com>
 <alpine.DEB.2.21.2102091226560.8948@sstabellini-ThinkPad-T480s>
 <EFFD35EA-378B-4C5C-8485-7EA5265E89E4@arm.com>
 <4e4f7d25-6f5f-1016-b1c9-7aa902d637b8@xen.org>
 <ECC82E19-3504-4E0E-B3EA-D0E46DD842C6@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c573b3a0-186d-626e-6670-f8fc28285e3d@xen.org>
Date: Wed, 10 Feb 2021 19:52:18 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <ECC82E19-3504-4E0E-B3EA-D0E46DD842C6@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 10/02/2021 18:08, Rahul Singh wrote:
> Hello Julien,
> 
>> On 10 Feb 2021, at 5:34 pm, Julien Grall <julien@xen.org> wrote:
>>
>> Hi,
>>
>> On 10/02/2021 15:06, Rahul Singh wrote:
>>>> On 9 Feb 2021, at 8:36 pm, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>>>
>>>> On Tue, 9 Feb 2021, Rahul Singh wrote:
>>>>>> On 8 Feb 2021, at 6:49 pm, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>>>>>
>>>>>> Commit 91d4eca7add broke gnttab_need_iommu_mapping on ARM.
>>>>>> The offending chunk is:
>>>>>>
>>>>>> #define gnttab_need_iommu_mapping(d)                    \
>>>>>> -    (is_domain_direct_mapped(d) && need_iommu(d))
>>>>>> +    (is_domain_direct_mapped(d) && need_iommu_pt_sync(d))
>>>>>>
>>>>>> On ARM we need gnttab_need_iommu_mapping to be true for dom0 when it is
>>>>>> directly mapped and IOMMU is enabled for the domain, like the old check
>>>>>> did, but the new check is always false.
>>>>>>
>>>>>> In fact, need_iommu_pt_sync is defined as dom_iommu(d)->need_sync and
>>>>>> need_sync is set as:
>>>>>>
>>>>>>    if ( !is_hardware_domain(d) || iommu_hwdom_strict )
>>>>>>        hd->need_sync = !iommu_use_hap_pt(d);
>>>>>>
>>>>>> iommu_use_hap_pt(d) means that the page-table used by the IOMMU is the
>>>>>> P2M. It is true on ARM. need_sync means that you have a separate IOMMU
>>>>>> page-table and it needs to be updated for every change. need_sync is set
>>>>>> to false on ARM. Hence, gnttab_need_iommu_mapping(d) is false too,
>>>>>> which is wrong.
>>>>>>
>>>>>> As a consequence, when using PV network from a domU on a system where
>>>>>> IOMMU is on from Dom0, I get:
>>>>>>
>>>>>> (XEN) smmu: /smmu@fd800000: Unhandled context fault: fsr=0x402, iova=0x8424cb148, fsynr=0xb0001, cb=0
>>>>>> [   68.290307] macb ff0e0000.ethernet eth0: DMA bus error: HRESP not OK
>>>>>>
>>>>>> The fix is to go back to something along the lines of the old
>>>>>> implementation of gnttab_need_iommu_mapping.
>>>>>>
>>>>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>>>>> Fixes: 91d4eca7add
>>>>>> Backport: 4.12+
>>>>>>
>>>>>> ---
>>>>>>
>>>>>> Given the severity of the bug, I would like to request this patch to be
>>>>>> backported to 4.12 too, even if 4.12 is security-fixes only since Oct
>>>>>> 2020.
>>>>>>
>>>>>> For the 4.12 backport, we can use iommu_enabled() instead of
>>>>>> is_iommu_enabled() in the implementation of gnttab_need_iommu_mapping.
>>>>>>
>>>>>> Changes in v2:
>>>>>> - improve commit message
>>>>>> - add is_iommu_enabled(d) to the check
>>>>>> ---
>>>>>> xen/include/asm-arm/grant_table.h | 2 +-
>>>>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/xen/include/asm-arm/grant_table.h b/xen/include/asm-arm/grant_table.h
>>>>>> index 6f585b1538..0ce77f9a1c 100644
>>>>>> --- a/xen/include/asm-arm/grant_table.h
>>>>>> +++ b/xen/include/asm-arm/grant_table.h
>>>>>> @@ -89,7 +89,7 @@ int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
>>>>>>     (((i) >= nr_status_frames(t)) ? INVALID_GFN : (t)->arch.status_gfn[i])
>>>>>>
>>>>>> #define gnttab_need_iommu_mapping(d)                    \
>>>>>> -    (is_domain_direct_mapped(d) && need_iommu_pt_sync(d))
>>>>>> +    (is_domain_direct_mapped(d) && is_iommu_enabled(d))
>>>>>>
>>>>>> #endif /* __ASM_GRANT_TABLE_H__ */
>>>>>
>>>>> I tested the patch and while creating the guest I observed the below warning from Linux for block device.
>>>>> https://elixir.bootlin.com/linux/v4.3/source/drivers/block/xen-blkback/xenbus.c#L258
>>>>
>>>> So you are creating a guest with "xl create" in dom0 and you see the
>>>> warnings below printed by the Dom0 kernel? I imagine the domU has a
>>>> virtual "disk" of some sort.
>>> Yes you are right I am trying to create the guest with "xl create” and before that, I created the logical volume and trying to attach the logical volume
>>> block to the domain with “xl block-attach”. I observed this error with the "xl block-attach” command.
>>> This issue occurs after applying this patch as what I observed this patch introduce the calls to iommu_legacy_{, un}map() to map the grant pages for
>>> IOMMU that touches the page-tables. I am not sure but what I observed is that something is written wrong when iomm_unmap calls unmap the pages
>>> because of that issue is observed.
>>
>> Can you clarify what you mean by "written wrong"? What sort of error do you see in the iommu_unmap()?
> 
> 
> I might be wrong as per my understanding for ARM we are sharing the P2M between CPU and IOMMU always and the map_grant_ref() function is written in such a way that we have to call iommu_legacy_{, un}map() only if P2M is not shared.

map_grant_ref() will call the IOMMU if gnttab_need_iommu_mapping() 
returns true. I don't really see where this is assuming the P2M is not 
shared.

In fact, on x86, this will always be false for HVM domain (they support 
both shared and separate page-tables).

> 
> As we are sharing the P2M when we call the iommu_map() function it will overwrite the existing GFN -> MFN ( For DOM0 GFN is same as MFN) entry and when we call iommu_unmap() it will unmap the  (GFN -> MFN ) entry from the page-table.
AFAIK, there should be nothing mapped at that GFN because the page 
belongs to the guest. At worse, we would overwrite a mapping that is the 
same.

Although, I agree that we may end up to remove the entry early and 
therefore we could get an IOMMU fault (this is not your case here). But 
that's not an Arm-only problem.

> Next time when map_grant_ref() tries to map the same frame it will try to get the corresponding GFN but there will no entry in P2M as iommu_unmap() already unmapped the GFN because of that this error might be observed.
I am afraid, I don't understand what you mean by "try to get the 
corresponding GFN".  Can you give a pointer to the code?

> Sequence of events that results the issue :
> 
> gnttab_map_grant_ref (GFN=a99fb MFN=a99fb)

Can you clarify whether the GFN is from the local domain (e.g. 
dom0/backend) or the remote domain (e.g. the frontend)?

> arm_iommu_map_page() DOMID:0 dfn = a99fb mfn = a99fb
> 
> gnttab_map_grant_ref ( GFN=d9913 MFN=d9913)
> arm_iommu_map_page() DOMID:0 dfn = d9913 mfn = d9913
> 
> gnttab_map_grant_ref ( GFN=d9846 MFN=d9846)
> arm_iommu_map_page() DOMID:0 dfn = d9846 mfn = d9846
> 
> gnttab_map_grant_ref (GFN=a8474 MFN=a8474)
> arm_iommu_map_page() DOMID:0 dfn = a8474 mfn = a8474
> 
> arm_iommu_unmap_page() DOMID:0 dfn = a99fb
> arm_iommu_unmap_page() DOMID:0 dfn = d9913
> arm_iommu_unmap_page() DOMID:0 dfn = d9846
> arm_iommu_unmap_page() DOMID:0 dfn = a8474
> 
> Try to map the same frame that is unmapped earlier by iommu_unmap call()
> gnttab_map_grant_ref (GFN=a99fb MFN=0xffffffff).-> Not able to find the GFN in p2m error is observed after that.

The iommu_map()/iommu_unmap() should only modify the dom0 P2M. It should 
not modify the guest P2M.

When Dom0 issue a request to map a grant we will:
   1) Look-up the guest P2M to find the corresponding MFN
   2) Do all the sanity check
   3) Map the page in dom0's P2M at the address requested (host_addr)
   4) Issue iommu_map() to get a 1:1 mapping in the P2M

So are you saying that the guest P2M walk has failed?

Cheers,

-- 
Julien Grall

