Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CADE59053C
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 18:59:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384888.620449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBX0-0005Qx-Fc; Thu, 11 Aug 2022 16:59:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384888.620449; Thu, 11 Aug 2022 16:59:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBX0-0005NR-5M; Thu, 11 Aug 2022 16:59:38 +0000
Received: by outflank-mailman (input) for mailman id 384888;
 Thu, 11 Aug 2022 16:59:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jhQd=YP=citrix.com=prvs=21531f474=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oMBNC-0003Aq-Em
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 16:49:30 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9083ff3b-1995-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 18:49:28 +0200 (CEST)
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
X-Inumbo-ID: 9083ff3b-1995-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660236568;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fHsG9B8lizzzPD6/i3Kul1uCNtvyOlPvp3xYploET6A=;
  b=SwlQjw5ZRyhr3gQwcxhpc5NwUjroick4OFZl+gpi5JDr+289RLflDMdE
   KzqveBQXm6Tz0dOceTDN5EQD2vBaiwQ4xM+4q4k6kay4NhFEXwA3yhHPw
   oM0XxuHu0M2MIcbOtJOFSSUTErFK3WrX29pJQ4k6QPtRwqhPALAtR6Q/j
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77898045
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3A+APeZa2eRjgzzysAofbDix16xWv30HFdZTh5N?=
 =?us-ascii?q?fl8DyL0cXcT1ZMr2eOEzzPWbIdy115diuC4uy+r1PHeSnFXDSeApxFbC0K+U?=
 =?us-ascii?q?O0llYYYIyPPm3mvWNhM752KLcE10Xgsmn+BdeF2TUlQWDDXdGdLsPJl70DSt?=
 =?us-ascii?q?Nd3SJQQMJsrO6ZHMP1habBC69VLLYUeGSf9fxq9A4sLxtays0wk3y02Bs8wY?=
 =?us-ascii?q?i5wUF8fGz5zlAsC4OW6VfDCyOw8TBBwhtP+5cGQpdyuU/RB3doDp3ho+guZR?=
 =?us-ascii?q?mMBvVJ6n0z089wSytH0P61rbwkrxjPdIt3Pm9JRGw0V8Qw1wKbZ5FLq9nKtv?=
 =?us-ascii?q?M2Dhn+UVr7g/Rn9e0HFVZ4pKT7rou+gW751+ROouShen9WzBar93k/T43PFx?=
 =?us-ascii?q?R3GRPcg0wzbXEUxyLna3VRgD7cAKbAHYWdDEynUHTKgGYIpmnj8wc7RD18Ry?=
 =?us-ascii?q?ZSJXVuPd8qAw43AhoEVfjh/9269ak/fbthJbh1TRefvldBwOitC+J7T79oqZ?=
 =?us-ascii?q?hRauPvcTaDv5gFMGrlurpZ06IquN+r9krn6vNvOlq1sc0GnCEMeM49ywTrdt?=
 =?us-ascii?q?uSj1FiWQa5h1R4E+0k/KnQh59QAtIUOkFYZroKcKHWsGfYcfbZe1duif6gQd?=
 =?us-ascii?q?S7H9tSCxcxiJPxc9cTA7+JZ+QCpWveTGo0uNe0h5dCNRlRFL624s2FAdZvWX?=
 =?us-ascii?q?4y/comGe5RClZhfG7QOmDBDIzuIWc8rsqKLohIXrfhKlnjcZi4oIwZUucXlU?=
 =?us-ascii?q?ZByWYu406eVFZzWy2SsruF6HqhXMA7x4uZctuD/l0XUQ7xJrjRvrLzbAgFcy?=
 =?us-ascii?q?4IbqFB5sgWDI8wGZzvtwcawE+U/SFaU+/g9O/Xk4HBzoApCm1UatgmANHPqu?=
 =?us-ascii?q?dKLPwEALe5XBANSOHC4qMZvgyTvucQl60Pa4YDJEOJ4lol9Qxp+eQuF0Oy7Y?=
 =?us-ascii?q?Jko68b/7S83Itikv1D1oB1R8xPMf9mm26zv/1YPjwZrhsy+QtbAingft9MM+?=
 =?us-ascii?q?+8F2LFViKVneaGK1GBML7Krvcfni27KziorYH6oJ7uZ3wQAR8eTVUYyRrQ0J?=
 =?us-ascii?q?bBmfl/gtmkGN+LPop74uJZjPdLcMGiLn4Zyu3MKJ1fLilWHjYVJ5SbfYkG49?=
 =?us-ascii?q?nRdTIA3aAt8cDSF26iL2MAAm9ct04Ab942B2+QDvHec2YuwtomCKdlb/keqQ?=
 =?us-ascii?q?SCeMCO8smCo50lpQGn9RL9qeMIIW+XJk+poFf5M0sVoBXHHhTxavASwH8P9s?=
 =?us-ascii?q?sWuEvGaZtBA8ffwGLEdJNsfDVUIHnKYDBXxfYa4sCsthD4WpqVcK5qtDjDXt?=
 =?us-ascii?q?lL6mLYmuFkEp20M7bv8ubHDhuK/DY9+v50QKcS3elnXXow9NXhuGFDghqzm+?=
 =?us-ascii?q?TNFhnk0lkwhX4DRoA9uM8olJUuuWFPb0TGVAHbeJ956bPI1wOaOPsssQLiGc?=
 =?us-ascii?q?iwKpjGjd7sLq3WDG2THMCr3zFZU8EE6GBySOi7QvJAAopaG9asiPG2jfulBR?=
 =?us-ascii?q?hJ5VnEX5T+MPcM5k3boa/d8o55f/nRx4hnXjE9rOJIPtsXBbJZHPiH0htSPd?=
 =?us-ascii?q?Pfe6ltaC0E3qAJqGM34U4QQthxRWI9GJTVLel5yN7JtrUcuG1wCrcnSDeQvt?=
 =?us-ascii?q?mGcYRoZtBhX1T69BYeSVutMwpBMuObIzmOYJZez1sBxC8bVaSfON7Gp9xUl6?=
 =?us-ascii?q?MfbJIzEFaZLx1Mn2YqUctBAdT0q8Qmqi61qfLdM1zH+udpzbNIEf/LmkdD2u?=
 =?us-ascii?q?I3buJ8JdGgE2XN4iyZJPvo275p+EpwWf+pBjl3LWGY7sbL9HCDWYxhOrV+sq?=
 =?us-ascii?q?I2pjmyKpQOX7YXBG/d/SPbBZhzjLQslXlryWYkcv5d8sCuBjgK0zuOjpy0zh?=
 =?us-ascii?q?GytVtl7nIKmldCl8M9uF5mM4xs4xpgkZEe0LkscwoOC/9csGfOl6IhmX5wr5?=
 =?us-ascii?q?sIKu6Sp7mEZXXd90Ari9OwwueEqLeLwt0fJUomgZeO4cWWoMedbLLvYRvUV+?=
 =?us-ascii?q?UWBGq5++fsNlcdJK2imlyHqWYFbjtKnH+//DnNDGD1HZOA/wRyfkJ2brkPsn?=
 =?us-ascii?q?5Q0ztLOB1u3Xf2FKsZpgHHbn5hEDL4hRM4c4rAMr1g+qGXM11rwCrkJ5h3B3?=
 =?us-ascii?q?W+XYBwl7DwBQgMU9KAgvkwBdV7uWUPF/OdHuuB8K2iXlpPMJphu+3+BhCUkt?=
 =?us-ascii?q?NVdbxXBKPsF+Ne2e/4A7HsAMgH9e/O9HeRePaJ1zm9Ltaah/gFIQLXA4zImu?=
 =?us-ascii?q?CI5RvdVg1oSgFlzmoTk8Iqw6hAWfItM1ok8pSJ8DdlN2qlxWVZQ/0zM956RL?=
 =?us-ascii?q?g3CofzJdbKoQzb3P/iYoyiNTbiFUY7WP4ehkGe4Koz/sfoV3hG++Utd0caI0?=
 =?us-ascii?q?AOa6pAOJtAge3L7o/zo9l7HClxNpeNFrqZaP06pphEmQi1ht9Yghglv/TZYm?=
 =?us-ascii?q?wZDkpyvBKlz4R3bvpwdIlwa7ryWHGHIkru4LhHYNAAdeyYkqZ3q0qZMn/Cp8?=
 =?us-ascii?q?S+Sgg/Db12JhQO1bIRH0ea8nWLShaI9BthIVK1YR2IBORshAEU3qn6h/VXim?=
 =?us-ascii?q?YD1tPCFsTbsfK+KmWdH7voCEBa9lI7Nuc9CGDcgfnAGZkPMUjild5qD0ChF8?=
 =?us-ascii?q?h2ezCXvvzn3Qr4ZNa93YSVtyjSzq1YBESQ3aMc2Sa3+y8y4jltJwwU22uf2u?=
 =?us-ascii?q?e0OoXYZWODnX4mb?=
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="77898045"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v4 08/32] tools/xentrace: rework Makefile
Date: Thu, 11 Aug 2022 17:48:21 +0100
Message-ID: <20220811164845.38083-9-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811164845.38083-1-anthony.perard@citrix.com>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Remove "build" targets.

