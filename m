Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7628D2F8906
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 23:59:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68791.123323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Y3f-0003ag-CT; Fri, 15 Jan 2021 22:59:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68791.123323; Fri, 15 Jan 2021 22:59:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Y3e-0003Wy-Nx; Fri, 15 Jan 2021 22:59:06 +0000
Received: by outflank-mailman (input) for mailman id 68791;
 Fri, 15 Jan 2021 22:59:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVL8=GS=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1l0Xz5-0001Wj-3M
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 22:54:23 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a7959dc6-aee4-42b9-bae7-9e5954f77553;
 Fri, 15 Jan 2021 22:52:50 +0000 (UTC)
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
X-Inumbo-ID: a7959dc6-aee4-42b9-bae7-9e5954f77553
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610751170;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G+KPhlYkGQeeYPZr1P0VSdiQ7/luOgaO/89bcWFrKkM=;
  b=HbmCVM1llOu3T6XjgD/FhQX+W3SI0Q3zlpU03T21yaLKH/PmS8MPAy2b
   dGo6LiQmjTgY477mlruag7snZqgHikFTxt0H3hBWgl40/YliSTgFfZaBH
   55LI1nkiRST12R5inQ1XcQeOLTmiEnD9/ZLVKdA0YcSFo+jvfQyr0qJmg
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: v5wvKcfyw8IqcUlyRTHxevnQyBk0uySCiCW0KZQOetnFh0BUEPg2Biedn7TXeH2V2wpa4KJrb+
 XPHIvYIrQXlSgCCsf3izHyOMNbmvgH7ZDSAjIdONMqEb/6IaUdPzcxvHJhVuixLng3cra7q3vv
 sfsQMovSIqLDZ4AfX3uctx2DbVYPX5nE1k+GN4iYFSpYPHBHBk1Mb/7DAsB55cgmzJbC6LQe5O
 0eWCHoCY3xDJNUo/ICGmbQ+ECfmue1CQ4SnT5c8Mr0r3fquwGkgF4D3nl1A/o9h4FLsZuPfmpW
 dL8=
X-SBRS: 5.1
X-MesageID: 35217516
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,350,1602561600"; 
   d="scan'208";a="35217516"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v1 0/4] tools/ocaml/xenstored: bugfixes
Date: Fri, 15 Jan 2021 22:29:05 +0000
Message-ID: <cover.1610748224.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1610748224.git.edvin.torok@citrix.com>
References: <cover.1610748224.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Fix bugs discovered by structured fuzz testing.
See 'tools/ocaml/xenstored: structured fuzz testing' series for the tests.

These have been discovered while testing the XSA fixes, but they are not security related.

For convenience here is a tree with all patch series applied:
https://github.com/edwintorok/xen/pull/1

Edwin Török (4):
  tools/ocaml/libs/xb: do not crash after xenbus is unmapped
  tools/ocaml/xenstored: fix quota calculation for mkdir EEXIST
  tools/ocaml/xenstored: reject invalid watch paths early
  tools/ocaml/xenstored: mkdir conflicts were sometimes missed

 tools/ocaml/libs/xb/xs_ring_stubs.c  | 3 +++
 tools/ocaml/xenstored/connection.ml  | 5 ++---
 tools/ocaml/xenstored/connections.ml | 4 +++-
 tools/ocaml/xenstored/store.ml       | 1 +
 tools/ocaml/xenstored/transaction.ml | 2 +-
 5 files changed, 10 insertions(+), 5 deletions(-)

-- 
2.29.2


