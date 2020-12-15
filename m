Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D332DAD41
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 13:31:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.53428.93198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp9TX-0002RI-2m; Tue, 15 Dec 2020 12:30:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 53428.93198; Tue, 15 Dec 2020 12:30:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp9TW-0002Pt-SW; Tue, 15 Dec 2020 12:30:42 +0000
Received: by outflank-mailman (input) for mailman id 53428;
 Tue, 15 Dec 2020 12:30:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2CwE=FT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kp9QP-0004tM-Mx
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 12:27:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6d6c641c-de9c-40d7-a22d-998d6435a25d;
 Tue, 15 Dec 2020 12:26:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0DD0DADB3;
 Tue, 15 Dec 2020 12:26:07 +0000 (UTC)
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
X-Inumbo-ID: 6d6c641c-de9c-40d7-a22d-998d6435a25d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608035167; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=W/+NQPp9SmxciIO27W4TJTaEMziV4Us8QYmGpci5wz8=;
	b=I7pIBULyYlgvQCQb2uACyroNg/x7g7yRZRQ8osRIwFf+LwlSltp1xO9j3rtNnH/XkB83xy
	8NEbXjaNtGe6WDyPSkUp5gsdOWp0UYxvpyALuB2SJRvz1Y+GSL/Lp6p2CPub0Ivl3QzdQu
	00/E6V/N+BxbQZyoP4wEJ2Cn5mgYG/g=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	boris.ostrovsky@oracle.com
Subject: [GIT PULL] xen: branch for v5.11-rc1
Date: Tue, 15 Dec 2020 13:26:06 +0100
Message-Id: <20201215122606.6874-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.11-rc1-tag

xen: branch for v5.11-rc1

It contains fixes for security issues just having been disclosed:

- a 5 patch series for fixing of XSA-349 (DoS via resource depletion in
  Xen dom0)

- a patch fixing XSA-350 (access of stale pointer in a Xen dom0)


Thanks.

Juergen

 drivers/block/xen-blkback/xenbus.c        |  4 +++-
 drivers/net/xen-netback/xenbus.c          |  6 +++++-
 drivers/xen/xen-pciback/xenbus.c          |  2 +-
 drivers/xen/xenbus/xenbus.h               |  2 ++
 drivers/xen/xenbus/xenbus_client.c        |  8 +++++++-
 drivers/xen/xenbus/xenbus_probe.c         |  1 +
 drivers/xen/xenbus/xenbus_probe_backend.c |  7 +++++++
 drivers/xen/xenbus/xenbus_xs.c            | 34 ++++++++++++++++++++-----------
 include/xen/xenbus.h                      | 15 +++++++++++++-
 9 files changed, 62 insertions(+), 17 deletions(-)

Pawel Wieczorkiewicz (1):
      xen-blkback: set ring->xenblkd to NULL after kthread_stop()

SeongJae Park (5):
      xen/xenbus: Allow watches discard events before queueing
      xen/xenbus: Add 'will_handle' callback support in xenbus_watch_path()
      xen/xenbus/xen_bus_type: Support will_handle watch callback
      xen/xenbus: Count pending messages for each watch
      xenbus/xenbus_backend: Disallow pending watch messages

