Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AC179313A
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 23:47:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595840.929476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qddt3-0005NC-HQ; Tue, 05 Sep 2023 21:47:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595840.929476; Tue, 05 Sep 2023 21:47:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qddt3-0005Kn-Ee; Tue, 05 Sep 2023 21:47:05 +0000
Received: by outflank-mailman (input) for mailman id 595840;
 Tue, 05 Sep 2023 21:47:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rZRj=EV=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qddt1-00055o-Vh
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 21:47:03 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be74d2e3-4c35-11ee-9b0d-b553b5be7939;
 Tue, 05 Sep 2023 23:47:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 21CA3828594E;
 Tue,  5 Sep 2023 16:47:00 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 44OJQRfMxJsK; Tue,  5 Sep 2023 16:46:59 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 0AE408285A0F;
 Tue,  5 Sep 2023 16:46:59 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id lWkGi50jjqcD; Tue,  5 Sep 2023 16:46:58 -0500 (CDT)
Received: from raptor-ewks-026.rptsys.com (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 6F2AA828594E;
 Tue,  5 Sep 2023 16:46:58 -0500 (CDT)
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
X-Inumbo-ID: be74d2e3-4c35-11ee-9b0d-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 0AE408285A0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1693950419; bh=VBTFxnUIx5sJRKdW6+PlziDn8S/ThoaIwZyWuny0Llw=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=eRcF/ZGWZB3eBtpgtWQ8ctbamafU2wqCSEAg2aHs35rc6Vce0Two3gzpuGEvUXDNW
	 apKOnmecN9euDYyg2HE2PFU2Q+7rwhWThP4jEn/FR5Ge4BMD1KKxKx0gwLnsyxOEcc
	 RRwOzTLKbiGlFr1Vhv7VFowm4Dyp7s14ThNS1w3Y=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/2] ppc: Drop support for QEMU pseries
Date: Tue,  5 Sep 2023 16:46:48 -0500
Message-Id: <cover.1693949731.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello all,

This small series drops support for the QEMU paravirtualized pseries
machine type in favor of the bare metal PowerNV platform.

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


