Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF2433877A
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 09:35:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96900.183798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKdFE-0003mq-Cb; Fri, 12 Mar 2021 08:34:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96900.183798; Fri, 12 Mar 2021 08:34:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKdFE-0003mR-9L; Fri, 12 Mar 2021 08:34:04 +0000
Received: by outflank-mailman (input) for mailman id 96900;
 Fri, 12 Mar 2021 08:34:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XJ/t=IK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lKdFC-0003mM-Tp
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 08:34:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dcdb0e91-dfea-4bfb-8628-6d8f90f2c8ef;
 Fri, 12 Mar 2021 08:34:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CDA75AF33;
 Fri, 12 Mar 2021 08:34:00 +0000 (UTC)
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
X-Inumbo-ID: dcdb0e91-dfea-4bfb-8628-6d8f90f2c8ef
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615538040; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=kpL+Xtl6biqMgc7I3UVtrZgaY5rgIReHpDQzGV19roM=;
	b=is0Vpu7wzLDbgPxrjU0azVYRPXXlKjoS7/kJNwO/QJ8BbtsTQmoNfz+jMVrAmxpcuddRUh
	FTb+YbXHma1xou0jd3NPhxw+J7Xm3fUVhtl2O2mGAbIkrI3IjZ6mopGmImMbOfpZTEb2Mx
	7RlvAUBhugZgJm2iUMLtXT1YJ7jZcRs=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	boris.ostrovsky@oracle.com
Subject: [GIT PULL] xen: branch for v5.12-rc3
Date: Fri, 12 Mar 2021 09:34:00 +0100
Message-Id: <20210312083400.2594-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.12b-rc3-tag

xen: branch for v5.12-rc3

It contains two patch series and a single patch:

- a small cleanup patch to remove unneeded symbol exports
- a series to cleanup Xen grant handling (avoiding allocations in some
  cases, and using common defines for "invalid" values)
- a series to address a race issue in Xen event channel handling


Thanks.

Juergen

 arch/arm/xen/p2m.c                   |   5 +-
 arch/x86/xen/p2m.c                   |   6 +-
 drivers/pci/xen-pcifront.c           |   4 +-
 drivers/xen/events/events_2l.c       |  22 ++++--
 drivers/xen/events/events_base.c     | 130 +++++++++++++++++++++++++++--------
 drivers/xen/events/events_fifo.c     |   7 --
 drivers/xen/events/events_internal.h |  14 ++--
 drivers/xen/gntdev.c                 |  54 +++++++++------
 include/xen/grant_table.h            |   7 ++
 include/xen/xenbus.h                 |   1 -
 10 files changed, 169 insertions(+), 81 deletions(-)

Jan Beulich (4):
      Xen: drop exports of {set,clear}_foreign_p2m_mapping()
      Xen/gntdev: don't needlessly allocate k{,un}map_ops[]
      Xen/gnttab: introduce common INVALID_GRANT_{HANDLE,REF}
      Xen/gntdev: don't needlessly use kvcalloc()

Juergen Gross (3):
      xen/events: reset affinity of 2-level event when tearing it down
      xen/events: don't unmask an event channel when an eoi is pending
      xen/events: avoid handling the same event on two cpus at the same time

