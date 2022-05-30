Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB2053852D
	for <lists+xen-devel@lfdr.de>; Mon, 30 May 2022 17:45:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338646.563444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvhZR-00050u-6D; Mon, 30 May 2022 15:44:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338646.563444; Mon, 30 May 2022 15:44:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvhZR-0004yJ-26; Mon, 30 May 2022 15:44:41 +0000
Received: by outflank-mailman (input) for mailman id 338646;
 Mon, 30 May 2022 15:44:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nvhZP-0004yD-AT
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 15:44:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nvhZP-0006Ft-0l; Mon, 30 May 2022 15:44:39 +0000
Received: from [54.239.6.188] (helo=[192.168.9.131])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nvhZO-0007iJ-QR; Mon, 30 May 2022 15:44:38 +0000
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
	bh=CngiKYenE/A3wTJGNFxg6A0Zj0x+QcVFxPIrk5pvBPE=; b=UO19dALJhyxI0m3WnHtC5ZMAtX
	SUYPl3SO3uqFGjuBuDYW/BNKGvO7euCC/9erVpdcHD0Yd5OX3AC6InelHYEYWqnD/eG4SlNYm8oE1
	CRXo9++sbXnTJo0Bwp0YMbtH1wIpWcH/nf4HTWDGN/zCWCAz+vJAnkJz4T0II5a9d6Jc=;
Message-ID: <da899c6a-a9ec-fa25-75ef-6f375dfd422a@xen.org>
Date: Mon, 30 May 2022 16:44:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [Xen-devel] SMMU permission fault on Dom0 when init vpu_decoder
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Peng Fan <peng.fan@nxp.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20220530152102.GA883104@EPUAKYIW015D>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220530152102.GA883104@EPUAKYIW015D>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

(+ Stefano)

On 30/05/2022 16:21, Oleksii Moisieiev wrote:
> Hello,

Hi Oleksii,

> I'm getting permission fault from SMMU when trying to init VPU_Encoder/Decoder
> in Dom0 on IMX8QM board:
> (XEN) smmu: /iommu@51400000: Unhandled context fault: fsr=0x408, iova=0x86000a60, fsynr=0x1c0062, cb=0
> This error appears when vpu_encoder/decoder tries to memcpy firmware image to
> 0x86000000 address, which is defined in reserved-memory node in xen device-tree
> as encoder_boot/decoder_boot region.

It is not clear to me who is executing the memcpy(). Is it the device or 
your domain? If the former, where was the instruction fetch from?

The reason I am asking that is, from what you wrote, mempcy() will write 
to 0x86000000. So the write should not result to a instruction abort. 
Only an instruction fetch would lead to such abort.

> 
> I'm using xen from branch xen-project/staging-4.16 + imx related patches, which were
> taken from https://source.codeaurora.org/external/imx/imx-xen.
> 
> After some investigation I found that this issue was fixed by Peng Fan in
> commit: 46b3dd3718144ca6ac2c12a3b106e57fb7156554 (Hash from codeaurora), but only for
> the Guest domains.
> It introduces new p2m_type p2m_mmio_direct_nc_x, which differs from
> p2m_mmio_direct_nc by XN = 0. This type is set to the reserved memory region in
> map_mmio_regions function.
> 
> I was able to fix issue in Dom0 by setting p2m_mmio_direct_nc_x type for the
> reserved memory in map_regions_p2mt, which is used to map memory during Dom0 creation.
> Patch can be found below.
> 
> Based on initial discussions on IRC channel - XN bit did the trick because looks
> like vpu decoder is executing some code from this memory.

This was a surprise to me that device could also execute memory. From 
the SMMU spec, this looks a legit things. Before relaxing the type, I 
would like to confirm this is what's happenning in your case.

[...]

> ---
> arm: Set p2m_type to p2m_mmio_direct_nc_x for reserved memory
> regions
> 
> This is the enhancement of the 46b3dd3718144ca6ac2c12a3b106e57fb7156554.
> Those patch introduces p2m_mmio_direct_nc_x p2m type which sets the
> e->p2m.xn = 0 for the reserved-memory, such as vpu encoder/decoder.
> 
> Set p2m_mmio_direct_nc_x in map_regions_p2mt for reserved-memory the
> same way it does in map_mmio_regions. This change is for the case
> when vpu encoder/decoder works in DomO and not passed-through to the
> Guest Domains.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> ---
>   xen/arch/arm/p2m.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index e9568dab88..bb1f681b71 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -1333,6 +1333,13 @@ int map_regions_p2mt(struct domain *d,
>                        mfn_t mfn,
>                        p2m_type_t p2mt)
>   {
> +    if (((long)gfn_x(gfn) >= (GUEST_RAM0_BASE >> PAGE_SHIFT)) &&
> +        (((long)gfn_x(gfn) + nr) <=
> +        ((GUEST_RAM0_BASE + GUEST_RAM0_SIZE)>> PAGE_SHIFT)))

I am afraid I don't understand what this check is for. In a normal 
setup, we don't know where the reserved regions are mapped. Only the 
caller may know that.

For dom0, this decision could be taken in map_range_to_domain(). For the 
domU, we would need to let the toolstack to chose the memory attribute. 
Stefano attempted to do that a few years ago (see [1]). Maybe we should 
revive it?

> +    {
> +        p2m_remove_mapping(d, gfn, nr, mfn);
> +        return p2m_insert_mapping(d, gfn, nr, mfn, p2m_mmio_direct_nc_x);
> +    }
>       return p2m_insert_mapping(d, gfn, nr, mfn, p2mt);
>   }
>   

Cheers,

[1] 
https://lore.kernel.org/xen-devel/alpine.DEB.2.10.1902261501020.20689@sstabellini-ThinkPad-X260/

-- 
Julien Gral

