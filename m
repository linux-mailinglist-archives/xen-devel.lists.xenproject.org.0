Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BBF797CEB
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 21:42:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597594.931824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeKsI-0000Z3-R2; Thu, 07 Sep 2023 19:41:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597594.931824; Thu, 07 Sep 2023 19:41:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeKsI-0000XM-NH; Thu, 07 Sep 2023 19:41:10 +0000
Received: by outflank-mailman (input) for mailman id 597594;
 Thu, 07 Sep 2023 19:41:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=myun=EX=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qeKsG-0000X5-S0
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 19:41:08 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79c49b3e-4db6-11ee-8783-cb3800f73035;
 Thu, 07 Sep 2023 21:41:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 22AE7828596F;
 Thu,  7 Sep 2023 14:41:01 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 9sDjNDv_ydZ6; Thu,  7 Sep 2023 14:40:59 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id A77A682857DA;
 Thu,  7 Sep 2023 14:40:59 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id vyvxV_GowML7; Thu,  7 Sep 2023 14:40:59 -0500 (CDT)
Received: from raptor-ewks-026.rptsys.com (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 2D6C0828574A;
 Thu,  7 Sep 2023 14:40:59 -0500 (CDT)
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
X-Inumbo-ID: 79c49b3e-4db6-11ee-8783-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com A77A682857DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1694115659; bh=1ljCQxuyGxzMiOsk2nIw7/n64VzZIvgNsPTsPQKMrOc=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=a4RFOg0HKTztE4uqyJvyMdis/ihbypa8Paw57HDBek//iGoWQCDcdFJbQstC0y2lz
	 exNN+6XlG/BMxqBZ3jGURlXs7K+q1t0sU/JWabPUeFU0aM/QH/9aji3i6M8T/zsZJQ
	 reIP1BcGAnlXdyOgLGvKMJN4ri7Bex+C+cMHAE1k=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 0/2] ppc: Drop support for QEMU pseries
Date: Thu,  7 Sep 2023 14:40:46 -0500
Message-Id: <cover.1694114837.git.sanastasio@raptorengineering.com>
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
v3: Build QEMU as test-artifact
v2: Add Fixes: tag to patch 2, add references to broken state of pseries

Shawn Anastasio (2):
  automation: Switch ppc64le tests to PowerNV machine type
  xen/ppc: Drop support for pseries/OpenFirmware

 .../build/debian/bullseye-ppc64le.dockerfile  |   5 +-
 automation/gitlab-ci/build.yaml               |  14 +++
 automation/gitlab-ci/test.yaml                |   5 +-
 automation/scripts/qemu-smoke-ppc64le.sh      |   3 +-
 .../qemu-system-ppc64/8.1.0-ppc64.dockerfile  |  37 ++++++
 xen/arch/ppc/Makefile                         |   1 -
 xen/arch/ppc/boot-of.c                        | 113 ------------------
 xen/arch/ppc/include/asm/boot.h               |  19 ---
 xen/arch/ppc/ppc64/Makefile                   |   1 -
 xen/arch/ppc/ppc64/of-call.S                  |  83 -------------
 xen/arch/ppc/setup.c                          |  11 +-
 11 files changed, 62 insertions(+), 230 deletions(-)
 create mode 100644 automation/tests-artifacts/qemu-system-ppc64/8.1.0-ppc64.dockerfile
 delete mode 100644 xen/arch/ppc/boot-of.c
 delete mode 100644 xen/arch/ppc/ppc64/of-call.S

--
2.30.2


