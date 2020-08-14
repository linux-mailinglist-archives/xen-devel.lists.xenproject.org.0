Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96044244FBF
	for <lists+xen-devel@lfdr.de>; Sat, 15 Aug 2020 00:13:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6hw7-00088t-To; Fri, 14 Aug 2020 22:12:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uEIT=BY=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1k6hw6-00088o-C1
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 22:12:30 +0000
X-Inumbo-ID: d7dd8d23-2508-407d-af15-3b0d4c07db8b
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d7dd8d23-2508-407d-af15-3b0d4c07db8b;
 Fri, 14 Aug 2020 22:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597443147;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6mnJ7Yqs6GffYk8qjUcdMu8GZUmGCiFgeDUYwR8IERc=;
 b=Ue0cgHr3jCZ43rpeSZuOoP5ff7+ExfxYdZmtfg/wXNunEsnKgWQimn42
 j3/h3HhimdWmQry1/iTLmRZX2NXGak0im/XbrP5Y5onkpIkWR/qoh7pFI
 YumWD3JM0zqF4Z8IGiWuOcEjznmuxkm/dDZqet+6DJCL2K+k0RAOzFqME 8=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: KHDHF7PoAhUGhHtHcTdc/3wzgjVJJKZUbI+A7UnybIDNZmRurGtOE/UC1+r++eO6YCIQ26eKe2
 neQI6/1HtX74Ctp31um61asBueRxqiglMCXy4Rvaf4Y9CB2RX6CkkYzolpPirIEPf83TIlTnRD
 97PlIysZkF1ZIQ2JP1PnyQkAs2I/9d+kp+PRE0VdkhASrxHesuSD00jSlJs4pIOvMrB8EOmtXC
 OEF8TQIQTF1yT++V7nei8R4wvnJ208LU43AMUh34eaN4UbG8i2dFCbp3y8coRHwSkgvMWuRRJy
 mmg=
X-SBRS: 2.7
X-MesageID: 24742331
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24742331"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v1 0/6] tools/ocaml/xenstored: simplify code
Date: Fri, 14 Aug 2020 23:11:40 +0100
Message-ID: <cover.1597439193.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FTLPEX02CAS02.citrite.net (10.13.99.123) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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

Edwin Török (6):
  tools/ocaml/libs/xc: Fix ambiguous documentation comment
  tools/ocaml/xenstored: fix deprecation warning
  tools/ocaml/xenstored: replace hand rolled GC with weak GC references
  tools/ocaml/xenstored: drop select based
  tools/ocaml/xenstored: use more efficient node trees
  tools/ocaml/xenstored: use more efficient tries

 tools/ocaml/libs/xc/xenctrl.mli               |  2 +
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
 tools/ocaml/xenstored/trie.ml                 | 61 +++++++---------
 tools/ocaml/xenstored/trie.mli                | 26 +++----
 tools/ocaml/xenstored/xenstored.ml            | 20 +-----
 14 files changed, 98 insertions(+), 206 deletions(-)
 rename tools/ocaml/xenstored/{select.ml => poll.ml} (85%)
 rename tools/ocaml/xenstored/{select.mli => poll.mli} (58%)

-- 
2.25.1


