Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C347D49B299
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 12:07:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260082.449198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJf8-0004hr-DU; Tue, 25 Jan 2022 11:06:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260082.449198; Tue, 25 Jan 2022 11:06:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJf8-0004eq-9Q; Tue, 25 Jan 2022 11:06:58 +0000
Received: by outflank-mailman (input) for mailman id 260082;
 Tue, 25 Jan 2022 11:06:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rP4T=SJ=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nCJag-0006t5-8M
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 11:02:22 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 444d922d-7dce-11ec-bc18-3156f6d857e4;
 Tue, 25 Jan 2022 12:02:20 +0100 (CET)
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
X-Inumbo-ID: 444d922d-7dce-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643108541;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ac3CMa3JiNPSALH1tsW+ORkYr5Fox9jaFSrR+mvf3sc=;
  b=QRv0m6REMRmc8/AMr5OLnXK2nebIRoaHYVNu5wocw37VueE3jydDIsMC
   iYtF3F6wFMaZ8UYrdiRoA7kebKP0aaP9WIohGyNQ3Utbgsi24ycO3vbJ5
   ApUfs0JDAeNWyy3jTakbpnr/dgHsoJojZ9VVztaOUruS8cR0iVwAlwwvq
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ZoBp4P9N8hPoC2SJFdHK3nzxTSdbwJ1PTJgK6E8HV0uc4WYyRfgfhFsxStXLAnHfSyDZhwG20O
 hOsHCZyVGRB31ydyfIz0oyhl09dGV9mRoWjKs84lMFS2ITwvMcsy4CW0fD+8u9zdrra+yEFRGd
 HcLrjZNM2T4Pw1pBPHefQs7wijpPSS4gf/ua9pPl/u3I5wpN2Tv6BeZgIF7NsvXsWFEKA20mC7
 GkML4M9KOAtz1pmx3/IxkgMiakkvPSYSXdSit3ItrzagGNFoKZlHd/fbg/a1jyZNeIENmmXHit
 9czjN1y+QIQ/5W90ULCDJM8g
X-SBRS: 5.2
X-MesageID: 62699833
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:FQYEQ6kddNM/P4U/zXR3B8fo5gx9IURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeCGrVO/6LamX1KdklOoSzpEsD757dmoc3HgZo+303HiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh29Q12YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 OpHroSabR5wB7SPhvgfSVpBNQRnEIQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQ6yAN
 ptJMmEHgBLoYBhSCwcSWbACruajq3yiWjB3606ajP9ii4TU5FMoi+W8WDbPQfSRXtlclEuco
 mPA/kz6DwscOdjZziCKmlqzgsffkCW9X5gdfJW66/prjVu71mEVThoMWjOTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYeUddNF+wx6CmW17HZpQ2eAwA5oiVpMYJ88pVsHHpzi
 wHPz4iB6SFTXKO9dniG7p2wtGqLIGsLMW0YJjYiaBIoyoy2yG0stS7nQtFmGa+zq9T6HzDs3
 jyHxBQDa6UvYd0jjPviow2e6964jt2QF1NuuF2LNo6wxl4hPOaYi5qUBU83BBqqBKKQVRG/s
 XcNgKByB8heXMjWxERhrAjgdYxFBspp0hWB2TaD/LF7rlxBHkJPm6gKvFmSw28yaq45lcfBO
 hO7hO+ozMY70IGWRaF2eZmtLM8h0LLtE9/oPtiNMIYVOsQgK1DZrXA2DaJ144wLuBJw+U3YE
 czDGftA8F5AUfg3pNZIb7l1PUAXKtAWmjqIGMGTI+WP2ruCfn+FIYrpw3PVBt3VGJis+V2Pm
 /4GbpPi40wGDIXWP3eLmaZOcwFiBSVrVPje9p0MHsbec1UOJY3UI6KLqV/XU9Y7z/09eyah1
 izVZ3K0P3Km1SSYcl3bMy46AF4tNL4mxU8G0eUXFQ7A8xAejUyHsM/zrrM7Iusq8vJN1/lxQ
 6VXcsmMGK0XGD/G5y4cfd/2q4k7LEanggeHPiyEZjkjfsE/G1yVq4G8Jga/pjMTCieXtNclp
 +Hy3A3sXpdeFR9pC9zbaazzwgrp72Qdgu97Q2DBPsJXJBf36IFvJiGo1q03LsgAJA/t3Dyf0
 wrKUx4UqfOU+90+8cXThLDCpICsSrMsEk1fFmjdzLC3KSiFoTbznd4eCL6FJGmPWnn19aOuY
 fRu48v9aPBXzkxXt4dcEqpwyf5s7dXYuLIHnB9vG2/Gbgr3B+o4cGWGx8RGqoZE2qRd5VmtQ
 kuK99RXZeeJNcfiHAJDLQYpdL3eh/Qdmz2U5vUpOkTqoiRw+ePfA0lVOhCNjg1bLad0b9x5k
 btw5pZO5lztkAcuP/aHkjtQpjaFIXE3Wqk6so0XXd3wgQ0xx1AeOZHRB0caOn1Uhwmg5qXyH
 gKpuQ==
