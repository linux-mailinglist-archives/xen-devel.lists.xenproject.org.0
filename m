Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF0D22C576
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 14:43:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyx2M-00012z-0z; Fri, 24 Jul 2020 12:42:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hWcK=BD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jyx2K-00012u-DT
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 12:42:52 +0000
X-Inumbo-ID: 2f1a0240-cdab-11ea-880c-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f1a0240-cdab-11ea-880c-bc764e2007e4;
 Fri, 24 Jul 2020 12:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595594572;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lKXqW8/3YOwTJyFQghmaI+GKNMTKpRONfG96XJL/WMA=;
 b=bBI4V1y1yQsRi3eVnZy6WijdUklYMPpbgtO+niDVMPVVxEHjx1/sODwp
 PztC0Q8SR08deLMZhtXD8ShY7TmlkN2kugy9+uN7H3AbZrSy5ke2wunr4
 FV06DLCU3jIbrKKUCDEOP2iK+xPCw8t6Kbit3kuGuecRuRU3OruyoZnjl 0=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: K2iI69Y6OCtQDD19Hf1T4acInpaZV4ysI4avOab6HMISqvB1o3gpzLiKS0FhxgkjERb9XUjbTM
 F5Fk3T9f8PoaJiidx88PglziYhudJ7iwbIzk0laWncsGIwz8mbbcVgIIfzCz86by8Hxvqzx5BR
 qbK8blo8XCtPs2i+LqVGnWdLRWcLB7az7C3KN4ylPsbPouPFyCxfn6homOcHD6A5C8ZGVk1Wyy
 ZBFJQbjsCo8HjxyTMtMXjYDlwSF1IkT6vaIvqsJ6hPCQ6AHZnn0CgbbMk0UmWe/uB4BCMSNSr1
 L3s=
X-SBRS: 2.7
X-MesageID: 23118831
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,390,1589256000"; d="scan'208";a="23118831"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/4] xen/balloon: fixes for memory hotplug
Date: Fri, 24 Jul 2020 14:42:37 +0200
Message-ID: <20200724124241.48208-1-roger.pau@citrix.com>
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

Fix two patches are bugfixes that IMO should be backported to stable
branches, third patch is a revert of a workaround applied to the balloon
driver and last patch introduces an interface based on ZONE_DEVICE in
order to manage regions to use for foreign mappings.

Thanks, Roger.

Roger Pau Monne (4):
  xen/balloon: fix accounting in alloc_xenballooned_pages error path
  xen/balloon: make the balloon wait interruptible
  Revert "xen/balloon: Fix crash when ballooning on x86 32 bit PAE"
  xen: add helpers to allocate unpopulated memory

 drivers/gpu/drm/xen/xen_drm_front_gem.c |   8 +-
 drivers/xen/Makefile                    |   1 +
 drivers/xen/balloon.c                   |  30 ++--
 drivers/xen/grant-table.c               |   4 +-
 drivers/xen/privcmd.c                   |   4 +-
 drivers/xen/unpopulated-alloc.c         | 222 ++++++++++++++++++++++++
 drivers/xen/xenbus/xenbus_client.c      |   6 +-
 drivers/xen/xlate_mmu.c                 |   4 +-
 include/xen/xen.h                       |   8 +
 9 files changed, 256 insertions(+), 31 deletions(-)
 create mode 100644 drivers/xen/unpopulated-alloc.c

-- 
2.27.0


