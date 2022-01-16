Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7B448FBAB
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jan 2022 09:33:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257820.443182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n90yk-0008Rc-BM; Sun, 16 Jan 2022 08:33:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257820.443182; Sun, 16 Jan 2022 08:33:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n90yk-0008OQ-7P; Sun, 16 Jan 2022 08:33:34 +0000
Received: by outflank-mailman (input) for mailman id 257820;
 Sun, 16 Jan 2022 08:33:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=APY9=SA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n90yi-0008IQ-UV
 for xen-devel@lists.xenproject.org; Sun, 16 Jan 2022 08:33:33 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fbdcf1d2-76a6-11ec-9bbc-9dff3e4ee8c5;
 Sun, 16 Jan 2022 09:33:30 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B8B4B1F3B3;
 Sun, 16 Jan 2022 08:33:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8EBD813AB5;
 Sun, 16 Jan 2022 08:33:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ICuiIVrY42HyFQAAMHmgww
 (envelope-from <jgross@suse.com>); Sun, 16 Jan 2022 08:33:30 +0000
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
X-Inumbo-ID: fbdcf1d2-76a6-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642322010; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xMC2cVvglpwHtHj58DJ+I44rqFmTlB+K2cTWldEOzOc=;
	b=Z8BC/NvAOFa5H57kZB92bNQ6WlKFk3IuPrew6E4KfZN1ovw1oeBoQjyQgkNIioIqRzGK1A
	SJwPi+08i71eetf7eN6D54DfhGrY6P0BJWC61wBt8u/Jx5iwSNGOv5eQUaVritwbgzsub2
	4sLRrt8Cp3NThPxtOON3N+eG1KacYFw=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINIOS PATCH v3 01/12] remove event channel specific struct file definitions
Date: Sun, 16 Jan 2022 09:33:17 +0100
Message-Id: <20220116083328.26524-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220116083328.26524-1-jgross@suse.com>
References: <20220116083328.26524-1-jgross@suse.com>
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

Add an extern declaration for event_queue as it is used by
libxenevtchn.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- add extern declaration for event_queue (Andrew Cooper)
---
 Config.mk                     |  1 -
 arch/x86/testbuild/all-no     |  1 -
 arch/x86/testbuild/all-yes    |  1 -
 arch/x86/testbuild/newxen-yes |  1 -
 include/lib.h                 | 17 +++--------------
 lib/sys.c                     |  7 -------
 6 files changed, 3 insertions(+), 25 deletions(-)

diff --git a/Config.mk b/Config.mk
index 03023033..52eb26d8 100644
--- a/Config.mk
+++ b/Config.mk
@@ -200,7 +200,6 @@ CONFIG-n += CONFIG_PARAVIRT
 endif
 # Support legacy CONFIG_XC value
 CONFIG_XC ?= $(libc)
-CONFIG-$(CONFIG_XC) += CONFIG_LIBXENEVTCHN
 CONFIG-$(CONFIG_XC) += CONFIG_LIBXENGNTTAB
 
 CONFIG-$(lwip) += CONFIG_LWIP
diff --git a/arch/x86/testbuild/all-no b/arch/x86/testbuild/all-no
index 46f974de..15c954ff 100644
--- a/arch/x86/testbuild/all-no
+++ b/arch/x86/testbuild/all-no
@@ -14,7 +14,6 @@ CONFIG_KBDFRONT = n
 CONFIG_CONSFRONT = n
 CONFIG_XENBUS = n
 CONFIG_LIBXS = n
-CONFIG_LIBXENEVTCHN = n
 CONFIG_LIBXENGNTTAB = n
 CONFIG_LWIP = n
 CONFIG_BALLOON = n
diff --git a/arch/x86/testbuild/all-yes b/arch/x86/testbuild/all-yes
index 3ead12f1..9964d42f 100644
--- a/arch/x86/testbuild/all-yes
+++ b/arch/x86/testbuild/all-yes
@@ -17,6 +17,5 @@ CONFIG_LIBXS = y
 CONFIG_BALLOON = y
 CONFIG_USE_XEN_CONSOLE = y
 # The following are special: they need support from outside
-CONFIG_LIBXENEVTCHN = n
 CONFIG_LIBXENGNTTAB = n
 CONFIG_LWIP = n
diff --git a/arch/x86/testbuild/newxen-yes b/arch/x86/testbuild/newxen-yes
index 5c0b3c80..c2519938 100644
--- a/arch/x86/testbuild/newxen-yes
+++ b/arch/x86/testbuild/newxen-yes
@@ -18,6 +18,5 @@ CONFIG_BALLOON = y
 CONFIG_USE_XEN_CONSOLE = y
 XEN_INTERFACE_VERSION=__XEN_LATEST_INTERFACE_VERSION__
 # The following are special: they need support from outside
-CONFIG_LIBXENEVTCHN = n
 CONFIG_LIBXENGNTTAB = n
 CONFIG_LWIP = n
diff --git a/include/lib.h b/include/lib.h
index 44696806..5f24be5d 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -155,6 +155,8 @@ do {                                                           \
 void sanity_check(void);
 
 #ifdef HAVE_LIBC
+extern struct wait_queue_head event_queue;
+
 #define FTYPE_NONE       0
 #define FTYPE_CONSOLE    1
 #define FTYPE_FILE       2
@@ -169,19 +171,9 @@ void sanity_check(void);
 #define FTYPE_TPM_TIS   11
 #define FTYPE_XENBUS    12
 #define FTYPE_GNTMAP    13
-#define FTYPE_EVTCHN    14
-#define FTYPE_N         15
+#define FTYPE_N         14
 #define FTYPE_SPARE     16
 
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
@@ -189,9 +181,6 @@ struct file {
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
index e0ac5099..34f0193d 100644
--- a/lib/sys.c
+++ b/lib/sys.c
@@ -533,11 +533,6 @@ int close(int fd)
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
@@ -770,7 +765,6 @@ static const char *const file_types[] = {
     [FTYPE_NONE]    = "none",
     [FTYPE_CONSOLE] = "console",
     [FTYPE_XENBUS]  = "xenbus",
-    [FTYPE_EVTCHN]  = "evtchn",
     [FTYPE_SOCKET]  = "socket",
     [FTYPE_TAP]     = "net",
     [FTYPE_BLK]     = "blk",
@@ -970,7 +964,6 @@ static int select_poll(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exce
 	    FD_CLR(i, exceptfds);
 	    break;
 #endif
-	case FTYPE_EVTCHN:
 	case FTYPE_TAP:
 	case FTYPE_BLK:
 	case FTYPE_KBD:
-- 
2.26.2


