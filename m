Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E9D3F5CA0
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 13:01:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170984.312173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUBW-0006ZV-6N; Tue, 24 Aug 2021 11:01:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170984.312173; Tue, 24 Aug 2021 11:01:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUBV-0006Jd-Ev; Tue, 24 Aug 2021 11:01:37 +0000
Received: by outflank-mailman (input) for mailman id 170984;
 Tue, 24 Aug 2021 11:01:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU4I-0003Ux-EX
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:54:10 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 62114c5c-04c9-11ec-a8c6-12813bfff9fa;
 Tue, 24 Aug 2021 10:52:32 +0000 (UTC)
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
X-Inumbo-ID: 62114c5c-04c9-11ec-a8c6-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802352;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F/M2/vq6KWl0VqsyNOoDat2OseP4JIu38Fm2gzKcBlQ=;
  b=U3QYDburFTqe6KbFy+HVkOn65kkw4XoFWbBNxCzDsfIQcGiBgXQKUT7q
   yYgf4Kq3mxO5OwuNm/a0RojM/aW6JrMQ3tZVTj1AHiopSJrOmvivWnUlP
   Iwjx1ptKlL14y0IqfpIiz0PPr1jxw9gRZ4b+eCTTVe3KNSxiLzrwxb98o
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 4jsNkiXImDfIJLLZOZGWIqMVlMjMO+QFBJMHH+BC9qi49EwwtiuItf0s49pDPfznhjdk6JHjce
 3LUwotgP/JhkFXeBfHadoRrNp7M4KiCBWL1VkYooALtdr9cj1kTmhGEY6lNKvgYThaBFWmNgst
 zEQjxLGBIuYR8+TXC5OitDX1vJhDNkAooXAmz9ApP9lWiOJZyiFHyUYj0O2QvDHjk3XY8GIAZl
 4n9B6IY1oSOkGkdR3zmlcZeY3nRXcCG8d3Y6TIn1u7YOVy2zmk6MofpzgZKwcWTUxZD+bSv6LD
 qL0Jzh/1WMby5042szX1/Q3e
X-SBRS: 5.1
X-MesageID: 51153615
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:tKSuF65bio8NpUvPrAPXwPDXdLJyesId70hD6qhwISY6TiX+rb
 HJoB17726NtN9/YhEdcLy7VJVoBEmskKKdgrNhWotKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QCpSWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="51153615"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v7 50/51] build: specify source tree in include/ for prerequisite
Date: Tue, 24 Aug 2021 11:50:37 +0100
Message-ID: <20210824105038.1257926-51-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

When doing an out-of-tree build, and thus setting VPATH,
GNU Make 0.81 on Ubuntu Trusty complains about Circular dependency of
include/Makefile and include/xlat.lst and drop them. The build fails
later due to headers malformed.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/include/Makefile | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/xen/include/Makefile b/xen/include/Makefile
index 2cd779a4108c..b94cfea74660 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -42,19 +42,19 @@ endif
 .PHONY: all
 all: $(addprefix $(obj)/,$(headers-y))
 
-$(obj)/compat/%.h: $(obj)/compat/%.i $(src)/Makefile $(srctree)/tools/compat-build-header.py
+$(obj)/compat/%.h: $(obj)/compat/%.i $(srctree)/$(src)/Makefile $(srctree)/tools/compat-build-header.py
 	$(PYTHON) $(srctree)/tools/compat-build-header.py <$< $(patsubst $(obj)/%,%,$@) >>$@.new; \
 	mv -f $@.new $@
 
-$(obj)/compat/%.i: $(obj)/compat/%.c $(src)/Makefile
+$(obj)/compat/%.i: $(obj)/compat/%.c $(srctree)/$(src)/Makefile
 	$(CPP) $(filter-out -Wa$(comma)% -include %/include/xen/config.h,$(XEN_CFLAGS)) $(cppflags-y) -o $@ $<
 
-$(obj)/compat/%.c: $(src)/public/%.h $(src)/xlat.lst $(src)/Makefile $(srctree)/tools/compat-build-source.py
+$(obj)/compat/%.c: $(src)/public/%.h $(srctree)/$(src)/xlat.lst $(srctree)/$(src)/Makefile $(srctree)/tools/compat-build-source.py
 	mkdir -p $(@D)
 	$(PYTHON) $(srctree)/tools/compat-build-source.py $(srctree)/$(src)/xlat.lst <$< >$@.new
 	mv -f $@.new $@
 
