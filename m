Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEB1814041
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 03:52:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654835.1022261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDyJg-0003MK-3d; Fri, 15 Dec 2023 02:52:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654835.1022261; Fri, 15 Dec 2023 02:52:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDyJf-0003Jp-Vq; Fri, 15 Dec 2023 02:52:43 +0000
Received: by outflank-mailman (input) for mailman id 654835;
 Fri, 15 Dec 2023 02:52:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=onWf=H2=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rDyJe-0002yh-Ri
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 02:52:42 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03c9522a-9af5-11ee-98ea-6d05b1d4d9a1;
 Fri, 15 Dec 2023 03:52:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 6C3DE8285AE9;
 Thu, 14 Dec 2023 20:52:41 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 4QWcbhvCeJov; Thu, 14 Dec 2023 20:52:40 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id BF0068285558;
 Thu, 14 Dec 2023 20:52:40 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 5aQeFJSzNbJ0; Thu, 14 Dec 2023 20:52:40 -0600 (CST)
Received: from raptor-ewks-026.2lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 57EF08285463;
 Thu, 14 Dec 2023 20:52:40 -0600 (CST)
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
X-Inumbo-ID: 03c9522a-9af5-11ee-98ea-6d05b1d4d9a1
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com BF0068285558
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1702608760; bh=aoCOeO7z9bNlnTw9oM+Zje9/i964p+H4GGuD02MWEqQ=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=ksPM5YUSgMXmAyEjD8ifbnkrzYLhdE/AuWsLNPHd66YMTxQ2NtbqGv0oFT50cjvKt
	 TuBvm7ylUlaBbJ9dwNjeB8LBswtaoGRrWgqSpAAkSiSkCbybK1Q9chdgkes98xhqRR
	 /vevvnJDsF/eLd54flSrOKyNA6zY1lz1NIJ+/+SQ=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v2 0/7] Early Boot Allocation on Power
Date: Thu, 14 Dec 2023 20:43:55 -0600
Message-Id: <cover.1702607884.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello all,

This series enables the Xen boot time allocator on Power by parsing
the available memory regions from the firmware-provided device tree.

As suggested during review of v1, this is now accomplished by moving
Arm's bootfdt.c into xen/common, along with a few modifications to
adapt it to Power -- namely to tolerate a device tree with no memory
reserve map entries and to tolerate an FDT that overlaps with the a
reserved memory region.

Additionally, the final patch of the series updates the radix mmu
code to use the newly-enabled boot allocator for the Partition and
Process tables, instead of statically allocating them like was
previously done. Among other things, switching to run-time allocation
allows us to allocate a full-sized Process Table instead of the
minimal one that was previously used to keep the Xen binary size small.

Thanks,
Shawn

Shawn Anastasio (7):
  xen/asm-generic: Introduce generic static-shmem.h
  xen/asm-generic: Introduce generic setup.h
  xen/common: Move Arm's bootfdt to common
  xen/device-tree: Fix bootfdt.c to tolerate 0 reserved regions
  xen/ppc: Enable bootfdt and boot allocator
  xen/ppc: mm-radix: Replace debug printing code with printk
  xen/ppc: mm-radix: Allocate Partition and Process Tables at runtime

 xen/arch/arm/Makefile                         |   1 -
 xen/arch/ppc/include/asm/Makefile             |   1 +
 xen/arch/ppc/include/asm/setup.h              | 117 +++++++
 xen/arch/ppc/mm-radix.c                       | 199 ++++++------
 xen/arch/ppc/setup.c                          | 289 +++++++++++++++++-
 xen/common/Makefile                           |   1 +
 xen/common/device-tree/Makefile               |   1 +
 .../arm => common/device-tree}/bootfdt.c      |  45 ++-
 xen/include/asm-generic/setup.h               | 148 +++++++++
 xen/include/asm-generic/static-shmem.h        |  12 +
 10 files changed, 698 insertions(+), 116 deletions(-)
 create mode 100644 xen/common/device-tree/Makefile
 rename xen/{arch/arm => common/device-tree}/bootfdt.c (93%)
 create mode 100644 xen/include/asm-generic/setup.h
 create mode 100644 xen/include/asm-generic/static-shmem.h

--
2.30.2


