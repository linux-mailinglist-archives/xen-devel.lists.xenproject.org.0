Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C7E3A8661
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jun 2021 18:25:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142286.262593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltBs7-0003L2-UT; Tue, 15 Jun 2021 16:25:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142286.262593; Tue, 15 Jun 2021 16:25:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltBs7-0003If-R8; Tue, 15 Jun 2021 16:25:03 +0000
Received: by outflank-mailman (input) for mailman id 142286;
 Tue, 15 Jun 2021 16:25:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x6ws=LJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ltBs6-0003IV-6U
 for xen-devel@lists.xenproject.org; Tue, 15 Jun 2021 16:25:02 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a890bea2-b883-4064-a3c5-4f17961b9e3e;
 Tue, 15 Jun 2021 16:25:01 +0000 (UTC)
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
X-Inumbo-ID: a890bea2-b883-4064-a3c5-4f17961b9e3e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623774301;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SDBx1Aretrpn/nNAfujB3dI0OwxDJgEZecrfpSikAR8=;
  b=CwSzTEF89YJ2lApoWmXyOpa8SRjvyFmL++rMa+PC+hwUsRqQlRUQHpde
   RR4y+gc2f5sKsw4kKPBGLu1R4aZ7/3oeiaXhxj3IV6iXYc1wOSAxC/O8M
   nVv0GwhXmwsyFPZcrRuwnaHwkUSWSvPWtqxEAodx3fiQgzY/byuOAUdAe
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: cOMLRAZrh4TGYSiccUyZQmJRNeWGCWYTmomE3MYu4tnO/LwNnPFF2qUij/6iSskp0Njvqjrpxr
 tVLih9Ta5IB/lzBw5jIcBGvdTIj+CjDbzJ0HtlihjFvQlISDn1oPhzA1yzX3A+9M0cu7OGShL+
 Vw02kCSflV/jqU731ySCU+bSt05jJUZp7lodESMtC6jGVHe1OxAeQeocl5UZhBpv0RWqwnE2bD
 8bvEOSmYeSkUBVk5SJ0R3aL9+QqDAzf3OU/Y4dagUmseijWHxQib8JfFuqtjhPr7fqT84EgbVh
 Bss=
X-SBRS: 5.1
X-MesageID: 46186252
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:3GXDyaoys+EsuLjbOmgImPgaV5rdeYIsimQD101hICG9Evb0qy
 lhppQmPH7P+VAssRQb8+xoV5PufZqxz/BICMwqTNWftWrdyQyVxeNZnOjfKlTbckWTygce79
 YET0EXMrbN5DNB/KLHCWeDcurJwLO8gd+VbeW19QYScem9AZsQnjuQCWygYz1LrBEtP+tBKH
 IFjPA32gZJfx4sH7yGL0hAZcfvjfvRmqnrZBYXbiRXlDVn3VuTmcXH+wHz5GZlbw9y
X-IronPort-AV: E=Sophos;i="5.83,275,1616472000"; 
   d="scan'208";a="46186252"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Juergen Gross
	<jgross@suse.com>
Subject: [PATCH 3/5] tests/resource: Rework Makefile
Date: Tue, 15 Jun 2021 17:19:03 +0100
Message-ID: <20210615161905.9831-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210615161905.9831-1-andrew.cooper3@citrix.com>
References: <20210615161905.9831-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

In particular, fill in the install/uninstall rules so this test can be
packaged to be automated sensibly.

Make all object files depend on the Makefile, and us $(TARGET) when
appropriate.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Juergen Gross <jgross@suse.com>
---
 tools/tests/resource/Makefile | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/tests/resource/Makefile b/tools/tests/resource/Makefile
index da5e2a4f9b..b22eb6fc21 100644
--- a/tools/tests/resource/Makefile
+++ b/tools/tests/resource/Makefile
@@ -16,9 +16,12 @@ distclean: clean
 
 .PHONY: install
 install: all
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
+	$(INSTALL_PROG) $(TARGET) $(DESTDIR)$(LIBEXEC_BIN)
 
 .PHONY: uninstall
 uninstall:
+	$(RM) -f -- $(DESTDIR)$(LIBEXEC_BIN)/$(TARGET)
 
 CFLAGS += -Werror
 CFLAGS += $(CFLAGS_xeninclude)
@@ -30,7 +33,9 @@ LDFLAGS += $(LDLIBS_libxenctrl)
 LDFLAGS += $(LDLIBS_libxenforeignmemory)
 LDFLAGS += $(APPEND_LDFLAGS)
 
-test-resource: test-resource.o
+*.o: Makefile
+
+$(TARGET): test-resource.o
 	$(CC) -o $@ $< $(LDFLAGS)
 
 -include $(DEPS_INCLUDE)
-- 
2.11.0


