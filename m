Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE0E3735BD
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 09:43:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122819.231678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leCBm-00048E-74; Wed, 05 May 2021 07:43:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122819.231678; Wed, 05 May 2021 07:43:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leCBm-00044z-23; Wed, 05 May 2021 07:43:22 +0000
Received: by outflank-mailman (input) for mailman id 122819;
 Wed, 05 May 2021 07:43:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J0XF=KA=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1leCBj-00044r-QI
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 07:43:19 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id a3525501-7e8c-465c-8b62-8bd864c11538;
 Wed, 05 May 2021 07:43:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88181D6E;
 Wed,  5 May 2021 00:43:17 -0700 (PDT)
Received: from e123311-lin.arm.com (unknown [10.57.0.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 704903F718;
 Wed,  5 May 2021 00:43:14 -0700 (PDT)
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
X-Inumbo-ID: a3525501-7e8c-465c-8b62-8bd864c11538
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	bertrand.marquis@arm.com,
	wei.chen@arm.com
Subject: [PATCH v3 00/10] arm64: Get rid of READ/WRITE_SYSREG32
Date: Wed,  5 May 2021 09:42:58 +0200
Message-Id: <20210505074308.11016-1-michal.orzel@arm.com>
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
  xen/arm: Always access SCTLR_EL2 using READ/WRITE_SYSREG()
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
 xen/include/asm-arm/hsr.h             |  2 +-
 xen/include/asm-arm/page.h            |  4 +-
 xen/include/asm-arm/processor.h       |  5 +-
 xen/include/public/arch-arm.h         |  4 +-
 xen/include/public/domctl.h           |  2 +-
 xen/include/public/vm_event.h         |  3 +-
 24 files changed, 153 insertions(+), 136 deletions(-)

-- 
2.29.0


