Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DC44C4875
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 16:14:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279188.476869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcIB-0001d8-HJ; Fri, 25 Feb 2022 15:13:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279188.476869; Fri, 25 Feb 2022 15:13:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcIB-0001Xa-1q; Fri, 25 Feb 2022 15:13:59 +0000
Received: by outflank-mailman (input) for mailman id 279188;
 Fri, 25 Feb 2022 15:13:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0Ll=TI=citrix.com=prvs=04808661d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nNcI8-0006fy-FH
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 15:13:56 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8af36756-964d-11ec-8539-5f4723681683;
 Fri, 25 Feb 2022 16:13:54 +0100 (CET)
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
X-Inumbo-ID: 8af36756-964d-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645802034;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PsH7X2yVeRIwZGaTHcN3WknuPqURtR6v199OPOJQpsM=;
  b=eAU7I2/TBmrBo7+9gVKkVDUdQUjMBvi+VAfFXr9b2rL86r6sLqrC56kh
   KnfCDi9HVBhVX8v+U5sJ0030DqN9SO1yaV4naZiKlACsfMYjao7mcO0bs
   scDsZnFSY0eULUv4d/1Vvukv50YTpZt0cZ6IHj7X+3l6fXfANtWD1zcF+
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 67264742
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:a1ypo6ll8X08Ba4+jWCeC1Po5gyLJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcDGDVPPaNYzHwf91ya4jg8EkO6p+AzdQyTAFp+ytnRSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DjWV7V4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYSwhwPfHWs78mVSIINw0gZYpp1Jn5CC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3s3d8zTbfHLA+TIrKWani7t5ExjYgwMtJGJ4yY
 uJHNmAxMEucOXWjPH82KcwMtaShwUDgTANSkUy3m6At73bcmVkZPL/Fb4OOJ43iqd9utkSXv
 GXd5EziHwoXcteYzFKt8G+oh+LJtTP2XsQVDrLQ3u5nhhify3IeDDUSVECnur+ph0imQdVdJ
 kcIvC00osAa60iDXtT7GRqirxa5UgU0AoQKVbdgsUfUl/SSs13x6nU4oiBpatN/t5MsbmcR0
 GTZu/+3XRtAnJurYCfInluLlg+aNS8QJG4EQCYLSwoZ/tXuyL0OYgLzosVLS/Ds0ICscd3k6
 3XT9XVl2e1P5SIe//jjpTj6bySQSo8lp+LfziHeRSqb4wxwf+ZJjKT4uAGAvZ6swGt0J2RtX
 UToeeDCvYji7rnXzURhpdnh+pnztp5p1xWG3DZS82EJrWjFxpJaVdk4DMtCDEloKN0YXjTif
 VXevwhcjLcKYif3MvMuP9/pU5xypUQFKTgDfqqFBjapSsIsHDJrAQk0PRLAt4wTuBJEfV4D1
 WezLp/3UCdy5VVPxzuqXeYNuYLHNQhlrV4/savTlkz9uZLHPSb9Ye5cbDOmM7BohIvZ8V692
 4sOaKO3J+B3DbSWjt//qtVIczjn7BETWPjLliCgXrXbc1o+RTp4UKe5LHFIU9UNopm5X9zgp
 hmVMnK0AnKm7ZEbAW1mskxeVY4=
IronPort-HdrOrdr: A9a23:IzpogKgnKbNH4PsvRxw1oQxXm3BQXuIji2hC6mlwRA09TySZ//
 rBoB19726TtN9xYgBZpTnuAsm9qB/nmaKdpLNhWItKPzOW31dATrsSjrcKqgeIc0aVm9K1l5
 0QF5SWYOeAdGSS5vya3ODXKbkdKaG8gcKVuds=
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="67264742"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>, Julien Grall <julien@xen.org>
Subject: [XEN PATCH v2 11/29] tools/xenstore: Cleanup makefile
Date: Fri, 25 Feb 2022 15:13:03 +0000
Message-ID: <20220225151321.44126-12-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225151321.44126-1-anthony.perard@citrix.com>
References: <20220225151321.44126-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Regroup *FLAGS together, use $(LDLIBS).

Remove $(LDLIBS_xenstored) which was the wrong name name as it doesn't
decribe how to link to a potential libxenstored.so, instead add the
value to $(LDLIBS) of xenstored.

Add SYSTEMD_LIBS into $(LDLIBS) instead of $(LDFLAGS).

