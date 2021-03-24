Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D4C347DF6
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 17:44:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101096.193107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP6cQ-00011b-G4; Wed, 24 Mar 2021 16:44:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101096.193107; Wed, 24 Mar 2021 16:44:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP6cQ-00010r-CV; Wed, 24 Mar 2021 16:44:30 +0000
Received: by outflank-mailman (input) for mailman id 101096;
 Wed, 24 Mar 2021 16:44:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hwg6=IW=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lP6cO-0000tK-7Q
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 16:44:28 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ff0ec8d3-c315-48f2-b880-cb1ff001fada;
 Wed, 24 Mar 2021 16:44:17 +0000 (UTC)
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
X-Inumbo-ID: ff0ec8d3-c315-48f2-b880-cb1ff001fada
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616604257;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uuDn92Xa+RMV3fXLuJmjz/2MKOAAr3rYq4Eg3slmcAY=;
  b=Vkbs2XGbPu7Xgb2BEQlfHwuB57/MVVFYZS+UsG07zjF+l9QNzN8tK/pJ
   xIE/BHwMWfPi9tPNm4H9B5DVV0QIVt1LedJ17sEQG4vvbU3kPYgnNJe0r
   2eZwGAplXhGQHLj5646BPuy4R23Eee63+KNBQAZR6ie/ibnWDZdml2Vv6
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: GqzawePQgz9PxUPeDgr0q7W6iezpgERIlM0U+8SgFB+Pl5NpKSuJX+5p4Df6UxO1eA3QiW21Sr
 +0VmG7SkTEkIk1UWAsF+MKzVQZCBFXkurOgZJ0HfOvshlJPD9gnJQnX1mEyn4E2+4afbmOx4pt
 QCBqo9MfOKP7aw93nVPK/K2rZ4EJxtl0pxXiBM9VfjZwMjTaoY0W8XUqttMasu12r70If0FcpT
 b2o7FRqX7hNUe8+ATgowTqJCHP1vWJxb9y/kDYqxxxZeCgbIUmunABs0WuxBbzsPy2uyvJMjOR
 n3k=
X-SBRS: 5.1
X-MesageID: 40194788
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:IVe/u62d1JlqnJ1QMPCwrAqjBWByeYIsi2QD101hICF9WtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7LE/035Qd2+ksFJ2lWxTrv3btEZF64eLZslndMgDd1soY76
 dvdKBiFMb9ZGIRse/W6BS1euxO/PCp66at7N2x815IbSVHL55t9B14DAHzKDwSeCBjCYAiHJ
 SRouprzgDQGkg/VciwCnkbU+WrnbSi+K7OWhIaGwUhrDCHkDLA0tXHOiKF1RQTWS4n+8ZBzU
 H5lWXCh5mLgrWA5TL3k0TS6JlXn9WJ8Ko/OOW8zvI7Bx+ppgKhZIFKU6CPsjYvsIiUmSoXue
 iJmTgMFYBe7G7QY3GUrHLWqnbd+Qdr0VDO4xu5hmbuusPwTj5SMbs+uatpNiH3xmBlmfMU6t
 Mt40up86B5IDmFoQHGo//PbB1unlrcmwtYrccjy0ZxfKFbVKVctuUkjSVoOaZFJg3WwqY9Ht
 JjCcnNjcwmC2+yXjTism5jzMfEZAVLIj62BkwLusmi2zNLhnxOz0wB2MwFnnsbnahNM6V52w
 ==
X-IronPort-AV: E=Sophos;i="5.81,275,1610427600"; 
   d="scan'208";a="40194788"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH 6/6] CHANGELOG.md: Add entries for CI loop
Date: Wed, 24 Mar 2021 16:44:07 +0000
Message-ID: <20210324164407.302062-6-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324164407.302062-1-george.dunlap@citrix.com>
References: <20210324164407.302062-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
CC: Wei Liu <wl@xen.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Doug Goldstein <cardoe@cardoe.com>
---
 CHANGELOG.md | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index df6c638152..15a22d6bde 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -16,6 +16,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - Library improvements from NetBSD ports upstreamed
  - x86_emulate: Support AVX-VNNI instructions
  - x86_emulate: Expanded testing for several instruction classes
+ - CI loop: Add Alpine Linux, Ubuntu Focal targets; drop CentOS 6
+ - CI loop: Add dom0less aarch64 smoke test
 
 ## Removed / support downgraded
 
-- 
2.30.2


