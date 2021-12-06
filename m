Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A6B46A272
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:09:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239534.415515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHU4-0000Di-Mx; Mon, 06 Dec 2021 17:09:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239534.415515; Mon, 06 Dec 2021 17:09:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHU3-0008Bn-FO; Mon, 06 Dec 2021 17:08:59 +0000
Received: by outflank-mailman (input) for mailman id 239534;
 Mon, 06 Dec 2021 17:08:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHPO-0005ti-Fh
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:04:10 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 870083b8-56b6-11ec-8a4d-196798b21f7b;
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
X-Inumbo-ID: 870083b8-56b6-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810249;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0MivWbgo/dLtJel8lLkqzy+izVyO5ow6ugdRMsmNQz0=;
  b=EOySLkNTKVERhcqzMXigBnfPDtTn5pAR8B6Ypw68AYeQfFYORdRc7mhh
   N+yM0E36fha1MAm5a21u2VQyk9fjr9pPweDs+KHAojSHDzy3uksIyPCH9
   kLe7q0C3WZw8HGT7O1bnzY0ydItym3U3ndDhcY69AV8xuSgHA+hPEPKp5
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: rveRkO69cS5gYtM8H32HobqBjT2KVOUK5TVZeI+5UwQqioiB+OXKu5w7jiSiiCfFnAEKNDq5rJ
 g0lz0xDT/NW4GnU6DRrHx0fjMwYA40k2Nf1LMHVLA1o5xxhshiRkmZoI3KdTvIfoY213EoNyhx
 pBaKM57RKF/Vl404T+3Wiuhf8Ak/l2ZcuZS93NNT9Pw0ndw8E8zZxOYilJc98R5e/MN6Pggtkh
 dshOn3RjUwMrxzvmv8CMoEyEjg7ZzLclaC6Wa3MpmcN5Iamsx/sD5W07Khx5fPWEdvun7X8rB0
 e/hWg+j3Wi5eYf6QFmI2Rs2W
X-SBRS: 5.1
X-MesageID: 59387924
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:unO4M62HfnKd/mC98PbD5Vh2kn2cJEfYwER7XKvMYLTBsI5bpzZTn
 2ZNDTiBaamOMzDzKNl1PIi0p01T6sPXnIJgGQZqpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan8ZqTNMEn970Es5w7Bh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhu/R65
 OcR5JaJRVk7bo7lobsFWR0GHHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Ej8I/LM7tLcUHt2tp1z3xBvc6W5HTBa7N4Le02R9t15seQqeEO
 6L1bxJWZUTwMzIQFm0dVtE7mbyHiWTeQixh/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 mDJ5WPiGTkBKceSjzGC9xqEhPLLnC79cJIfEvu/7PECqE2ewCkfBQMbUXO/oOKlkQiuVtRHM
 UsW9yEy668o+ySDR9/hXxq+sTicswQVQdZ4HOgz6QXLwa3Riy6YGWosXjNHcMYhtsI9WXotz
 FDhoj/yLWUx6vvPEyvbr+rK62PpUcQIEYMcTQsgRic3v4jpmY1tnELsZ+88CKSx0NKgTFkc3
 Au2hCQ5grwSi+sC2KO64U3LjlqQm3TZcuImzl6JBzz4t2uVcKbgPtX1sgaDsZ6sOa7AFgHZ1
 EXojfRy+wzn4XulsCWWCNsAE7iyjxpuGG2N2AU/d3XNGtnExpJCQWyyyGwnTKuKGpxdEdMMX
 KM1kVkLjHO0FCH1BZKbm6rrV6wXIVLcPdrkTOvISdFFf4J8cgSKlAk3OxXAgDq8zRJ2z/5vU
 Xt+TSpKJSxAYUiA5GDpL9rxLJdxnnxurY8tbc6TI+ubPUq2OyfOFOZt3KqmZeEl9qKUyDg5A
 P4EX/ZmPy53CbWkCgGOqNZ7BQlTcRATWMCnw+QKJ7XrClc3Rwkc5wr5nOpJU5Z7hJ5ciuqg1
 ij7Aie0PnKk3iaZQehLA1g+AI7SsWFX8ShmYHdyZAnwgBDOo++Htc8iSnf+RpF/nMQL8BK+Z
 6NdEylZKvgQGDnB5RoHapzx8N5reBix3FrcNCu5ejkvOZVnQlWRqNPjewLu8ggIDza26pRi8
 +HxiFuDTMpRXRlmAebXdOmrkwG7s08Clb8gREDPONRSJhnhqdA4Nyzrg/YrCMgQMhGflCCC3
 gObDE5A9+nAqoM46vfTgqWAo9v7GudyBBMCTWLa8ay3JW/R+W/6md1MV+OBfDb8UmLo+fr9O
 bUJnq+kaPBexQREqYtxFbpv3JkS3dq3qu8I1BlgEVXKc0+vVuFqLE6Z0JQdraZK3LJY51e7A
 xrd5tlANLyVE8r5C1pNdhE9Z+GO2PxIyDnf6fM5fBfz6CNtpefVVExTO1+HiTBHLaszO4Qgm
 L9ztMkT4g25qxwrLtfZ0XwEqzXSdiQNA/c9q5UXII73kQ56mFhNbKvVBjLy/JzSOc5HNVMnI
 2PMiafP71iGKpEur5bn+aDx4Ndg
