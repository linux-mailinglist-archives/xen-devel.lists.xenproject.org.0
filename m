Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C55226FC9
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 22:38:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxcXa-0005zo-T6; Mon, 20 Jul 2020 20:37:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rt7f=A7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jxcXZ-0005zj-3X
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 20:37:37 +0000
X-Inumbo-ID: d7f332c8-cac8-11ea-84c1-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d7f332c8-cac8-11ea-84c1-bc764e2007e4;
 Mon, 20 Jul 2020 20:37:35 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9052E22482;
 Mon, 20 Jul 2020 20:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595277454;
 bh=be6FQzh1KnqLJW+x73v/0Hei6pafsExlT9HyVvCbvvs=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=oGTcyKChqRht+ul3g8KH29Y8WM43EqeMzvaknHF/t/buri/QzU8xaV7JHDL9aQjDf
 YIaUL2/X6ivp7y49iCbJWUlDQFnt3nVyc0F8ugsH+qohHNRGXCrw5Kqwkik+HyU4O1
 HdfS9lr1ztz7SqfyswYo5oL8CvUaU0ENRRlgjJpc=
Date: Mon, 20 Jul 2020 13:37:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: Virtio in Xen on Arm (based on IOREQ concept)
In-Reply-To: <20200720102023.GH7191@Air-de-Roger>
Message-ID: <alpine.DEB.2.21.2007201322060.32544@sstabellini-ThinkPad-T480s>
References: <CAPD2p-nthLq5NaU32u8pVaa-ub=a9-LOPenupntTYdS-cu31jQ@mail.gmail.com>
 <20200717150039.GV7191@Air-de-Roger>
 <8f4e0c0d-b3d4-9dd3-ce20-639539321968@gmail.com>
 <20200720091722.GF7191@Air-de-Roger>
 <10eaec62-2c48-52ae-d113-1681c87e3d59@xen.org>
 <20200720102023.GH7191@Air-de-Roger>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1748832064-1595276590=:32544"
Content-ID: <alpine.DEB.2.21.2007201323180.32544@sstabellini-ThinkPad-T480s>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Oleksandr <olekstysh@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>, alex.bennee@linaro.org,
 Artem Mygaiev <joculator@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1748832064-1595276590=:32544
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2007201323181.32544@sstabellini-ThinkPad-T480s>

On Mon, 20 Jul 2020, Roger Pau Monné wrote:
> On Mon, Jul 20, 2020 at 10:40:40AM +0100, Julien Grall wrote:
> > 
> > 
> > On 20/07/2020 10:17, Roger Pau Monné wrote:
> > > On Fri, Jul 17, 2020 at 09:34:14PM +0300, Oleksandr wrote:
> > > > On 17.07.20 18:00, Roger Pau Monné wrote:
> > > > > On Fri, Jul 17, 2020 at 05:11:02PM +0300, Oleksandr Tyshchenko wrote:
> > > > > Do you have any plans to try to upstream a modification to the VirtIO
> > > > > spec so that grants (ie: abstract references to memory addresses) can
> > > > > be used on the VirtIO ring?
> > > > 
> > > > But VirtIO spec hasn't been modified as well as VirtIO infrastructure in the
> > > > guest. Nothing to upsteam)
> > > 
> > > OK, so there's no intention to add grants (or a similar interface) to
> > > the spec?
> > > 
> > > I understand that you want to support unmodified VirtIO frontends, but
> > > I also think that long term frontends could negotiate with backends on
> > > the usage of grants in the shared ring, like any other VirtIO feature
> > > negotiated between the frontend and the backend.
> > > 
> > > This of course needs to be on the spec first before we can start
> > > implementing it, and hence my question whether a modification to the
> > > spec in order to add grants has been considered.
> > The problem is not really the specification but the adoption in the
> > ecosystem. A protocol based on grant-tables would mostly only be used by Xen
> > therefore:
> >    - It may be difficult to convince a proprietary OS vendor to invest
> > resource on implementing the protocol
> >    - It would be more difficult to move in/out of Xen ecosystem.
> > 
> > Both, may slow the adoption of Xen in some areas.
> 
> Right, just to be clear my suggestion wasn't to force the usage of
> grants, but whether adding something along this lines was in the
> roadmap, see below.
> 
> > If one is interested in security, then it would be better to work with the
> > other interested parties. I think it would be possible to use a virtual
> > IOMMU for this purpose.
> 
> Yes, I've also heard rumors about using the (I assume VirtIO) IOMMU in
> order to protect what backends can map. This seems like a fine idea,
> and would allow us to gain the lost security without having to do the
> whole work ourselves.
> 
> Do you know if there's anything published about this? I'm curious
> about how and where in the system the VirtIO IOMMU is/should be
> implemented.

Not yet (as far as I know), but we have just started some discussons on
this topic within Linaro.


You should also be aware that there is another proposal based on
pre-shared-memory and memcpys to solve the virtio security issue:

https://marc.info/?l=linux-kernel&m=158807398403549

It would be certainly slower than the "virtio IOMMU" solution but it
would take far less time to develop and could work as a short-term
stop-gap. (In my view the "virtio IOMMU" is the only clean solution
to the problem long term.)
--8323329-1748832064-1595276590=:32544--

