Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F24A4006B
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2025 21:09:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894565.1303289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlZKI-0004H5-J1; Fri, 21 Feb 2025 20:08:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894565.1303289; Fri, 21 Feb 2025 20:08:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlZKI-0004Bh-F7; Fri, 21 Feb 2025 20:08:46 +0000
Received: by outflank-mailman (input) for mailman id 894565;
 Fri, 21 Feb 2025 20:08:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VJx0=VM=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1tlZKH-00049e-Mo
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2025 20:08:45 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5cc8037-f08f-11ef-9896-31a8f345e629;
 Fri, 21 Feb 2025 21:08:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id E820E82855D7;
 Fri, 21 Feb 2025 14:08:41 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 1ONZGDlhgQT7; Fri, 21 Feb 2025 14:08:41 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id C5F57828714E;
 Fri, 21 Feb 2025 14:08:40 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id dNuwaGmc_0BF; Fri, 21 Feb 2025 14:08:40 -0600 (CST)
Received: from raptor-ewks-026.2lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id A20FC82855D7;
 Fri, 21 Feb 2025 14:08:39 -0600 (CST)
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
X-Inumbo-ID: a5cc8037-f08f-11ef-9896-31a8f345e629
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com C5F57828714E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1740168520; bh=PxCrJRW8MAmjCj5R89ERq6ZevRwedPqGoJYiavMDYu4=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=qyF6ZwEhDqJgd2Vt6DHQKqTH2PV2xT/FR8JgdEhq8qXNIMhQvlUO+In6iLswkE/GD
	 OxOtMrIpTTDX7ADHD4EbBxM/htwZQfszOcorM/ZFknc8sec9+6yJqPn8572Z/tzlkl
	 nrmjK+IN+u7bpteVZFNfMH36abit18EYWZcPYq5k=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/2] Enable UBSAN on ppc
Date: Fri, 21 Feb 2025 14:08:35 -0600
Message-Id: <cover.1740168326.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Extend Andrew's UBSAN enablement work to ppc.

Andrew Cooper (1):
  PPC: Activate UBSAN in testing

Shawn Anastasio (1):
  xen/ppc: Fix opal.c's misaligned DT reads to avoid tripping UBSAN

 automation/gitlab-ci/build.yaml      |  3 +++
 xen/arch/ppc/Kconfig                 |  1 +
 xen/arch/ppc/include/asm/processor.h |  2 ++
 xen/arch/ppc/opal.c                  | 18 +++++++++++-------
 xen/arch/ppc/stubs.c                 |  2 +-
 5 files changed, 18 insertions(+), 8 deletions(-)

--
2.30.2


