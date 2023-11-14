Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 424187EAC6E
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 10:04:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632218.986379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2pL8-0002pD-Dw; Tue, 14 Nov 2023 09:04:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632218.986379; Tue, 14 Nov 2023 09:04:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2pL8-0002mN-Ay; Tue, 14 Nov 2023 09:04:10 +0000
Received: by outflank-mailman (input) for mailman id 632218;
 Tue, 14 Nov 2023 09:04:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hHxF=G3=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1r2pL7-0002m9-0G
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 09:04:09 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id c3ff346d-82cc-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 10:04:07 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC46CC15;
 Tue, 14 Nov 2023 01:04:51 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EBB2A3F641;
 Tue, 14 Nov 2023 01:04:04 -0800 (PST)
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
X-Inumbo-ID: c3ff346d-82cc-11ee-98db-6d05b1d4d9a1
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 0/5] Fine granular configuration
Date: Tue, 14 Nov 2023 09:03:51 +0000
Message-Id: <20231114090356.875180-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This serie aims to add more modularity to some feature that can be excluded
without issues from the build.

The first patch is already reviewed.

v2 update: So I've tried to see how to put the dom0less code in the common code,
but the amount of modifications are not trivial, even putting only the common
part and protecting them with ARM, leaving the ARM specific stuff under arch/
like gic etc... will leave a status that is not very nice, so I've decided for
now to keep everything on the arm architecture so that who is going to work
on unifying the code in common can just take from there and do the proper
rework.

This serie is not targeting 4.18.

Luca Fancellu (5):
  arm/gicv2: make GICv2 driver and vGICv2 optional
  xen/arm: Add asm/domain.h include to kernel.h
  arm/dom0less: put dom0less feature code in a separate module
  xen/arm: Move static memory build code in separate modules
  arm/dom0less: introduce Kconfig for dom0less feature

 xen/arch/arm/Kconfig                      |   27 +
 xen/arch/arm/Makefile                     |    7 +-
 xen/arch/arm/bootfdt.c                    |  161 +-
 xen/arch/arm/dom0less-build.c             | 1018 ++++++
 xen/arch/arm/domain_build.c               | 3591 ++++++---------------
 xen/arch/arm/efi/efi-boot.h               |    4 +
 xen/arch/arm/gic-v3.c                     |    4 +
 xen/arch/arm/include/asm/dom0less-build.h |   30 +
 xen/arch/arm/include/asm/domain_build.h   |   36 +
 xen/arch/arm/include/asm/kernel.h         |    1 +
 xen/arch/arm/include/asm/setup.h          |    1 -
 xen/arch/arm/include/asm/static-memory.h  |   45 +
 xen/arch/arm/include/asm/static-shmem.h   |   66 +
 xen/arch/arm/setup.c                      |   58 +-
 xen/arch/arm/static-memory.c              |  287 ++
 xen/arch/arm/static-shmem.c               |  547 ++++
 xen/arch/arm/vgic.c                       |    2 +
 xen/arch/arm/vgic/Makefile                |    4 +-
 xen/common/Kconfig                        |    2 +-
 19 files changed, 3059 insertions(+), 2832 deletions(-)
 create mode 100644 xen/arch/arm/dom0less-build.c
 create mode 100644 xen/arch/arm/include/asm/dom0less-build.h
 create mode 100644 xen/arch/arm/include/asm/static-memory.h
 create mode 100644 xen/arch/arm/include/asm/static-shmem.h
 create mode 100644 xen/arch/arm/static-memory.c
 create mode 100644 xen/arch/arm/static-shmem.c


base-commit: fb41228ececea948c7953c8c16fe28fd65c6536b
-- 
2.34.1


