Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB8A82F099
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 15:37:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667804.1039430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPkZ1-00079S-C6; Tue, 16 Jan 2024 14:37:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667804.1039430; Tue, 16 Jan 2024 14:37:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPkZ1-00077Q-9Q; Tue, 16 Jan 2024 14:37:15 +0000
Received: by outflank-mailman (input) for mailman id 667804;
 Tue, 16 Jan 2024 14:37:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rPkZ0-00077E-4T
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 14:37:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rPkYy-0002vs-R3; Tue, 16 Jan 2024 14:37:12 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rPkYy-0000Te-IK; Tue, 16 Jan 2024 14:37:12 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=XM9AeyIf1pR3Rc7j3BlY7vAmJKOyCMAvHz2S7LRU98E=; b=jTx5MT
	hVtIfH1ZJy5cQazBWW8tIsRJQg7CTTgH/zBr7CBZjrCDM3xGVu6a9QF5lDcoqYbY23J28wm4Nkuh8
	fuT0oFeHudRBNIFhqT4mkRj/Yp8HVtL72R3YyYSS1SOCLth38o5OqFuuPB802+aDJnfh5lBRDelfQ
	mNzOYqiN+sI=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: carlo.nonato@minervasys.tech,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 repost 0/4] xen/arm64: Rework the MMU-off code (idmap) so it is self-contained
Date: Tue, 16 Jan 2024 14:37:05 +0000
Message-Id: <20240116143709.86584-1-julien@xen.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Hi all,

Right now, the MMU-off code will access may access data that are either
in .rodata or .data. With the enablement of cache coloring, Xen may
not be physcally contiguous anymore when secondary CPUs are brought up.

There are multiple way to solve this problem. The first is to keep
a copy of Xen physically contiguous in memory. The downside is this
means we are using up to 8MB (maximum size of Xen) when only a few
KBs is necessary.

This series is reworking the logic so all the MMU-off code is now
self-contained for secondary boot CPUs on arm64.

On arm32, this is not yet possible because secondary CPUs needs to
rebuild boot page-tables.

Cheers,

Julien Grall (4):
  arm/mmu: Move init_ttbr to a new section .data.idmap
  arm/smpboot: Move smp_up_cpu to a new section .data.idmap
  xen/arm64: head: Use PRINT_ID() for secondary CPU MMU-off boot code
  [DO NOT COMMIT] xen/arm: Create a trampoline for secondary boot CPUs

 xen/arch/arm/arm64/head.S               | 14 +++----
 xen/arch/arm/arm64/mmu/head.S           |  2 +-
 xen/arch/arm/arm64/mmu/mm.c             |  7 ++++
 xen/arch/arm/include/asm/arm64/macros.h |  9 +++--
 xen/arch/arm/mmu/smpboot.c              | 36 +++++++++++++++---
 xen/arch/arm/psci.c                     |  5 ++-
 xen/arch/arm/smpboot.c                  | 49 ++++++++++++++++++++++---
 xen/arch/arm/xen.lds.S                  |  1 +
 8 files changed, 101 insertions(+), 22 deletions(-)

-- 
2.40.1


