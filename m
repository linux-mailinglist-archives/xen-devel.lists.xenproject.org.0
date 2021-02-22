Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FD2321494
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 11:57:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87932.165202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE8uT-0004OO-QV; Mon, 22 Feb 2021 10:57:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87932.165202; Mon, 22 Feb 2021 10:57:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE8uT-0004Nz-Mo; Mon, 22 Feb 2021 10:57:49 +0000
Received: by outflank-mailman (input) for mailman id 87932;
 Mon, 22 Feb 2021 10:57:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OBBz=HY=redhat.com=kraxel@srs-us1.protection.inumbo.net>)
 id 1lE8uS-0004Nn-J5
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 10:57:48 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 21a8ba2c-6837-49f6-a2b8-5a8f722049e3;
 Mon, 22 Feb 2021 10:57:47 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-O0U_erKjNFiOb3Hd-kM1Ng-1; Mon, 22 Feb 2021 05:57:44 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BDF41020C20;
 Mon, 22 Feb 2021 10:57:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B4B2460C04;
 Mon, 22 Feb 2021 10:57:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3EF8F1800399; Mon, 22 Feb 2021 11:57:38 +0100 (CET)
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
X-Inumbo-ID: 21a8ba2c-6837-49f6-a2b8-5a8f722049e3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613991466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nvlkKULpwYNVPS6/mh0XmFuo5ZYky+bE+E6dQG6ewlY=;
	b=cjq8NnG/SHqrk+mc3q8m9VwYKPx/3se55HAIkgdHDl/dLe6QENtKkwHe1AQbIg7GL85TFI
	v1hjntuRrAWy8jsXY8IO0EMGigow2up5G29c7jy7mhe5orh/2jGgXZE9BHnRLd2M6di2Hz
	Fa7ccqNT35nvtZZbDICBI3BznDnZ7RY=
X-MC-Unique: O0U_erKjNFiOb3Hd-kM1Ng-1
Date: Mon, 22 Feb 2021 11:57:38 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH] virtio-gpu: Respect graphics update interval for EDID
Message-ID: <20210222105738.w2q6vp5pi4p6bx5m@sirius.home.kraxel.org>
References: <20210221133414.7262-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210221133414.7262-1-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 21, 2021 at 10:34:14PM +0900, Akihiko Odaki wrote:
> This change introduces an additional member, refresh_rate to
> qemu_edid_info in include/hw/display/edid.h.
> 
> This change also isolates the graphics update interval from the
> display update interval. The guest will update the frame buffer
> in the graphics update interval, but displays can be updated in a
> dynamic interval, for example to save update costs aggresively
> (vnc) or to respond to user-generated events (sdl).
> It stabilizes the graphics update interval and prevents the guest
> from being confused.

Hmm.  What problem you are trying to solve here?

The update throttle being visible by the guest was done intentionally,
so the guest can throttle the display updates too in case nobody is
watching those display updated anyway.

take care,
  Gerd


