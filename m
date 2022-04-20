Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDF8507D7B
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 02:13:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308492.524248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngxyA-0005Pq-Dl; Wed, 20 Apr 2022 00:13:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308492.524248; Wed, 20 Apr 2022 00:13:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngxyA-0005Nd-Ay; Wed, 20 Apr 2022 00:13:18 +0000
Received: by outflank-mailman (input) for mailman id 308492;
 Wed, 20 Apr 2022 00:13:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HBwa=U6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ngxy8-0005NX-Lm
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 00:13:16 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab5b812a-c03e-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 02:13:14 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1B0E26130B;
 Wed, 20 Apr 2022 00:13:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEFEFC385A7;
 Wed, 20 Apr 2022 00:13:09 +0000 (UTC)
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
X-Inumbo-ID: ab5b812a-c03e-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650413592;
	bh=13XZdxnntjNGDo+tym68pISCyqOzumLbemYUC8PseRY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jYIohIdv4SNyImYHqZh13OB3arIsnobjAq016ucb1NfnlcbUwEno8q78fwiGhoLOX
	 kNnu8jvJxW7bRm413yfS2hH0CdK9RMFRzkNLv2X3zjQruFbeI7N8jVXdknS/bnMo8M
	 z0BK7YSwlHMDu4FdunUIIwVY4AIMDCqrJJSDbkRuNo6Cyg42Uz+zQFXmdmE1gEoIKi
	 BABiC5yJKjaEqlZbsp37aPXgy458LWP1cw1Y2FjvWHA1V0VXwKkdypUDw+dLYrFB71
	 e2aCqSZzGYf5KyFkQkqzdi/dtGXKVm3TcI1fytVSQzVZZYYH79t2vb/YYSt088WnAX
	 E3O3QbP/2qx7w==
Date: Tue, 19 Apr 2022 17:13:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr <olekstysh@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, 
    Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Jiamei Xie <Jiamei.Xie@arm.com>, Henry Wang <Henry.Wang@arm.com>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH V7 2/2] libxl: Introduce basic virtio-mmio support on
 Arm
