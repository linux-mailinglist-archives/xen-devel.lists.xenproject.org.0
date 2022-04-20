Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D97350932F
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 00:49:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309665.526071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhJ8q-0001S5-Cc; Wed, 20 Apr 2022 22:49:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309665.526071; Wed, 20 Apr 2022 22:49:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhJ8q-0001Pz-92; Wed, 20 Apr 2022 22:49:44 +0000
Received: by outflank-mailman (input) for mailman id 309665;
 Wed, 20 Apr 2022 22:49:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HBwa=U6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nhJ8p-0001Pr-84
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 22:49:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29c08f72-c0fc-11ec-a405-831a346695d4;
 Thu, 21 Apr 2022 00:49:41 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5ACCF61A39;
 Wed, 20 Apr 2022 22:49:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 142AAC385A1;
 Wed, 20 Apr 2022 22:49:39 +0000 (UTC)
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
X-Inumbo-ID: 29c08f72-c0fc-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650494979;
	bh=lIuJHhHOgNuH1ROpspFRdUfMt//99S18SoadoZcLQ2w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bQLXb4+jDgHanXvy1kPZqJpVUHaPlyhmwkJTT7UNgx6lSUQEvTFtZNElWpCfHZM2u
	 uSEm9wwnaR67kRfA5QV+fwx2TN5CWRNIFZlwplJoIosnwbj/P7jodXPk9UFZXnhV1G
	 39b3QDB3cT6cqhdr3poCNwmYKOpbF+iwDGmBlu0yK0u56QYoZqRjPcXHMIqZqmkZEM
	 HUNCmTOTdLEbpbw5q9JvIriss3MOvFAXZ4uJTBMG1kdVTFXqfnlspAFGNowJH7ICom
	 a1YivhPopzQ937np+UCWLRf8YleU+8D3WSmiRmhU4i/pvx3H8JdMYVNXZFKnUNR652
	 25koJk+3aRWmQ==
Date: Wed, 20 Apr 2022 15:49:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr <olekstysh@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Juergen Gross <jgross@suse.com>, Christoph Hellwig <hch@infradead.org>, 
    xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Julien Grall <julien@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC PATCH 6/6] arm/xen: Assign xen-virtio DMA ops for virtio
 devices in Xen guests
