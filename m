Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD56211207
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 19:35:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqgdN-00005x-Mf; Wed, 01 Jul 2020 17:34:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lceB=AM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jqgdM-00005s-8c
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 17:34:56 +0000
X-Inumbo-ID: 2d5a53fc-bbc1-11ea-874c-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2d5a53fc-bbc1-11ea-874c-12813bfff9fa;
 Wed, 01 Jul 2020 17:34:55 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5CDCB20781;
 Wed,  1 Jul 2020 17:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593624894;
 bh=7gRGt637RJr7xqh8m9IFhKHH4colOY8f4NtES4RwwhY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=s4JTo+sHZ5kueHTuTEAo2QGy2uhqmeAHdidNDEG2j3pV3VxRg5Xv6wKav2TR+6t4b
 XUiS73u1pvO97HpBjUcfEuJ+XpBhQ0M0mFiLtwwqKmYcxdiCP4RGhschpBHp6VSQJP
 m93SVv9K90jHvPW8nUrDpWPn4XcEaTHFUj4sKDZM=
Date: Wed, 1 Jul 2020 10:34:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] xen: introduce xen_vring_use_dma
In-Reply-To: <20200701133456.GA23888@infradead.org>
Message-ID: <alpine.DEB.2.21.2007011020320.8121@sstabellini-ThinkPad-T480s>
References: <20200624091732.23944-1-peng.fan@nxp.com>
 <20200624050355-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241047010.8121@sstabellini-ThinkPad-T480s>
 <20200624163940-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241351430.8121@sstabellini-ThinkPad-T480s>
 <20200624181026-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006251014230.8121@sstabellini-ThinkPad-T480s>
 <20200626110629-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006291621300.8121@sstabellini-ThinkPad-T480s>
 <20200701133456.GA23888@infradead.org>
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
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-imx@nxp.com,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 1 Jul 2020, Christoph Hellwig wrote:
> On Mon, Jun 29, 2020 at 04:46:09PM -0700, Stefano Stabellini wrote:
> > > I could imagine some future Xen hosts setting a flag somewhere in the
> > > platform capability saying "no xen specific flag, rely on
> > > "VIRTIO_F_ACCESS_PLATFORM". Then you set that accordingly in QEMU.
> > > How about that?
> > 
> > Yes, that would be fine and there is no problem implementing something
> > like that when we get virtio support in Xen. Today there are still no
> > virtio interfaces provided by Xen to ARM guests (no virtio-block/net,
> > etc.)
> > 
> > In fact, in both cases we are discussing virtio is *not* provided by
> > Xen; it is a firmware interface to something entirely different:
> > 
> > 1) virtio is used to talk to a remote AMP processor (RPMesg)
> > 2) virtio is used to talk to a secure-world firmware/OS (Trusty)
> >
> > VIRTIO_F_ACCESS_PLATFORM is not set by Xen in these cases but by RPMesg
> > and by Trusty respectively. I don't know if Trusty should or should not
> > set VIRTIO_F_ACCESS_PLATFORM, but I think Linux should still work
> > without issues.
> > 
> 
> Any virtio implementation that is not in control of the memory map
> (aka not the hypervisor) absolutely must set VIRTIO_F_ACCESS_PLATFORM,
> else it is completely broken.

Lots of broken virtio implementations out there it would seem :-(


> > The xen_domain() check in Linux makes it so that vring_use_dma_api
> > returns the opposite value on native Linux compared to Linux as Xen/ARM
> > DomU by "accident". By "accident" because there is no architectural
> > reason why Linux Xen/ARM DomU should behave differently compared to
> > native Linux in this regard.
> > 
> > I hope that now it is clearer why I think the if (xen_domain()) check
> > needs to be improved anyway, even if we fix generic dma_ops with virtio
> > interfaces missing VIRTIO_F_ACCESS_PLATFORM.
> 
> IMHO that Xen quirk should never have been added in this form..

Would you be in favor of a more flexible check along the lines of the
one proposed in the patch that started this thread:

    if (xen_vring_use_dma())
            return true;


xen_vring_use_dma would be implemented so that it returns true when
xen_swiotlb is required and false otherwise.

