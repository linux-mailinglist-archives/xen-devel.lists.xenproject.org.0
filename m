Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 151315B0286
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 13:10:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401282.643115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVswV-0000QS-VI; Wed, 07 Sep 2022 11:10:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401282.643115; Wed, 07 Sep 2022 11:10:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVswV-0000Mo-QQ; Wed, 07 Sep 2022 11:10:03 +0000
Received: by outflank-mailman (input) for mailman id 401282;
 Wed, 07 Sep 2022 11:10:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a/dp=ZK=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oVswV-0007R7-0x
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 11:10:03 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 9dc9d397-2e9d-11ed-af93-0125da4c0113;
 Wed, 07 Sep 2022 13:10:01 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3A7C1042;
 Wed,  7 Sep 2022 04:10:06 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 353753F7B4;
 Wed,  7 Sep 2022 04:09:59 -0700 (PDT)
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
X-Inumbo-ID: 9dc9d397-2e9d-11ed-af93-0125da4c0113
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v4 0/2] xen/pci: implement is_memory_hole for ARM
Date: Wed,  7 Sep 2022 12:09:48 +0100
Message-Id: <cover.1662548825.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series is to implement something like is_memory_hole function for
ARM.

Rahul Singh (2):
  xen/arm: pci: modify pci_find_host_bridge_node argument to const pdev
  xen/pci: replace call to is_memory_hole to pci_check_bar

 xen/arch/arm/include/asm/pci.h     |  5 ++-
 xen/arch/arm/pci/pci-host-common.c | 53 ++++++++++++++++++++++++++++--
 xen/arch/x86/include/asm/pci.h     | 10 ++++++
 xen/drivers/passthrough/pci.c      |  8 ++---
 4 files changed, 69 insertions(+), 7 deletions(-)

-- 
2.25.1