In-Reply-To: <7047c7a7-47a0-d446-3b99-94bd552ec90f@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2204201549270.915916@ubuntu-linux-20-04-desktop>
References: <1649963973-22879-1-git-send-email-olekstysh@gmail.com> <1649963973-22879-7-git-send-email-olekstysh@gmail.com> <alpine.DEB.2.22.394.2204151305050.915916@ubuntu-linux-20-04-desktop> <YlpdBHKT1bYzZe2e@infradead.org> <f879622e-5656-deb1-1930-f0cd180a4ab1@gmail.com>
 <alpine.DEB.2.22.394.2204181202080.915916@ubuntu-linux-20-04-desktop> <6a04cc34-fbb3-44d8-c1a4-03bda5b3deb1@gmail.com> <b68163be-ad43-7773-22ff-e83191886626@suse.com> <5afb9e61-4164-9cc9-278a-911fc21f4f6c@gmail.com> <alpine.DEB.2.22.394.2204191717020.915916@ubuntu-linux-20-04-desktop>
 <7047c7a7-47a0-d446-3b99-94bd552ec90f@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1919739536-1650494979=:915916"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1919739536-1650494979=:915916
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 20 Apr 2022, Oleksandr wrote:
> On 20.04.22 03:23, Stefano Stabellini wrote:
> > On Tue, 19 Apr 2022, Oleksandr wrote:
> > > On 19.04.22 17:48, Juergen Gross wrote:
> > > > On 19.04.22 14:17, Oleksandr wrote:
> > > > > Hello Stefano, Juergen
> > > > > 
> > > > > 
> > > > > On 18.04.22 22:11, Stefano Stabellini wrote:
> > > > > > On Mon, 18 Apr 2022, Oleksandr wrote:
> > > > > > > On 16.04.22 09:07, Christoph Hellwig wrote:
> > > > > > > 
> > > > > > > Hello Christoph
> > > > > > > 
> > > > > > > > On Fri, Apr 15, 2022 at 03:02:45PM -0700, Stefano Stabellini
> > > > > > > > wrote:
> > > > > > > > > This makes sense overall. Considering that the swiotlb-xen
> > > > > > > > > case
> > > > > > > > > and the
> > > > > > > > > virtio case are mutually exclusive, I would write it like
> > > > > > > > > this:
> > > > > > > > Curious question:  Why can't the same grant scheme also be used
> > > > > > > > for
> > > > > > > > non-virtio devices?  I really hate having virtio hooks in the
> > > > > > > > arch
> > > > > > > > dma code.  Why can't Xen just say in DT/ACPI that grants can be
> > > > > > > > used
> > > > > > > > for a given device?
> > > > > > [...]
> > > > > > 
> > > > > > > This patch series tries to make things work with "virtio" devices
> > > > > > > in
> > > > > > > Xen
> > > > > > > system without introducing any modifications to code under
> > > > > > > drivers/virtio.
> > > > > > Actually, I think Christoph has a point.
> > > > > > 
> > > > > > There is nothing inherently virtio specific in this patch series or
> > > > > > in
> > > > > > the "xen,dev-domid" device tree binding.
> > > > > 
> > > > > Although the main intention of this series was to enable using virtio
> > > > > devices in Xen guests, I agree that nothing in new DMA ops layer
> > > > > (xen-virtio.c) is virtio specific (at least at the moment). Regarding
> > > > > the
> > > > > whole patch series I am not quite sure, as it uses
> > > > > arch_has_restricted_virtio_memory_access(). >
> > > > > >    Assuming a given device is
> > > > > > emulated by a Xen backend, it could be used with grants as well.
> > > > > > 
> > > > > > For instance, we could provide an emulated e1000 NIC with a
> > > > > > "xen,dev-domid" property in device tree. Linux could use grants with
> > > > > > it
> > > > > > and the backend could map the grants. It would work the same way as
> > > > > > virtio-net/block/etc. Passthrough devices wouldn't have the
> > > > > > "xen,dev-domid" property, so no problems.
> > > > > > 
> > > > > > So I think we could easily generalize this work and expand it to any
> > > > > > device. We just need to hook on the "xen,dev-domid" device tree
> > > > > > property.
> > > > > > 
> > > > > > I think it is just a matter of:
> > > > > > - remove the "virtio,mmio" check from xen_is_virtio_device
> > > > > > - rename xen_is_virtio_device to something more generic, like
> > > > > >     xen_is_grants_device
> > > > xen_is_grants_dma_device, please. Normal Xen PV devices are covered by
> > > > grants, too, and I'd like to avoid the confusion arising from this.
> > > 
> > > yes, this definitely makes sense as we need to distinguish
> > > 
> > > 
> > > > 
> > > > > > - rename xen_virtio_setup_dma_ops to something more generic, like
> > > > > >     xen_grants_setup_dma_ops
> > > > > > 
> > > > > > And that's pretty much it.
> > > > > + likely renaming everything in that patch series not to mention
> > > > > virtio
> > > > > (mostly related to xen-virtio.c internals).
> > > > > 
> > > > > 
> > > > > Stefano, thank you for clarifying Christoph's point.
> > > > > 
> > > > > Well, I am not against going this direction. Could we please make a
> > > > > decision on this? @Juergen, what is your opinion?
> > > > Yes, why not.
> > > 
> > > ok, thank you for confirming.
> > > 
> > > 
> > > > 
> > > > Maybe rename xen-virtio.c to grant-dma.c?
> > > 
> > > Personally I don't mind.
> > > 
> > > 
> > > > I'd keep the XEN_VIRTIO related config option, as this will be the
> > > > normal
> > > > use
> > > > case. grant-dma.c should be covered by a new hidden config option
> > > > XEN_GRANT_DMA
> > > > selected by XEN_VIRTIO.
> > > 
> > > I got it, ok
> > > 
> > > 
> > > > 
> > > > CONFIG_XEN_VIRTIO should still guard
> > > > xen_has_restricted_virtio_memory_access().
> > > 
> > > ok
> > > 
> > > 
> > > So a few questions to clarify:
> > > 
> > > 1. What is the best place to keep "xen,dev-domid" binding's description
> > > now? I
> > > think that proposed in current series place
> > > (Documentation/devicetree/bindings/virtio/) is not good fit now.
> > I would probably add it to the existing
> > Documentation/devicetree/bindings/arm/xen.txt.
> > 
> > 
> > > 2. I assume the logic in the current patch will remain the same, I mean we
> > > will still assign Xen grant DMA ops from xen_setup_dma_ops() here?
> > Yes I think so
> 
> 
> Stefano, thank you for clarifying!
> 
> 
> Regarding new naming scheme...
> 
> As there is an existing Kconfig option XEN_GRANT_DMA_ALLOC used for different
> purpose, we need to clarify naming scheme here a bit to avoid possible
> confusion.
> 
> For example, I am happy with proposed by Juergen ...
> 
> ... Kconfig option: XEN_GRANT_DMA_OPS
> 
> and
> 
> ... file: grant-dma-ops.c

I think that's fine by me
--8323329-1919739536-1650494979=:915916--

