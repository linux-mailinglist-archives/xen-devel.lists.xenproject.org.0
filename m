Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C7360DECE
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 12:21:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430419.682091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ondWQ-0004f5-LQ; Wed, 26 Oct 2022 10:20:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430419.682091; Wed, 26 Oct 2022 10:20:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ondWQ-0004cH-Ic; Wed, 26 Oct 2022 10:20:30 +0000
Received: by outflank-mailman (input) for mailman id 430419;
 Wed, 26 Oct 2022 10:20:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JODj=23=citrix.com=prvs=291bfe38a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ondWO-0004c6-HY
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 10:20:28 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce5abfad-5517-11ed-91b5-6bf2151ebd3b;
 Wed, 26 Oct 2022 12:20:27 +0200 (CEST)
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
X-Inumbo-ID: ce5abfad-5517-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666779626;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=H1k/sRIkYmxFT9UeN76zAOprAdUFwq7qs6VwJ6rRnlc=;
  b=binRtpegyANyAXhWG2/JrqcM7SGjVUT6S0vSsAsY/9fTvrXFElHSWyMp
   5C05QCxaZWlD0FsLGARTiMPBM8Pg3IkNkwToRo1BOdBBUzLVocnStbuJi
   f+i+/0viOACfuBkUvwLGqZekJW7OsuSO6c/zG9F7qJ/F/M82pKxEsclwE
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 86061066
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:34wGr6IrxYsG23KCFE+RQZUlxSXFcZb7ZxGr2PjKsXjdYENSgTxVy
 WsWD2GCM/bYMTf9ed4naoizpB8Dv8DQxoNqHQtlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYz98B56r8ks15q2q4m1A5zTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05FY8J3cMuX0BCz
 v1bdhIBcBTfrO6YmJvuH4GAhux7RCXqFIYWu3UmxjDFF/c2B5vERs0m5/cBgm123JoXW6+DO
 YxJMlKDbzyZC/FLEn4RBIgzg6GDgX7nficDgFmUubA28y7YywkZPL3FYISNJIXSG5s9ckCwo
 FD5rnXpWxcgDPuh7Ge36CKBoNDRtHauMG4VPOLhraM76LGJ/UQtDxkRWUq+sOOOoEe0UNJCK
 GQZ4iMr66M18SSDTMT5XhC+iG6JuFgbQdU4O8037hucjJXd5QmxD3IBCDVGbbQOvsIsWSYj0
 FPPmtrzHCFuq5WcU3fb/bCRxRupIjQcJ2IGYS4CTCMG7sPlrYV1iQjAJv54HaWolNzpCBngz
 jbMqzIx750DgMhO26il8FTvhzO3uoOPXgMz/h/QXG+u8kV+foHNT5OswUjW67BHNonxZnurs
 WUAmsOexPsTFpzLnyuIKNjhB5nwuazDameFxwcyQd9xrFxB5kJPY6hS8RZbfRlIPv0FOmHLb
 FHX5Shdysd6aS7CgbBMX6q9DMEjzK7FHNvjV+zJYtcmXqWdZDNr7wk1OxfOgjmFfFwE1PhmZ
 MzFKZrE4WMyU/wP8dagewsKPVbHLAgazHibe530xg/PPVG2NC/MEudt3Ldjg4kEAEK4TOf9q
 Yg32yiikU83vAjCjs7/qNd7ELzyBSJnba0aUuQOHgJ5HiJoGXs6F9jayq47dopuksx9z7mWo
 C7nAB4BkQCn2BUrzDlmjVg6NtvSsWtX9ypnbUTAw370s5TcXWpfxPhGLMZmFVXW3Odi0eR1X
 5E4lzaoW5xypsD8021FN/HV9dU6HDzy3FLmAsZQSGVmF3KWb1eSoYGMk8qG3HRmMxdbQuNk+
 OTxi12GHMtrqsYLJJ++Vc9DBmiZ5RA18N+elWOSSjWPUC0AKLRXFhE=
IronPort-HdrOrdr: A9a23:Y/uJ/KFvER3E5H1OpLqE4seALOsnbusQ8zAXP0AYc3Nom6uj5q
 STdZUgpHrJYVkqOU3I9ersBEDiewK/yXcW2+ks1N6ZNWGM0ldARLsSircKqAePJ8SRzIJgPN
 9bAstDNOE=
X-IronPort-AV: E=Sophos;i="5.95,214,1661832000"; 
   d="scan'208";a="86061066"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Xen Security Team
	<security@xen.org>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Henry Wang <Henry.Wang@arm.com>,
	"Anthony PERARD" <anthony.perard@citrix.com>
Subject: [PATCH for-4.17 0/4] XSA-409 fixes
Date: Wed, 26 Oct 2022 11:20:14 +0100
Message-ID: <20221026102018.4144-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

For 4.17, and backport to all stable releases.

Patch 2 doesn't technically need backporting, but it's safe and I'm
dis-enclined to forgo testing in older releases.

Andrew Cooper (4):
  xen: Introduce non-broken hypercalls for the p2m pool size
  tools/tests: Unit test for p2m pool size
  xen/arm, libxl: Revert XEN_DOMCTL_shadow_op; use p2m mempool hypercalls
  xen/arm: Correct the p2m pool size calculations

 tools/include/xenctrl.h              |   3 +
 tools/libs/ctrl/xc_domain.c          |  29 ++++++
 tools/libs/light/libxl_arm.c         |  14 +--
 tools/libs/light/libxl_dom.c         |  19 ++++
 tools/libs/light/libxl_internal.h    |   3 +
 tools/libs/light/libxl_x86.c         |  15 +--
 tools/tests/Makefile                 |   1 +
 tools/tests/p2m-pool/.gitignore      |   1 +
 tools/tests/p2m-pool/Makefile        |  42 ++++++++
 tools/tests/p2m-pool/test-p2m-pool.c | 181 +++++++++++++++++++++++++++++++++++
 xen/arch/arm/domctl.c                |  53 ----------
 xen/arch/arm/include/asm/p2m.h       |   1 -
 xen/arch/arm/p2m.c                   |  31 ++++--
 xen/arch/x86/include/asm/hap.h       |   1 +
 xen/arch/x86/include/asm/shadow.h    |   4 +
 xen/arch/x86/mm/hap/hap.c            |  10 ++
 xen/arch/x86/mm/paging.c             |  39 ++++++++
 xen/arch/x86/mm/shadow/common.c      |  10 ++
 xen/common/domctl.c                  |  14 +++
 xen/include/public/domctl.h          |  26 ++++-
 xen/include/xen/domain.h             |   3 +
 21 files changed, 411 insertions(+), 89 deletions(-)
 create mode 100644 tools/tests/p2m-pool/.gitignore
 create mode 100644 tools/tests/p2m-pool/Makefile
 create mode 100644 tools/tests/p2m-pool/test-p2m-pool.c

-- 
2.11.0


