Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 184AE421140
	for <lists+xen-devel@lfdr.de>; Mon,  4 Oct 2021 16:20:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201543.356124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXOoq-0008P5-UL; Mon, 04 Oct 2021 14:19:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201543.356124; Mon, 04 Oct 2021 14:19:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXOoq-0008M8-QV; Mon, 04 Oct 2021 14:19:52 +0000
Received: by outflank-mailman (input) for mailman id 201543;
 Mon, 04 Oct 2021 14:19:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7SE7=OY=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mXOoo-0007UW-R6
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 14:19:50 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fea165a3-9fc8-4659-87e8-c3c3207b87ac;
 Mon, 04 Oct 2021 14:19:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C11A320209;
 Mon,  4 Oct 2021 14:19:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9662E13342;
 Mon,  4 Oct 2021 14:19:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EBd+I3ANW2EjcAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 04 Oct 2021 14:19:28 +0000
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
X-Inumbo-ID: fea165a3-9fc8-4659-87e8-c3c3207b87ac
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1633357168; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y5GfRa8P1HM/l2d/V3JUY7JMhDq7I4DxXT7aS9qRvTY=;
	b=W3eGR43ESS6dXdxEmY4LcCwF28K5utJUzvDFY9+A42Rt0U0pJy4aIE9Nv4P9mofsPdFDIQ
	hDOODF0d5Xk/l616m8UcyenxTdkMgfsiG7AnBveF/a3k/m2M/qMaWZJlS53ozqHhiqYgTv
	s2GzF6oqJniMQaDs8QGYmfaUngdCF3Y=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 2/2] mini-os: add config options for xen libraries
Date: Mon,  4 Oct 2021 16:19:24 +0200
Message-Id: <20211004141924.7088-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211004141924.7088-1-jgross@suse.com>
References: <20211004141924.7088-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today close hooks into libxenctrl, libxenevtchn and libxengnttab are
under the CONFIG_XC umbrella. In order to support Mini-OS builds using
stable Xen libraries only, add CONFIG_LIBXENCTRL, CONFIG_LIBXENEVTCHN
and CONFIG_LIBXENGNTTAB config options.

In case CONFIG_XC was specified in the Mini-OS config explicitly, set
the three new variables to the specified value.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 Config.mk                     | 7 ++++++-
 arch/x86/testbuild/all-no     | 4 +++-
 arch/x86/testbuild/all-yes    | 9 +++++----
 arch/x86/testbuild/newxen-yes | 9 +++++----
 lib/sys.c                     | 8 ++++++--
 5 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/Config.mk b/Config.mk
index 8f4cea9..5e66089 100644
--- a/Config.mk
+++ b/Config.mk
@@ -195,7 +195,12 @@ CONFIG-y += CONFIG_PARAVIRT
 else
 CONFIG-n += CONFIG_PARAVIRT
 endif
-CONFIG-$(libc) += CONFIG_XC
+# Support legacy CONFIG_XC value
+CONFIG_XC ?= $(libc)
+CONFIG-$(CONFIG_XC) += CONFIG_LIBXENCTRL
+CONFIG-$(CONFIG_XC) += CONFIG_LIBXENEVTCHN
+CONFIG-$(CONFIG_XC) += CONFIG_LIBXENGNTTAB
+
 CONFIG-$(lwip) += CONFIG_LWIP
 
 $(foreach i,$(CONFIG-y),$(eval $(i) ?= y))
diff --git a/arch/x86/testbuild/all-no b/arch/x86/testbuild/all-no
index 1c50bba..7972ecd 100644
--- a/arch/x86/testbuild/all-no
+++ b/arch/x86/testbuild/all-no
@@ -13,7 +13,9 @@ CONFIG_FBFRONT = n
 CONFIG_KBDFRONT = n
 CONFIG_CONSFRONT = n
 CONFIG_XENBUS = n
-CONFIG_XC = n
+CONFIG_LIBXENCTRL = n
+CONFIG_LIBXENEVTCHN = n
+CONFIG_LIBXENGNTTAB = n
 CONFIG_LWIP = n
 CONFIG_BALLOON = n
 CONFIG_USE_XEN_CONSOLE = n
diff --git a/arch/x86/testbuild/all-yes b/arch/x86/testbuild/all-yes
index 5464342..bc8eea5 100644
--- a/arch/x86/testbuild/all-yes
+++ b/arch/x86/testbuild/all-yes
@@ -13,9 +13,10 @@ CONFIG_FBFRONT = y
 CONFIG_KBDFRONT = y
 CONFIG_CONSFRONT = y
 CONFIG_XENBUS = y
-# XC is special: it needs support from outside
-CONFIG_XC = n
-# LWIP is special: it needs support from outside
-CONFIG_LWIP = n
 CONFIG_BALLOON = y
 CONFIG_USE_XEN_CONSOLE = y
+# The following are special: they need support from outside
+CONFIG_LIBXENCTRL = n
+CONFIG_LIBXENEVTCHN = n
+CONFIG_LIBXENGNTTAB = n
+CONFIG_LWIP = n
diff --git a/arch/x86/testbuild/newxen-yes b/arch/x86/testbuild/newxen-yes
index 2a3ed2e..f72123b 100644
--- a/arch/x86/testbuild/newxen-yes
+++ b/arch/x86/testbuild/newxen-yes
@@ -13,10 +13,11 @@ CONFIG_FBFRONT = y
 CONFIG_KBDFRONT = y
 CONFIG_CONSFRONT = y
 CONFIG_XENBUS = y
-# XC is special: it needs support from outside
-CONFIG_XC = n
-# LWIP is special: it needs support from outside
-CONFIG_LWIP = n
 CONFIG_BALLOON = y
 CONFIG_USE_XEN_CONSOLE = y
 XEN_INTERFACE_VERSION=__XEN_LATEST_INTERFACE_VERSION__
+# The following are special: they need support from outside
+CONFIG_LIBXENCTRL = n
+CONFIG_LIBXENEVTCHN = n
+CONFIG_LIBXENGNTTAB = n
+CONFIG_LWIP = n
diff --git a/lib/sys.c b/lib/sys.c
index c6a7b9f..e8d5eb2 100644
--- a/lib/sys.c
+++ b/lib/sys.c
@@ -437,13 +437,17 @@ int close(int fd)
 	    return res;
 	}
 #endif
-#ifdef CONFIG_XC
+#ifdef CONFIG_LIBXENCTRL
 	case FTYPE_XC:
 	    minios_interface_close_fd(fd);
 	    return 0;
+#endif
+#ifdef CONFIG_LIBXENEVTCHN
 	case FTYPE_EVTCHN:
 	    minios_evtchn_close_fd(fd);
             return 0;
+#endif
+#ifdef CONFIG_LIBXENGNTTAB
 	case FTYPE_GNTMAP:
 	    minios_gnttab_close_fd(fd);
 	    return 0;
@@ -1373,7 +1377,7 @@ void *mmap(void *start, size_t length, int prot, int flags, int fd, off_t offset
 
     if (fd == -1)
         return map_zero(n, 1);
-#ifdef CONFIG_XC
+#ifdef CONFIG_LIBXENCTRL
     else if (files[fd].type == FTYPE_XC) {
         unsigned long zero = 0;
         return map_frames_ex(&zero, n, 0, 0, 1, DOMID_SELF, NULL, 0);
-- 
2.26.2


