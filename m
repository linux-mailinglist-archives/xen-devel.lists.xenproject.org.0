Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1D6590546
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 18:59:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384910.620502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBXB-0007as-3n; Thu, 11 Aug 2022 16:59:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384910.620502; Thu, 11 Aug 2022 16:59:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBXA-0007HC-Nz; Thu, 11 Aug 2022 16:59:48 +0000
Received: by outflank-mailman (input) for mailman id 384910;
 Thu, 11 Aug 2022 16:59:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jhQd=YP=citrix.com=prvs=21531f474=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oMBNB-0003Aq-Sj
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 16:49:30 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8fcff216-1995-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 18:49:28 +0200 (CEST)
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
X-Inumbo-ID: 8fcff216-1995-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660236568;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fS+wXyRWRj324Cveg5Ri5jEcXsCtRAlbPU6C8RaaQxw=;
  b=e++SsEIb7gtIJfdACUDP2J7sMTsGBYhLMH+y6zGxrVhjuWMkzhvhkGoS
   8WbG3Bp/HCMLI0aG8hoxXSPI9pgyAD6Dn5hdEb1/qqVPJPg47bd9s7msC
   shE2uujHFnLn2CxXDUAZH7f/GN7xaUWLiqUI7icQMoh1ct+7INMHpTiVZ
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77650143
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Z7wPEKiqgzY37ADrzRBYJInmX161ChAKZh0ujC45NGQN5FlHY01je
 htvXW7Xa67YMGrzLop1a422oBtSvpLdzIBjHgRrpCk0QSkb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglaQr414rZ8Ek15KSr4WtC1rADTasjUGH2xiF94K03fcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aua60Tqm0xK6aID76vR2nQQg075TCRYpQRw/ZwNlPTxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJQWXAP6I0DuKhPRL/tS4E4ePdxG9/0tX2V30
 /UqDxoiNS6ijMzo+efuIgVsrpxLwMjDOYoevjdrzC3DDOZgSpfGK0nIzYYGhnFq3JkIRKuAI
 ZpCAdZsRE2ojxlnM1ELCJU4jaGwi2P2aTFwo1OJv6snpWPUyWSd1ZCyb4SIIoXWHq25mG7Cg
 m34oGfbBy04E+6ZwDaarViRhuPAyHaTtIU6S+Tjq68CbEeo7nMXIA0bUx28u/bRokqjUNsZJ
 UUS8ScqqbUa/VauCNL6WnWQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3PLaXhRzi
 AXPxYmwQ2Uy7vvFEhpx64t4sxuyaHYYNjVcYRYiRDkiyfa4nqA4oEz2G4ML/LGOsjHlJd3h6
 2nU8nBm1upK1JBjO7aTpg6e3W/1znTdZktsv1iMADr4hu9sTNT9D7FE/2Q3+hqpwGyxalCa9
 EYJlMGFhAzlJcHczXfdKAnh8VzA2hpkDNE/qQQ2d3XZ327xk0NPhKgJiN2EGG9nM9wfZRjia
 1LJtAVa6fd7ZSX0NfcoO9vgW5lwl8AM8OgJsdiKBuein7ArLFPXlM2QTRf4M5/RfLgEzvhkZ
 MbznTeEBncGE6V3pAeLqxMm+eZynkgWmDKMLa0XOjz9jtJyklbJFupeWLZPB8hlhJ65TPL9r
 48Da5fXkEUDCYUToED/qOYuELzDFlBjbbieliCdXrfrztZOcI35N8Ls/A==
IronPort-HdrOrdr: A9a23:rsaVJqPdi++MN8BcTvmjsMiBIKoaSvp037Eqv3oedfUzSL3/qy
 nOpoVi6faaslYssR0b9exofZPwJE80lqQFhrX5X43SPzUO0VHAROoJgLcKgQeQfxEWntQtrJ
 uIGJIeNDSfNzdHZL7BkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="77650143"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Luca Fancellu
	<luca.fancellu@arm.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v4 18/32] tools/helper: Cleanup Makefile
Date: Thu, 11 Aug 2022 17:48:31 +0100
Message-ID: <20220811164845.38083-19-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811164845.38083-1-anthony.perard@citrix.com>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Use $(TARGETS) to collect targets. Use := for the first target instead
of +=.
Collect library to link against in $(LDLIBS).
Remove extra "-f" flags that is already part of $(RM).

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Tested-by: Luca Fancellu <luca.fancellu@arm.com>
---

Notes:
    v4:
    - use := for the first TARGETS
    v3:
    - apply changes to the new "init-dom0less" helper.
    - make use of the new macro $(xenlibs-ldlibs,)

 tools/helpers/Makefile | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/tools/helpers/Makefile b/tools/helpers/Makefile
index 8d78ab1e90..09590eb5b6 100644
--- a/tools/helpers/Makefile
+++ b/tools/helpers/Makefile
@@ -5,13 +5,13 @@
 XEN_ROOT = $(CURDIR)/../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-PROGS += xen-init-dom0
+TARGETS := xen-init-dom0
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


