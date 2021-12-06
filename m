Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D11AC46A246
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:07:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239477.415197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHSk-00016V-Hj; Mon, 06 Dec 2021 17:07:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239477.415197; Mon, 06 Dec 2021 17:07:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHSj-0000ws-Vk; Mon, 06 Dec 2021 17:07:37 +0000
Received: by outflank-mailman (input) for mailman id 239477;
 Mon, 06 Dec 2021 17:07:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHPN-0005ti-8r
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:04:09 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 863b6834-56b6-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 18:04:08 +0100 (CET)
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
X-Inumbo-ID: 863b6834-56b6-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810247;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Qi8ktRfGxKz6TVNBfNc+szyw4+rNfchyhf2q4Nw7GMs=;
  b=bfXvX2kvt3XeFh/G1829Dt/y4fs8KMMlPWqYYhQnz5g4fvKUT5FCJs0b
   vaJQ7OSZiZ3IDf5CeQDVMRLRC/WnVpNae+prvQlB+A7VOjYuRzUOehcej
   QEExhX26tpHWBdGfvE+JP7JnlCCWUGCwhxZR/kAjRSg7xhj+UK4YjOMsn
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: qpV4d4+1FPX+nHxG7J9nJXYwjDyegjkOgLVYA1UFwoOXpRRtyx1G+7iEWpMl33LJiMrqZ6/g6m
 gjqr/1HkC77E1Ma0jS766dfiGeSzrzXiS1ODIpN5+h8pOllVk77qFtnl0QIyeD/ksPX9Bteea4
 vN0rzMrHGSQM7xfny9VE7n1XEWUY2Zbl4fmIvogBKAMHjL0A5N24xc5EZlYUew2I+jlRVJb4Cl
 kg+7XkvHTVgQpaLTCP2exdSnZUo61IH+X1vzcgl+QxvZkrcDN5fFQnQSGv7yMPtlHTZ5XI70b8
 JRk2bRZcs4o54cWIqJ4Kc1mh
X-SBRS: 5.1
X-MesageID: 59387915
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:0tYB5K1oaEDJErUU//bD5TJ2kn2cJEfYwER7XKvMYLTBsI5bpzFWz
 WRMCmuOOviMN2aje9l2PoW08ksCvJLTmoJlGVBspC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan8ZqTNMEn970Es5w7Bh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhuvE2y
 sRdt9uLaTw5fYL0x8U9CitEOnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Ej8I/LM7tLcUHt2tp1z3xBvc6W5HTBa7N4Le02R9t15seQqeHO
 qL1bxIwXBXQJDZgP2sVVrUblduvhHXwTm1x/Qf9Sa0fvDGIkV0ZPKLWGNvKePSaSMNNhEGaq
 2nauWPjDXkyK9i32TeDtHW2iYfnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM/pWL
 VAU/Sw/67A/7kWxQvHyWhS5pDiPuRt0ZjZLO7RkskfXkPOSulvHQDhfJtJcVDA4nOoXAj47x
 l3OpPPSFX9AiOK0aSuv6p7B+FteJhMpBWMFYCYFSy4M7N/ivJw/g3rzczpzLEKmpoarQG+tm
 lhmuAB73uxO1pBTi81X6Hie22r0zqUlWDLZ8ek+soiNygpiLLCoaIWzgbQwxaYRdd3JJrVtU
 ZVtpiR/0AzsJczU/MBuaL9UdF1M2xpjGGeG6bKIN8N+nwlBA1b5IehtDMhWfS+FyPosdz7ze
 1P0sghM/pJVN3bCRfYpONLuUZV3l/K+SoSNuhXogjxmOMIZmOivpn4GWKJt9zq1zBhEfV8XZ
 /93jvpA/V5FUP86nVJats8W0KMxxzBW+I8gbcuT8vhT6pLHPCT9Ye5caDOmN7llhIvZ8FS92
 4sObKOilkQAONASlwGKqOb/23hRdiNlbX03wuQKHtO+zv1ORDt8VqSPmOx5IOSIXc19z4/1w
 510YWcAoHKXuJENAVzbApy6QL+wD5t5s1whOikgYQSh13Q5ON7956YDbZonO7Ig8bU7n/JzS
 vAEfeSGA+hOFWubq2hMM8GlodwwbgmviCKPIzGhPGo1cal/SlGb4dTjZAbuqnUDV3Llqcskr
 rS8/QrHWp5fFR96BcPbZav3nVO8tHQQgsxoWE7MLoUBcUng6tEyeSfwkuU2M4cHLhCanmmW0
 AOfABE5o+jRotBqrImV1P7c94rwSrlwBEtXGWXf/I2aDyiC8zrx25JEXcaJYSvZCDH+9pK9a
 LgH1Pr7KvAGwgpH6tIuD7ZxwKsizNLzvLsGnB98FXDGYln3WLNtJn6KgZtGuqFXn+ILvAK3X
 gSE+8VAOKXPM8TgSQZDKA0gZ+WF9PcVhjiNsqhlfBSkvHd6rOidTEFfHxiQkygMfrJ6PbQsz
 folpMNLuRe0jQAnM4regy1Zn4hWwqfsj0nzWkkmPbLW
IronPort-HdrOrdr: A9a23:Vg+O/aDxGI9vsczlHemq55DYdb4zR+YMi2TC1yhKJiC9Ffbo8P
 xG/c5rrCMc5wxxZJhNo7290ey7MBHhHP1OkO0s1NWZPDUO0VHAROoJ0WKh+UyEJ8SXzJ866U
 4KScZD4bPLYWSS9fyKgzWFLw==
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="59387915"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH 35/57] tools/xenpaging: Rework makefile
Date: Mon, 6 Dec 2021 17:02:18 +0000
Message-ID: <20211206170241.13165-36-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
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


