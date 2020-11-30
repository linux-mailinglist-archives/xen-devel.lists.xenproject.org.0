Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 610682C868C
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 15:22:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41171.74289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjk4A-0001xD-6U; Mon, 30 Nov 2020 14:22:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41171.74289; Mon, 30 Nov 2020 14:22:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjk4A-0001wo-3I; Mon, 30 Nov 2020 14:22:10 +0000
Received: by outflank-mailman (input) for mailman id 41171;
 Mon, 30 Nov 2020 14:22:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DnPL=FE=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kjk48-0001wj-Q4
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 14:22:08 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 256ef79b-e690-427e-bf35-c55739c15249;
 Mon, 30 Nov 2020 14:22:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D866D6E;
 Mon, 30 Nov 2020 06:22:07 -0800 (PST)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7AB7F3F71F;
 Mon, 30 Nov 2020 06:22:06 -0800 (PST)
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
X-Inumbo-ID: 256ef79b-e690-427e-bf35-c55739c15249
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 0/7] xen/arm: Emulate ID registers
Date: Mon, 30 Nov 2020 14:21:36 +0000
Message-Id: <cover.1606742184.git.bertrand.marquis@arm.com>
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

Bertrand Marquis (7):
  xen/arm: Add ID registers and complete cpufinfo
  xen/arm: Add arm64 ID registers definitions
  xen/arm: create a cpuinfo structure for guest
  xen/arm: Add handler for ID registers on arm64
  xen/arm: Add handler for cp15 ID registers
  xen/arm: Add CP10 exception support to handle VMFR
  xen/arm: Activate TID3 in HCR_EL2

 xen/arch/arm/arm64/vsysreg.c        | 49 +++++++++++++++++++
 xen/arch/arm/cpufeature.c           | 68 +++++++++++++++++++++++++++
 xen/arch/arm/traps.c                |  7 ++-
 xen/arch/arm/vcpreg.c               | 73 +++++++++++++++++++++++++++++
 xen/include/asm-arm/arm64/hsr.h     | 37 +++++++++++++++
 xen/include/asm-arm/arm64/sysregs.h | 25 ++++++++++
 xen/include/asm-arm/cpregs.h        | 11 +++++
 xen/include/asm-arm/cpufeature.h    | 65 +++++++++++++++++++++----
 xen/include/asm-arm/perfc_defn.h    |  1 +
 xen/include/asm-arm/traps.h         |  1 +
 10 files changed, 327 insertions(+), 10 deletions(-)

-- 
2.17.1


