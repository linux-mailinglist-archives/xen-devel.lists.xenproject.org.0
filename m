Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7B92EF424
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 15:47:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63508.112727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxt2Q-0006nm-If; Fri, 08 Jan 2021 14:46:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63508.112727; Fri, 08 Jan 2021 14:46:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxt2Q-0006nP-FS; Fri, 08 Jan 2021 14:46:50 +0000
Received: by outflank-mailman (input) for mailman id 63508;
 Fri, 08 Jan 2021 14:46:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h0bx=GL=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kxt2O-0006nK-Tb
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 14:46:48 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 6472a770-ee3f-4348-aa7c-f5021e0957d4;
 Fri, 08 Jan 2021 14:46:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6223ED1;
 Fri,  8 Jan 2021 06:46:46 -0800 (PST)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown
 [10.58.246.76])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 201573F70D;
 Fri,  8 Jan 2021 06:46:45 -0800 (PST)
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
X-Inumbo-ID: 6472a770-ee3f-4348-aa7c-f5021e0957d4
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
Subject: [PATCH v4 00/11] xen/arm: Add support for SMMUv3 driver
Date: Fri,  8 Jan 2021 14:46:20 +0000
Message-Id: <cover.1610115608.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series is V4 of the work to add support for the SMMUv3 driver.

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

Rahul Singh (11):
  xen/arm: smmuv3: Import the SMMUv3 driver from Linux
  xen/arm: Revert atomic operation related command-queue insertion patch
  xen/arm: smmuv3: Revert patch related to XArray
  xen/arm: smmuv3: Remove support for Stage-1 translation on SMMUv3.
  xen/arm: smmuv3: Remove Linux specific code that is not usable in XEN
  xen/device-tree: Add dt_property_match_string helper
  xen/arm: bitops: Implement a ffsll function
  xen/compiler: import 'fallthrough' keyword from linux
  xen/arm: smmuv3: Use fallthrough pseudo-keyword
  xen/arm: smmuv3: Replace linux functions with xen functions.
  xen/arm: smmuv3: Add support for SMMUv3 driver

 MAINTAINERS                           |    6 +
 SUPPORT.md                            |    1 +
 xen/common/device_tree.c              |   27 +
 xen/drivers/passthrough/Kconfig       |   11 +
 xen/drivers/passthrough/arm/Makefile  |    1 +
 xen/drivers/passthrough/arm/smmu-v3.c | 3362 +++++++++++++++++++++++++
 xen/include/asm-arm/bitops.h          |   12 +
 xen/include/xen/compiler.h            |   16 +
 xen/include/xen/device_tree.h         |   12 +
 9 files changed, 3448 insertions(+)
 create mode 100644 xen/drivers/passthrough/arm/smmu-v3.c

-- 
2.17.1


