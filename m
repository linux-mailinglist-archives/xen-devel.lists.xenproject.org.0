Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9664F41B393
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 18:12:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198123.351454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVFi5-0004Gs-JK; Tue, 28 Sep 2021 16:12:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198123.351454; Tue, 28 Sep 2021 16:12:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVFi5-0004Eg-Fw; Tue, 28 Sep 2021 16:12:01 +0000
Received: by outflank-mailman (input) for mailman id 198123;
 Tue, 28 Sep 2021 16:11:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gf2A=OS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mVFi3-0004EK-P5
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 16:11:59 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id da718de5-93a7-426e-8c75-50d5a68fe433;
 Tue, 28 Sep 2021 16:11:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D666B60F24;
 Tue, 28 Sep 2021 16:11:57 +0000 (UTC)
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
X-Inumbo-ID: da718de5-93a7-426e-8c75-50d5a68fe433
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632845517;
	bh=OFwRnUPTbnyoe0TzkxFtbbQ7PcfvetoGmafQ5IKdHLE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Elz6LBXZ5fgppsnMq6FKn9e5YNZkQWh3a1YaVfsiLEt/1JfCjSPZECSRv8BfUGIxz
	 4U9dMn59/JC9/O7O/DRKZolbYWqxgmil+lagOYpXViVUjjtyF/JsqTitcekSUpcF3E
	 Tl6qRdSoPEee2YT6/mV2tdhlV1uRydAPbjxDkSwgFcW14vkl8rXVz06oD6tBwKu5Vg
	 9KjHLK63zZjVx7U2GAdPn1L427++gZpK7pBNpOwR806FdtU2ac9VQf/ByV2/3cb8ti
	 gBuC2nfzYZWUmNLLVMw6lTqCdwlQurUTySzCHGpfMMrLEvjm66gvqMPUmpZkZVhU43
	 cxj32fKKr4tyg==
Date: Tue, 28 Sep 2021 09:11:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "julien@xen.org" <julien@xen.org>, 
    Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Artem Mygaiev <Artem_Mygaiev@epam.com>, 
    "roger.pau@citrix.com" <roger.pau@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH v2 10/11] xen/arm: Do not map PCI ECAM and MMIO space to
 Domain-0's p2m
In-Reply-To: <32ffee9e-8786-c91b-681c-7fa243f5d3fa@epam.com>
Message-ID: <alpine.DEB.2.21.2109280911030.5022@sstabellini-ThinkPad-T480s>
References: <20210923125438.234162-1-andr2000@gmail.com> <20210923125438.234162-11-andr2000@gmail.com> <alpine.DEB.2.21.2109241724210.17979@sstabellini-ThinkPad-T480s> <d5704571-eade-4bc8-b6c6-f4b3810b8b21@epam.com> <alpine.DEB.2.21.2109272046320.5022@sstabellini-ThinkPad-T480s>
 <cc05efe3-2b3a-be03-2c17-21578b09a013@epam.com> <32ffee9e-8786-c91b-681c-7fa243f5d3fa@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1136262037-1632845517=:5022"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1136262037-1632845517=:5022
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 28 Sep 2021, Oleksandr Andrushchenko wrote:
> [snip]
> >> Sorry I didn't follow your explanation.
> >>
> >> My suggestion is to remove the #ifdef CONFIG_HAS_PCI completely from
> >> map_range_to_domain. At the beginning of map_range_to_domain, there is
> >> already this line:
> >>
> >> bool need_mapping = !dt_device_for_passthrough(dev);
> >>
> >> We can change it into:
> >>
> >> bool need_mapping = !dt_device_for_passthrough(dev) &&
> >>                       !mr_data->skip_mapping;
> >>
> >>
> >> Then, in map_device_children we can set mr_data->skip_mapping to true
> >> for PCI devices.
> > This is the key. I am fine with this, but it just means we move the
> >
> > check to the outside of this function which looks good. Will do
> >
> >>    There is already a pci check there:
> >>
> >>    if ( dt_device_type_is_equal(dev, "pci") )
> >>
> >> so it should be easy to do. What am I missing?
> >>
> >>
> >
> I did some experiments. If we move the check to map_device_children
> 
> it is not enough because part of the ranges is still mapped at handle_device level:
> 
> handle_device:
> (XEN) --- /axi/pcie@fd0e0000 need_mapping 1 addr fd0e0000
> (XEN) --- /axi/pcie@fd0e0000 need_mapping 1 addr fd480000
> (XEN) --- /axi/pcie@fd0e0000 need_mapping 1 addr 8000000000
> 
> map_device_children:
> (XEN) Mapping children of /axi/pcie@fd0e0000 to guest skip 1
> (XEN) --- /axi/pcie@fd0e0000 need_mapping 0 addr e0000000
> (XEN) --- /axi/pcie@fd0e0000 need_mapping 0 addr 600000000
> 
> pci_host_bridge_mappings:
> (XEN) --- /axi/pcie@fd0e0000 need_mapping 1 addr fd0e0000
> (XEN) --- /axi/pcie@fd0e0000 need_mapping 1 addr fd480000
> 
> So, I did more intrusive change:
> 
> @@ -1540,6 +1534,12 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
>       int res;
>       u64 addr, size;
>       bool need_mapping = !dt_device_for_passthrough(dev);
> +    struct map_range_data mr_data = {
> +        .d = d,
> +        .p2mt = p2mt,
> +        .skip_mapping = is_pci_passthrough_enabled() &&
> +                        (device_get_class(dev) == DEVICE_PCI)
> +    };
> 
> With this I see that now mappings are done correctly:
> 
> handle_device:
> (XEN) --- /axi/pcie@fd0e0000 need_mapping 0 addr fd0e0000
> (XEN) --- /axi/pcie@fd0e0000 need_mapping 0 addr fd480000
> (XEN) --- /axi/pcie@fd0e0000 need_mapping 0 addr 8000000000
> 
> map_device_children:
> (XEN) Mapping children of /axi/pcie@fd0e0000 to guest skip 1
> (XEN) --- /axi/pcie@fd0e0000 need_mapping 0 addr e0000000
> (XEN) --- /axi/pcie@fd0e0000 need_mapping 0 addr 600000000
> 
> pci_host_bridge_mappings:
> (XEN) --- /axi/pcie@fd0e0000 need_mapping 1 addr fd0e0000
> (XEN) --- /axi/pcie@fd0e0000 need_mapping 1 addr fd480000
> 
> So, handle_device seems to be the right place. While at it I have also
> 
> optimized the way we setup struct map_range_data mr_data in both
> 
> handle_device and map_device_children: I removed structure initialization
> 
> from within the relevant loop and also pass mr_data to map_device_children,
> 
> so it doesn't need to create its own copy of the same and perform yet
> 
> another computation for .skip_mapping: it does need to not only know
> 
> that dev is a PCI device (this is done by the dt_device_type_is_equal(dev, "pci")
> 
> check, but also account on is_pci_passthrough_enabled().
> 
> Thus, the change will be more intrusive, but I hope will simplify things.
> 
> I am attaching the fixup patch for just in case you want more details.

Yes, thanks, this is what I had in mind. Hopefully the resulting
combined patch will be simpler.

Cheers,

Stefano
--8323329-1136262037-1632845517=:5022--

