Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4345087C50D
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 23:16:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693509.1081666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rktMt-0008JJ-34; Thu, 14 Mar 2024 22:16:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693509.1081666; Thu, 14 Mar 2024 22:16:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rktMs-0008Hg-Vy; Thu, 14 Mar 2024 22:16:06 +0000
Received: by outflank-mailman (input) for mailman id 693509;
 Thu, 14 Mar 2024 22:16:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y43E=KU=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rktMr-0008HV-3u
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 22:16:05 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6fc0704c-e250-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 23:16:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id E15F68286C24;
 Thu, 14 Mar 2024 17:15:58 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id ec4yAnXXj4Sk; Thu, 14 Mar 2024 17:15:58 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 02A278285446;
 Thu, 14 Mar 2024 17:15:57 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id TxU3LaOiDISN; Thu, 14 Mar 2024 17:15:57 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 479598284FCB;
 Thu, 14 Mar 2024 17:15:57 -0500 (CDT)
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
X-Inumbo-ID: 6fc0704c-e250-11ee-afdd-a90da7624cb6
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 02A278285446
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1710454558; bh=jBHUJFudAp3cUjQTNlDpg9GPx5Id51bFuggbdPz/eRA=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=YDIo8zc2hRQ/xrFqRS3dXWvO/o+Vo63zJNk4xpEoRrey0blLln10gObYnAExqxcTq
	 z3Ps39ffj0NqacW1K4yfYlE0rl4A9Vi5hzwZTMfJbTMvENZT1INZ73BpDHu2/c9kA7
	 j+afXAtyGvPKrdOdQBQ+DOQd+iIwECem1bTUg2x4=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v3 0/9] Early Boot Allocation on Power
Date: Thu, 14 Mar 2024 17:15:38 -0500
Message-Id: <cover.1710443965.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello all,

This series enables the Xen boot time allocator on Power by parsing
the available memory regions from the firmware-provided device tree.

Version 3 of the patch set greatly reduces the amount of code copied
from ARM, instead opting to move things into common code where possible.

Thanks,
Shawn

Shawn Anastasio (9):
  EFI: Introduce inline stub for efi_enabled on !X86 && !ARM
  xen/asm-generic: Introduce generic acpi.h
  xen/ppc: Introduce stub asm/static-shmem.h
  xen/ppc: Update setup.h with required definitions for bootfdt
  xen/device-tree: Move Arm's setup.c bootinfo functions to common
  xen/common: Move Arm's bootfdt.c to common
  xen/ppc: Enable bootfdt and boot allocator
  xen/ppc: mm-radix: Replace debug printing code with printk
  xen/ppc: mm-radix: Allocate all paging structures at runtime

 MAINTAINERS                                   |   2 +
 xen/arch/arm/Makefile                         |   1 -
 xen/arch/arm/setup.c                          | 419 ----------------
 xen/arch/ppc/include/asm/Makefile             |   1 +
 xen/arch/ppc/include/asm/setup.h              | 117 +++++
 xen/arch/ppc/include/asm/static-shmem.h       |  12 +
 xen/arch/ppc/mm-radix.c                       | 263 +++++-----
 xen/arch/ppc/setup.c                          |  21 +-
 xen/common/Makefile                           |   1 +
 xen/common/device-tree/Makefile               |   2 +
 .../arm => common/device-tree}/bootfdt.c      |  11 +-
 xen/common/device-tree/bootinfo.c             | 469 ++++++++++++++++++
 xen/include/asm-generic/acpi.h                |  20 +
 xen/include/xen/efi.h                         |   8 +
 14 files changed, 781 insertions(+), 566 deletions(-)
 create mode 100644 xen/arch/ppc/include/asm/static-shmem.h
 create mode 100644 xen/common/device-tree/Makefile
 rename xen/{arch/arm => common/device-tree}/bootfdt.c (97%)
 create mode 100644 xen/common/device-tree/bootinfo.c
 create mode 100644 xen/include/asm-generic/acpi.h

--
2.30.2


