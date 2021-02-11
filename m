Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C109318CA1
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 14:53:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83906.157142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lACOx-0007pl-QA; Thu, 11 Feb 2021 13:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83906.157142; Thu, 11 Feb 2021 13:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lACOx-0007pM-Mi; Thu, 11 Feb 2021 13:52:59 +0000
Received: by outflank-mailman (input) for mailman id 83906;
 Thu, 11 Feb 2021 13:52:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lACOv-0007pH-FE
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 13:52:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lACOu-0004rw-0w; Thu, 11 Feb 2021 13:52:56 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lACOt-0007zd-LM; Thu, 11 Feb 2021 13:52:55 +0000
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
	bh=EwHUlxv3YE0RtN6+99OTd+wjUZ9HVtOmE/xbephnDhI=; b=af2lcUm7WbnSWjZYGe/kuGHNUU
	lCpA6Aibj5mg4GsgIQMuatC88tURBwszWewCUEkQ7SgnM+wUmAzN8xou4gujEDt6sSOPzWYH7diDf
	6FOpu35w30k/6hnKrteq5DGojXPbkNBzGHFIt3kgSJk9v9lh68dRR5QCKhFGCeFyxMIM=;
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
 <c573b3a0-186d-626e-6670-f8fc28285e3d@xen.org>
 <BFC5858A-3631-48E1-AB87-40EECF95FA66@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <489c1b89-67f0-5d47-d527-3ea580b7cc43@xen.org>
Date: Thu, 11 Feb 2021 13:52:53 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <BFC5858A-3631-48E1-AB87-40EECF95FA66@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 11/02/2021 13:20, Rahul Singh wrote:
> Hello Julien,

Hi Rahul,

