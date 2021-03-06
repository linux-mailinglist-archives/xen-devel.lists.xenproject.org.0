Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF1A32FBC9
	for <lists+xen-devel@lfdr.de>; Sat,  6 Mar 2021 17:18:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94312.177819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIZdW-0002B0-E1; Sat, 06 Mar 2021 16:18:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94312.177819; Sat, 06 Mar 2021 16:18:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIZdW-0002AM-A4; Sat, 06 Mar 2021 16:18:38 +0000
Received: by outflank-mailman (input) for mailman id 94312;
 Sat, 06 Mar 2021 16:18:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ENtS=IE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lIZdV-0002A8-4Z
 for xen-devel@lists.xenproject.org; Sat, 06 Mar 2021 16:18:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 502256a5-b19b-421c-9ea6-c2ff01401d2c;
 Sat, 06 Mar 2021 16:18:36 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 894A6ACBF;
 Sat,  6 Mar 2021 16:18:35 +0000 (UTC)
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
X-Inumbo-ID: 502256a5-b19b-421c-9ea6-c2ff01401d2c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615047515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8J1qAdHunz+tmbQ9/r5zGTbgmDsvG9L+i6KEmaXahyU=;
	b=GbHI37Qp2DIWCj2DDCYa8vhoXGGZy59OCOoz24/s+MnE62esSHkcr80s9p6Cyt1yw6+uWJ
	Hy7jV1MpQww0MrpBWSNmxhvJ84UTYK9D2cdLc9uP1Z2hnokvYBtB72NGy0ZOglaGl47lHi
	vO4oNHGV2YZsIAPwuQnpBTR9ldXAJWc=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v4 0/3] xen/events: bug fixes and some diagnostic aids
Date: Sat,  6 Mar 2021 17:18:30 +0100
Message-Id: <20210306161833.4552-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Those are fixes for XSA-332.

The rest of the V3 patches have been applied already. There is one
additional fix in patch 2 which addresses network outages when a guest
is doing reboot loops.

Juergen Gross (3):
  xen/events: reset affinity of 2-level event when tearing it down
  xen/events: don't unmask an event channel when an eoi is pending
  xen/events: avoid handling the same event on two cpus at the same time

 drivers/xen/events/events_2l.c       |  22 +++--
 drivers/xen/events/events_base.c     | 130 ++++++++++++++++++++-------
 drivers/xen/events/events_fifo.c     |   7 --
 drivers/xen/events/events_internal.h |  14 +--
 4 files changed, 123 insertions(+), 50 deletions(-)

-- 
2.26.2


