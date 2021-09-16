Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 848E840D331
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 08:27:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188019.337066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQkqY-0002E3-Aj; Thu, 16 Sep 2021 06:26:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188019.337066; Thu, 16 Sep 2021 06:26:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQkqY-0002Bl-7Z; Thu, 16 Sep 2021 06:26:10 +0000
Received: by outflank-mailman (input) for mailman id 188019;
 Thu, 16 Sep 2021 06:26:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/8py=OG=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1mQkqW-0002Bf-7H
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 06:26:08 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id f99ac5ea-16b6-11ec-b5a6-12813bfff9fa;
 Thu, 16 Sep 2021 06:26:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C05831B;
 Wed, 15 Sep 2021 23:26:06 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 634CC3F59C;
 Wed, 15 Sep 2021 23:26:05 -0700 (PDT)
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
X-Inumbo-ID: f99ac5ea-16b6-11ec-b5a6-12813bfff9fa
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 0/7] xen/arm: Sanitize cpuinfo
Date: Thu, 16 Sep 2021 07:25:33 +0100
Message-Id: <cover.1631772970.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1

On arm architecture we might have heterogeneous platforms with different
types of cores. As a guest can potentialy run on any of those cores we
have to present them cpu features which are compatible with all cores
and discard the features which are only available on some cores.

As the features can be fairly complex, the way to deduce from 2
different features what should be the acceptable minimal feature can be
complex (and sometime impossible).

To reduce the implementation effort in Xen, this serie is importing the
structures and filtering system used by Linux in order to build a
cpuinfo containing the best values compatible with all cores on the
platform.

The serie start by importing the necessary code and structure from Linux
and then use it to sanitize the boot cpuinfo.
It is simplifying p2m code which was searching for the best support
value for PAR and VMID size.

On big.LITTLE platforms the current behaviour is kept and if hmp-unsafe
is provided in Xen command line then  Xen is using all cores. This serie
is tainting Xen with CPU_OUT_OF_SPEC when different MIDR are found.

It is also adding DCZID and CTR registers in cpuinfo in order to check
for incoherent values between cores for those 2 registers. Xen is
tainted if different DCZID registers are found and CTR register is
sanitized when possible. As CTR is not emulated, the sanitized value is
only available inside Xen.

Changes in v4:
- add and use arm64_ftr_set_value
- remove TID2 bit setting and CTR_EL0 emulation in case of different
  i-cache types. We now just sanitize ctr_el0 internally and taint Xen.
Changes in v3:
- restore hmp-unsafe need to use all core when different midr are found
- taint Xen if different MIDR are found
- sanitize system_cpuinfo only if core is not stopped by Xen on boot
Changes in v2:
- Sanitize DCZID register
- Sanitize CTR_EL0 and add emulation of registers catched by TID2
- rename cpu_boot_data to system_cpuinfo


Bertrand Marquis (7):
  xen/arm: Import ID registers definitions from Linux
  xen/arm: Import ID features sanitize from linux
  xen/arm: Rename cpu_boot_data to system_cpuinfo
  xen/arm: Sanitize cpuinfo ID registers fields
  xen/arm: Use sanitize values for p2m
  xen/arm: Taint Xen on incompatible DCZID values
  xen/arm: Sanitize CTR_EL0

 xen/arch/arm/arm64/Makefile            |   1 +
 xen/arch/arm/arm64/cpufeature.c        | 637 +++++++++++++++++++++++++
 xen/arch/arm/cpufeature.c              |  12 +-
 xen/arch/arm/p2m.c                     |  30 +-
 xen/arch/arm/setup.c                   |  36 +-
 xen/arch/arm/smpboot.c                 |  36 +-
 xen/common/kernel.c                    |   6 +-
 xen/include/asm-arm/arm64/cpufeature.h | 104 ++++
 xen/include/asm-arm/arm64/sysregs.h    | 312 ++++++++++++
 xen/include/asm-arm/cpufeature.h       |  32 +-
 xen/include/asm-arm/processor.h        |  18 +-
 xen/include/xen/lib.h                  |   1 +
 12 files changed, 1166 insertions(+), 59 deletions(-)
 create mode 100644 xen/arch/arm/arm64/cpufeature.c
 create mode 100644 xen/include/asm-arm/arm64/cpufeature.h

-- 
2.17.1


