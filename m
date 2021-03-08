Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0743315A4
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 19:15:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95048.179278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJKPJ-0007a1-5y; Mon, 08 Mar 2021 18:15:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95048.179278; Mon, 08 Mar 2021 18:15:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJKPJ-0007Zc-2X; Mon, 08 Mar 2021 18:15:05 +0000
Received: by outflank-mailman (input) for mailman id 95048;
 Mon, 08 Mar 2021 18:15:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d+V0=IG=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lJKPG-0007ZX-OD
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 18:15:02 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3a354599-bddc-427c-915e-ff19db3feb0b;
 Mon, 08 Mar 2021 18:15:01 +0000 (UTC)
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
X-Inumbo-ID: 3a354599-bddc-427c-915e-ff19db3feb0b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615227301;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rZ4SkJ8X/hZwpDyh0viVcvZuGzds7uuy62Q7Mz9ot+U=;
  b=IaP4SEihgbztyUnj1BnTELaIhDMemtx9NnksisVmA2UtX8zxm+oUDMgA
   d1sEyoQnmkfOEhZ85A9Khl6tfQ+jFcqBiE2kHLnPoaFxPm63qUQ59pNQp
   cgfOVaNRjdPy2nfSKpphQn1txNmrf20U+LDW9KOwMmrTzJwjA/y95KgWP
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 0Lwi/BiZvEKSYUpO4VUtOzP8Xl9lnKx28tjjXCjF5Mijex70y0RpnhpPGpQ+jJbw1UBVxbqUL/
 XTUO1MnMS5llggK97NFZoFvhT14AdgR5KQJfgW3sADiRXBzolZoJK8SSIrtGx/xnUwBIY+YVLn
 4JOQyle+GUEQi99v/XqgGV203q88/oUrwDz0s4LKmbT6vAKQiTTPFDgfKImR/Bn5x87yNnGlPB
 OBil9M77fkt/slfs6gCzYRFrYjgICVc9/32WlgNQsr4S49V3poUN9OBa5fD47yEndne28W+NKR
 DpI=
X-SBRS: 4.0
X-MesageID: 38789155
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,232,1610427600"; 
   d="scan'208";a="38789155"
Date: Mon, 8 Mar 2021 18:14:56 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Paolo Bonzini <pbonzini@redhat.com>
CC: <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, "Maxim
 Levitsky" <mlevitsk@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>, Kevin Wolf <kwolf@redhat.com>, Max Reitz
	<mreitz@redhat.com>, <xen-devel@lists.xenproject.org>,
	<qemu-block@nongnu.org>
Subject: Re: [PATCH] xen-block: Fix removal of backend instance via xenstore
Message-ID: <YEZpoHLsnp+xsGbR@perard.uk.xensource.com>
References: <20210308143232.83388-1-anthony.perard@citrix.com>
 <c49581e6-6132-a4e2-9beb-a9948fc7ab25@redhat.com>
 <YEZfBMrkJxfzmIuk@perard.uk.xensource.com>
 <b2e4ad7c-6688-f3be-b7d3-227c7c1359cb@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b2e4ad7c-6688-f3be-b7d3-227c7c1359cb@redhat.com>

On Mon, Mar 08, 2021 at 06:37:38PM +0100, Paolo Bonzini wrote:
> On 08/03/21 18:29, Anthony PERARD wrote:
> > > If nothing else works then I guess it's okay, but why can't you do the
> > > xen_block_drive_destroy from e.g. an unrealize callback?
> > 
> > I'm not sure if that's possible.
> > 
> > xen_block_device_create/xen_block_device_destroy() is supposed to be
> > equivalent to do those qmp commands:
> >      blockdev-add node-name=xvdz-qcow2 driver=qcow2 file={"driver":"file","filename":"disk.qcow2","locking":"off"}
> >      device_add id=xvdz driver=xen-disk vdev=xvdz drive=xvdz-qcow2
> > 
> > But I tried to add a call xen_block_drive_destroy from
> > xen_block_unrealize, but that still is called too early, it's called
> > before object_property_del_all() which would delete "drive" and call
> > release_drive() which would free the node.
> 
> Can you use blockdev_mark_auto_del?  Then you don't have to call
> xen_block_drive_destroy at all.

There is no legacy_dinfo, so blockdev_mark_auto_del doesn't work.

-- 
Anthony PERARD

