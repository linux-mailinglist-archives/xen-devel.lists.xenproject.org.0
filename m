Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7463B22E89C
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 11:15:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jzzDu-0004OI-Qm; Mon, 27 Jul 2020 09:15:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1WzZ=BG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jzzDs-0004OD-MB
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 09:15:04 +0000
X-Inumbo-ID: a6aadbf1-cfe9-11ea-8a7e-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6aadbf1-cfe9-11ea-8a7e-bc764e2007e4;
 Mon, 27 Jul 2020 09:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595841303;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XRiTkYPt/VoC9tJRw/kDVebohjydPMQ3t9eNfBCqXdU=;
 b=Lyj0XVJNKWirANFhaUByZk7n57WoEeGBxa6UlNdyGOcWgMuVRMBfQ5ld
 McA5w4ZKZ27A4R8WDvpLqhHExcn/AV0CBdk5C3MAIavwWs5Q1txPHlfUX
 47rSndytsZtuIALmNOGNUgw+f4PgA49XjTDZ5/LXKOe7TvqlrkDR8NziO Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: +KtSj5NtdshyL3nTLDYcTIfIGM+JtKqneYpA9XnR9mJ4w6Dz8isYXOKKcOnhJLDLSXBqEv1fu+
 VGNP0SE2q8zhO30K32oMsHQOp5hhNZgELfIOa6tfnys3f8oHgqbDGYwofr/TbczILeDIXfHUgr
 poQ3JWUpCw9BwPfD/E3zFgF8Q+/611RVo0J/BqOLVTTTJF+W3UTMRcEOfKG22Cws4bhIWNmy3J
 JevId2zYkDY2i1+FaHRkeOidBsqqHNX/ZvPjexde2s079X6tbdIdRziNV21pXv8TcP/6O/J26r
 2U4=
X-SBRS: 2.7
X-MesageID: 23233911
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,402,1589256000"; d="scan'208";a="23233911"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/4] xen/balloon: fixes for memory hotplug
Date: Mon, 27 Jul 2020 11:13:38 +0200
Message-ID: <20200727091342.52325-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: xen-devel@lists.xenproject.org, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello,

The following series contain some fixes in order to split Xen
unpopulated memory handling from the ballooning driver if ZONE_DEVICE is
available, so that physical memory regions used to map foreign pages are
not tied to memory hotplug.

First two patches are bugfixes that IMO should be backported to stable
branches, third patch is a revert of a workaround applied to the balloon
driver and last patch introduces an interface based on ZONE_DEVICE in
order to manage regions to use for foreign mappings.

Thanks, Roger.

Roger Pau Monne (4):
  xen/balloon: fix accounting in alloc_xenballooned_pages error path
  xen/balloon: make the balloon wait interruptible
  Revert "xen/balloon: Fix crash when ballooning on x86 32 bit PAE"
  xen: add helpers to allocate unpopulated memory

 drivers/gpu/drm/xen/xen_drm_front_gem.c |   9 +-
 drivers/xen/Makefile                    |   1 +
 drivers/xen/balloon.c                   |  30 ++--
 drivers/xen/grant-table.c               |   4 +-
 drivers/xen/privcmd.c                   |   4 +-
 drivers/xen/unpopulated-alloc.c         | 185 ++++++++++++++++++++++++
 drivers/xen/xenbus/xenbus_client.c      |   6 +-
 drivers/xen/xlate_mmu.c                 |   4 +-
 include/xen/xen.h                       |   9 ++
 9 files changed, 221 insertions(+), 31 deletions(-)
 create mode 100644 drivers/xen/unpopulated-alloc.c

-- 
2.27.0


