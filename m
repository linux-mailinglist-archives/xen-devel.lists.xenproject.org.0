Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 215EA46A263
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:08:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239517.415394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHTd-0002sD-Of; Mon, 06 Dec 2021 17:08:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239517.415394; Mon, 06 Dec 2021 17:08:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHTd-0002mz-IY; Mon, 06 Dec 2021 17:08:33 +0000
Received: by outflank-mailman (input) for mailman id 239517;
 Mon, 06 Dec 2021 17:08:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHPE-0005ti-Hk
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:04:00 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80ea4f3f-56b6-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 18:03:59 +0100 (CET)
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
X-Inumbo-ID: 80ea4f3f-56b6-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810238;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Kq8ZIrj5FFoEo4CvpADkcXU/4kPXXPzk2tAot7bbAmY=;
  b=bqO4YQQVfm561ukIXF2wMxutim7aL5jLqhISLCzsu3iSrmWKlwfjjuIR
   8B3ptw5+WnD8tym+VQuQeZLJv9bP4+83OyluATcBGTVq5PNtATgnvJIfI
   s+ciEVFWVCipfUYal3Nu/VWSP66XMrBP2vDhxKZMwd1XHTEyEGKSyGLu8
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 94Kj7Yjpo0IxUHdVCkmhcFS401UUiFTEzSFb9kzcVxi9CGB4Zn+w43Ax6XbQMHxeJm8WePzlK+
 y6nsB8Z4jag/WihSwHLTKPl25voTydchBjDTVqE6i+C5xLDEV+AeRlPDxpYS9y/8uyzlFuZFt/
 7QhqgjvwfDPCtojE6DtjMeSuzBmQ9jc9ji3DyQdBbNAnGL94nXNXq8t7g/gB90RddF7Tlglw5E
 +fjdHuGY38qInhWHgxwHYv901Vf2DYjZrjNG/lr9X5oWbwDzhGPu0O0OSTq+1zIPG17f0YTFUA
 AUz7p2mRon0kZxbmiT3n5fFO
X-SBRS: 5.1
X-MesageID: 58884443
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:gF3/66OSt4JW4zrvrR1DkMFynXyQoLVcMsEvi/4bfWQNrUog1DAOz
 TYdWT+BbKqPYTCned4jbI3l/R8EuZKAyIRiTgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6bUsxNbVU8En5400o9w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoxqkgfB04
 Y1uj82LFz53AKHWoLQteRYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YuBqmsQkKtitJI4Fs2ts5TrYEewnUdbIRKCiCdpwgWdg1pwSQa22i
 8wxeBF2ZhL4UjR0JHgMML8QreizqUbtWmgNwL6SjfVuuDWCpOBr65DsL9j9atGMXd9SnEuTu
 iTB5WuRKg4eHMySz3yC6H3Erv/Cm2b3VZwfEJW89+V2mxuDy2oLEhoUWFCn5/6jhSaWUtRDK
 0sS62w2oLI77kCDQdz0Xhn+q3mB1iPwQPIJTbd8slvUjPOJvUDJXQDoUwKtdvQJmdEWQBVy9
 WXYpI3QWwJjqoXFeViSo+L8QSyJBQAZKmoLZCkhRAQD4sX+rIxbsi8jXuqPA4bu0ISrRGiYL
 ySi6XFn2u5N1ZJjO7CTpAif21qRSo71ohnZD+k9dkas9UtHaYGsfOREAnCLvK8bfO51orRs1
 UXoevRyDshTVPlhdwTXGY3h+Y1FAd7falUwZnY1QPEcG8yFoSLLQGypyGgWyL1VGsgFYyT1R
 0TYpBlc4pReVFPzM/QnPNjgVp5wk/ewfTgAahwyRoAUCnSWXFXYlByCmGbKhzy9+KTSuf9X1
 WinnTaEUi9BVPUPIMueTOYBy747rh3SNkuILa0XOy+PiOLEDFbMEO9tGALXMogRsfPVyC2Io
 o03H5bblH1ivBjWP3C/HXg7dgtRcxDWxPne9qRqSwJ0ClY8RTx6VaaOmehJlk4Mt/09q9okN
 0qVAidwoGcTT1WcQelTQnw8Or7pQ7hlqnc3YX4lMVqygiBxaoez9qYPMZAweOB/puBkyPd1S
 dgDetmBXasTGmiWpWxFYMmvtpFmeTSqmRmKY3ivbg8gcsMyXAfO4NLlIFfirXFcEiqtuMIii
 LS8zQeHE4EbTgFvAZ+OOvKixl+8p1YHn+d2UxeaK9VfYhy0ooNrNzbwnrk8JMRVcUfPwT6T1
 gC3BxYEpLaS/99poYeR3a3d9tWnCepzGEZeDlL317fuOHmI5HenzK9BTP2MIWLXWlTr9fjwf
 u5S1fz9bqEKxQ4Yr4pmHr935qsi/N+z9aRCxwFpEXiXPVSmDrRsfiuP0cVV7/Afw7ZYvU29W
 16V+8kcMrKMYZu3HFkULQsjT+KCyfBLxWWCsaVreB33tH1t4b6KcUROJB3d2iVSIYx8PJ4h3
 ep86tUd7Bayi0ZyP9uL5syOG79g8pDUv30bi6wn
