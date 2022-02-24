Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D53904C20F4
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 02:31:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277852.474697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nN2xo-0005zM-VE; Thu, 24 Feb 2022 01:30:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277852.474697; Thu, 24 Feb 2022 01:30:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nN2xo-0005yL-OA; Thu, 24 Feb 2022 01:30:36 +0000
Received: by outflank-mailman (input) for mailman id 277852;
 Thu, 24 Feb 2022 01:30:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=85Ek=TH=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1nN2xm-0005xm-PN
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 01:30:34 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 5add9651-9511-11ec-8539-5f4723681683;
 Thu, 24 Feb 2022 02:30:32 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E279C1063;
 Wed, 23 Feb 2022 17:30:30 -0800 (PST)
Received: from entos-skylake.shanghai.arm.com (entos-skylake.shanghai.arm.com
 [10.169.212.207])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8671B3F5A1;
 Wed, 23 Feb 2022 17:30:28 -0800 (PST)
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
X-Inumbo-ID: 5add9651-9511-11ec-8539-5f4723681683
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org,
	sstabellini@kernel.org,
	julien@xen.org
Cc: Bertrand.Marquis@arm.com,
	wei.chen@arm.com,
	penny.zheng@arm.com,
	Henry.Wang@arm.com
Subject: [RFC PATCH 0/2] Introduce reserved Xenheap
Date: Thu, 24 Feb 2022 01:30:21 +0000
Message-Id: <20220224013023.50920-1-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.17.1

The reserved Xenheap, or statically configured Xenheap, refers to parts
of RAM reserved in the beginning for Xenheap. Like the static memory
allocation, such reserved Xenheap regions are reserved by configuration
in the device tree using physical address ranges.

This feature is useful to run Xen on Arm MPU systems, where only a
finite number of memory protection regions are available. The limited
number of protection regions places requirement on planning the use of
MPU protection regions and one or more MPU protection regions needs to
be reserved only for Xenheap.

Therefore, this patch series is sent as RFC for comments from the
community. The first patch introduces the reserved Xenheap and the
device tree processing code. The second patch adds the implementation of
the reserved Xenheap pages handling in boot and heap allocator on Arm64.

Henry Wang (2):
  docs, xen/arm: Introduce reserved Xenheap memory
  xen/arm: Handle reserved Xenheap pages in boot/heap allocator

 docs/misc/arm/device-tree/booting.txt | 43 ++++++++++++++++++++++
 xen/arch/arm/bootfdt.c                | 52 +++++++++++++++++++++------
 xen/arch/arm/include/asm/setup.h      |  3 ++
 xen/arch/arm/setup.c                  | 52 +++++++++++++++++++--------
 4 files changed, 125 insertions(+), 25 deletions(-)

-- 
2.17.1


