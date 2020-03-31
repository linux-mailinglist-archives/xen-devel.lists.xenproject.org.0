Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C6B1993E5
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 12:50:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJEQf-0002zD-3j; Tue, 31 Mar 2020 10:47:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I6p8=5Q=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jJEQe-0002yr-8N
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 10:47:32 +0000
X-Inumbo-ID: 05b79fde-733d-11ea-ba0c-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 05b79fde-733d-11ea-ba0c-12813bfff9fa;
 Tue, 31 Mar 2020 10:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585651652;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N7cdETdSaKZOO05IMNGn7YDoG1qlk9BVAckRaXOBzec=;
 b=NH3xMd0tnYb3VnRu7YlQYKvEKY3WjS1SfHV+l8Kkf+rNCK+umM+qYqtp
 vxnouSW1KoVSwemNIiPDAhXn7t+VBrGPhwUkulLqkH+EE6HQCCIBgHOWR
 4ELeda9AkCWC+oGuPmKqDIhMnQ03X7ufdNwqgJQ7neeEykYfUIcg7Kzpa E=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7oqI99Sx8QxzF42MQfY6RaxBGM1ZoLJQb+hXhhUCKUVygx9S5kOmct60LpSyeImn4Tq7pOqOe0
 aqU8QY8S5kbkgGbLv0qVXViTV5FjFbBIn3n9iDPf9aSkylHItwKoh4vreqxxrzaT5X42g3Cxi9
 +eDz/lLme9k0lLBfBB9MTXFzxlsebNSONTLlm3wSE5pqGRt5td4EvayUEYGY6nkrwFPI6iTA11
 Wop4KByle/BQK+WDI5wc2saDEmIL2wAzgZ2XOnuhjgtjCuckZfvePdls1sivFq0SGiUc5ySP63
 /qA=
X-SBRS: 2.7
X-MesageID: 14904510
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,327,1580792400"; d="scan'208";a="14904510"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [XEN PATCH v4 18/18] build,include: rework compat-build-header.py
Date: Tue, 31 Mar 2020 11:31:02 +0100
Message-ID: <20200331103102.1105674-19-anthony.perard@citrix.com>
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

Replace a mix of shell script and python script by all python script.

Remove the unnecessary "grep -v '^# [0-9]'". It is to hide the
linemarkers generated by the preprocessor. But adding -P inhibit there
generation, thus the grep isn't needed anymore.

gcc -E -P and clang -E -P have different behavior. While both don't
generates linemarkers, gcc also removes all empty lines while clang
keep them all. We don't need those empty lines, so we don't generates
them in the final compat/%.h headers. (This replace `uniq` which was
only de-duplicating empty line.)

The only changes in the final generated headers it that they don't
have empty lines anymore.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v4:
    - new patch

 xen/include/Makefile             | 13 ++----------
 xen/tools/compat-build-header.py | 36 ++++++++++++++++++++++++++++++--
 2 files changed, 36 insertions(+), 13 deletions(-)

diff --git a/xen/include/Makefile b/xen/include/Makefile
index 74b26a028902..7e2d0ff667e8 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -53,20 +53,11 @@ all: $(headers-y)
 xlat_lst = xlat.lst
 
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
-	$(CPP) $(filter-out -Wa$(comma)% -include %/include/xen/config.h,$(XEN_CFLAGS)) $(cppflags-y) -o $@ $<
+	$(CPP) -P $(filter-out -Wa$(comma)% -include %/include/xen/config.h,$(XEN_CFLAGS)) $(cppflags-y) -o $@ $<
 
 compat/%.c: public/%.h $(xlat_lst) Makefile $(BASEDIR)/tools/compat-build-source.py
 	mkdir -p $(@D)
diff --git a/xen/tools/compat-build-header.py b/xen/tools/compat-build-header.py
index b85c43f13faf..d89a900ea02c 100755
--- a/xen/tools/compat-build-header.py
+++ b/xen/tools/compat-build-header.py
@@ -2,6 +2,12 @@
 
 import re,sys
 
+try:
+    type(str.maketrans)
+except AttributeError:
+    # For python2
+    import string as str
+
 pats = [
  [ r"__InClUdE__(.*)", r"#include\1\n#pragma pack(4)" ],
  [ r"__IfDeF__ (XEN_HAVE.*)", r"#ifdef \1" ],
@@ -20,7 +26,33 @@ pats = [
  [ r"(^|[^\w])long([^\w]|$$)", r"\1int\2" ]
 ];
 
+output_filename = sys.argv[1]
+
+# tr '[:lower:]-/.' '[:upper:]___'
+header_id = '_' + \
+    output_filename.upper().translate(str.maketrans('-/.','___'))
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
 for line in sys.stdin.readlines():
     for pat in pats:
-        line = re.subn(pat[0], pat[1], line)[0]
-    print(line.rstrip())
+        line = re.sub(pat[0], pat[1], line.rstrip())
+    print_if_nonempty(line)
+
+print_if_nonempty(sys.argv[3])
+
+print("#endif /* %s */" % header_id)
-- 
Anthony PERARD


