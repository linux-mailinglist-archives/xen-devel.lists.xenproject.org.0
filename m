Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B5145DB8D
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:47:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231301.400303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF6J-0007aw-7k; Thu, 25 Nov 2021 13:47:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231301.400303; Thu, 25 Nov 2021 13:47:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF6I-0007Da-Kd; Thu, 25 Nov 2021 13:47:46 +0000
Received: by outflank-mailman (input) for mailman id 231301;
 Thu, 25 Nov 2021 13:47:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqF0R-00076i-MN
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:41:43 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c38fcfb-4df5-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 14:41:42 +0100 (CET)
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
X-Inumbo-ID: 6c38fcfb-4df5-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847702;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OsKJvcTnM3GGC2/leNBoxzvD1HK4BcTwvqLEsU81iFo=;
  b=QVNcpslMLuk8zIuy6mpmIU5RHsJBZgsH9PozpfVpPltSdtMSkj6wjsSh
   Hb0F918twzOyWKGUfk4Jm9Yy900MW0ZRwq2lGAd8dIgpMq6AAroj+Tz8u
   CKVtc+JHssbuhp4qrxfyJ7yaCrwW25qkgl7GuB017/fLVgIw2QaKW2/Vr
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: kjW6lYmqIINNFnmqMeEW+BPRR5neMNRzbOvX7xVTZ6Q/QIYJ7w2aYpztOjuDGNhr0Q1Jh6QxMT
 yAbJPBuRj0oLl71wXqkFc42qU4Jph9b7y9o41KCjqrJuWsWo4GQAo//SFmUTnZV2Uix5chyvZR
 jW+w1DBJ7Dry56KffZL5wytNKWxy7AjTYIZRpUOExVpHaHj3rMJwaNHtQ1TZY72OL+49Koul++
 aRyg+gWMz0/buTBMdTlezpZs7v9aRhRRsO2dIUUsNyJWY/swt9I2RqrIiLbsON9/COFbkO+K3b
 p8ezde/N4Q0M6oaRtOCq5Kjn
X-SBRS: 5.1
X-MesageID: 58637871
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:YLXLKKmUtERygeINd4HDZhno5gx8IURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbWGCDPa3eYzSnf4wiO4u09EMGsJLcytZrQQVqqihkESMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA187IMsdoUg7wbdg29Q12YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 P5st7mBbh85BfePoPgwTEdETiZBL7ITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQKaAP
 JVJNmMHgBLoQixwZU9QNJ4E2/qkgGLnTQUF8V2vqv9ii4TU5FMoi+W8WDbPQfSIWMFUk0Cwt
 m/AuWPjDXkyL8eDwDCI9natgO7nni7hXo8WUrqi+ZZCn1m71mEVThoMWjOTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYdRNh4A+A88BuKyKff/0CeHGdsZjxLZcEitcQ2bSc3z
 VLPlNTsbQGDq5XMFyjbrO3N62rvZ25FdgfueBPoUyMuwtvGkaYrnimVDe5/PbHrkoDyJiPvl
 mXiQDcFu50fissC1qOe9F/Bgi6xqpWhcjPZ9jk7TUr+sFonOdfNi5iArAGCsK0edNrxokyp5
 SBcw6CjAPYy4YZhfcBnaMEEB/mX6vmMK1UwanY/TsB6p1xBF5NOFL28AQ2Sxm81ba7omhezO
 Sc/XD+9A7cJYROXgVdfOd7ZNijT5fGI+S7Zfv7VdMFSRZN6aRWK+ipjDWbJgTuyzxd9wfFuY
 8nKGSpJMZr9If45pAdaus9HieN7rszA7T+7qW/HI+SPjuPFOS/9pUYtO1qSdOEphJ5oUy2Om
 +uzw/Cikk0FOMWnO3G/2ddKcTgicChqbbir+pc/XrPSfWJb9JQJVqa5LUUJINc+wcy4V47go
 xmAZ6Ov4Aal2CCcd1zVMisLhXGGdc8XkE/X9BcEZT6As0XPq672hEvGX5doL7Qh6sJ5yvt4E
 6sMd8maW6wdQTXb4TUNK5L6qdU6JhisgAuPOQujYSQ+IME8F1CYpIe8c1u97jQKAwq2qdA6/
 ++q2DTETMdRXA9lFsvXNq6ilgvjoXgHletudELUOd0PKl70+Y1nJnWp3P86Ks0BMzvZwT6e2
 1rECBsUv7CV8YQ07MPIleaPqILwS7lyGU9THm/667eqNHaFojr/kNEYCOvRJGLTTmL5/qmmd
 N559fCkPa1VhktOvqp9D61vkfA06ezwquII1Q9jBnjKMQimU+syPnmc0MBTnaRR3bsF6xCuU
 0eC99QGa7WEPMTpTAwYKAY/N7nR0PgVnn/Z7OgvIVW87yhypeLVXUJXNhiKqSpcMLoqb991n
 bZ/4JYbu16llx4nEtealSQFpW2DI0sJX7gjqpxHUpTgjRAmyw0abJHRYsMsDEpjtzmY3pEWH
 wKp
