Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3385E324F5F
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 12:46:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89678.169112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFF6L-0006ZR-Ux; Thu, 25 Feb 2021 11:46:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89678.169112; Thu, 25 Feb 2021 11:46:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFF6L-0006Z3-Ru; Thu, 25 Feb 2021 11:46:37 +0000
Received: by outflank-mailman (input) for mailman id 89678;
 Thu, 25 Feb 2021 11:46:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VzdG=H3=redhat.com=kraxel@srs-us1.protection.inumbo.net>)
 id 1lFF6K-0006Yx-7W
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 11:46:36 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 929c509b-f16d-4c6f-a154-d1dee7bbb0c5;
 Thu, 25 Feb 2021 11:46:35 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-gTc3-8vAOWS90hJJXyCksg-1; Thu, 25 Feb 2021 06:46:33 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7FEC8030C1;
 Thu, 25 Feb 2021 11:46:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-4.ams2.redhat.com
 [10.36.114.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 247E91980D;
 Thu, 25 Feb 2021 11:46:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8821D18000A7; Thu, 25 Feb 2021 12:46:26 +0100 (CET)
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
X-Inumbo-ID: 929c509b-f16d-4c6f-a154-d1dee7bbb0c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614253595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xKmTEivAGnpXirok/FZMI9IT5+2rG+YO+T2SvKiBEY0=;
	b=b8t+tcl1wmoXvvc6cV1OxgFFxHDjcOYfG9GKAqTE1zrVdjHQL8WrXFNEgjikqJagwiSZov
	6/yVef5lZDxZQO9Y2bCmM9b4k4q+ZLDNGMktCeREwnDbKIeUJ09K/6CteAfqrDX4Mo70tG
	VJ+j22D4EP/r0IkYWHgAo7obfqd+pHM=
X-MC-Unique: gTc3-8vAOWS90hJJXyCksg-1
Date: Thu, 25 Feb 2021 12:46:26 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu Developers <qemu-devel@nongnu.org>, xen-devel@lists.xenproject.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH] virtio-gpu: Respect graphics update interval for EDID
Message-ID: <20210225114626.dn7wevr3fozp5rcu@sirius.home.kraxel.org>
References: <20210221133414.7262-1-akihiko.odaki@gmail.com>
 <20210222105738.w2q6vp5pi4p6bx5m@sirius.home.kraxel.org>
 <CAMVc7JVo_XJcGcxW0Wmqje3Y40fRZDY6T8dnQTc2=Ehasz4UHw@mail.gmail.com>
 <20210224111540.xd5a6yszql6wln7m@sirius.home.kraxel.org>
 <CAMVc7JXUXnrK_amhQsy=paMeqjMU_8r86Hj4UF5haZ+Oq15JkA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMVc7JXUXnrK_amhQsy=paMeqjMU_8r86Hj4UF5haZ+Oq15JkA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

  Hi,

> > Because of the wasted frames I'd like this to be an option you can
> > enable when needed.  For the majority of use cases this seems to be
> > no problem ...
> 
> I see blinks with GNOME on Wayland on Ubuntu 20.04 and virtio-gpu with
> the EDID change included in this patch.

/me looks closely at the patch again.

So you update the edid dynamically, each time the refresh rate changes.
Problem with that approach is software doesn't expect edid to change
dynamically because on physical hardware it is static information about
the connected monitor.

So what the virtio-gpu guest driver does is emulate a monitor hotplug
event to notify userspace.  If you resize the qemu window on the host
it'll look like the monitor with the old window size was unplugged and
a new monitor with the new window size got plugged instead, so gnome
shell goes adapt the display resolution to the new virtual monitor size.

The blink you are seeing probably comes from gnome-shell processing the
monitor hotplug event.

We could try to skip generating a monitor hotplug event in case only the
refresh rate did change.  That would fix the blink, but it would also
have the effect that nobody will notice the update.

Bottom line:  I think making the edid refresh rate configurable might be
useful, but changing it dynamically most likely isn't.

take care,
  Gerd


