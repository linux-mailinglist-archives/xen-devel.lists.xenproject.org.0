Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3669E48B066
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 16:07:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255815.438580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7IkN-00045r-Sz; Tue, 11 Jan 2022 15:07:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255815.438580; Tue, 11 Jan 2022 15:07:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7IkN-00043T-OA; Tue, 11 Jan 2022 15:07:39 +0000
Received: by outflank-mailman (input) for mailman id 255815;
 Tue, 11 Jan 2022 15:07:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zHlr=R3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n7Ibg-0002OZ-FQ
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 14:58:40 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec5ddb25-72ee-11ec-81c1-a30af7de8005;
 Tue, 11 Jan 2022 15:58:23 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 75CCC212C3;
 Tue, 11 Jan 2022 14:58:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4E6D313DDD;
 Tue, 11 Jan 2022 14:58:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cBnnEQ+b3WH9eQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 11 Jan 2022 14:58:23 +0000
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
X-Inumbo-ID: ec5ddb25-72ee-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641913103; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3MRu1fvGvRxSYETAwaGXHjdx6AuZiPRv8J9xLv9qXpA=;
	b=cE07+p9X7+a1mj4Yq/WttMObovohhvxLc1iNnnT+9yGsXpv/JCEv5uPOVrQkkzW+GVDEFD
	hHF+ZUGCyNqcCpqZuTDGXeowTB3PdeAJ6YPJvhD5e/ldwx7SRGZ5efDmP0zugqxIC+1crm
	4ANsHXOr9LvGgFLPD49G9lNF3CLgF48=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 18/18] mini-os: remove file type FTYPE_XC
Date: Tue, 11 Jan 2022 15:58:17 +0100
Message-Id: <20220111145817.22170-19-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220111145817.22170-1-jgross@suse.com>
References: <20220111145817.22170-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The only reason for the file type FTYPE_XC has been gone long time
ago: it was needed for xc_map_foreign_bulk(), which has been switched
to use libxenforeignmemory and doesn't need this special file any
more.

So remove everything related to FTYPE_XC.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 Config.mk                     |  1 -
 arch/x86/testbuild/all-no     |  1 -
 arch/x86/testbuild/all-yes    |  1 -
 arch/x86/testbuild/newxen-yes |  1 -
 include/lib.h                 |  3 +--
 lib/sys.c                     | 13 -------------
 6 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/Config.mk b/Config.mk
index 5e66089..1e08388 100644
--- a/Config.mk
+++ b/Config.mk
@@ -197,7 +197,6 @@ CONFIG-n += CONFIG_PARAVIRT
 endif
 # Support legacy CONFIG_XC value
 CONFIG_XC ?= $(libc)
-CONFIG-$(CONFIG_XC) += CONFIG_LIBXENCTRL
 CONFIG-$(CONFIG_XC) += CONFIG_LIBXENEVTCHN
 CONFIG-$(CONFIG_XC) += CONFIG_LIBXENGNTTAB
 
diff --git a/arch/x86/testbuild/all-no b/arch/x86/testbuild/all-no
index 7972ecd..d6fc260 100644
--- a/arch/x86/testbuild/all-no
+++ b/arch/x86/testbuild/all-no
@@ -13,7 +13,6 @@ CONFIG_FBFRONT = n
 CONFIG_KBDFRONT = n
 CONFIG_CONSFRONT = n
 CONFIG_XENBUS = n
-CONFIG_LIBXENCTRL = n
 CONFIG_LIBXENEVTCHN = n
 CONFIG_LIBXENGNTTAB = n
 CONFIG_LWIP = n
diff --git a/arch/x86/testbuild/all-yes b/arch/x86/testbuild/all-yes
index bc8eea5..98bbfeb 100644
--- a/arch/x86/testbuild/all-yes
+++ b/arch/x86/testbuild/all-yes
@@ -16,7 +16,6 @@ CONFIG_XENBUS = y
 CONFIG_BALLOON = y
 CONFIG_USE_XEN_CONSOLE = y
 # The following are special: they need support from outside
-CONFIG_LIBXENCTRL = n
 CONFIG_LIBXENEVTCHN = n
 CONFIG_LIBXENGNTTAB = n
 CONFIG_LWIP = n
diff --git a/arch/x86/testbuild/newxen-yes b/arch/x86/testbuild/newxen-yes
index f72123b..0603200 100644
--- a/arch/x86/testbuild/newxen-yes
+++ b/arch/x86/testbuild/newxen-yes
@@ -17,7 +17,6 @@ CONFIG_BALLOON = y
 CONFIG_USE_XEN_CONSOLE = y
 XEN_INTERFACE_VERSION=__XEN_LATEST_INTERFACE_VERSION__
 # The following are special: they need support from outside
-CONFIG_LIBXENCTRL = n
 CONFIG_LIBXENEVTCHN = n
 CONFIG_LIBXENGNTTAB = n
 CONFIG_LWIP = n
diff --git a/include/lib.h b/include/lib.h
index b40e213..4892320 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -170,8 +170,7 @@ void sanity_check(void);
 #define FTYPE_XENBUS    12
 #define FTYPE_GNTMAP    13
 #define FTYPE_EVTCHN    14
-#define FTYPE_XC        15
-#define FTYPE_N         16
+#define FTYPE_N         15
 #define FTYPE_SPARE     16
 
 typedef int file_read_func(int fd, void *buf, size_t nbytes);
diff --git a/lib/sys.c b/lib/sys.c
index c327247..52876e0 100644
--- a/lib/sys.c
+++ b/lib/sys.c
@@ -87,7 +87,6 @@
     }
 
 #define NOFILE 32
-extern void minios_interface_close_fd(int fd);
 extern void minios_evtchn_close_fd(int fd);
 extern void minios_gnttab_close_fd(int fd);
 
@@ -506,11 +505,6 @@ int close(int fd)
 	    res = lwip_close(files[fd].fd);
             break;
 #endif
-#ifdef CONFIG_LIBXENCTRL
-	case FTYPE_XC:
-	    minios_interface_close_fd(fd);
-            break;
-#endif
 #ifdef CONFIG_LIBXENEVTCHN
 	case FTYPE_EVTCHN:
 	    minios_evtchn_close_fd(fd);
@@ -729,7 +723,6 @@ static const char *file_types[] = {
     [FTYPE_NONE]    = "none",
     [FTYPE_CONSOLE] = "console",
     [FTYPE_XENBUS]  = "xenbus",
-    [FTYPE_XC]      = "ctrl",
     [FTYPE_EVTCHN]  = "evtchn",
     [FTYPE_SOCKET]  = "socket",
     [FTYPE_TAP]     = "net",
@@ -1510,12 +1503,6 @@ void *mmap(void *start, size_t length, int prot, int flags, int fd, off_t offset
 
     if (fd == -1)
         return map_zero(n, 1);
-#ifdef CONFIG_LIBXENCTRL
-    else if (files[fd].type == FTYPE_XC) {
-        unsigned long zero = 0;
-        return map_frames_ex(&zero, n, 0, 0, 1, DOMID_SELF, NULL, 0);
-    }
-#endif
     else if (files[fd].type == FTYPE_MEM) {
         unsigned long first_mfn = offset >> PAGE_SHIFT;
         return map_frames_ex(&first_mfn, n, 0, 1, 1, DOMID_IO, NULL, _PAGE_PRESENT|_PAGE_RW);
-- 
2.26.2


