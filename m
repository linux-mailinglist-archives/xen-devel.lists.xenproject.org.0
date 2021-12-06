Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5274646A257
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:08:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239499.415294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHTA-0006Sc-Dy; Mon, 06 Dec 2021 17:08:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239499.415294; Mon, 06 Dec 2021 17:08:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHTA-0006MS-9M; Mon, 06 Dec 2021 17:08:04 +0000
Received: by outflank-mailman (input) for mailman id 239499;
 Mon, 06 Dec 2021 17:08:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHPP-0005ti-Vf
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:04:12 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 874d5a64-56b6-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 18:04:11 +0100 (CET)
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
X-Inumbo-ID: 874d5a64-56b6-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810250;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e7pmrxgtWsIGIZ5tVVe5aoQ7uLgeznvSpyvXPWFCwoA=;
  b=U8iOup8OIC6OdKMBp2RdqRnQUHMgPH0UsTrO6XUIgCy7qzJuUzx8E8vU
   hACVIrLzgxnWL1YBD4hMeaSmW4PzWrt3YUwT7Cdu/vteYLQzHc1dQ5ibG
   J0AvWQV79FYterrX7Z/LbdQtIAZRrtnn7x30fTE2rWpXiizEIH/moqpIz
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: TPSJXAen5poGq0NHSgj7d/Jrn9ofLRQWYiFXY8kBD3h9KB36fb4n+zT5yrt9qb1SDA0/ErZYzw
 PAU/Npr2QWPPwApgVzC2LxL8GI2q3AtgKgAb584tjQPndOJAB+sMKYpIk7KwdksB7To0LApOQr
 kfx8Uq9NJCt81RUrxkfInf1/j9Y9E02Kr5mh8CrMMEz+WHKpfQTPLPgv0VTNTIUpP75nM70CQO
 WhqqE5e9KQXCC3rWbMBvlgJSo8PjYLSoteH5iozCCqn4m4h0Ck6Y2OIiVQ9aQyCluNlnbBaMWy
 KIESkAOsddjuH5SIg80wvc1J
X-SBRS: 5.1
X-MesageID: 59766522
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:AdWoLq5ARxueqiCzJq8cogxRtN7AchMFZxGqfqrLsTDasY5as4F+v
 mMZXGiHPP6NNGKnctt2bojn80sOsJ+Ay9dnHQVpqSo1Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdj2tAw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z7
 MdikZCoQh8SJ6TBluISTl5FCCdyFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gTTKmAO
 ZdDM1KDajznTS0VB2spEK45v+2xp1WvUydJp0m88P9fD2/7k1UqjemF3MDuUt2VR+1Fk0CAv
 GXE8m/lRBYAO7S31j6t4n+qwOjVkkvTSI8UUbG16PNuqFmS3XAITg0bU0Ohpvu0gVL4XMhQQ
 2Qd/DYuqq4jslSmVNDnUzW3pXeFulgXXN84LgEhwFjTkOyOuV/fXzVaCG4aADA7iCMobRg4+
 XuFh9jxPiVmvbOTRm/a66ySoRrnbED5MlQ+TSMDSAIE5fzqr4cykg/DQ75fLUKlsjHmMWqum
 m7X9UDSk51W1JdWjPvjoTgrlhr1/sCRJjPZ8Dk7SY5MAulRQIe+L7Kl5lHAhRqrBNbIFwLR1
 JTodiX30QzvMX1vvHHUKAnuNOvwjxpgDNE6qQQ1d3XG327yk0NPhagKvFlDyL5Ba67ogwPBb
 k7Joh9275ROJnasZqIfS9vvUJR1l/m9T467CaC8gj9yjn5ZLlXvEMZGPxH44owQuBJ0zfFX1
 WmzL65A8kr2+Yw4lWHrFo/xIJcgxzwkxHO7eHwI50/P7FZqX1bMEe1tGALXNogRtfrYyC2Io
 4c3H5bbkH13DbyhChQ7BKZOdDjm21BgXsuowyGWH8beSjdb9JYJV6WMnOh/ItM9xMy4VI7gp
 xmAZ6OR83Kn7VWvFOlAQioLhGrHUcktoHQlEzYrOFr0iXEvbZz2tPUUdoctfKlh/+tmlKYmQ
 /4AcsSGI/JOVjWYpGhNMcij9NRvJEaxmAaDHyu5ezxjLZRucBPEp43/dQz1+ShQUifu7Zkio
 6et3x/wSIYYQ1gwF97fbf+ilgvjvXUUlO9ocVHPJ91fJBfl/IRwcnSjhf4rOcAcbx7Ew2LCh
 QqRBB4Zo8jLopM0r4aV1fzV8d/xHrInTERAHmTd4bKnDgXg/zKukd1aTeKFXTHBT2eoqq+sU
 vpYkqPnO/odkVcU74clS+R3zbgz7sfErqNBylg2B23CalmmB+8yInSC2sUT5KRByqUA5FmzU
 0OLvNJbJa+IKIXuF1tIfFgpaeGK1Pc1nDjO7KtqfBWmtXEvpLfXA19POxSsiTBGKOonOYwo9
 u4tpcoK5lHtkREtKNuH0nhZ+mnkwqbsiEn7WkX22LPWtzc=
IronPort-HdrOrdr: A9a23:R5wqNKyIjKo/IKHM+wwgKrPwKr1zdoMgy1knxilNoRw8SKOlfq
 eV7ZMmPH7P+U8ssR4b+OxoVJPsfZqYz+8W3WBzB8bHYOCFgguVxehZhOOIqQEIWReOk9K1vZ
 0QFZSWY+efMbEVt6rHCXGDYrUd/OU=
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="59766522"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH 38/57] tools/xenstrace: rework Makefile
Date: Mon, 6 Dec 2021 17:02:21 +0000
Message-ID: <20211206170241.13165-39-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Remove "build" targets.

Use "$(TARGETS)" to list binary to be built.

Cleanup "clean" rule.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/xentrace/Makefile | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/tools/xentrace/Makefile b/tools/xentrace/Makefile
index 9fb7fc96e7..2b166335dc 100644
--- a/tools/xentrace/Makefile
+++ b/tools/xentrace/Makefile
@@ -14,14 +14,13 @@ SBIN     = xentrace xentrace_setsize
 LIBBIN   = xenctx
 SCRIPTS  = xentrace_format
 
-.PHONY: all
-all: build
+TARGETS := $(BIN) $(SBIN) $(LIBBIN)
 
-.PHONY: build
-build: $(BIN) $(SBIN) $(LIBBIN)
+.PHONY: all
+all: $(TARGETS)
 
 .PHONY: install
-install: build
+install: all
 	$(INSTALL_DIR) $(DESTDIR)$(bindir)
 	$(INSTALL_DIR) $(DESTDIR)$(sbindir)
 	[ -z "$(LIBBIN)" ] || $(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
@@ -43,7 +42,7 @@ endif
 
 .PHONY: clean
 clean:
-	$(RM) *.a *.so *.o *.rpm $(BIN) $(SBIN) $(LIBBIN) $(DEPS_RM)
+	$(RM) *.o $(TARGETS) $(DEPS_RM)
 
 .PHONY: distclean
 distclean: clean
-- 
Anthony PERARD