IronPort-HdrOrdr: A9a23:POpugaBoAYz6pQblHemq55DYdb4zR+YMi2TC1yhKJiC9Ffbo8P
 xG/c5rrCMc5wxxZJhNo7290ey7MBHhHP1OkO0s1NWZPDUO0VHAROoJ0WKh+UyEJ8SXzJ866U
 4KScZD4bPLYWSS9fyKgzWFLw==
X-IronPort-AV: E=Sophos;i="5.88,314,1635220800"; 
   d="scan'208";a="62699833"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v9 28/30] build: specify source tree in include/ for prerequisite
Date: Tue, 25 Jan 2022 11:01:01 +0000
Message-ID: <20220125110103.3527686-29-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125110103.3527686-1-anthony.perard@citrix.com>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

When doing an out-of-tree build, and thus setting VPATH,
GNU Make 3.81 on Ubuntu Trusty complains about Circular dependency of
include/Makefile and include/xlat.lst and drop them. The build fails
later due to headers malformed.

This might be due to bug #13529
    "Incorrect circular dependancy"
    https://savannah.gnu.org/bugs/?13529
which was fixed in 3.82.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v9:
    - add potential bug report link in commit message
    
    v8:
    - make use of the new "$(srcdir)" shortcut
    - move the patch ahead of the problematic patch:
        build: adding out-of-tree support to the xen build

 xen/include/Makefile | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/xen/include/Makefile b/xen/include/Makefile