-$(obj)/compat/.xlat/%.h: $(obj)/compat/%.h $(obj)/compat/.xlat/%.lst $(srctree)/tools/get-fields.sh $(src)/Makefile
+$(obj)/compat/.xlat/%.h: $(obj)/compat/%.h $(obj)/compat/.xlat/%.lst $(srctree)/tools/get-fields.sh $(srctree)/$(src)/Makefile
 	export PYTHON=$(PYTHON); \
 	while read what name; do \
 		$(SHELL) $(srctree)/tools/get-fields.sh "$$what" compat_$$name $< || exit $$?; \
@@ -62,7 +62,7 @@ $(obj)/compat/.xlat/%.h: $(obj)/compat/%.h $(obj)/compat/.xlat/%.lst $(srctree)/
 	mv -f $@.new $@
 
 .PRECIOUS: $(obj)/compat/.xlat/%.lst
-$(obj)/compat/.xlat/%.lst: $(src)/xlat.lst $(src)/Makefile
+$(obj)/compat/.xlat/%.lst: $(srctree)/$(src)/xlat.lst $(srctree)/$(src)/Makefile
 	mkdir -p $(@D)
 	grep -v '^[[:blank:]]*#' $< | sed -ne 's,@arch@,$(compat-arch-y),g' -re 's,[[:blank:]]+$*\.h[[:blank:]]*$$,,p' >$@.new
 	$(call move-if-changed,$@.new,$@)
@@ -70,7 +70,7 @@ $(obj)/compat/.xlat/%.lst: $(src)/xlat.lst $(src)/Makefile
 xlat-y := $(shell sed -ne 's,@arch@,$(compat-arch-y),g' -re 's,^[?!][[:blank:]]+[^[:blank:]]+[[:blank:]]+,,p' $(srctree)/$(src)/xlat.lst | uniq)
 xlat-y := $(filter $(patsubst compat/%,%,$(headers-y)),$(xlat-y))
 
-$(obj)/compat/xlat.h: $(addprefix $(obj)/compat/.xlat/,$(xlat-y)) $(obj)/config/auto.conf $(src)/Makefile
+$(obj)/compat/xlat.h: $(addprefix $(obj)/compat/.xlat/,$(xlat-y)) $(obj)/config/auto.conf $(srctree)/$(src)/Makefile
 	cat $(filter %.h,$^) >$@.new
 	mv -f $@.new $@
 
@@ -97,7 +97,7 @@ PUBLIC_C99_HEADERS := $(addprefix $(hdrs-path)/, $(c99-headers))
 $(src)/public/io/9pfs.h-prereq := string
 $(src)/public/io/pvcalls.h-prereq := string
 
-$(obj)/headers.chk: $(PUBLIC_ANSI_HEADERS) $(src)/Makefile
+$(obj)/headers.chk: $(PUBLIC_ANSI_HEADERS) $(srctree)/$(src)/Makefile
 	for i in $(filter %.h,$^); do \
 	    $(CC) -x c -ansi -Wall -Werror -include stdint.h \
 	          -S -o /dev/null $$i || exit 1; \
@@ -105,7 +105,7 @@ $(obj)/headers.chk: $(PUBLIC_ANSI_HEADERS) $(src)/Makefile
 	done >$@.new
 	mv $@.new $@
 
-$(obj)/headers99.chk: $(PUBLIC_C99_HEADERS) $(src)/Makefile
+$(obj)/headers99.chk: $(PUBLIC_C99_HEADERS) $(srctree)/$(src)/Makefile
 	rm -f $@.new
 	$(foreach i, $(filter %.h,$^),                                        \
 	    echo "#include "\"$(i)\"                                          \
@@ -115,7 +115,7 @@ $(obj)/headers99.chk: $(PUBLIC_C99_HEADERS) $(src)/Makefile
 	    || exit $$?; echo $(i) >> $@.new;)
 	mv $@.new $@
 
-$(obj)/headers++.chk: $(PUBLIC_HEADERS) $(src)/Makefile
+$(obj)/headers++.chk: $(PUBLIC_HEADERS) $(srctree)/$(src)/Makefile
 	rm -f $@.new
 	if ! $(CXX) -v >/dev/null 2>&1; then                                  \
 	    touch $@.new;                                                     \
-- 
Anthony PERARD


