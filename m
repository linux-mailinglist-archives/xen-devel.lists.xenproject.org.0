Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F69A316CD9
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 18:35:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83678.156356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9tO1-00068A-Du; Wed, 10 Feb 2021 17:34:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83678.156356; Wed, 10 Feb 2021 17:34:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9tO1-00067l-AL; Wed, 10 Feb 2021 17:34:45 +0000
Received: by outflank-mailman (input) for mailman id 83678;
 Wed, 10 Feb 2021 17:34:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l9tNz-00067g-Qx
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 17:34:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l9tNy-0006Sc-IQ; Wed, 10 Feb 2021 17:34:42 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l9tNy-0007fz-4r; Wed, 10 Feb 2021 17:34:42 +0000
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
	bh=feHBOTTFHArjZWlBYP8U++OP0bbgQdT5LQSpe+yLsic=; b=rA6vt9RTSpfZTvdz5F6Xg8J1L1
	5bzoJBIbepZ7hz7Ex4ZOZarjWfJgf37vcL7HxE1xU9WdY76+BEuVcl0L4gUipQgkxUOlO7JwIGvav
	FIbuuDM/BOvqPEIAB87wnfXPMSVAwLKcgtvhzMgTEi+vxbnCtAkG6Ymmc2A3l0GdYAZM=;
Subject: Re: [PATCH v2] xen/arm: fix gnttab_need_iommu_mapping
To: Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "lucmiccio@gmail.com" <lucmiccio@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20210208184932.23468-1-sstabellini@kernel.org>
 <B96B5E21-0600-4664-899D-D38A18DE7A8C@arm.com>
 <alpine.DEB.2.21.2102091226560.8948@sstabellini-ThinkPad-T480s>
 <EFFD35EA-378B-4C5C-8485-7EA5265E89E4@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4e4f7d25-6f5f-1016-b1c9-7aa902d637b8@xen.org>
Date: Wed, 10 Feb 2021 17:34:40 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <EFFD35EA-378B-4C5C-8485-7EA5265E89E4@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi,

