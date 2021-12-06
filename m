Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EAB46A25D
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:08:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239512.415349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHTP-0000Yu-Ox; Mon, 06 Dec 2021 17:08:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239512.415349; Mon, 06 Dec 2021 17:08:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHTP-0000Vt-IU; Mon, 06 Dec 2021 17:08:19 +0000
Received: by outflank-mailman (input) for mailman id 239512;
 Mon, 06 Dec 2021 17:08:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHP8-0005ta-Jl
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:03:54 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d822592-56b6-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 18:03:53 +0100 (CET)
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
X-Inumbo-ID: 7d822592-56b6-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810233;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=g6V0HqnXbYzHAD7EivABin1e8USUEILeVoIQJoAVubg=;
  b=iHzwURRIaMCdc37MJlnwpAC5z9q1fIivjlKiZqF8rrr8+v+cFTSQnX/F
   9A64/b1Ina9TSQvCjgNwKSAAvenKtRycXQg+Hs5xhWZGy3Udh3krm/UtM
   f7MAv6wWdJBQnUeJm4Pv0006Nn92ZxuppqTJbm1MIlR3URPJ9aU7oENYv
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 7/1qdosxqVBF3zM5qtTebA3u2rnoSw5LAZGhE+j1lAyqMYdI0LUXajeAEhx5B7gUJgQ0OlJjr/
 kUNYk8djWIPBtaXfQGRv2A8lJmTN4gnkjDvOvnpnx0orc0+Ro0NkjbjMmfViS6oZNfZEgNXSTO
 n77YSzVIFmGRkaDQasK3w2DE1XdPuRQmVw7P4dp1NqP7q+zqDQWeVkgJOA2CcQhCXLT5WuSbJD
 jdH3MyTxPqO5fLhBcx20jwPdcr/1N087hnT3L0BiVYIa3ZD2MZMkB/Sd+SqGpL35y2++ghjsjg
 PMFsjhpDZn+qBSofm7ADzWw5
X-SBRS: 5.1
X-MesageID: 59324106
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:X1KEoaklooZlzp+vnSEM0Tbo5gxnIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcW2HTOazeZmqhfNBzbo6y9UlSu5/TzocxGVBv/H01ESMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA187IMsdoUg7wbdg2NY22YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 Nlisb+JdhktB+rJxrQcawBzDgdeeoQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQKeFP
 ZZAMWQHgBLoTC9UJEwyOJACvf64ln/HYzQEug2Fqv9ii4TU5FMoi+W8WDbPQfSLWsd9jkuev
 njB/WnyHlcdLtP34SWB2mKhgKnIhyyTcJIfEvi0++BnhHWXx3cPE1sGWF2ju/67h0WiHdVFJ
 CQ88ywyra805QqzQ8P0RRGQr3uNvxpaUN1Ve9DW8ynUlPCSuVzAQDFZEHgRM7TKqfPaWxQm+
 Vuqpuz3AQUotePFSEqE3aqyjXSbbH19wXA5WQcISg4M4t/GqY41jw7SQtsLLJNZnuEZChmrn
 WnU8XFWa6E7yJdSiv7lpQyvbyeE/8CRFmYIChPrsnVJB++TTKqsfMSW5FfS9p6sx67JHwDa7
 BDodyVzhd3i7K1hdgTQGY3h/5nzvp5p1QEwZ3Y1RfHNEBz3pBaekXh4um0WGauQGp9slcXVS
 EHSoxhNw5RYIWGna6R6C6roVZ96kvKxSI6/CK+EBjarXnSXXFXdlM2JTRTPt10BbWB2yf1vU
 XtlWZjE4Ykm5VRPk2PtGrZ1PU4DzSEi32LDLa0XPDz8uYdykEW9EO9fWHPXN7hRxPrd/G39r
 oYOX+PXmk43eLCvPUHqHXs7cAliwY4TXsut9aS6t4erf2JbJY3WI6OLnO56JdU6x/89eyWh1
 ijVZ3K0AWHX3RXvQThmoFg6AF82dZog/389IwI2OlOkhyoqbYq1tf9NfJorZ7g3sudkyKcsH
 fUCfsyBBNVJSyjGpGtBPcWs8tQ6eUT5nx+KMgqkfCM7I8xqSTvW94K2ZQDo7iQPUHa67JNsv
 7262wrHapMfXAA+Xt3OYfeiwgrp73gQke5/RWXSJdxXdBm++YRmMXWp3PQ2P9sNOVPIwT7Dj
 1SaBhIRpO/spY4p8YaW2fDY/tnxS+YnRxhUBWjW67qyJBL2xGv7zN8SSvuMcBDcSHjwpPeoa
 9JKwqyuK/YAhltL7dZxSu450aIk6tLzjLZG1QA4Tm7TZlGmB748cHmL2c5D6v9EyrND4FbkX
 0uO/p9ROKmTOdOjG1kUfVJ3YuOG3PASuz/T8fVqfxmquH4ppOKKARdIIh2BqC1BN78kYooqz
 NAotNMS9wHi2AEhNcyLj3wM+mmBRpDav37Lan3O7FfXtzcW
