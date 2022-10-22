Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 501DC608DD3
	for <lists+xen-devel@lfdr.de>; Sat, 22 Oct 2022 17:04:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428298.678304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omG33-0005TP-Hs; Sat, 22 Oct 2022 15:04:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428298.678304; Sat, 22 Oct 2022 15:04:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omG33-0005Qe-Ez; Sat, 22 Oct 2022 15:04:29 +0000
Received: by outflank-mailman (input) for mailman id 428298;
 Sat, 22 Oct 2022 15:04:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1omG32-0005QY-DO
 for xen-devel@lists.xenproject.org; Sat, 22 Oct 2022 15:04:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omG32-0005EK-0T; Sat, 22 Oct 2022 15:04:28 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omG31-00023n-Kq; Sat, 22 Oct 2022 15:04:27 +0000
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
	Subject:Cc:To:From; bh=ii/EgQwOpf6vztGl40kGWEvUN8FQW87A5MXJcWq8PS8=; b=3m6HXS
	imK6E4zbxJHxRT1x8YlaJHMtXbr+IQ1PwAwMXyT4fATc3PiP3SoYxUbSl8W6ayKrQCaae0nTU7msZ
	JlZiN4ixuvV2arf4VYENP290xcIV8ntBxK/AgXpHpHvuui7LEN5TKp5TBuy6gFgRCdWjlP/nFmiti
	/nS/QOEmTaY=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: marco.solieri@minervasys.tech,
	lucmiccio@gmail.com,
	carlo.nonato@minervasys.tech,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC v2 00/12] xen/arm: Don't switch TTBR while the MMU is on
Date: Sat, 22 Oct 2022 16:04:10 +0100
Message-Id: <20221022150422.17707-1-julien@xen.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Hi all,

Currently, Xen on Arm will switch TTBR whilst the MMU is on. This is
similar to replacing existing mappings with new ones. So we need to
follow a break-before-make sequence.

When switching the TTBR, we need to temporary disable the MMU
before updating the TTBR. This means the page-tables must contain an
identity mapping.

The current memory layout is not very flexible and has an higher chance
to clash with the identity mapping.

On Arm64, we have plenty of unused virtual address space Therefore, we can
simply reshuffle the layout to leave the first part of the virtual
address space empty.

On Arm32, the virtual address space is already quite full. Even if we
find space, it would be necessary to have a dynamic layout. So a
different approach will be necessary. The chosen one is to have
a temporary mapping that will be used to jumped from the ID mapping
to the runtime mapping (or vice versa). The temporary mapping will
be overlapping with the domheap area as it should not be used when
switching on/off the MMU.

The Arm32 part is not yet addressed in this version. The series is
sent as an early RFC to gather some feedback on the approach.

After this series, most of Xen page-table code should be compliant
with the Arm Arm. The last two issues I am aware of are:
 - domheap: Mappings are replaced without using the Break-Before-Make
   approach.
 - The cache is not cleaned/invalidated when updating the page-tables
   with Data cache off (like during early boot).

The long term plan is to get rid of boot_* page tables and then
directly use the runtime pages. This means for coloring, we will
need to build the pages in the relocated Xen rather than the current
Xen.

For convience, I pushed a branch with everything applied:

https://xenbits.xen.org/git-http/people/julieng/xen-unstable.git
branch boot-pt-rework-v2

Cheers,

Julien Grall (12):
  xen/arm: Clean-up the memory layout
  xen/arm32: head: Jump to the runtime mapping in enable_mmu()
  xen/arm32: head: Introduce an helper to flush the TLBs
  xen/arm32: head: Remove restriction where to load Xen
  xen/arm32: head: Widen the use of the temporary mapping
  xen/arm: Enable use of dump_pt_walk() early during boot
  xen/arm64: Rework the memory layout
  xen/arm: mm: Allow xen_pt_update() to work with the current root table
  xen/arm: mm: Allow dump_hyp_walk() to work on the current root table
  xen/arm64: mm: Introduce helpers to prepare/enable/disable the
    identity mapping
  xen/arm64: mm: Rework switch_ttbr()
  xen/arm64: smpboot: Directly switch to the runtime page-tables

 xen/arch/arm/arm32/head.S           | 253 ++++++++++++++++++----------
 xen/arch/arm/arm32/smpboot.c        |   4 +
 xen/arch/arm/arm64/Makefile         |   1 +
 xen/arch/arm/arm64/head.S           |  86 +++++-----
 xen/arch/arm/arm64/mm.c             | 160 ++++++++++++++++++
 xen/arch/arm/arm64/smpboot.c        |  15 +-
 xen/arch/arm/domain_page.c          |   9 +
 xen/arch/arm/include/asm/arm32/mm.h |   4 +
 xen/arch/arm/include/asm/arm64/mm.h |  12 ++
 xen/arch/arm/include/asm/config.h   |  63 +++++--
 xen/arch/arm/include/asm/mm.h       |   2 +
 xen/arch/arm/include/asm/setup.h    |  11 ++
 xen/arch/arm/include/asm/smp.h      |   1 +
 xen/arch/arm/mm.c                   | 105 +++++++-----
 xen/arch/arm/smpboot.c              |   1 +
 15 files changed, 536 insertions(+), 191 deletions(-)
 create mode 100644 xen/arch/arm/arm64/mm.c

-- 
2.37.1


