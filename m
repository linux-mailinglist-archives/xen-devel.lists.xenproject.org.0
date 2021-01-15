Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD082F7E35
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 15:32:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68171.122002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Q8r-0002Q0-8L; Fri, 15 Jan 2021 14:31:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68171.122002; Fri, 15 Jan 2021 14:31:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Q8r-0002PW-4v; Fri, 15 Jan 2021 14:31:57 +0000
Received: by outflank-mailman (input) for mailman id 68171;
 Fri, 15 Jan 2021 14:31:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v6X5=GS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l0Q8p-0002PO-PX
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 14:31:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36b4893d-52ef-4ac7-b1bf-ce58877b11cd;
 Fri, 15 Jan 2021 14:31:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 37D88ABDA;
 Fri, 15 Jan 2021 14:31:54 +0000 (UTC)
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
X-Inumbo-ID: 36b4893d-52ef-4ac7-b1bf-ce58877b11cd
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610721114; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=H7N+SEhZ45fsxR0kXGVHPeygiOlR6ozuZnfFEqaXE/o=;
	b=h6RJLtDDTU3b1J8TKvxwOxWBRLuNzZ8TD2zsnRN0LNJobty8gVjUU/WwFbBBLPd0mEb+HT
	8jFmPkyJVALTJ5daj+VE7YydzSWB19jdooUdm63mEJ+VGDIVA6cNtMvzvvYKC+C8rmqnHe
	MvtZu943WLwYwpXe5ObsV6eetz03WjI=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	boris.ostrovsky@oracle.com
Subject: [GIT PULL] xen: branch for v5.11-rc4
Date: Fri, 15 Jan 2021 15:31:53 +0100
Message-Id: <20210115143153.30040-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.11-rc4-tag

xen: branch for v5.11-rc4

It contains:

- A series for fixing a regression when running as a fully virtualized
  guest on an old Xen hypervisor not supporting PV interrupt callbacks
  for HVM guests.

- A patch for adding support to query Xen resource sizes (setting was
  possible already) from user mode.


Thanks.

Juergen

 Documentation/admin-guide/kernel-parameters.txt |  4 ++
 arch/arm/xen/enlighten.c                        |  2 +-
 arch/x86/xen/enlighten_hvm.c                    | 15 ++++-
 arch/x86/xen/smp_hvm.c                          | 27 ++++++---
 drivers/xen/events/events_base.c                | 10 ---
 drivers/xen/platform-pci.c                      |  8 ++-
 drivers/xen/privcmd.c                           | 25 ++++++--
 drivers/xen/xenbus/xenbus.h                     |  1 +
 drivers/xen/xenbus/xenbus_comms.c               |  8 ---
 drivers/xen/xenbus/xenbus_probe.c               | 81 ++++++++++++++++++++-----
 include/xen/xenbus.h                            |  2 +-
 11 files changed, 129 insertions(+), 54 deletions(-)

David Woodhouse (5):
      xen: Fix event channel callback via INTX/GSI
      xen: Set platform PCI device INTX affinity to CPU0
      x86/xen: Add xen_no_vector_callback option to test PCI INTX delivery
      x86/xen: Don't register Xen IPIs when they aren't going to be used
      x86/xen: Fix xen_hvm_smp_init() when vector callback not available

Roger Pau Monne (1):
      xen/privcmd: allow fetching resource sizes

