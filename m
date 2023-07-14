Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DE1753A1E
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 13:49:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563582.880870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKHIz-0005Jf-4G; Fri, 14 Jul 2023 11:49:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563582.880870; Fri, 14 Jul 2023 11:49:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKHIz-0005H4-1U; Fri, 14 Jul 2023 11:49:49 +0000
Received: by outflank-mailman (input) for mailman id 563582;
 Fri, 14 Jul 2023 11:49:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z95V=DA=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qKHIx-0005Gy-0z
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 11:49:47 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8669acc6-223c-11ee-8611-37d641c3527e;
 Fri, 14 Jul 2023 13:49:44 +0200 (CEST)
Received: from nico.bugseng.com (unknown [37.163.94.163])
 by support.bugseng.com (Postfix) with ESMTPSA id 33D494EE0739;
 Fri, 14 Jul 2023 13:49:42 +0200 (CEST)
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
X-Inumbo-ID: 8669acc6-223c-11ee-8611-37d641c3527e
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 0/4] fix some issues related to MISRA C:2012 Rule 9.1
Date: Fri, 14 Jul 2023 13:49:17 +0200
Message-Id: <cover.1689329728.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series is aimed at discussing different categories of
patterns concerning local variables that are possibly not
initialized in all code paths, which results in hard-to-prove
correctness. The main categories are as follows:

1. Variables initialized by passing a pointer to them to a function.
   Many such functions are coupled with error handling which results
	 in the variable not being initialized.

2. Some variables are used in switch statements and the control flow
   ensures that all code paths do initialize them, but due to the
	 presence of goto statements, the flow is harder to follow.

I emphasize that, as far as I can tell, the code is already
compliant with the rule, but there is room for improvement, especially
on the side of allowing automatic checks to be more effective.

Nicola Vetrini (4):
  xen/arm: justify or initialize conditionally uninitialized variables
  xen/arm64: bitops: justify uninitialized variable inside a macro
  xen/arm: initialize conditionally uninitialized local variables
  xen/arm: initialize conditionally uninitialized local variables

 docs/misra/safe.json                        | 24 +++++++++++++++
 xen/arch/arm/arm64/lib/bitops.c             |  3 ++
 xen/arch/arm/arm64/lib/find_next_bit.c      |  1 +
 xen/arch/arm/bootfdt.c                      |  6 ++++
 xen/arch/arm/cpuerrata.c                    |  6 ++--
 xen/arch/arm/decode.c                       |  2 ++
 xen/arch/arm/dm.c                           |  2 +-
 xen/arch/arm/domain_build.c                 | 29 ++++++++++++++----
 xen/arch/arm/domctl.c                       |  8 ++---
 xen/arch/arm/efi/efi-boot.h                 |  6 ++--
 xen/arch/arm/gic-v3-its.c                   |  9 +++---
 xen/arch/arm/gic-v3-lpi.c                   | 17 ++++++-----
 xen/arch/arm/guest_walk.c                   | 12 ++++----
 xen/arch/arm/include/asm/guest_atomics.h    |  3 ++
 xen/arch/arm/include/asm/p2m.h              | 10 ++++---
 xen/arch/arm/mm.c                           |  1 +
 xen/arch/arm/p2m.c                          | 33 ++++++++++++---------
 xen/arch/arm/platforms/xilinx-zynqmp-eemi.c | 10 ++-----
 xen/arch/arm/psci.c                         | 10 +++----
 xen/drivers/char/pl011.c                    |  2 +-
 20 files changed, 129 insertions(+), 65 deletions(-)

--
2.34.1

