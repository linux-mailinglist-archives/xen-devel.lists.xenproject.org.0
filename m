Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DCD76786E
	for <lists+xen-devel@lfdr.de>; Sat, 29 Jul 2023 00:22:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571599.895860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPVqM-0000K1-1D; Fri, 28 Jul 2023 22:21:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571599.895860; Fri, 28 Jul 2023 22:21:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPVqL-0000D2-Sd; Fri, 28 Jul 2023 22:21:53 +0000
Received: by outflank-mailman (input) for mailman id 571599;
 Fri, 28 Jul 2023 22:21:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/sdN=DO=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qPVqK-00009S-Q0
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 22:21:52 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24bb9dd8-2d95-11ee-8613-37d641c3527e;
 Sat, 29 Jul 2023 00:21:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id E62AC8285801;
 Fri, 28 Jul 2023 17:21:47 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 0TIUy0w6wXFa; Fri, 28 Jul 2023 17:21:47 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id CB73982857FC;
 Fri, 28 Jul 2023 17:21:46 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id DxTibyg5g8Zf; Fri, 28 Jul 2023 17:21:46 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 2EB1A82855B2;
 Fri, 28 Jul 2023 17:21:46 -0500 (CDT)
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
X-Inumbo-ID: 24bb9dd8-2d95-11ee-8613-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com CB73982857FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1690582906; bh=ITU52a7eCce67pnP3+1OZPWd+zxsKw/PGEUJYAvmX8U=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=XkDHHPQ+uEERQuUtmyhXgHCa2ifr0r3ARPU6B2dZ5eZDZrE9xC3kBsZkY6y90byoY
	 3hJfkjT4pk8w751U5j0rFYfrvxXDU/uYr4pdWHwvjgsXlIUB8R4AgNpMElXZ2qnwcL
	 iVBZWgE5KKsOj8wPabkmjQ5fUGNhKdppHg4q4+TY=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 0/3] xen/ppc: Add early Radix MMU support
Date: Fri, 28 Jul 2023 17:21:27 -0500
Message-Id: <cover.1690582001.git.sanastasio@raptorengineering.com>
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
 xen/arch/ppc/include/asm/bitops.h    |  11 ++
 xen/arch/ppc/include/asm/mm.h        |  19 ++
 xen/arch/ppc/include/asm/page-bits.h |   3 +-
 xen/arch/ppc/include/asm/page.h      | 178 ++++++++++++++++++
 xen/arch/ppc/include/asm/processor.h |  31 ++++
 xen/arch/ppc/include/asm/regs.h      | 138 ++++++++++++++
 xen/arch/ppc/include/asm/types.h     |   1 +
 xen/arch/ppc/mm-radix.c              | 268 +++++++++++++++++++++++++++
 xen/arch/ppc/opal.c                  |   2 +
 xen/arch/ppc/ppc64/head.S            |  42 +++++
 xen/arch/ppc/setup.c                 |   4 +
 xen/arch/ppc/tlb-radix.c             |  95 ++++++++++
 15 files changed, 794 insertions(+), 8 deletions(-)
 create mode 100644 xen/arch/ppc/include/asm/bitops.h
 create mode 100644 xen/arch/ppc/include/asm/mm.h
 create mode 100644 xen/arch/ppc/include/asm/page.h
 create mode 100644 xen/arch/ppc/include/asm/regs.h
 create mode 100644 xen/arch/ppc/mm-radix.c
 create mode 100644 xen/arch/ppc/tlb-radix.c

--
2.30.2


