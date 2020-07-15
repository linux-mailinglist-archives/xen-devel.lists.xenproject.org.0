Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D76B6221329
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 19:06:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvkr6-0007Z6-NR; Wed, 15 Jul 2020 17:06:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cSQs=A2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jvkr4-0007Yz-Kz
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 17:06:02 +0000
X-Inumbo-ID: 75f660fe-c6bd-11ea-bb8b-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 75f660fe-c6bd-11ea-bb8b-bc764e2007e4;
 Wed, 15 Jul 2020 17:06:02 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0D53F2065E;
 Wed, 15 Jul 2020 17:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594832761;
 bh=MVQs60eyaseKttygMi5Okmio5UqpxovjpBaGYM2KopU=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=CBPLDZ0a2kofL5+ir7rsYDlbbpzpSFpGzRjY5GXtgxKoOkAVo9rx/IXw2nZaAg6FP
 0PGoTpRFSOeEWLcCxLE4J3D3xFoVDU+sXxptoew5BleNGM0IN0YcxXbu+SlhudGRTe
 VCtmQZUU53N6u7CQ+nguMHVqQdrr4STCBfllpVWM=
Date: Wed, 15 Jul 2020 10:06:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] xen: introduce xen_vring_use_dma
In-Reply-To: <20200711144334-mutt-send-email-mst@kernel.org>
Message-ID: <alpine.DEB.2.21.2007151001140.4124@sstabellini-ThinkPad-T480s>
References: <20200624163940-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241351430.8121@sstabellini-ThinkPad-T480s>
 <20200624181026-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006251014230.8121@sstabellini-ThinkPad-T480s>
 <20200626110629-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006291621300.8121@sstabellini-ThinkPad-T480s>
 <20200701133456.GA23888@infradead.org>
 <alpine.DEB.2.21.2007011020320.8121@sstabellini-ThinkPad-T480s>
 <20200701172219-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2007101019340.4124@sstabellini-ThinkPad-T480s>
 <20200711144334-mutt-send-email-mst@kernel.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: jgross@suse.com, Peng Fan <peng.fan@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>, konrad.wilk@oracle.com,
 jasowang@redhat.com, x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org,
 linux-imx@nxp.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sat, 11 Jul 2020, Michael S. Tsirkin wrote:
> On Fri, Jul 10, 2020 at 10:23:22AM -0700, Stefano Stabellini wrote:
> > Sorry for the late reply -- a couple of conferences kept me busy.
> > 
> > 
> > On Wed, 1 Jul 2020, Michael S. Tsirkin wrote:
> > > On Wed, Jul 01, 2020 at 10:34:53AM -0700, Stefano Stabellini wrote:
> > > > Would you be in favor of a more flexible check along the lines of the
> > > > one proposed in the patch that started this thread:
> > > > 
> > > >     if (xen_vring_use_dma())
> > > >             return true;
> > > > 
> > > > 
> > > > xen_vring_use_dma would be implemented so that it returns true when
> > > > xen_swiotlb is required and false otherwise.
> > > 
> > > Just to stress - with a patch like this virtio can *still* use DMA API
> > > if PLATFORM_ACCESS is set. So if DMA API is broken on some platforms
> > > as you seem to be saying, you guys should fix it before doing something
> > > like this..
> > 
> > Yes, DMA API is broken with some interfaces (specifically: rpmesg and
> > trusty), but for them PLATFORM_ACCESS is never set. That is why the
> > errors weren't reported before. Xen special case aside, there is no
> > problem under normal circumstances.
> 
> So why not fix DMA API? Then this patch is not needed.

It looks like the conversation is going in circles :-)

I tried to explain the reason why, even if we fixed the DMA API to work
with rpmesg and trusty, we still need this patch with the following
email:  https://marc.info/?l=linux-kernel&m=159347446709625&w=2


At that time it looked like you agreed that we needed to improve this
check?  (https://marc.info/?l=linux-kernel&m=159363662418250&w=2)

