Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 505F129728F
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 17:42:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11089.29380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVzCf-0001sm-KT; Fri, 23 Oct 2020 15:42:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11089.29380; Fri, 23 Oct 2020 15:42:05 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVzCf-0001sN-HG; Fri, 23 Oct 2020 15:42:05 +0000
Received: by outflank-mailman (input) for mailman id 11089;
 Fri, 23 Oct 2020 15:42:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nEE3=D6=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kVzCe-0001sI-6d
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 15:42:04 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b243efb0-0e17-4060-a9f9-46ebb4bb49bf;
 Fri, 23 Oct 2020 15:42:02 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kVzCb-0006pf-05; Fri, 23 Oct 2020 15:42:01 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kVzCa-0007wb-IC; Fri, 23 Oct 2020 15:42:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nEE3=D6=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kVzCe-0001sI-6d
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 15:42:04 +0000
X-Inumbo-ID: b243efb0-0e17-4060-a9f9-46ebb4bb49bf
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b243efb0-0e17-4060-a9f9-46ebb4bb49bf;
	Fri, 23 Oct 2020 15:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=rvzJmItCyl6RWcuoLLfHErwnWZgEzsudKHjxWh09svw=; b=1XAf5qSP6bnbMqCivCyd+AYGTh
	GvvS0Wjvasb6yfv6tjDfHrVtZ49ku67ATw1da+Er2CfAJENYGKD/3qD4jkocKs31IChBopLv8+Jh0
	OUezGqKtYRsQKm1QfrM3XCk+ouRarFUZeCZYhESBSZbc9DHISg6P3chmg7YzBAXKHkCQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kVzCb-0006pf-05; Fri, 23 Oct 2020 15:42:01 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=ufe34d9ed68d054.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kVzCa-0007wb-IC; Fri, 23 Oct 2020 15:42:00 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: alex.bennee@linaro.org,
	masami.hiramatsu@linaro.org,
	ehem+xen@m5p.com,
	bertrand.marquis@arm.com,
	andre.przywara@arm.com,
	Rahul.Singh@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 0/7] xen/arm: Unbreak ACPI
Date: Fri, 23 Oct 2020 16:41:49 +0100
Message-Id: <20201023154156.6593-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Hi all,

Xen on ARM has been broken for quite a while on ACPI systems. This
series aims to fix it.

This series also introduced support for ACPI 5.1. This allows Xen to
boot on QEMU.

I have only build tested the x86 side so far.

Cheers,

Julien Grall (7):
  xen/acpi: Rework acpi_os_map_memory() and acpi_os_unmap_memory()
  xen/arm: acpi: The fixmap area should always be cleared during
    failure/unmap
  xen/arm: Check if the platform is not using ACPI before initializing
    Dom0less
  xen/arm: Introduce fw_unreserved_regions() and use it
  xen/arm: acpi: add BAD_MADT_GICC_ENTRY() macro
  xen/arm: gic-v2: acpi: Use the correct length for the GICC structure
  xen/arm: acpi: Allow Xen to boot with ACPI 5.1

 xen/arch/arm/acpi/boot.c    |  6 +--
 xen/arch/arm/acpi/lib.c     | 79 ++++++++++++++++++++++++++++++-------
 xen/arch/arm/gic-v2.c       |  5 ++-
 xen/arch/arm/gic-v3.c       |  2 +-
 xen/arch/arm/kernel.c       |  2 +-
 xen/arch/arm/setup.c        | 25 +++++++++---
 xen/arch/x86/acpi/lib.c     | 18 +++++++++
 xen/drivers/acpi/osl.c      | 34 ++++++++--------
 xen/include/asm-arm/acpi.h  |  8 ++++
 xen/include/asm-arm/setup.h |  3 +-
 xen/include/xen/acpi.h      |  1 +
 11 files changed, 139 insertions(+), 44 deletions(-)

-- 
2.17.1


