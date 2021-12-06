Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AA946A253
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:07:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239493.415263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHSt-0003HZ-KU; Mon, 06 Dec 2021 17:07:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239493.415263; Mon, 06 Dec 2021 17:07:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHSs-00034S-I7; Mon, 06 Dec 2021 17:07:46 +0000
Received: by outflank-mailman (input) for mailman id 239493;
 Mon, 06 Dec 2021 17:07:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHPP-0005ti-0k
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:04:11 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8684aff7-56b6-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 18:04:09 +0100 (CET)
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
X-Inumbo-ID: 8684aff7-56b6-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810249;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HYzxa9IJ0gs1g2ZQBPATfpRkikT39MPJWLs4P8HFYcY=;
  b=RaWmFIHpTc4H59/E6Q1dMIU1PaQZmh1v41GwfSd1VaIK4BmzwInlVtot
   eNSDNeaoY8jFW/bvdELpxoOnBY5ZIDbHavizOWf5S5lHuz5e26phP7jna
   Aaz+ncRTQBiDBLLoLi9Gs7UtHoPAOvkxNA9b1M55KOVgax7jjeqDh1nY5
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: PMFEPc+L8bkSjMM1BsImfIQ/8HRwMqQdH5O+591xy3I2KyxaSv59Y3B/fEAZqVJOsHufkVvtZo
 9IxObt2WtsY2qFYZ6TZYMhI5sHUZzuX+S3Zy3CIE03FdM6MPUIsoPDEgDSWLqeg/f5Mh3yArCm
 qKe67eEpZ9DvkE4VMU8RvC+vDdSUQ6p2byrW/k7qUAvRHrA++PPfN3y5tNMGVwQanE0iAQdnAA
 UH7sL84CMfG9fASDgSrsyrB22fLgkPh750njAnvHRlpewf7hb+9bbjQdIObYEiv4s1SXvAnOt1
 6ZHC1rebJ9FUWTJF6Ahiod54
X-SBRS: 5.1
X-MesageID: 61420789
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:+sF+Z6Oe3UH/4cnvrR1DkMFynXyQoLVcMsEvi/4bfWQNrUon0jEGn
 WQXXT2BOPnbYzH8ed1xPoXj9UtXuMPdnN9rGgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6bUsxNbVU8En5400o9w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYo2Wrg9l7w
 ttzjrjucAEkb/KPkbVaSgYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YuBqmsQkKtitJI4Fs2ts5TrYEewnUdbIRKCiCdpwgm5s3JgRTae2i
 8wxYCFyVSjmXQV0H3wuKo4inb6ln2X2bGgNwL6SjfVuuDWCpOBr65DsL9j9atGMXd9SnEuTu
 iTB5WuRKg4eHMySz3yC6H3Erv/Cm2b3VZwfEJW89+V2mxuDy2oLEhoUWFCn5/6jhSaWUtRDK
 0sS62w2oLI77kCDQdz0Xhn+q3mB1iPwQPIJTbd8slvUjPOJvUDJXQDoUwKtdvR2ltM/TzYk6
 GStwervCG0w87TEDmuCo+L8QSyJBQAZKmoLZCkhRAQD4sX+rIxbsi8jXuqPA4bu0ISrRGiYL
 ySi6XFn2u5N1ZJjO7CTpAif21qRSo71ohnZD+k9dkas9UtHaYGsfOREAnCLvK8bfO51orRs1
 UXoevRyDshTVPlhdwTXGY3h+Y1FAd7falUwZnY1QPEcG8yFoSLLQGypyGgWyL1VGsgFYyT1R
 0TYpBlc4pReVFPzM/QnPNjgVp5wk/ewfTgAahwyRoAUCnSWXFXYlByCmGbKhzy9+KTSuf9X1
 WinnTaEUi9BVPUPIMueTOYBy747rh3SNkuILa0XOy+PiOLEDFbMEO9tGALXMogRsfPVyC2Io
 o03H5bblH1ivBjWP3C/HXg7dgtRcxDWxPne9qRqSwJ0ClY8RTx6VaaOmehJlk4Mt/09q9okN
 0qVAidwoGcTT1WdQelTQnw8Or7pQ7hlqnc3YX4lMVqygiBxaoez9qYPMZAweOB/puBkyPd1S
 dgDetmBXasTGmiWpWxFYMmvtpFmeTSqmRmKY3ivbg8gcsMyXAfO4NLlIFfirXFcEiqtuMIii
 LS8zQeHE4EbTgFvAZ+OOvKixl+8p1YHn+d2UxeaK9VfYhy0ooNrNzbwnrk8JMRVcUfPwT6T1
 gC3BxYEpLaS/99poYeR3a3d9tWnCepzGEZeDlL317fuOHmI5HenzK9BTP2MIWLXWlTr9fjwf
 u5S1fz9bqEKxQ4Yr4pmHr935qsi/N+z9aRCxwFpEXiXPVSmDrRsfiuP0cVV7/Afw7ZYvU29W
 16V+8kcMrKMYZu3HFkULQsjT+KCyfBLxWWCsaVreB33tH1t4b6KcUROJB3d2iVSIYx8PJ4h3
 ep86tUd7Bayi0ZyP9uL5syOG79g8pDUv30bi6wn