IronPort-HdrOrdr: A9a23:T7lLD6AheAJ13f/lHemq55DYdb4zR+YMi2TC1yhKJiC9Ffbo8P
 xG/c5rrCMc5wxxZJhNo7290ey7MBHhHP1OkO0s1NWZPDUO0VHAROoJ0WKh+UyEJ8SXzJ866U
 4KScZD4bPLYWSS9fyKgzWFLw==
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="58637871"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v8 31/47] build: specify source tree in include/ for prerequisite
Date: Thu, 25 Nov 2021 13:39:50 +0000
Message-ID: <20211125134006.1076646-32-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

When doing an out-of-tree build, and thus setting VPATH,
GNU Make 3.81 on Ubuntu Trusty complains about Circular dependency of
include/Makefile and include/xlat.lst and drop them. The build fails
later due to headers malformed.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v8:
    - make use of the new "$(srcdir)" shortcut
    - move the patch ahead of the problematic patch:
        build: adding out-of-tree support to the xen build

 xen/include/Makefile | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/xen/include/Makefile b/xen/include/Makefile
index 6e80ef276fd9..f64bc293c7f4 100644
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
 
@@ -100,7 +100,7 @@ PUBLIC_C99_HEADERS := $(addprefix $(public-hdrs-path)/, $(public-c99-headers))
 $(src)/public/io/9pfs.h-prereq := string
 $(src)/public/io/pvcalls.h-prereq := string
 
-$(obj)/headers.chk: $(PUBLIC_ANSI_HEADERS) $(src)/Makefile
+$(obj)/headers.chk: $(PUBLIC_ANSI_HEADERS) $(srcdir)/Makefile
 	for i in $(filter %.h,$^); do \
 	    $(CC) -x c -ansi -Wall -Werror -include stdint.h \
 	          -S -o /dev/null $$i || exit 1; \
@@ -108,7 +108,7 @@ $(obj)/headers.chk: $(PUBLIC_ANSI_HEADERS) $(src)/Makefile
 	done >$@.new
 	mv $@.new $@
 
-$(obj)/headers99.chk: $(PUBLIC_C99_HEADERS) $(src)/Makefile
+$(obj)/headers99.chk: $(PUBLIC_C99_HEADERS) $(srcdir)/Makefile
 	rm -f $@.new
 	$(foreach i, $(filter %.h,$^),                                        \
 	    echo "#include "\"$(i)\"                                          \
@@ -118,7 +118,7 @@ $(obj)/headers99.chk: $(PUBLIC_C99_HEADERS) $(src)/Makefile
 	    || exit $$?; echo $(i) >> $@.new;)
 	mv $@.new $@
 
-$(obj)/headers++.chk: $(PUBLIC_HEADERS) $(src)/Makefile
+$(obj)/headers++.chk: $(PUBLIC_HEADERS) $(srcdir)/Makefile
 	rm -f $@.new
 	if ! $(CXX) -v >/dev/null 2>&1; then                                  \
 	    touch $@.new;                                                     \
-- 
Anthony PERARD