Remove the "-I." from $(CFLAGS), it shouldn't be needed.

Removed $(CFLAGS-y) and $(LDFLAGS-y). $(CFLAGS-y) is already included
in $(CFLAGS) and both aren't used anyway.

Rename ALL_TARGETS to TARGETS.
Only add programmes we want to build in $(TARGETS), not phony-targets
(replace "clients").

Store all `xenstored` objs into $(XENSTORED_OBJS-y).

Replace one $< by $^ even if there's only one dependency,
(xenstore-control).

clean: "init-xenstore-domain" isn't built here any more, so stop
trying to remove it, remove $(TARGETS). Also regroup all files to be
removed in one command, using $(RM).

Drop $(MAJOR) and $(MINOR), they aren't used anymore.

Drop ".SECONDARY:", it doesn't appear there's intermediate files that
would be deleted anymore.

Drop "tarball:" target.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v2:
    - drop MAJOR and MINOR variables
    - drop tarball rule
    - drop ".SECONDARY:"
    - rework "clean:" to have one command

 tools/xenstore/Makefile | 91 +++++++++++++++++++----------------------
 1 file changed, 43 insertions(+), 48 deletions(-)

diff --git a/tools/xenstore/Makefile b/tools/xenstore/Makefile
index c86278fdb1..830052c65f 100644
--- a/tools/xenstore/Makefile
+++ b/tools/xenstore/Makefile
@@ -1,11 +1,7 @@
 XEN_ROOT=$(CURDIR)/../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-MAJOR = 3.0
-MINOR = 3
-
 CFLAGS += -Werror
-CFLAGS += -I.
 # Include configure output (config.h)
 CFLAGS += -include $(XEN_ROOT)/tools/config.h
 CFLAGS += -I./include
@@ -16,71 +12,77 @@ CFLAGS += $(CFLAGS_libxentoolcore)
 CFLAGS += -DXEN_LIB_STORED="\"$(XEN_LIB_STORED)\""
 CFLAGS += -DXEN_RUN_STORED="\"$(XEN_RUN_STORED)\""
 
-CFLAGS  += $(CFLAGS-y)
-LDFLAGS += $(LDFLAGS-y)
+ifdef CONFIG_STUBDOM
+CFLAGS += -DNO_SOCKETS=1
+endif
 
-CLIENTS := xenstore-exists xenstore-list xenstore-read xenstore-rm xenstore-chmod
-CLIENTS += xenstore-write xenstore-ls xenstore-watch
+XENSTORED_OBJS-y := xenstored_core.o xenstored_watch.o xenstored_domain.o
+XENSTORED_OBJS-y += xenstored_transaction.o xenstored_control.o
+XENSTORED_OBJS-y += xs_lib.o talloc.o utils.o tdb.o hashtable.o
 
-XENSTORED_OBJS = xenstored_core.o xenstored_watch.o xenstored_domain.o
-XENSTORED_OBJS += xenstored_transaction.o xenstored_control.o
-XENSTORED_OBJS += xs_lib.o talloc.o utils.o tdb.o hashtable.o
+XENSTORED_OBJS-$(CONFIG_Linux) += xenstored_posix.o
+XENSTORED_OBJS-$(CONFIG_NetBSD) += xenstored_posix.o
+XENSTORED_OBJS-$(CONFIG_FreeBSD) += xenstored_posix.o
+XENSTORED_OBJS-$(CONFIG_MiniOS) += xenstored_minios.o
 
-XENSTORED_OBJS_$(CONFIG_Linux) = xenstored_posix.o
-XENSTORED_OBJS_$(CONFIG_NetBSD) = xenstored_posix.o
-XENSTORED_OBJS_$(CONFIG_FreeBSD) = xenstored_posix.o
-XENSTORED_OBJS_$(CONFIG_MiniOS) = xenstored_minios.o
+$(XENSTORED_OBJS-y): CFLAGS += $(CFLAGS_libxengnttab)
 
-XENSTORED_OBJS += $(XENSTORED_OBJS_y)
-LDLIBS_xenstored += -lrt
+xenstored: LDLIBS += $(LDLIBS_libxenevtchn)
+xenstored: LDLIBS += $(LDLIBS_libxengnttab)
+xenstored: LDLIBS += $(LDLIBS_libxenctrl)
+xenstored: LDLIBS += -lrt
+xenstored: LDLIBS += $(SOCKET_LIBS)
 
