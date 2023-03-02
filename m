Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 163C86A84BF
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 15:59:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504996.777493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXkOy-0000pb-C8; Thu, 02 Mar 2023 14:59:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504996.777493; Thu, 02 Mar 2023 14:59:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXkOy-0000nD-8R; Thu, 02 Mar 2023 14:59:24 +0000
Received: by outflank-mailman (input) for mailman id 504996;
 Thu, 02 Mar 2023 14:59:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pXkOw-0000n1-NF
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 14:59:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pXkOw-0003gU-EV; Thu, 02 Mar 2023 14:59:22 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pXkOw-0003fg-4o; Thu, 02 Mar 2023 14:59:22 +0000
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
	Subject:Cc:To:From; bh=Ou0y2DPaJpJuZcAxiK0GR7U1F/WjejWjy31ZHZ0yXYo=; b=swoMIv
	4J+Ynm+wqoNqElVyyNS115RlxTZuVXsC9PYcjum//XBhDFYO0ysYtNWNnq0OK3EufMtzSTDYxuB5g
	yvb6goRbOuFeVZhQ2igggONTrXhrNVJHUZbIKM1icMppeNByc+EIWucitAmY/J0QZpJSvqwP39Kw3
	zSh1fPs193c=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com,
	michal.orzel@amd.com,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v6 0/5] xen/arm: Don't switch TTBR while the MMU is on
Date: Thu,  2 Mar 2023 14:59:11 +0000
Message-Id: <20230302145916.44035-1-julien@xen.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Hi all,

Currently, Xen on Arm will switch TTBR whilst the MMU is on. This is
similar to replacing existing mappings with new ones. So we need to
follow a break-before-make sequence.

When switching the TTBR, we need to temporarily disable the MMU
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

The Arm32 part is not yet addressed and will be handled in a follow-up
series.

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
branch boot-pt-rework-v6

Cheers,

Julien Grall (5):
  xen/arm32: head: Widen the use of the temporary mapping
  xen/arm64: Rework the memory layout
  xen/arm64: mm: Introduce helpers to prepare/enable/disable the
    identity mapping
  xen/arm64: mm: Rework switch_ttbr()
  xen/arm64: smpboot: Directly switch to the runtime page-tables

 xen/arch/arm/arm32/head.S           |  86 +++------------
 xen/arch/arm/arm32/smpboot.c        |   4 +
 xen/arch/arm/arm64/Makefile         |   1 +
 xen/arch/arm/arm64/head.S           |  82 +++++++-------
 xen/arch/arm/arm64/mm.c             | 161 ++++++++++++++++++++++++++++
 xen/arch/arm/arm64/smpboot.c        |  15 ++-
 xen/arch/arm/include/asm/arm32/mm.h |   4 +
 xen/arch/arm/include/asm/arm64/mm.h |  13 +++
 xen/arch/arm/include/asm/config.h   |  34 ++++--
 xen/arch/arm/include/asm/mm.h       |   2 +
 xen/arch/arm/include/asm/setup.h    |  11 ++
 xen/arch/arm/include/asm/smp.h      |   1 +
 xen/arch/arm/mm.c                   |  19 ++--
 xen/arch/arm/smpboot.c              |   1 +
 14 files changed, 306 insertions(+), 128 deletions(-)
 create mode 100644 xen/arch/arm/arm64/mm.c

-- 
2.39.1


