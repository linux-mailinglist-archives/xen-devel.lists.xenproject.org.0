Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0056773A519
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 17:33:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553694.864414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCMJO-0003E0-Fp; Thu, 22 Jun 2023 15:33:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553694.864414; Thu, 22 Jun 2023 15:33:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCMJO-0003Bj-Bk; Thu, 22 Jun 2023 15:33:30 +0000
Received: by outflank-mailman (input) for mailman id 553694;
 Thu, 22 Jun 2023 15:33:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KQdr=CK=citrix.com=prvs=530e6dbed=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qCMJN-0002MD-9B
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 15:33:29 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2187b08f-1112-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 17:33:28 +0200 (CEST)
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
X-Inumbo-ID: 2187b08f-1112-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687448008;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3EthVTGva5DNB6P5KMnQBDEgPXGTi69YqfTcARM7qj4=;
  b=ZWKp6Qt8ve7Kb14mLgcoWI3tUnoLErrd+Q3yB/X83ANTPufsMjsUiJJv
   9v7B6a7nZU0IwLcxM7AmxB6x6o2QYOr6cUaMENaAThO2w/YAI6U+Q410V
   l+LxVAe2atUxDEaV/pM3dPpsX4LNTP2jlOaXuSsqD8IuaWEW8sV3IiREd
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 113083391
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:2usFaapblDo58Dgg6laOglkQp0JeBmLcZRIvgKrLsJaIsI4StFCzt
 garIBmFMv2LZWXyeItwaY3k8klXvZSBx9EwQARv+309FiJA9JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GpwUmAWP6gR5weAzSNNUPrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACkUbz2tnrKb/KqmWNZdndUDA5bxAapK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVRrk6VoqwmpXDe1gVr3JDmMcbPe8zMTsJQ9qqdj
 jufpDypWUpLbbRzzxKAwi+JncmIpRriQY0+JJKBzNM6sE+Mkzl75Bo+CgLg/KjRZlSFc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUS6giLxrDF/gWxCW0NTzoHY9sj3Oc0TzE30
 l6Cn/vyGCdi9raSTBq19KqQrD60ETgYKykFfyBsZRAe/9DprYU3jxTOZtVuCqi4ipvyAz6Y6
 y+OhDgzgfMUl8Fj6kmg1QmZ2XT2/MGPF1NroFyNBQpJ8z+Veqa8fo2Fx0GLwMpYMZSmf0KQn
 FdbgfW3ubVm4Y62qMCdfAkcNOj3t6nebm2C3Q4H84oJrGr0pSP6FWxEyHQnfRoybJ5ZEdP8S
 BWL0T698qO/K5dDgUVfR4uqQ/onwqH7fTgOfqCFN4EeCnSdmeLuwc2PWaJz9zq3+KTUuftjU
 ap3iO71ZZrgNYxpzSCtW8AW2qIxyyY1yAv7HM6rkE/4i+DOPCPOGN/p1WdiiMhjt8toRy2Pq
 b5i2zaikU0DAIUSnAGJmWLsEbz6BSdiXs2nwyCmXuWCPhBnCAkc5wz5mNscl3het/0NzI/gp
 yjtMnK0PXKj3RUr3y3WMCE8AF4uNL4jxU8G0dsEZA32hyN9Ptbztc/ytfIfJNEayQCq9tYsJ
 9FtRilKKq8npujvk9jFUaTAkQ==
IronPort-HdrOrdr: A9a23:WZH+hKuyK7thvGKtIKL2NI8X7skDcNV00zEX/kB9WHVpmszxra
 +TdZMgpHjJYVcqKQgdcL+7WZVoLUmwyXcx2/hyAV7AZniDhILLFuFfBOLZqlWKcREWtNQtsJ
 uIG5IObuEYZmIVsS+V2mWF+q4bsbq6zJw=
X-Talos-CUID: 9a23:znsS5GHySx5H3dAnqmJ+7U85NNl1X0HF0WXvElSpKUk2UoC8HAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AtwOO9Q64sJIrQHd7ZtQAKjk+xoxt0/mLE2ZKqaw?=
 =?us-ascii?q?fosaoBQNJARrNvCaoF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.01,149,1684814400"; 
   d="scan'208";a="113083391"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jason Andryuk
	<jandryuk@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v2 4/5] build: evaluate XEN_BUILD_* and XEN_DOMAIN on first use
Date: Thu, 22 Jun 2023 16:30:04 +0100
Message-ID: <20230622153005.31604-5-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230622153005.31604-1-anthony.perard@citrix.com>
References: <20230622153005.31604-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

With GNU make 4.4, the number of execution of the command present in
these $(shell ) increased greatly. This is probably because as of make
4.4, exported variable are also added to the environment of $(shell )
construct.

Also, `make -d` shows a lot of these:
    Makefile:15: not recursively expanding XEN_BUILD_DATE to export to shell function
    Makefile:16: not recursively expanding XEN_BUILD_TIME to export to shell function
    Makefile:17: not recursively expanding XEN_BUILD_HOST to export to shell function
    Makefile:14: not recursively expanding XEN_DOMAIN to export to shell function

So, to avoid having these command been run more than necessery, we
will use a construct to evaluate on first use.

Reported-by: Jason Andryuk <jandryuk@gmail.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Tested-by: Jason Andryuk <jandryuk@gmail.com>
---
 xen/Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index ac2765050b..e3b1468f83 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -11,10 +11,10 @@ export XEN_FULLVERSION   = $(XEN_VERSION).$(XEN_SUBVERSION)$(XEN_EXTRAVERSION)
 -include xen-version
 
 export XEN_WHOAMI	?= $(USER)
-export XEN_DOMAIN	?= $(shell ([ -x /bin/dnsdomainname ] && /bin/dnsdomainname) || ([ -x /bin/domainname ] && /bin/domainname || echo [unknown]))
-export XEN_BUILD_DATE	?= $(shell LC_ALL=C date)
-export XEN_BUILD_TIME	?= $(shell LC_ALL=C date +%T)
-export XEN_BUILD_HOST	?= $(shell hostname)
+export XEN_DOMAIN	?= $(eval XEN_DOMAIN := $(shell ([ -x /bin/dnsdomainname ] && /bin/dnsdomainname) || ([ -x /bin/domainname ] && /bin/domainname || echo [unknown])))$(XEN_DOMAIN)
+export XEN_BUILD_DATE	?= $(eval XEN_BUILD_DATE := $(shell LC_ALL=C date))$(XEN_BUILD_DATE)
+export XEN_BUILD_TIME	?= $(eval XEN_BUILD_TIME := $(shell LC_ALL=C date +%T))$(XEN_BUILD_TIME)
+export XEN_BUILD_HOST	?= $(eval XEN_BUILD_HOST := $(shell hostname))$(XEN_BUILD_HOST)
 
 # Best effort attempt to find a python interpreter, defaulting to Python 3 if
 # available.  Fall back to just `python` if `which` is nowhere to be found.
-- 
Anthony PERARD


