Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A54FE4C4887
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 16:16:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279286.477000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcKs-0001uH-GM; Fri, 25 Feb 2022 15:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279286.477000; Fri, 25 Feb 2022 15:16:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcKs-0001l2-5Q; Fri, 25 Feb 2022 15:16:46 +0000
Received: by outflank-mailman (input) for mailman id 279286;
 Fri, 25 Feb 2022 15:16:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0Ll=TI=citrix.com=prvs=04808661d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nNcIX-0006fy-SP
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 15:14:21 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9af70695-964d-11ec-8539-5f4723681683;
 Fri, 25 Feb 2022 16:14:20 +0100 (CET)
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
X-Inumbo-ID: 9af70695-964d-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645802060;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zUPvHCMrHWztCdZF7XbOEKTRFq0ToqxKkhG98hXZpoI=;
  b=YrlaRQD5Aa33JuOGuqUBaqA1iN5OncTLT6WFT7Qy+8Jhm/zVADYaiUkv
   K/WIJpXKea3sZKGFD+c3EwABmxaEeZd3t9Z77FTWaCnN2kvQwgtg9ZpNL
   8475PuhrOUiWgzGJt7elX/Ukau4IN7RtOOiaDSx9cvVGWCuAkzWgL7dvq
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 64433090
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:OzsjYq5KZJr+Pz+KkCm9EgxRtCDHchMFZxGqfqrLsTDasY5as4F+v
 mJNCzrVb67YNDPwLd53O4q18ElTu57RyNNlHQtrqihgHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YLjXlvX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSdSRYXI/HNnt4PCRp0HiRMEJBnwePIdC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsWvG1gyjfIS+4rW5nZT43B5MNC3Sd2jcdLdRrbT
 5RFNWE0NEWYC/FJEkoaJokFsceQvHfiXhJTpVPOo5omuFGGmWSd15CyaYGIK7RmX/59gUKwt
 m/AuWPjDXkyL9Wa1DeBtG6sh+XGgCfncI8UD/i85/lsxlqJyQQ7GBAQEFe2v/S9okq/QM5Eb
 VwZ/DI0qqo//1DtScPyNzW6r2SDpQU0QMdLHqsx7wTl90bPy1/HXC5eFGcHMYF48p9tLdA36
 rOXt/7pFAJy7LyTc2DH9ZuZqAGfBAkscWBXMEfoUjA5y9XkpYgyiDfGQdBiDLO5g7XJJN3g/
 9yZhHNg3utO1Kbnw43+pAma2Gz0+vAlWyZovl2/Y46z0u9uiGdJjaSM4EOT0/tPJZ3xorKp7
 CldwJj2AAzj4PiweM2xrAclQODBCxWtamS0bbtT838JrWXFF5mLJ9043d2GDB01WvvogBewC
 KMphStf5YVIIFyhZrJtboS6BqwClPa8SIu5D6yJNoIWOvCdkTNrGgk0NCZ8OEi3zSARfVwXY
 8/HIa5A815AYUiY8NZGb7hEiuJ6rszP7WjSWYr633yaPUm2PxaopUM+GALWNIgRtfrcyC2Mq
 oo3H5bamn13DbylCgGKoNF7ELz/BSVibXwAg5cMLbDrz8sPMDxJNsI9Npt6I901x/kOz7yQl
 px/M2cBoGfCabT8AV3iQhhehHnHB/6TcVpT0fQQAGuV
IronPort-HdrOrdr: A9a23:86t1jq2sqHlSKlmk7QFdrgqjBLQkLtp133Aq2lEZdPRUGvb2qy
 nIpoV96faUskdpZJhOo7G90cW7LE80sKQFg7X5Xo3SODUO2lHJEGgK1+KLqFfd8m/Fh4tgPM
 9bAs5D4bbLY2SS4/yX3ODBKadC/OW6
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="64433090"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Wei Liu <wl@xen.org>, Samuel Thibault
	<samuel.thibault@ens-lyon.org>
Subject: [XEN PATCH v2 26/29] tools/xenstore: introduce Makefile.common to be used by stubdom
Date: Fri, 25 Feb 2022 15:13:18 +0000
Message-ID: <20220225151321.44126-27-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225151321.44126-1-anthony.perard@citrix.com>
References: <20220225151321.44126-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Also change stubdom to depends on Makefile.common.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---

Notes:
    v2:
    - reviewed

 stubdom/Makefile               |  4 ++--
 tools/xenstore/Makefile        | 33 +++------------------------------
 tools/xenstore/Makefile.common | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 38 insertions(+), 32 deletions(-)
 create mode 100644 tools/xenstore/Makefile.common

diff --git a/stubdom/Makefile b/stubdom/Makefile
index fbc63a5063..6b804824ba 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -371,10 +371,10 @@ endef
 
 $(foreach lib,$(STUB_LIBS),$(eval $(call BUILD_lib,$(lib))))
 
-xenstore/stamp: $(XEN_ROOT)/tools/xenstore/Makefile
+xenstore/stamp: $(XEN_ROOT)/tools/xenstore/Makefile.common
 	$(do_links)
 