Use "$(TARGETS)" to list binary to be built.

Cleanup "clean" rule.

Also drop conditional install of $(BIN) and $(LIBBIN) as those two
variables are now always populated.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v4:
    - also use := for BIN, SBIN, LIBBIN, SCRIPTS
    
    v2:
    - fix typo in title
    - drop conditional install of $(BIN) and $(LIBBIN)

 tools/xentrace/Makefile | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/tools/xentrace/Makefile b/tools/xentrace/Makefile
index 9fb7fc96e7..63f2f6532d 100644
--- a/tools/xentrace/Makefile
+++ b/tools/xentrace/Makefile
@@ -9,41 +9,36 @@ LDLIBS += $(LDLIBS_libxenevtchn)
 LDLIBS += $(LDLIBS_libxenctrl)
 LDLIBS += $(ARGP_LDFLAGS)
 
-BIN      = xenalyze
-SBIN     = xentrace xentrace_setsize
-LIBBIN   = xenctx
-SCRIPTS  = xentrace_format
+BIN     := xenalyze
+SBIN    := xentrace xentrace_setsize
+LIBBIN  := xenctx
+SCRIPTS := xentrace_format
 
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
-	[ -z "$(LIBBIN)" ] || $(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
-ifneq ($(BIN),)
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
 	$(INSTALL_PROG) $(BIN) $(DESTDIR)$(bindir)
-endif
 	$(INSTALL_PROG) $(SBIN) $(DESTDIR)$(sbindir)
 	$(INSTALL_PYTHON_PROG) $(SCRIPTS) $(DESTDIR)$(bindir)
-	[ -z "$(LIBBIN)" ] || $(INSTALL_PROG) $(LIBBIN) $(DESTDIR)$(LIBEXEC_BIN)
+	$(INSTALL_PROG) $(LIBBIN) $(DESTDIR)$(LIBEXEC_BIN)
 
 .PHONY: uninstall
 uninstall:
 	rm -f $(addprefix $(DESTDIR)$(LIBEXEC_BIN)/, $(LIBBIN))
 	rm -f $(addprefix $(DESTDIR)$(bindir)/, $(SCRIPTS))
 	rm -f $(addprefix $(DESTDIR)$(sbindir)/, $(SBIN))
-ifneq ($(BIN),)
 	rm -f $(addprefix $(DESTDIR)$(bindir)/, $(BIN))
-endif
 
 .PHONY: clean
 clean:
-	$(RM) *.a *.so *.o *.rpm $(BIN) $(SBIN) $(LIBBIN) $(DEPS_RM)
+	$(RM) *.o $(TARGETS) $(DEPS_RM)
 
 .PHONY: distclean
 distclean: clean
-- 
Anthony PERARD


