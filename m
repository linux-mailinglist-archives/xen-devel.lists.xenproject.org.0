Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF6D7677C4
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 23:35:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571583.895794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPV7R-0000Bo-Lm; Fri, 28 Jul 2023 21:35:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571583.895794; Fri, 28 Jul 2023 21:35:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPV7R-0000Ah-Gv; Fri, 28 Jul 2023 21:35:29 +0000
Received: by outflank-mailman (input) for mailman id 571583;
 Fri, 28 Jul 2023 21:35:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/sdN=DO=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qPV7P-0000AP-La
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 21:35:27 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8ecc533-2d8e-11ee-b24e-6b7b168915f2;
 Fri, 28 Jul 2023 23:35:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 451578285A16;
 Fri, 28 Jul 2023 16:35:23 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 1IXn4TXR781m; Fri, 28 Jul 2023 16:35:22 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 4D00B8285971;
 Fri, 28 Jul 2023 16:35:22 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id gpVtHqu_UGrC; Fri, 28 Jul 2023 16:35:22 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 8D6DB82857ED;
 Fri, 28 Jul 2023 16:35:21 -0500 (CDT)
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
X-Inumbo-ID: a8ecc533-2d8e-11ee-b24e-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 4D00B8285971
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1690580122; bh=Hx8teiLermSp0bRLJTmHCMUqtTdFnE+mNXf9t8xuON0=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=jNkIxO0hCOdN7L7LNCWbIwT2YF/lzFC/VtC2UFQ3OOhjDp1aHKL0cK31mBXmt3qLJ
	 w0rIoUAzNPEvwXZqwQiAbXjRSJ3xPNd3HFRxvTRRdjDXT8RIfSj8raBbzUiCwKT1gt
	 lbSzM7ltKTJG9eUZv+inATbFI8kLLXFdBtxXQR+0=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 0/5] xen/ppc: Add PowerNV bare metal support
Date: Fri, 28 Jul 2023 16:35:05 -0500
Message-Id: <cover.1690579561.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello all,

This series adds support for booting and using the serial console on
bare metal PowerNV/OpenPOWER systems. Up until now, Xen could only be
booted on the QEMU pseries model, which was initially targetted for ease
of development, but which differs significantly from the bare metal
systems where this port is likely to be the most useful.

In addition to adding support for the PowerNV boot protocol and firmware
interface, changes required to get libfdt from xen/libfdt building are
included. This is required to obtain the firmware entrypoint address on
PowerNV.

Thanks,
Shawn

Shawn Anastasio (5):
  xen/lib: Move simple_strtoul from common/vsprintf.c to lib
  xen/ppc: Switch to medium PIC code model
  xen/ppc: Add OPAL API definition header file
  xen/ppc: Parse device tree for OPAL node on PowerNV
  xen/ppc: Implement early serial console on PowerNV

 xen/arch/ppc/Kconfig                 |    1 +
 xen/arch/ppc/Makefile                |    1 +
 xen/arch/ppc/arch.mk                 |    6 +-
 xen/arch/ppc/include/asm/asm-defns.h |   19 +
 xen/arch/ppc/include/asm/boot.h      |   16 +-
 xen/arch/ppc/include/asm/bug.h       |   18 +
 xen/arch/ppc/include/asm/cache.h     |    6 +
 xen/arch/ppc/include/asm/config.h    |    2 +-
 xen/arch/ppc/include/asm/opal-api.h  | 1190 ++++++++++++++++++++++++++
 xen/arch/ppc/include/asm/processor.h |   13 +-
 xen/arch/ppc/include/asm/string.h    |    6 +
 xen/arch/ppc/include/asm/system.h    |    6 +
 xen/arch/ppc/opal.c                  |   73 ++
 xen/arch/ppc/ppc64/Makefile          |    1 +
 xen/arch/ppc/ppc64/asm-offsets.c     |    4 +
 xen/arch/ppc/ppc64/head.S            |   13 +-
 xen/arch/ppc/ppc64/opal-calls.S      |   82 ++
 xen/arch/ppc/setup.c                 |    9 +-
 xen/arch/ppc/xen.lds.S               |   44 +-
 xen/common/vsprintf.c                |   37 -
 xen/lib/Makefile                     |    1 +
 xen/lib/simple_strtoul.c             |   40 +
 22 files changed, 1511 insertions(+), 77 deletions(-)
 create mode 100644 xen/arch/ppc/include/asm/bug.h
 create mode 100644 xen/arch/ppc/include/asm/cache.h
 create mode 100644 xen/arch/ppc/include/asm/opal-api.h
 create mode 100644 xen/arch/ppc/include/asm/string.h
 create mode 100644 xen/arch/ppc/include/asm/system.h
 create mode 100644 xen/arch/ppc/opal.c
 create mode 100644 xen/arch/ppc/ppc64/opal-calls.S
 create mode 100644 xen/lib/simple_strtoul.c

--
2.30.2


