Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7AFA128C0
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 17:36:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872761.1283786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY6My-0004Kg-J3; Wed, 15 Jan 2025 16:35:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872761.1283786; Wed, 15 Jan 2025 16:35:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY6My-0004Fb-Ag; Wed, 15 Jan 2025 16:35:52 +0000
Received: by outflank-mailman (input) for mailman id 872761;
 Wed, 15 Jan 2025 16:35:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rWPo=UH=casper.srs.infradead.org=BATV+fb641630334796bb9467+7815+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1tY6Mw-0003cf-BM
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 16:35:50 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4c9988f-d35e-11ef-99a4-01e77a169b0f;
 Wed, 15 Jan 2025 17:35:45 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1tY6Mq-0000000GF6F-0HXR; Wed, 15 Jan 2025 16:35:44 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tY6Mp-00000001HhI-3F67; Wed, 15 Jan 2025 16:35:43 +0000
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
X-Inumbo-ID: c4c9988f-d35e-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=rrBZA8lyQEOQWQ/8jP8VTP1JvBxjDjQmwbWIQpBZfxo=; b=bNgCieMNDffHCdWjm/68OAkXTG
	d5w+ofW/5y5gRlSK97lAC1R66Sg+L2TSKt30Vt0HN8TGF8l8ThTmrOYOR5YdWa8FJLXSwEx/p7+p1
	mdJUyZaRDzrbtOj01paIYHTzyYiqftFNDGQZie3ihQvnI8v8BEv+sb7c1JME9/etOAgBvD1lO1y7d
	+CxQKnbgM6P5aRh+Gl7jzfnnWkIUHpDOg8FYO1ySbUU2+sOd4YmD3otlB7IuxlIevQ+Z39rjP1LKP
	S5phfA9zv3PP2u+MrYdadmzCGy35rL1VR2fvUvulJxgUz2qYu4ah8uc6cIdzD/yh0iUix+aI38HXa
	j/my6YBQ==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org
Subject: [PATCH v3 1/7] xen: error handling and FreeBSD compatibility fixes
Date: Wed, 15 Jan 2025 16:27:18 +0000
Message-ID: <20250115163542.291424-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Add a new xs_node_read() helper function which constructs the node path 
using a printf format string, and use it where appropriate.

In particular, use it to eliminate the use of the %ms format specifier 
for scanf(), which doesn't exist in FreeBSD.

v3:
 • Further cleanups using xs_node_read().
 • Clean up errp handling for xen-console 'output' node.
 • Improve comment for xs_node_read().

v2:
 • Add xs_node_read() helper.
 • Also fix usage of %ms in xen-block.c

David Woodhouse (6):
      hw/xen: Add xs_node_read() helper function
      hw/xen: Use xs_node_read() from xs_node_vscanf()
      hw/xen: Use xs_node_read() from xen_console_get_name()
      hw/xen: Use xs_node_read() from xen_netdev_get_name()
      hw/xen: Use xs_node_read() from xenstore_read_str() instead of open-coding it
      hw/xen: Fix errp handling in xen_console

Roger Pau Monné (1):
      xen: do not use '%ms' scanf specifier

 hw/block/xen-block.c            |  3 ++-
 hw/char/xen_console.c           | 56 ++++++++++++++++++++++++-----------------
 hw/net/xen_nic.c                | 13 +++++-----
 hw/xen/trace-events             |  2 +-
 hw/xen/xen-bus-helper.c         | 37 ++++++++++++++++++++-------
 hw/xen/xen-bus.c                | 14 +++++++++--
 hw/xen/xen_pvdev.c              |  6 ++---
 include/hw/xen/xen-bus-helper.h |  9 +++++++
 include/hw/xen/xen-bus.h        |  1 +
 9 files changed, 94 insertions(+), 47 deletions(-)


