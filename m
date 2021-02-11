Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 739DE3187E5
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 11:18:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83794.156791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lA92d-0001Vm-55; Thu, 11 Feb 2021 10:17:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83794.156791; Thu, 11 Feb 2021 10:17:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lA92d-0001VN-1l; Thu, 11 Feb 2021 10:17:43 +0000
Received: by outflank-mailman (input) for mailman id 83794;
 Thu, 11 Feb 2021 10:17:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/E5q=HN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lA92b-0001Uu-VA
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 10:17:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93fd298e-33ea-4c26-a35d-e453663e6bc5;
 Thu, 11 Feb 2021 10:17:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2F54EADA2;
 Thu, 11 Feb 2021 10:17:40 +0000 (UTC)
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
X-Inumbo-ID: 93fd298e-33ea-4c26-a35d-e453663e6bc5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613038660; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=in+h4lBDIRM6mJ7t9cKXZa5bGbgsEjGF9LUcGBiK4pw=;
	b=V6/nHildAeeP4mTaW9pkNSIVN3W5JG7oTeZ/pm8uEYQwO4UvFiHUpuKpMve/BpBv1v2hDc
	zSTmNSzLpmjpGw4gEVI+1q7BnJ17tQmdjF7FJ39oRAfLmWt2kbB7tj8L2NeYypbl1pGYHA
	D4i8R84Uh3YQj183ZThezUvLnAY9qNY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-scsi@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	stable@vger.kernel.org,
	Wei Liu <wei.liu@kernel.org>,
	Paul Durrant <paul@xen.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH v2 0/8] xen/events: bug fixes and some diagnostic aids
Date: Thu, 11 Feb 2021 11:16:08 +0100
Message-Id: <20210211101616.13788-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first four patches are fixes for XSA-332. The avoid WARN splats
and a performance issue with interdomain events.

Patches 5 and 6 are some additions to event handling in order to add
some per pv-device statistics to sysfs and the ability to have a per
backend device spurious event delay control.

Patches 7 and 8 are minor fixes I had lying around.

Juergen Gross (8):
  xen/events: reset affinity of 2-level event when tearing it down
  xen/events: don't unmask an event channel when an eoi is pending
  xen/events: avoid handling the same event on two cpus at the same time
  xen/netback: fix spurious event detection for common event case
  xen/events: link interdomain events to associated xenbus device
  xen/events: add per-xenbus device event statistics and settings
  xen/evtchn: use smp barriers for user event ring
  xen/evtchn: use READ/WRITE_ONCE() for accessing ring indices

 .../ABI/testing/sysfs-devices-xenbus          |  41 ++++
 drivers/block/xen-blkback/xenbus.c            |   2 +-
 drivers/net/xen-netback/interface.c           |  24 ++-
 drivers/xen/events/events_2l.c                |  22 +-
 drivers/xen/events/events_base.c              | 190 ++++++++++++++----
 drivers/xen/events/events_fifo.c              |   7 -
 drivers/xen/events/events_internal.h          |  14 +-
 drivers/xen/evtchn.c                          |  29 ++-
 drivers/xen/pvcalls-back.c                    |   4 +-
 drivers/xen/xen-pciback/xenbus.c              |   2 +-
 drivers/xen/xen-scsiback.c                    |   2 +-
 drivers/xen/xenbus/xenbus_probe.c             |  66 ++++++
 include/xen/events.h                          |   7 +-
 include/xen/xenbus.h                          |   7 +
 14 files changed, 323 insertions(+), 94 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-xenbus

-- 
2.26.2