On 10/02/2021 15:06, Rahul Singh wrote:
>> On 9 Feb 2021, at 8:36 pm, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>
>> On Tue, 9 Feb 2021, Rahul Singh wrote:
>>>> On 8 Feb 2021, at 6:49 pm, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>>>
>>>> Commit 91d4eca7add broke gnttab_need_iommu_mapping on ARM.
>>>> The offending chunk is:
>>>>
>>>> #define gnttab_need_iommu_mapping(d)                    \
>>>> -    (is_domain_direct_mapped(d) && need_iommu(d))
>>>> +    (is_domain_direct_mapped(d) && need_iommu_pt_sync(d))
>>>>
>>>> On ARM we need gnttab_need_iommu_mapping to be true for dom0 when it is
>>>> directly mapped and IOMMU is enabled for the domain, like the old check
>>>> did, but the new check is always false.
>>>>
>>>> In fact, need_iommu_pt_sync is defined as dom_iommu(d)->need_sync and
>>>> need_sync is set as:
>>>>
>>>>    if ( !is_hardware_domain(d) || iommu_hwdom_strict )
>>>>        hd->need_sync = !iommu_use_hap_pt(d);
>>>>
>>>> iommu_use_hap_pt(d) means that the page-table used by the IOMMU is the
>>>> P2M. It is true on ARM. need_sync means that you have a separate IOMMU
>>>> page-table and it needs to be updated for every change. need_sync is set
>>>> to false on ARM. Hence, gnttab_need_iommu_mapping(d) is false too,
>>>> which is wrong.
>>>>
>>>> As a consequence, when using PV network from a domU on a system where
>>>> IOMMU is on from Dom0, I get:
>>>>
>>>> (XEN) smmu: /smmu@fd800000: Unhandled context fault: fsr=0x402, iova=0x8424cb148, fsynr=0xb0001, cb=0
>>>> [   68.290307] macb ff0e0000.ethernet eth0: DMA bus error: HRESP not OK
>>>>
>>>> The fix is to go back to something along the lines of the old
>>>> implementation of gnttab_need_iommu_mapping.
>>>>
>>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>>> Fixes: 91d4eca7add
>>>> Backport: 4.12+
>>>>
>>>> ---
>>>>
>>>> Given the severity of the bug, I would like to request this patch to be
>>>> backported to 4.12 too, even if 4.12 is security-fixes only since Oct
>>>> 2020.
>>>>
>>>> For the 4.12 backport, we can use iommu_enabled() instead of
>>>> is_iommu_enabled() in the implementation of gnttab_need_iommu_mapping.
>>>>
>>>> Changes in v2:
>>>> - improve commit message
>>>> - add is_iommu_enabled(d) to the check
>>>> ---
>>>> xen/include/asm-arm/grant_table.h | 2 +-
>>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/xen/include/asm-arm/grant_table.h b/xen/include/asm-arm/grant_table.h
>>>> index 6f585b1538..0ce77f9a1c 100644
>>>> --- a/xen/include/asm-arm/grant_table.h
>>>> +++ b/xen/include/asm-arm/grant_table.h
>>>> @@ -89,7 +89,7 @@ int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
>>>>     (((i) >= nr_status_frames(t)) ? INVALID_GFN : (t)->arch.status_gfn[i])
>>>>
>>>> #define gnttab_need_iommu_mapping(d)                    \
>>>> -    (is_domain_direct_mapped(d) && need_iommu_pt_sync(d))
>>>> +    (is_domain_direct_mapped(d) && is_iommu_enabled(d))
>>>>
>>>> #endif /* __ASM_GRANT_TABLE_H__ */
>>>
>>> I tested the patch and while creating the guest I observed the below warning from Linux for block device.
>>> https://elixir.bootlin.com/linux/v4.3/source/drivers/block/xen-blkback/xenbus.c#L258
>>
>> So you are creating a guest with "xl create" in dom0 and you see the
>> warnings below printed by the Dom0 kernel? I imagine the domU has a
>> virtual "disk" of some sort.
> 
> Yes you are right I am trying to create the guest with "xl create” and before that, I created the logical volume and trying to attach the logical volume
> block to the domain with “xl block-attach”. I observed this error with the "xl block-attach” command.
> 
> This issue occurs after applying this patch as what I observed this patch introduce the calls to iommu_legacy_{, un}map() to map the grant pages for
> IOMMU that touches the page-tables. I am not sure but what I observed is that something is written wrong when iomm_unmap calls unmap the pages
> because of that issue is observed.

Can you clarify what you mean by "written wrong"? What sort of error do 
you see in the iommu_unmap()?

> 
> You can reproduce the issue by just creating the dummy image file and try to attach it with “xl block-attach”
> 
> dd if=/dev/zero of=test.img bs=1024 count=0 seek=1024
> xl block-attach 0 phy:test.img xvda w
> 
> Sequence of command that I follow is as follows to reproduce the issue:
> 
> lvs vg-xen/myguest
> lvcreate -y -L 4G -n myguest vg-xen
> parted -s /dev/vg-xen/myguest mklabel msdos
> parted -s /dev/vg-xen/myguest unit MB mkpart primary 1 4096
> sync
> xl block-attach 0 phy:/dev/vg-xen/myguest xvda w
> 
> libxl: error: libxl_xshelp.c:201:libxl__xs_read_mandatory: xenstore read failed: `/libxl/0/type': No such file or directory
> libxl: warning: libxl_dom.c:51:libxl__domain_type: unable to get domain type for domid=0, assuming HVM
> [  162.632232] xen-blkback: backend/vbd/0/51712: using 4 queues, protocol 1 (arm-abi) persistent grants
> [  162.764847] vbd vbd-0-51712: 9 mapping in shared page 8 from domain 0
> [  162.771740] vbd vbd-0-51712: 9 mapping ring-ref port 5
> [  162.777650] ------------[ cut here ]------------
> [  162.782167] WARNING: CPU: 2 PID: 37 at drivers/block/xen-blkback/xenbus.c:296 xen_blkif_disconnect+0x20c/0x230

Just to confirm, this splat comes from:

WARN_ON(i != (XEN_BLKIF_REQS_PER_PAGE * blkif->nr_ring_pages));

If so, what are the values for i and blkif->nr_ring_pages?

Cheers,

-- 
Julien Grall

