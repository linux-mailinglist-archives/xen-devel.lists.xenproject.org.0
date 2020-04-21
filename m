Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A471B2C0A
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 18:13:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQvWE-0005vm-9b; Tue, 21 Apr 2020 16:13:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FwqV=6F=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jQvWC-0005uQ-RP
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 16:13:04 +0000
X-Inumbo-ID: f661cd52-83ea-11ea-b58d-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f661cd52-83ea-11ea-b58d-bc764e2007e4;
 Tue, 21 Apr 2020 16:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587485577;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K8Lniz6UiDyu3Tb2CuVmdy2kcNZ7QfJlssODBIQJTks=;
 b=ZYfIZ6ztBpnaDNBkBXD+y/CyDJFuzc5wOXv4sdxHn5GzvRY6UMN0yvA6
 4LbFOsae0AbW2Hmwkc8tds0PFWESqOW7+bxCB+ynalO+ysCk4CA94MBR1
 DXIwS52ThFnEwu0u1laPGr6eeusMgJJnSPxXL+F4Pf1g0sRHCgg9lmeGo c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: QJCQGW3Yhu9OQfaPCzcw5RV6uFa+quI1o+tDsWt9gY494v0hluljYK7Ir3bIl3vIWAa6VBnjqp
 s1VxnAescwFA6Nu8xLymWseN2yOt1eQQld7KAAoGdcSxXq179LoLYo5EFgEZSznKuumfpL5rvN
 gLB/Dh9FlgO29TfJz2PbEsqsussiUBC2WB2YqX8MyboireG4y5JUwF8qpyldV5FAloPgcVwe7K
 4MNOIrKSmcLU9MTmKPqdBDknDzFQBpOvImK8d66nP+l9S/X8iElvDAqAzqziHgx6C66t6Bvyiz
 dFE=
X-SBRS: 2.7
X-MesageID: 16692977
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,410,1580792400"; d="scan'208";a="16692977"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [XEN PATCH v5 16/16] build,include: rework compat-build-header.py
Date: Tue, 21 Apr 2020 17:12:08 +0100
Message-ID: <20200421161208.2429539-17-anthony.perard@citrix.com>
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

Replace a mix of shell script and python script by all python script.

No change to the final generated headers.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v5:
    - Removed -P from CPP when generating compat/%.i
      -> keep removing linemarkers and keep de-duplicating empty lines.
      So that all the blank line that currently exist in the generated
      headers stays in place.
    
    v4:
    - new patch

 xen/include/Makefile             | 11 +------
 xen/tools/compat-build-header.py | 52 ++++++++++++++++++++++++++++++--
 2 files changed, 51 insertions(+), 12 deletions(-)

diff --git a/xen/include/Makefile b/xen/include/Makefile
index 537085b82793..12660625119e 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -51,16 +51,7 @@ public-$(CONFIG_ARM) := $(wildcard public/arch-arm/*.h public/arch-arm/*/*.h)
 all: $(headers-y)
 
 compat/%.h: compat/%.i Makefile $(BASEDIR)/tools/compat-build-header.py
-	set -e; id=_$$(echo $@ | tr '[:lower:]-/.' '[:upper:]___'); \
-	echo "#ifndef $$id" >$@.new; \
-	echo "#define $$id" >>$@.new; \
-	echo "#include <xen/compat.h>" >>$@.new; \
-	$(if $(filter-out compat/arch-%.h,$@),echo "#include <$(patsubst compat/%,public/%,$@)>" >>$@.new;) \
-	$(if $(prefix-y),echo "$(prefix-y)" >>$@.new;) \
-	grep -v '^# [0-9]' $< | \
-	$(PYTHON) $(BASEDIR)/tools/compat-build-header.py | uniq >>$@.new; \
-	$(if $(suffix-y),echo "$(suffix-y)" >>$@.new;) \
-	echo "#endif /* $$id */" >>$@.new
+	$(PYTHON) $(BASEDIR)/tools/compat-build-header.py <$< $@ "$(prefix-y)" "$(suffix-y)" >>$@.new; \
 	mv -f $@.new $@
 
 compat/%.i: compat/%.c Makefile
diff --git a/xen/tools/compat-build-header.py b/xen/tools/compat-build-header.py
index b85c43f13faf..34d5343c3dd9 100755
--- a/xen/tools/compat-build-header.py
+++ b/xen/tools/compat-build-header.py
@@ -2,6 +2,12 @@
 
 import re,sys
 
+try:
+    maketrans = str.maketrans
+except AttributeError:
+    # For python2
+    from string import maketrans
+
 pats = [
  [ r"__InClUdE__(.*)", r"#include\1\n#pragma pack(4)" ],
  [ r"__IfDeF__ (XEN_HAVE.*)", r"#ifdef \1" ],
@@ -20,7 +26,49 @@ pats = [
  [ r"(^|[^\w])long([^\w]|$$)", r"\1int\2" ]
 ];
 
+output_filename = sys.argv[1]
+
+# tr '[:lower:]-/.' '[:upper:]___'
+header_id = '_' + \
+    output_filename.upper().translate(maketrans('-/.','___'))
+
+header = """#ifndef {0}
+#define {0}
+#include <xen/compat.h>""".format(header_id)
+
+print(header)
+
+if not re.match("compat/arch-.*.h$", output_filename):
+    x = output_filename.replace("compat/","public/")
+    print('#include <%s>' % x)
+
+def print_if_nonempty(s):
+    if len(s):
+        print(s)
+
+print_if_nonempty(sys.argv[2])
+
+last_line_empty = False
 for line in sys.stdin.readlines():
+    line = line.rstrip()
+
+    # Remove linemarkers generated by the preprocessor.
+    if re.match(r"^# \d", line):
+        continue
+
+    # De-duplicate empty lines.
+    if len(line) == 0:
+        if not last_line_empty:
+            print(line)
+            last_line_empty = True
+        continue
+    else:
+        last_line_empty = False
+
     for pat in pats:
-        line = re.subn(pat[0], pat[1], line)[0]
-    print(line.rstrip())
+        line = re.sub(pat[0], pat[1], line)
+    print(line)
+
+print_if_nonempty(sys.argv[3])
+
+print("#endif /* %s */" % header_id)
-- 
Anthony PERARD


