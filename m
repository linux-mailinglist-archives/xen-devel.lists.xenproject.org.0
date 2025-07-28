Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAB5B14208
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 20:35:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061851.1427441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugSgR-0001dy-CC; Mon, 28 Jul 2025 18:34:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061851.1427441; Mon, 28 Jul 2025 18:34:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugSgR-0001cV-9T; Mon, 28 Jul 2025 18:34:47 +0000
Received: by outflank-mailman (input) for mailman id 1061851;
 Mon, 28 Jul 2025 18:34:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BLX+=2J=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ugSgO-0001cP-Ph
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 18:34:45 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86bcfa7e-6be1-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 20:34:42 +0200 (CEST)
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
X-Inumbo-ID: 86bcfa7e-6be1-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1753727681; x=1753986881;
	bh=fxEaK78kM2ap/sfeoX1MChS7E6mOFm1lyuBYk57eOFg=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=f1Ke80JIHa4X67sNeXATfzVK+Szd0HP+04FQlpPPUTMgLVBthDq9eogQSZvgcqMMo
	 Pv1votLNyFugy7Bcka76sFpWIIbDauPtBUOHwYFol9Ho2IWds0l1CqCIknJb5g0tfZ
	 dO8LAxz1jOF2peCwE0bQzlYLjS2fiMU8YXGnyMYeq11xISKNHysbezImWfoZ8IVdBN
	 Sj7qDdpG+XP0p40CcnP2Jk6oQZ+FEcZ0UpBeQIBt6UfvXqCs37Kc56nMciI6KEGLyl
	 4MycFEK89+BwE4YpqgfcJeqnjMs6PAjajs0yPc3eibhN15uRJ6HCA+2mCX49Ut4Yka
	 7sDjZqvlWEDyg==
Date: Mon, 28 Jul 2025 18:34:34 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: alejandro.garciavallejo@amd.com, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v11 0/3] xen/domain: domain ID allocation
Message-ID: <20250728183427.1013975-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 6443e4ae39d7597d6bf3468895d9975857d52c6b
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Patch 1 introduces new domid_{alloc,free} calls.
Patch 2 introduces some basic testing for domain ID allocator.
Patch 3 adjusts create_dom0() messages (use %pd).

Link to v10: https://lore.kernel.org/xen-devel/20250623182721.194238-1-dmuk=
hin@ford.com/
Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/1=
953102433

Denis Mukhin (3):
  xen/domain: unify domain ID allocation
  tools/tests: introduce unit tests for domain ID allocator
  xen/domain: update create_dom0() messages

 tools/tests/Makefile                    |   2 +-
 tools/tests/domid/.gitignore            |   2 +
 tools/tests/domid/Makefile              |  69 +++++++++++++
 tools/tests/domid/include/xen/domain.h  | 124 ++++++++++++++++++++++++
 tools/tests/domid/test-domid.c          |  88 +++++++++++++++++
 xen/arch/arm/domain_build.c             |  15 ++-
 xen/arch/x86/setup.c                    |  11 ++-
 xen/common/Makefile                     |   1 +
 xen/common/device-tree/dom0less-build.c |  15 ++-
 xen/common/domain.c                     |   2 +
 xen/common/domctl.c                     |  42 +-------
 xen/common/domid.c                      |  93 ++++++++++++++++++
 xen/include/xen/domain.h                |   3 +
 13 files changed, 412 insertions(+), 55 deletions(-)
 create mode 100644 tools/tests/domid/.gitignore
 create mode 100644 tools/tests/domid/Makefile
 create mode 100644 tools/tests/domid/include/xen/domain.h
 create mode 100644 tools/tests/domid/test-domid.c
 create mode 100644 xen/common/domid.c

--=20
2.34.1



