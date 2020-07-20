Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 714AC226FC8
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 22:38:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxcYB-00063U-6q; Mon, 20 Jul 2020 20:38:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rt7f=A7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jxcY8-00063H-US
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 20:38:12 +0000
X-Inumbo-ID: edd60930-cac8-11ea-84c1-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id edd60930-cac8-11ea-84c1-bc764e2007e4;
 Mon, 20 Jul 2020 20:38:12 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 75CA622482;
 Mon, 20 Jul 2020 20:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595277491;
 bh=E5pXKGj6NwMiolJPAeCWbRq/DyEArML96G7+tV3RcJw=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=LgoHjCVQjP9b7nfMNy3b+vVIhfwnhUtFIeLENig3E5XtceIIPsPws8z/IDOnsufxn
 mGTGL/ZP8+tsJ0HtfUL7SH6zuijv6OmAYBiZDpYqH2fSr2J+FuI3Dgc9MTeCnZzdlJ
 LprPBxwIDez/eRSWgoUOvvQqxay3u5PJrSLYuTE8=
Date: Mon, 20 Jul 2020 13:38:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr <olekstysh@gmail.com>
Subject: Re: Virtio in Xen on Arm (based on IOREQ concept)
In-Reply-To: <8f4e0c0d-b3d4-9dd3-ce20-639539321968@gmail.com>
Message-ID: <alpine.DEB.2.21.2007201326060.32544@sstabellini-ThinkPad-T480s>
References: <CAPD2p-nthLq5NaU32u8pVaa-ub=a9-LOPenupntTYdS-cu31jQ@mail.gmail.com>
 <20200717150039.GV7191@Air-de-Roger>
 <8f4e0c0d-b3d4-9dd3-ce20-639539321968@gmail.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 alex.bennee@linaro.org, Artem Mygaiev <joculator@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 17 Jul 2020, Oleksandr wrote:
> > > *A few word about solution:*
> > > As it was mentioned at [1], in order to implement virtio-mmio Xen on Arm
> > Any plans for virtio-pci? Arm seems to be moving to the PCI bus, and
> > it would be very interesting from a x86 PoV, as I don't think
> > virtio-mmio is something that you can easily use on x86 (or even use
> > at all).
> 
> Being honest I didn't consider virtio-pci so far. Julien's PoC (we are based
> on) provides support for the virtio-mmio transport
> 
> which is enough to start working around VirtIO and is not as complex as
> virtio-pci. But it doesn't mean there is no way for virtio-pci in Xen.
> 
> I think, this could be added in next steps. But the nearest target is
> virtio-mmio approach (of course if the community agrees on that).

Hi Julien, Oleksandr,

Aside from complexity and easy-of-development, are there any other
architectural reasons for using virtio-mmio?

I am not asking because I intend to suggest to do something different
(virtio-mmio is fine as far as I can tell.) I am asking because recently
there was a virtio-pci/virtio-mmio discussion recently in Linaro and I
would like to understand if there are any implications from a Xen point
of view that I don't yet know.

For instance, what's your take on notifications with virtio-mmio? How
are they modelled today? Are they good enough or do we need MSIs?

