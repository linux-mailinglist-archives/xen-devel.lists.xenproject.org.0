Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B012A796DD0
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 02:02:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596921.931054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe2TD-0000qC-7i; Thu, 07 Sep 2023 00:02:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596921.931054; Thu, 07 Sep 2023 00:02:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe2TD-0000nj-4R; Thu, 07 Sep 2023 00:02:03 +0000
Received: by outflank-mailman (input) for mailman id 596921;
 Thu, 07 Sep 2023 00:02:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=myun=EX=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qe2TB-0000nY-HE
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 00:02:01 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3be75c9-4d11-11ee-8783-cb3800f73035;
 Thu, 07 Sep 2023 02:01:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 698B58285370;
 Wed,  6 Sep 2023 19:01:58 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id fkxK2pqL2K1V; Wed,  6 Sep 2023 19:01:57 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 1884F82854B3;
 Wed,  6 Sep 2023 19:01:57 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id EzxwkdqI2b7N; Wed,  6 Sep 2023 19:01:56 -0500 (CDT)
Received: from raptor-ewks-026.rptsys.com (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 8695C8285370;
 Wed,  6 Sep 2023 19:01:56 -0500 (CDT)
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
X-Inumbo-ID: c3be75c9-4d11-11ee-8783-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 1884F82854B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1694044917; bh=UnbMupveOP6kG7EVQIje5ftaCdc3hMXKtoOphoY0LfE=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=f0EmM/G+L/USnB7KWQDEFtibMxM6jzLXhs4vnGGJ4PzD2Re3cLApeRZ8GcmgcCzOf
	 9OnFoyp1lqUz5LP/5oCZ2/AtrrtVhDuMCJ3oJgLg8OPc+Vvk+2mhBs+hgzEL5WyzTy
	 K3Dq2NYPx3wn9rU1/5cScUNl2A2dmuRCBASWrgOc=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/2] ppc: Drop support for QEMU pseries
Date: Wed,  6 Sep 2023 19:01:44 -0500
Message-Id: <cover.1694044614.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello all,

This small series drops support for the QEMU paravirtualized pseries
machine type in favor of the bare metal PowerNV platform. pseries
support was broken by 74b725a64d80 ('xen/ppc: Implement initial Radix
MMU support'), and instead of maintaining separate code paths to retain
support for the platform, I think it makes the most sense to drop it
entirely.

pseries was originally targeted for initial bringup since it has
historically been much better supported by QEMU, but PowerNV support in
QEMU has recently developed to the point where this is no longer a
concern.  Since I can think of very little practical use for running Xen
under pseries, and supporting it requires non-trivial duplication of
effort, drop support for it entirely.

This also requires a change to the ppc64le CI dockerfile to build a
newer version of QEMU than is available in the bullseye repository.

Thanks,
Shawn

--
v2: Add Fixes: tag to patch 2, add references to broken state of pseries

Shawn Anastasio (2):
  automation: Switch ppc64le tests to PowerNV machine type
  xen/ppc: Drop support for pseries/OpenFirmware

 .../build/debian/bullseye-ppc64le.dockerfile  |  37 +++++-
 automation/gitlab-ci/test.yaml                |   2 +-
 xen/arch/ppc/Makefile                         |   1 -
 xen/arch/ppc/boot-of.c                        | 113 ------------------
 xen/arch/ppc/include/asm/boot.h               |  19 ---
 xen/arch/ppc/ppc64/Makefile                   |   1 -
 xen/arch/ppc/ppc64/of-call.S                  |  83 -------------
 xen/arch/ppc/setup.c                          |  11 +-
 8 files changed, 39 insertions(+), 228 deletions(-)
 delete mode 100644 xen/arch/ppc/boot-of.c
 delete mode 100644 xen/arch/ppc/ppc64/of-call.S

--
2.30.2


