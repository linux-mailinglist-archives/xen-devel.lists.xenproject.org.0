Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B40FC738C7F
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 19:00:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553033.863380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC1Bm-0006Ew-RL; Wed, 21 Jun 2023 17:00:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553033.863380; Wed, 21 Jun 2023 17:00:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC1Bm-00069B-O0; Wed, 21 Jun 2023 17:00:14 +0000
Received: by outflank-mailman (input) for mailman id 553033;
 Wed, 21 Jun 2023 17:00:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gfgj=CJ=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qC1Bl-0005SN-9B
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 17:00:13 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12dec698-1055-11ee-b236-6b7b168915f2;
 Wed, 21 Jun 2023 19:00:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 7948F8285BED
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jun 2023 12:00:06 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id FIBAAgVpyXdW; Wed, 21 Jun 2023 12:00:05 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id B299E8285AB9;
 Wed, 21 Jun 2023 12:00:05 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id aXwZYNeHKD_S; Wed, 21 Jun 2023 12:00:05 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 4906282856E5;
 Wed, 21 Jun 2023 12:00:05 -0500 (CDT)
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
X-Inumbo-ID: 12dec698-1055-11ee-b236-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com B299E8285AB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1687366805; bh=9NaRUF1KYWzHXz2PsOE4ZqCa2F66XQdJrbpTnZaFgXU=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=k28wqdeyhLlfFWBHUUbxL1Iv8x1zCMaXYgV+RPCsHD12JYEbkz1G0CI82Vs9R3gOI
	 FBCWEQcZFijfOVtqFVyhhDDKaHp3jlrIs5Lzrz2jiFLBYUfRQ09HZg5UcR/QvOOKjv
	 EfMRwbYhHVks8mmOqs+suOul/n75MgmY21UrT8D4=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 0/4] Early serial on Power
Date: Wed, 21 Jun 2023 11:59:49 -0500
Message-Id: <cover.1687366665.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello all,

This series adds support for early serial printing on Power, as well as
a simple CI smoke test modeled after the riscv one.

The third patch, which implements the serial console, also includes a
set of header additions required to get the build going when including
things like xen/lib.h. When applicable, headers from the old Xen 3.2.3
ppc tree were imported or otherwise empty stub headers were added to be
filled in later.

This will currently only run on QEMU pseries VMs, since the firmware
interface on bare metal differs significantly. Support for bare metal
will be added in a future series.

Thanks,
Shawn

Shawn Anastasio (4):
  automation: Add QEMU to bullseye-ppc64le
  automation: Fix KBUILD_DEFCONFIG for *ppc64le jobs
  xen/ppc: Implement early serial printk on pseries
  automation: Add smoke test for ppc64le

 .../build/debian/bullseye-ppc64le.dockerfile  |   2 +
 automation/gitlab-ci/build.yaml               |   8 +-
 automation/gitlab-ci/test.yaml                |  20 ++
 automation/scripts/qemu-smoke-ppc64le.sh      |  27 +++
 xen/arch/ppc/Kconfig.debug                    |   5 +
 xen/arch/ppc/Makefile                         |   3 +
 xen/arch/ppc/boot-of.c                        | 116 ++++++++++
 xen/arch/ppc/configs/ppc64_defconfig          |   1 +
 xen/arch/ppc/early_printk.c                   |  28 +++
 xen/arch/ppc/include/asm/boot.h               |  24 ++
 xen/arch/ppc/include/asm/bug.h                |   6 +
 xen/arch/ppc/include/asm/byteorder.h          |  37 +++
 xen/arch/ppc/include/asm/cache.h              |   6 +
 xen/arch/ppc/include/asm/early_printk.h       |  15 ++
 xen/arch/ppc/include/asm/msr.h                |  67 ++++++
 xen/arch/ppc/include/asm/processor.h          | 207 +++++++++++++++++
 xen/arch/ppc/include/asm/reg_defs.h           | 218 ++++++++++++++++++
 xen/arch/ppc/include/asm/string.h             |   6 +
 xen/arch/ppc/include/asm/types.h              |  35 +++
 xen/arch/ppc/ppc64/Makefile                   |   1 +
 xen/arch/ppc/ppc64/asm-offsets.c              |  55 +++++
 xen/arch/ppc/ppc64/head.S                     |  48 ++--
 xen/arch/ppc/ppc64/of-call.S                  |  85 +++++++
 xen/arch/ppc/setup.c                          |  31 +++
 24 files changed, 1025 insertions(+), 26 deletions(-)
 create mode 100755 automation/scripts/qemu-smoke-ppc64le.sh
 create mode 100644 xen/arch/ppc/boot-of.c
 create mode 100644 xen/arch/ppc/early_printk.c
 create mode 100644 xen/arch/ppc/include/asm/boot.h
 create mode 100644 xen/arch/ppc/include/asm/bug.h
 create mode 100644 xen/arch/ppc/include/asm/byteorder.h
 create mode 100644 xen/arch/ppc/include/asm/cache.h
 create mode 100644 xen/arch/ppc/include/asm/early_printk.h
 create mode 100644 xen/arch/ppc/include/asm/msr.h
 create mode 100644 xen/arch/ppc/include/asm/processor.h
 create mode 100644 xen/arch/ppc/include/asm/reg_defs.h
 create mode 100644 xen/arch/ppc/include/asm/string.h
 create mode 100644 xen/arch/ppc/include/asm/types.h
 create mode 100644 xen/arch/ppc/ppc64/of-call.S
 create mode 100644 xen/arch/ppc/setup.c

--
2.30.2


