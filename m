Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 098F2D0E103
	for <lists+xen-devel@lfdr.de>; Sun, 11 Jan 2026 05:12:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1199666.1515883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vemo4-0004XH-Fj; Sun, 11 Jan 2026 04:12:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1199666.1515883; Sun, 11 Jan 2026 04:12:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vemo4-0004UK-9Y; Sun, 11 Jan 2026 04:12:00 +0000
Received: by outflank-mailman (input) for mailman id 1199666;
 Sun, 11 Jan 2026 04:11:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1vemo2-0004UC-Df
 for xen-devel@lists.xenproject.org; Sun, 11 Jan 2026 04:11:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vemo1-001xoa-0r;
 Sun, 11 Jan 2026 04:11:57 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vemo1-000Y5y-0s;
 Sun, 11 Jan 2026 04:11:57 +0000
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
	Subject:Cc:To:From; bh=e4pIYjP2h/50F/x23N8hbdKtxfDFcaZRQX30wz6A4ws=; b=m5uBMm
	yMR+7p4g9ED+Aw8vFaOpzuGgRf0cU3QWCwXXpBpqEwnwWq4yWGbvWb+/fbP84a/K5o5qiCBFt4/To
	fszZfFJa7WyKxRTfrDShTLReHaQ+swZSc3jACP3ZH4yKGorWsP7BHil1D32OLditMZRv0dX3Rsro6
	Cm4zV32NqKU=;
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
Subject: [PATCH v2 0/4] tools/tests: test harness fragment
Date: Sat, 10 Jan 2026 20:11:41 -0800
Message-ID: <20260111041145.553673-1-dmukhin@ford.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series introduces the use of a new common unit test fragment across
several existing unit tests.

Patch 1 contains assorted fixups for the domid Makefile.
Patch 2 adds a new fragment for auto-generating test harness dependencies.
Patch 3 switches the PDX unit test to the new common fragment.
Patch 4 switches the vPCI unit test to the new common fragment.

[1] Link to v1: https://lore.kernel.org/xen-devel/20251204123712.721443-1-dmukhin@ford.com/
[2] CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2256052244

Denis Mukhin (4):
  tests: fixup domid make fragment
  tests: introduce common fragment for unit tests
  tests: use unit test fragment in PDX test
  tests: use unit test fragment in vPCI test

 tools/tests/Rules.mk        | 94 +++++++++++++++++++++++++++++++++++++
 tools/tests/domid/Makefile  | 68 ++-------------------------
 tools/tests/pdx/.gitignore  |  2 +-
 tools/tests/pdx/Makefile    | 55 +++++-----------------
 tools/tests/pdx/harness.h   |  2 +-
 tools/tests/pdx/test-pdx.c  |  2 -
 tools/tests/vpci/.gitignore |  2 +
 tools/tests/vpci/Makefile   | 52 +++++++-------------
 tools/tests/vpci/emul.h     | 50 +++++++-------------
 tools/tests/vpci/main.c     |  2 -
 xen/common/pdx.c            |  3 +-
 xen/include/xen/irq.h       |  2 +
 xen/include/xen/list.h      |  2 +
 xen/include/xen/numa.h      |  2 +
 xen/include/xen/pci.h       |  2 +
 xen/include/xen/pfn.h       |  2 +
 xen/include/xen/spinlock.h  |  2 +
 xen/include/xen/types.h     |  4 ++
 18 files changed, 167 insertions(+), 181 deletions(-)
 create mode 100644 tools/tests/Rules.mk
 create mode 100644 tools/tests/vpci/.gitignore

-- 
2.52.0


