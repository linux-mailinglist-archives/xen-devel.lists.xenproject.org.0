Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7E92F8872
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 23:30:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68665.122998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0XbZ-0006jT-Bp; Fri, 15 Jan 2021 22:30:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68665.122998; Fri, 15 Jan 2021 22:30:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0XbZ-0006iC-6H; Fri, 15 Jan 2021 22:30:05 +0000
Received: by outflank-mailman (input) for mailman id 68665;
 Fri, 15 Jan 2021 22:30:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVL8=GS=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1l0XbY-00062b-8M
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 22:30:04 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f41701a-fcbb-470c-add1-26a4471c89b8;
 Fri, 15 Jan 2021 22:29:50 +0000 (UTC)
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
X-Inumbo-ID: 7f41701a-fcbb-470c-add1-26a4471c89b8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610749790;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n1WuQbqtmDQimGVawL4xRfbF3r1NhtY+3oJY6Ga9Pxk=;
  b=hoPhu0u0PWQSFWTPJfAVXUnZGCf056eBBcFndzMg0CrtKa9N/rpmrUeM
   rmJpl/6snIQ9hMSIc5Dwr4nz32n165HidOcfLA369Ayi0TqSlBVklgnxs
   OOzeALxwaCK9B1xQNn2b9aiz6v6Yaedm3IGv8ICMG8hYXHwQTj7FvyjLk
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: mNUn/0Dbj8QNwPFA7G1QXiAi3eGuR7FWJYXDkgMj/IprpMNZNRvtqp8WHmbPaZPNL1q4gVJGhq
 r3Y3FEUdabxTZpSC9LGY+x+R5ZG85KufBpbnLTMAq2KJzZ3/zGnpxEt3VW+I4oMNbAkVhbyTVn
 Lyd4u9g1qBkyRiSY6GBjScu58rVjaGFEjRvobRvNwRKZTK3DiE2lSwyriAgRH9Bza8kij4l1y2
 qzZcNOHwx5qC9FNmaEoE5aju9ZfA/rN9rLQBNjc1Bo3Ub5QeqeWDbQo9O0JV/JbWrr14KdKXbh
 3xQ=
X-SBRS: 5.1
X-MesageID: 35434451
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,350,1602561600"; 
   d="scan'208";a="35434451"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Christian Lindig <christian.lindig@citrix.com>, David
 Scott <dave@recoil.org>
Subject: [PATCH v2 0/8] tools/ocaml/xenstored: implement live update
Date: Fri, 15 Jan 2021 22:28:42 +0000
Message-ID: <cover.1610748224.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1610748224.git.edvin.torok@citrix.com>
References: <cover.1610748224.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is the oxenstored live update code that was shipped with the XSAs.
It reuses the existing text-based dump format to ease backporting to
old versions of Xen.
There is a separate series that implements the C xenstored migration binary
format on top of this.

Feedback welcome either on this PR or on the mailing list:
https://github.com/edwintorok/xen/pull/1

Edvin Torok (1):
  tools/ocaml/xenstored: Implement live update for socket connections

Edwin Török (6):
  Add workaround for xenstore-control flood issues
  docs/designs/xenstore-migration.md: clarify that deletes are recursive
  tools/ocaml/xenstored: only quit on SIGTERM when a reload is possible
  tools/ocaml/xenstored: Automatically resume when possible
  tools/ocaml/xenstored: add cooperative live-update command
  tools/ocaml/xenstored: start live update process

Juergen Gross (1):
  tools/xenstore: add live update command to xenstore-control

 docs/designs/xenstore-migration.md   |   3 +-
 docs/misc/xenstore.txt               |  21 ++
 tools/ocaml/xenstored/connection.ml  |  56 ++++-
 tools/ocaml/xenstored/connections.ml |   8 +
 tools/ocaml/xenstored/logging.ml     |   3 +
 tools/ocaml/xenstored/parse_arg.ml   |   4 +
 tools/ocaml/xenstored/process.ml     | 139 +++++++++++
 tools/ocaml/xenstored/stdext.ml      |   6 +
 tools/ocaml/xenstored/store.ml       |   2 +-
 tools/ocaml/xenstored/utils.ml       |  12 +
 tools/ocaml/xenstored/xenstored.ml   | 126 +++++++---
 tools/xenstore/Makefile              |   3 +-
 tools/xenstore/xenstore_control.c    | 345 +++++++++++++++++++++++++--
 tools/xenstore/xenstored_core.c      |   7 +-
 14 files changed, 681 insertions(+), 54 deletions(-)

-- 
2.29.2


