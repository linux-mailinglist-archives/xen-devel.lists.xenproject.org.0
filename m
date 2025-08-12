Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 295E5B23BEA
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 00:31:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079223.1440201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulxW4-00042g-8t; Tue, 12 Aug 2025 22:30:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079223.1440201; Tue, 12 Aug 2025 22:30:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulxW4-00040O-5w; Tue, 12 Aug 2025 22:30:48 +0000
Received: by outflank-mailman (input) for mailman id 1079223;
 Tue, 12 Aug 2025 22:30:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Th/E=2Y=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ulxW1-00040E-MB
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 22:30:46 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9191939-77cb-11f0-b898-0df219b8e170;
 Wed, 13 Aug 2025 00:30:39 +0200 (CEST)
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
X-Inumbo-ID: f9191939-77cb-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=rdkogkimqfdone763z5pvxsccy.protonmail; t=1755037838; x=1755297038;
	bh=RnabvmzkVwpyZCsyR8+acQx7GW5NK7lhyIZSIv7OOZA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=UX5ol8ylFKa2JQHBlyDgCjqeHjlcLz47cvQ15O6FBX3z0yOpMjCx8qnZ0KPbmkwuE
	 rIpO6w45l/TDLT1Esyp+GuDc6LoER2/psZQgHoaV02D0UvAnHfxlTcy+q69sSBWLbF
	 VXXqswhgT/Ed/9QJCCecY6axyxGP4qYZ4sQY7H9b6Y1ntwxqWqRopLmMY7hUZB9+T3
	 z2W176t3sDg9g4iC0Sj+zMVU1qUzac4eyTJ5f2bfv9Wlt3veQ9HdbNmm9krFZv03AC
	 WTjyTjo7Kn+2VxxVsMiS9ErE2/+iRCQbUCT6GL7Nx0rw6xMBSUKCEBmTGI8ZZGWKln
	 ME65U82Dc9Pxw==
Date: Tue, 12 Aug 2025 22:30:32 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v16 0/4] xen/domain: domain ID allocation
Message-ID: <20250812223024.2364749-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 2ee4c6fe43d00d1f6651570f5c9895eb8ded4b63
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Patch 1 introduces new domid_{alloc,free} calls.
Patch 2 is a prep change for domain ID allocator test.
Patch 3 introduces some basic testing for domain ID allocator.
Patch 4 adjusts create_dom0() messages (use %pd).

Link to v15: https://lore.kernel.org/xen-devel/20250809170747.1836880-1-dmu=
khin@ford.com/
Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/1=
980989231

Denis Mukhin (4):
  xen/domain: unify domain ID allocation
  tools/include: move xc_bitops.h to xen-tools/bitops.h
  tools/tests: introduce unit tests for domain ID allocator
  xen/domain: update create_dom0() messages

 .../xen-tools/bitops.h}                       | 16 +++-
 tools/libs/ctrl/xc_misc.c                     | 13 +--
 tools/libs/guest/xg_dom_elfloader.c           |  3 +-
 tools/libs/guest/xg_dom_hvmloader.c           |  3 +-
 tools/libs/guest/xg_private.h                 |  2 +-
 tools/libs/guest/xg_sr_common.h               |  3 +-
 tools/tests/Makefile                          |  1 +
 tools/tests/domid/.gitignore                  |  3 +
 tools/tests/domid/Makefile                    | 84 ++++++++++++++++
 tools/tests/domid/harness.h                   | 54 +++++++++++
 tools/tests/domid/test-domid.c                | 93 ++++++++++++++++++
 xen/arch/arm/domain_build.c                   | 13 ++-
 xen/arch/x86/setup.c                          | 11 ++-
 xen/common/Makefile                           |  1 +
 xen/common/device-tree/dom0less-build.c       | 15 +--
 xen/common/domain.c                           |  2 +
 xen/common/domctl.c                           | 43 ++-------
 xen/common/domid.c                            | 95 +++++++++++++++++++
 xen/include/xen/domain.h                      |  3 +
 xen/lib/find-next-bit.c                       |  5 +
 20 files changed, 397 insertions(+), 66 deletions(-)
 rename tools/{libs/ctrl/xc_bitops.h =3D> include/xen-tools/bitops.h} (84%)
 create mode 100644 tools/tests/domid/.gitignore
 create mode 100644 tools/tests/domid/Makefile
 create mode 100644 tools/tests/domid/harness.h
 create mode 100644 tools/tests/domid/test-domid.c
 create mode 100644 xen/common/domid.c

--=20
2.34.1



