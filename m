Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE44776C17
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 00:18:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581409.910104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTrVB-0006aT-Lu; Wed, 09 Aug 2023 22:18:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581409.910104; Wed, 09 Aug 2023 22:18:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTrVB-0006XT-Ih; Wed, 09 Aug 2023 22:18:01 +0000
Received: by outflank-mailman (input) for mailman id 581409;
 Wed, 09 Aug 2023 22:17:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FTx5=D2=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qTrV9-0006IW-Sc
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 22:17:59 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9717a99b-3702-11ee-8613-37d641c3527e;
 Thu, 10 Aug 2023 00:17:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 60DAE8285C0F;
 Wed,  9 Aug 2023 17:17:55 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 8dNL_78n-oFE; Wed,  9 Aug 2023 17:17:54 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 75BF78285659;
 Wed,  9 Aug 2023 17:17:54 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id JS67M3ijrk3y; Wed,  9 Aug 2023 17:17:54 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id E9A8582853C6;
 Wed,  9 Aug 2023 17:17:53 -0500 (CDT)
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
X-Inumbo-ID: 9717a99b-3702-11ee-8613-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 75BF78285659
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1691619474; bh=Sq0fNuH96kE7w+0/7R97Zwh45snqYHWhdAIxpNB8X5c=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=ZVh9e0csRkxA0PZxiBHRoHW0i5aKMIL1y+Z9XhPHvodbIdBhMz/94vmsbQ3BPSzHs
	 /s8XmouIpl+dDq/jBLrpytCjqlX07IAgZJTFK/ENZtEbc+9hbB2Buc+i64VewIK365
	 RxToglF14Vw2wpcURpmd0UDX9DT8C0qM7y7/xgYs=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v2 0/3] xen/ppc: Add early Radix MMU support
Date: Wed,  9 Aug 2023 17:17:40 -0500
Message-Id: <cover.1691617957.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello all,

This series adds support for bringing up the Radix MMU with basic
identity-mapped page tables.

In order to simplify the memory layout, the series changes XEN_VIRT
_START to 0xC000_0000_0000_0000, which has a couple of convenient
properties. When the MMU is off, the top 4 address bits are ignored by
the hardware, so this is equivalent to physical address 0.  When the MMU
is enabled, the top 4 address bits are used to select the memory
quadrant, and 0xC corresponds to quadrant 3 which is used for kernel
memory. Thus, by linking the kernel here and ensuring its physical load
address is 0x0, we are able to run at the correct address both before
and after the MMU is enabled.

Additionally, as the Radix MMU was only added in ISA 3.0 (POWER9), this
series also drops support for POWER8 for now, to avoid having a
non-working build configuration in-tree.

Thanks,
Shawn

Shawn Anastasio (3):
  xen/ppc: Bump minimum target ISA to 3.0 (POWER9)
  xen/ppc: Relocate kernel to physical address 0 on boot
  xen/ppc: Implement initial Radix MMU support

 xen/arch/ppc/Kconfig                 |   7 +-
 xen/arch/ppc/Makefile                |   2 +
 xen/arch/ppc/arch.mk                 |   1 -
 xen/arch/ppc/include/asm/bitops.h    |   9 +
 xen/arch/ppc/include/asm/config.h    |   2 +-
 xen/arch/ppc/include/asm/mm.h        |  18 ++
 xen/arch/ppc/include/asm/page-bits.h |   3 +-
 xen/arch/ppc/include/asm/page.h      | 178 ++++++++++++++++++
 xen/arch/ppc/include/asm/processor.h |  34 ++++
 xen/arch/ppc/include/asm/regs.h      | 138 ++++++++++++++
 xen/arch/ppc/include/asm/types.h     |   1 +
 xen/arch/ppc/mm-radix.c              | 268 +++++++++++++++++++++++++++
 xen/arch/ppc/ppc64/head.S            |  42 +++++
 xen/arch/ppc/setup.c                 |   3 +
 xen/arch/ppc/tlb-radix.c             |  96 ++++++++++
 15 files changed, 793 insertions(+), 9 deletions(-)
 create mode 100644 xen/arch/ppc/include/asm/bitops.h
 create mode 100644 xen/arch/ppc/include/asm/mm.h
 create mode 100644 xen/arch/ppc/include/asm/page.h
 create mode 100644 xen/arch/ppc/include/asm/regs.h
 create mode 100644 xen/arch/ppc/mm-radix.c
 create mode 100644 xen/arch/ppc/tlb-radix.c

--
2.30.2


