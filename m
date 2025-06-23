Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4BBAE4CD1
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 20:28:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022622.1398436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTltY-0006AR-QR; Mon, 23 Jun 2025 18:27:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022622.1398436; Mon, 23 Jun 2025 18:27:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTltY-000690-NY; Mon, 23 Jun 2025 18:27:52 +0000
Received: by outflank-mailman (input) for mailman id 1022622;
 Mon, 23 Jun 2025 18:27:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v3i4=ZG=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uTltW-00068u-JZ
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 18:27:51 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2c2bbdf-505f-11f0-a30f-13f23c93f187;
 Mon, 23 Jun 2025 20:27:47 +0200 (CEST)
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
X-Inumbo-ID: c2c2bbdf-505f-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1750703264; x=1750962464;
	bh=+EgYvJibe3fChy+oI7fx70GpQB08CAfQ06lu+ZUzrDU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=e/id+MeTsa32WsvE0VBVwnozDC9fwJIiWINhYSLBaf6nq3A3+mawoEQaacMge6Qbs
	 dtPBUfQjDCVT2vOJ8CNNu4EIInopco/cuVZs17S8G0Ht4ntCZ0xEXskJ8ew9uZkUhp
	 A2q0rUaqHzT5K84I7sT//R/d41dRilnAKzeQQ+uM2/xYUnnxsaKgiEzsqPtP6SwfmX
	 KaHg0G3WGF0bmsoZ8c+b/eFViqP30WAbiI+csD/bjMTJh30fDdgIljSg6qliYfXJRh
	 F12i+psSoteaM55ke35lpu6vCgO8+QPxRG2vKnaXr0pXwYs6wCT0VxY6zdIHd4CiGW
	 exV7gq1QGaSdA==
Date: Mon, 23 Jun 2025 18:27:35 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v10 0/3] xen/domain: domain ID allocation
Message-ID: <20250623182721.194238-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 4d95f183545ea17b86075e894038abb81b812375
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Patch 1 introduces new domid_{alloc,free} calls.
Patch 2 adjusts create_dom0() messages (use %pd).
Patch 3 replaces open-coded domain ID 0 with get_initial_domain_id() where
possible.

Link to v9: https://lore.kernel.org/all/20250528225030.2652166-2-dmukhin@fo=
rd.com/
Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/1=
883539583

Denis Mukhin (3):
  xen/domain: unify domain ID allocation
  xen/domain: update create_dom0() messages
  xen/domain: use get_initial_domain_id() instead of open-coded 0

 xen/arch/arm/domain_build.c             | 15 +++--
 xen/arch/x86/setup.c                    | 11 ++--
 xen/common/device-tree/dom0less-build.c | 17 +++---
 xen/common/domain.c                     | 79 ++++++++++++++++++++++++-
 xen/common/domctl.c                     | 42 ++-----------
 xen/include/xen/domain.h                |  3 +
 6 files changed, 110 insertions(+), 57 deletions(-)

--=20
2.34.1



