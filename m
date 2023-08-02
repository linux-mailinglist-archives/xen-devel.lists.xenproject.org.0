Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D0776C162
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 02:11:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574610.900042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQzSj-0003IW-39; Wed, 02 Aug 2023 00:11:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574610.900042; Wed, 02 Aug 2023 00:11:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQzSj-0003Fp-0S; Wed, 02 Aug 2023 00:11:37 +0000
Received: by outflank-mailman (input) for mailman id 574610;
 Wed, 02 Aug 2023 00:11:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SOIS=DT=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qQzSh-0003Fc-P6
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 00:11:35 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22f12058-30c9-11ee-b25c-6b7b168915f2;
 Wed, 02 Aug 2023 02:11:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 1A12A8285491;
 Tue,  1 Aug 2023 19:11:32 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id j4Lm-4MEYJ2j; Tue,  1 Aug 2023 19:11:31 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 124328285393;
 Tue,  1 Aug 2023 19:11:31 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id R0MSFixpmkbU; Tue,  1 Aug 2023 19:11:30 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 99D808284EB7;
 Tue,  1 Aug 2023 19:11:30 -0500 (CDT)
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
X-Inumbo-ID: 22f12058-30c9-11ee-b25c-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 124328285393
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1690935091; bh=dXQ4sbcV3/HyJrYh/QxCwscwRLOih6LVbq3xto6wpbE=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=vmbTdtja4J6tbwLZFKikWvUOS0itYocviw2IpKM2DcbLfd6JlcfMR+qwt3VFzHAVA
	 VwyjzsR9cD7gpJK39iy7UM9AHUoBpGJezvQPG92uvikMHdctPiliA6hLfvd3IcxhFS
	 68YeR0ATLs+jAMDExooa+DZoCSCzIZEpsNJliMog=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 0/4] xen/ppc: Add PowerNV bare metal support
Date: Tue,  1 Aug 2023 19:11:02 -0500
Message-Id: <cover.1690934409.git.sanastasio@raptorengineering.com>
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

This series is based on Jan's "common: move simple_strto{,u}l{,l}() to li=
b/"
https://lists.xenproject.org/archives/html/xen-devel/2023-08/msg00095.htm=
l

Thanks,
Shawn

--
Changed in v2:
  - Drop simple_strtoul patch, base on Jan's patch instead
  - Remove ALL_LIBS-y override
  - Clean up formatting of opal.c, opal-calls.S, asm-defns.h
  - Consistently use label in TOC address calculation in head.S

Shawn Anastasio (4):
  xen/ppc: Switch to medium PIC code model
  xen/ppc: Add OPAL API definition header file
  xen/ppc: Parse device tree for OPAL node on PowerNV
  xen/ppc: Implement early serial console on PowerNV

 xen/arch/ppc/Kconfig                 |    1 +
 xen/arch/ppc/Makefile                |    1 +
 xen/arch/ppc/arch.mk                 |    5 +-
 xen/arch/ppc/include/asm/asm-defns.h |   21 +
 xen/arch/ppc/include/asm/boot.h      |   16 +-
 xen/arch/ppc/include/asm/bug.h       |   18 +
 xen/arch/ppc/include/asm/cache.h     |    6 +
 xen/arch/ppc/include/asm/config.h    |    2 +-
 xen/arch/ppc/include/asm/opal-api.h  | 1190 ++++++++++++++++++++++++++
 xen/arch/ppc/include/asm/processor.h |   13 +-
 xen/arch/ppc/include/asm/string.h    |    6 +
 xen/arch/ppc/include/asm/system.h    |    6 +
 xen/arch/ppc/opal.c                  |   74 ++
 xen/arch/ppc/ppc64/Makefile          |    1 +
 xen/arch/ppc/ppc64/asm-offsets.c     |    4 +
 xen/arch/ppc/ppc64/head.S            |   12 +-
 xen/arch/ppc/ppc64/opal-calls.S      |   81 ++
 xen/arch/ppc/setup.c                 |    9 +-
 xen/arch/ppc/xen.lds.S               |   44 +-
 19 files changed, 1470 insertions(+), 40 deletions(-)
 create mode 100644 xen/arch/ppc/include/asm/bug.h
 create mode 100644 xen/arch/ppc/include/asm/cache.h
 create mode 100644 xen/arch/ppc/include/asm/opal-api.h
 create mode 100644 xen/arch/ppc/include/asm/string.h
 create mode 100644 xen/arch/ppc/include/asm/system.h
 create mode 100644 xen/arch/ppc/opal.c
 create mode 100644 xen/arch/ppc/ppc64/opal-calls.S

--
2.30.2