IronPort-HdrOrdr: A9a23:m2APWK+YaiSY8Il1+uBuk+DeI+orL9Y04lQ7vn2YSXRuHfBw8P
 re+8jztCWE8Qr5N0tApTntAsS9qDbnhPxICOoqTNOftWvd2FdARbsKheCJ/9SjIVyaygc079
 YHT0EUMrPN5DZB4foSmDPIcOod/A==
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="58884443"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH 32/57] tools/misc: rework Makefile
Date: Mon, 6 Dec 2021 17:02:15 +0000
Message-ID: <20211206170241.13165-33-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add missing "xen-detect" rule. It only works without it because we
still have make's built-ins rules and variables, but fix this to not
have to rely on them.

Rename $(TARGETS_BUILD) to $(TARGETS).

Remove the unused "build" target.

Also, they are no more "build-only" targets, remove the extra code.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/misc/Makefile | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tools/misc/Makefile b/tools/misc/Makefile
index 8b9558b93f..5e7787e501 100644
--- a/tools/misc/Makefile
+++ b/tools/misc/Makefile
@@ -50,16 +50,13 @@ TARGETS_COPY += xencov_split
 TARGETS_COPY += xenpvnetboot
 
 # Everything which needs to be built
-TARGETS_BUILD := $(filter-out $(TARGETS_COPY),$(TARGETS_ALL))
+TARGETS := $(filter-out $(TARGETS_COPY),$(TARGETS_ALL))
 
-# ... including build-only targets
-TARGETS_BUILD += $(TARGETS_BUILD-y)
-
-.PHONY: all build
-all build: $(TARGETS_BUILD)
+.PHONY: all
+all: $(TARGETS)
 
 .PHONY: install
-install: build
+install: all
 	$(INSTALL_DIR) $(DESTDIR)$(bindir)
 	$(INSTALL_DIR) $(DESTDIR)$(sbindir)
 	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
@@ -75,7 +72,7 @@ uninstall:
 
 .PHONY: clean
 clean:
-	$(RM) *.o $(TARGETS_BUILD) *~ $(DEPS_RM)
+	$(RM) *.o $(TARGETS) *~ $(DEPS_RM)
 
 .PHONY: distclean
 distclean: clean
@@ -86,6 +83,9 @@ xen-access: xen-access.o
 xen-cpuid: xen-cpuid.o
 	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(APPEND_LDFLAGS)
 
+xen-detect: xen-detect.o
+	$(CC) $(LDFLAGS) -o $@ $< $(APPEND_LDFLAGS)
+
 xen-hvmctx: xen-hvmctx.o
 	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
 
-- 
Anthony PERARD


