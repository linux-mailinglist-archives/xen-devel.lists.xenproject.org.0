Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6577A59719A
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 16:46:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389009.625808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOKIi-0001pn-T3; Wed, 17 Aug 2022 14:45:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389009.625808; Wed, 17 Aug 2022 14:45:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOKIi-0001mn-PY; Wed, 17 Aug 2022 14:45:44 +0000
Received: by outflank-mailman (input) for mailman id 389009;
 Wed, 17 Aug 2022 14:45:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YZ6E=YV=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oOKIi-0001mh-7U
 for xen-devel@lists.xenproject.org; Wed, 17 Aug 2022 14:45:44 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 4477a5e7-1e3b-11ed-9250-1f966e50362f;
 Wed, 17 Aug 2022 16:45:42 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4AC76113E;
 Wed, 17 Aug 2022 07:45:42 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE89D3F70D;
 Wed, 17 Aug 2022 07:45:39 -0700 (PDT)
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
X-Inumbo-ID: 4477a5e7-1e3b-11ed-9250-1f966e50362f
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v2 0/2] xen/pci: implement is_memory_hole for ARM
Date: Wed, 17 Aug 2022 15:45:25 +0100
Message-Id: <cover.1660746990.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series is to implement something like is_memory_hole function for
ARM. 

Rahul Singh (2):
  xen/arm: pci: modify pci_find_host_bridge_node argument to const pdev
  xen/pci: replace call to is_memory_hole to pci_check_bar

 xen/arch/arm/include/asm/pci.h     |  5 ++-
 xen/arch/arm/pci/pci-host-common.c | 50 ++++++++++++++++++++++++++++--
 xen/arch/x86/include/asm/pci.h     | 10 ++++++
 xen/drivers/passthrough/pci.c      |  8 ++---
 4 files changed, 66 insertions(+), 7 deletions(-)

-- 
2.25.1


