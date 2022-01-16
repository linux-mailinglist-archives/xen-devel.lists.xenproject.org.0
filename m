Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9E148FB37
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jan 2022 07:46:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257781.443099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8zIK-0001Gn-CZ; Sun, 16 Jan 2022 06:45:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257781.443099; Sun, 16 Jan 2022 06:45:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8zIK-0001AA-4f; Sun, 16 Jan 2022 06:45:40 +0000
Received: by outflank-mailman (input) for mailman id 257781;
 Sun, 16 Jan 2022 06:45:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=APY9=SA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n8zII-0008SI-4X
 for xen-devel@lists.xenproject.org; Sun, 16 Jan 2022 06:45:38 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5c13b56-7697-11ec-9bbc-9dff3e4ee8c5;
 Sun, 16 Jan 2022 07:45:32 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B4FB7219C8;
 Sun, 16 Jan 2022 06:45:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8B3DE13ABD;
 Sun, 16 Jan 2022 06:45:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cGS/IAq/42H0eQAAMHmgww
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
X-Inumbo-ID: e5c13b56-7697-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642315530; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sMF8pqUc94a10+353xWoWiPfMeUftk07LIrUu9q2Fz8=;
	b=dR4rbD/G7KbYn4CT4GiZWXUD6uomLLLQdYtB4cY6dLjUqm7e69v4zR9T/1YrWBD6o+0dM1
	G+wKHa/tl3GSo4icxK0ls6IPHs1yIdjg0dMf08dI2R25cWTmUt/F7E2UV2lUvCrRIT39T6
	CM1kOrnaSEv6OBEQN2fa3N9hoSW4jjM=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINIOS PATCH v3 5/5] add CONFIG_LIBXS item
Date: Sun, 16 Jan 2022 07:45:27 +0100
Message-Id: <20220116064527.23519-6-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220116064527.23519-1-jgross@suse.com>
References: <20220116064527.23519-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mini-OS contains a stripped down version of libxenstore in lib/xs.c.
Today it is being built always if CONFIG_XENBUS is set and libc
support is enabled.

In order to allow a Mini-OS specific build of libxenstore to be used
instead add a new CONFIG_LIBXS item which per default will have the
same setting as CONFIG_XENBUS. A user wanting to replace lib/xs.c
with libxenstore would just need to set CONFIG_XENBUS=y and
CONFIG_LIBXS=n.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
---
 Config.mk                     | 10 ++++++++--
 Makefile                      |  2 +-
 arch/x86/testbuild/all-no     |  1 +
 arch/x86/testbuild/all-yes    |  1 +
 arch/x86/testbuild/newxen-yes |  1 +
 lib/sys.c                     |  4 ++--
 6 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/Config.mk b/Config.mk
index 1e083881..03023033 100644
--- a/Config.mk
+++ b/Config.mk
@@ -171,7 +171,10 @@ endif
 # arch/*/testbuild/*-yes and arch/*/testbuild/*-no should set ALL possible
 # CONFIG_ variables.
 
-# Configuration defaults
+# Configuration defaults:
+# CONFIG-y contains all items defaulting to "y"
+# CONFIG-n contains all items defaulting to "n"
+# CONFIG-x contains all items being calculated if not set explicitly
 CONFIG-y += CONFIG_START_NETWORK
 CONFIG-y += CONFIG_SPARSE_BSS
 CONFIG-y += CONFIG_BLKFRONT
@@ -205,7 +208,10 @@ CONFIG-$(lwip) += CONFIG_LWIP
 $(foreach i,$(CONFIG-y),$(eval $(i) ?= y))
 $(foreach i,$(CONFIG-n),$(eval $(i) ?= n))
 
-CONFIG-all := $(CONFIG-y) $(CONFIG-n)
+CONFIG-x += CONFIG_LIBXS
+CONFIG_LIBXS ?= $(CONFIG_XENBUS)
+
+CONFIG-all := $(CONFIG-y) $(CONFIG-n) $(CONFIG-x)
 
 # Export config items as compiler directives
 $(foreach i,$(CONFIG-all),$(eval DEFINES-$($(i)) += -D$(i)))
diff --git a/Makefile b/Makefile
index 06b60fc7..9f95d197 100644
--- a/Makefile
+++ b/Makefile
@@ -65,7 +65,7 @@ src-y += lib/stack_chk_fail.c
 src-y += lib/string.c
 src-y += lib/sys.c
 src-y += lib/xmalloc.c
-src-$(CONFIG_XENBUS) += lib/xs.c
+src-$(CONFIG_LIBXS) += lib/xs.c
 
 src-$(CONFIG_XENBUS) += xenbus/xenbus.c
 
diff --git a/arch/x86/testbuild/all-no b/arch/x86/testbuild/all-no
index d6fc2608..46f974de 100644
--- a/arch/x86/testbuild/all-no
+++ b/arch/x86/testbuild/all-no
@@ -13,6 +13,7 @@ CONFIG_FBFRONT = n
 CONFIG_KBDFRONT = n
 CONFIG_CONSFRONT = n
 CONFIG_XENBUS = n
+CONFIG_LIBXS = n
 CONFIG_LIBXENEVTCHN = n
 CONFIG_LIBXENGNTTAB = n
 CONFIG_LWIP = n
diff --git a/arch/x86/testbuild/all-yes b/arch/x86/testbuild/all-yes
index 98bbfebf..3ead12f1 100644
--- a/arch/x86/testbuild/all-yes
+++ b/arch/x86/testbuild/all-yes
@@ -13,6 +13,7 @@ CONFIG_FBFRONT = y
 CONFIG_KBDFRONT = y
 CONFIG_CONSFRONT = y
 CONFIG_XENBUS = y
+CONFIG_LIBXS = y
 CONFIG_BALLOON = y
 CONFIG_USE_XEN_CONSOLE = y
 # The following are special: they need support from outside
diff --git a/arch/x86/testbuild/newxen-yes b/arch/x86/testbuild/newxen-yes
index 06032004..5c0b3c80 100644
--- a/arch/x86/testbuild/newxen-yes
+++ b/arch/x86/testbuild/newxen-yes
@@ -13,6 +13,7 @@ CONFIG_FBFRONT = y
 CONFIG_KBDFRONT = y
 CONFIG_CONSFRONT = y
 CONFIG_XENBUS = y
+CONFIG_LIBXS = y
 CONFIG_BALLOON = y
 CONFIG_USE_XEN_CONSOLE = y
 XEN_INTERFACE_VERSION=__XEN_LATEST_INTERFACE_VERSION__
diff --git a/lib/sys.c b/lib/sys.c
index 7be01fd3..e0ac5099 100644
--- a/lib/sys.c
+++ b/lib/sys.c
@@ -523,7 +523,7 @@ int close(int fd)
     switch (file->type) {
         default:
             break;
-#ifdef CONFIG_XENBUS
+#ifdef CONFIG_LIBXS
 	case FTYPE_XENBUS:
             xs_daemon_close((void*)(intptr_t) fd);
             break;
@@ -958,7 +958,7 @@ static int select_poll(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exce
                 n++;
 	    FD_CLR(i, exceptfds);
 	    break;
-#ifdef CONFIG_XENBUS
+#ifdef CONFIG_LIBXS
 	case FTYPE_XENBUS:
 	    if (FD_ISSET(i, readfds)) {
                 if (files[i].dev)
-- 
2.26.2


