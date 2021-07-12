Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDB23C64EE
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jul 2021 22:27:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154759.285860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m32WE-0007Yc-PR; Mon, 12 Jul 2021 20:27:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154759.285860; Mon, 12 Jul 2021 20:27:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m32WE-0007Vy-MK; Mon, 12 Jul 2021 20:27:10 +0000
Received: by outflank-mailman (input) for mailman id 154759;
 Mon, 12 Jul 2021 20:27:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Agf=ME=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1m32WD-0007Vs-Bg
 for xen-devel@lists.xenproject.org; Mon, 12 Jul 2021 20:27:09 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 86ece388-e34f-11eb-8706-12813bfff9fa;
 Mon, 12 Jul 2021 20:27:07 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 162612162173030.685544024765363;
 Mon, 12 Jul 2021 13:27:01 -0700 (PDT)
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
X-Inumbo-ID: 86ece388-e34f-11eb-8706-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; t=1626121625; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Q2eQ6R/AQZjPMt9McBECeY4heGEeH6O6cLSOAYytFf4lf8ksZSD63B1CBJ2u4BL9kAp6cDUtYnt3nZPnqHzymRIoJeNv9wksqfFzng73GpROhK37Nx6AZQNkWq6IS/WQeEx8jO6Q6Tw4dEpScZMwdEtMLerCR63Tz2pWti6Y87A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1626121625; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=9iesqu1CfuYWPlaOe8yxlR3SXqyntAXWBDNEZCKcZiM=; 
	b=aJ1x+cRGGGSBds5eGbXGkjmmD0ZMCMrSKiyK2ZDjooNr8Nu5PsjhVuf5iJm0BXsm0LRBFd0f5BYs7Fceuz4fKFP/2TvrVzEMpM3M9CL5X6Y6tHb7DUfwf3+bqY27WMzvUgVLuLfQufQgcViD07XfgWPStd11oxB2vv6du197zUo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1626121625;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
	bh=9iesqu1CfuYWPlaOe8yxlR3SXqyntAXWBDNEZCKcZiM=;
	b=cWwTr+jqiF1Wl8F/U1iABnV9g/GC/Drasz9brI5Xm3CQKTYHSNAyh/bSGljd70++
	eJfHwheUNtCp3qCMVH6xOWifrpRSGLPaSzwpfDhq8VucWeKUfyOeYDiOMe/VQndYt41
	HHkKLz2WN1ygfVXFhqKdHp6G6mdYu3JlHQBgdJJw=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v2 00/10]  xsm: refactoring xsm hooks
Date: Mon, 12 Jul 2021 16:32:23 -0400
Message-Id: <20210712203233.20289-1-dpsmith@apertussolutions.com>
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

v2:
 - restructured the patches, breaking them up as needed
 - incorporate Andrew Cooper's alternative call common code
 - change XSM module registration, removing register_xsm
 - incoporate KConfig recommendations
 - reworded commit messages
 - incorporate macro expansion recommendations
 - misc clean-up fallout from recommendations

Andrew Cooper (1):
  xen: Implement xen/alternative-call.h for use in common code

Daniel P. Smith (9):
  xsm: refactor xsm_ops handling
  xsm: remove the ability to disable flask
  xsm: convert xsm_ops hook calls to alternative call
  xsm: decouple xsm header inclusion selection
  xsm: enable xsm to always be included
  xsm: drop generic event channel labeling
  xsm: remove xsm_default_t from hook definitions
  xsm: expand the function related macros in dummy.h
  xsm: removing the XSM_ASSERT_ACTION macro

 xen/arch/arm/dm.c                     |   2 +-
 xen/arch/arm/domctl.c                 |   6 +-
 xen/arch/arm/hvm.c                    |   2 +-
 xen/arch/arm/mm.c                     |   2 +-
 xen/arch/arm/platform_hypercall.c     |   2 +-
 xen/arch/x86/Kconfig                  |   1 +
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
 xen/common/Kconfig                    |  48 +-
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
 xen/include/xen/alternative-call.h    |  65 +++
 xen/include/xen/sched.h               |   9 -
 xen/include/xsm/dummy.h               | 774 --------------------------
 xen/include/xsm/xsm-core.h            | 237 ++++++++
 xen/include/xsm/xsm.h                 | 623 +++++++--------------
 xen/xsm/Makefile                      |   4 +-
 xen/xsm/dummy.c                       |   7 +-
 xen/xsm/dummy.h                       | 696 +++++++++++++++++++++++
 xen/xsm/flask/flask_op.c              |  30 -
 xen/xsm/flask/hooks.c                 |  11 +-
 xen/xsm/silo.c                        |  23 +-
 xen/xsm/xsm_core.c                    |  76 +--
 54 files changed, 1381 insertions(+), 1451 deletions(-)
 create mode 100644 xen/include/xen/alternative-call.h
 delete mode 100644 xen/include/xsm/dummy.h
 create mode 100644 xen/include/xsm/xsm-core.h
 create mode 100644 xen/xsm/dummy.h

-- 
2.20.1


