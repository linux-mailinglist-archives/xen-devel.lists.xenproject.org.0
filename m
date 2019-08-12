Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD3D8B039
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 08:55:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxQfr-0001mF-VF; Tue, 13 Aug 2019 06:52:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZmNG=WJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hxQfp-0001lo-Sm
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 06:52:49 +0000
X-Inumbo-ID: 7e05a912-bd2c-11e9-bbd4-376addcce52e
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7e05a912-bd2c-11e9-bbd4-376addcce52e;
 Mon, 12 Aug 2019 18:10:40 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A37BC2067D;
 Mon, 12 Aug 2019 18:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565633439;
 bh=YT1O0Sg/qejJ4xtYZLw1+PO/9wBid5Jp/Y7SUPE83Hk=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=m/6E9XLbSghQJzZbtxJrdvir2T8ZVlCyxu0esMnGX2mFkevobY5OWWvOnqAIglS1R
 H/7c5mMp2ys+YyMIWjWHgLBypa7ivb0Vl/Sri8o5x8fw43TeiSVxCLyYnXhEqTzXmB
 OnFzw9YWqJyMCInhTVkWrtU5S+Ru/k8X1Jx31beM=
Date: Mon, 12 Aug 2019 11:10:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@gmail.com>
In-Reply-To: <CAF3u54BMTPVAVw6Ge=2NGB_YRL7k50jqo7ktGCmuhUFSSXg+rg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.1908121110270.7788@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908061428420.2451@sstabellini-ThinkPad-T480s>
 <20190806214925.7534-3-sstabellini@kernel.org>
 <ac88a18f-0651-628c-fb74-e979f26df6b3@arm.com>
 <alpine.DEB.2.21.1908091515220.7788@sstabellini-ThinkPad-T480s>
 <CAF3u54BMTPVAVw6Ge=2NGB_YRL7k50jqo7ktGCmuhUFSSXg+rg@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-749902682-1565633439=:7788"
Subject: Re: [Xen-devel] [PATCH v4 3/7] xen/arm: keep track of
 reserved-memory regions
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Stabellini <stefanos@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-749902682-1565633439=:7788
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sat, 10 Aug 2019, Julien Grall wrote:
> On Fri, 9 Aug 2019, 23:21 Stefano Stabellini, <sstabellini@kernel.org> wrote:
>       On Wed, 7 Aug 2019, Julien Grall wrote:
>       > Hi Stefano,
>       >
>       > On 06/08/2019 22:49, Stefano Stabellini wrote:
>       > > As we parse the device tree in Xen, keep track of the reserved-memory
>       > > regions as they need special treatment (follow-up patches will make use
>       > > of the stored information.)
>       > >
>       > > Reuse process_memory_node to add reserved-memory regions to the
>       > > bootinfo.reserved_mem array.
>       > >
>       > > Refuse to continue once we reach the max number of reserved memory
>       > > regions to avoid accidentally mapping any portions of them into a VM.
>       > >
>       > > Signed-off-by: Stefano Stabellini <stefanos@xilinx.com>
>       > >
>       > > ---
>       > > Changes in v4:
>       > > - depth + 1 in process_reserved_memory_node
>       >
>       > Ah, you fixed it in this patch. But then, this does not match the
>       > documentation in patch #1.
> 
>       Yes good point, see below
> 
> 
>       > > - pass address_cells and size_cells to device_tree_for_each_node
>       > > - pass struct meminfo * instead of a boolean to process_memory_node
>       > > - improve in-code comment
>       >
>       > I can't see any comment, is that an improvement? :)
> 
>       It got lost with the refactoring of the code, but I don't think we need
>       it anymore
> 
> 
>       > > - use a separate process_reserved_memory_node (separate from
>       > >    process_memory_node) function wrapper to have different error handling
>       > >
>       > > Changes in v3:
>       > > - match only /reserved-memory
>       > > - put the warning back in place for reg not present on a normal memory
>       > >    region
>       > > - refuse to continue once we reach the max number of reserved memory
>       > >    regions
>       > >
>       > > Changes in v2:
>       > > - call process_memory_node from process_reserved_memory_node to avoid
>       > >    duplication
>       > > ---
>       > >   xen/arch/arm/bootfdt.c      | 43 +++++++++++++++++++++++++++++++------
>       > >   xen/include/asm-arm/setup.h |  1 +
>       > >   2 files changed, 38 insertions(+), 6 deletions(-)
>       > >
>       > > diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
>       > > index c22d57cd72..3e6fd63b16 100644
>       > > --- a/xen/arch/arm/bootfdt.c
>       > > +++ b/xen/arch/arm/bootfdt.c
>       > > @@ -144,6 +144,7 @@ static int __init process_memory_node(const void *fdt,
>       > > int node,
>       > >       const __be32 *cell;
>       > >       paddr_t start, size;
>       > >       u32 reg_cells = address_cells + size_cells;
>       > > +    struct meminfo *mem = (struct meminfo *)data;
>       >
>       > The cast is unnecessary.
>       >
>       > The rest of the code looks good. Pending the discussion about
>       > device_tree_for_each_node:
>       >
>       > Acked-by: Julien Grall <julien.grall@arm.com>
> 
>       Thank you. I removed the cast. Also, I think that it makes more sense to
>       do the depth increase (depth + 1) inside the implementation of
>       device_tree_for_each_node instead of at the caller site, like it is done
>       in this patch. This would match the documentation better and is cleaner
>       from an interface point of view. So I'll remove the depth increase from
>       this patch and move it to the first patch (min_depth = depth + 1).
> 
> 
> Well, you don't need to pass the depth at all. It is just an artificial number for libfdt to know were to stop.
> 
> We also don't need the absolute depth in any of the early FDT. The relative one is sufficient.

Yes, you are right, good suggestion
--8323329-749902682-1565633439=:7788
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-749902682-1565633439=:7788--