IronPort-HdrOrdr: A9a23:Od3UPKqI97AP6oVSHMwMHv8aV5oteYIsimQD101hICG8cqSj+P
 xG+85rsiMc6QxhIU3I9urgBEDtex7hHNtOkOss1NSZLW3bUQmTTL2KhLGKq1aLJ8S9zJ856U
 4JSdkZNDSaNzZHZKjBjDVQa+xQo+W6zA==
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="61420789"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH 37/57] tools/xentop: rework makefile
Date: Mon, 6 Dec 2021 17:02:20 +0000
Message-ID: <20211206170241.13165-38-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add "xentop" to "TARGETS" because this variable will be useful later.

Always define all the targets, even when configured with
--disable-monitor, instead don't visit the subdirectory.
This mean xentop/ isn't visited anymore during "make clean" that's how
most other subdirs in the tools/ works.

Also add missing "xentop" rules. It only works without it because we
still have make's built-ins rules and variables, but fix this to not
have to rely on them.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/Makefile        |  2 +-
 tools/xentop/Makefile | 19 ++++++++-----------
 2 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/tools/Makefile b/tools/Makefile
index 79b4c7e3de..0c1d8b64a4 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -17,7 +17,7 @@ SUBDIRS-$(CONFIG_XCUTILS) += xcutils
 SUBDIRS-$(CONFIG_X86) += firmware
 SUBDIRS-y += console
 SUBDIRS-y += xenmon
-SUBDIRS-y += xentop
+SUBDIRS-$(XENSTAT_XENTOP) += xentop
 SUBDIRS-y += libfsimage
 SUBDIRS-$(CONFIG_Linux) += vchan
 
diff --git a/tools/xentop/Makefile b/tools/xentop/Makefile
index 0034114684..1e52b29b37 100644
--- a/tools/xentop/Makefile
+++ b/tools/xentop/Makefile
@@ -13,24 +13,23 @@
 XEN_ROOT=$(CURDIR)/../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-ifneq ($(XENSTAT_XENTOP),y)
-.PHONY: all install xentop uninstall
-all install xentop uninstall:
-else
-
 CFLAGS += -DGCC_PRINTF -Werror $(CFLAGS_libxenstat)
 LDLIBS += $(LDLIBS_libxenstat) $(CURSES_LIBS) $(TINFO_LIBS) $(SOCKET_LIBS) -lm
 CFLAGS += -DHOST_$(XEN_OS)
 
 # Include configure output (config.h)
 CFLAGS += -include $(XEN_ROOT)/tools/config.h
-LDFLAGS += $(APPEND_LDFLAGS)
+
+TARGETS := xentop
 
 .PHONY: all
-all: xentop
+all: $(TARGETS)
+
+xentop: xentop.o
+	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS) $(APPEND_LDFLAGS)
 
 .PHONY: install
-install: xentop
+install: all
 	$(INSTALL_DIR) $(DESTDIR)$(sbindir)
 	$(INSTALL_PROG) xentop $(DESTDIR)$(sbindir)/xentop
 
@@ -38,11 +37,9 @@ install: xentop
 uninstall:
 	rm -f $(DESTDIR)$(sbindir)/xentop
 
-endif
-
 .PHONY: clean
 clean:
-	rm -f xentop xentop.o $(DEPS_RM)
+	rm -f $(TARGETS) xentop.o $(DEPS_RM)
 
 .PHONY: distclean
 distclean: clean
-- 
Anthony PERARD


