Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0613F5C9E
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 13:01:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170980.312159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUBU-000642-1C; Tue, 24 Aug 2021 11:01:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170980.312159; Tue, 24 Aug 2021 11:01:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUBT-0005pv-Dn; Tue, 24 Aug 2021 11:01:35 +0000
Received: by outflank-mailman (input) for mailman id 170980;
 Tue, 24 Aug 2021 11:01:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU4D-0001EC-Eg
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:54:05 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 793aa3ad-c75d-43fc-bf1c-091d2a3119cc;
 Tue, 24 Aug 2021 10:52:04 +0000 (UTC)
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
X-Inumbo-ID: 793aa3ad-c75d-43fc-bf1c-091d2a3119cc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802324;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=peF07yApvAmonymrFonEMIY5XQyw9u/7Zv4cwXrx8fA=;
  b=MwK8I3rgEKS+PCXeyQzZ1o/FI/ibhhackQPeM+dRr5B7BsaKPBlVQbaz
   bp1WSWzfnCCfCJXue1WLPkfWrjnuYqMh7tNJ9Hkb+fZvzVxPgYC5/qNVw
   6flfbLSlGKhhxsj1d5USd6gE8fbWy1o/SqRq6Y4UWHON8iqb/IgN8aSJ2
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Xw9/UdIF15GytftMnKccpbXrN2UvK+wtd3B4MB07ib0vmF7VM7ZKWNUOfqbXSWfaMkR5hZxOgO
 LMEE4ZkeJyvRKPpbDRxKZ+Eiwx8Fh1S1RfYZSkc0rFZ0Q1SidII7PtUn8NCAEIGgi+TuXzVNvE
 n9Db8dtSEGrPofU7WR0jNKNdywEOhldxEWZ+qZj8pYmuaf+iNHHOHptLyL6R9uClNmNpAeS5I6
 QW21FSOQuByifAQHWQTgkVE7LXGQuA5PTrb01xrXsXK4UDPfi0n+2Cw+nhbtvTN03YbLhKTyE7
 06NkqoXf07oFpZwVI292/PMf
X-SBRS: 5.1
X-MesageID: 51130789
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:wc/1sK2kOGZMf4gILori8QqjBQ5yeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ/+xpOMG7IU80hqQFmLX5XI3SFzUO11HYSL2KgbGN/9SCIVy1ygc+79
 YGT0EWMrSZYTdHZK3BkWqF+qMbsby6GdeT9IXjJhlWLD1CWuVF1UNUGwybGkp5SE1tHpwiDq
 eR4cJBun6JZWkXRt7TPAhIY8Hz4/nw0L72ax8PABAqrCOUiymz1bL8Gx+Emj8DTjJ0x6s4+2
 StqX232kzjiYD09vbv7R6S031koqqj9jKFPr3PtiEhEESstu9vXvUlZ1TNhkFwnAjl0idTrD
 CFmWZaAy000QKdQoj9m2qW5yDwlDkp8HPs0lmenD/qptH4XiszD45biZteaQax0TtXgDhQ6t
 M+44uijeshMfoAplWN2/HYExVx0kakq3srluAey3RZTIsFcbdU6YgS5llcHpsMFD/zrNlPKp
 gnMOjMoPJNNV+KZXHQuWdihNSqQ3QoBx+DBkwPoNac3TRalG1wi0EY2MsclHEd849VcegM28
 3UdqBz0L1eRM4faqxwQO8HXMusE2TIBQnBNWqDSG6XYZ3v+0i92aIfxY9Fmt1CVKZ4sKfaqa
 6xI2+w71RCBn4GIff+o6Fj41TXRnmhUXD31sRTjqIJyoHBeA==
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="51130789"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Konrad
 Rzeszutek Wilk" <konrad.wilk@oracle.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>
Subject: [XEN PATCH v7 37/51] build: clean-up "clean" rules of duplication
Date: Tue, 24 Aug 2021 11:50:24 +0100
Message-ID: <20210824105038.1257926-38-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

All those files to be removed are already done in the main Makefile,
either by the "find" command or directly (for $(TARGET).efi).

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Makefile                | 2 +-
 xen/arch/arm/Makefile       | 1 -
 xen/arch/x86/Makefile       | 5 ++---
 xen/test/livepatch/Makefile | 2 +-
 xen/xsm/flask/Makefile      | 2 +-
 5 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index 28854d6cb29f..950bee10ba38 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -410,7 +410,7 @@ _clean:
 		-o -name ".*.o.tmp" -o -name "*~" -o -name "core" \
 		-o -name '*.lex.c' -o -name '*.tab.[ch]' \
 		-o -name "*.gcno" -o -name ".*.cmd" -o -name "lib.a" \) -exec rm -f {} \;
-	rm -f include/asm $(TARGET) $(TARGET).gz $(TARGET).efi $(TARGET).efi.map $(TARGET)-syms $(TARGET)-syms.map *~ core
+	rm -f include/asm $(TARGET) $(TARGET).gz $(TARGET).efi $(TARGET).efi.map $(TARGET)-syms $(TARGET)-syms.map
 	rm -f asm-offsets.s arch/*/include/asm/asm-offsets.h
 	rm -f .banner include/xen/compile.h
 
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index a3204d22d17b..e6eff291c5e5 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -118,4 +118,3 @@ $(obj)/dtb.o: $(patsubst "%",%,$(CONFIG_DTB_FILE))
 clean::
 	rm -f $(obj)/xen.lds
 	rm -f $(BASEDIR)/.xen-syms.[0-9]*
-	rm -f $(TARGET).efi
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 1ef2536ece26..8d789d25a3ff 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -261,9 +261,8 @@ $(obj)/efi/mkreloc: $(src)/efi/mkreloc.c
 
 .PHONY: clean
 clean::
-	rm -f *.lds boot/*.o boot/*~ boot/core boot/mkelf32
+	rm -f *.lds boot/mkelf32
 	rm -f asm-macros.i $(BASEDIR)/arch/x86/include/asm/asm-macros.*
-	rm -f $(BASEDIR)/.xen-syms.[0-9]* boot/.*.d $(BASEDIR)/.xen.elf32
+	rm -f $(BASEDIR)/.xen-syms.[0-9]* $(BASEDIR)/.xen.elf32
 	rm -f $(BASEDIR)/.xen.efi.[0-9]* efi/*.efi efi/mkreloc
 	rm -f boot/cmdline.S boot/reloc.S boot/*.lnk boot/*.bin
-	rm -f note.o
diff --git a/xen/test/livepatch/Makefile b/xen/test/livepatch/Makefile
index 52ee58a08c5f..dee5fd78c188 100644
--- a/xen/test/livepatch/Makefile
+++ b/xen/test/livepatch/Makefile
@@ -162,4 +162,4 @@ uninstall:
 
 .PHONY: clean
 clean::
-	rm -f *.o .*.o.d *.livepatch config.h expect_config.h
+	rm -f *.livepatch config.h expect_config.h
diff --git a/xen/xsm/flask/Makefile b/xen/xsm/flask/Makefile
index 57190ff6c8ad..8d18c7d4ae6f 100644
--- a/xen/xsm/flask/Makefile
+++ b/xen/xsm/flask/Makefile
@@ -49,4 +49,4 @@ $(obj)/policy.bin: FORCE
 
 .PHONY: clean
 clean::
-	rm -f $(ALL_H_FILES) *.o $(DEPS_RM) policy.* $(POLICY_SRC) flask-policy.S
+	rm -f $(ALL_H_FILES) policy.* $(POLICY_SRC) flask-policy.S
-- 
Anthony PERARD


