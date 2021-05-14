Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C273811F4
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 22:46:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127521.239675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhehL-0006o9-1W; Fri, 14 May 2021 20:46:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127521.239675; Fri, 14 May 2021 20:46:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhehK-0006lC-U9; Fri, 14 May 2021 20:46:14 +0000
Received: by outflank-mailman (input) for mailman id 127521;
 Fri, 14 May 2021 20:46:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l2R2=KJ=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1lhehK-0006l6-2P
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 20:46:14 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ee04ce41-d9d4-4706-8495-47c9c4031e2c;
 Fri, 14 May 2021 20:46:13 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1621025154661522.5568518117393;
 Fri, 14 May 2021 13:45:54 -0700 (PDT)
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
X-Inumbo-ID: ee04ce41-d9d4-4706-8495-47c9c4031e2c
ARC-Seal: i=1; a=rsa-sha256; t=1621025158; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ehKabzDPxLZDX2U4T3mPrx3ngawThjUlqyJXQtNuLFU4PBbH3CLYwftGAowUKR8Ly37HiMdB1R94vE0LpSTbaY4K8BXf0oC51KYC/A9SL1UR24W+vTVLVqs4CHSVoWN2UrUVcqoStIOgX5vRC2QX5USxv/EMxeDLTdARsgOHuxk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1621025158; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=Y7sXM4Hf3vHolzJWQE5uuSY38u+U13ssP/wqK949sMw=; 
	b=oEklJHLWrwpZPIgn5lY0gSEGe8SSEE2aTibbITS3+EJbQrgdY8S99S6ZbFBHzbN20ztyKWEH+fD9SVoIjrWmW8IDUlXTy9UsjqtaWoIMakQtVd0cuN7o9wexY8335fC5gLHyjkDPdnM4hATsP0iN2NJZ85lXKITPKIHEV6scM5A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com> header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1621025158;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
	bh=Y7sXM4Hf3vHolzJWQE5uuSY38u+U13ssP/wqK949sMw=;
	b=ApyvX3EhlNb4aJ890tpdbGGT54aagKoCIizWONhAqShGA9K7XCLen3OkChUklpQ3
	hLMG5nVrf1+jW6JGnLuMLpEWwrfsPyxX6eISeSf06T4TR1tHh5pyPmiyiizNurLgGsJ
	vdvHc7SNpVtMzTCwdJzCdB9mELnm0Rvifcshyw44=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	iwj@xenproject.org,
	jbeulich@suse.com,
	wl@xen.org,
	roger.pau@citrix.com,
	tamas@tklengyel.com,
	tim@xen.org,
	jgross@suse.com,
	aisaila@bitdefender.com,
	ppircalabu@bitdefender.com,
	dfaggioli@suse.com,
	paul@xen.org,
	kevin.tian@intel.com,
	dgdegra@tycho.nsa.gov,
	adam.schwalm@starlab.io,
	scott.davis@starlab.io
Subject: [RFC PATCH 00/10] xsm: introducing domain roles
Date: Fri, 14 May 2021 16:54:27 -0400
Message-Id: <20210514205437.13661-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

During the hyperlaunch design sessions a request was made to come up with a
formal definition of the roles a domain was allowed to take on. In particular
the primary focus was to answer what is the control domain and what is the
hardware domain. Another comment came up during the discussion on PCI pass
through and how it would work in a disaggregated platform as what was being
proposed as a primary use case for hyperlaunch. Based on these concerns, the
hyperlaunch team took a hard look at what were all the roles that were either
explicitly defined in code, loosely defined in code, as well as those that were
more conceptual or required a solutions like Flask.

The result is that a set of seven explicitly assignable domain roles and three
implied domain roles were identified and defined. To provide for and enforce
these domain roles, it was identified that the core XSM system in fact existed
in this pseudo unsupported but supported existance. Depending on whether XSM
was turned on or off did not turn on or off the XSM hooks, it only deterimined
if the base "dummy policy module" was inlined in for the XSM hooks or if they
were made availble through the xsm_ops op dispatch structure.

This patch set starts with converting the existing security controls to using
the identified domain roles. It then moves to making the domain roles the core
enforcement mechanism for XSM and merging the split state of existance into an
equivalent of its supported form. With the conversion of XSM, the SILO policy
module is refactored to achieve its security goal as an extension of the domain
roles mechanism. The necessary adjustments are made to Flask and the Kconfig
system to support this work.

