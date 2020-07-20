Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53791225C8D
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 12:20:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxSuQ-0001FV-0v; Mon, 20 Jul 2020 10:20:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UosC=A7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jxSuO-0001FO-N4
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 10:20:32 +0000
X-Inumbo-ID: a2ce3168-ca72-11ea-8487-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a2ce3168-ca72-11ea-8487-bc764e2007e4;
 Mon, 20 Jul 2020 10:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595240431;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=p3Bd5pXAMYU/Ly5ta3QImfVnRY3RDMqxFMLQdBS3Mtc=;
 b=RatfbJ+Ns7/nW4qJ1o5ax/9/zO4ZTVFNt4SW243koM2uz4Y2uOvBdWXN
 WFzt22DppXRD4v4d/SAIYx+jswQuCTyf57VglcHaBOZ7ulBUGDyZ0V5NB
 xm5ualVT8+bjjJJkYpw/Hrsmy/0BQdv2iDNDlSpRcKYqHhkDH10BiZQXh 0=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: VrbH58Xm5nPOl7D0WJ6Go5erLMQnBS8bsCYxSgyUPYiZ+RAM99Pmt/n4jGOPeCCbqD9Vo/lH1E
 BpWqLoHuxhWw6ISWSdEMC2+peP0T9TobNDmuzQ2x1GZV3wosymwycTHvTkqB7/0ZRV6pecQbjB
 koFf7neSUmbQda8/V4aPUPWZK9TV1ssFZ1PY3Ek01D2M4jroS/d3UA2bDcDaXpuZVybggVCFT+
 +9WPNE+tT7CZGyVgY2KJE9Dc7KR66YuzKstFyt0VjSbDCOvaFqFSMWLbX6N+RXCukYVT25EtqA
 rl8=
X-SBRS: 2.7
X-MesageID: 23063696
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,374,1589256000"; d="scan'208";a="23063696"
Date: Mon, 20 Jul 2020 12:20:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Subject: Re: Virtio in Xen on Arm (based on IOREQ concept)
Message-ID: <20200720102023.GH7191@Air-de-Roger>
References: <CAPD2p-nthLq5NaU32u8pVaa-ub=a9-LOPenupntTYdS-cu31jQ@mail.gmail.com>
 <20200717150039.GV7191@Air-de-Roger>
 <8f4e0c0d-b3d4-9dd3-ce20-639539321968@gmail.com>
 <20200720091722.GF7191@Air-de-Roger>
 <10eaec62-2c48-52ae-d113-1681c87e3d59@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10eaec62-2c48-52ae-d113-1681c87e3d59@xen.org>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Oleksandr <olekstysh@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Artem
 Mygaiev <joculator@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jul 20, 2020 at 10:40:40AM +0100, Julien Grall wrote:
> 
> 
> On 20/07/2020 10:17, Roger Pau Monné wrote:
> > On Fri, Jul 17, 2020 at 09:34:14PM +0300, Oleksandr wrote:
> > > On 17.07.20 18:00, Roger Pau Monné wrote:
> > > > On Fri, Jul 17, 2020 at 05:11:02PM +0300, Oleksandr Tyshchenko wrote:
> > > > Do you have any plans to try to upstream a modification to the VirtIO
> > > > spec so that grants (ie: abstract references to memory addresses) can
> > > > be used on the VirtIO ring?
> > > 
> > > But VirtIO spec hasn't been modified as well as VirtIO infrastructure in the
> > > guest. Nothing to upsteam)
> > 
> > OK, so there's no intention to add grants (or a similar interface) to
> > the spec?
> > 
> > I understand that you want to support unmodified VirtIO frontends, but
> > I also think that long term frontends could negotiate with backends on
> > the usage of grants in the shared ring, like any other VirtIO feature
> > negotiated between the frontend and the backend.
> > 
> > This of course needs to be on the spec first before we can start
> > implementing it, and hence my question whether a modification to the
> > spec in order to add grants has been considered.
> The problem is not really the specification but the adoption in the
> ecosystem. A protocol based on grant-tables would mostly only be used by Xen
> therefore:
>    - It may be difficult to convince a proprietary OS vendor to invest
> resource on implementing the protocol
>    - It would be more difficult to move in/out of Xen ecosystem.
> 
> Both, may slow the adoption of Xen in some areas.

Right, just to be clear my suggestion wasn't to force the usage of
grants, but whether adding something along this lines was in the
roadmap, see below.

> If one is interested in security, then it would be better to work with the
> other interested parties. I think it would be possible to use a virtual
> IOMMU for this purpose.

Yes, I've also heard rumors about using the (I assume VirtIO) IOMMU in
order to protect what backends can map. This seems like a fine idea,
and would allow us to gain the lost security without having to do the
whole work ourselves.

Do you know if there's anything published about this? I'm curious
about how and where in the system the VirtIO IOMMU is/should be
implemented.

Thanks, Roger.

