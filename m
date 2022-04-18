Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 919B1505E40
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 21:11:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307542.522689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngWmG-0003ti-0c; Mon, 18 Apr 2022 19:11:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307542.522689; Mon, 18 Apr 2022 19:11:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngWmF-0003qz-Sm; Mon, 18 Apr 2022 19:11:11 +0000
Received: by outflank-mailman (input) for mailman id 307542;
 Mon, 18 Apr 2022 19:11:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hjWk=U4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ngWmD-0003qt-Fb
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 19:11:09 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49ba0603-bf4b-11ec-a405-831a346695d4;
 Mon, 18 Apr 2022 21:11:03 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C1F2160C33;
 Mon, 18 Apr 2022 19:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A80A8C385A7;
 Mon, 18 Apr 2022 19:11:00 +0000 (UTC)
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
X-Inumbo-ID: 49ba0603-bf4b-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650309061;
	bh=FqMrB3LTVheJzBcEVjR9TRPvl3+5WxICePYJ9H+WYRE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iaOMCyRQAZv6m5n78HaBURxK4NMMAN9CI4xs+oSzDJbyFRw0xw+JmtcXEZiLYs6f6
	 sWQZINgA/mWWsVjHbXZpZgKYQBG/nbrRkzD9Ng31J6SrfwKPZnCBJ4uvKKloxPuIYU
	 gmBsGOVzZg3RriB3VWqZ9plK2DvIAG+cH3w10+YrNfgRh2sngFmSSehrUFTciYqu7T
	 zT5w8FDN0R3R3txesKnzG9aufRHfEwzLWhFmgeulNNrs5UcXMXLPapHGO/BNvf2NOf
	 jC57LqnXClajT8Mqetp1AltnOuq2ME4B5BFkhuLGN6A/2//wMDcXj42G2e90kh+jIQ
	 zqiUjbXtEVKYw==
Date: Mon, 18 Apr 2022 12:11:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr <olekstysh@gmail.com>
cc: Christoph Hellwig <hch@infradead.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>, 
    "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC PATCH 6/6] arm/xen: Assign xen-virtio DMA ops for virtio
 devices in Xen guests
In-Reply-To: <f879622e-5656-deb1-1930-f0cd180a4ab1@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2204181202080.915916@ubuntu-linux-20-04-desktop>
References: <1649963973-22879-1-git-send-email-olekstysh@gmail.com> <1649963973-22879-7-git-send-email-olekstysh@gmail.com> <alpine.DEB.2.22.394.2204151305050.915916@ubuntu-linux-20-04-desktop> <YlpdBHKT1bYzZe2e@infradead.org>
 <f879622e-5656-deb1-1930-f0cd180a4ab1@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 18 Apr 2022, Oleksandr wrote:
> On 16.04.22 09:07, Christoph Hellwig wrote:
> 
> Hello Christoph
> 
> > On Fri, Apr 15, 2022 at 03:02:45PM -0700, Stefano Stabellini wrote:
> > > This makes sense overall. Considering that the swiotlb-xen case and the
> > > virtio case are mutually exclusive, I would write it like this:
> > Curious question:  Why can't the same grant scheme also be used for
> > non-virtio devices?  I really hate having virtio hooks in the arch
> > dma code.  Why can't Xen just say in DT/ACPI that grants can be used
> > for a given device?

[...]

> This patch series tries to make things work with "virtio" devices in Xen
> system without introducing any modifications to code under drivers/virtio.


Actually, I think Christoph has a point.

There is nothing inherently virtio specific in this patch series or in
the "xen,dev-domid" device tree binding. Assuming a given device is
emulated by a Xen backend, it could be used with grants as well.

For instance, we could provide an emulated e1000 NIC with a
"xen,dev-domid" property in device tree. Linux could use grants with it
and the backend could map the grants. It would work the same way as
virtio-net/block/etc. Passthrough devices wouldn't have the
"xen,dev-domid" property, so no problems.

So I think we could easily generalize this work and expand it to any
device. We just need to hook on the "xen,dev-domid" device tree
property.

I think it is just a matter of:
- remove the "virtio,mmio" check from xen_is_virtio_device
- rename xen_is_virtio_device to something more generic, like
  xen_is_grants_device
- rename xen_virtio_setup_dma_ops to something more generic, like
  xen_grants_setup_dma_ops

And that's pretty much it.

