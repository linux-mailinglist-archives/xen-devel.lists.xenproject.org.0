Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B64D9AC7432
	for <lists+xen-devel@lfdr.de>; Thu, 29 May 2025 00:51:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999589.1380220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKPbk-0007Sp-8E; Wed, 28 May 2025 22:50:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999589.1380220; Wed, 28 May 2025 22:50:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKPbk-0007QB-5B; Wed, 28 May 2025 22:50:48 +0000
Received: by outflank-mailman (input) for mailman id 999589;
 Wed, 28 May 2025 22:50:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ql61=YM=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uKPbh-0007Q4-Uz
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 22:50:47 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fd31b43-3c16-11f0-a2fe-13f23c93f187;
 Thu, 29 May 2025 00:50:44 +0200 (CEST)
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
X-Inumbo-ID: 2fd31b43-3c16-11f0-a2fe-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=gozt5ty2srbr7iekbeybklhxbm.protonmail; t=1748472642; x=1748731842;
	bh=4xf+LmT6akS66VcEUq/njEr17pXZWyC9MUI/+pKOsyc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=Jp6+C5xbxbF3M7tuDsOIbpJTi5g2QgBJ5ajogEy2HCsayykROZZVpZ3NdpKCPBf2C
	 gNjkIaSUZ8g18aqUm8lli2GNa5XbIEdrjwV2rMh9ieM73VvXeeNn3gC+Pyv8phIKSo
	 qyuOIeujaGFTnewTiTEROHr8zZ4Cd/4FFTO+RrXOT9RIGmJH0CdGuamAdHcY3Cs7ad
	 ji4BAccPlOHAGXVD6uEY6GGtxuvAZeajrdKFf8dGKdvcPPGI6jT7KDMauykuf5liOp
	 cnCHTTL09eakicdsorBjvc2uEkwpnQLOyBuebMnOwH7rn/TE1xHEhFOn+x9aitmyX6
	 oNv+4OzF2Uyow==
Date: Wed, 28 May 2025 22:50:36 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, roger.pau@citrix.com, sstabellini@kernel.org, teddy.astie@vates.tech, dmukhin@ford.com
Subject: [PATCH v9 0/3] xen/domain: domain ID allocation
Message-ID: <20250528225030.2652166-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: f7bbdb93da407e5db9459fb89a33de37dce30cca
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The patch series adds new library calls for allocating domain IDs.

Patch 1 introduces new domid_{alloc,free} calls.
Patch 2 adjusts hardware domain ID treatment on Arm.
Patch 3 is an RFC: introduces new CONFIG_MAX_DOMID parameter to limit the
number of user domains during run-time.

Link to v8: https://lore.kernel.org/xen-devel/20250521000024.2944685-1-dmuk=
hin@ford.com/
Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/1=
841666928

Denis Mukhin (3):
  xen/domain: unify domain ID allocation
  xen/domain: adjust domain ID allocation for Arm
  xen/domain: introduce CONFIG_MAX_DOMID

 xen/arch/arm/domain_build.c             | 17 +++++--
 xen/arch/x86/cpu/mcheck/mce.c           |  2 +-
 xen/arch/x86/cpu/vpmu.c                 |  2 +-
 xen/arch/x86/setup.c                    | 11 +++--
 xen/common/Kconfig                      |  8 ++++
 xen/common/device-tree/dom0less-build.c | 17 ++++---
 xen/common/domain.c                     | 62 +++++++++++++++++++++++--
 xen/common/domctl.c                     | 42 ++---------------
 xen/common/sched/core.c                 |  4 +-
 xen/drivers/passthrough/vtd/iommu.c     |  2 +-
 xen/include/xen/domain.h                |  3 ++
 11 files changed, 107 insertions(+), 63 deletions(-)

--=20
2.34.1



