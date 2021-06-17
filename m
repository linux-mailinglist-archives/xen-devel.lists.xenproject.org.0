Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 418F23ABF67
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 01:30:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144191.265456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lu1SF-0000QW-4d; Thu, 17 Jun 2021 23:29:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144191.265456; Thu, 17 Jun 2021 23:29:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lu1SF-0000Nu-1Q; Thu, 17 Jun 2021 23:29:47 +0000
Received: by outflank-mailman (input) for mailman id 144191;
 Thu, 17 Jun 2021 23:29:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uRdX=LL=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1lu1SD-0000No-R9
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 23:29:46 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b2d330fa-39ab-43a1-afab-57eefe836421;
 Thu, 17 Jun 2021 23:29:44 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1623972570136919.7959647662097;
 Thu, 17 Jun 2021 16:29:30 -0700 (PDT)
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
X-Inumbo-ID: b2d330fa-39ab-43a1-afab-57eefe836421
ARC-Seal: i=1; a=rsa-sha256; t=1623972571; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QxO0GJY8DRCnDkKxZKYV7xJanLe7P/YBWo4PsycDOYi9kaed3Nsslnz85pNZdTc65lkqTWR321yVRhVugz6T5XDQr8aqoMNS7knmS5wp+0kKonajeIj+YigRMdZl1DHeyFYMOkzmrj2NT+oJHUl788WqPlQAQ+b31ky5NydyyTA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1623972571; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=WxFwJbkeLx48JJcKKFj8bqNXb8kx5EkWM6kLDvPg1uw=; 
	b=IxDhegwUJgYTV3yqwUkRcu/lKbb75RGd7sHrI0t16hkkX1MXt0ZVdqShVRNpjE2CAHLGGbHO0P9LREYoGOw6UOlo1rfMQJv8o6642GZQr8NmnmHTyHOT71O09pGulmURMWqi2/nXrH4MijYQEi5p12cyWZJ60Mvc6TOjNNR0vSU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1623972571;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
	bh=WxFwJbkeLx48JJcKKFj8bqNXb8kx5EkWM6kLDvPg1uw=;
	b=LeorGAiZqHjv35c7Kl0p23czVYlFvW9FPu1NjweNlyibyNWCHQ2AbNfhb0lBMo6M
	NbUrVWLT6ngvSrlOC5iLDZ93FNwil0Vq7kGpG0jSrRAjN/SFhF8x04M/KZ6jTsigNi7
	9oDFCccVu7HS6XpfzXC31XwQiHLFCTtnUYWJ6rbo=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Tim Deegan <tim@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Paul Durrant <paul@xen.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	persaur@gmail.com,
	christopher.w.clark@gmail.com,
	adam.schwalm@starlab.io,
	scott.davis@starlab.io
Subject: [PATCH 0/6] xsm: refactoring xsm hooks
Date: Thu, 17 Jun 2021 19:39:12 -0400
Message-Id: <20210617233918.10095-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Based on feedback from 2021 Xen Developers Summit the xsm-roles RFC
patch set is being split into two separate patch sets. This is the first
patch set and is focused purely on the clean up and refactoring of the
XSM hooks.

This patch set refactors the xsm_ops wrapper hooks to use the alternative_call
infrastructure. Then proceeds to move and realign the headers to remove the
psuedo is/is not enable implementation. The remainder of the changes are clean up
and removing no longer necessary abstractions.

Daniel P. Smith (6):
  xsm: refactor xsm_ops handling
  xsm: decouple xsm header inclusion selection
  xsm: enabling xsm to always be included
  xsm: remove xen_defualt_t from hook definitions
  xsm: expanding function related macros in dummy.h
  xsm: removing the XSM_ASSERT_ACTION macro

 xen/arch/arm/dm.c                     |   2 +-
 xen/arch/arm/domctl.c                 |   6 +-
 xen/arch/arm/hvm.c                    |   2 +-
 xen/arch/arm/mm.c                     |   2 +-
 xen/arch/arm/platform_hypercall.c     |   2 +-
 xen/arch/x86/cpu/mcheck/mce.c         |   2 +-
 xen/arch/x86/cpu/vpmu.c               |   2 +-
 xen/arch/x86/domctl.c                 |   8 +-
 xen/arch/x86/hvm/dm.c                 |   2 +-
 xen/arch/x86/hvm/hvm.c                |  12 +-
 xen/arch/x86/irq.c                    |   5 +-
 xen/arch/x86/mm.c                     |  20 +-
 xen/arch/x86/mm/mem_paging.c          |   2 +-
 xen/arch/x86/mm/mem_sharing.c         |   9 +-
 xen/arch/x86/mm/p2m.c                 |   2 +-
 xen/arch/x86/mm/paging.c              |   4 +-
 xen/arch/x86/mm/shadow/set.c          |   2 +-
 xen/arch/x86/msi.c                    |   3 +-
 xen/arch/x86/pci.c                    |   2 +-
 xen/arch/x86/physdev.c                |  17 +-
 xen/arch/x86/platform_hypercall.c     |  10 +-
 xen/arch/x86/pv/emul-priv-op.c        |   2 +-
 xen/arch/x86/sysctl.c                 |   4 +-
 xen/common/Kconfig                    |  55 +-
 xen/common/domain.c                   |   4 +-
 xen/common/domctl.c                   |  12 +-
 xen/common/event_channel.c            |  12 +-
 xen/common/grant_table.c              |  16 +-
 xen/common/hypfs.c                    |   2 +-
 xen/common/kernel.c                   |   2 +-
 xen/common/kexec.c                    |   2 +-
 xen/common/mem_access.c               |   2 +-
 xen/common/memory.c                   |  16 +-
 xen/common/monitor.c                  |   2 +-
 xen/common/sched/core.c               |   6 +-
 xen/common/sysctl.c                   |   8 +-
 xen/common/vm_event.c                 |   2 +-
 xen/common/xenoprof.c                 |   2 +-
 xen/drivers/char/console.c            |   2 +-
 xen/drivers/passthrough/device_tree.c |   4 +-
 xen/drivers/passthrough/pci.c         |  12 +-
 xen/include/xen/sched.h               |   2 +-
 xen/include/xsm/dummy.h               | 774 --------------------------
 xen/include/xsm/xsm-core.h            | 236 ++++++++
 xen/include/xsm/xsm.h                 | 626 +++++++--------------
 xen/xsm/Makefile                      |   4 +-
 xen/xsm/dummy.c                       |   7 +-
 xen/xsm/dummy.h                       | 697 +++++++++++++++++++++++
 xen/xsm/flask/flask_op.c              |  21 +-
 xen/xsm/silo.c                        |  18 +-
 xen/xsm/xsm_core.c                    |  54 +-
 51 files changed, 1309 insertions(+), 1413 deletions(-)
 delete mode 100644 xen/include/xsm/dummy.h
 create mode 100644 xen/include/xsm/xsm-core.h
 create mode 100644 xen/xsm/dummy.h

-- 
2.20.1


