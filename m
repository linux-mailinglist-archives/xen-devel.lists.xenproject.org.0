Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3EF2D62AE
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 17:58:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49554.87647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knPG4-0005ka-V1; Thu, 10 Dec 2020 16:57:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49554.87647; Thu, 10 Dec 2020 16:57:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knPG4-0005kB-RQ; Thu, 10 Dec 2020 16:57:36 +0000
Received: by outflank-mailman (input) for mailman id 49554;
 Thu, 10 Dec 2020 16:57:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BLK9=FO=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1knPG2-0005k6-FB
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 16:57:34 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 99e105ad-f3fa-46c1-9e26-d6f7d887b8f1;
 Thu, 10 Dec 2020 16:57:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9956930E;
 Thu, 10 Dec 2020 08:57:32 -0800 (PST)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown
 [10.58.246.76])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 14FBC3F66B;
 Thu, 10 Dec 2020 08:57:30 -0800 (PST)
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
X-Inumbo-ID: 99e105ad-f3fa-46c1-9e26-d6f7d887b8f1
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v3 0/8] xen/arm: Add support for SMMUv3 driver
Date: Thu, 10 Dec 2020 16:56:58 +0000
Message-Id: <cover.1607617848.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series is v3 of the work to add support for the SMMUv3 driver.

Approach taken is to first merge the Linux copy of the SMMUv3 driver
(tag v5.8.18) and then modify the driver to build on XEN.

MSI and PCI ATS functionality are not supported. Code is not tested and
compiled. Code is guarded by the flag CONFIG_PCI_ATS and CONFIG_MSI to compile
the driver.

Code specific to Linux is removed from the driver to avoid dead code.

Driver is currently supported as tech preview.

Following functionality should be supported before driver is out for tech
preview
1. Investigate the timing analysis of using spin lock in place of mutex when
   attaching a  device to SMMU.
2. Merged the latest Linux SMMUv3 driver code once atomic operation is
   available in XEN.
3. PCI ATS and MSI interrupts should be supported.
4. Investigate side-effect of using tasklet in place of threaded IRQ and fix
   if any.
5. fallthorugh keyword should be supported.
6. Implement the ffsll function in bitops.h file.

Rahul Singh (8):
  xen/arm: Import the SMMUv3 driver from Linux
  xen/arm: revert atomic operation related command-queue insertion patch
  xen/arm: revert patch related to XArray
  xen/arm: Remove support for Stage-1 translation on SMMUv3.
  xen/device-tree: Add dt_property_match_string helper
  xen/arm: Remove Linux specific code that is not usable in XEN
  xen/arm: Add support for SMMUv3 driver
  xen/arm: smmuv3: Remove linux compatibility functions.

 MAINTAINERS                           |    6 +
 SUPPORT.md                            |    1 +
 xen/common/device_tree.c              |   27 +
 xen/drivers/passthrough/Kconfig       |   11 +
 xen/drivers/passthrough/arm/Makefile  |    1 +
 xen/drivers/passthrough/arm/smmu-v3.c | 3316 +++++++++++++++++++++++++
 xen/include/xen/device_tree.h         |   12 +
 7 files changed, 3374 insertions(+)
 create mode 100644 xen/drivers/passthrough/arm/smmu-v3.c

-- 
2.17.1


