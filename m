Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C535B1E096
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 04:20:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073905.1436685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukCiG-0006eY-Bf; Fri, 08 Aug 2025 02:20:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073905.1436685; Fri, 08 Aug 2025 02:20:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukCiG-0006co-8n; Fri, 08 Aug 2025 02:20:08 +0000
Received: by outflank-mailman (input) for mailman id 1073905;
 Fri, 08 Aug 2025 02:20:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hyIc=2U=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ukCiE-0005lR-TJ
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 02:20:06 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d46bfd3-73fe-11f0-b898-0df219b8e170;
 Fri, 08 Aug 2025 04:19:57 +0200 (CEST)
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
X-Inumbo-ID: 2d46bfd3-73fe-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1754619595; x=1754878795;
	bh=stVa1HKaR9JbhqBTNg21Pcbp803WN5qumq0YW0VzvYU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=I2FQpbdXx/qfU387wVI+swtd8fLgTyWU3Z19sllblAS8IPNnaIZ7bNG10MLaOADUb
	 nNfma3DrF0xl/3rZ1on5ZfkRRQhj61wlfQAwlmMfghNBCqtXbMoHOn6aRfqOirt4mI
	 812c7q5e9mpWKcLyYTLoa2Ix3gEuRg5WlbK3YxfAzdqXUlnfbQ/XZPbKuU4l9b2/B8
	 xfTOs7dMRC8O+xHY9GO6fqQu00PTq0enMNmJbKrGBG/GazSHCHySl4yAyuZOMDq82v
	 qD4vIvI/TGfGnERZuymplO9w7mRe0LaWJtZv5hm56seGeRjacDbl78S3eW2QMBXy2S
	 bki9zVSTLq+oA==
Date: Fri, 08 Aug 2025 02:19:49 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v14 0/4] xen/domain: domain ID allocation
Message-ID: <20250808021938.669855-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 7ace57401cf8f129a6f603051e6379a07c53936e
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Patch 1 introduces new domid_{alloc,free} calls.
Patch 2 is a prep change for domain ID allocator test.
Patch 3 introduces some basic testing for domain ID allocator.
Patch 4 adjusts create_dom0() messages (use %pd).

Link to v13: https://lore.kernel.org/xen-devel/20250730174042.1632011-1-dmu=
khin@ford.com/
Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/1=
973569163

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
 tools/tests/Makefile                          |  2 +-
 tools/tests/domid/.gitignore                  |  2 +
 tools/tests/domid/Makefile                    | 56 +++++++++++
 tools/tests/domid/harness.h                   | 54 +++++++++++
 tools/tests/domid/include/xen/domain.h        |  1 +
 tools/tests/domid/test-domid.c                | 86 +++++++++++++++++
 xen/arch/arm/domain_build.c                   | 13 ++-
 xen/arch/x86/setup.c                          | 11 ++-
 xen/common/Makefile                           |  1 +
 xen/common/device-tree/dom0less-build.c       | 15 +--
 xen/common/domain.c                           |  2 +
 xen/common/domctl.c                           | 43 ++-------
 xen/common/domid.c                            | 95 +++++++++++++++++++
 xen/include/xen/domain.h                      |  3 +
 xen/lib/find-next-bit.c                       |  5 +
 21 files changed, 362 insertions(+), 67 deletions(-)
 rename tools/{libs/ctrl/xc_bitops.h =3D> include/xen-tools/bitops.h} (84%)
 create mode 100644 tools/tests/domid/.gitignore
 create mode 100644 tools/tests/domid/Makefile
 create mode 100644 tools/tests/domid/harness.h
 create mode 120000 tools/tests/domid/include/xen/domain.h
 create mode 100644 tools/tests/domid/test-domid.c
 create mode 100644 xen/common/domid.c

--=20
2.34.1



