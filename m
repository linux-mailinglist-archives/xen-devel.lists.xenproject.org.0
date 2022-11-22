Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BAE634004
	for <lists+xen-devel@lfdr.de>; Tue, 22 Nov 2022 16:21:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447226.703232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxV5D-0000ps-8r; Tue, 22 Nov 2022 15:21:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447226.703232; Tue, 22 Nov 2022 15:21:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxV5D-0000nh-2I; Tue, 22 Nov 2022 15:21:11 +0000
Received: by outflank-mailman (input) for mailman id 447226;
 Tue, 22 Nov 2022 15:21:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ahN6=3W=citrix.com=prvs=318e6c854=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oxV5B-0000Pt-Hf
 for xen-devel@lists.xenproject.org; Tue, 22 Nov 2022 15:21:09 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47d3b866-6a79-11ed-8fd2-01056ac49cbb;
 Tue, 22 Nov 2022 16:21:06 +0100 (CET)
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
X-Inumbo-ID: 47d3b866-6a79-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669130466;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GE40QxnlDv68PxpIrB7fasnDGtdgXK+24c1Gkryqt3E=;
  b=gj4b+Xol7hOIh0JHT5WyslHsEWsYhZ2wqQKThbj1fzcCYs/+Z6sHe4um
   fBxbKnkbxjrx7xrLqXI8JMe0oYeFGlfweV0FqSWgQAcwlqcBXUkL4cM/E
   Z0e88oaeRoWKtkOtLnRKWgZg/XZVKedrr5cxbj+nLTR8RyrkLChDuxIjZ
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 84920457
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:xGDM26P4ItuxAGvvrR33l8FynXyQoLVcMsEvi/4bfWQNrUoigzBRz
 2YdCm6Fa/+JYmX3eYhyPIzn9BkBu8TSyIUxHgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvzrRC9H5qyo4mpB5AZmOZingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0tlVKDxCz
 +VGE28cXAGNgf+P76K4dfY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w/N3wsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9KoDbH50JwxnwS
 mTu9UWmDhoVG/KjkDOU7kiM3P/QjCencddHfFG/3qEz2wDCroAJMzUaXEW2ieO0gUm/X5RYM
 UN80jojq+0++VKmSvH5XgakuziUsxgEQd1SHuYmrgaXxcLpDx2xXzZeCGQbMZp/6ZFwFWdCO
 kK1c83BOh5G7bGvUCymqaamvD20JBE6PWw9enpRJeca2OUPsL3fnzqWEIgySP7u14ykcd3j6
 2vU9XZj3t3/meZOjvzmpg6f3lpAs7CTFmYIChPrsnVJB++TTKqsfMSW5FfS9p6sx67JHwDa7
 BDodyVzhd3i7K1hdwTXGo3h5Jnzu5643MT02DaC3/AJrlxBAUKLc4FK+y1ZL0x0KMsCcjKBS
 BaN51IJucINYyH0M/Afj2eN5yMClPiIKDgYfqqMMoomjmZZKWdrAx2ClWbPhjuwwSDAYIk0O
 IuBcNbEMJrpIf0P8dd3Ls9DuYIWKtcWnz6PFcuilk7/uVdcDVbMIYo43JK1RrhRxMu5TM/9q
 r6z6+PiJ81jbdDD
IronPort-HdrOrdr: A9a23:t//4JK9MLUiUJRzk48Buk+DSI+orL9Y04lQ7vn2YSXRuHfBw8P
 re+MjztCWE7Qr5N0tApTntAsS9qBDnhPxICOsqXYtKNTOO0ADDEGgL1/qE/9SKIUPDH4BmuZ
 uIC5IOa+HNMQ==
X-IronPort-AV: E=Sophos;i="5.96,184,1665460800"; 
   d="scan'208";a="84920457"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Edwin Torok
	<edvin.torok@citrix.com>, Rob Hoes <Rob.Hoes@citrix.com>
Subject: [PATCH 0/8] Oxenstored live update fixes
Date: Tue, 22 Nov 2022 15:20:35 +0000
Message-ID: <20221122152043.8518-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

First set of Ocaml fixes, cleaned up from series posted previously.

Patch 1 fixes a logical error introduced in the xenstore live update support.

Patches 2-5 fix oxenstored to keep /dev/xen/evtchn open across live update.

Patches 6-8 fix various issues with diagnostics.

All previous feedback applied, but I've started this series again to avoid
confusion.

Andrew Cooper (1):
  tools/oxenstored: Fix incorrect scope after an if statement

Edwin Török (7):
  tools/ocaml/evtchn: OCaml 5 support, fix potential resource leak
  tools/ocaml/evtchn: Add binding for xenevtchn_fdopen()
  tools/ocaml/evtchn: Extend the init() binding with a cloexec flag
  tools/oxenstored: Keep /dev/xen/evtchn open across live update
  tools/oxenstored: Log live update issues at warning level
  tools/oxenstored: Set uncaught exception handler
  tools/oxenstored/syslog: Avoid potential NULL dereference

 tools/ocaml/libs/eventchn/xeneventchn.ml      |  6 +-
 tools/ocaml/libs/eventchn/xeneventchn.mli     | 13 +++-
 tools/ocaml/libs/eventchn/xeneventchn_stubs.c | 50 ++++++++++++--
 tools/ocaml/xenstored/domain.ml               |  6 +-
 tools/ocaml/xenstored/domains.ml              | 14 ++--
 tools/ocaml/xenstored/event.ml                |  8 ++-
 tools/ocaml/xenstored/logging.ml              | 29 +++++++++
 tools/ocaml/xenstored/syslog_stubs.c          |  7 +-
 tools/ocaml/xenstored/xenstored.ml            | 94 ++++++++++++++++++---------
 9 files changed, 179 insertions(+), 48 deletions(-)

-- 
2.11.0


