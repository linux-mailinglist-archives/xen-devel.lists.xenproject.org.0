Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1AD31B7A0
	for <lists+xen-devel@lfdr.de>; Mon, 15 Feb 2021 11:52:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85150.159659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBbTv-0003Ex-C2; Mon, 15 Feb 2021 10:51:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85150.159659; Mon, 15 Feb 2021 10:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBbTv-0003EY-8e; Mon, 15 Feb 2021 10:51:55 +0000
Received: by outflank-mailman (input) for mailman id 85150;
 Mon, 15 Feb 2021 10:51:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3evm=HR=redhat.com=kwolf@srs-us1.protection.inumbo.net>)
 id 1lBbTt-0003ET-NG
 for xen-devel@lists.xenproject.org; Mon, 15 Feb 2021 10:51:53 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 89e54135-31a7-40fb-b1ad-76dcac7d86c7;
 Mon, 15 Feb 2021 10:51:52 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-en3XCfTZM9KwMZkEje0NTw-1; Mon, 15 Feb 2021 05:51:50 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BAB31E56C;
 Mon, 15 Feb 2021 10:51:49 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-28.ams2.redhat.com [10.36.113.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 19B65722C7;
 Mon, 15 Feb 2021 10:51:46 +0000 (UTC)
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
X-Inumbo-ID: 89e54135-31a7-40fb-b1ad-76dcac7d86c7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613386312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hYY5Jg9wnLbXzPop0ndlZ0ZadkwesoK2qW32ai1FRls=;
	b=JPJk0qMwY3djpl0OVdlf1iwL6WmIzWugfinr3TRZof5b5zD6Owvuc6jzmq2JiihF5LL1YD
	N4e97x2xGN0peu1lfRlWzvJrZkgWx0G3ClQ/2rWsFMe5CbzS9p/TQiGHLFLgxgqt28Vaqo
	Enx/Pg3hYhIx6g5lUkcdU617RjsDH/k=
X-MC-Unique: en3XCfTZM9KwMZkEje0NTw-1
Date: Mon, 15 Feb 2021 11:51:44 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: paul@xen.org
Cc: 'Roger Pau Monne' <roger.pau@citrix.com>, qemu-devel@nongnu.org,
	'Arthur Borsboom' <arthurborsboom@gmail.com>,
	'Stefano Stabellini' <sstabellini@kernel.org>,
	'Anthony Perard' <anthony.perard@citrix.com>,
	'Max Reitz' <mreitz@redhat.com>, xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org
Subject: Re: [PATCH] xen-block: fix reporting of discard feature
Message-ID: <20210215105144.GG7226@merkur.fritz.box>
References: <20210118153330.82324-1-roger.pau@citrix.com>
 <00d701d6edb1$894122f0$9bc368d0$@xen.org>
MIME-Version: 1.0
In-Reply-To: <00d701d6edb1$894122f0$9bc368d0$@xen.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Am 18.01.2021 um 16:49 hat Paul Durrant geschrieben:
> > -----Original Message-----
> > From: Roger Pau Monne <roger.pau@citrix.com>
> > Sent: 18 January 2021 15:34
> > To: qemu-devel@nongnu.org
> > Cc: Roger Pau Monne <roger.pau@citrix.com>; Arthur Borsboom <arthurborsboom@gmail.com>; Stefano
> > Stabellini <sstabellini@kernel.org>; Anthony Perard <anthony.perard@citrix.com>; Paul Durrant
> > <paul@xen.org>; Kevin Wolf <kwolf@redhat.com>; Max Reitz <mreitz@redhat.com>; xen-
> > devel@lists.xenproject.org; qemu-block@nongnu.org
> > Subject: [PATCH] xen-block: fix reporting of discard feature
> > 
> > Linux blkfront expects both "discard-granularity" and
> > "discard-alignment" present on xenbus in order to properly enable the
> > feature, not exposing "discard-alignment" left some Linux blkfront
> > versions with a broken discard setup. This has also been addressed in
> > Linux with:
> > 
> > https://lore.kernel.org/lkml/20210118151528.81668-1-roger.pau@citrix.com/T/#u
> > 
> > Fix QEMU to report a "discard-alignment" of 0, in order for it to work
> > with older Linux frontends.
> > 
> > Reported-by: Arthur Borsboom <arthurborsboom@gmail.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Paul Durrant <paul@xen.org>

Thanks, applied to the block branch.

Kevin


