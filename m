Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9791CB157D1
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 05:34:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063330.1429076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugxaK-0003FX-Bc; Wed, 30 Jul 2025 03:34:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063330.1429076; Wed, 30 Jul 2025 03:34:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugxaK-0003DT-8l; Wed, 30 Jul 2025 03:34:32 +0000
Received: by outflank-mailman (input) for mailman id 1063330;
 Wed, 30 Jul 2025 03:34:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Z10=2L=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ugxaH-0003DL-VY
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 03:34:31 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1849af7b-6cf6-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 05:34:27 +0200 (CEST)
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
X-Inumbo-ID: 1849af7b-6cf6-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=5gfsvai4snb2fbescqndov2534.protonmail; t=1753846465; x=1754105665;
	bh=Lv7b1/Zn8mZ2V0H80JpTT9i1JqRIfE5pyjTL8HBirVc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=juwUaS1eh02Yzb0LsqjZzgQed0LLq8CSO8vsFkLGusyA2q9UfZm0mzJbfzcMJSUGv
	 o8siPn74DCs3IIPFTZqzKP9i1PI9S4e6VK2FCYRjo5ymu7oYYhOQTcpri6EPw926TZ
	 kC/p51YNQ7C0cd7z16UjGEVmez4eKLEED9OLe6XHmgmqsjXBt89VCuPmjkwPrOX3mn
	 suKiJo3wWRJF5ZzrPsAOoLDWXgGMrScEYm9c4M8UJP0hxA3zwopmnFM8sE2r/hWivi
	 vDgVgs0MdPK9Hz6cL1go/vglH0GdBRtJBJIACu0/yqQWY9L1oNFhve16LTaNmzlhEe
	 7qZ7Fvj71V9Pg==
Date: Wed, 30 Jul 2025 03:34:22 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: alejandro.garciavallejo@amd.com, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v12 0/3] xen/domain: domain ID allocation
Message-ID: <20250730033414.1614441-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 3da0560835ad5b6b7123300311b3c78c22f49c81
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Patch 1 introduces new domid_{alloc,free} calls.
Patch 2 introduces some basic testing for domain ID allocator.
Patch 3 adjusts create_dom0() messages (use %pd).

Link to v11: https://lore.kernel.org/xen-devel/20250728183427.1013975-1-dmu=
khin@ford.com/
Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/1=
955867124

Denis Mukhin (3):
  xen/domain: unify domain ID allocation
  tools/tests: introduce unit tests for domain ID allocator
  xen/domain: update create_dom0() messages

 tools/tests/Makefile                    |   2 +-
 tools/tests/domid/.gitignore            |   2 +
 tools/tests/domid/Makefile              |  51 +++++++++
 tools/tests/domid/include/xen/domain.h  | 135 ++++++++++++++++++++++++
 tools/tests/domid/test-domid.c          |  78 ++++++++++++++
 xen/arch/arm/domain_build.c             |  13 ++-
 xen/arch/x86/setup.c                    |  11 +-
 xen/common/Makefile                     |   1 +
 xen/common/device-tree/dom0less-build.c |  15 +--
 xen/common/domain.c                     |   2 +
 xen/common/domctl.c                     |  42 +-------
 xen/common/domid.c                      |  94 +++++++++++++++++
 xen/include/xen/domain.h                |   3 +
 13 files changed, 396 insertions(+), 53 deletions(-)
 create mode 100644 tools/tests/domid/.gitignore
 create mode 100644 tools/tests/domid/Makefile
 create mode 100644 tools/tests/domid/include/xen/domain.h
 create mode 100644 tools/tests/domid/test-domid.c
 create mode 100644 xen/common/domid.c

--=20
2.34.1



