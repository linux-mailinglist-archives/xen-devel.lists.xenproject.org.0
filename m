Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 159131B2C09
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 18:13:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQvW9-0005qq-UT; Tue, 21 Apr 2020 16:13:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FwqV=6F=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jQvW7-0005oq-Qd
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 16:12:59 +0000
X-Inumbo-ID: f406669e-83ea-11ea-83d8-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f406669e-83ea-11ea-83d8-bc764e2007e4;
 Tue, 21 Apr 2020 16:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587485573;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b2jcJWvHVOOCDCdVXs6JVD54TeD6Qf6UZQ9BDc6Gxpw=;
 b=hyl8OwRvVyWcVxV7T5/xCWcbCc85oBXauj0r4jlMJ1I8IdE9IJZiIor3
 Uto4fGgd81roREWVO5zELU50Jw//hgsaE0BQqQRySTK0tp2lee6cxCpjl
 vQngD4Ot1/+9L1px0F7GdwPW9UlZJMN1mhFdtFTY+/fFXeLoCQOTw2she A=;
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
IronPort-SDR: 8FTpPkx2AdH6Lr+kJmSFCeHSjZIJlgp2SQCaEsA5zUYTx6BRjQNzJKePsUmaLU0RW/TUwvZIwx
 QbNyk7BZc3GxuxvT6UlCtAj7IDIY7cnuYwqMKpfU/ds3WmT6u5YZpNtZGNyzN/VFFc3bwW1uTu
 sssO9MkWUlXSDGUAiWOIqu2wBaFogq4uaDyQUigzZ8MFfGFILoS67U4vyS/56SdY44HcwJw9ra
 rftnofxm4HrrUhK7wD+vEjGIuJtaExTyYaThM6Hrx+FPLGWxGP2mXaIyGdLBt/Ys2eBKRxwhcS
 QDk=
X-SBRS: 2.7
X-MesageID: 16330476
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,410,1580792400"; d="scan'208";a="16330476"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [XEN PATCH v5 15/16] build,include: rework compat-build-source.py
Date: Tue, 21 Apr 2020 17:12:07 +0100
Message-ID: <20200421161208.2429539-16-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200421161208.2429539-1-anthony.perard@citrix.com>
References: <20200421161208.2429539-1-anthony.perard@citrix.com>
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

No changes in final compat/%.h headers.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v5:
    - removed "have 'xlat.lst' path as a variable" from the patch.
    
    v4:
    - new patch

 xen/include/Makefile             | 3 +--
 xen/tools/compat-build-source.py | 8 +++++++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/xen/include/Makefile b/xen/include/Makefile
index 2a10725d689b..537085b82793 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -68,8 +68,7 @@ compat/%.i: compat/%.c Makefile
 
 compat/%.c: public/%.h xlat.lst Makefile $(BASEDIR)/tools/compat-build-source.py
 	mkdir -p $(@D)
-	grep -v 'DEFINE_XEN_GUEST_HANDLE(long)' $< | \
-	$(PYTHON) $(BASEDIR)/tools/compat-build-source.py >$@.new
+	$(PYTHON) $(BASEDIR)/tools/compat-build-source.py xlat.lst <$< >$@.new
 	mv -f $@.new $@
 
 compat/.xlat/%.h: compat/%.h compat/.xlat/%.lst $(BASEDIR)/tools/get-fields.sh Makefile
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