index fddf5a575bf6..c8c4bcd93bd3 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -45,19 +45,19 @@ public-$(CONFIG_ARM) := $(wildcard $(srcdir)/public/arch-arm/*.h $(srcdir)/publi
 .PHONY: all
 all: $(addprefix $(obj)/,$(headers-y))
 
-$(obj)/compat/%.h: $(obj)/compat/%.i $(src)/Makefile $(srctree)/tools/compat-build-header.py
+$(obj)/compat/%.h: $(obj)/compat/%.i $(srcdir)/Makefile $(srctree)/tools/compat-build-header.py
 	$(PYTHON) $(srctree)/tools/compat-build-header.py <$< $(patsubst $(obj)/%,%,$@) >>$@.new; \
 	mv -f $@.new $@
 
-$(obj)/compat/%.i: $(obj)/compat/%.c $(src)/Makefile
+$(obj)/compat/%.i: $(obj)/compat/%.c $(srcdir)/Makefile
 	$(CPP) $(filter-out -Wa$(comma)% -include %/include/xen/config.h,$(XEN_CFLAGS)) $(cppflags-y) -o $@ $<
 
-$(obj)/compat/%.c: $(src)/public/%.h $(src)/xlat.lst $(src)/Makefile $(srctree)/tools/compat-build-source.py
+$(obj)/compat/%.c: $(src)/public/%.h $(srcdir)/xlat.lst $(srcdir)/Makefile $(srctree)/tools/compat-build-source.py
 	mkdir -p $(@D)
 	$(PYTHON) $(srctree)/tools/compat-build-source.py $(srcdir)/xlat.lst <$< >$@.new
 	mv -f $@.new $@
 
-$(obj)/compat/.xlat/%.h: $(obj)/compat/%.h $(obj)/compat/.xlat/%.lst $(srctree)/tools/get-fields.sh $(src)/Makefile
+$(obj)/compat/.xlat/%.h: $(obj)/compat/%.h $(obj)/compat/.xlat/%.lst $(srctree)/tools/get-fields.sh $(srcdir)/Makefile
 	export PYTHON=$(PYTHON); \
 	while read what name; do \
 		$(SHELL) $(srctree)/tools/get-fields.sh "$$what" compat_$$name $< || exit $$?; \
@@ -65,7 +65,7 @@ $(obj)/compat/.xlat/%.h: $(obj)/compat/%.h $(obj)/compat/.xlat/%.lst $(srctree)/
 	mv -f $@.new $@
 
 .PRECIOUS: $(obj)/compat/.xlat/%.lst
-$(obj)/compat/.xlat/%.lst: $(src)/xlat.lst $(src)/Makefile
+$(obj)/compat/.xlat/%.lst: $(srcdir)/xlat.lst $(srcdir)/Makefile
 	mkdir -p $(@D)
 	grep -v '^[[:blank:]]*#' $< | sed -ne 's,@arch@,$(compat-arch-y),g' -re 's,[[:blank:]]+$*\.h[[:blank:]]*$$,,p' >$@.new
 	$(call move-if-changed,$@.new,$@)
@@ -73,7 +73,7 @@ $(obj)/compat/.xlat/%.lst: $(src)/xlat.lst $(src)/Makefile
 xlat-y := $(shell sed -ne 's,@arch@,$(compat-arch-y),g' -re 's,^[?!][[:blank:]]+[^[:blank:]]+[[:blank:]]+,,p' $(srcdir)/xlat.lst | uniq)
 xlat-y := $(filter $(patsubst compat/%,%,$(headers-y)),$(xlat-y))
 
-$(obj)/compat/xlat.h: $(addprefix $(obj)/compat/.xlat/,$(xlat-y)) $(obj)/config/auto.conf $(src)/Makefile
+$(obj)/compat/xlat.h: $(addprefix $(obj)/compat/.xlat/,$(xlat-y)) $(obj)/config/auto.conf $(srcdir)/Makefile
 	cat $(filter %.h,$^) >$@.new
 	mv -f $@.new $@
 
@@ -102,7 +102,7 @@ PUBLIC_C99_HEADERS := $(call public-filter-headers,public-c99-headers)
 $(src)/public/io/9pfs.h-prereq := string
 $(src)/public/io/pvcalls.h-prereq := string
 
-$(obj)/headers.chk: $(PUBLIC_ANSI_HEADERS) $(src)/Makefile
+$(obj)/headers.chk: $(PUBLIC_ANSI_HEADERS) $(srcdir)/Makefile
 	for i in $(filter %.h,$^); do \
 	    $(CC) -x c -ansi -Wall -Werror -include stdint.h \
 	          -S -o /dev/null $$i || exit 1; \
@@ -110,7 +110,7 @@ $(obj)/headers.chk: $(PUBLIC_ANSI_HEADERS) $(src)/Makefile
 	done >$@.new
 	mv $@.new $@
 
-$(obj)/headers99.chk: $(PUBLIC_C99_HEADERS) $(src)/Makefile
+$(obj)/headers99.chk: $(PUBLIC_C99_HEADERS) $(srcdir)/Makefile
 	rm -f $@.new
 	$(foreach i, $(filter %.h,$^),                                        \
 	    echo "#include "\"$(i)\"                                          \
@@ -120,7 +120,7 @@ $(obj)/headers99.chk: $(PUBLIC_C99_HEADERS) $(src)/Makefile
 	    || exit $$?; echo $(i) >> $@.new;)
 	mv $@.new $@
 
-$(obj)/headers++.chk: $(PUBLIC_HEADERS) $(src)/Makefile
+$(obj)/headers++.chk: $(PUBLIC_HEADERS) $(srcdir)/Makefile
 	rm -f $@.new
 	if ! $(CXX) -v >/dev/null 2>&1; then                                  \
 	    touch $@.new;                                                     \
-- 
Anthony PERARD


