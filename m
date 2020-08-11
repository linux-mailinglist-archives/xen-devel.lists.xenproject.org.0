Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E89241914
	for <lists+xen-devel@lfdr.de>; Tue, 11 Aug 2020 11:45:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5QqC-0004kb-DO; Tue, 11 Aug 2020 09:45:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rrfz=BV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k5QqB-0004kV-5W
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2020 09:45:07 +0000
X-Inumbo-ID: 60a98ae8-8e9e-4496-9916-786ac9e16fa8
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 60a98ae8-8e9e-4496-9916-786ac9e16fa8;
 Tue, 11 Aug 2020 09:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597139105;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=C1C/bfcTzAjyjIEmceYjlKaTAd0vBlG0fPV+iLhjdZQ=;
 b=UzgbGWYqek2dFZbrtOupRPFD8L2vDlYfEdzHclTutngS3UojNR/e+k2m
 MPzjN5oarYrI/FLukR2BaPVjs3reZ5N/kRcrSvQyy3zfR5wXlwkvB95Hg
 Fe1xz9+YYeyyvlvyqVzfOnkNh9tWo62wLVz6FKfLzANs965ShNCPiulrI 8=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: yCcrGj6Y7sGlIM1t377a4q/TQDwBL2wPr7/L/nPfOKNCau+nryFLlWIEk43kz2kHCEPigs6Shn
 6gcd0lLnPt++IrOYG+b7Q1BsnLxmH50uRZ0QT8tFRbwZVw75DyuaNwSBfW7K/EjP2WyoMlK/Cg
 ZItZc8Zaf9jovqJ5ToCurtpCnDN09KAQITdBNyiyHgD1BW4c0aDlsRxqeELcE7npraP/aCx3pR
 ssSzHJcpTPMZmZWLgFRQeuzY5dor0VzeYuxAIYReQJ3ez41R9oPlg5qqlGAxx+Vqa1qzezRNVL
 2us=
X-SBRS: 2.7
X-MesageID: 24569967
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,460,1589256000"; d="scan'208";a="24569967"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 0/2] xen/balloon: fixes for memory hotplug
Date: Tue, 11 Aug 2020 11:44:45 +0200
Message-ID: <20200811094447.31208-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
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

The main difference in this version is that MEMORY_DEVICE_DEVDAX is
renamed to MEMORY_DEVICE_GENERIC, as using DEVDAX in the Xen code to
allocate unpopulated memory felt wrong.

Thanks, Roger.

Roger Pau Monne (2):
  memremap: rename MEMORY_DEVICE_DEVDAX to MEMORY_DEVICE_GENERIC
  xen: add helpers to allocate unpopulated memory

 drivers/dax/device.c                    |   2 +-
 drivers/gpu/drm/xen/xen_drm_front_gem.c |   9 +-
 drivers/xen/Kconfig                     |   4 +
 drivers/xen/Makefile                    |   1 +
 drivers/xen/balloon.c                   |   4 +-
 drivers/xen/grant-table.c               |   4 +-
 drivers/xen/privcmd.c                   |   4 +-
 drivers/xen/unpopulated-alloc.c         | 185 ++++++++++++++++++++++++
 drivers/xen/xenbus/xenbus_client.c      |   6 +-
 drivers/xen/xlate_mmu.c                 |   4 +-
 include/linux/memremap.h                |   9 +-
 include/xen/xen.h                       |   9 ++
 mm/memremap.c                           |   2 +-
 13 files changed, 221 insertions(+), 22 deletions(-)
 create mode 100644 drivers/xen/unpopulated-alloc.c

-- 
2.28.0


