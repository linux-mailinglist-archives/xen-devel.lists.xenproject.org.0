Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8429A36C1D5
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 11:36:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118147.224122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbK8Q-0006js-Gi; Tue, 27 Apr 2021 09:36:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118147.224122; Tue, 27 Apr 2021 09:36:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbK8Q-0006jT-DP; Tue, 27 Apr 2021 09:36:02 +0000
Received: by outflank-mailman (input) for mailman id 118147;
 Tue, 27 Apr 2021 09:36:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3fO=JY=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lbK8O-0006jJ-FD
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 09:36:00 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 59114410-c351-4e18-bd09-fc0a53efbb0f;
 Tue, 27 Apr 2021 09:35:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F2AFD6E;
 Tue, 27 Apr 2021 02:35:57 -0700 (PDT)
Received: from e123311-lin.arm.com (unknown [10.57.27.22])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A0CD53F694;
 Tue, 27 Apr 2021 02:35:53 -0700 (PDT)
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
X-Inumbo-ID: 59114410-c351-4e18-bd09-fc0a53efbb0f
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	bertrand.marquis@arm.com
Subject: [PATCH v2 00/10] Get rid of READ/WRITE_SYSREG32
Date: Tue, 27 Apr 2021 11:35:36 +0200
Message-Id: <20210427093546.30703-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The purpose of this patch series is to remove usage of 32bit helper
macros READ/WRITE_SYSREG32 on arm64 as the idea of them is
not following the latest ARMv8 specification and mrs/msr instructions
are expecting 64bit values.
According to ARM DDI 0487G.a all the AArch64 system registers
are 64bit wide even though many of them have upper 32bit reserved.
This does not mean that in the newer versions of ARMv8 or in the next
architecture, some of the sysregs will get widen.
Also when dealing with system registers we should use register_t
type.

This patch series removes the use of READ/WRITE_SYSREG32
and replaces these calls with READ/WRITE_SYSREG. The change was
splited into several small patches to make the review proces easier.

This patch series focuses on removing READ/WRITE_SYSREG32.
The next thing to do is to also get rid of vreg_emulate_sysreg32
and other parts related to it like TVM_REG macro.
The final part will be to completely remove macros READ/WRITE_SYSREG32.

Michal Orzel (10):
  arm64/vfp: Get rid of READ/WRITE_SYSREG32
  arm/domain: Get rid of READ/WRITE_SYSREG32
  arm: Modify type of actlr to register_t
  arm/gic: Remove member hcr of structure gic_v3
  arm/gic: Get rid of READ/WRITE_SYSREG32
  arm/p2m: Get rid of READ/WRITE_SYSREG32
  arm/mm: Get rid of READ/WRITE_SYSREG32
  arm/page: Get rid of READ/WRITE_SYSREG32
  arm/time,vtimer: Get rid of READ/WRITE_SYSREG32
  arm64: Change type of hsr, cpsr, spsr_el1 to uint64_t

 xen/arch/arm/arm64/entry.S            |  4 +-
 xen/arch/arm/arm64/traps.c            |  2 +-
 xen/arch/arm/arm64/vfp.c              | 12 ++--
 xen/arch/arm/arm64/vsysreg.c          |  3 +-
 xen/arch/arm/domain.c                 | 22 +++---
 xen/arch/arm/gic-v3-lpi.c             |  2 +-
 xen/arch/arm/gic-v3.c                 | 98 ++++++++++++++-------------
 xen/arch/arm/mm.c                     |  2 +-
 xen/arch/arm/p2m.c                    |  8 +--
 xen/arch/arm/time.c                   | 28 ++++----
 xen/arch/arm/traps.c                  | 34 ++++++----
 xen/arch/arm/vcpreg.c                 | 13 ++--
 xen/arch/arm/vtimer.c                 | 10 +--
 xen/include/asm-arm/arm64/processor.h | 11 +--
 xen/include/asm-arm/arm64/vfp.h       |  6 +-
 xen/include/asm-arm/domain.h          |  6 +-
 xen/include/asm-arm/gic.h             |  6 +-
 xen/include/asm-arm/gic_v3_defs.h     |  2 +
 xen/include/asm-arm/hsr.h             | 14 +++-
 xen/include/asm-arm/page.h            |  4 +-
 xen/include/asm-arm/processor.h       |  9 ++-
 xen/include/public/arch-arm.h         |  4 +-
 xen/include/public/vm_event.h         |  4 ++
 23 files changed, 169 insertions(+), 135 deletions(-)

-- 
2.29.0


