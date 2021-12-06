Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D0246A279
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:09:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239538.415540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHUA-0001Vz-7p; Mon, 06 Dec 2021 17:09:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239538.415540; Mon, 06 Dec 2021 17:09:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHU9-00015k-CO; Mon, 06 Dec 2021 17:09:05 +0000
Received: by outflank-mailman (input) for mailman id 239538;
 Mon, 06 Dec 2021 17:09:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHQ2-0005ta-19
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:04:50 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9de2d1a9-56b6-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 18:04:49 +0100 (CET)
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
X-Inumbo-ID: 9de2d1a9-56b6-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810288;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TRgfprArJiMn7DHfVSl2ZO32FkfcY3fIM9au9u7h+C8=;
  b=Ae7pEEwaDCij3PCSLcwxgt/gbCox+XhaoJ1tATux5kxoxLJi9AONo16b
   TctbhNcLMvX85LPRmf1f1nYldCRQW7b+DNByLWAzmAxgSQbRHOM3xQsZ4
   0Ix6XvVy44Cdpsd2yRpwboTrbQ8sbZOogvnNrL1DIDJEGTmkbdq+gtbpd
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: AG/RYGxOdGeT1KPb7BH6o2MK689W9LDGxCwOyK2xPWwW1dFft0tUVE1q8fB6mslsLNYg7nzv9F
 R1bKxMymAgmlc7/k8SCO0ShxIeglfqvAcP7PwapiVpU+iWL1LvC5C8deF5WDlwPwCPmClpO+96
 3DCy2APEQNJDgwSZy5iyY/AfROnQ/ac/F6K1VpGIktLSbDhZ9YVf13t5DCwCC5GiJ7XWqO1IrR
 XuaKT5RUj/uvRN0tn39ERJuTmb4WvrDY5SgxMZ6MKbNzxckewEpzgWx3VhUoyW9pNAbde7UdVL
 VCOEhIHrp78XrUTzXcuRpNuu
X-SBRS: 5.1
X-MesageID: 59766580
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:c917V67A+5WdjtjNkNlUSwxRtK/AchMFZxGqfqrLsTDasY5as4F+v
 mVNXDuGOKmNazT9c4x+bY63pkkB7MOAxtNhGVY6/yAwHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdj2tAw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zj
 +9v7sKtYiEQBqycne9eXjcFLjwjFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gTTKmAO
 ZdJMVKDajyQQQIIAlhOJ6glkeazg0v6dzRbg1Oa8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u13/wBwwXMJqDyTuP+2+omsfCmzi+XJMVEvu/7PECqF+c3GsIEzUNSEC25/K+jyaWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8Uz7h2NzazFpR6UHGEeQhZObdUnsIk9QjlC/
 l6Wnfv5CDp3qrqXRHmBsLCOoluP1TM9dDFYI3VeFE1cvoel8NpbYg/zoshLV5SX1YPoMhfJ+
 zHaqSN9iptOsNNW/vDulbzYuA6Eqp/MRw8zwwzYWGO58w90DLKYi5yUBUvztqgZctvAJrWVl
 D1dwpXFsrhSZX2YvHXVGL1lIV2/2xqS3NQwa3ZLFoJpyTmi8mXLkWt4sGAnfxcB3irplFbUj
 K7vVeF5ucY70JiCN/Yfj2eN5yICl/KI+TPNDK+8Uza2SsItHDJrBQk3DaJq40jjkVI3jYY0M
 oqBfMCnAB4yUPo8nGXsFrpHi+F0lkjSIF8/o7ihlXxLNpLEOxaopUotagPSPojVEovayOkqz
 zqvH5TTkEgOOAEPSiLW7ZQSPTg3wYsTXvjLRzhsXrfbeGJOQTh5Y9eImO9JU9E1zsx9y7aTl
 lngCxAw9bYKrSCeQel8Qis4M+2HsFcWhS9TABHAyn70gSV+Otj2s/9EH3b1FJF+nNFeITdPZ
 6FtU6297j5nE1wrIhwRMsvwqpJMbhOuiV7cNiapemFnLZVhWxbI6pnveQ62rHsCCS++tM0fp
 by811yEHcpfFlo6VMuGOuiyy16RvGQGnL4gVUX/PdQOKl7n95JnKnKtg6Zvcd0MMxjK2hCTy
 x2SXUUDveDIroJsqIvJiKmIop2HCex7GkYGTWDX4azvbXvR/3a5wJ8GW+GNJGiPWGTx8aSkR
 ONU0/Cjb6FXwAcU69JxSu85w7g/6t3jo65h4j5lRHibPU62Dr5AI2Wd2ZUdvKN62bIE6xC9X
 ViC+4cGNOzRat/lClMYOCEscv+HiaMPgjDX4Pk4fBf66Stw8ObVWEleJUDR2ilULb8zO4I52
 +Yx/sUR7lXn2BYtN9+HiAFS9niNcSNcA/l26MlCDd+5kBcvx3FDfYfYW33/75y4YtlRNlUnf
 22Pj63YirUAnkfPfhLfz5QWMTaxUXjWhC138Q==
