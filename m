Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD75B5B1BDC
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 13:49:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403216.645272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWG1z-0003AD-5d; Thu, 08 Sep 2022 11:49:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403216.645272; Thu, 08 Sep 2022 11:49:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWG1z-000379-2H; Thu, 08 Sep 2022 11:49:15 +0000
Received: by outflank-mailman (input) for mailman id 403216;
 Thu, 08 Sep 2022 11:49:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z23V=ZL=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oWG1x-000373-VY
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 11:49:13 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 419deead-2f6c-11ed-9760-273f2230c3a0;
 Thu, 08 Sep 2022 13:49:12 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A9DE14BF;
 Thu,  8 Sep 2022 04:49:18 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C0223F71A;
 Thu,  8 Sep 2022 04:49:10 -0700 (PDT)
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
X-Inumbo-ID: 419deead-2f6c-11ed-9760-273f2230c3a0
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
Subject: [PATCH v5 0/2] xen/pci: implement is_memory_hole for ARM
Date: Thu,  8 Sep 2022 12:49:00 +0100
Message-Id: <cover.1662637415.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series is to implement something like is_memory_hole function for
ARM.

Rahul Singh (2):
  xen/arm: pci: modify pci_find_host_bridge_node argument to const pdev
  xen/pci: replace call to is_memory_hole to pci_check_bar

 xen/arch/arm/include/asm/pci.h     |  5 ++-
 xen/arch/arm/pci/pci-host-common.c | 58 ++++++++++++++++++++++++++++--
 xen/arch/x86/include/asm/pci.h     | 10 ++++++
 xen/drivers/passthrough/pci.c      |  8 ++---
 4 files changed, 74 insertions(+), 7 deletions(-)

-- 
2.25.1


