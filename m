Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCCF8A2490
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 05:56:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704316.1100653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rv80o-0003lE-5D; Fri, 12 Apr 2024 03:55:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704316.1100653; Fri, 12 Apr 2024 03:55:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rv80o-0003eo-1M; Fri, 12 Apr 2024 03:55:38 +0000
Received: by outflank-mailman (input) for mailman id 704316;
 Fri, 12 Apr 2024 03:55:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvpr=LR=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rv80m-0003cM-OE
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 03:55:36 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83d91c66-f880-11ee-b908-491648fe20b8;
 Fri, 12 Apr 2024 05:55:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 465028287037;
 Thu, 11 Apr 2024 22:55:34 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id acAbXzFHak1Y; Thu, 11 Apr 2024 22:55:33 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 37097828560C;
 Thu, 11 Apr 2024 22:55:33 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ftt-qx8ZBt6e; Thu, 11 Apr 2024 22:55:32 -0500 (CDT)
Received: from raptor-ewks-026.2lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id C50C38285556;
 Thu, 11 Apr 2024 22:55:31 -0500 (CDT)
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
X-Inumbo-ID: 83d91c66-f880-11ee-b908-491648fe20b8
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 37097828560C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1712894133; bh=ItEC5+zSFFGxRZgwlxdClhk4sO0BTrEMd3F/MNQQ5NQ=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=AZgE4v3Zq23zsSOjnMEGCfuIO2w9qBN5PtrcVPTmdaEz+/SNJ+W41oZrUa/Rc04Au
	 af4iA4VJDCshI7XkpaoGTtYwLKyqxTHS5gqyprML7f37ya14KLD1NPEnURT0XUuq1e
	 pk+GSjY+XXY6RlyyTMEXVz4YppRNRtdlGvU3meJc=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v4 0/6] Early Boot Allocation on Power
Date: Thu, 11 Apr 2024 22:55:17 -0500
Message-Id: <cover.1712893887.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello all,

This series enables the Xen boot time allocator on Power by parsing
the available memory regions from the firmware-provided device tree.

Thanks,
Shawn

Shawn Anastasio (6):
  xen/ppc: Introduce stub asm/static-shmem.h
  xen/device-tree: Move Arm's setup.c bootinfo functions to common
  xen/common: Move Arm's bootfdt.c to common
  xen/ppc: Enable bootfdt and boot allocator
  xen/ppc: mm-radix: Replace debug printing code with printk
  xen/ppc: mm-radix: Allocate all paging structures at runtime

 MAINTAINERS                                   |   1 +
 xen/arch/arm/Makefile                         |   1 -
 xen/arch/arm/include/asm/setup.h              | 122 +----
 xen/arch/arm/setup.c                          | 419 ----------------
 xen/arch/ppc/include/asm/static-shmem.h       |  12 +
 xen/arch/ppc/mm-radix.c                       | 267 +++++------
 xen/arch/ppc/setup.c                          |  22 +-
 xen/common/Makefile                           |   1 +
 xen/common/device-tree/Makefile               |   2 +
 .../arm => common/device-tree}/bootfdt.c      |  22 +-
 xen/common/device-tree/bootinfo.c             | 446 ++++++++++++++++++
 xen/include/xen/bootfdt.h                     | 137 ++++++
 12 files changed, 759 insertions(+), 693 deletions(-)
 create mode 100644 xen/arch/ppc/include/asm/static-shmem.h
 create mode 100644 xen/common/device-tree/Makefile
 rename xen/{arch/arm => common/device-tree}/bootfdt.c (97%)
 create mode 100644 xen/common/device-tree/bootinfo.c
 create mode 100644 xen/include/xen/bootfdt.h

--
2.30.2


