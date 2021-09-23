Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE46416229
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 17:36:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194479.346457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTQld-0003jV-Ew; Thu, 23 Sep 2021 15:36:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194479.346457; Thu, 23 Sep 2021 15:36:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTQld-0003h9-Bh; Thu, 23 Sep 2021 15:36:09 +0000
Received: by outflank-mailman (input) for mailman id 194479;
 Thu, 23 Sep 2021 15:36:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/SRu=ON=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTQlb-0003h1-UI
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 15:36:07 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b8fe116c-aa07-43e5-8542-9a476c4eaec8;
 Thu, 23 Sep 2021 15:36:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1234761029;
 Thu, 23 Sep 2021 15:36:06 +0000 (UTC)
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
X-Inumbo-ID: b8fe116c-aa07-43e5-8542-9a476c4eaec8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632411366;
	bh=aT5z/PuEXqsyUmbvog5JXhGE87ZZ8uE4fYmPcFjU0PI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=im/Xnqf41Ihr0HK717PQhrg6e3fT3HE+6OYKLHf54ZnRzkRi2+q1WnFqAJxaVpYaO
	 8Zhlfm9mIoAK/kza5hh3vjubvQeb6AdTfwgGAUiKltKpAOuvQVPKttpvpL6XPpsVIu
	 RRZTrbhW2rguiHO9tNpalcseoPNILWp6bahyTz5n8CCNucXLhWCtQYS5V1Dc62b2p5
	 LJj05thr+j13XpcIY6nyeku15YlTiepPRveB0KRqJXgMZuqxJ9v09kV1qVb7JldonL
	 EOp2almrYNzQ+drXi84tCN38AObEhKcj6XM/hltwNijgTLkYk2EDyHZtEfc+BSxRRs
	 bhuGo6tA8pQsg==
Date: Thu, 23 Sep 2021 08:36:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Rahul Singh <rahul.singh@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    "andre.przywara@arm.com" <andre.przywara@arm.com>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 11/17] xen/arm: PCI host bridge discovery within XEN
 on ARM
In-Reply-To: <e2634706-3198-3224-371c-3d13210a35c9@epam.com>
Message-ID: <alpine.DEB.2.21.2109230835110.17979@sstabellini-ThinkPad-T480s>
References: <cover.1632307952.git.rahul.singh@arm.com> <c837d73b1fc8953ab48d36609482cf84832b7827.1632307952.git.rahul.singh@arm.com> <alpine.DEB.2.21.2109221836190.17979@sstabellini-ThinkPad-T480s> <e2634706-3198-3224-371c-3d13210a35c9@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1032229729-1632411330=:17979"
Content-ID: <alpine.DEB.2.21.2109230835470.17979@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1032229729-1632411330=:17979
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2109230835471.17979@sstabellini-ThinkPad-T480s>

On Thu, 23 Sep 2021, Oleksandr Andrushchenko wrote:
> Hi, Stefano!
> 
> [snip]
> 
> 
> >> +};
> >> +
> >> +/* Default ECAM ops */
> >> +extern const struct pci_ecam_ops pci_generic_ecam_ops;
> > If we use container_of and get rid of sysdata, I wonder if we get avoid
> > exporting pci_generic_ecam_ops.
> >
> >
> >> +int pci_host_common_probe(struct dt_device_node *dev, const void *data);
> > This should be static and not exported
> >
> >
> >> +int pci_generic_config_read(struct pci_host_bridge *bridge, uint32_t sbdf,
> >> +                            uint32_t reg, uint32_t len, uint32_t *value);
> > also this
> >
> >
> >> +int pci_generic_config_write(struct pci_host_bridge *bridge, uint32_t sbdf,
> >> +                            uint32_t reg, uint32_t len, uint32_t value);
> > also this
> >
> >
> >> +void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
> >> +                               uint32_t sbdf, uint32_t where);
> > also this
> >
> >>   static always_inline bool is_pci_passthrough_enabled(void)
> >>   {
> >>       return pci_passthrough_enabled;
> >> -- 
> >> 2.17.1
> 
> All the above is still need to be exported as those are going to be used
> 
> by other bridge's implementations, see ZynqMP for instance later in the series.
> 
> I'll post a snippet from the future:
> 
> /* ECAM ops */
> const struct pci_ecam_ops nwl_pcie_ops = {
>      .bus_shift  = 20,
>      .cfg_reg_index = nwl_cfg_reg_index,
>      .pci_ops    = {
>          .map_bus                = pci_ecam_map_bus,
>          .read                   = pci_generic_config_read,
>          .write                  = pci_generic_config_write,
>          .need_p2m_mapping       = pci_ecam_need_p2m_mapping,
>      }
> };
> 
> DT_DEVICE_START(pci_gen, "PCI HOST ZYNQMP", DEVICE_PCI)
> .dt_match = nwl_pcie_dt_match,
> .init = pci_host_common_probe,
> DT_DEVICE_END

OK then
--8323329-1032229729-1632411330=:17979--