IronPort-HdrOrdr: A9a23:qUHjW6vrVHF9h3RKqsW01J8X7skDcNV00zEX/kB9WHVpmszxra
 +TdZMgpHjJYVcqKQgdcL+7WZVoLUmwyXcx2/hyAV7AZniDhILLFuFfBOLZqlWKcREWtNQtsJ
 uIG5IObuEYZmIVsS+V2mWF+q4bsbq6zJw=
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="59766580"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>, Juergen Gross
	<jgross@suse.com>
Subject: [XEN PATCH 55/57] tools/xenstore: introduce Makefile.common to be used by stubdom
Date: Mon, 6 Dec 2021 17:02:38 +0000
Message-ID: <20211206170241.13165-56-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Also change stubdom to depends on Makefile.common.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 stubdom/Makefile               |  4 ++--
 tools/xenstore/Makefile        | 34 +++-------------------------------
 tools/xenstore/Makefile.common | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 39 insertions(+), 33 deletions(-)
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
index 7fe1d9c1e2..a6fc917b81 100644
--- a/tools/xenstore/Makefile
+++ b/tools/xenstore/Makefile
@@ -1,36 +1,11 @@
 XEN_ROOT=$(CURDIR)/../..
 include $(XEN_ROOT)/tools/Rules.mk
 
+include Makefile.common
+
 MAJOR = 3.0
 MINOR = 3
 
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
-XENSTORED_OBJS-$(CONFIG_SunOS) += xenstored_solaris.o xenstored_posix.o xenstored_probes.o
-XENSTORED_OBJS-$(CONFIG_NetBSD) += xenstored_posix.o
-XENSTORED_OBJS-$(CONFIG_FreeBSD) += xenstored_posix.o
-XENSTORED_OBJS-$(CONFIG_MiniOS) += xenstored_minios.o
-
-$(XENSTORED_OBJS-y): CFLAGS += $(CFLAGS_libxengnttab)
-
 xenstored: LDLIBS += $(LDLIBS_libxenevtchn)
 xenstored: LDLIBS += $(LDLIBS_libxengnttab)
 xenstored: LDLIBS += $(LDLIBS_libxenctrl)
@@ -81,9 +56,6 @@ endif
 xenstored: $(XENSTORED_OBJS-y)
 	$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@ $(APPEND_LDFLAGS)
 
-xenstored.a: $(XENSTORED_OBJS-y)
-	$(AR) cr $@ $^
-
 $(CLIENTS): xenstore
 	ln -f xenstore $@
 
@@ -97,7 +69,7 @@ xs_tdb_dump: xs_tdb_dump.o utils.o tdb.o talloc.o
 	$(CC) $(LDFLAGS) $^ -o $@ $(APPEND_LDFLAGS)
 
 .PHONY: clean
-clean:
+clean::
 	rm -f *.a *.o xenstored_probes.h
 	rm -f $(TARGETS)
 	$(RM) $(DEPS_RM)
diff --git a/tools/xenstore/Makefile.common b/tools/xenstore/Makefile.common
new file mode 100644
index 0000000000..49002651a1
--- /dev/null
+++ b/tools/xenstore/Makefile.common
@@ -0,0 +1,34 @@
+# Makefile shared with stubdom
+
+XENSTORED_OBJS-y := xenstored_core.o xenstored_watch.o xenstored_domain.o
+XENSTORED_OBJS-y += xenstored_transaction.o xenstored_control.o
+XENSTORED_OBJS-y += xs_lib.o talloc.o utils.o tdb.o hashtable.o
+
+XENSTORED_OBJS-$(CONFIG_Linux) += xenstored_posix.o
+XENSTORED_OBJS-$(CONFIG_SunOS) += xenstored_solaris.o xenstored_posix.o xenstored_probes.o
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
+	rm -f *.a *.o
-- 
Anthony PERARD


