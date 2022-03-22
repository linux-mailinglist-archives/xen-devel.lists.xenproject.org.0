Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2924A4E3D7B
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 12:23:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293380.498433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWcbM-0003SL-SR; Tue, 22 Mar 2022 11:23:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293380.498433; Tue, 22 Mar 2022 11:23:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWcbM-0003NY-IU; Tue, 22 Mar 2022 11:23:00 +0000
Received: by outflank-mailman (input) for mailman id 293380;
 Tue, 22 Mar 2022 11:22:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wGTH=UB=citrix.com=prvs=07349bdb1=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nWcbK-0001wJ-Fa
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 11:22:58 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bd3e32a-a9d2-11ec-8fbc-03012f2f19d4;
 Tue, 22 Mar 2022 12:22:57 +0100 (CET)
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
X-Inumbo-ID: 6bd3e32a-a9d2-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647948177;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R0zm3Y05bQJeOGXKAYJjvGWdLoPynE+nukJHSpmCtbU=;
  b=V1qMucPUrWLjwSFhJhVLV9YIB67BIRugfgLMkHTa5ilXTv3897QzFjpY
   ApgNbUwXoZ0SOOP7+6H8eRD945ByvOnDguhysq50REFg1ji1H/rUQhiNg
   i1Nk8Ju2mXdc64LAwWIHnbI0/ubtBP+YHwC3jbHjzlUlCUKblNiXgsga5
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 69219510
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:RtEwra59ti4SouPIcWGPvgxRtBXHchMFZxGqfqrLsTDasY5as4F+v
 mofXm3SM/vZN2X0Koh2YN/l/U4AuZPcxodhGQJp/ygzHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YPjWVvX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurT3FyQ2EbzPqt85XkADEHtsH4Z85ZnYdC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsWvG1gyjfIS+4rW5nZT43B5MNC3Sd2jcdLdRrbT
 5RIM2M+MU2YC/FJEklIC8kxhviXukilWTx7t1jW+Jg5slGGmWSd15CyaYGIK7RmX/59hV2Er
 2jL+2D4BBAyN9GFzzeBtHW2iYfngifTSI8UUrqi+ZZCgkCXx2EVIA0bUx28u/bRol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJ4Eec39QWMwar8+BuCCy4PSTspVTA9nJZoH3pwj
 AbPxo63Q2w02FGIdZ6D3vDKjiydKCsnFksPPHQHFxknyOP+hp5m23ojUe1fOKKyi9T0HxT5z
 DaLsDUyit0vsCIb60mo1QuZ2mzx//AlWiZwv1yKBTz9smuVcab/P+SVBU7nAeGsxWpzZn2Ip
 zA6lseX94ji5rndxXXWEI3h8FxEjstp0QEwY3YyRvHNFBz3ohZPmLy8Bhkkfy+F1e5eJVfUj
 Lf741852XOqFCLCgVVLS4ywEd826qPrCM7oUPvZBvIXPMQuJF/YoX4/PxDNt4wIrKTKuftjU
 Xt8WZzxZUv29Iw9lGbmLwvj+eFDKt8CKZP7GsmgkkXPPUu2b3+JU7YVWGZinchihJ5oVD79q
 o4FX+PTkk03eLSnPkH/rN5CRXhXfCNTLc2n9KRqmhurf1MO9JcJUKSKn9vMuuVNwsxoqws/1
 irkCxEClwan2yGvxMfjQikLVY4DlK1X9RoTVRHA937ys5T/Se5DNJsiSqY=
IronPort-HdrOrdr: A9a23:DnSDdqnEl1esVc5er5N7tKYaip3pDfIm3DAbv31ZSRFFG/Fxl6
 iV88jzsiWE7Qr5OUtQ/uxoV5PgfZqxz/NICOoqTNWftWvd2FdARbsKheCJ/9SJIVybygc378
 ldmsZFZOEYdWIK7vrH3A==
X-IronPort-AV: E=Sophos;i="5.90,201,1643691600"; 
   d="scan'208";a="69219510"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v10 5/7] build: specify source tree in include/ for prerequisite
Date: Tue, 22 Mar 2022 11:22:36 +0000
Message-ID: <20220322112238.1117737-6-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220322112238.1117737-1-anthony.perard@citrix.com>
References: <20220322112238.1117737-1-anthony.perard@citrix.com>
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
Acked-by: Jan Beulich <jbeulich@suse.com>
---

Notes:
    v10:
    - acked
    
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