>> On 10 Feb 2021, at 7:52 pm, Julien Grall <julien@xen.org> wrote:
>>
>>
>>
>> On 10/02/2021 18:08, Rahul Singh wrote:
>>> Hello Julien,
>>>> On 10 Feb 2021, at 5:34 pm, Julien Grall <julien@xen.org> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 10/02/2021 15:06, Rahul Singh wrote:
>>>>>> On 9 Feb 2021, at 8:36 pm, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>>>>>
>>>>>> On Tue, 9 Feb 2021, Rahul Singh wrote:
>>>>>>>> On 8 Feb 2021, at 6:49 pm, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>>>>>>>
>>>>>>>> Commit 91d4eca7add broke gnttab_need_iommu_mapping on ARM.
>>>>>>>> The offending chunk is:
>>>>>>>>
>>>>>>>> #define gnttab_need_iommu_mapping(d)                    \
>>>>>>>> -    (is_domain_direct_mapped(d) && need_iommu(d))
>>>>>>>> +    (is_domain_direct_mapped(d) && need_iommu_pt_sync(d))
>>>>>>>>
>>>>>>>> On ARM we need gnttab_need_iommu_mapping to be true for dom0 when it is
>>>>>>>> directly mapped and IOMMU is enabled for the domain, like the old check
>>>>>>>> did, but the new check is always false.
>>>>>>>>
>>>>>>>> In fact, need_iommu_pt_sync is defined as dom_iommu(d)->need_sync and
>>>>>>>> need_sync is set as:
>>>>>>>>
>>>>>>>>    if ( !is_hardware_domain(d) || iommu_hwdom_strict )
>>>>>>>>        hd->need_sync = !iommu_use_hap_pt(d);
>>>>>>>>
>>>>>>>> iommu_use_hap_pt(d) means that the page-table used by the IOMMU is the
>>>>>>>> P2M. It is true on ARM. need_sync means that you have a separate IOMMU
>>>>>>>> page-table and it needs to be updated for every change. need_sync is set
>>>>>>>> to false on ARM. Hence, gnttab_need_iommu_mapping(d) is false too,
>>>>>>>> which is wrong.
>>>>>>>>
>>>>>>>> As a consequence, when using PV network from a domU on a system where
>>>>>>>> IOMMU is on from Dom0, I get:
>>>>>>>>
>>>>>>>> (XEN) smmu: /smmu@fd800000: Unhandled context fault: fsr=0x402, iova=0x8424cb148, fsynr=0xb0001, cb=0
>>>>>>>> [   68.290307] macb ff0e0000.ethernet eth0: DMA bus error: HRESP not OK
>>>>>>>>
>>>>>>>> The fix is to go back to something along the lines of the old
>>>>>>>> implementation of gnttab_need_iommu_mapping.
>>>>>>>>
>>>>>>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>>>>>>> Fixes: 91d4eca7add
>>>>>>>> Backport: 4.12+
>>>>>>>>
>>>>>>>> ---
>>>>>>>>
>>>>>>>> Given the severity of the bug, I would like to request this patch to be
>>>>>>>> backported to 4.12 too, even if 4.12 is security-fixes only since Oct
>>>>>>>> 2020.
>>>>>>>>
>>>>>>>> For the 4.12 backport, we can use iommu_enabled() instead of
>>>>>>>> is_iommu_enabled() in the implementation of gnttab_need_iommu_mapping.
>>>>>>>>
>>>>>>>> Changes in v2:
>>>>>>>> - improve commit message
>>>>>>>> - add is_iommu_enabled(d) to the check
>>>>>>>> ---
>>>>>>>> xen/include/asm-arm/grant_table.h | 2 +-
>>>>>>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/xen/include/asm-arm/grant_table.h b/xen/include/asm-arm/grant_table.h
>>>>>>>> index 6f585b1538..0ce77f9a1c 100644
>>>>>>>> --- a/xen/include/asm-arm/grant_table.h
>>>>>>>> +++ b/xen/include/asm-arm/grant_table.h
>>>>>>>> @@ -89,7 +89,7 @@ int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
>>>>>>>>     (((i) >= nr_status_frames(t)) ? INVALID_GFN : (t)->arch.status_gfn[i])
>>>>>>>>
>>>>>>>> #define gnttab_need_iommu_mapping(d)                    \
>>>>>>>> -    (is_domain_direct_mapped(d) && need_iommu_pt_sync(d))
>>>>>>>> +    (is_domain_direct_mapped(d) && is_iommu_enabled(d))
>>>>>>>>
>>>>>>>> #endif /* __ASM_GRANT_TABLE_H__ */
>>>>>>>
>>>>>>> I tested the patch and while creating the guest I observed the below warning from Linux for block device.
>>>>>>> https://elixir.bootlin.com/linux/v4.3/source/drivers/block/xen-blkback/xenbus.c#L258
>>>>>>
>>>>>> So you are creating a guest with "xl create" in dom0 and you see the
>>>>>> warnings below printed by the Dom0 kernel? I imagine the domU has a
>>>>>> virtual "disk" of some sort.
>>>>> Yes you are right I am trying to create the guest with "xl create” and before that, I created the logical volume and trying to attach the logical volume
>>>>> block to the domain with “xl block-attach”. I observed this error with the "xl block-attach” command.
>>>>> This issue occurs after applying this patch as what I observed this patch introduce the calls to iommu_legacy_{, un}map() to map the grant pages for
>>>>> IOMMU that touches the page-tables. I am not sure but what I observed is that something is written wrong when iomm_unmap calls unmap the pages
>>>>> because of that issue is observed.
>>>>
>>>> Can you clarify what you mean by "written wrong"? What sort of error do you see in the iommu_unmap()?
>>> I might be wrong as per my understanding for ARM we are sharing the P2M between CPU and IOMMU always and the map_grant_ref() function is written in such a way that we have to call iommu_legacy_{, un}map() only if P2M is not shared.
>>
>> map_grant_ref() will call the IOMMU if gnttab_need_iommu_mapping() returns true. I don't really see where this is assuming the P2M is not shared.
>>
>> In fact, on x86, this will always be false for HVM domain (they support both shared and separate page-tables).
>>
>>> As we are sharing the P2M when we call the iommu_map() function it will overwrite the existing GFN -> MFN ( For DOM0 GFN is same as MFN) entry and when we call iommu_unmap() it will unmap the  (GFN -> MFN ) entry from the page-table.
>> AFAIK, there should be nothing mapped at that GFN because the page belongs to the guest. At worse, we would overwrite a mapping that is the same.
>  > Sorry I should have mention before backend/frontend is dom0 in this 
case and GFN is mapped. I am trying to attach the block device to DOM0

Ah, your log makes a lot more sense now. Thank you for the clarification!

So yes, I agree that iommu_{,un}map() will do the wrong thing if the 
frontend and backend in the same domain.

I don't know what the state in Linux, but from Xen PoV it should be 
possible to have the backend/frontend in the same domain.

I think we want to ignore the IOMMU mapping request when the domain is 
the same. Can you try this small untested patch:

diff --git a/xen/drivers/passthrough/arm/iommu_helpers.c 
b/xen/drivers/passthrough/arm/iommu_helpers.c
index a36e2b8e6c42..7bad13593146 100644
--- a/xen/drivers/passthrough/arm/iommu_helpers.c
+++ b/xen/drivers/passthrough/arm/iommu_helpers.c
@@ -53,6 +53,9 @@ int __must_check arm_iommu_map_page(struct domain *d, 
dfn_t dfn, mfn_t mfn,

      t = (flags & IOMMUF_writable) ? p2m_iommu_map_rw : p2m_iommu_map_ro;

+    if ( page_get_owner(mfn_to_page(mfn)) == d )
+        return 0;
+
      /*
       * The function guest_physmap_add_entry replaces the current mapping
       * if there is already one...
@@ -71,6 +74,9 @@ int __must_check arm_iommu_unmap_page(struct domain 
*d, dfn_t dfn,
      if ( !is_domain_direct_mapped(d) )
          return -EINVAL;

+    if ( page_get_owner(mfn_to_page(mfn)) == d )
+        return 0;
+
      return guest_physmap_remove_page(d, _gfn(dfn_x(dfn)), 
_mfn(dfn_x(dfn)), 0);
  }

Cheers,

-- 
Julien Grall

