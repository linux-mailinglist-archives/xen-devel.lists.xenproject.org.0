Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE653B165AA
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 19:41:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064315.1430002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhAnV-0006zx-Bs; Wed, 30 Jul 2025 17:41:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064315.1430002; Wed, 30 Jul 2025 17:41:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhAnV-0006wy-8E; Wed, 30 Jul 2025 17:41:01 +0000
Received: by outflank-mailman (input) for mailman id 1064315;
 Wed, 30 Jul 2025 17:40:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Z10=2L=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uhAnS-0006wr-Nm
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 17:40:59 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 570ba5d4-6d6c-11f0-b895-0df219b8e170;
 Wed, 30 Jul 2025 19:40:53 +0200 (CEST)
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
X-Inumbo-ID: 570ba5d4-6d6c-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=zjckxz4iybb4xcvf3zot7nep44.protonmail; t=1753897252; x=1754156452;
	bh=sY1HbGUaF5iHT9PbgCxYWoU1NtYORKH/HLHWz6mvNio=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=lp88X7LH9+sql4KbrJzo4Nin56kZWEraIR4EhxuoGMQi+l81DeTROSlFlzj4LD3BT
	 Fh7k/ijKzJDYD4hDYDaRFhCwyJAtUKxsZt1P8O0LQ4ML0nC1w5r848fiSLascm4Pq/
	 fvVEPwpvPQsUXuDa+eJe2KawKEvBzxqn7yqVyUrLKAErfzpP9Jov6pXYCjmkgRk1p2
	 rRrvxTmGK1RYCi6OsTsWDDdmetVnvB9ZtPVlVgr4XLfPza+a6OMCJYUuk/J97qhau9
	 QXQmkaYnhOXC7zXJdQh0BHjJK6rH5rqqZEvSdzE8CxetkWyBSQFn0lAwdJNhbC5tIo
	 sMgDvbmUa5fLA==
Date: Wed, 30 Jul 2025 17:40:47 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: alejandro.garciavallejo@amd.com, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v13 0/3] xen/domain: domain ID allocation
Message-ID: <20250730174042.1632011-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 896346fd403dd97abef596d9a52e2d99010fdea5
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Patch 1 introduces new domid_{alloc,free} calls.
Patch 2 introduces some basic testing for domain ID allocator.
Patch 3 adjusts create_dom0() messages (use %pd).

Link to v12: https://lore.kernel.org/xen-devel/20250730033414.1614441-1-dmu=
khin@ford.com/
Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/1=
957695581

Denis Mukhin (3):
  xen/domain: unify domain ID allocation
  tools/tests: introduce unit tests for domain ID allocator
  xen/domain: update create_dom0() messages

 tools/tests/Makefile                    |   2 +-
 tools/tests/domid/.gitignore            |   2 +
 tools/tests/domid/Makefile              |  48 +++++++++
 tools/tests/domid/include/xen/domain.h  | 126 ++++++++++++++++++++++++
 tools/tests/domid/test-domid.c          |  78 +++++++++++++++
 xen/arch/arm/domain_build.c             |  13 ++-
 xen/arch/x86/setup.c                    |  11 ++-
 xen/common/Makefile                     |   1 +
 xen/common/device-tree/dom0less-build.c |  15 +--
 xen/common/domain.c                     |   2 +
 xen/common/domctl.c                     |  42 +-------
 xen/common/domid.c                      |  94 ++++++++++++++++++
 xen/include/xen/domain.h                |   3 +
 13 files changed, 384 insertions(+), 53 deletions(-)
 create mode 100644 tools/tests/domid/.gitignore
 create mode 100644 tools/tests/domid/Makefile
 create mode 100644 tools/tests/domid/include/xen/domain.h
 create mode 100644 tools/tests/domid/test-domid.c
 create mode 100644 xen/common/domid.c

--=20
2.34.1



