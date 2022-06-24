Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB75559E2D
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 18:08:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355647.583524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lqx-0006Nd-Va; Fri, 24 Jun 2022 16:08:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355647.583524; Fri, 24 Jun 2022 16:08:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lqx-0006KY-O3; Fri, 24 Jun 2022 16:08:15 +0000
Received: by outflank-mailman (input) for mailman id 355647;
 Fri, 24 Jun 2022 16:08:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7mLY=W7=citrix.com=prvs=16756bcf7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o4lo3-0004qc-0f
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 16:05:15 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c74b4c8-f3d7-11ec-b725-ed86ccbb4733;
 Fri, 24 Jun 2022 18:05:12 +0200 (CEST)
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
X-Inumbo-ID: 6c74b4c8-f3d7-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656086712;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pBOCOfGvGT0Sraw3NBsPSjR52CXZ/ChD1FyPAVw+iMU=;
  b=eDYKIzy4K62rJW4cnEeQ+Bs3qsgnt8VpnEMqYoIpRuTxUy7eJm2vGXf3
   B34+3aABU68hK87miM18p2a8JqD7apd0Wy0GvHHbLHoNKtdYSr+yNZm8K
   docpvwKkT6rHENRN9BkpkTyAqKvprcLYeKpqVpTK0yxbg083SMS+5KgQ5
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 74362408
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:xUFXnaMa7d7XakbvrR3sl8FynXyQoLVcMsEvi/4bfWQNrUon3z0Hy
 2cYXm+DaKvbYWCkc9xzYI+x80sCuZDcyNExGwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFUMpBsJ00o5wbZn2NIw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zy
 95z9qWxVwAQMPPFyOI6Y0ECLCRDIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gRQa2AP
 ZZBOVKDajyDZTduAU5MAa4ds+eF20TbYRNGkWmK8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u13T0BFQWOcKSzRKB82mwnanfkCXjQoUQGbaksPlwjzWuKnc7UUNMEwHh+L/g1xD4C4k3x
 1EoFjQGrqMMt3WqUN7EUUOx8HijjkZGZN9tDLhvgO2S8ZY48zp1F0BdEGMfMId77JBmLdA5/
 gTXxo20XFSDpJXQECvArenM8FteLABPdQc/iTk4oRzpCjUJiKU6lVrxQ9lqC8ZZZfWlSGirk
 1hmQMXT7oj/bPLnNI3hpDgrexr2+vD0ovcdv207pF6N4AJjf5KCbIe181Xd5vsoBN/HEwfZ5
 CldxJTGtL9m4XSxeMqlGr1l8FaBt5643MD02wYzT/HNCRz3k5JcQWygyG4nfxo4Wir1UTTof
 FXSqWts2XOnB1PzNfUfS9voU6wClPG8ffy4BqG8RocfOfBZKV7YlByCkGbNhggBZmB3yvphU
 XpaGO7xZUsn5VNPlmvoHrlBju5wmEjTBwr7HPjG8vhu6pLGDFb9dFvPGAHmgjwRhE9cnDjoz
 g==
IronPort-HdrOrdr: A9a23:jbA+uqnjoAlil2h8e4qYsLG2plbpDfIq3DAbv31ZSRFFG/Fxl6
 iV88jzsiWE7wr5OUtQ4OxoV5PgfZqxz/NICMwqTNWftWrdyQ+VxeNZjbcKqgeIc0aVygce79
 YET0EXMqyXMbEQt6jHCWeDf+rIuOP3k5yVuQ==
X-IronPort-AV: E=Sophos;i="5.92,218,1650945600"; 
   d="scan'208";a="74362408"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v3 21/25] tools/helper: Cleanup Makefile
Date: Fri, 24 Jun 2022 17:04:18 +0100
Message-ID: <20220624160422.53457-22-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624160422.53457-1-anthony.perard@citrix.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Use $(TARGETS) to collect targets.
Collect library to link against in $(LDLIBS).
Remove extra "-f" flags that is already part of $(RM).

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v3:
    - apply changes to the new "init-dom0less" helper.
    - make use of the new macro $(xenlibs-ldlibs,)

 tools/helpers/Makefile | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/tools/helpers/Makefile b/tools/helpers/Makefile
