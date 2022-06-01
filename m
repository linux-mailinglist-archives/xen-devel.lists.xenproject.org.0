Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 883F953AB71
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 18:59:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340582.565659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwRgr-0000FJ-Fm; Wed, 01 Jun 2022 16:59:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340582.565659; Wed, 01 Jun 2022 16:59:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwRgr-0000Cd-Bw; Wed, 01 Jun 2022 16:59:25 +0000
Received: by outflank-mailman (input) for mailman id 340582;
 Wed, 01 Jun 2022 16:59:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CPHY=WI=citrix.com=prvs=144c139f6=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nwRgp-0008OC-Qn
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 16:59:23 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f24dd1d-e1cc-11ec-bd2c-47488cf2e6aa;
 Wed, 01 Jun 2022 18:59:22 +0200 (CEST)
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
X-Inumbo-ID: 2f24dd1d-e1cc-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654102762;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BlbE29TWg9aEJQUORmjYM/XevnXuD7OicnrE0Ym51MU=;
  b=JNbjtcqWZFvy6o/cx+wxbv8WVyQvgE/078WIaH18FxC9U/VLJ6hw60nK
   weZaU77N+UfqGxz+TBZkyjfKPYjq8aJ5a82RQ8S2WgEDJQfrl5XGBU+u8
   i+0/Zl5HmaF2TDZrUT1sIDEZXlLe6gViqjcW+DJzg8JeUYawpTV11dE6H
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 73044234
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:4Bf/a6hDFHPz6eXK7dw3/KJQX161GBAKZh0ujC45NGQN5FlHY01je
 htvUGrVa/nZZWr9etwlOYi+phxUvJ7Xm9VqSAdp/ixgRCsb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M68wIFqtQw24LhXVvU4
 YiaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YUB0NYTrnMUDaCdnVA1FY4ND5Of7BlHq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bknhm0THeC+dgWZ3ZSr/GzdRZwC0xloZFGvO2i
 88xNmE3MEiaOEEn1lE/GdFgnM63v1rFcRpWtw/L+5Y4uTSD5VkkuFTqGIWMIYHbLSlPpW6Dv
 X7P9Wn9BhAcNfScxCCD/3bqgfXA9QvkXKoCGbv+8eRl6HWR22gSBRs+RVa95/6jhSaWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8U44gyQzqvf4y6CG3MJCDVGbbQbWNQeHGJwk
 AXTxpWwWGIp4Ob9pW+hGqm86m65EA8RDHE5WxBDYTBbzdz/+L0Up0eaJjp8K5JZnuEZCBmpn
 W3W9HRh2e5D5SIY//7lpA6a2lpAsrCMF1dovVuPAwpJ+ysjPOaYi5qUBU83BBqqBKKQVRG/s
 XcNgKByB8heXMjWxERhrAjgdYxFBspp0xWG2DaD57F7q1yQF4eLJOi8Gg1WKkZzKdojcjT0e
 kLVsg45zMYNYSfyN/UvPNzuUp1CIU3c+TPND6m8UzazSsIpKF/vEN9GPiZ8IFwBYGBzyPpia
 P93gO6nDGoACLQP8Qdas9w1iOdxrghnnDu7bcmik3yPjOvFDFbIGOhtDbd7Rr1ghE9yiF6No
 4g32grj40g3bdASlQGNrtBDdgBRdydlbX00wuQOHtO+zsNdMDlJI5fsLXkJJ+SJQ4w9ej/0w
 0yA
IronPort-HdrOrdr: A9a23:Q9G4GanUo5GsybFcLBXDDE/knLfpDfIU3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE7gr5OUtQ4exoV5PhfZqxz/JICMwqTNKftWrdyQyVxeNZnOjfKlTbckWUnINgPO
 VbAsxD4bXLfCFHZK3BgTVQfexO/DD+ytHLudvj
X-IronPort-AV: E=Sophos;i="5.91,269,1647316800"; 
   d="scan'208";a="73044234"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH 1/4] build: xen/include: use if_changed
Date: Wed, 1 Jun 2022 17:59:06 +0100
Message-ID: <20220601165909.46588-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220601165909.46588-1-anthony.perard@citrix.com>
References: <20220601165909.46588-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Use "define" for the headers*_chk commands as otherwise the "#"
is interpreted as a comment and make can't find the end of
$(foreach,).

Adding several .PRECIOUS as without them `make` deletes the
intermediate targets. This is an issue because the macro $(if_changed,)
check if the target exist in order to decide whether to recreate the
target.

Removing the call to `mkdir` from the commands. Those aren't needed
anymore because a rune in Rules.mk creates the directory for each
$(targets).

Remove "export PYTHON" as it is already exported.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/include/Makefile | 108 ++++++++++++++++++++++++++++++-------------
 1 file changed, 76 insertions(+), 32 deletions(-)

