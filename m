Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB89532B618
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 10:19:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92774.174847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHNeC-00055v-IV; Wed, 03 Mar 2021 09:18:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92774.174847; Wed, 03 Mar 2021 09:18:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHNeC-00055W-Ez; Wed, 03 Mar 2021 09:18:24 +0000
Received: by outflank-mailman (input) for mailman id 92774;
 Wed, 03 Mar 2021 09:18:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QSke=IB=redhat.com=kraxel@srs-us1.protection.inumbo.net>)
 id 1lHNeA-00055R-OP
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 09:18:22 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 531c667e-f275-4b53-8f1c-533da5b00fb7;
 Wed, 03 Mar 2021 09:18:20 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-z2mwH7LGPUu9fIoPrLmpkg-1; Wed, 03 Mar 2021 04:18:18 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5FA985B67D;
 Wed,  3 Mar 2021 09:18:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-154.ams2.redhat.com
 [10.36.112.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B36D7101E246;
 Wed,  3 Mar 2021 09:18:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 46C841800D4D; Wed,  3 Mar 2021 10:18:04 +0100 (CET)
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
X-Inumbo-ID: 531c667e-f275-4b53-8f1c-533da5b00fb7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614763100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K8aDa2UBbBwRUbFTjc/tN0MwEJhUi+K8J5A19XMIEA8=;
	b=Zue1MYoIrp4Vrbr8G0gsU8UbTAD6sGgIdUH6JxGi7+eyxK7GLF17GtgK4bbAFjGq207TwV
	z+CZY+J88J4x/aJt7ptuGUz5bpa4L5GkUTHNSQYXw7nbmYmEFdRtaV4BARxyAg9Pyn1iYX
	BPBLaqpvdj85Jvf7W41sy2f1TnmwLUU=
X-MC-Unique: z2mwH7LGPUu9fIoPrLmpkg-1
Date: Wed, 3 Mar 2021 10:18:04 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu Developers <qemu-devel@nongnu.org>, xen-devel@lists.xenproject.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH] virtio-gpu: Respect graphics update interval for EDID
Message-ID: <20210303091804.5fm4esvd2iixbgew@sirius.home.kraxel.org>
References: <20210221133414.7262-1-akihiko.odaki@gmail.com>
 <20210222105738.w2q6vp5pi4p6bx5m@sirius.home.kraxel.org>
 <CAMVc7JVo_XJcGcxW0Wmqje3Y40fRZDY6T8dnQTc2=Ehasz4UHw@mail.gmail.com>
 <20210224111540.xd5a6yszql6wln7m@sirius.home.kraxel.org>
 <CAMVc7JXUXnrK_amhQsy=paMeqjMU_8r86Hj4UF5haZ+Oq15JkA@mail.gmail.com>
 <20210225114626.dn7wevr3fozp5rcu@sirius.home.kraxel.org>
 <CAMVc7JX-E_3fE9SCOaYFAtDBRHNmHxmHWiqcJDPE-4zq-QHJbQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMVc7JX-E_3fE9SCOaYFAtDBRHNmHxmHWiqcJDPE-4zq-QHJbQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Feb 26, 2021 at 01:47:38PM +0900, Akihiko Odaki wrote:
> 2021年2月25日(木) 20:46 Gerd Hoffmann <kraxel@redhat.com>:
> >
> >   Hi,
> >
> > > > Because of the wasted frames I'd like this to be an option you can
> > > > enable when needed.  For the majority of use cases this seems to be
> > > > no problem ...
> > >
> > > I see blinks with GNOME on Wayland on Ubuntu 20.04 and virtio-gpu with
> > > the EDID change included in this patch.
> >
> > /me looks closely at the patch again.
> >
> > So you update the edid dynamically, each time the refresh rate changes.
> > Problem with that approach is software doesn't expect edid to change
> > dynamically because on physical hardware it is static information about
> > the connected monitor.
> >
> > So what the virtio-gpu guest driver does is emulate a monitor hotplug
> > event to notify userspace.  If you resize the qemu window on the host
> > it'll look like the monitor with the old window size was unplugged and
> > a new monitor with the new window size got plugged instead, so gnome
> > shell goes adapt the display resolution to the new virtual monitor size.
> >
> > The blink you are seeing probably comes from gnome-shell processing the
> > monitor hotplug event.
> >
> > We could try to skip generating a monitor hotplug event in case only the
> > refresh rate did change.  That would fix the blink, but it would also
> > have the effect that nobody will notice the update.
> >
> > Bottom line:  I think making the edid refresh rate configurable might be
> > useful, but changing it dynamically most likely isn't.
> >
> > take care,
> >   Gerd
> 
> The "hotplug" implementation is probably what other combinations of
> devices and guests will do if they want to respond to the changes of
> the refresh rate, or display mode in general. That makes telling the
> dynamic refresh rate to guests infeasible.
> 
> As you wrote, making the refresh rate configurable should be still
> useful, and I think matching it to the backend physical display is
> even better. GTK, the sole implementer of gfx_update_interval in my
> patch reports the refresh rate of the physical display the window
> resides in. It means the value may change when the physical display
> changes its refresh rate, which should be rare if it does, or the
> window moves to another physical display.

Yes.  Added debug printf, can see that it changes exactly twice for me,
once to the default value and then to the real refresh rate.

That rules out the hotplug event as source for the blinks.  I'm
wondering where they are coming from, and I can't reproduce them
on my machine ...

> consistent. The only inconsistency I see in my patch is that the
> refresh rate change has no throttling while the window size change
> has. I don't think it is problematic because it should be rare to move
> the window across physical displays, but I can implement one if you
> don't agree or know other cases the refresh rate frequently changes.

I think it would be best to just add a new field for the refresh rate
to QemuUIInfo.  That avoids a new callback you also get the throttling
for free ;)

take care,
  Gerd


