Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C361348FB35
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jan 2022 07:46:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257778.443073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8zII-0000hJ-A4; Sun, 16 Jan 2022 06:45:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257778.443073; Sun, 16 Jan 2022 06:45:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8zII-0000fF-3G; Sun, 16 Jan 2022 06:45:38 +0000
Received: by outflank-mailman (input) for mailman id 257778;
 Sun, 16 Jan 2022 06:45:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=APY9=SA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n8zIF-0008SH-TN
 for xen-devel@lists.xenproject.org; Sun, 16 Jan 2022 06:45:36 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e585290c-7697-11ec-a115-11989b9578b4;
 Sun, 16 Jan 2022 07:45:32 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 50CC41F45F;
 Sun, 16 Jan 2022 06:45:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 26CC413350;
 Sun, 16 Jan 2022 06:45:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YGkkCAq/42H0eQAAMHmgww
 (envelope-from <jgross@suse.com>); Sun, 16 Jan 2022 06:45:30 +0000
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
X-Inumbo-ID: e585290c-7697-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642315530; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ETpovp+31TFjCpvLCv0O3rPi8bZ/B9q/oQBK6QgCQZw=;
	b=UiJJ71mN31xttAy/iMQhq68XNaZdnpgNvD0TzGtyyO2EIE3iPFXgib1W9+yJWPQSQ/oQox
	I2FJmPbZOOf+bLTHJVTQD9uDVdJQ6lX8BX0dKtncWtSZhebT+NAAs/JbZfgarwrp0xR/6Z
	8RvYqQpo/1FF0GFIjzA0ytbkppLHLfk=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINIOS PATCH v3 3/5] remove file type FTYPE_XC
Date: Sun, 16 Jan 2022 07:45:25 +0100
Message-Id: <20220116064527.23519-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220116064527.23519-1-jgross@suse.com>
References: <20220116064527.23519-1-jgross@suse.com>
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
V3:
- moved patch in series (Andrew Cooper)
---
 Config.mk                     |  1 -
 arch/x86/testbuild/all-no     |  1 -
 arch/x86/testbuild/all-yes    |  1 -
 arch/x86/testbuild/newxen-yes |  1 -
 include/lib.h                 |  1 -
 lib/sys.c                     | 13 -------------
 6 files changed, 18 deletions(-)

diff --git a/Config.mk b/Config.mk
index 5e660891..1e083881 100644
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
index 7972ecd5..d6fc2608 100644
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
index bc8eea57..98bbfebf 100644
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
index f72123b5..06032004 100644
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
index 7a0546bd..7ca90768 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -159,7 +159,6 @@ enum fd_type {
     FTYPE_CONSOLE,
     FTYPE_FILE,
     FTYPE_XENBUS,
-    FTYPE_XC,
     FTYPE_EVTCHN,
     FTYPE_GNTMAP,
     FTYPE_SOCKET,
diff --git a/lib/sys.c b/lib/sys.c
index 7df77cc6..a24687b7 100644
--- a/lib/sys.c
+++ b/lib/sys.c
@@ -87,7 +87,6 @@
     }
 
 #define NOFILE 32
-extern void minios_interface_close_fd(int fd);
 extern void minios_evtchn_close_fd(int fd);
 extern void minios_gnttab_close_fd(int fd);
 
@@ -443,11 +442,6 @@ int close(int fd)
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
@@ -651,7 +645,6 @@ static const char file_types[] = {
     [FTYPE_NONE]	= 'N',
     [FTYPE_CONSOLE]	= 'C',
     [FTYPE_XENBUS]	= 'S',
-    [FTYPE_XC]		= 'X',
     [FTYPE_EVTCHN]	= 'E',
     [FTYPE_SOCKET]	= 's',
     [FTYPE_TAP]		= 'T',
@@ -1383,12 +1376,6 @@ void *mmap(void *start, size_t length, int prot, int flags, int fd, off_t offset
 
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


