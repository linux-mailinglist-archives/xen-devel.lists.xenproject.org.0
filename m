Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3963767F1
	for <lists+xen-devel@lfdr.de>; Fri,  7 May 2021 17:29:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.124067.234138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lf2PC-0001t7-OF; Fri, 07 May 2021 15:28:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 124067.234138; Fri, 07 May 2021 15:28:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lf2PC-0001rB-L9; Fri, 07 May 2021 15:28:42 +0000
Received: by outflank-mailman (input) for mailman id 124067;
 Fri, 07 May 2021 15:28:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rq7T=KC=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1lf2PB-0001r5-DE
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 15:28:41 +0000
Received: from MTA-09-3.privateemail.com (unknown [68.65.122.19])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d34aa4ec-29a2-408a-aec3-2b265d88776f;
 Fri, 07 May 2021 15:28:40 +0000 (UTC)
Received: from MTA-09.privateemail.com (localhost [127.0.0.1])
 by MTA-09.privateemail.com (Postfix) with ESMTP id E137660059;
 Fri,  7 May 2021 11:28:39 -0400 (EDT)
Received: from toma-xps.lan (unknown [10.20.151.239])
 by MTA-09.privateemail.com (Postfix) with ESMTPA id 3DC206004F;
 Fri,  7 May 2021 11:28:39 -0400 (EDT)
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
X-Inumbo-ID: d34aa4ec-29a2-408a-aec3-2b265d88776f
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] tools/misc/xen-vmtrace: handle more signals and install by default
Date: Fri,  7 May 2021 11:28:36 -0400
Message-Id: <20210507152836.20026-1-tamas@tklengyel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
---
 tools/misc/Makefile      |  2 +-
 tools/misc/xen-vmtrace.c | 12 +++++++++---
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/tools/misc/Makefile b/tools/misc/Makefile
index 2b683819d4..c32c42d546 100644
--- a/tools/misc/Makefile
+++ b/tools/misc/Makefile
@@ -25,6 +25,7 @@ INSTALL_SBIN-$(CONFIG_X86)     += xen-lowmemd
 INSTALL_SBIN-$(CONFIG_X86)     += xen-memshare
 INSTALL_SBIN-$(CONFIG_X86)     += xen-mfndump
 INSTALL_SBIN-$(CONFIG_X86)     += xen-ucode
+INSTALL_SBIN-$(CONFIG_X86)     += xen-vmtrace
 INSTALL_SBIN                   += xencov
 INSTALL_SBIN                   += xenhypfs
 INSTALL_SBIN                   += xenlockprof
@@ -51,7 +52,6 @@ TARGETS_COPY += xenpvnetboot
 TARGETS_BUILD := $(filter-out $(TARGETS_COPY),$(TARGETS_ALL))
 
 # ... including build-only targets
-TARGETS_BUILD-$(CONFIG_X86)    += xen-vmtrace
 TARGETS_BUILD += $(TARGETS_BUILD-y)
 
 .PHONY: all build
diff --git a/tools/misc/xen-vmtrace.c b/tools/misc/xen-vmtrace.c
index 35d14c6a9b..5b688a54af 100644
--- a/tools/misc/xen-vmtrace.c
+++ b/tools/misc/xen-vmtrace.c
@@ -44,7 +44,7 @@ static size_t size;
 static char *buf;
 
 static sig_atomic_t interrupted;
-static void int_handler(int signum)
+static void close_handler(int signum)
 {
     interrupted = 1;
 }
@@ -78,8 +78,14 @@ int main(int argc, char **argv)
     int rc, exit = 1;
     xenforeignmemory_resource_handle *fres = NULL;
 
-    if ( signal(SIGINT, int_handler) == SIG_ERR )
-        err(1, "Failed to register signal handler\n");
+    struct sigaction act;
+    act.sa_handler = close_handler;
+    act.sa_flags = 0;
+    sigemptyset(&act.sa_mask);
+    sigaction(SIGHUP,  &act, NULL);
+    sigaction(SIGTERM, &act, NULL);
+    sigaction(SIGINT,  &act, NULL);
+    sigaction(SIGALRM, &act, NULL);
 
     if ( argc != 3 )
     {
-- 
2.27.0


