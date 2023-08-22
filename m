Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC59E784D26
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 01:04:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588743.920334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYaPx-00080n-VA; Tue, 22 Aug 2023 23:04:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588743.920334; Tue, 22 Aug 2023 23:04:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYaPx-0007z2-S6; Tue, 22 Aug 2023 23:04:09 +0000
Received: by outflank-mailman (input) for mailman id 588743;
 Tue, 22 Aug 2023 23:04:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SWhE=EH=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qYaPw-0007yq-Nt
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 23:04:08 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31c52ef4-4140-11ee-8782-cb3800f73035;
 Wed, 23 Aug 2023 01:04:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id D79748286A01;
 Tue, 22 Aug 2023 18:04:05 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id mVjyBCyAE0pm; Tue, 22 Aug 2023 18:04:04 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 9463A8285C17;
 Tue, 22 Aug 2023 18:04:04 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id yCEmo55SRW5F; Tue, 22 Aug 2023 18:04:04 -0500 (CDT)
Received: from raptor-ewks-026.rptsys.com (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 288F682857CB;
 Tue, 22 Aug 2023 18:04:04 -0500 (CDT)
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
X-Inumbo-ID: 31c52ef4-4140-11ee-8782-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 9463A8285C17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1692745444; bh=/WhqIJ65h0YcP24tL7yjcDeKZ00DQM1KFDHp8v7ihfc=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=NI2i0EEGZaApUiDaemPa0oLXq5CKG2HD1dJf1ZZZRq3SGmRPMg+k48roQWObjZmc1
	 bqDWjNO5OY+PivKeD92UIlrQC9AWdbm1ziydAOIow63KfWkzJHLexMvogm28g2MHcH
	 2lj9fc45JpNaKiwmWeTXSyG+jYhhfG5FsNTxp/Uk=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v4 0/3] xen/ppc: Add early Radix MMU support
Date: Tue, 22 Aug 2023 18:03:49 -0500
Message-Id: <cover.1692744718.git.sanastasio@raptorengineering.com>
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
 xen/arch/ppc/include/asm/page.h      | 180 ++++++++++++++++++
 xen/arch/ppc/include/asm/processor.h |  34 ++++
 xen/arch/ppc/include/asm/regs.h      | 124 +++++++++++++
 xen/arch/ppc/include/asm/types.h     |   1 +
 xen/arch/ppc/mm-radix.c              | 267 +++++++++++++++++++++++++++
 xen/arch/ppc/ppc64/head.S            |  42 +++++
 xen/arch/ppc/setup.c                 |   3 +
 xen/arch/ppc/tlb-radix.c             |  96 ++++++++++
 15 files changed, 780 insertions(+), 9 deletions(-)
 create mode 100644 xen/arch/ppc/include/asm/bitops.h
 create mode 100644 xen/arch/ppc/include/asm/mm.h
 create mode 100644 xen/arch/ppc/include/asm/page.h
 create mode 100644 xen/arch/ppc/include/asm/regs.h
 create mode 100644 xen/arch/ppc/mm-radix.c
 create mode 100644 xen/arch/ppc/tlb-radix.c

--
2.30.2


