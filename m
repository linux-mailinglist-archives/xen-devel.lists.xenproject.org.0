Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AED131993E6
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 12:50:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJEQP-0002t2-B7; Tue, 31 Mar 2020 10:47:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I6p8=5Q=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jJEQN-0002sx-F8
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 10:47:15 +0000
X-Inumbo-ID: fb74fcb0-733c-11ea-83d8-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb74fcb0-733c-11ea-83d8-bc764e2007e4;
 Tue, 31 Mar 2020 10:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585651634;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lDRlkg899SiCd2y5eU+46cWGS8nMcYP2KjNS9HXZkJQ=;
 b=Rmb7vlqpDUQaTqhpNDP3W5UUUXiiPDc91cQdYEQ3v/+sPISX9KT+6FZA
 KEdB2DdeGBJQGcejmavJ5d3hHlx/n/WCZAw4s0nuYBkYfEiHaTusQJF0E
 vJZCqwikflzu1MNazAuMFQArsuk9DsbsUyzn6X2jEYQypPRbUEeQ3QhOG g=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: KKYv3hltNk9TmzAmAoHvsretgA6PJB5TeyF8tz5qS/yKcCQTNyCfBz9WTM5wDzT4sCowpxArvM
 KZ+3R5bg/di9dMKgUkrPSa5mCxw8zEw/VVcIYcOQ9eLXaly89cRpZEcNabf6bpC5Z2Q2TImclL
 APSXo3f0oz3ejAcxRaP7OuPU4zbIWcP301tnH88lHQ8lW+yYnhgGYWiVmDpeqbDT5+5ffhly2u
 7vBM66ZQCMklSIqNWEA0bqEhVkRRJFZraAq16pLD88HOOiogApflvjf5WgdAgpI3h09DcofwoW
 yjI=
X-SBRS: 2.7
X-MesageID: 15246891
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,327,1580792400"; d="scan'208";a="15246891"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [XEN PATCH v4 17/18] build,include: rework compat-build-source.py
Date: Tue, 31 Mar 2020 11:31:01 +0100
Message-ID: <20200331103102.1105674-18-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200331103102.1105674-1-anthony.perard@citrix.com>
References: <20200331103102.1105674-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Improvement are:
- give the path to xlat.lst as argument
- include `grep -v` in compat-build-source.py script, we don't need to
  write this in several scripted language.
- have 'xlat.lst' path as a variable.

No changes in final compat/%.h headers.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v4:
    - new patch

 xen/include/Makefile             | 11 ++++++-----
 xen/tools/compat-build-source.py |  8 +++++++-
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/xen/include/Makefile b/xen/include/Makefile
index 2a10725d689b..74b26a028902 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -50,6 +50,8 @@ public-$(CONFIG_ARM) := $(wildcard public/arch-arm/*.h public/arch-arm/*/*.h)
 .PHONY: all
 all: $(headers-y)
 
+xlat_lst = xlat.lst
+
 compat/%.h: compat/%.i Makefile $(BASEDIR)/tools/compat-build-header.py
 	set -e; id=_$$(echo $@ | tr '[:lower:]-/.' '[:upper:]___'); \
 	echo "#ifndef $$id" >$@.new; \
@@ -66,10 +68,9 @@ compat/%.h: compat/%.i Makefile $(BASEDIR)/tools/compat-build-header.py
 compat/%.i: compat/%.c Makefile
 	$(CPP) $(filter-out -Wa$(comma)% -include %/include/xen/config.h,$(XEN_CFLAGS)) $(cppflags-y) -o $@ $<
 
-compat/%.c: public/%.h xlat.lst Makefile $(BASEDIR)/tools/compat-build-source.py
+compat/%.c: public/%.h $(xlat_lst) Makefile $(BASEDIR)/tools/compat-build-source.py
 	mkdir -p $(@D)
-	grep -v 'DEFINE_XEN_GUEST_HANDLE(long)' $< | \
-	$(PYTHON) $(BASEDIR)/tools/compat-build-source.py >$@.new
+	$(PYTHON) $(BASEDIR)/tools/compat-build-source.py $(xlat_lst) <$< >$@.new
 	mv -f $@.new $@
 
 compat/.xlat/%.h: compat/%.h compat/.xlat/%.lst $(BASEDIR)/tools/get-fields.sh Makefile
@@ -80,12 +81,12 @@ compat/.xlat/%.h: compat/%.h compat/.xlat/%.lst $(BASEDIR)/tools/get-fields.sh M
 	mv -f $@.new $@
 
 .PRECIOUS: compat/.xlat/%.lst
-compat/.xlat/%.lst: xlat.lst Makefile
+compat/.xlat/%.lst: $(xlat_lst) Makefile
 	mkdir -p $(@D)
 	grep -v '^[[:blank:]]*#' $< | sed -ne 's,@arch@,$(compat-arch-y),g' -re 's,[[:blank:]]+$*\.h[[:blank:]]*$$,,p' >$@.new
 	$(call move-if-changed,$@.new,$@)
 
-xlat-y := $(shell sed -ne 's,@arch@,$(compat-arch-y),g' -re 's,^[?!][[:blank:]]+[^[:blank:]]+[[:blank:]]+,,p' xlat.lst | uniq)
+xlat-y := $(shell sed -ne 's,@arch@,$(compat-arch-y),g' -re 's,^[?!][[:blank:]]+[^[:blank:]]+[[:blank:]]+,,p' $(xlat_lst) | uniq)
 xlat-y := $(filter $(patsubst compat/%,%,$(headers-y)),$(xlat-y))
 
 compat/xlat.h: $(addprefix compat/.xlat/,$(xlat-y)) Makefile
diff --git a/xen/tools/compat-build-source.py b/xen/tools/compat-build-source.py
index c664eb85e633..c7fc2c53db61 100755
--- a/xen/tools/compat-build-source.py
+++ b/xen/tools/compat-build-source.py
@@ -12,7 +12,11 @@ pats = [
  [ r"XEN_GUEST_HANDLE(_[0-9A-Fa-f]+)?", r"COMPAT_HANDLE" ],
 ];
 
-xlatf = open('xlat.lst', 'r')
+try:
+    xlatf = open(sys.argv[1], 'r')
+except IndexError:
+    print('missing path to xlat.lst argument')
+    sys.exit(1)
 for line in xlatf.readlines():
     match = re.subn(r"^\s*\?\s+(\w*)\s.*", r"\1", line.rstrip())
     if match[1]:
@@ -24,6 +28,8 @@ for pat in pats:
     pat[0] = re.compile(pat[0])
 
 for line in sys.stdin.readlines():
+    if 'DEFINE_XEN_GUEST_HANDLE(long)' in line:
+        continue
     for pat in pats:
         line = re.sub(pat[0], pat[1], line)
     print(line.rstrip())
-- 
Anthony PERARD


