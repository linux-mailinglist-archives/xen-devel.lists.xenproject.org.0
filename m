Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFBAB3C592
	for <lists+xen-devel@lfdr.de>; Sat, 30 Aug 2025 01:22:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1102356.1454976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us8Pb-0007fo-1s; Fri, 29 Aug 2025 23:21:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1102356.1454976; Fri, 29 Aug 2025 23:21:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us8Pa-0007dr-UQ; Fri, 29 Aug 2025 23:21:38 +0000
Received: by outflank-mailman (input) for mailman id 1102356;
 Fri, 29 Aug 2025 23:21:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1us8Pa-0007dk-13
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 23:21:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1us8PZ-00CpQI-09;
 Fri, 29 Aug 2025 23:21:37 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1us8PY-008Jl6-2z;
 Fri, 29 Aug 2025 23:21:37 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From; bh=oUP3Zh6WJF9wCJ4RzCCVZ7uhkFMNLrwIDIA+g8r9eAI=; b=ZH3d+h
	Xu1Fc1CQUoc+05yjnmYPZ6/A5rvTr3sHpLVw/rgF7zP+ebgYfRunjbxx6RMZl2Zm0SngdNqARMk6n
	xwiZv8JRIhvvm1XHtXI57WblPCZ4W2lAPvtg010DVllj4s0vB1aE7IVIcifPh6XG3btMMb/kra74R
	P9JX14RxV+Q=;
From: dmukhin@xen.org
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	dmukhin@ford.com
Subject: [PATCH v17 0/4] xen/domain: domain ID allocation
Date: Fri, 29 Aug 2025 16:21:28 -0700
Message-ID: <20250829232132.3460081-1-dmukhin@ford.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 1 introduces new domid_{alloc,free} calls.
Patch 2 is a prep change for domain ID allocator test.
Patch 3 introduces some basic testing for domain ID allocator.
Patch 4 adjusts create_dom0() messages (use %pd).

Link to v16: https://lore.kernel.org/xen-devel/20250812223024.2364749-1-dmukhin@ford.com/
Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2012378054

Denis Mukhin (4):
  xen/domain: unify domain ID allocation
  tools/include: move xc_bitops.h to xen-tools/bitops.h
  tools/tests: introduce unit tests for domain ID allocator
  xen/domain: update create_dom0() messages

 .../xen-tools/bitops.h}                       | 16 +++-
 tools/libs/ctrl/xc_misc.c                     | 13 +--
 tools/libs/guest/xg_dom_elfloader.c           |  1 -
 tools/libs/guest/xg_dom_hvmloader.c           |  1 -
 tools/libs/guest/xg_private.h                 |  2 +-
 tools/libs/guest/xg_sr_common.h               |  2 -
 tools/tests/Makefile                          |  1 +
 tools/tests/domid/.gitignore                  |  2 +
 tools/tests/domid/Makefile                    | 88 +++++++++++++++++
 tools/tests/domid/harness.h                   | 54 +++++++++++
 tools/tests/domid/test-domid.c                | 95 +++++++++++++++++++
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
 rename tools/{libs/ctrl/xc_bitops.h => include/xen-tools/bitops.h} (84%)
 create mode 100644 tools/tests/domid/.gitignore
 create mode 100644 tools/tests/domid/Makefile
 create mode 100644 tools/tests/domid/harness.h
 create mode 100644 tools/tests/domid/test-domid.c
 create mode 100644 xen/common/domid.c

-- 
2.51.0


