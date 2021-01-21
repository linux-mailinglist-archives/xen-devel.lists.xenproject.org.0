Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B742FF713
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 22:20:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72408.130338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2hNL-0004YC-Tl; Thu, 21 Jan 2021 21:20:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72408.130338; Thu, 21 Jan 2021 21:20:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2hNL-0004Xn-Qb; Thu, 21 Jan 2021 21:20:19 +0000
Received: by outflank-mailman (input) for mailman id 72408;
 Thu, 21 Jan 2021 21:20:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mrjv=GY=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l2hNK-0004Xi-JV
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 21:20:18 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4d04aea-c13c-47b4-96c6-ad3bc097fd95;
 Thu, 21 Jan 2021 21:20:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7F4AF22BEF;
 Thu, 21 Jan 2021 21:20:16 +0000 (UTC)
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
X-Inumbo-ID: e4d04aea-c13c-47b4-96c6-ad3bc097fd95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611264016;
	bh=wCKl3iOBNSempkxZK8iGMsO5PnV8UAG/0LtB6A9Z0Ms=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bmFdQJrlfsdvzxKfNoxcFF70b8tsXgjK8y7dP0aPytoFcPHZ2H2T6kes0fkJvhhtW
	 weq540vpnRG+sfns8Nct60nsdTlaUbX/mWGEfztbV2G+0cOSJslM+DHkoqHhrKnyi0
	 v96SjnyccnP6qNlDhKDielUVTKwD8HbZEbgM9os4gA6Z6ArtJ67+l6F1rc1nzvf8p3
	 JtyJYUPA/zV6pqV4AaBPg/K61n/FMggQxoJymbLVo68OIlJ12up8k93ymEr6Grxm+r
	 5brKx+iwC6C+Cr0JeBHjorGH6f6XXoqXV5K3VDIbsAPmRwUkZlwEljqiI6iUIljdeW
	 bDB8GnHy+etQA==
Date: Thu, 21 Jan 2021 13:20:08 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <Rahul.Singh@arm.com>
cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, 
    Paul Durrant <paul@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 10/10] xen/arm: smmuv3: Add support for SMMUv3
 driver
In-Reply-To: <47E677DA-007E-445D-A72E-599676202CB7@arm.com>
Message-ID: <alpine.DEB.2.21.2101211310220.30512@sstabellini-ThinkPad-T480s>
References: <cover.1611153615.git.rahul.singh@arm.com> <b14ea889b0c27fec1b8843da91b570b0ccd66796.1611153615.git.rahul.singh@arm.com> <alpine.DEB.2.21.2101201212310.14528@sstabellini-ThinkPad-T480s> <9621B25B-E39A-4354-9AA3-1ECAED21B8B2@arm.com>
 <81104729-0354-f479-9329-04447df1b096@xen.org> <47E677DA-007E-445D-A72E-599676202CB7@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1840476581-1611263431=:30512"
Content-ID: <alpine.DEB.2.21.2101211311180.30512@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1840476581-1611263431=:30512
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2101211311181.30512@sstabellini-ThinkPad-T480s>

On Thu, 21 Jan 2021, Rahul Singh wrote:
> > On 21 Jan 2021, at 6:43 pm, Julien Grall <julien@xen.org> wrote:
> > On 21/01/2021 17:10, Rahul Singh wrote:
> >>> On 20 Jan 2021, at 8:31 pm, Stefano Stabellini <sstabellini@kernel.org> wrote:
> >>>> -static void __iomem *arm_smmu_ioremap(struct device *dev, resource_size_t start,
> >>>> -				      resource_size_t size)
> >>>> +
> >>>> +static void arm_smmu_free_structures(struct arm_smmu_device *smmu)
> >>>> {
> >>>> -	struct resource res = {
> >>>> -		.flags = IORESOURCE_MEM,
> >>>> -		.start = start,
> >>>> -		.end = start + size - 1,
> >>>> -	};
> >>>> +	if (smmu->cmdq.q.base)
> >>>> +		xfree(smmu->cmdq.q.base);
> >>>> +
> >>>> +	if (smmu->evtq.q.base)
> >>>> +		xfree(smmu->evtq.q.base);
> >>>> 
> >>>> -	return devm_ioremap_resource(dev, &res);
> >>>> +	if (smmu->priq.q.base)
> >>>> +		xfree(smmu->priq.q.base);
> >>>> +
> >>>> +	if (smmu->strtab_cfg.strtab)
> >>>> +		xfree(smmu->strtab_cfg.strtab);
> >>>> +
> >>>> +	if (smmu->strtab_cfg.l1_desc)
> >>>> +		xfree(smmu->strtab_cfg.l1_desc);
> >>> 
> >>> From what I can tell we also need to free somewhere
> >>> smmu->strtab_cfg->l1_desc->l2ptr allocated by arm_smmu_init_l2_strtab
> >> "l1_desc->l2ptr" is a pointer to the Level 1 Stream Table Descriptor if 2-level Stream Table supported.
> >> If the device is protected by IOMMU, SMMUv3 driver will allocate the  "l1_desc->l2ptr” when the device is added to the IOMMU via arm_smmu_add_device() function and device will be configured in bypass/abort mode.
> >> Once we assign the device to the domain(arm_smmu_assign_dev() ) smmuv3 hw will be configured correctly to match the StreamID. If there is a failure in assigning the device, that case also XEN will not remove the device and master device still be in bypass/abort mode.
> > 
> > I am a bit confused with this answer. Wouldn't this mean that we are "leaking" memory if we fail to assign the device?
> 
> No we are not leaking memory as "l1_desc->l2ptr” is still be valid and is required for correct SMMUv3 opeation if we fail to assign the device, as in that case device will operate in bypass or abort mode. 
> 
> For example if by any chance there is faulty hw behind SMMUv3 then if we fail to assign the device we can configure the device in abort mode in that case SMMUv3 hw will silently report abort to device, without any event recorded.
> 
> We can also configure the device in bypass mode if we fail to assign. Thats why I thought not to free the "l1_desc->l2ptr” if we fail to assign the device.

Basically there are two places where l2ptr should be freed:

1) the error out path (err_free_master) in arm_smmu_add_device
2) arm_smmu_remove_device

However, arm_smmu_remove_device is not actually implementedi at all. In
regards to 1), it would be redundant because the memory allocation of
l2ptr is the last operation that could return an error in
arm_smmu_add_device. In other words, if it fails then the memory is not
allocated.

To avoid future memory-leaks in case we add function calls that could
fail after the arm_smmu_init_l2_strtab() call in arm_smmu_add_device, I
think it would be good to have an xfree(l2ptr) under err_free_master.
But given that it is not necessary today I am OK either way.
--8323329-1840476581-1611263431=:30512--

