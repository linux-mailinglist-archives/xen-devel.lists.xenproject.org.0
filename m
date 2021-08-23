Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EC73F48B7
	for <lists+xen-devel@lfdr.de>; Mon, 23 Aug 2021 12:34:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170305.311080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI7G7-00031b-Uc; Mon, 23 Aug 2021 10:32:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170305.311080; Mon, 23 Aug 2021 10:32:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI7G7-0002zo-QG; Mon, 23 Aug 2021 10:32:51 +0000
Received: by outflank-mailman (input) for mailman id 170305;
 Mon, 23 Aug 2021 10:32:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xpK=NO=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1mI7G6-0002zi-13
 for xen-devel@lists.xenproject.org; Mon, 23 Aug 2021 10:32:50 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 509039d5-c927-4e22-9905-e12ae4af69ef;
 Mon, 23 Aug 2021 10:32:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1343612FC;
 Mon, 23 Aug 2021 03:32:48 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D10F73F66F;
 Mon, 23 Aug 2021 03:32:46 -0700 (PDT)
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
X-Inumbo-ID: 509039d5-c927-4e22-9905-e12ae4af69ef
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
Subject: [PATCH v2 0/7] xen/arm: Sanitize cpuinfo
Date: Mon, 23 Aug 2021 11:32:09 +0100
Message-Id: <cover.1629713932.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1

On arm architecture we might have heterogeneous platforms with different
types of cores. As a guest can potentialy run on any of those cores we
have to present them cpu features which are compatible with all cores
and discard the features which are only available on some cores.

As the features can be fairly complex, the way to deduce from 2
different features, what should be the acceptable minimal feature can be
complex (and sometime impossible).

To reduce the implementation effort in Xen, this serie is importing the
structures and filtering system used by Linux in order to build a
cpuinfo containing the best values compatible with all cores on the
platform.

The serie start by importing the necessary code and structure from Linux
and then use it to sanitize the boot cpuinfo.
It is also simplifying some Xen code which was doing the same in p2m
and allows to use heterogeneous platforms on arm64.

It is also adding DCZID and CTR registers in cpuinfo in order to check
for incoherent values between cores for those 2 registers. Xen is
tainted if different DCZID registers are found and CTR register is
sanitized when possible and in this case CTR register (and other
registers catched by HCR.TID2) is emulated.

With this serie, Xen was tested on a Juno board running on all 6 cores.

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
  xen/arm: Sanitize CTR_EL0 and emulate it if needed

 xen/arch/arm/arm64/Makefile            |   1 +
 xen/arch/arm/arm64/cpufeature.c        | 644 +++++++++++++++++++++++++
 xen/arch/arm/arm64/vsysreg.c           |  40 ++
 xen/arch/arm/cpufeature.c              |  12 +-
 xen/arch/arm/domain.c                  |   8 +
 xen/arch/arm/p2m.c                     |  30 +-
 xen/arch/arm/setup.c                   |  36 +-
 xen/arch/arm/smpboot.c                 |  11 +-
 xen/arch/arm/vcpreg.c                  |  45 ++
 xen/common/kernel.c                    |   6 +-
 xen/include/asm-arm/arm64/cpufeature.h | 104 ++++
 xen/include/asm-arm/arm64/hsr.h        |   6 +
 xen/include/asm-arm/arm64/sysregs.h    | 312 ++++++++++++
 xen/include/asm-arm/cpufeature.h       |  34 +-
 xen/include/asm-arm/processor.h        |  18 +-
 xen/include/xen/lib.h                  |   1 +
 16 files changed, 1254 insertions(+), 54 deletions(-)
 create mode 100644 xen/arch/arm/arm64/cpufeature.c
 create mode 100644 xen/include/asm-arm/arm64/cpufeature.h

-- 
2.17.1


