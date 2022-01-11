Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC1948B084
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 16:12:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255864.438721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Iou-0002c5-MT; Tue, 11 Jan 2022 15:12:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255864.438721; Tue, 11 Jan 2022 15:12:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Iou-0002Wr-HI; Tue, 11 Jan 2022 15:12:20 +0000
Received: by outflank-mailman (input) for mailman id 255864;
 Tue, 11 Jan 2022 15:12:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zHlr=R3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n7Iot-0002Fw-CB
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 15:12:19 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd43726e-72f0-11ec-81c1-a30af7de8005;
 Tue, 11 Jan 2022 16:12:17 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 258AF212C2;
 Tue, 11 Jan 2022 15:12:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F1B0F1404B;
 Tue, 11 Jan 2022 15:12:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QOfQOVCe3WG8AwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 11 Jan 2022 15:12:16 +0000
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
X-Inumbo-ID: dd43726e-72f0-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641913937; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DjsZaSOIcJ6iFahsf84mXvc0XkEk+3Mf01A/EmIC1Ic=;
	b=SunZVRlMBMQ3pF24OyRoCstzJwKxSJCyqCjGXv45rBsLO5hncikrQd1hFjeYQYTbe65f1b
	j7YVDhEm4/KrPjfX5hXdCXlxftCzURRb4u6dYwLVS9XUGgcpmowd7zp4zR7njak382zbOJ
	m9iIHn/cRS6SIi26mR9kVwyOPi5SfBA=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 01/12] mini-os: remove event channel specific struct file definitions
Date: Tue, 11 Jan 2022 16:12:04 +0100
Message-Id: <20220111151215.22955-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220111151215.22955-1-jgross@suse.com>
References: <20220111151215.22955-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The event channel specific union member in struct file is no longer
needed, so remove it together with the associated structure
definitions.

The event channel file type and its associated handling can be removed,
too, as libxenevtchn is now supplying a struct file_ops via a call of
alloc_file_type().

This removes all contents of CONFIG_LIBXENEVTCHN guarded sections, so
this config option can be removed.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 Config.mk                     |  1 -
 arch/x86/testbuild/all-no     |  1 -
 arch/x86/testbuild/all-yes    |  1 -
 arch/x86/testbuild/newxen-yes |  1 -
 include/lib.h                 | 15 +--------------
 lib/sys.c                     |  7 -------
 6 files changed, 1 insertion(+), 25 deletions(-)

diff --git a/Config.mk b/Config.mk
index 1e08388..c244adc 100644
--- a/Config.mk
+++ b/Config.mk
@@ -197,7 +197,6 @@ CONFIG-n += CONFIG_PARAVIRT
 endif
 # Support legacy CONFIG_XC value
 CONFIG_XC ?= $(libc)
-CONFIG-$(CONFIG_XC) += CONFIG_LIBXENEVTCHN
 CONFIG-$(CONFIG_XC) += CONFIG_LIBXENGNTTAB
 
 CONFIG-$(lwip) += CONFIG_LWIP
diff --git a/arch/x86/testbuild/all-no b/arch/x86/testbuild/all-no
index d6fc260..202c317 100644
--- a/arch/x86/testbuild/all-no
+++ b/arch/x86/testbuild/all-no
@@ -13,7 +13,6 @@ CONFIG_FBFRONT = n
 CONFIG_KBDFRONT = n
 CONFIG_CONSFRONT = n
 CONFIG_XENBUS = n
-CONFIG_LIBXENEVTCHN = n
 CONFIG_LIBXENGNTTAB = n
 CONFIG_LWIP = n
 CONFIG_BALLOON = n
diff --git a/arch/x86/testbuild/all-yes b/arch/x86/testbuild/all-yes
index 98bbfeb..eb495a4 100644
--- a/arch/x86/testbuild/all-yes
+++ b/arch/x86/testbuild/all-yes
@@ -16,6 +16,5 @@ CONFIG_XENBUS = y
 CONFIG_BALLOON = y
 CONFIG_USE_XEN_CONSOLE = y
 # The following are special: they need support from outside
-CONFIG_LIBXENEVTCHN = n
 CONFIG_LIBXENGNTTAB = n
 CONFIG_LWIP = n
diff --git a/arch/x86/testbuild/newxen-yes b/arch/x86/testbuild/newxen-yes
index 0603200..bf25ace 100644
--- a/arch/x86/testbuild/newxen-yes
+++ b/arch/x86/testbuild/newxen-yes
@@ -17,6 +17,5 @@ CONFIG_BALLOON = y
 CONFIG_USE_XEN_CONSOLE = y
 XEN_INTERFACE_VERSION=__XEN_LATEST_INTERFACE_VERSION__
 # The following are special: they need support from outside
-CONFIG_LIBXENEVTCHN = n
 CONFIG_LIBXENGNTTAB = n
 CONFIG_LWIP = n
diff --git a/include/lib.h b/include/lib.h
index 4892320..df972ef 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -169,8 +169,7 @@ void sanity_check(void);
 #define FTYPE_TPM_TIS   11
 #define FTYPE_XENBUS    12
 #define FTYPE_GNTMAP    13
-#define FTYPE_EVTCHN    14
-#define FTYPE_N         15
+#define FTYPE_N         14
 #define FTYPE_SPARE     16
 
 typedef int file_read_func(int fd, void *buf, size_t nbytes);
@@ -199,15 +198,6 @@ off_t lseek_default(int fd, off_t offset, int whence);
 bool select_yes(int fd);
 bool select_read_flag(int fd);
 
-LIST_HEAD(evtchn_port_list, evtchn_port_info);
-
-struct evtchn_port_info {
-        LIST_ENTRY(evtchn_port_info) list;
-        evtchn_port_t port;
-        unsigned long pending;
-        int bound;
-};
-
 struct file {
     unsigned int type;
     bool read;	/* maybe available for read */
@@ -215,9 +205,6 @@ struct file {
     union {
         int fd; /* Any fd from an upper layer. */
         void *dev;
-	struct {
-	    struct evtchn_port_list ports;
-	} evtchn;
 	struct gntmap gntmap;
     };
 };
diff --git a/lib/sys.c b/lib/sys.c
index 52876e0..8fa1fee 100644
--- a/lib/sys.c
+++ b/lib/sys.c
@@ -505,11 +505,6 @@ int close(int fd)
 	    res = lwip_close(files[fd].fd);
             break;
 #endif
-#ifdef CONFIG_LIBXENEVTCHN
-	case FTYPE_EVTCHN:
-	    minios_evtchn_close_fd(fd);
-            break;
-#endif
 #ifdef CONFIG_LIBXENGNTTAB
 	case FTYPE_GNTMAP:
 	    minios_gnttab_close_fd(fd);
@@ -723,7 +718,6 @@ static const char *file_types[] = {
     [FTYPE_NONE]    = "none",
     [FTYPE_CONSOLE] = "console",
     [FTYPE_XENBUS]  = "xenbus",
-    [FTYPE_EVTCHN]  = "evtchn",
     [FTYPE_SOCKET]  = "socket",
     [FTYPE_TAP]     = "net",
     [FTYPE_BLK]     = "blk",
@@ -915,7 +909,6 @@ static int select_poll(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exce
 	    FD_CLR(i, exceptfds);
 	    break;
 #endif
-	case FTYPE_EVTCHN:
 	case FTYPE_TAP:
 	case FTYPE_BLK:
 	case FTYPE_KBD:
-- 
2.26.2


