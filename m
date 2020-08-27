Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6DA254C43
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 19:36:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBLoF-0004ry-Be; Thu, 27 Aug 2020 17:35:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LCk+=CF=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1kBLoE-0004rt-8G
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 17:35:34 +0000
X-Inumbo-ID: b6c549ff-6033-4788-962e-6895ba9aad50
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b6c549ff-6033-4788-962e-6895ba9aad50;
 Thu, 27 Aug 2020 17:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598549732;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lyIMLQgobWP6SfFovRBnvrbWsVl1xSh+kg+RmumeOgM=;
 b=Nb6Dt6Ut1R1hXvdjnPXpeqeM0MUW3pceQ4FfIzFS3rwv8zgSBCRtDSva
 wdzTxQiJ/H9+cjSz3td4IeQF7+0QTZDKh7a3OjkRS2CS2IwcwqwGPJP47
 nWWtnW0MluqoRBf2DxxR+1gfkmGrAkWz29zYxIkOFxfyRWWR2NoJnMrY9 8=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 3k5N05/gXAvNWrxr1q3wkU42/Vbl7evkkGeg2HCktzeRwIy7vn7ZyyeY3DSKHv4MWbJWTehw0H
 530rmZ7eK+B98NVEGov4r9rs6APixjhAglMArmy0HMYblOXOcL0mHCFBORuDXZsaG5pd/ui/y8
 obnDiV5f9bhn3KSNlaz/F9R+eTelKg5YS+olE++MVKU16D5aBvVKFuoK+hsYQICD4oseFn6eTh
 L5EsgYqkZoyLShcEzOSyy4ATYOSxAG1sb66h4Jo7gGJCy4U3O64NBnH0HUp86T3bdOOYxkcT1V
 WH4=
X-SBRS: 2.7
X-MesageID: 25595221
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,360,1592884800"; d="scan'208";a="25595221"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v4 0/4] tools/ocaml/xenstored: simplify code
Date: Thu, 27 Aug 2020 18:35:15 +0100
Message-ID: <cover.1598548188.git.edvin.torok@citrix.com>
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

This refreshes the V3 patches to work with OCaml 4.02.
Upgrading to 4.06 will come as a separate series.

This patch is new in V4, the other patches were already acked in V3:
[PATCH v4 2/4] Map: backport find_opt/update from 4.06

A git tree with this and other series is available at:
https://gitlab.com/edwintorok/xen/-/compare/master...for-upstream

Edwin Török (4):
  tools/ocaml/xenstored: replace hand rolled GC with weak GC references
  Map: backport find_opt/update from 4.06
  tools/ocaml/xenstored: use more efficient node trees
  tools/ocaml/xenstored: use more efficient tries

 tools/ocaml/xenstored/connection.ml  |  3 --
 tools/ocaml/xenstored/connections.ml |  2 +-
 tools/ocaml/xenstored/history.ml     | 14 ------
 tools/ocaml/xenstored/stdext.ml      | 21 +++++++++
 tools/ocaml/xenstored/store.ml       | 49 +++++++++----------
 tools/ocaml/xenstored/symbol.ml      | 70 +++++++---------------------
 tools/ocaml/xenstored/symbol.mli     | 22 +++------
 tools/ocaml/xenstored/trie.ml        | 61 +++++++++++-------------
 tools/ocaml/xenstored/trie.mli       | 26 +++++------
 tools/ocaml/xenstored/xenstored.ml   | 16 +------
 10 files changed, 110 insertions(+), 174 deletions(-)

-- 
2.25.1


