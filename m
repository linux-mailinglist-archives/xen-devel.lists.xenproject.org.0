Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6098D46F8F1
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 03:05:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243489.421252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvVGp-0005mS-Nv; Fri, 10 Dec 2021 02:04:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243489.421252; Fri, 10 Dec 2021 02:04:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvVGp-0005ln-Jk; Fri, 10 Dec 2021 02:04:23 +0000
Received: by outflank-mailman (input) for mailman id 243489;
 Fri, 10 Dec 2021 02:04:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YiMI=Q3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mvVGo-0005lh-E0
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 02:04:22 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c1650e3-595d-11ec-a831-37629979565c;
 Fri, 10 Dec 2021 03:04:20 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 84B8EB82644;
 Fri, 10 Dec 2021 02:04:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2C92C004DD;
 Fri, 10 Dec 2021 02:04:16 +0000 (UTC)
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
X-Inumbo-ID: 7c1650e3-595d-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639101857;
	bh=U67NjGy23B7a2CRB6V77fX8dqOD5vv6HfJ+pk6269IU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=F29VQywYB5zc/0gAyrppGD/8PJlSu6CWLF1vgTYDpPWsEl0Ph4MtRWl9jJ5xHMb7H
	 JctlrCYml8V3jN+x/ypB2gW8lRT3EMFBmvuzx0BJvcPUfIA+yrDHTm9z2kuvUqPm5E
	 qLnYx1IaM23kAW72oA7IWgy9w6KjlMz+MdXtSlIxnGvP/ulyrveQwB4Ja25C17RW62
	 bSEHJ10lXrpPvBsyGncY/XMN3kxnBTw+BxMrOqJEfWPmUw0J/AhSU++lGjvLACZ2wb
	 OYnzxOo2oN1XdlA64MPZyB/FfIS4nk70Oy2FAx0ZK1KnAPLQeDrgAlNHNNvTqwieq7
	 9kYO1QEgGi5sA==
Date: Thu, 9 Dec 2021 18:04:15 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Sergiy Kibrik <sakib@darkstar.site>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Roman Skakun <rm.skakun@gmail.com>, xen-devel@lists.xenproject.org, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrii Anisov <andrii_anisov@epam.com>, 
    Sergiy Kibrik <sergiy_kibrik@epam.com>
Subject: Re: [RFC 1/1] xen/arm: set iommu property for IOMMU-protected
 devices
In-Reply-To: <c789cc71-db2d-0735-f007-e93bd23a81a5@darkstar.site>
Message-ID: <alpine.DEB.2.22.394.2112091733590.4091490@ubuntu-linux-20-04-desktop>
References: <cover.1633106362.git.roman_skakun@epam.com> <5b101e4e85668bbb18da83044520b0350344f408.1633106362.git.roman_skakun@epam.com> <17547d29-8e15-96f6-2418-5f7ca1c3237d@xen.org> <alpine.DEB.2.22.394.2111101306180.440530@ubuntu-linux-20-04-desktop>
 <c789cc71-db2d-0735-f007-e93bd23a81a5@darkstar.site>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1379446046-1639100300=:4091490"
Content-ID: <alpine.DEB.2.22.394.2112091738250.4091490@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1379446046-1639100300=:4091490
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2112091738251.4091490@ubuntu-linux-20-04-desktop>

On Tue, 7 Dec 2021, Sergiy Kibrik wrote:
> hi Stefano, Julien,
> 
> On 11/10/21 11:12 пп, Stefano Stabellini wrote:
> > On Mon, 8 Nov 2021, Julien Grall wrote:
> [..]
> > > A few years ago, I attempted to disable the swiotlb when Xen configured
> > > the
> > > IOMMU for the device (see [1]). Did you have a chance to go through the
> > > thread? In particular, I think Ian Campbell suggestion about creating an
> > > IOMMU
> > > binding is quite interesting.
> > > 
> > > Stefano, what do you think?
> > 
> > Yes I think it is a good idea. In fact, thinking more about it, it is
> > really the best option. Regardless of the implementation (swiotlb or
> > whatever) the device tree description is likely to look similar to the
> > description of an IOMMU because it is the common pattern shared by all
> > controllers (reset, power, clocks, etc.) so it makes sense to re-use it.
> > 
> > - there is one controller node (the "IOMMU")
> > - there is one property under each device node that is protected,
> >    pointing to the controller with a phandle and optional parameters (in
> >    the case of IOMMUs it is called "iommus")
> > 
> 
> Code in arch_setup_dma_ops() always forces swiotlb for dom0 regardless of any
> prior IOMMU configuration for the device.

Yes. The only exception is cases where XENFEAT_not_direct_mapped is set.


> So if we are to re-use IOMMU bindings and implement kind of dummy
> iommu (that merely does direct allocation and mapping) we'll have to
> check whether device is protected anyway

Yes, the Linux-side implementation wouldn't change very much compared to
what you had in mind, it is just that the device tree part would be
cleaner and more spec compliant.

We would still end up with a property for each to device to specify that
is protected by the IOMMU, it is just that instead of "xen,behind-iommu"
it would be called "iommus" and it would be pointing to a special "fake"
Xen IOMMU node. E.g.:


xen-iommu {
    compatible = "xen,iommu-el2-v1";
    status = "okay";
    #iommu-cells = <0x0>;
};


device@ff00000 {
    compatible = "vendor,device";
    reg = <0xff00000 0x1000>;
    iommus = <&xen-iommu>;
};


I can imagine it could a be problem to try to comply to the internal
iommu API in Linux. The Linux driver for xen-iommu could be tiny. It
doesn't have to implement the Linux iommu API because struct iommu_ops
is massive.

Linux would still have to check for each device if it is protected by
the iommu, but the "iommus" property is parsed automatically by
drivers/of/property.c:of_link_property. It should make the Linux side
easier to implement. of_link_property creates a fwnode "link" between
device@ff00000 and xen-iommu automatically for you, then I think you can
just call fwnode_find_reference to check if device@ff00000 is behind an
IOMMU.



> e.g.:
> 
>   diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
>   index 49f566ad9acb..6ddef3233095 100644
>   --- a/arch/arm/xen/enlighten.c
>   +++ b/arch/arm/xen/enlighten.c
>   @@ -425,6 +425,10 @@ static int __init xen_pm_init(void)
>    }
>    late_initcall(xen_pm_init);
> 
>   +bool xen_is_device_protected(struct device *dev) {
>   +	return dev->dma_ops == &dummy_xen_iommu_ops;
>   +}
> 
>    /* empty stubs */
>    void xen_arch_pre_suspend(void) { }
> 
> 
> Have I got it right?

I don't think I understand this example
--8323329-1379446046-1639100300=:4091490--