-xenstorepvh/stamp: $(XEN_ROOT)/tools/xenstore/Makefile
+xenstorepvh/stamp: $(XEN_ROOT)/tools/xenstore/Makefile.common
 	$(do_links)
 
 LINK_DIRS := xenstore xenstorepvh $(foreach dir,$(STUB_LIBS),libs-$(XEN_TARGET_ARCH)/$(dir))
diff --git a/tools/xenstore/Makefile b/tools/xenstore/Makefile
index 830052c65f..1b66190cc5 100644
--- a/tools/xenstore/Makefile
+++ b/tools/xenstore/Makefile
@@ -1,31 +1,7 @@
 XEN_ROOT=$(CURDIR)/../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-CFLAGS += -Werror
-# Include configure output (config.h)
-CFLAGS += -include $(XEN_ROOT)/tools/config.h
-CFLAGS += -I./include
-CFLAGS += $(CFLAGS_libxenevtchn)
-CFLAGS += $(CFLAGS_libxenctrl)
-CFLAGS += $(CFLAGS_libxenguest)
-CFLAGS += $(CFLAGS_libxentoolcore)
-CFLAGS += -DXEN_LIB_STORED="\"$(XEN_LIB_STORED)\""
-CFLAGS += -DXEN_RUN_STORED="\"$(XEN_RUN_STORED)\""
-
-ifdef CONFIG_STUBDOM
-CFLAGS += -DNO_SOCKETS=1
-endif
-
-XENSTORED_OBJS-y := xenstored_core.o xenstored_watch.o xenstored_domain.o
-XENSTORED_OBJS-y += xenstored_transaction.o xenstored_control.o
-XENSTORED_OBJS-y += xs_lib.o talloc.o utils.o tdb.o hashtable.o
-
-XENSTORED_OBJS-$(CONFIG_Linux) += xenstored_posix.o
-XENSTORED_OBJS-$(CONFIG_NetBSD) += xenstored_posix.o
-XENSTORED_OBJS-$(CONFIG_FreeBSD) += xenstored_posix.o
-XENSTORED_OBJS-$(CONFIG_MiniOS) += xenstored_minios.o
-
-$(XENSTORED_OBJS-y): CFLAGS += $(CFLAGS_libxengnttab)
+include Makefile.common
 
 xenstored: LDLIBS += $(LDLIBS_libxenevtchn)
 xenstored: LDLIBS += $(LDLIBS_libxengnttab)
@@ -65,9 +41,6 @@ clients: xenstore $(CLIENTS) xenstore-control
 xenstored: $(XENSTORED_OBJS-y)
 	$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@ $(APPEND_LDFLAGS)
 
-xenstored.a: $(XENSTORED_OBJS-y)
-	$(AR) cr $@ $^
-
 $(CLIENTS): xenstore
 	ln -f xenstore $@
 
@@ -81,8 +54,8 @@ xs_tdb_dump: xs_tdb_dump.o utils.o tdb.o talloc.o
 	$(CC) $(LDFLAGS) $^ -o $@ $(APPEND_LDFLAGS)
 
 .PHONY: clean
-clean:
-	$(RM) *.a *.o $(TARGETS) $(DEPS_RM)
+clean::
+	$(RM) $(TARGETS) $(DEPS_RM)
 
 .PHONY: distclean
 distclean: clean
diff --git a/tools/xenstore/Makefile.common b/tools/xenstore/Makefile.common
new file mode 100644
index 0000000000..21b78b0538
--- /dev/null
+++ b/tools/xenstore/Makefile.common
@@ -0,0 +1,33 @@
+# Makefile shared with stubdom
+
+XENSTORED_OBJS-y := xenstored_core.o xenstored_watch.o xenstored_domain.o
+XENSTORED_OBJS-y += xenstored_transaction.o xenstored_control.o
+XENSTORED_OBJS-y += xs_lib.o talloc.o utils.o tdb.o hashtable.o
+
+XENSTORED_OBJS-$(CONFIG_Linux) += xenstored_posix.o
+XENSTORED_OBJS-$(CONFIG_NetBSD) += xenstored_posix.o
+XENSTORED_OBJS-$(CONFIG_FreeBSD) += xenstored_posix.o
+XENSTORED_OBJS-$(CONFIG_MiniOS) += xenstored_minios.o
+
+CFLAGS += -Werror
+# Include configure output (config.h)
+CFLAGS += -include $(XEN_ROOT)/tools/config.h
+CFLAGS += -I./include
+CFLAGS += $(CFLAGS_libxenevtchn)
+CFLAGS += $(CFLAGS_libxenctrl)
+CFLAGS += $(CFLAGS_libxenguest)
+CFLAGS += $(CFLAGS_libxentoolcore)
+CFLAGS += -DXEN_LIB_STORED="\"$(XEN_LIB_STORED)\""
+CFLAGS += -DXEN_RUN_STORED="\"$(XEN_RUN_STORED)\""
+
+ifdef CONFIG_STUBDOM
+CFLAGS += -DNO_SOCKETS=1
+endif
+
+$(XENSTORED_OBJS-y): CFLAGS += $(CFLAGS_libxengnttab)
+
+xenstored.a: $(XENSTORED_OBJS-y)
+	$(AR) cr $@ $^
+
+clean::
+	$(RM) *.a *.o
-- 
Anthony PERARD


