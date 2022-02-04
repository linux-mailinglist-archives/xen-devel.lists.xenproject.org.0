Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C41B04A9A84
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 15:00:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265571.458976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFz87-0004Jg-Vg; Fri, 04 Feb 2022 14:00:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265571.458976; Fri, 04 Feb 2022 14:00:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFz87-0004Fc-Rr; Fri, 04 Feb 2022 14:00:03 +0000
Received: by outflank-mailman (input) for mailman id 265571;
 Fri, 04 Feb 2022 13:58:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wnvI=ST=walle.cc=michael@srs-se1.protection.inumbo.net>)
 id 1nFz6W-0003p9-Rc
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 13:58:25 +0000
Received: from ssl.serverraum.org (ssl.serverraum.org [2a01:4f8:151:8464::1:2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83b6689b-85c2-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 14:58:22 +0100 (CET)
Received: from apollo.. (unknown [IPv6:2a02:810b:4340:43bf:4685:ff:fe12:5967])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id AA98C2223A;
 Fri,  4 Feb 2022 14:58:19 +0100 (CET)
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
X-Inumbo-ID: 83b6689b-85c2-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1643983101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bz66c/6ZEjSDWrbCYW8qMB5DDdnkXBZmEp6BeBUenr8=;
	b=ehu4SAvArB9/ZfJ7cTL4zbH21MVRHidcOgwpIm+ehoA6Ew9USK19X6R+TVczdiAlna3Sn5
	F/KrV5kbdDEMJ3zMIcKdNnhBhnrnocbkeQ278ilatcxm/s8m2+ZsveCdQabtbCK/6PcUJM
	koAqXb44u4smIwqepFyeeteUsRRWiqw=
From: Michael Walle <michael@walle.cc>
To: stefano.stabellini@xilinx.com
Cc: Bertrand.Marquis@arm.com,
	Zhiqiang.Hou@nxp.com,
	brucea@xilinx.com,
	cornelia.bruelhart@zal.aero,
	julien@xen.org,
	leo.krueger@zal.aero,
	oleksandr_andrushchenko@epam.com,
	peng.fan@nxp.com,
	xen-devel@lists.xenproject.org,
	Michael Walle <michael@walle.cc>
Subject: Re: Xen data from meta-virtualization layer
Date: Fri,  4 Feb 2022 14:58:14 +0100
Message-Id: <20220204135814.1033356-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <alpine.DEB.2.21.2011241743490.7979@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2011241743490.7979@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

> + Zhiqiang Hou
> 
> On Tue, 24 Nov 2020, Leo Krueger wrote:
> > > >>> On Tue, 17 Nov 2020, Leo Krueger wrote:
> > > >>>> Hi,
> > > >>>>
> > > >>>> I enabled CONFIG_HAS_ITS (what a stupid mistake by me to not set it
> > > >>>> before...) but then had to add the following node to my device tree
> > > >>>>
> > > >>>> 	gic_lpi_base: syscon@0x80000000 {
> > > >>>> 		compatible = "gic-lpi-base";
> > > >>
> > > >> I couldn't find this compatible defined/used in Linux 5.10-rc4. @Leo,
> > > >> could you clarify which flavor/version of Linux you are using?
> > > >
> > > > It is Linux 4.19 from Yocto (Warror release). XEN 4.13.2.
> > > 
> > > Do you have a link to the Linux tree? Is there any additional patches on top of
> > > vanilla?
> > 
> > Linux tree is found here: https://github.com/kontron/linux-smarc-sal28/commits/master-LSDK-19.09
> > (up to the latest commit in that branch)

FWIW, I'm the developer of the support for this board both in the
mentioned branch as well as upstream.

If you don't need graphics you shouldn't really be using the branch
above, but the latest vanilla kernel release.

> [...]
> 
> > > Looking at the DT changes in [0], it looks like the node is not a child of gic@.
> > > So I think Xen will map the region to Dom0.
> > > 
> > > There are two things that I can notice:
> > >    1) This region is RAM, but I can't find any reserve node. Is there any specific
> > > code in Linux to reserve it?
> > >    2) The implementation in U-boot seems to suggest that the firmware will
> > > configure the LPIs and then enable it. If that's the case, then Xen needs to
> > > re-use the table in the DT rather than allocating a new one.
> 
> That Linux tree has no mentions of gic-lpi-base. That means that
> gic-lpi-base is only used in u-boot, not in Linux. In particular the
> most relevant commit is af288cb291da3abef6be0875527729296f7de7a0. 

That node was horrible hack from NXP for u-boot and was removed in
a84cea06bb8fff69810a890ac0e4b47ea5726512.

> In regards to the reserved-memory regions, maybe we are not seeing them
> because Leo posted the host device tree, not the one passed at runtime
> from u-boot to Linux?
> 
> If so, Leo, could you please boot Linux on native (no Xen) and get the
> device tree from there at runtime using dtc -I fs -O dts
> /proc/device-tree ?
> 
> 
> However, the name of the reserved-memory region created by u-boot seems
> to be "lpi_rd_table". I cannot find any mentions of lpi_rd_table in the
> Linux kernel tree either.
> 
> Zhiqiang, Leo is trying to boot Xen on sAL28. Linux booting on Xen
> throws errors in regards to GIC/ITS initialization. On other hardware
> Xen can use and virtualize GICv3 and ITS just fine. Could you please
> explain what is different about sAL28 and how Xen/Linux is expected to
> use the lpi_rd_table reserved-memory region?

I actually stumbled across this thread after trying out Xen myself. I'm
using lastest vanilla u-boot (with pending PSCI patches), vanilla kernel
and vanilla Xen.

So far I've discovered, that xen complains that it cannot route IRQ64 to
dom0. That is because on the LS1028A there is a dual UART (two 16550
with one shared interrupt) and xen takes the first UART and then tries
to map the interrupt of the second UART to linux. For now, I don't know
how this is solved correctly. As a quick hack, I removed the second uart
node from the device tree.

But what is more severe is that the iommu isn't set up correctly. I'm
getting the following faults:

(XEN) smmu: /soc/iommu@5000000: Unexpected global fault, this could be serious
(XEN) smmu: /soc/iommu@5000000: 	GFSR 0x80000002, GFSYNR0 0x00000000, GFSYNR1 0x0000042a, GFSYNR2 0x00000000

If I decode it correctly, the streamid should be 0x2a which would be one
of the PCI devices on the internal root complex. Probably the network
card.

This is the first developer experience with Xen, so please bear with me
:) It seems that Xen doesn't add the master to the IOMMU. To me it seems
that only devices with a 'iommus' dt property are added. But in case of
PCI devices the parent only has a iommu-map property.

And it makes me wonder why Leo has an almost working setup. Maybe I'm
missing some patches though.

-michael

