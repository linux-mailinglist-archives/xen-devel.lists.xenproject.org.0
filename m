Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 187A92C59EE
	for <lists+xen-devel@lfdr.de>; Thu, 26 Nov 2020 18:02:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38859.71591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiKfC-0004LA-3J; Thu, 26 Nov 2020 17:02:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38859.71591; Thu, 26 Nov 2020 17:02:34 +0000
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
	id 1kiKfB-0004Kl-Vv; Thu, 26 Nov 2020 17:02:33 +0000
Received: by outflank-mailman (input) for mailman id 38859;
 Thu, 26 Nov 2020 17:02:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C6x3=FA=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kiKf9-0004Kg-TM
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 17:02:31 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 98e166d4-ff61-475d-bf55-3d1799060e48;
 Thu, 26 Nov 2020 17:02:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDB1C31B;
 Thu, 26 Nov 2020 09:02:29 -0800 (PST)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown
 [10.58.246.76])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B6973F23F;
 Thu, 26 Nov 2020 09:02:28 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=C6x3=FA=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kiKf9-0004Kg-TM
	for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 17:02:31 +0000
X-Inumbo-ID: 98e166d4-ff61-475d-bf55-3d1799060e48
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 98e166d4-ff61-475d-bf55-3d1799060e48;
	Thu, 26 Nov 2020 17:02:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDB1C31B;
	Thu, 26 Nov 2020 09:02:29 -0800 (PST)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown [10.58.246.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B6973F23F;
	Thu, 26 Nov 2020 09:02:28 -0800 (PST)
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
Subject: [PATCH v2 0/8] xen/arm: Add support for SMMUv3 driver
Date: Thu, 26 Nov 2020 17:01:59 +0000
Message-Id: <cover.1606406359.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1

This patch series is v2 of the work to add support for the SMMUv3 driver.

Approach taken is to first merge the Linux copy of the SMMUv3 driver
(tag v5.9.8) and then modify the driver to build on XEN.

Linux SMMUv3 code implements the commands-queue insertion based on atomic
operations implemented in Linux. Atomic functions used by the commands-queue
insertion is not implemented in XEN therefore we decided to revert the code
that implemented the commands-queue insertion based on atomic operations.
Once the proper atomic operations will be available in XEN the driver can be
updated to include the patch.

Remove the support for MSI and PCI ATS functionality as there is no support
available in XEN on ARM to test the functionality.

As of now only Stage-2 translation support has been tested. Stage-1
translation support is removed. Once Stage-1 translation support is tested code
can be added.

Code specific to Linux is removed from the driver to avoid dead code.

Rahul Singh (8):
  xen/arm: Import the SMMUv3 driver from Linux
  xen/arm: revert atomic operation related command-queue insertion patch
  xen/arm: revert patch related to XArray
  xen/arm: Remove support for MSI on SMMUv3
  xen/arm: Remove support for PCI ATS on SMMUv3
  xen/arm: Remove support for Stage-1 translation on SMMUv3.
  xen/arm: Remove Linux specific code that is not usable in XEN
  xen/arm: Add support for SMMUv3 driver

 MAINTAINERS                           |    6 +
 SUPPORT.md                            |    1 +
 xen/drivers/passthrough/Kconfig       |   10 +
 xen/drivers/passthrough/arm/Makefile  |    1 +
 xen/drivers/passthrough/arm/smmu-v3.c | 2954 +++++++++++++++++++++++++
 5 files changed, 2972 insertions(+)
 create mode 100644 xen/drivers/passthrough/arm/smmu-v3.c

-- 
2.17.1


