Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C803C2DD44F
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 16:38:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55968.97641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpvMa-00037J-Hy; Thu, 17 Dec 2020 15:38:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55968.97641; Thu, 17 Dec 2020 15:38:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpvMa-00036u-E8; Thu, 17 Dec 2020 15:38:44 +0000
Received: by outflank-mailman (input) for mailman id 55968;
 Thu, 17 Dec 2020 15:38:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xKjN=FV=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kpvMZ-00036o-16
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 15:38:43 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id c6f92b50-9181-4828-8132-41458fb8ad54;
 Thu, 17 Dec 2020 15:38:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 109C130E;
 Thu, 17 Dec 2020 07:38:41 -0800 (PST)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CCB03F66B;
 Thu, 17 Dec 2020 07:38:40 -0800 (PST)
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
X-Inumbo-ID: c6f92b50-9181-4828-8132-41458fb8ad54
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 0/8] xen/arm: Emulate ID registers
Date: Thu, 17 Dec 2020 15:38:00 +0000
Message-Id: <cover.1608214355.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1

The goal of this serie is to emulate coprocessor ID registers so that
Xen only publish to guest features that are supported by Xen and can
actually be used by guests.
One practical example where this is required are SVE support which is
forbidden by Xen as it is not supported, but if Linux is compiled with
it, it will crash on boot. An other one is AMU which is also forbidden
by Xen but one Linux compiled with it would crash if the platform
supports it.

To be able to emulate the coprocessor registers defining what features
are supported by the hardware, the TID3 bit of HCR must be disabled and
Xen must emulated the values of those registers when an exception is
catched when a guest is accessing it.

This serie is first creating a guest cpuinfo structure which will
contain the values that we want to publish to the guests and then
provides the proper emulationg for those registers when Xen is getting
an exception due to an access to any of those registers.

This is a first simple implementation to solve the problem and the way
to define the values that we provide to guests and which features are
disabled will be in a future patchset enhance so that we could decide
per guest what can be used or not and depending on this deduce the bits
to activate in HCR and the values that we must publish on ID registers.

---
Changes in V2:
  Fix First patch to properly handle DFR1 register and increase dbg32
  size. Other patches have just been rebased.

Changes in V3:
  Add handling of reserved registers as RAZ
  Minor fixes described in each patch

Changes in V4:
  Add a patch to switch implementation to use READ_SYSREG instead of the
  32/64 bit version of it.
  Move cases for reserved register handling from macros to the code
  itself.
  Various typos fixes.

Bertrand Marquis (8):
  xen/arm: Use READ_SYSREG instead of 32/64 versions
  xen/arm: Add ID registers and complete cpuinfo
  xen/arm: Add arm64 ID registers definitions
  xen/arm: create a cpuinfo structure for guest
  xen/arm: Add handler for ID registers on arm64
  xen/arm: Add handler for cp15 ID registers
  xen/arm: Add CP10 exception support to handle MVFR
  xen/arm: Activate TID3 in HCR_EL2

 xen/arch/arm/arm64/vsysreg.c        |  82 ++++++++++++++++++++
 xen/arch/arm/cpufeature.c           | 113 ++++++++++++++++++++++------
 xen/arch/arm/traps.c                |   7 +-
 xen/arch/arm/vcpreg.c               | 102 +++++++++++++++++++++++++
 xen/include/asm-arm/arm64/hsr.h     |  37 +++++++++
 xen/include/asm-arm/arm64/sysregs.h |  28 +++++++
 xen/include/asm-arm/cpregs.h        |  15 ++++
 xen/include/asm-arm/cpufeature.h    |  58 +++++++++++---
 xen/include/asm-arm/perfc_defn.h    |   1 +
 xen/include/asm-arm/traps.h         |   1 +
 10 files changed, 409 insertions(+), 35 deletions(-)

-- 
2.17.1