Due to the impact of this change, every effort was made to ensure the patch set
is bisectable and the features can be tested incrementally. This is an RFC with
limited building and testing completed against it, therefore one may find build
configurations and runtime configurations that do not work.

Daniel P. Smith (10):
  headers: introduce new default privilege model
  control domain: refactor is_control_domain
  xenstore: migrate to default privilege model
  xsm: convert rewrite privilege check function
  hardware domain: convert to domain roles
  xsm-roles: covert the dummy system to roles
  xsm-roles: adjusting core xsm
  xsm-silo: convert silo over to domain roles
  xsm-flask: clean up for domain roles conversion
  common/Kconfig: updating Kconfig for domain roles

 xen/arch/arm/dm.c                     |   2 +-
 xen/arch/arm/domctl.c                 |   6 +-
 xen/arch/arm/hvm.c                    |   2 +-
 xen/arch/arm/mm.c                     |   2 +-
 xen/arch/arm/platform_hypercall.c     |   2 +-
 xen/arch/x86/acpi/cpu_idle.c          |   3 +-
 xen/arch/x86/cpu/mcheck/mce.c         |   2 +-
 xen/arch/x86/cpu/mcheck/vmce.h        |   3 +-
 xen/arch/x86/cpu/vpmu.c               |   9 +-
 xen/arch/x86/crash.c                  |   2 +-
 xen/arch/x86/domctl.c                 |   8 +-
 xen/arch/x86/hvm/dm.c                 |   2 +-
 xen/arch/x86/hvm/hvm.c                |  12 +-
 xen/arch/x86/io_apic.c                |   9 +-
 xen/arch/x86/irq.c                    |   4 +-
 xen/arch/x86/mm.c                     |  22 +-
 xen/arch/x86/mm/mem_paging.c          |   2 +-
 xen/arch/x86/mm/mem_sharing.c         |   8 +-
 xen/arch/x86/mm/p2m.c                 |   2 +-
 xen/arch/x86/mm/paging.c              |   4 +-
 xen/arch/x86/mm/shadow/set.c          |   2 +-
 xen/arch/x86/msi.c                    |   6 +-
 xen/arch/x86/nmi.c                    |   3 +-
 xen/arch/x86/pci.c                    |   2 +-
 xen/arch/x86/physdev.c                |  16 +-
 xen/arch/x86/platform_hypercall.c     |  10 +-
 xen/arch/x86/pv/emul-priv-op.c        |   2 +-
 xen/arch/x86/setup.c                  |   3 +
 xen/arch/x86/sysctl.c                 |   4 +-
 xen/arch/x86/traps.c                  |   2 +-
 xen/arch/x86/x86_64/mm.c              |  11 +-
 xen/common/Kconfig                    |  14 +-
 xen/common/domain.c                   | 120 ++++-
 xen/common/domctl.c                   |  12 +-
 xen/common/event_channel.c            |  15 +-
 xen/common/grant_table.c              |  16 +-
 xen/common/hypfs.c                    |   2 +-
 xen/common/kernel.c                   |   2 +-
 xen/common/kexec.c                    |   4 +-
 xen/common/keyhandler.c               |   4 +-
 xen/common/mem_access.c               |   2 +-
 xen/common/memory.c                   |  16 +-
 xen/common/monitor.c                  |   2 +-
 xen/common/sched/core.c               |   6 +-
 xen/common/shutdown.c                 |  14 +-
 xen/common/sysctl.c                   |   8 +-
 xen/common/vm_event.c                 |   7 +-
 xen/common/xenoprof.c                 |   5 +-
 xen/drivers/char/console.c            |   2 +-
 xen/drivers/char/ns16550.c            |   3 +-
 xen/drivers/passthrough/device_tree.c |   4 +-
 xen/drivers/passthrough/pci.c         |  24 +-
 xen/drivers/passthrough/vtd/iommu.c   |   2 +-
 xen/include/xen/sched.h               |  30 +-
 xen/include/xsm/dummy.h               | 256 +++++-----
 xen/include/xsm/roles.h               |  70 +++
 xen/include/xsm/xsm.h                 | 710 +++++++++++++++++---------
 xen/xsm/Makefile                      |   3 +-
 xen/xsm/dummy.c                       | 160 ------
 xen/xsm/flask/flask_op.c              |   2 +-
 xen/xsm/silo.c                        |  22 +-
 xen/xsm/xsm_core.c                    |  46 +-
 62 files changed, 991 insertions(+), 759 deletions(-)
 create mode 100644 xen/include/xsm/roles.h
 delete mode 100644 xen/xsm/dummy.c

-- 
2.20.1