-ALL_TARGETS = clients
-ifeq ($(XENSTORE_XENSTORED),y)
-ALL_TARGETS += xs_tdb_dump xenstored
+ifeq ($(CONFIG_SYSTEMD),y)
+$(XENSTORED_OBJS-y): CFLAGS += $(SYSTEMD_CFLAGS)
+xenstored: LDLIBS += $(SYSTEMD_LIBS)
 endif
 
-ifdef CONFIG_STUBDOM
-CFLAGS += -DNO_SOCKETS=1
+xenstore: LDLIBS += $(LDLIBS_libxenstore)
+xenstore: LDLIBS += $(LDLIBS_libxentoolcore)
+xenstore: LDLIBS += $(SOCKET_LIBS)
+
+xenstore-control: LDLIBS += $(LDLIBS_libxenstore)
+xenstore-control: LDLIBS += $(LDLIBS_libxenctrl)
+xenstore-control: LDLIBS += $(LDLIBS_libxenguest)
+xenstore-control: LDLIBS += $(LDLIBS_libxentoolcore)
+xenstore-control: LDLIBS += $(SOCKET_LIBS)
+
+CLIENTS := xenstore-exists xenstore-list xenstore-read xenstore-rm xenstore-chmod
+CLIENTS += xenstore-write xenstore-ls xenstore-watch
+
+TARGETS := xenstore $(CLIENTS) xenstore-control
+ifeq ($(XENSTORE_XENSTORED),y)
+TARGETS += xs_tdb_dump xenstored
 endif
 
 .PHONY: all
-all: $(ALL_TARGETS)
+all: $(TARGETS)
 
 .PHONY: clients
 clients: xenstore $(CLIENTS) xenstore-control
 
-ifeq ($(CONFIG_SYSTEMD),y)
-$(XENSTORED_OBJS): CFLAGS += $(SYSTEMD_CFLAGS)
-xenstored: LDFLAGS += $(SYSTEMD_LIBS)
-endif
-
-$(XENSTORED_OBJS): CFLAGS += $(CFLAGS_libxengnttab)
-
-xenstored: $(XENSTORED_OBJS)
-	$(CC) $^ $(LDFLAGS) $(LDLIBS_libxenevtchn) $(LDLIBS_libxengnttab) $(LDLIBS_libxenctrl) $(LDLIBS_xenstored) $(SOCKET_LIBS) -o $@ $(APPEND_LDFLAGS)
+xenstored: $(XENSTORED_OBJS-y)
+	$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@ $(APPEND_LDFLAGS)
 
-xenstored.a: $(XENSTORED_OBJS)
+xenstored.a: $(XENSTORED_OBJS-y)
 	$(AR) cr $@ $^
 
 $(CLIENTS): xenstore
 	ln -f xenstore $@
 
 xenstore: xenstore_client.o xs_lib.o
-	$(CC) $^ $(LDFLAGS) $(LDLIBS_libxenstore) $(LDLIBS_libxentoolcore) $(SOCKET_LIBS) -o $@ $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@ $(APPEND_LDFLAGS)
 
 xenstore-control: xenstore_control.o
-	$(CC) $< $(LDFLAGS) $(LDLIBS_libxenstore) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxentoolcore) $(SOCKET_LIBS) -o $@ $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@ $(APPEND_LDFLAGS)
 
 xs_tdb_dump: xs_tdb_dump.o utils.o tdb.o talloc.o
-	$(CC) $^ $(LDFLAGS) -o $@ $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) $^ -o $@ $(APPEND_LDFLAGS)
 
 .PHONY: clean
 clean:
-	rm -f *.a *.o
-	rm -f xenstored
-	rm -f xs_tdb_dump xenstore-control init-xenstore-domain
-	rm -f xenstore $(CLIENTS)
-	$(RM) $(DEPS_RM)
+	$(RM) *.a *.o $(TARGETS) $(DEPS_RM)
 
 .PHONY: distclean
 distclean: clean
@@ -89,10 +91,6 @@ distclean: clean
 TAGS:
 	etags `find . -name '*.[ch]'`
 
-.PHONY: tarball
-tarball: clean
-	cd .. && tar -c -j -v -h -f xenstore.tar.bz2 xenstore/
-
 .PHONY: install
 install: all
 	$(INSTALL_DIR) $(DESTDIR)$(bindir)
@@ -135,6 +133,3 @@ clients-install: clients
 	done
 
 -include $(DEPS_INCLUDE)
-
-# never delete any intermediate files.
-.SECONDARY:
-- 
Anthony PERARD


