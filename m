Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFD377B325
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 10:02:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583404.913620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSWv-0005m7-SH; Mon, 14 Aug 2023 08:02:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583404.913620; Mon, 14 Aug 2023 08:02:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSWv-0005kI-Oo; Mon, 14 Aug 2023 08:02:25 +0000
Received: by outflank-mailman (input) for mailman id 583404;
 Mon, 14 Aug 2023 08:02:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzbS=D7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qVSJo-0001Z5-Va
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 07:48:52 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 027ad53b-3a77-11ee-8613-37d641c3527e;
 Mon, 14 Aug 2023 09:48:51 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2AB4721984;
 Mon, 14 Aug 2023 07:48:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EFBB6138EE;
 Mon, 14 Aug 2023 07:48:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HV0kOWLc2WRdQgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 14 Aug 2023 07:48:50 +0000
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
X-Inumbo-ID: 027ad53b-3a77-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1691999331; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nsYs26vkPO/sybh641FmkDI4sYFmKW+moaPaFj0VfVw=;
	b=j1FPrPFQpmB4/jCgVVXKc1Yfas9SBXdhBSb9oakOV0eN/fP515l+cGsEQmt1YJXsvVl2kk
	Q7vkV9D0k9RNT6xJFogEssx4LWs9F70KA2sGTp1fU8WVmrQZa87EHu/F5k6otjUx4odPET
	Vfce0j615awjQmrrE1PAtH9i5zMGWEc=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH v4 18/19] tools/config: add XEN_RUN_STORED to config.h
Date: Mon, 14 Aug 2023 09:47:06 +0200
Message-Id: <20230814074707.27696-19-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230814074707.27696-1-jgross@suse.com>
References: <20230814074707.27696-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of adding the definition of XEN_RUN_STORED to CFLAGS in
multiple Makefiles, let configure add it to tools/config.h instead.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V4:
- new patch
---
 configure                      | 5 +++++
 m4/paths.m4                    | 1 +
 tools/config.h.in              | 3 +++
 tools/configure                | 5 +++++
 tools/libs/store/Makefile      | 1 -
 tools/xenstore/Makefile.common | 1 -
 6 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 99f8434cbf..dd05f314f6 100755
--- a/configure
+++ b/configure
@@ -2079,6 +2079,11 @@ _ACEOF
 XEN_RUN_STORED=$rundir_path/xenstored
 
 
+cat >>confdefs.h <<_ACEOF
+#define XEN_RUN_STORED "$XEN_RUN_STORED"
+_ACEOF
+
+
 XEN_LIB_DIR=$localstatedir/lib/xen
 
 
diff --git a/m4/paths.m4 b/m4/paths.m4
index e4104bcce0..3f94c62efb 100644
--- a/m4/paths.m4
+++ b/m4/paths.m4
@@ -138,6 +138,7 @@ AC_DEFINE_UNQUOTED([XEN_LOG_DIR], ["$XEN_LOG_DIR"], [Xen's log dir])
 
 XEN_RUN_STORED=$rundir_path/xenstored
 AC_SUBST(XEN_RUN_STORED)
+AC_DEFINE_UNQUOTED([XEN_RUN_STORED], ["$XEN_RUN_STORED"], [Xenstore's runstate path])
 
 XEN_LIB_DIR=$localstatedir/lib/xen
 AC_SUBST(XEN_LIB_DIR)
diff --git a/tools/config.h.in b/tools/config.h.in
index 3071cb3998..41014a65ed 100644
--- a/tools/config.h.in
+++ b/tools/config.h.in
@@ -153,6 +153,9 @@
 /* Xen's script dir */
 #undef XEN_SCRIPT_DIR
 
+/* Xenstore's runstate path */
+#undef XEN_RUN_STORED
+
 /* Enable large inode numbers on Mac OS X 10.5.  */
 #ifndef _DARWIN_USE_64_BIT_INODE
 # define _DARWIN_USE_64_BIT_INODE 1
diff --git a/tools/configure b/tools/configure
index 52b4717d01..5c05fa5ea1 100755
--- a/tools/configure
+++ b/tools/configure
@@ -4060,6 +4060,11 @@ _ACEOF
 XEN_RUN_STORED=$rundir_path/xenstored
 
 
+cat >>confdefs.h <<_ACEOF
+#define XEN_RUN_STORED "$XEN_RUN_STORED"
+_ACEOF
+
+
 XEN_LIB_DIR=$localstatedir/lib/xen
 
 
diff --git a/tools/libs/store/Makefile b/tools/libs/store/Makefile
index c1a1508713..0649cf8307 100644
--- a/tools/libs/store/Makefile
+++ b/tools/libs/store/Makefile
@@ -18,7 +18,6 @@ include ../libs.mk
 # Include configure output (config.h)
 CFLAGS += -include $(XEN_ROOT)/tools/config.h
 CFLAGS += $(CFLAGS_libxentoolcore)
-CFLAGS += -DXEN_RUN_STORED="\"$(XEN_RUN_STORED)\""
 
 xs.opic: CFLAGS += -DUSE_PTHREAD
 ifeq ($(CONFIG_Linux),y)
diff --git a/tools/xenstore/Makefile.common b/tools/xenstore/Makefile.common
index 3259ab51e6..41973a8a5e 100644
--- a/tools/xenstore/Makefile.common
+++ b/tools/xenstore/Makefile.common
@@ -16,7 +16,6 @@ CFLAGS += $(CFLAGS_libxenevtchn)
 CFLAGS += $(CFLAGS_libxenctrl)
 CFLAGS += $(CFLAGS_libxenguest)
 CFLAGS += $(CFLAGS_libxentoolcore)
-CFLAGS += -DXEN_RUN_STORED="\"$(XEN_RUN_STORED)\""
 
 ifdef CONFIG_STUBDOM
 CFLAGS += -DNO_SOCKETS=1
-- 
2.35.3


