Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6BD3B92EA
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 16:10:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148709.274864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxOn-00078T-Tn; Thu, 01 Jul 2021 14:10:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148709.274864; Thu, 01 Jul 2021 14:10:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxOn-00072Q-NZ; Thu, 01 Jul 2021 14:10:37 +0000
Received: by outflank-mailman (input) for mailman id 148709;
 Thu, 01 Jul 2021 14:10:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXwC=LZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lyxOl-0005tj-Vm
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 14:10:36 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 09ef554a-cc6f-4393-bec9-018267e96a0b;
 Thu, 01 Jul 2021 14:10:30 +0000 (UTC)
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
X-Inumbo-ID: 09ef554a-cc6f-4393-bec9-018267e96a0b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625148630;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=P2E0W/gctKSv9qL8/o+vMgXc//AFHVWuP07uAhIiJh4=;
  b=h5xlRTJERNCZIb4MfXn0paw4thhIvhuz4PWdYI5X/5WeGLwmd0TTHhcj
   TLco105FdRIfN/THbmt5aCfmuEYBZijGMYw24xYgDsxx7iqSvdrH3t0Z8
   SliOPRpgmjl99il0uI1biOQyIm5D0wrpcr0+wlp9tjl74Y4LgZ0iXbhDG
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: grgSpt4fWT8iOSPspjf8uGICLMQU/Xg+FsFXwSYR71Q1UMQ4NXITI5Ow9zIJmjSDTLUBsLj4jg
 aJ6z9LmtP+5zzltsferH1oYFnsZq0MwBaMpxYjdmGoShRUxE0zMoVmlsXVzpACaIuNzfcgg7H+
 +p0Wd02cOtVzWOGVP+sEpW4lBhuJFxX/VBWwwibFp89aAg5m0EoNZYpAe8oRpObtzuJEKkZp3h
 1EGdSuFWbRjkiQVVccDCelGLnUvEJ0hHq/Nx6lc0sKJim81fqlIIb6feaEZv7dS3K2IPpbcQQZ
 JDw=
X-SBRS: 5.1
X-MesageID: 47446790
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:2+1tPq6o+GDVMMmE2APXwM7XdLJyesId70hD6qhwISY7TiX+rb
 HIoB17726MtN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKPjOHhILAFugLhuHfKn/bakjDH4ZmpM
 FdmsNFZuEYY2IXsS+D2njaL+od
X-IronPort-AV: E=Sophos;i="5.83,314,1616472000"; 
   d="scan'208";a="47446790"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: [XEN PATCH v6 08/31] build,include: rework compat-build-header.py
Date: Thu, 1 Jul 2021 15:09:48 +0100
Message-ID: <20210701141011.785641-9-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210701141011.785641-1-anthony.perard@citrix.com>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Replace a mix of shell script and python script by all python script.

Also remove dependency on Makefile as the file generation doesn't
depend on it anymore.

No change to the final generated headers.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Wei Liu <wl@xen.org>
---

Notes:
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

 xen/include/Makefile             | 11 ++------
 xen/tools/compat-build-header.py | 44 ++++++++++++++++++++++++++++++--
 2 files changed, 44 insertions(+), 11 deletions(-)

diff --git a/xen/include/Makefile b/xen/include/Makefile
index be3b81485bdc..9feb57545ef1 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -45,15 +45,8 @@ public-$(CONFIG_ARM) := $(wildcard public/arch-arm/*.h public/arch-arm/*/*.h)
 .PHONY: all
 all: $(headers-y)
 
-compat/%.h: compat/%.i Makefile $(BASEDIR)/tools/compat-build-header.py
-	set -e; id=_$$(echo $@ | tr '[:lower:]-/.' '[:upper:]___'); \
-	echo "#ifndef $$id" >$@.new; \
-	echo "#define $$id" >>$@.new; \
-	echo "#include <xen/compat.h>" >>$@.new; \
-	$(if $(filter-out compat/arch-%.h,$@),echo "#include <$(patsubst compat/%,public/%,$@)>" >>$@.new;) \
-	grep -v '^# [0-9]' $< | \
-	$(PYTHON) $(BASEDIR)/tools/compat-build-header.py | uniq >>$@.new; \
-	echo "#endif /* $$id */" >>$@.new
+compat/%.h: compat/%.i $(BASEDIR)/tools/compat-build-header.py
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


