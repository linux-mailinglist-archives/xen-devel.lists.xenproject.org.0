Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C484548FBAD
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jan 2022 09:33:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257823.443208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n90ym-0000aF-Sq; Sun, 16 Jan 2022 08:33:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257823.443208; Sun, 16 Jan 2022 08:33:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n90ym-0000Y3-Og; Sun, 16 Jan 2022 08:33:36 +0000
Received: by outflank-mailman (input) for mailman id 257823;
 Sun, 16 Jan 2022 08:33:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=APY9=SA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n90yk-0008IP-OX
 for xen-devel@lists.xenproject.org; Sun, 16 Jan 2022 08:33:34 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc3fcfa4-76a6-11ec-a115-11989b9578b4;
 Sun, 16 Jan 2022 09:33:31 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E9384219A8;
 Sun, 16 Jan 2022 08:33:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BF0691346A;
 Sun, 16 Jan 2022 08:33:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KKZoLVrY42HyFQAAMHmgww
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
X-Inumbo-ID: fc3fcfa4-76a6-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642322010; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qdHeJugvWS+GzJaTnlBhH4gNO7kfbGMjcepHl4bCr44=;
	b=NMXCYAVn3u48qz/nj5DiauAFFiSxg6SiVsgRSmzrrMeo41l5GGj4hKFz3UgACcl9kuH1qI
	PrZMTnIYatgYIgsZTiJOhz5ntI/xmkt8/0ITGZ9kNlFm4joLLK647eohlZkxocMw5P7rcW
	MXgVM7w2VUdrNRtyx2OmTa/txOY6OEg=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINIOS PATCH v3 02/12] remove gnttab specific member from struct file
Date: Sun, 16 Jan 2022 09:33:18 +0100
Message-Id: <20220116083328.26524-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220116083328.26524-1-jgross@suse.com>
References: <20220116083328.26524-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The gnttab specific union member in struct file is no longer
needed, so remove it.

The gnttab file type and its associated handling can be removed, too,
as libxengnttab is now supplying a struct file_ops via a call of
alloc_file_type().

This removes all contents of CONFIG_LIBXENGNTTAB guarded sections, so
this config option can be removed.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
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
index 52eb26d8..1a24b30e 100644
--- a/Config.mk
+++ b/Config.mk
@@ -200,7 +200,6 @@ CONFIG-n += CONFIG_PARAVIRT
 endif
 # Support legacy CONFIG_XC value
 CONFIG_XC ?= $(libc)
-CONFIG-$(CONFIG_XC) += CONFIG_LIBXENGNTTAB
 
 CONFIG-$(lwip) += CONFIG_LWIP
 
diff --git a/arch/x86/testbuild/all-no b/arch/x86/testbuild/all-no
index 15c954ff..f79a1012 100644
--- a/arch/x86/testbuild/all-no
+++ b/arch/x86/testbuild/all-no
@@ -14,7 +14,6 @@ CONFIG_KBDFRONT = n
 CONFIG_CONSFRONT = n
 CONFIG_XENBUS = n
 CONFIG_LIBXS = n
-CONFIG_LIBXENGNTTAB = n
 CONFIG_LWIP = n
 CONFIG_BALLOON = n
 CONFIG_USE_XEN_CONSOLE = n
diff --git a/arch/x86/testbuild/all-yes b/arch/x86/testbuild/all-yes
index 9964d42f..faa3af32 100644
--- a/arch/x86/testbuild/all-yes
+++ b/arch/x86/testbuild/all-yes
@@ -17,5 +17,4 @@ CONFIG_LIBXS = y
 CONFIG_BALLOON = y
 CONFIG_USE_XEN_CONSOLE = y
 # The following are special: they need support from outside
-CONFIG_LIBXENGNTTAB = n
 CONFIG_LWIP = n
diff --git a/arch/x86/testbuild/newxen-yes b/arch/x86/testbuild/newxen-yes
index c2519938..dc83e670 100644
--- a/arch/x86/testbuild/newxen-yes
+++ b/arch/x86/testbuild/newxen-yes
@@ -18,5 +18,4 @@ CONFIG_BALLOON = y
 CONFIG_USE_XEN_CONSOLE = y
 XEN_INTERFACE_VERSION=__XEN_LATEST_INTERFACE_VERSION__
 # The following are special: they need support from outside
-CONFIG_LIBXENGNTTAB = n
 CONFIG_LWIP = n
diff --git a/gntmap.c b/gntmap.c
index 6fa1dac1..3422ab23 100644
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
index 5f24be5d..5838b0d4 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -170,8 +170,7 @@ extern struct wait_queue_head event_queue;
 #define FTYPE_TPMFRONT  10
 #define FTYPE_TPM_TIS   11
 #define FTYPE_XENBUS    12
-#define FTYPE_GNTMAP    13
-#define FTYPE_N         14
+#define FTYPE_N         13
 #define FTYPE_SPARE     16
 
 struct file {
@@ -181,7 +180,6 @@ struct file {
     union {
         int fd; /* Any fd from an upper layer. */
         void *dev;
-	struct gntmap gntmap;
     };
 };
 
diff --git a/lib/sys.c b/lib/sys.c
index 34f0193d..6ba26294 100644
--- a/lib/sys.c
+++ b/lib/sys.c
@@ -533,11 +533,6 @@ int close(int fd)
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


