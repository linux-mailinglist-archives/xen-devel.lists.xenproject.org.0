Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E9C48B087
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 16:12:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255868.438746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Iox-00035r-MF; Tue, 11 Jan 2022 15:12:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255868.438746; Tue, 11 Jan 2022 15:12:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Iox-00030L-DS; Tue, 11 Jan 2022 15:12:23 +0000
Received: by outflank-mailman (input) for mailman id 255868;
 Tue, 11 Jan 2022 15:12:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zHlr=R3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n7Iov-0002Fw-Cj
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 15:12:21 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd5d2c65-72f0-11ec-81c1-a30af7de8005;
 Tue, 11 Jan 2022 16:12:17 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 517B51F3B1;
 Tue, 11 Jan 2022 15:12:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2BB1213DDD;
 Tue, 11 Jan 2022 15:12:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OI96CVGe3WG8AwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 11 Jan 2022 15:12:17 +0000
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
X-Inumbo-ID: dd5d2c65-72f0-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641913937; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w1Lvr7st24bBGrZRxVwRlwFD2dxAwXVMl1+mfqeQNHE=;
	b=OZ0R2DCXa0L+ZUY2zZfTfxLjFTERlfqtPNXSkOfG19TQKIHgl69CgBeKlUz6peY6TRp2/G
	DFHQsTIY9bhNip/NE8/MESgTTBB1SQru9Acq+eimfagktjBzkoKmoURGNK5bA/9TJzkK3f
	k/Ids5H5XRPG9IpqldgDlUCVIH5LkCs=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 02/12] mini-os: remove gnttab specific member from struct file
Date: Tue, 11 Jan 2022 16:12:05 +0100
Message-Id: <20220111151215.22955-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220111151215.22955-1-jgross@suse.com>
References: <20220111151215.22955-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The event channel specific union member in struct file is no longer
needed, so remove it.

The gnttab file type and its associated handling can be removed, too,
as libxengnttab is now supplying a struct file_ops via a call of
alloc_file_type().

This removes all contents of CONFIG_LIBXENGNTTAB guarded sections, so
this config option can be removed.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 Config.mk                     | 1 -
 arch/x86/testbuild/all-no     | 1 -
 arch/x86/testbuild/all-yes    | 1 -
 arch/x86/testbuild/newxen-yes | 1 -
 gntmap.c                      | 2 +-
 include/lib.h                 | 4 +---
 lib/sys.c                     | 5 -----
 7 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/Config.mk b/Config.mk
index c244adc..eb84515 100644
--- a/Config.mk
+++ b/Config.mk
@@ -197,7 +197,6 @@ CONFIG-n += CONFIG_PARAVIRT
 endif
 # Support legacy CONFIG_XC value
 CONFIG_XC ?= $(libc)
-CONFIG-$(CONFIG_XC) += CONFIG_LIBXENGNTTAB
 
 CONFIG-$(lwip) += CONFIG_LWIP
 
diff --git a/arch/x86/testbuild/all-no b/arch/x86/testbuild/all-no
index 202c317..c429354 100644
--- a/arch/x86/testbuild/all-no
+++ b/arch/x86/testbuild/all-no
@@ -13,7 +13,6 @@ CONFIG_FBFRONT = n
 CONFIG_KBDFRONT = n
 CONFIG_CONSFRONT = n
 CONFIG_XENBUS = n
-CONFIG_LIBXENGNTTAB = n
 CONFIG_LWIP = n
 CONFIG_BALLOON = n
 CONFIG_USE_XEN_CONSOLE = n
diff --git a/arch/x86/testbuild/all-yes b/arch/x86/testbuild/all-yes
index eb495a4..6c6096b 100644
--- a/arch/x86/testbuild/all-yes
+++ b/arch/x86/testbuild/all-yes
@@ -16,5 +16,4 @@ CONFIG_XENBUS = y
 CONFIG_BALLOON = y
 CONFIG_USE_XEN_CONSOLE = y
 # The following are special: they need support from outside
-CONFIG_LIBXENGNTTAB = n
 CONFIG_LWIP = n
diff --git a/arch/x86/testbuild/newxen-yes b/arch/x86/testbuild/newxen-yes
index bf25ace..88094fc 100644
--- a/arch/x86/testbuild/newxen-yes
+++ b/arch/x86/testbuild/newxen-yes
@@ -17,5 +17,4 @@ CONFIG_BALLOON = y
 CONFIG_USE_XEN_CONSOLE = y
 XEN_INTERFACE_VERSION=__XEN_LATEST_INTERFACE_VERSION__
 # The following are special: they need support from outside
-CONFIG_LIBXENGNTTAB = n
 CONFIG_LWIP = n
diff --git a/gntmap.c b/gntmap.c
index 6fa1dac..3422ab2 100644
--- a/gntmap.c
+++ b/gntmap.c
@@ -3,7 +3,7 @@
  *
  * Diego Ongaro <diego.ongaro@citrix.com>, July 2008
  *
- * Files of type FTYPE_GNTMAP contain a gntmap, which is an array of
+ * Files of libxengnttab contain a gntmap, which is an array of
  * (host address, grant handle) pairs. Grant handles come from a hypervisor map
  * operation and are needed for the corresponding unmap.
  *
diff --git a/include/lib.h b/include/lib.h
index df972ef..283abb8 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -168,8 +168,7 @@ void sanity_check(void);
 #define FTYPE_TPMFRONT  10
 #define FTYPE_TPM_TIS   11
 #define FTYPE_XENBUS    12
-#define FTYPE_GNTMAP    13
-#define FTYPE_N         14
+#define FTYPE_N         13
 #define FTYPE_SPARE     16
 
 typedef int file_read_func(int fd, void *buf, size_t nbytes);
@@ -205,7 +204,6 @@ struct file {
     union {
         int fd; /* Any fd from an upper layer. */
         void *dev;
-	struct gntmap gntmap;
     };
 };
 
diff --git a/lib/sys.c b/lib/sys.c
index 8fa1fee..9540410 100644
--- a/lib/sys.c
+++ b/lib/sys.c
@@ -505,11 +505,6 @@ int close(int fd)
 	    res = lwip_close(files[fd].fd);
             break;
 #endif
-#ifdef CONFIG_LIBXENGNTTAB
-	case FTYPE_GNTMAP:
-	    minios_gnttab_close_fd(fd);
-            break;
-#endif
 #ifdef CONFIG_NETFRONT
 	case FTYPE_TAP:
 	    shutdown_netfront(files[fd].dev);
-- 
2.26.2


