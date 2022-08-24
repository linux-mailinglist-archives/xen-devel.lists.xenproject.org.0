Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C40E459F465
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 09:32:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392229.630438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQkri-0000Xt-2l; Wed, 24 Aug 2022 07:31:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392229.630438; Wed, 24 Aug 2022 07:31:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQkri-0000Uu-04; Wed, 24 Aug 2022 07:31:54 +0000
Received: by outflank-mailman (input) for mailman id 392229;
 Wed, 24 Aug 2022 07:31:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pSDv=Y4=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oQkrg-0000Uo-7e
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 07:31:52 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id d019c53c-237e-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 09:31:49 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0E8C1063;
 Wed, 24 Aug 2022 00:31:51 -0700 (PDT)
Received: from entos-skylake.shanghai.arm.com (entos-skylake.shanghai.arm.com
 [10.169.212.207])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 71A013F718;
 Wed, 24 Aug 2022 00:31:45 -0700 (PDT)
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
X-Inumbo-ID: d019c53c-237e-11ed-bd2e-47488cf2e6aa
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <Wei.Chen@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/2] Introduce reserved heap
Date: Wed, 24 Aug 2022 07:31:25 +0000
Message-Id: <20220824073127.16762-1-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.17.1

The reserved heap, or statically configured heap, refers to parts
of RAM reserved in the beginning for heap. Like the static memory
allocation, such reserved heap regions are reserved by configuration
in the device tree using physical address ranges.

This feature is useful to run Xen on Arm MPU systems, where only a
finite number of memory protection regions are available. The limited
number of protection regions places requirement on planning the use of
MPU protection regions and one or more MPU protection regions needs to
be reserved only for heap.

The first patch introduces the reserved heap and the device tree parsing
code. The second patch adds the implementation of the reserved heap
pages handling in boot and heap allocator for Arm.

Changes from RFC to v1:
- Rename the terminology to reserved heap.
- Rebase on top of latest `setup_mm()` changes.
- Added Arm32 logic in `setup_mm()`.

Henry Wang (2):
  docs, xen/arm: Introduce reserved heap memory
  xen/arm: Handle reserved heap pages in boot and heap allocator

 docs/misc/arm/device-tree/booting.txt | 46 ++++++++++++++++
 xen/arch/arm/bootfdt.c                | 51 +++++++++++++----
 xen/arch/arm/domain_build.c           |  5 +-
 xen/arch/arm/include/asm/setup.h      |  3 +
 xen/arch/arm/setup.c                  | 79 +++++++++++++++++++++------
 5 files changed, 156 insertions(+), 28 deletions(-)

-- 
2.17.1


