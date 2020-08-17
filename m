Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 097CE2472AA
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 20:46:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7k9H-0007Ar-S2; Mon, 17 Aug 2020 18:46:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mm75=B3=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1k7k9F-00078A-Vi
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 18:46:22 +0000
X-Inumbo-ID: 812f62ed-efb0-4038-9513-a056ee470ed7
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 812f62ed-efb0-4038-9513-a056ee470ed7;
 Mon, 17 Aug 2020 18:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597689977;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FRpV90KeI8B7ArLRuxmomEKdZaQAbOLsg8q0M61j2qc=;
 b=CXIvTbVudYXMBrPNoUuYQ+q/utq/kLHfupnpBg245qLCZ/H1OVz1AlsZ
 BnLEE8p7d/eneQxOm8SUPue9DIgggPttyc1GTkHZuKFvQLJmunVk2g2bA
 88pk4eC3kctCc77GsCDGLu8gam/ralXjqTQ69sqrVV6S/YKJhwaV+7oNX c=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: CrV6div7GpEA0v8rLUix6DMSs9IO9kU4Xzl/XIeZofXsftWCoHD7xVhT2q1q8Pawpz8CHOTqw7
 q5sGj9u8Vi16ydxufKjFUy4cyyml83Fbul0S3dSI2dcsPDMQHaHELAd6Dxi0mPTboXKN2xaHQ0
 vMeY809j4gsQuoBEt88J+qrl5aXaVEGormIcPuGZ2CiQu5BmU+r+286o6bwsz6d7tSkOydkIYw
 PdXFdy79es64wqJ4bByfaukyjaFuOzABehVJGToQ5JkV9uf01w+jmb93HG3Y77iFJVzb8DUOga
 fwM=
X-SBRS: 2.7
X-MesageID: 24725993
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,324,1592884800"; d="scan'208";a="24725993"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
Subject: [PATCH v3 0/6] tools/ocaml/xenstored: simplify code
Date: Mon, 17 Aug 2020 19:45:43 +0100
Message-ID: <cover.1597689796.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Fix warnings, and delete some obsolete code.
oxenstored contained a hand-rolled GC to perform hash-consing:
this can be done with a lot fewer lines of code by using the built-in Weak module.

The choice of data structures for trees/tries is not very efficient: they are just
lists. Using a map improves lookup and deletion complexity, and replaces hand-rolled
recursion with higher-level library calls.

There is a lot more that could be done to optimize socket polling:
an epoll backend with a poll fallback,but API structured around event-based polling
would be better. But first lets drop the legacy select based code: I think every
modern *nix should have a working poll(3) by now.

This is a draft series, in need of more testing.
Changes since v1:
    * fix bug where a 'set_node' call was missed
    * simplify 'compare' code
    * fix commit title for 'drop select based'
    * passed some testing

Please ignore V2, something went wrong and V2 was nearly identical to V1,
not matching what I had in my git tree.

Edwin Török (6):
  tools/ocaml/libs/xc: Fix ambiguous documentation comment
  tools/ocaml/xenstored: fix deprecation warning
  tools/ocaml/xenstored: replace hand rolled GC with weak GC references
  tools/ocaml/xenstored: drop select based socket watching
  tools/ocaml/xenstored: use more efficient node trees
  tools/ocaml/xenstored: use more efficient tries

 tools/ocaml/libs/xc/xenctrl.mli               |  2 +
 tools/ocaml/xenstored/Makefile                | 12 ++--
 tools/ocaml/xenstored/connection.ml           |  3 -
 tools/ocaml/xenstored/connections.ml          |  2 +-
 tools/ocaml/xenstored/disk.ml                 |  2 +-
 tools/ocaml/xenstored/history.ml              | 14 ----
 tools/ocaml/xenstored/parse_arg.ml            |  7 +-
 tools/ocaml/xenstored/{select.ml => poll.ml}  | 14 +---
 .../ocaml/xenstored/{select.mli => poll.mli}  | 12 +---
 tools/ocaml/xenstored/store.ml                | 49 ++++++-------
 tools/ocaml/xenstored/symbol.ml               | 70 +++++--------------
 tools/ocaml/xenstored/symbol.mli              | 22 ++----
 tools/ocaml/xenstored/trie.ml                 | 59 +++++++---------
 tools/ocaml/xenstored/trie.mli                | 26 +++----
 tools/ocaml/xenstored/xenstored.ml            | 20 +-----
 15 files changed, 103 insertions(+), 211 deletions(-)
 rename tools/ocaml/xenstored/{select.ml => poll.ml} (85%)
 rename tools/ocaml/xenstored/{select.mli => poll.mli} (58%)

-- 
2.25.1


