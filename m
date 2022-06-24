Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 491C8559E05
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 18:05:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355608.583409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lne-0006ia-59; Fri, 24 Jun 2022 16:04:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355608.583409; Fri, 24 Jun 2022 16:04:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lnd-0006dn-TA; Fri, 24 Jun 2022 16:04:49 +0000
Received: by outflank-mailman (input) for mailman id 355608;
 Fri, 24 Jun 2022 16:04:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7mLY=W7=citrix.com=prvs=16756bcf7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o4lnc-0004qb-0f
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 16:04:48 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e372a70-f3d7-11ec-bd2d-47488cf2e6aa;
 Fri, 24 Jun 2022 18:04:46 +0200 (CEST)
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
X-Inumbo-ID: 5e372a70-f3d7-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656086686;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Qi8ktRfGxKz6TVNBfNc+szyw4+rNfchyhf2q4Nw7GMs=;
  b=LhGgRGkZtR1KvHYOYtPeJ8I9EBTe2tOk3L7sVfvykV5m0NkLWdoTvdVB
   wdPP8OOo70hhqoulII07BDuzjRjYy9mN2waisjtA6vXcQHcMIh1tUEitD
   mo+fqBZOr7ERPTyMimC3VRqP2PEoykcF5dFCVzfKPOY57VnKvvAX+JGqd
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 73702017
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:3wOXxq2nMSAqJSfmN/bD5Zpxkn2cJEfYwER7XKvMYLTBsI5bp2FSx
 2UYXz+Hb/uKajH0fthyaom28UJS78TcnNYyQFNlpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1Ek/NtTo5w7Rj2tAy3YDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1uvLqSZiAABZbn2/4WDRoASyVRJpNZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHiOp8fvXdxiynUF/88TbjIQrnQ5M8e1zA17ixLNamFO
 JJDMWMwBPjGSwVsIUYpOIo8p7ihpGHPVxJ+91LWjJNitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzREhwccdCS1zeB2natnfPU2zP2XpoIE7+1/eIsh0ecrlH/EzVPCwH9+6PgzBfjBZQPc
 CT45xbCs4AR/WqJYf7UZCaT42SP4B1EA95/CNMlvVTlJrXv3+qJOoQVZmcfNYJ+75JuGmxCO
 kyhxI2wW2E22FGBYTfEr+rP82vvUcQABTVaDRLoWzfp9DUKTGsbqhvUBuhuH6eu5jEeMWGhm
 mvaxMTSalh6sCLq60lY1Qqe695UjsKVJjPZHy2ONo5f0it3ZZS+e6uj4kXB4PBLIe6xFwfc4
 iBcypHBsLhWUvlhcRBhps1XRNlFAN7VWAAwfHY1R8Vxn9hT0yTLkX9sDMFWex4yb5dslc7Ba
 07PowJBjKJu0I+RRfYvOeqZUp1ypYC5TIiNfq2EP7JmP8kqHCfarX4GWKJl9z20+KTaufpkY
 snznAfFJStyNJmLOxLsFrlEj+N0l3tgrY4RLLiipymaPXOlTCb9Yd843JGmMojVMIvsTN3pz
 uti
IronPort-HdrOrdr: A9a23:w3tZ6a/xZKD7vDcso19uk+DeI+orL9Y04lQ7vn2YSXRuHfBw8P
 re+8jztCWE8Qr5N0tApTntAsS9qDbnhPxICOoqTNOftWvd2FdARbsKheCJ/9SjIVyaygc079
 YHT0EUMrPN5DZB4foSmDPIcOod/A==
X-IronPort-AV: E=Sophos;i="5.92,218,1650945600"; 
   d="scan'208";a="73702017"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v3 09/25] tools/xenpaging: Rework makefile
Date: Fri, 24 Jun 2022 17:04:06 +0100
Message-ID: <20220624160422.53457-10-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624160422.53457-1-anthony.perard@citrix.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

- Rename $(SRCS) to $(OBJS-y), we don't need to collect sources.
- Rename $(IBINS) to $(TARGETS)
- Stop cleaning "xen" and non-set variable $(LIB).

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/xenpaging/Makefile | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/tools/xenpaging/Makefile b/tools/xenpaging/Makefile
index 04743b335c..e2ed9eaa3f 100644
--- a/tools/xenpaging/Makefile
+++ b/tools/xenpaging/Makefile
@@ -5,33 +5,33 @@ CFLAGS += $(CFLAGS_libxentoollog) $(CFLAGS_libxenevtchn) $(CFLAGS_libxenctrl) $(
 LDLIBS += $(LDLIBS_libxentoollog) $(LDLIBS_libxenevtchn) $(LDLIBS_libxenctrl) $(LDLIBS_libxenstore) $(PTHREAD_LIBS)
 LDFLAGS += $(PTHREAD_LDFLAGS)
 
-POLICY    = default
+POLICY   := default
 
-SRC      :=
-SRCS     += file_ops.c xenpaging.c policy_$(POLICY).c
-SRCS     += pagein.c
+OBJS-y   := file_ops.o
+OBJS-y   += xenpaging.o
+OBJS-y   += policy_$(POLICY).o
+OBJS-y   += pagein.o
 
 CFLAGS   += -Werror
 CFLAGS   += -Wno-unused
 
-OBJS     = $(SRCS:.c=.o)
-IBINS    = xenpaging
+TARGETS := xenpaging
 
-all: $(IBINS)
+all: $(TARGETS)
 
-xenpaging: $(OBJS)
+xenpaging: $(OBJS-y)
 	$(CC) $(LDFLAGS) -o $@ $^ $(LDLIBS) $(APPEND_LDFLAGS)
 
 install: all
 	$(INSTALL_DIR) -m 0700 $(DESTDIR)$(XEN_PAGING_DIR)
 	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
-	$(INSTALL_PROG) $(IBINS) $(DESTDIR)$(LIBEXEC_BIN)
+	$(INSTALL_PROG) $(TARGETS) $(DESTDIR)$(LIBEXEC_BIN)
 
 uninstall:
-	rm -f $(addprefix $(DESTDIR)$(LIBEXEC_BIN)/, $(IBINS))
+	rm -f $(addprefix $(DESTDIR)$(LIBEXEC_BIN)/, $(TARGETS))
 
 clean:
-	rm -f *.o *~ $(DEPS_RM) xen TAGS $(IBINS) $(LIB)
+	rm -f *.o *~ $(DEPS_RM) TAGS $(TARGETS)
 
 distclean: clean
 
@@ -39,6 +39,6 @@ distclean: clean
 
 .PHONY: TAGS
 TAGS:
-	etags -t $(SRCS) *.h
+	etags -t *.c *.h
 
 -include $(DEPS_INCLUDE)
-- 
Anthony PERARD