IronPort-HdrOrdr: A9a23:HShvlaqm77F9uaY9dR+79q0aV5oteYIsimQD101hICG8cqSj+P
 xG+85rsiMc6QxhIU3I9urgBEDtex7hHNtOkOss1NSZLW3bUQmTTL2KhLGKq1aLJ8S9zJ856U
 4JSdkZNDSaNzZHZKjBjDVQa+xQo+W6zA==
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="59387924"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>
Subject: [XEN PATCH 36/57] tools/xenstore: Cleanup makefile
Date: Mon, 6 Dec 2021 17:02:19 +0000
Message-ID: <20211206170241.13165-37-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Regroup *FLAGS together, use $(LDLIBS).

Remove $(LDLIBS_xenstored) which was the wrong name name as it doesn't
decribe how to link to a potential libxenstored.so, instead add the
value to $(LDLIBS) of xenstored.

Add SYSTEMD_LIBS into $(LDLIBS) instead of $(LDFLAGS).

Remove the "-I." from $(CFLAGS), it shouldn't be needed.

Removed $(CFLAGS-y) and $(LDFLAGS-y). $(CFLAGS-y) is already included
in $(CFLAGS) and both aren't used anyway.

Rename ALL_TARGETS to TARGETS.
Only add programmes we want to build in $(TARGETS), not phony-targets
(replace "clients").

Store all `xenstored` objs into $(XENSTORED_OBJS-y).

Replace one $< by $^ even if there's only one dependency,
(xenstore-control).

clean: "init-xenstore-domain" isn't built here, so stop trying to
remove it, remove $(TARGETS).

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/xenstore/Makefile | 81 ++++++++++++++++++++++-------------------
 1 file changed, 44 insertions(+), 37 deletions(-)

diff --git a/tools/xenstore/Makefile b/tools/xenstore/Makefile
index 292b478fa1..7fe1d9c1e2 100644
--- a/tools/xenstore/Makefile
+++ b/tools/xenstore/Makefile
@@ -5,7 +5,6 @@ MAJOR = 3.0
 MINOR = 3
 
 CFLAGS += -Werror
-CFLAGS += -I.
 # Include configure output (config.h)
 CFLAGS += -include $(XEN_ROOT)/tools/config.h
 CFLAGS += -I./include
@@ -16,36 +15,53 @@ CFLAGS += $(CFLAGS_libxentoolcore)
 CFLAGS += -DXEN_LIB_STORED="\"$(XEN_LIB_STORED)\""
 CFLAGS += -DXEN_RUN_STORED="\"$(XEN_RUN_STORED)\""
 
-CFLAGS  += $(CFLAGS-y)
-LDFLAGS += $(LDFLAGS-y)
+ifdef CONFIG_STUBDOM
+CFLAGS += -DNO_SOCKETS=1
+endif
 
-CLIENTS := xenstore-exists xenstore-list xenstore-read xenstore-rm xenstore-chmod
-CLIENTS += xenstore-write xenstore-ls xenstore-watch
+XENSTORED_OBJS-y := xenstored_core.o xenstored_watch.o xenstored_domain.o
+XENSTORED_OBJS-y += xenstored_transaction.o xenstored_control.o
+XENSTORED_OBJS-y += xs_lib.o talloc.o utils.o tdb.o hashtable.o
 
-XENSTORED_OBJS = xenstored_core.o xenstored_watch.o xenstored_domain.o
-XENSTORED_OBJS += xenstored_transaction.o xenstored_control.o
-XENSTORED_OBJS += xs_lib.o talloc.o utils.o tdb.o hashtable.o
+XENSTORED_OBJS-$(CONFIG_Linux) += xenstored_posix.o
+XENSTORED_OBJS-$(CONFIG_SunOS) += xenstored_solaris.o xenstored_posix.o xenstored_probes.o
+XENSTORED_OBJS-$(CONFIG_NetBSD) += xenstored_posix.o
+XENSTORED_OBJS-$(CONFIG_FreeBSD) += xenstored_posix.o
+XENSTORED_OBJS-$(CONFIG_MiniOS) += xenstored_minios.o
 
