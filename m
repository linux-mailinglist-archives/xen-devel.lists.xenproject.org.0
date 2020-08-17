Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FE1247237
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 20:40:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7k3Z-0006KR-I5; Mon, 17 Aug 2020 18:40:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mm75=B3=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1k7k3Y-0006KG-32
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 18:40:28 +0000
X-Inumbo-ID: 6457a3a3-77f6-4e27-b7af-57f94338a40b
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6457a3a3-77f6-4e27-b7af-57f94338a40b;
 Mon, 17 Aug 2020 18:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597689627;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/7c/MoAGVhIWcbz0Blpk4fTr5OzouzSe6dfR/0aKYlQ=;
 b=GWbyEyJJZFN94RCXTBg5E4tdd37zW45eysyKfhf7+s4+I/zepZDZPDGV
 3z0YXD0M4gCKm1o+ES4j251WO4/n3do6OIsycblPwCOmAXVKrCuyK2UlC
 k80IgS6Qb6fQZzDwUWR3O9ZJfqSPpCGb71IDaXkmxJmn1Gis/MMy0/oIy w=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: VAjU2FzuOP1RlQssQsJQpbMOGrnS14PaFJepEgBreasplO+aV3ZsrvQe/ezVmy79ZNSMvlzuAW
 fZo8TW4Hj2eN9Bz9r2jDFFS7nSZEqZ5HoibWShbfpfg8Hs+mJXMf2Kug6gg2n7hN8jfaoWQJkj
 v8AIbmRuP8fCW5i89g+s7XVC4LuRNOUS8dKrIcX9AYUFYIzaC2Aye5KUmm+se31ZkUxMvr3hcR
 tTS9yURWFUcU90NyJau+1zhPus9VNsthXnw1txy20f3svWb03z/pHzV8uZRnpWKmGkA2D/9tcu
 9vY=
X-SBRS: 2.7
X-MesageID: 25045838
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,324,1592884800"; d="scan'208";a="25045838"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 0/6] tools/ocaml/xenstored: simplify code
Date: Mon, 17 Aug 2020 19:39:48 +0100
Message-ID: <cover.1597689211.git.edvin.torok@citrix.com>
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

Changes since v1:
  * passed some testing
  * fix commit title on 'drop select based'
  * fix missing 'set_node' in 'set' that got lost in conversion to map
  * simplify 'compare' function

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