IronPort-HdrOrdr: A9a23:TzVd8qmjgezrFwhV4p28pDhCKLrpDfIq3DAbv31ZSRFFG/Fxl6
 iV88jzsiWE7wr5OUtQ4OxoV5PgfZqxz/NICMwqTNWftWrdyQ+VxeNZjbcKqgeIc0aVygce79
 YET0EXMqyXMbEQt6jHCWeDf+rIuOP3k5yVuQ==
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="59324106"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH 29/57] tools/helper: Cleanup Makefile
Date: Mon, 6 Dec 2021 17:02:12 +0000
Message-ID: <20211206170241.13165-30-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Use $(TARGETS) to collect targets.
Collect library to link against in $(LDLIBS).
Remove extra "-f" flags that is already part of $(RM).

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/helpers/Makefile | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/tools/helpers/Makefile b/tools/helpers/Makefile
index 7f6c422440..2fe3be2f89 100644
--- a/tools/helpers/Makefile
+++ b/tools/helpers/Makefile
@@ -5,10 +5,10 @@
 XEN_ROOT = $(CURDIR)/../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-PROGS += xen-init-dom0
+TARGETS += xen-init-dom0
 ifeq ($(CONFIG_Linux),y)
 ifeq ($(CONFIG_X86),y)
-PROGS += init-xenstore-domain
+TARGETS += init-xenstore-domain
 endif
 endif
 
@@ -17,6 +17,10 @@ $(XEN_INIT_DOM0_OBJS): CFLAGS += $(CFLAGS_libxentoollog)
 $(XEN_INIT_DOM0_OBJS): CFLAGS += $(CFLAGS_libxenstore)
 $(XEN_INIT_DOM0_OBJS): CFLAGS += $(CFLAGS_libxenlight)
 $(XEN_INIT_DOM0_OBJS): CFLAGS += $(CFLAGS_libxenctrl)
+xen-init-dom0: LDLIBS += $(LDLIBS_libxenctrl)
+xen-init-dom0: LDLIBS += $(LDLIBS_libxentoollog)
+xen-init-dom0: LDLIBS += $(LDLIBS_libxenstore)
+xen-init-dom0: LDLIBS += $(LDLIBS_libxenlight)
 
 INIT_XENSTORE_DOMAIN_OBJS = init-xenstore-domain.o init-dom-json.o
 $(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += $(CFLAGS_libxentoollog)
@@ -25,27 +29,32 @@ $(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += $(CFLAGS_libxenctrl)
 $(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += $(CFLAGS_libxenstore)
 $(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += $(CFLAGS_libxenlight)
 $(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += -include $(XEN_ROOT)/tools/config.h
+init-xenstore-domain: LDLIBS += $(LDLIBS_libxentoollog)
+init-xenstore-domain: LDLIBS += $(LDLIBS_libxenstore)
+init-xenstore-domain: LDLIBS += $(LDLIBS_libxenctrl)
+init-xenstore-domain: LDLIBS += $(LDLIBS_libxenguest)
+init-xenstore-domain: LDLIBS += $(LDLIBS_libxenlight)
 
 .PHONY: all
-all: $(PROGS)
+all: $(TARGETS)
 
 xen-init-dom0: $(XEN_INIT_DOM0_OBJS)
-	$(CC) $(LDFLAGS) -o $@ $(XEN_INIT_DOM0_OBJS) $(LDLIBS_libxenctrl) $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore) $(LDLIBS_libxenlight) $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) -o $@ $(XEN_INIT_DOM0_OBJS) $(LDLIBS) $(APPEND_LDFLAGS)
 
 init-xenstore-domain: $(INIT_XENSTORE_DOMAIN_OBJS)
-	$(CC) $(LDFLAGS) -o $@ $(INIT_XENSTORE_DOMAIN_OBJS) $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxenlight) $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) -o $@ $(INIT_XENSTORE_DOMAIN_OBJS) $(LDLIBS) $(APPEND_LDFLAGS)
 
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