-XENSTORED_OBJS_$(CONFIG_Linux) = xenstored_posix.o
-XENSTORED_OBJS_$(CONFIG_SunOS) = xenstored_solaris.o xenstored_posix.o xenstored_probes.o
-XENSTORED_OBJS_$(CONFIG_NetBSD) = xenstored_posix.o
-XENSTORED_OBJS_$(CONFIG_FreeBSD) = xenstored_posix.o
-XENSTORED_OBJS_$(CONFIG_MiniOS) = xenstored_minios.o
+$(XENSTORED_OBJS-y): CFLAGS += $(CFLAGS_libxengnttab)
 
-XENSTORED_OBJS += $(XENSTORED_OBJS_y)
-LDLIBS_xenstored += -lrt
+xenstored: LDLIBS += $(LDLIBS_libxenevtchn)
+xenstored: LDLIBS += $(LDLIBS_libxengnttab)
+xenstored: LDLIBS += $(LDLIBS_libxenctrl)
+xenstored: LDLIBS += -lrt
+xenstored: LDLIBS += $(SOCKET_LIBS)
 
-ALL_TARGETS = clients
-ifeq ($(XENSTORE_XENSTORED),y)
-ALL_TARGETS += xs_tdb_dump xenstored
+ifeq ($(CONFIG_SYSTEMD),y)
+$(XENSTORED_OBJS-y): CFLAGS += $(SYSTEMD_CFLAGS)
+xenstored: LDLIBS += $(SYSTEMD_LIBS)
 endif
 
-ifdef CONFIG_STUBDOM
-CFLAGS += -DNO_SOCKETS=1
+xenstore: LDLIBS += $(LDLIBS_libxenstore)
+xenstore: LDLIBS += $(LDLIBS_libxentoolcore)
+xenstore: LDLIBS += $(SOCKET_LIBS)
+
+xenstore-control: LDLIBS += $(LDLIBS_libxenstore)
+xenstore-control: LDLIBS += $(LDLIBS_libxenctrl)
+xenstore-control: LDLIBS += $(LDLIBS_libxenguest)
+xenstore-control: LDLIBS += $(LDLIBS_libxentoolcore)
+xenstore-control: LDLIBS += $(SOCKET_LIBS)
+
+CLIENTS := xenstore-exists xenstore-list xenstore-read xenstore-rm xenstore-chmod
+CLIENTS += xenstore-write xenstore-ls xenstore-watch
+
+TARGETS := xenstore $(CLIENTS) xenstore-control
+ifeq ($(XENSTORE_XENSTORED),y)
+TARGETS += xs_tdb_dump xenstored
 endif
 
 .PHONY: all
-all: $(ALL_TARGETS)
+all: $(TARGETS)
 
 .PHONY: clients
 clients: xenstore $(CLIENTS) xenstore-control
@@ -62,37 +78,28 @@ xenstored_probes.o: xenstored_solaris.o
 CFLAGS += -DHAVE_DTRACE=1
 endif
 
-ifeq ($(CONFIG_SYSTEMD),y)
-$(XENSTORED_OBJS): CFLAGS += $(SYSTEMD_CFLAGS)
-xenstored: LDFLAGS += $(SYSTEMD_LIBS)
-endif
-
-$(XENSTORED_OBJS): CFLAGS += $(CFLAGS_libxengnttab)
-
-xenstored: $(XENSTORED_OBJS)
-	$(CC) $^ $(LDFLAGS) $(LDLIBS_libxenevtchn) $(LDLIBS_libxengnttab) $(LDLIBS_libxenctrl) $(LDLIBS_xenstored) $(SOCKET_LIBS) -o $@ $(APPEND_LDFLAGS)
+xenstored: $(XENSTORED_OBJS-y)
+	$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@ $(APPEND_LDFLAGS)
 
-xenstored.a: $(XENSTORED_OBJS)
+xenstored.a: $(XENSTORED_OBJS-y)
 	$(AR) cr $@ $^
 
 $(CLIENTS): xenstore
 	ln -f xenstore $@
 
 xenstore: xenstore_client.o xs_lib.o
-	$(CC) $^ $(LDFLAGS) $(LDLIBS_libxenstore) $(LDLIBS_libxentoolcore) $(SOCKET_LIBS) -o $@ $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@ $(APPEND_LDFLAGS)
 
 xenstore-control: xenstore_control.o
-	$(CC) $< $(LDFLAGS) $(LDLIBS_libxenstore) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxentoolcore) $(SOCKET_LIBS) -o $@ $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@ $(APPEND_LDFLAGS)
 
 xs_tdb_dump: xs_tdb_dump.o utils.o tdb.o talloc.o
-	$(CC) $^ $(LDFLAGS) -o $@ $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) $^ -o $@ $(APPEND_LDFLAGS)
 
 .PHONY: clean
 clean:
 	rm -f *.a *.o xenstored_probes.h
-	rm -f xenstored
-	rm -f xs_tdb_dump xenstore-control init-xenstore-domain
-	rm -f xenstore $(CLIENTS)
+	rm -f $(TARGETS)
 	$(RM) $(DEPS_RM)
 
 .PHONY: distclean
-- 
Anthony PERARD


