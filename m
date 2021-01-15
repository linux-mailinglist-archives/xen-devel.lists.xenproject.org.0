Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A8A2F88DE
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 23:52:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68722.123084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0XxF-0001XF-36; Fri, 15 Jan 2021 22:52:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68722.123084; Fri, 15 Jan 2021 22:52:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0XxE-0001Wt-W6; Fri, 15 Jan 2021 22:52:28 +0000
Received: by outflank-mailman (input) for mailman id 68722;
 Fri, 15 Jan 2021 22:52:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVL8=GS=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1l0XxD-0001Wj-Vz
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 22:52:28 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 81aee72b-5873-48f9-8ec4-18b5b71456e3;
 Fri, 15 Jan 2021 22:52:26 +0000 (UTC)
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
X-Inumbo-ID: 81aee72b-5873-48f9-8ec4-18b5b71456e3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610751146;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pMliw4Us0bv6+eVRKUsauMTVdrInK1//NFHS94/G89U=;
  b=FapoXOkjuq9SV0AXOj/IdRJPWcF4fVI96BVDd5BZaCheAtR7LGJApDyg
   kdsojWteU7ljrtUmj4Q24uKytXLLr0ONTIfKrk9fjt2rEJTXGuss35AQk
   TYNqDHluvvrcoWZYTFzdVltqaIgYfpI+y2DQ/5v2X2+3MEwe0CyfUIonx
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: H/MapdRtKDCnDRZ3UDnJSF4bj7XAnHLQcRkO/WIILBVKiec75/qf0qX0ShC8EM16qZd+Ej1xG3
 y4LK9IhYvNc9ak1aBD9yMZttMBXpC+nJGpk0iVvJG8P2Rf5kkqmEXk3q4Gq+VZbkaGJDwvhFff
 59qMFrUjJ2/LgyPsYOo0jzS1qn630v/qwak4MPgD4+ophOtQU2g0TmvbeNpkkfpFiYnYAvFwEj
 U0tZl6dr5W8yJaN4g9HZSZCZvjY7TrvrR68tUkYi1pZ2AdeLsnoaBgJPAOdNL1ceIl+SsW7kg0
 1xk=
X-SBRS: 5.1
X-MesageID: 35217494
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,350,1602561600"; 
   d="scan'208";a="35217494"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 0/2] tools/ocaml/libs/xc: domid control
Date: Fri, 15 Jan 2021 22:28:51 +0000
Message-ID: <cover.1610748224.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1610748224.git.edvin.torok@citrix.com>
References: <cover.1610748224.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

For debugging/testing purposes we want to be able to control the domid
from the XAPI toolstack too. Xen supports this since a long time.

For convenience here is a tree with all patch series applied:
https://github.com/edwintorok/xen/pull/1


Edwin Török (2):
  tools/ocaml/xenstored: trim txhistory on xenbus reconnect
  tools/ocaml/libs/xc: backward compatible domid control at domain
    creation time

 tools/ocaml/libs/xc/xenctrl.ml      | 5 ++++-
 tools/ocaml/libs/xc/xenctrl.mli     | 4 ++--
 tools/ocaml/libs/xc/xenctrl_stubs.c | 6 +++---
 tools/ocaml/xenstored/connection.ml | 2 +-
 tools/ocaml/xenstored/history.ml    | 4 ++++
 tools/ocaml/xenstored/process.ml    | 4 ++--
 6 files changed, 16 insertions(+), 9 deletions(-)

-- 
2.29.2


