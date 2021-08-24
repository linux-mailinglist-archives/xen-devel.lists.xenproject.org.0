Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DD63F5C65
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 12:51:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170908.311967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIU1a-0004Hb-8y; Tue, 24 Aug 2021 10:51:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170908.311967; Tue, 24 Aug 2021 10:51:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIU1a-0004EJ-5H; Tue, 24 Aug 2021 10:51:22 +0000
Received: by outflank-mailman (input) for mailman id 170908;
 Tue, 24 Aug 2021 10:51:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU1Y-0001EC-8c
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:51:20 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab10c055-d9a1-4273-af9f-d01a7cf118ec;
 Tue, 24 Aug 2021 10:50:59 +0000 (UTC)
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
X-Inumbo-ID: ab10c055-d9a1-4273-af9f-d01a7cf118ec
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802259;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bL9YzgcK9j7B9sQjCTznPaTPzCmp5IsYcEeL7e+0Qqw=;
  b=iE3p3f/KKDcv6K50PpuZLtPlmNbpFNl6N8uYKz4BZHycmkTZfaUIhKsH
   z+6IQQoIQwbf6Ol2nTFtBpBRhl3YLh6dgwU20K7jBxJdIaDiB88knsEkW
   kvd2zbY+U9n5QhtugINJcFVJ19bNS5biFl2a8B05zEhn2RyQ78cLX1Juy
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: u5dnNFc5aE5Gc8GOmsJN0+wIApDq6LGZASTLbcLPe5VrER6GeEjP8h3ZkfASe1pXAK95G+1YHx
 jtqZvyjnhBNKOgD6s6/I0kBg6iBMI/6qA4nDYJh+6DE01whLxsyD31Ds2DKrQLgke+3KJnrFZ5
 l4p5LBe/T/xLlxJP5bcAhfJAzoe1OEBOjDVJISRhwdNoVdHIv+6uqAUbWReMo1CF8QUCCOcPdi
 VNJQ+eH6sySXIegxluQxARnGQ06HeQ0hSzJPUEl/nW/IbX776S/rliPf1B2H1fPWcZ//VubD5L
 CxLUbg9A8rjOH7ST+N950r/r
X-SBRS: 5.1
X-MesageID: 50772170
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:nx4COa2SNhlwRaQsvsoEiwqjBIokLtp133Aq2lEZdPRUGvb3qy
 nIpoV86faUskdoZJhOo7C90cW7LU80sKQFhLX5Xo3SOzUO2lHYT72KhLGKq1aLdhEWtNQtsZ
 uIG5IOceEYZmIasS+V2maF+q4bsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="50772170"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: [XEN PATCH v7 07/51] build,include: rework compat-build-header.py
Date: Tue, 24 Aug 2021 11:49:54 +0100
Message-ID: <20210824105038.1257926-8-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Replace a mix of shell script and python script by all python script.

No change to the final generated headers.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Wei Liu <wl@xen.org>
---

Notes:
    v7:
    - actually keep the dependency on Makefile
    
    v6:
    - removed handling of $(prefix-y) and $(suffix-y), they've been removed.
    - remove dependency on Makefile as it's not needed anymore
    - rebased
    
    v5:
    - Removed -P from CPP when generating compat/%.i
      -> keep removing linemarkers and keep de-duplicating empty lines.
      So that all the blank line that currently exist in the generated
      headers stays in place.
    
    v4:
    - new patch

 xen/include/Makefile             |  9 +------
 xen/tools/compat-build-header.py | 44 ++++++++++++++++++++++++++++++--
 2 files changed, 43 insertions(+), 10 deletions(-)

diff --git a/xen/include/Makefile b/xen/include/Makefile
index 4fa10e68f997..95daa8a28975 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -46,14 +46,7 @@ public-$(CONFIG_ARM) := $(wildcard public/arch-arm/*.h public/arch-arm/*/*.h)
 all: $(headers-y)
 
 compat/%.h: compat/%.i Makefile $(BASEDIR)/tools/compat-build-header.py
-	set -e; id=_$$(echo $@ | tr '[:lower:]-/.' '[:upper:]___'); \
-	echo "#ifndef $$id" >$@.new; \
-	echo "#define $$id" >>$@.new; \
-	echo "#include <xen/compat.h>" >>$@.new; \
-	$(if $(filter-out compat/arch-%.h,$@),echo "#include <$(patsubst compat/%,public/%,$@)>" >>$@.new;) \
-	grep -v '^# [0-9]' $< | \
-	$(PYTHON) $(BASEDIR)/tools/compat-build-header.py | uniq >>$@.new; \
-	echo "#endif /* $$id */" >>$@.new
+	$(PYTHON) $(BASEDIR)/tools/compat-build-header.py <$< $@ >>$@.new; \
 	mv -f $@.new $@
 
 compat/%.i: compat/%.c Makefile
diff --git a/xen/tools/compat-build-header.py b/xen/tools/compat-build-header.py
index 065d3b1b6ee8..5f5474fba051 100755
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
  [ r"__InClUdE__(.*)", r"#include\1" ],
  [ r"__IfDeF__ (XEN_HAVE.*)", r"#ifdef \1" ],
@@ -23,7 +29,41 @@ pats = [
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
+print("#endif /* %s */" % header_id)
-- 
Anthony PERARD


