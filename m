Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D736323B26
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 12:17:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89273.168052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEsAf-0005B9-F6; Wed, 24 Feb 2021 11:17:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89273.168052; Wed, 24 Feb 2021 11:17:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEsAf-0005Ak-Bk; Wed, 24 Feb 2021 11:17:33 +0000
Received: by outflank-mailman (input) for mailman id 89273;
 Wed, 24 Feb 2021 11:17:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eUeI=H2=redhat.com=kraxel@srs-us1.protection.inumbo.net>)
 id 1lEsAd-0005Af-9y
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 11:17:31 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 1ca72629-abb2-4b43-be2d-6be073c2ab40;
 Wed, 24 Feb 2021 11:17:30 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-JG18An3NMO2ncTIcRy6BFQ-1; Wed, 24 Feb 2021 06:16:42 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19DD28049C6;
 Wed, 24 Feb 2021 11:15:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-4.ams2.redhat.com
 [10.36.114.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE8DB5D9D0;
 Wed, 24 Feb 2021 11:15:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 82C5718000AE; Wed, 24 Feb 2021 12:15:40 +0100 (CET)
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
X-Inumbo-ID: 1ca72629-abb2-4b43-be2d-6be073c2ab40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614165450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EZdth/jUbehtJCYZwrly7yhxVtc9NrH42+8crogjt7Y=;
	b=GM4I8taqKVwQDVmyT3rUDtT9jX63Mtu8Nfg8oVdbyoYkmW5jcCLwgyv4mEeCzwfv5qArpy
	Z0wEY9SX1f/5eq+SohnRvytGicCUhXGFsJCprQqnVVRPsIlolGSDa964nfZX8CqnGQBvG/
	5EA6bBhTX0Xe5v+zyc0E0kg5givj4ws=
X-MC-Unique: JG18An3NMO2ncTIcRy6BFQ-1
Date: Wed, 24 Feb 2021 12:15:40 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu Developers <qemu-devel@nongnu.org>, xen-devel@lists.xenproject.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH] virtio-gpu: Respect graphics update interval for EDID
Message-ID: <20210224111540.xd5a6yszql6wln7m@sirius.home.kraxel.org>
References: <20210221133414.7262-1-akihiko.odaki@gmail.com>
 <20210222105738.w2q6vp5pi4p6bx5m@sirius.home.kraxel.org>
 <CAMVc7JVo_XJcGcxW0Wmqje3Y40fRZDY6T8dnQTc2=Ehasz4UHw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMVc7JVo_XJcGcxW0Wmqje3Y40fRZDY6T8dnQTc2=Ehasz4UHw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Feb 23, 2021 at 01:50:51PM +0900, Akihiko Odaki wrote:
> 2021年2月22日(月) 19:57 Gerd Hoffmann <kraxel@redhat.com>:
> >
> > On Sun, Feb 21, 2021 at 10:34:14PM +0900, Akihiko Odaki wrote:
> > > This change introduces an additional member, refresh_rate to
> > > qemu_edid_info in include/hw/display/edid.h.
> > >
> > > This change also isolates the graphics update interval from the
> > > display update interval. The guest will update the frame buffer
> > > in the graphics update interval, but displays can be updated in a
> > > dynamic interval, for example to save update costs aggresively
> > > (vnc) or to respond to user-generated events (sdl).
> > > It stabilizes the graphics update interval and prevents the guest
> > > from being confused.
> >
> > Hmm.  What problem you are trying to solve here?
> >
> > The update throttle being visible by the guest was done intentionally,
> > so the guest can throttle the display updates too in case nobody is
> > watching those display updated anyway.
> 
> Indeed, we are throttling the update for vnc to avoid some worthless
> work. But typically a guest cannot respond to update interval changes
> so often because real display devices the guest is designed for does
> not change the update interval in that way.

What is the problem you are seeing?

Some guest software raising timeout errors when they see only
one vblank irq every 3 seconds?  If so: which software is this?
Any chance we can fix this on the guest side?

> That is why we have to
> tell the guest a stable update interval even if it results in wasted
> frames.

Because of the wasted frames I'd like this to be an option you can
enable when needed.  For the majority of use cases this seems to be
no problem ...

Also: the EDID changes should go to a separate patch.

take care,
  Gerd


