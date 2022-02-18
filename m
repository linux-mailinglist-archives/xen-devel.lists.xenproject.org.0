Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B41E4BB9FE
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 14:19:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275395.471234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL39A-0001MV-AK; Fri, 18 Feb 2022 13:18:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275395.471234; Fri, 18 Feb 2022 13:18:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL39A-0001Ki-6U; Fri, 18 Feb 2022 13:18:04 +0000
Received: by outflank-mailman (input) for mailman id 275395;
 Fri, 18 Feb 2022 13:18:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Z2s=TB=citrix.com=prvs=041b9fbab=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nL399-0001Kc-8j
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 13:18:03 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 318bc14b-90bd-11ec-8eb8-a37418f5ba1a;
 Fri, 18 Feb 2022 14:18:01 +0100 (CET)
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
X-Inumbo-ID: 318bc14b-90bd-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645190282;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LAVCDmvleJ/ZQlUX8xw4BAImML8/qd6o1PHt/BckBzY=;
  b=SsjGL2bX+w3QC5hOW2+l/EnBVBOj10+8DD0lGeYUww2xfZEWcsFVqjS9
   XFbbMaFJVj09FAKPuLPgAAqmHFAKdsy015uFVMJK4RWqGr52MPJjYjQKu
   WEMpI3Vs1vpTeCNnJ1O+MULJkH8gGZ7Aff2ZXt+kE9MPidKPCBFIexmpz
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 64517396
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:1TTpRqiYBs8Go3kaefnqaQj+X161ThAKZh0ujC45NGQN5FlHY01je
 htvDzrUaavca2ejL9knOY3n8UsHu5XczIdlTgNt+ytmESMb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0Iz8wIFqtQw24LhWVrd4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YToTBbaWlO0eaUlVPB1jE7Vo4br6AWfq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bklhmwSvUErANRpfbTr+RzdRZwC0xloZFGvO2i
 88xN2YyNUubMkMn1lE/OLI6su7y1nfFbBYf93Kfh6cc4Er+w1kkuFTqGIWMIYHbLSlPpW6Dv
 X7P9Wn9BhAcNfScxCCD/3bqgfXA9QvZco8PELyz9tZxnUaegGcUDXU+Sl+TsfS/zEmkVLp3O
 0ESvyYjs6U23EiqVcXmGQ21pmaeuRwRUMYWFPc1gCmGw7DY5AuxDWEeQjlMLtchsacLqScCj
 wHT2YmzXHo27ePTGSn1GqqoQS2aBBIuNjUObCw+HQYq38TNuK8qiy/vUYM2eEKqteHdFTb1y
 jGMiSExgbQPkMIGv5mGEUD7byGE/caQEFNsjunDdif8t14iOtb5D2C9wQWDtZ59wJClok5tV
 ZTus+yX96gwAJ6Ej0Rhq81dTejyt55p3NAx6GOD/qXNFRzxqhZPnqgKuVmSwXuF1O5dKFcFh
 2eJ5GtsCGd7ZifCUEOOS9vZ5z4W5abhD8/5cfvfc8BDZJN8HCfeon0zPBTMhzGxzhF2+U3aB
 Xt9WZ/9ZZr9If46pAdaus9HieN7rszA7Ti7qW/HI+SPjuPFOS/9pUYtO1qSdOEphJ5oUy2Om
 +uzw/Cikk0FOMWnO3G/2ddKcTgicChqbbir+pc/XrPSfWJb9JQJVqa5LUUJINc+wcy4V47go
 xmAZ6Ov4ACh3SaecV3SMBiOqtrHBP5CkJ7yBgR0VX7A5pTpSd3HAHs3H3fvQYQayQ==
IronPort-HdrOrdr: A9a23:hr6q6q5f9l2xoHeW7QPXwMTXdLJyesId70hD6qhwISY6TiX+rb
 HIoB17726RtN9/YhEdcLy7VJVoIkmskKKdg7NhXotKNTOO0ADDQb2KhbGSpQEIcBeeygcy78
 hdmtBFeb/NMWQ=
X-IronPort-AV: E=Sophos;i="5.88,378,1635220800"; 
   d="scan'208";a="64517396"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Jan
 Beulich" <JBeulich@suse.com>
Subject: [PATCH] CI: Add gnu grep to alpine containers
Date: Fri, 18 Feb 2022 13:17:40 +0000
Message-ID: <20220218131740.30922-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

A forthcoming change is going to want more support than busybox's grep can
provide.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Jan Beulich <JBeulich@suse.com>

I've already rebuilt the containers and confirmed that the build is still fine.
---
 automation/build/alpine/3.12.dockerfile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/automation/build/alpine/3.12.dockerfile b/automation/build/alpine/3.12.dockerfile
index 4ee3ddc12e52..4cce7ab926dc 100644
--- a/automation/build/alpine/3.12.dockerfile
+++ b/automation/build/alpine/3.12.dockerfile
@@ -26,6 +26,7 @@ RUN \
   # gettext for Xen < 4.13
   apk add gettext && \
   apk add git && \
+  apk add grep && \
   apk add iasl && \
   apk add libaio-dev && \
   apk add linux-headers && \
-- 
2.11.0


