Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CD92F88DF
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 23:52:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68723.123096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0XxG-0001Z3-BZ; Fri, 15 Jan 2021 22:52:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68723.123096; Fri, 15 Jan 2021 22:52:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0XxG-0001YR-7U; Fri, 15 Jan 2021 22:52:30 +0000
Received: by outflank-mailman (input) for mailman id 68723;
 Fri, 15 Jan 2021 22:52:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVL8=GS=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1l0XxF-0001Xg-8O
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 22:52:29 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d40a164c-905e-4ebd-8f6d-6c4a62ce12d2;
 Fri, 15 Jan 2021 22:52:28 +0000 (UTC)
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
X-Inumbo-ID: d40a164c-905e-4ebd-8f6d-6c4a62ce12d2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610751148;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j1flMhmnhr2W72ToV4rX7ve/S0UGMy7SacdgcJmBrno=;
  b=VX0x0RLyek8KAKKK0svvbQShQUS/R8atGepPJKeFqUnZ5ON8Qh6jp5OA
   YibA2gla3pnAu8xtiH8q4IxVfQVBwZTYpBAUEl7rfeoMyqAH0e/bu+4yi
   jr055CG452v2YgE+K5aA7L/mOGdJbwtuIc1Hh+JgdEp8xApu0UN8aHh9L
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: +r4GU7APRWnb5MPQdc5H2XV7LHS4DjMkO1n0izfx/JQaPAQ5Y0bh+K5YHtvgq2ItqquuuiWox9
 8CuC9BDxWwKdB2uBUeATEF01KJgl5YU/Nc98xvlhV6oKm1IAcYll8wWL7A8t1rEb29iC/KgSmx
 opS63dGw0meT34EEG3ID4t4M9Qxj1F17Kw8cGoaib1ie8bnrMILJKNqN74w9DRIHRRvAQEEsYE
 Xg3epnE0Sm7ESHGJi7biMnDfnd6h9Q4vo9Je8QrKKnOK67OfU0AaWMGbpxSFqvu764uFms7qAi
 i5o=
X-SBRS: 5.1
X-MesageID: 36512244
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,350,1602561600"; 
   d="scan'208";a="36512244"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v4 0/4] tools/ocaml/xenstored: optimizations
Date: Fri, 15 Jan 2021 22:28:54 +0000
Message-ID: <cover.1610748224.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1610748224.git.edvin.torok@citrix.com>
References: <cover.1610748224.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Various speed optimizations that have already been posted,
but committing them was delayed to avoid conflicts with XSAs.
The XSAs are out, so these are ready to go now.

The switch to Maps may expose bugs in certain xenstored clients,
which previously relied on iteration order of the DIRECTORY response.

In our testing we found one such case, which turned out to be a bug
in a testsuite (it always dropped the 1st xenstore key).

For convenience here is a tree with all patch series applied:
https://github.com/edwintorok/xen/pull/1

Edwin Török (4):
  tools/ocaml/xenstored: replace hand rolled GC with weak GC references
  tools/ocaml/xenstored: backport find_opt/update from 4.06
  tools/ocaml/xenstored: use more efficient node trees
  tools/ocaml/xenstored: use more efficient tries

 tools/ocaml/xenstored/connection.ml  |  3 --
 tools/ocaml/xenstored/connections.ml |  2 +-
 tools/ocaml/xenstored/history.ml     | 14 ------
 tools/ocaml/xenstored/stdext.ml      | 19 ++++++++
 tools/ocaml/xenstored/store.ml       | 51 +++++++++-----------
 tools/ocaml/xenstored/symbol.ml      | 70 +++++++---------------------
 tools/ocaml/xenstored/symbol.mli     | 22 +++------
 tools/ocaml/xenstored/trie.ml        | 61 +++++++++++-------------
 tools/ocaml/xenstored/trie.mli       | 26 +++++------
 tools/ocaml/xenstored/xenstored.ml   | 16 +------
 10 files changed, 109 insertions(+), 175 deletions(-)

-- 
2.29.2