In-Reply-To: <6f2a970e-36b4-b2d4-a0ee-04f3ab31b985@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2204191712560.915916@ubuntu-linux-20-04-desktop>
References: <1649442065-8332-1-git-send-email-olekstysh@gmail.com> <1649442065-8332-3-git-send-email-olekstysh@gmail.com> <alpine.DEB.2.22.394.2204181417370.915916@ubuntu-linux-20-04-desktop> <6f2a970e-36b4-b2d4-a0ee-04f3ab31b985@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1890296696-1650413593=:915916"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1890296696-1650413593=:915916
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 19 Apr 2022, Oleksandr wrote:
> On 19.04.22 00:41, Stefano Stabellini wrote:
> Hello Stefano
> 
> > On Fri, 8 Apr 2022, Oleksandr Tyshchenko wrote:
> > > From: Julien Grall <julien.grall@arm.com>
> > > 
> > > This patch introduces helpers to allocate Virtio MMIO params
> > > (IRQ and memory region) and create specific device node in
> > > the Guest device-tree with allocated params. In order to deal
> > > with multiple Virtio devices, reserve corresponding ranges.
> > > For now, we reserve 1MB for memory regions and 10 SPIs.
> > > 
> > > As these helpers should be used for every Virtio device attached
> > > to the Guest, call them for Virtio disk(s).
> > > 
> > > Please note, with statically allocated Virtio IRQs there is
> > > a risk of a clash with a physical IRQs of passthrough devices.
> > > For the first version, it's fine, but we should consider allocating
> > > the Virtio IRQs automatically. Thankfully, we know in advance which
> > > IRQs will be used for passthrough to be able to choose non-clashed
> > > ones.
> > > 
> > > Signed-off-by: Julien Grall <julien.grall@arm.com>
> > > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > Tested-by: Jiamei Xie <Jiamei.xie@arm.com>
> > > Reviewed-by: Henry Wang <Henry.Wang@arm.com>
> > I realize that we are at v7 and I haven't reviewed this before, so I'll
> > limit my comments. I'll clarify the ones that I think are more important
> > from the one that are less important.
> 
> thank you
> 
> 
> > 
> > 
> > > ---
> > > @Jiamei, @Henry I decided to leave your T-b and R-b tags with the minor
> > > change I made, are you still happy with that?
> > > 
> > > s/if (disk->virtio)/if (disk->protocol == LIBXL_DISK_PROTOCOL_VIRTIO_MMIO)
> > > 
> > > Please note, this is a split/cleanup/hardening of Julien's PoC:
> > > "Add support for Guest IO forwarding to a device emulator"
> > > 
> > > Changes RFC -> V1:
> > >     - was squashed with:
> > >       "[RFC PATCH V1 09/12] libxl: Handle virtio-mmio irq in more correct
> > > way"
> > >       "[RFC PATCH V1 11/12] libxl: Insert "dma-coherent" property into
> > > virtio-mmio device node"
> > >       "[RFC PATCH V1 12/12] libxl: Fix duplicate memory node in DT"
> > >     - move VirtIO MMIO #define-s to xen/include/public/arch-arm.h
> > > 
> > > Changes V1 -> V2:
> > >     - update the author of a patch
> > > 
> > > Changes V2 -> V3:
> > >     - no changes
> > > 
> > > Changes V3 -> V4:
> > >     - no changes
> > > 
> > > Changes V4 -> V5:
> > >     - split the changes, change the order of the patches
> > >     - drop an extra "virtio" configuration option
> > >     - update patch description
> > >     - use CONTAINER_OF instead of own implementation
> > >     - reserve ranges for Virtio MMIO params and put them
> > >       in correct location
> > >     - create helpers to allocate Virtio MMIO params, add
> > >       corresponding sanity-сhecks
> > >     - add comment why MMIO size 0x200 is chosen
> > >     - update debug print
> > >     - drop Wei's T-b
> > > 
> > > Changes V5 -> V6:
> > >     - rebase on current staging
> > > 
> > > Changes V6 -> V7:
> > >     - rebase on current staging
> > >     - add T-b and R-b tags
> > >     - update according to the recent changes to
> > >       "libxl: Add support for Virtio disk configuration"
> > > ---
> > >   tools/libs/light/libxl_arm.c  | 131
> > > +++++++++++++++++++++++++++++++++++++++++-
> > >   xen/include/public/arch-arm.h |   7 +++
> > >   2 files changed, 136 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> > > index eef1de0..8132a47 100644
> > > --- a/tools/libs/light/libxl_arm.c
> > > +++ b/tools/libs/light/libxl_arm.c
> > > @@ -8,6 +8,56 @@
> > >   #include <assert.h>
> > >   #include <xen/device_tree_defs.h>
> > >   +/*
> > > + * There is no clear requirements for the total size of Virtio MMIO
> > > region.
> > > + * The size of control registers is 0x100 and device-specific
> > > configuration
> > > + * registers starts at the offset 0x100, however it's size depends on the
> > > device
> > > + * and the driver. Pick the biggest known size at the moment to cover
> > > most
> > > + * of the devices (also consider allowing the user to configure the size
> > > via
> > > + * config file for the one not conforming with the proposed value).
> > > + */
> > > +#define VIRTIO_MMIO_DEV_SIZE   xen_mk_ullong(0x200)
> > Actually, I don't think we need to make this generic. We only support
> > virtio-disk now and I think it is fine if this was called
> > VIRTIO_DISK_MMIO_DEV_SIZE and the size was exactly the size needed by
> > virtio-disk. When/if we support another virtio protocol we can add set
> > the appropriate size of that one as well.
> 
> I would prefer if we keep this generic, although we are going to support
> virtio-blk as the first virtio-mmio device, there is nothing disk specific in
> that value. The same value (0x200) is used
> by SW which also generates virtio-mmio device tree nodes like we do in Xen
> libxl, I am speaking about kvmtool, Qemu here.

OK
--8323329-1890296696-1650413593=:915916--