index 8d78ab1e90..7c9d671b32 100644
--- a/tools/helpers/Makefile
+++ b/tools/helpers/Makefile
@@ -5,13 +5,13 @@
 XEN_ROOT = $(CURDIR)/../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-PROGS += xen-init-dom0
+TARGETS += xen-init-dom0
 ifeq ($(CONFIG_Linux),y)
 ifeq ($(CONFIG_X86),y)
-PROGS += init-xenstore-domain
+TARGETS += init-xenstore-domain
 endif
 ifeq ($(CONFIG_ARM),y)
-PROGS += init-dom0less
+TARGETS += init-dom0less
 endif
 endif
 
@@ -20,6 +20,7 @@ $(XEN_INIT_DOM0_OBJS): CFLAGS += $(CFLAGS_libxentoollog)
 $(XEN_INIT_DOM0_OBJS): CFLAGS += $(CFLAGS_libxenstore)
 $(XEN_INIT_DOM0_OBJS): CFLAGS += $(CFLAGS_libxenlight)
 $(XEN_INIT_DOM0_OBJS): CFLAGS += $(CFLAGS_libxenctrl)
+xen-init-dom0: LDLIBS += $(call xenlibs-ldlibs,ctrl toollog store light)
 
 INIT_XENSTORE_DOMAIN_OBJS = init-xenstore-domain.o init-dom-json.o
 $(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += $(CFLAGS_libxentoollog)
@@ -28,6 +29,7 @@ $(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += $(CFLAGS_libxenctrl)
 $(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += $(CFLAGS_libxenstore)
 $(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += $(CFLAGS_libxenlight)
 $(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += -include $(XEN_ROOT)/tools/config.h
+init-xenstore-domain: LDLIBS += $(call xenlibs-ldlibs,toollog store ctrl guest light)
 
 INIT_DOM0LESS_OBJS = init-dom0less.o init-dom-json.o
 $(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxentoollog)
@@ -35,30 +37,31 @@ $(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxenstore)
 $(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxenlight)
 $(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxenctrl)
 $(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxenevtchn)
+init-dom0less: LDLIBS += $(call xenlibs-ldlibs,ctrl evtchn toollog store light guest foreignmemory)
 
 .PHONY: all
-all: $(PROGS)
+all: $(TARGETS)
 
 xen-init-dom0: $(XEN_INIT_DOM0_OBJS)
-	$(CC) $(LDFLAGS) -o $@ $(XEN_INIT_DOM0_OBJS) $(LDLIBS_libxenctrl) $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore) $(LDLIBS_libxenlight) $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) -o $@ $(XEN_INIT_DOM0_OBJS) $(LDLIBS) $(APPEND_LDFLAGS)
 
 init-xenstore-domain: $(INIT_XENSTORE_DOMAIN_OBJS)
-	$(CC) $(LDFLAGS) -o $@ $(INIT_XENSTORE_DOMAIN_OBJS) $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxenlight) $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) -o $@ $(INIT_XENSTORE_DOMAIN_OBJS) $(LDLIBS) $(APPEND_LDFLAGS)
 
 init-dom0less: $(INIT_DOM0LESS_OBJS)
-	$(CC) $(LDFLAGS) -o $@ $(INIT_DOM0LESS_OBJS) $(LDLIBS_libxenctrl) $(LDLIBS_libxenevtchn) $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore) $(LDLIBS_libxenlight) $(LDLIBS_libxenguest) $(LDLIBS_libxenforeignmemory) $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) -o $@ $(INIT_DOM0LESS_OBJS) $(LDLIBS) $(APPEND_LDFLAGS)
 
 .PHONY: install
 install: all
 	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
-	for i in $(PROGS); do $(INSTALL_PROG) $$i $(DESTDIR)$(LIBEXEC_BIN); done
+	for i in $(TARGETS); do $(INSTALL_PROG) $$i $(DESTDIR)$(LIBEXEC_BIN); done
 
 .PHONY: uninstall
 uninstall:
-	for i in $(PROGS); do rm -f $(DESTDIR)$(LIBEXEC_BIN)/$$i; done
+	for i in $(TARGETS); do rm -f $(DESTDIR)$(LIBEXEC_BIN)/$$i; done
 
 .PHONY: clean
 clean:
-	$(RM) -f *.o $(PROGS) $(DEPS_RM)
+	$(RM) *.o $(TARGETS) $(DEPS_RM)
 
 distclean: clean
-- 
Anthony PERARD


