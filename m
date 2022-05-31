Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 967E2538904
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 00:51:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338912.563752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvoEb-0002r1-9k; Mon, 30 May 2022 22:51:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338912.563752; Mon, 30 May 2022 22:51:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvoEb-0002oL-5x; Mon, 30 May 2022 22:51:37 +0000
Received: by outflank-mailman (input) for mailman id 338912;
 Mon, 30 May 2022 22:51:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=epuh=WG=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nvo5M-000799-1a
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 22:42:04 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7ffd025-e069-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 00:42:01 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1653950517414802.6910809499935;
 Mon, 30 May 2022 15:41:57 -0700 (PDT)
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
X-Inumbo-ID: b7ffd025-e069-11ec-837f-e5687231ffcc
ARC-Seal: i=1; a=rsa-sha256; t=1653950519; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=D0Qso4mixIKrtc7HLC3FRexzKc7sYDK7eDIhXrtA/9JZzDD+ZHnF05fHP3bmyyina0D+Fhc/LpEATvi+ZnYgHX9QrLgtAw7ooJKBKfeNembm1WMucLB+8wjeUNbnQ8QMPFDeM5e3+8Rk/k1l/mEd0QMvqNKtNRhbMszvES/cmB0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1653950519; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=ZeXQSjEyyrrxxE3o1HiaJLRHDYVkRyJ+opFzPaTQpPQ=; 
	b=fEuPcQ380F4ro17RpCSfYh5IkVnahTSVmVIjEjPdcM6snDJx5gyt/xCtb4oKh4UUlzscu8i+SjfKxre1Tshp1CNmukWkbzQAetj3JGDkJtCT58Dj7E/zUQEgh7Chrv4nGdnh3ZKiI82a3Om+9C0byrfdZLUJ/bRLg6YCfb6L5Xk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1653950519;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=ZeXQSjEyyrrxxE3o1HiaJLRHDYVkRyJ+opFzPaTQpPQ=;
	b=UKjEXab2BWtfCd5T1ZWusntTjiREg93Ijq7A+f3z/kCu2ZDIR+cBkJU5ZBgHIqGo
	I3BPo2d0DmK5VuzvFLbiW8zAJCWRwwQEBMtMnVhSRBqgcG20e8bMtI2VodaGmHljoFD
	zyMiY4ISuEcXvzr820YK/2vINxO0TNj7gHv5YW3s=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	scott.davis@starlab.io,
	christopher.clark@starlab.io,
	sstabellini@kernel.org
Subject: [RFC PATCH 0/4] Introducing a common representation of boot info
Date: Mon, 30 May 2022 22:41:22 -0400
Message-Id: <20220531024127.23669-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This series serves as a proposal to arrive at a common, cross-architecture way
for boot information to be represented during startup. This proposal is derived
from the structures devised to represent hyperlaunch boot information. The
hyperlaunch boot information structures themselves were based on the boot info
structures used by Arm and dom0less. A significant effort went into ensuring
the structures are able to support dom0less as well as hyperlaunch.

Arm and x86 both have arch specific information that must be represented. The
approach here sought to support this through arch structures while attempting
to maximize what was retained in the common structures. For this series, the
focus was on converting x86 over to the new boot info structures.

The motivation for this series is due to the fact that the multiboot v1
structures used by x86 are not sufficient for hyperlaunch. In the previously
submited hyperlaunch RFC, this was managed by wrapping the mb structures
inside⎄ the hyperlaunch structures. This at best was could be considered
crude, but really it was just a hack. One of the goals of hyperlaunch is to
unify as much as possible with dom0less to remove any unnecessary duplication.
Adopting a common representation for boot information will provide a solid
foundation for this unification. The added benefit is that in few places this
will enable an unnecessary arch specific version of logic, XSM for example
would be able to drop arch specific init functions.

This series being submitted as an RFC due to,  
* the number of design decisions being made within the series
* the limited testing able to be completed
* how extensive the changes will be for x86

NB: This series is built on top of the v2 patch series, "xsm: refactor and
optimize policy loading".


Daniel P. Smith (4):
  kconfig: allow configuration of maximum modules
  headers: introduce generalized boot info
  x86: adopt new boot info structures
  x86: refactor entrypoints to new boot info

 xen/arch/Kconfig                          |  12 ++
 xen/arch/arm/include/asm/setup.h          |   5 +-
 xen/arch/x86/boot/boot_info32.h           |  81 ++++++++
 xen/arch/x86/boot/defs.h                  |  17 +-
 xen/arch/x86/boot/reloc.c                 | 187 +++++++++++------
 xen/arch/x86/bzimage.c                    |  16 +-
 xen/arch/x86/cpu/microcode/core.c         | 134 ++++++++-----
 xen/arch/x86/dom0_build.c                 |  13 +-
 xen/arch/x86/efi/efi-boot.h               |  96 +++++----
 xen/arch/x86/guest/xen/pvh-boot.c         |  58 ++++--
 xen/arch/x86/hvm/dom0_build.c             |  42 ++--
 xen/arch/x86/include/asm/bootinfo.h       |  45 +++++
 xen/arch/x86/include/asm/bzimage.h        |   5 +-
 xen/arch/x86/include/asm/dom0_build.h     |  15 +-
 xen/arch/x86/include/asm/guest/pvh-boot.h |   6 +-
 xen/arch/x86/include/asm/setup.h          |  14 +-
 xen/arch/x86/pv/dom0_build.c              |  34 ++--
 xen/arch/x86/setup.c                      | 234 ++++++++++++----------
 xen/common/efi/boot.c                     |   4 +-
 xen/include/xen/bootinfo.h                | 101 ++++++++++
 xen/include/xsm/xsm.h                     |  26 ++-
 xen/xsm/xsm_core.c                        |  22 +-
 xen/xsm/xsm_policy.c                      |  44 ++--
 23 files changed, 804 insertions(+), 407 deletions(-)
 create mode 100644 xen/arch/x86/boot/boot_info32.h
 create mode 100644 xen/arch/x86/include/asm/bootinfo.h
 create mode 100644 xen/include/xen/bootinfo.h

-- 
2.20.1


