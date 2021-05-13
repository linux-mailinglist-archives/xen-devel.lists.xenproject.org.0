Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0BE37F535
	for <lists+xen-devel@lfdr.de>; Thu, 13 May 2021 12:03:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126805.238276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lh8BR-0003y2-7O; Thu, 13 May 2021 10:03:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126805.238276; Thu, 13 May 2021 10:03:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lh8BR-0003w1-4C; Thu, 13 May 2021 10:03:09 +0000
Received: by outflank-mailman (input) for mailman id 126805;
 Thu, 13 May 2021 10:03:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KipV=KI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lh8BP-0003vg-Ic
 for xen-devel@lists.xenproject.org; Thu, 13 May 2021 10:03:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 00e1ba1c-2504-4cff-8bd5-617ae886048c;
 Thu, 13 May 2021 10:03:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 85808AFE5;
 Thu, 13 May 2021 10:03:05 +0000 (UTC)
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
X-Inumbo-ID: 00e1ba1c-2504-4cff-8bd5-617ae886048c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620900185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=mSXvMzPiVbs1p8U5teTrqe++A9Kur1ffFfsRtolTEq4=;
	b=Bt3HWyrBQzhFA/VHRnLOrbIQmpMXluR0avJegIDgYP/25lKg9FIZAPmZkKNNj4Tn46vHsx
	DqH+iMtGCUU89BF3407TPvLq70y+9QiQwuomJ/KD69JlH6Mpq8EAgwwGKMJeCtvkebsFoG
	WMLd9rAM4L+C5WZX30UyH56rbG89gqM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH 0/8] xen: harden frontends against malicious backends
Date: Thu, 13 May 2021 12:02:54 +0200
Message-Id: <20210513100302.22027-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xen backends of para-virtualized devices can live in dom0 kernel, dom0
user land, or in a driver domain. This means that a backend might
reside in a less trusted environment than the Xen core components, so
a backend should not be able to do harm to a Xen guest (it can still
mess up I/O data, but it shouldn't be able to e.g. crash a guest by
other means or cause a privilege escalation in the guest).

Unfortunately many frontends in the Linux kernel are fully trusting
their respective backends. This series is starting to fix the most
important frontends: console, disk and network.

It was discussed to handle this as a security problem, but the topic
was discussed in public before, so it isn't a real secret.

Juergen Gross (8):
  xen: sync include/xen/interface/io/ring.h with Xen's newest version
  xen/blkfront: read response from backend only once
  xen/blkfront: don't take local copy of a request from the ring page
  xen/blkfront: don't trust the backend response data blindly
  xen/netfront: read response from backend only once
  xen/netfront: don't read data from request on the ring page
  xen/netfront: don't trust the backend response data blindly
  xen/hvc: replace BUG_ON() with negative return value

 drivers/block/xen-blkfront.c    | 118 +++++++++-----
 drivers/net/xen-netfront.c      | 184 ++++++++++++++-------
 drivers/tty/hvc/hvc_xen.c       |  15 +-
 include/xen/interface/io/ring.h | 278 ++++++++++++++++++--------------
 4 files changed, 369 insertions(+), 226 deletions(-)

-- 
2.26.2


