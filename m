Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4522EABE85F
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 02:01:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991280.1375168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHWt1-0002Js-D6; Wed, 21 May 2025 00:00:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991280.1375168; Wed, 21 May 2025 00:00:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHWt1-0002Hy-AO; Wed, 21 May 2025 00:00:43 +0000
Received: by outflank-mailman (input) for mailman id 991280;
 Wed, 21 May 2025 00:00:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q6H9=YF=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uHWsy-0002HS-Ih
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 00:00:41 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0bccc88-35d6-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 02:00:38 +0200 (CEST)
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
X-Inumbo-ID: a0bccc88-35d6-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747785637; x=1748044837;
	bh=fP2rWwuRSfClj4KIh4h1Db7VpIHHhE4ET5iPu9j3HIc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=nRJAcp5WZQ2VsM6CWXNhCuurbogMOLBrB/SZaN9OxrypqjmSha9AKaMCptmg0mx3/
	 u/BOrvZ8bZDh59MIusWArcSO0nxx8FXPNObathN1PMwQ2CP5JwgR1YBopdzjkvR2d2
	 m2ZuyhfCsGClSFq+Dr38/hA4Z2I2UQmCCYpHtPdKPKdwgY0/K2bYHdSarq7fI/CPMb
	 8qRdiCxeXbJhXUTMOa7es5Qq+fuhlhm+byLML0q2uK2PEGJvoTSx0wHyQiFip9x5nB
	 hF1TZXRkjF0eJYC5RB1HozON5u4FPeedR+W6MHEbwcGr8ljtf9ubkuiWjqWueeQT+o
	 Yzr/mYBXnijjw==
Date: Wed, 21 May 2025 00:00:31 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, teddy.astie@vates.tech, dmukhin@ford.com
Subject: [PATCH v8 0/3] xen/domain: domain ID allocation
Message-ID: <20250521000024.2944685-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 7678a11abcf520c70427049dc4e1253516dd9069
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The patch series adds new library calls for allocating domain IDs.

Patch 1 introduces new domid_{alloc,free} calls.
Patch 2 adjusts hardware domain ID treatment on Arm.
Patch 3 is an RFC: introduces new CONFIG_MAX_DOMID parameter to limit the
number of user domains during run-time.

Link to v7: https://lore.kernel.org/xen-devel/20250519192306.1364471-1-dmuk=
hin@ford.com/=20
Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/1=
828093998=20

Denis Mukhin (3):
  xen/domain: unify domain ID allocation
  xen/domain: adjust domain ID allocation for Arm
  xen/domain: introduce CONFIG_MAX_DOMID

 xen/arch/arm/domain_build.c             | 17 +++++--
 xen/arch/arm/tee/ffa.c                  |  3 +-
 xen/arch/x86/cpu/mcheck/mce.c           |  2 +-
 xen/arch/x86/cpu/vpmu.c                 |  2 +-
 xen/arch/x86/setup.c                    | 11 +++--
 xen/common/Kconfig                      |  7 +++
 xen/common/device-tree/dom0less-build.c | 17 ++++---
 xen/common/domain.c                     | 62 +++++++++++++++++++++++--
 xen/common/domctl.c                     | 42 ++---------------
 xen/common/sched/core.c                 |  4 +-
 xen/drivers/passthrough/vtd/iommu.c     |  2 +-
 xen/include/public/domctl.h             |  2 +-
 xen/include/xen/domain.h                |  3 ++
 13 files changed, 108 insertions(+), 66 deletions(-)

--=20
2.34.1



