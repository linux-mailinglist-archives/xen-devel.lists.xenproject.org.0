Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F154C488A
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 16:16:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279285.476996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcKs-0001l8-0P; Fri, 25 Feb 2022 15:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279285.476996; Fri, 25 Feb 2022 15:16:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcKr-0001f1-KG; Fri, 25 Feb 2022 15:16:45 +0000
Received: by outflank-mailman (input) for mailman id 279285;
 Fri, 25 Feb 2022 15:16:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0Ll=TI=citrix.com=prvs=04808661d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nNcIH-0007Bf-8N
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 15:14:05 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90344314-964d-11ec-8eb9-a37418f5ba1a;
 Fri, 25 Feb 2022 16:14:03 +0100 (CET)
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
X-Inumbo-ID: 90344314-964d-11ec-8eb9-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645802043;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Qi8ktRfGxKz6TVNBfNc+szyw4+rNfchyhf2q4Nw7GMs=;
  b=F4n+rKBh+eAVFe6BXWJtVlf0DVGDoWrWGGqNwnlV3Rm9cLmP4WslD5L9
   yVj9EjemY8P9TnhQdRq6ZwENXP7InJO+JHWYzIxQNdX4k3IVoRFkKdSJl
   kr8In1+nV5y6G4QdUQqM2KOlp5VbO8xM3JwxpuM043JWQ4cFV7DmglupJ
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 64433034
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:4qtPwK3DISLmD7J/6fbD5blxkn2cJEfYwER7XKvMYLTBsI5bp2YCz
 TZNDzjSOfneMWT3Kt1zPN+0pEpUvsDTzd9gHldqpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tQy3IDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1xj467FiUxN5beicMsUiVqTSxbYYJ/reqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHiOp8fvXdxiynUF/88TbjIQrnQ5M8e1zA17ixLNaiCO
 5FCMWEzBPjGSwRKGg8PI5UaoMipqGLAagZjik+vo6VitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzREhwccdCS1zeB2natnfPU2zP2XpoIE7+1/eIsh0ecrlH/EzVPCwH9+6PgzBfjBZQPc
 CT45xbCs4AOzl6gEfvlViaqsVm1vyIuBdd1T8IDvVTlJrXv3y6VAW0NTzhkYdMgtdMrSTFC6
 mJlj+8FFhQ07uTLFCv1GqO86GrrZHNLdTNqiTosEFNdi+QPtr3fmf4mojxLNKeuxuP4Fjjrq
 9xhhHhv3u5D5SLnOkjSwLwmv95OjsSYJuLWzl+ONo5A0u+fTNT0D2BPwQKGhcus1K7DEjG8U
 IEswqByFtwmA5CXjzCqS+4QBryv7PvtGGSC3QMwQ8B9qmz1oybLkWVsDNdWfhYB3iEsI2KBX
 aMukVkJuM870IWCN8ebnL5d++x1lPO9RLwJp9jfb8ZUY4gZSeN01HoGWKJk5Ei0yBJEufhmY
 f+zKJ/wZV5HWfUP5GfnHI81jO50rh3SMEuOHPgXOTz8iuHADJNUIJ9YWGazghcRt/vV8F2Iq
 I8Eb6NnCXx3CYXDX8UeyqZLRXhiEJTxLcmowyCLXoZv+jZbJVw=
IronPort-HdrOrdr: A9a23:ghfykK9AO/Fxt7JMo09uk+DgI+orL9Y04lQ7vn2YSXRuHPBw8P
 re+sjztCWE8Ar5N0tBpTntAsW9qDbnhPtICOoqTNCftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAtFD4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="64433034"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 10/29] tools/xenpaging: Rework makefile
Date: Fri, 25 Feb 2022 15:13:02 +0000
Message-ID: <20220225151321.44126-11-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225151321.44126-1-anthony.perard@citrix.com>
References: <20220225151321.44126-1-anthony.perard@citrix.com>
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