diff --git a/xen/include/Makefile b/xen/include/Makefile
index 03baf10efb..6d9bcc19b0 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -45,38 +45,65 @@ public-$(CONFIG_ARM) := $(wildcard $(srcdir)/public/arch-arm/*.h $(srcdir)/publi
 .PHONY: all
 all: $(addprefix $(obj)/,$(headers-y))
 
-$(obj)/compat/%.h: $(obj)/compat/%.i $(srcdir)/Makefile $(srctree)/tools/compat-build-header.py
-	$(PYTHON) $(srctree)/tools/compat-build-header.py <$< $(patsubst $(obj)/%,%,$@) >>$@.new; \
-	mv -f $@.new $@
-
-$(obj)/compat/%.i: $(obj)/compat/%.c $(srcdir)/Makefile
-	$(CPP) $(filter-out -Wa$(comma)% -include %/include/xen/config.h,$(XEN_CFLAGS)) $(cppflags-y) -o $@ $<
-
-$(obj)/compat/%.c: $(src)/public/%.h $(srcdir)/xlat.lst $(srcdir)/Makefile $(srctree)/tools/compat-build-source.py
-	mkdir -p $(@D)
-	$(PYTHON) $(srctree)/tools/compat-build-source.py $(srcdir)/xlat.lst <$< >$@.new
-	mv -f $@.new $@
-
-$(obj)/compat/.xlat/%.h: $(obj)/compat/%.h $(obj)/compat/.xlat/%.lst $(srctree)/tools/get-fields.sh $(srcdir)/Makefile
-	export PYTHON=$(PYTHON); \
-	while read what name; do \
-		$(SHELL) $(srctree)/tools/get-fields.sh "$$what" compat_$$name $< || exit $$?; \
-	done <$(patsubst $(obj)/compat/%,$(obj)/compat/.xlat/%,$(basename $<)).lst >$@.new
-	mv -f $@.new $@
+quiet_cmd_compat_h = GEN     $@
+cmd_compat_h = \
+    $(PYTHON) $(srctree)/tools/compat-build-header.py <$< $(patsubst $(obj)/%,%,$@) >>$@.new; \
+    mv -f $@.new $@
+
+quiet_cmd_compat_i = CPP     $@
+cmd_compat_i = $(CPP) $(filter-out -Wa$(comma)% -include %/include/xen/config.h,$(XEN_CFLAGS)) $(cppflags-y) -o $@ $<
+
+quiet_cmd_compat_c = GEN     $@
+cmd_compat_c = \
+   $(PYTHON) $(srctree)/tools/compat-build-source.py $(srcdir)/xlat.lst <$< >$@.new; \
+   mv -f $@.new $@
+
+quiet_cmd_xlat_headers = GEN     $@
+cmd_xlat_headers = \
+    while read what name; do \
+        $(SHELL) $(srctree)/tools/get-fields.sh "$$what" compat_$$name $< || exit $$?; \
+    done <$(patsubst $(obj)/compat/%,$(obj)/compat/.xlat/%,$(basename $<)).lst >$@.new; \
+    mv -f $@.new $@
+
+targets += $(headers-y)
+$(obj)/compat/%.h: $(obj)/compat/%.i $(srctree)/tools/compat-build-header.py FORCE
+	$(call if_changed,compat_h)
+
+.PRECIOUS: $(obj)/compat/%.i
+targets += $(patsubst %.h, %.i, $(headers-y))
+$(obj)/compat/%.i: $(obj)/compat/%.c FORCE
+	$(call if_changed,compat_i)
+
+.PRECIOUS: $(obj)/compat/%.c
+targets += $(patsubst %.h, %.c, $(headers-y))
+$(obj)/compat/%.c: $(src)/public/%.h $(srcdir)/xlat.lst $(srctree)/tools/compat-build-source.py FORCE
+	$(call if_changed,compat_c)
+
+targets += $(patsubst compat/%, compat/.xlat/%, $(headers-y))
+$(obj)/compat/.xlat/%.h: $(obj)/compat/%.h $(obj)/compat/.xlat/%.lst $(srctree)/tools/get-fields.sh FORCE
+	$(call if_changed,xlat_headers)
+
+quiet_cmd_xlat_lst = GEN     $@
+cmd_xlat_lst = \
+	grep -v '^[[:blank:]]*$(pound)' $< | sed -ne 's,@arch@,$(compat-arch-y),g' -re 's,[[:blank:]]+$*\.h[[:blank:]]*$$,,p' >$@.new; \
+	$(call move-if-changed,$@.new,$@)
 
 .PRECIOUS: $(obj)/compat/.xlat/%.lst
-$(obj)/compat/.xlat/%.lst: $(srcdir)/xlat.lst $(srcdir)/Makefile
-	mkdir -p $(@D)
-	grep -v '^[[:blank:]]*#' $< | sed -ne 's,@arch@,$(compat-arch-y),g' -re 's,[[:blank:]]+$*\.h[[:blank:]]*$$,,p' >$@.new
-	$(call move-if-changed,$@.new,$@)
+targets += $(patsubst compat/%.h, compat/.xlat/%.lst, $(headers-y))
+$(obj)/compat/.xlat/%.lst: $(srcdir)/xlat.lst FORCE
+	$(call if_changed,xlat_lst)
 
 xlat-y := $(shell sed -ne 's,@arch@,$(compat-arch-y),g' -re 's,^[?!][[:blank:]]+[^[:blank:]]+[[:blank:]]+,,p' $(srcdir)/xlat.lst | uniq)
 xlat-y := $(filter $(patsubst compat/%,%,$(headers-y)),$(xlat-y))
 
-$(obj)/compat/xlat.h: $(addprefix $(obj)/compat/.xlat/,$(xlat-y)) $(obj)/config/auto.conf $(srcdir)/Makefile
-	cat $(filter %.h,$^) >$@.new
+quiet_cmd_xlat_h = GEN     $@
+cmd_xlat_h = \
+	cat $(filter %.h,$^) >$@.new; \
 	mv -f $@.new $@
 
+$(obj)/compat/xlat.h: $(addprefix $(obj)/compat/.xlat/,$(xlat-y)) $(obj)/config/auto.conf FORCE
+	$(call if_changed,xlat_h)
+
 ifeq ($(XEN_TARGET_ARCH),$(XEN_COMPILE_ARCH))
 
 all: $(obj)/headers.chk $(obj)/headers99.chk $(obj)/headers++.chk
@@ -102,27 +129,31 @@ PUBLIC_C99_HEADERS := $(call public-filter-headers,public-c99-headers)
 $(src)/public/io/9pfs.h-prereq := string
 $(src)/public/io/pvcalls.h-prereq := string
 
-$(obj)/headers.chk: $(PUBLIC_ANSI_HEADERS) $(srcdir)/Makefile
+quiet_cmd_header_chk = CHK     $@
+cmd_header_chk = \
 	for i in $(filter %.h,$^); do \
 	    $(CC) -x c -ansi -Wall -Werror -include stdint.h \
 	          -S -o /dev/null $$i || exit 1; \
 	    echo $$i; \
-	done >$@.new
+	done >$@.new; \
 	mv $@.new $@
 
-$(obj)/headers99.chk: $(PUBLIC_C99_HEADERS) $(srcdir)/Makefile
-	rm -f $@.new
+quiet_cmd_headers99_chk = CHK     $@
+define cmd_headers99_chk
+	rm -f $@.new; \
 	$(foreach i, $(filter %.h,$^),                                        \
 	    echo "#include "\"$(i)\"                                          \
 	    | $(CC) -x c -std=c99 -Wall -Werror                               \
 	      -include stdint.h                                               \
 	      $(foreach j, $($(patsubst $(srctree)/%,%,$i)-prereq), -include $(j).h) \
 	      -S -o /dev/null -                                               \
-	    || exit $$?; echo $(i) >> $@.new;)
+	    || exit $$?; echo $(i) >> $@.new;) \
 	mv $@.new $@
+endef
 
-$(obj)/headers++.chk: $(PUBLIC_HEADERS) $(srcdir)/Makefile
-	rm -f $@.new
+quiet_cmd_headerscxx_chk = CHK     $@
+define cmd_headerscxx_chk
+	rm -f $@.new; \
 	if ! $(CXX) -v >/dev/null 2>&1; then                                  \
 	    touch $@.new;                                                     \
 	    exit 0;                                                           \
@@ -133,8 +164,21 @@ $(obj)/headers++.chk: $(PUBLIC_HEADERS) $(srcdir)/Makefile
 	      -include stdint.h -include $(srcdir)/public/xen.h               \
 	      $(foreach j, $($(patsubst $(srctree)/%,%,$i)-prereq), -include c$(j)) \
 	      -S -o /dev/null -                                               \
-	    || exit $$?; echo $(i) >> $@.new;)
+	    || exit $$?; echo $(i) >> $@.new;) \
 	mv $@.new $@
+endef
+
+targets += headers.chk
+$(obj)/headers.chk: $(PUBLIC_ANSI_HEADERS) FORCE
+	$(call if_changed,header_chk)
+
+targets += headers99.chk
+$(obj)/headers99.chk: $(PUBLIC_C99_HEADERS) FORCE
+	$(call if_changed,headers99_chk)
+
+targets += headers++.chk
+$(obj)/headers++.chk: $(PUBLIC_HEADERS) FORCE
+	$(call if_changed,headerscxx_chk)
 
 endif
 
-- 
Anthony PERARD


