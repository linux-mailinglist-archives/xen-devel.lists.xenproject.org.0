Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3537AA0741B
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 12:01:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868151.1279710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVqHX-0007tx-Np; Thu, 09 Jan 2025 11:00:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868151.1279710; Thu, 09 Jan 2025 11:00:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVqHX-0007rY-KH; Thu, 09 Jan 2025 11:00:55 +0000
Received: by outflank-mailman (input) for mailman id 868151;
 Thu, 09 Jan 2025 11:00:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vJOs=UB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tVqH1-0003VB-2a
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 11:00:23 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb7e9f1b-ce78-11ef-99a4-01e77a169b0f;
 Thu, 09 Jan 2025 12:00:21 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 046C621120;
 Thu,  9 Jan 2025 11:00:21 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C2F98139AB;
 Thu,  9 Jan 2025 11:00:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UE0BLkSsf2dEHQAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 09 Jan 2025 11:00:20 +0000
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
X-Inumbo-ID: eb7e9f1b-ce78-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1736420421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U4Ln9oY8teJqj0oQ6om9doDIAfM1X4V+dyEL2CQtrKA=;
	b=HAZOKL9drZ160VQ0+hgDQZuMWv7zcJY4vNrb9k5KY5hpvSYseUh6aqH4lJNvIc+4m3pu2R
	WlzrLgu9A40BIYZn8T1P51GKhdW6xCoOMUiGMDA+kWrVTWWqJ66bKAM7Sw+UcjoUEOip93
	PqBKBPnmETx/jLE5KnxfBv6ptIyavdA=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=HAZOKL9d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1736420421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U4Ln9oY8teJqj0oQ6om9doDIAfM1X4V+dyEL2CQtrKA=;
	b=HAZOKL9drZ160VQ0+hgDQZuMWv7zcJY4vNrb9k5KY5hpvSYseUh6aqH4lJNvIc+4m3pu2R
	WlzrLgu9A40BIYZn8T1P51GKhdW6xCoOMUiGMDA+kWrVTWWqJ66bKAM7Sw+UcjoUEOip93
	PqBKBPnmETx/jLE5KnxfBv6ptIyavdA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH v7 7/7] tools/xenstored: use new stable interface instead of libxenctrl
Date: Thu,  9 Jan 2025 11:59:35 +0100
Message-ID: <20250109105935.23585-8-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250109105935.23585-1-jgross@suse.com>
References: <20250109105935.23585-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 046C621120
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Replace the current use of the unstable xc_domain_getinfo_single()
interface with the stable domctl XEN_DOMCTL_get_domain_state call
via the new libxenmanage library.

This will remove the last usage of libxenctrl by Xenstore, so update
the library dependencies accordingly.

For now only do a direct replacement without using the functionality
of obtaining information about domains having changed the state.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
---
V1:
- use library instead of direct hypercall, only replace current
  libxenctrl use case

Please note that this patch can be committed only after the related
Mini-OS patch "config: add support for libxenmanage" has gone in AND
the Mini-OS commit-id has been updated in Config.mk accordingly!

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 stubdom/Makefile                |  8 ++---
 stubdom/mini-os.mk              |  1 +
 tools/xenstored/Makefile        |  2 +-
 tools/xenstored/Makefile.common |  2 +-
 tools/xenstored/core.h          |  1 -
 tools/xenstored/domain.c        | 52 ++++++++++++---------------------
 tools/xenstored/lu.c            |  1 +
 tools/xenstored/lu_daemon.c     |  1 +
 8 files changed, 28 insertions(+), 40 deletions(-)

diff --git a/stubdom/Makefile b/stubdom/Makefile
index 2a81af28a1..ca800b243c 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -307,7 +307,7 @@ endif
 # libraries under tools/libs
 #######
 
-STUB_LIBS := toolcore toollog evtchn gnttab call foreignmemory devicemodel ctrl guest
+STUB_LIBS := toolcore toollog evtchn gnttab call foreignmemory devicemodel ctrl guest manage
 
 LIBDEP_guest := cross-zlib
 
@@ -465,7 +465,7 @@ grub: cross-polarssl grub-upstream $(CROSS_ROOT) grub-$(XEN_TARGET_ARCH)-minios-
 # xenstore
 ##########
 
-xenstore-minios.gen.cfg: APP_LIBS = gnttab evtchn toollog ctrl
+xenstore-minios.gen.cfg: APP_LIBS = gnttab evtchn toollog manage
 xenstore-minios.gen.cfg: xenstore-minios.cfg Makefile
 	$(GEN_config) >$@
 
@@ -480,7 +480,7 @@ xenstore: $(CROSS_ROOT) xenstore-minios-config.mk
 # xenstorepvh
 #############
 
-xenstorepvh-minios.gen.cfg: APP_LIBS = gnttab evtchn toollog ctrl
+xenstorepvh-minios.gen.cfg: APP_LIBS = gnttab evtchn toollog manage
 xenstorepvh-minios.gen.cfg: xenstorepvh-minios.cfg Makefile
 	$(GEN_config) >$@
 
@@ -523,7 +523,7 @@ else
 pv-grub-if-enabled:
 endif
 
-XENSTORE_DEPS := libxenevtchn libxengnttab libxenctrl
+XENSTORE_DEPS := libxenevtchn libxengnttab libxenmanage
 
 .PHONY: xenstore-stubdom
 xenstore-stubdom: mini-os-$(XEN_TARGET_ARCH)-xenstore $(XENSTORE_DEPS) xenstore
diff --git a/stubdom/mini-os.mk b/stubdom/mini-os.mk
index 7e4968e026..be32302f9e 100644
--- a/stubdom/mini-os.mk
+++ b/stubdom/mini-os.mk
@@ -13,5 +13,6 @@ GNTTAB_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/gnttab
 CALL_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/call
 FOREIGNMEMORY_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/foreignmemory
 DEVICEMODEL_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/devicemodel
+MANAGE_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/manage
 CTRL_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/ctrl
 GUEST_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/guest
diff --git a/tools/xenstored/Makefile b/tools/xenstored/Makefile
index 09adfe1d50..81c42838e0 100644
--- a/tools/xenstored/Makefile
+++ b/tools/xenstored/Makefile
@@ -5,7 +5,7 @@ include Makefile.common
 
 xenstored: LDLIBS += $(LDLIBS_libxenevtchn)
 xenstored: LDLIBS += $(LDLIBS_libxengnttab)
-xenstored: LDLIBS += $(LDLIBS_libxenctrl)
+xenstored: LDLIBS += $(LDLIBS_libxenmanage)
 xenstored: LDLIBS += -lrt
 xenstored: LDLIBS += $(SOCKET_LIBS)
 
diff --git a/tools/xenstored/Makefile.common b/tools/xenstored/Makefile.common
index 27fdb3b49e..271134fcc1 100644
--- a/tools/xenstored/Makefile.common
+++ b/tools/xenstored/Makefile.common
@@ -12,7 +12,7 @@ XENSTORED_OBJS-$(CONFIG_MiniOS) += minios.o lu_minios.o
 # Include configure output (config.h)
 CFLAGS += -include $(XEN_ROOT)/tools/config.h
 CFLAGS += $(CFLAGS_libxenevtchn)
-CFLAGS += $(CFLAGS_libxenctrl)
+CFLAGS += $(CFLAGS_libxenmanage)
 CFLAGS += $(CFLAGS_libxentoolcore)
 
 $(XENSTORED_OBJS-y): CFLAGS += $(CFLAGS_libxengnttab)
diff --git a/tools/xenstored/core.h b/tools/xenstored/core.h
index e58779e88c..632886cecf 100644
--- a/tools/xenstored/core.h
+++ b/tools/xenstored/core.h
@@ -19,7 +19,6 @@
 #ifndef _XENSTORED_CORE_H
 #define _XENSTORED_CORE_H
 
-#include <xenctrl.h>
 #include <xengnttab.h>
 
 #include <sys/types.h>
diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index 64c8fd0cc3..a6506a5bb2 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -34,14 +34,15 @@
 #include "control.h"
 
 #include <xenevtchn.h>
-#include <xenctrl.h>
+#include <xenmanage.h>
+#include <xen-barrier.h>
 #include <xen/grant_table.h>
 
 #ifdef __MINIOS__
 #include <mini-os/xenbus.h>
 #endif
 
-static xc_interface **xc_handle;
+static xenmanage_handle *xm_handle;
 xengnttab_handle **xgt_handle;
 static evtchn_port_t virq_port;
 
@@ -619,32 +620,28 @@ static int destroy_domain(void *_domain)
 	return 0;
 }
 
-static bool get_domain_info(unsigned int domid, xc_domaininfo_t *dominfo)
-{
-	return xc_domain_getinfo_single(*xc_handle, domid, dominfo) == 0;
-}
-
 static int check_domain(const void *k, void *v, void *arg)
 {
-	xc_domaininfo_t dominfo;
+	unsigned int state;
 	struct connection *conn;
-	bool dom_valid;
+	int dom_invalid;
 	struct domain *domain = v;
 	bool *notify = arg;
 
-	dom_valid = get_domain_info(domain->domid, &dominfo);
+	dom_invalid = xenmanage_get_domain_info(xm_handle, domain->domid,
+						&state, NULL);
 	if (!domain->introduced) {
-		if (!dom_valid)
+		if (dom_invalid)
 			talloc_free(domain);
 		return 0;
 	}
-	if (dom_valid) {
-		if ((dominfo.flags & XEN_DOMINF_shutdown)
+	if (!dom_invalid) {
+		if ((state & XENMANAGE_GETDOMSTATE_STATE_SHUTDOWN)
 		    && !domain->shutdown) {
 			domain->shutdown = true;
 			*notify = true;
 		}
-		if (!(dominfo.flags & XEN_DOMINF_dying))
+		if (!(state & XENMANAGE_GETDOMSTATE_STATE_DEAD))
 			return 0;
 	}
 	if (domain->conn) {
@@ -786,10 +783,9 @@ static struct domain *find_or_alloc_domain(const void *ctx, unsigned int domid)
 static struct domain *find_or_alloc_existing_domain(unsigned int domid)
 {
 	struct domain *domain;
-	xc_domaininfo_t dominfo;
 
 	domain = find_domain_struct(domid);
-	if (!domain && get_domain_info(domid, &dominfo))
+	if (!domain && !xenmanage_get_domain_info(xm_handle, domid, NULL, NULL))
 		domain = alloc_domain(NULL, domid);
 
 	return domain;
@@ -1187,12 +1183,6 @@ int do_reset_watches(const void *ctx, struct connection *conn,
 	return 0;
 }
 
-static int close_xc_handle(void *_handle)
-{
-	xc_interface_close(*(xc_interface**)_handle);
-	return 0;
-}
-
 static int close_xgt_handle(void *_handle)
 {
 	xengnttab_close(*(xengnttab_handle **)_handle);
@@ -1258,15 +1248,9 @@ void domain_early_init(void)
 	if (!domhash)
 		barf_perror("Failed to allocate domain hashtable");
 
-	xc_handle = talloc(talloc_autofree_context(), xc_interface*);
-	if (!xc_handle)
-		barf_perror("Failed to allocate domain handle");
-
-	*xc_handle = xc_interface_open(0,0,0);
-	if (!*xc_handle)
-		barf_perror("Failed to open connection to hypervisor");
-
-	talloc_set_destructor(xc_handle, close_xc_handle);
+	xm_handle = xenmanage_open(NULL, 0);
+	if (!xm_handle)
+		barf_perror("Failed to open connection to libxenmanage");
 
 	xgt_handle = talloc(talloc_autofree_context(), xengnttab_handle*);
 	if (!xgt_handle)
@@ -1306,6 +1290,8 @@ void domain_deinit(void)
 {
 	if (virq_port)
 		xenevtchn_unbind(xce_handle, virq_port);
+
+	xenmanage_close(xm_handle);
 }
 
 /*
@@ -1335,13 +1321,13 @@ int domain_alloc_permrefs(struct node_perms *perms)
 {
 	unsigned int i, domid;
 	struct domain *d;
-	xc_domaininfo_t dominfo;
 
 	for (i = 0; i < perms->num; i++) {
 		domid = perms->p[i].id;
 		d = find_domain_struct(domid);
 		if (!d) {
-			if (!get_domain_info(domid, &dominfo))
+			if (xenmanage_get_domain_info(xm_handle, domid,
+						      NULL, NULL))
 				perms->p[i].perms |= XS_PERM_IGNORE;
 			else if (!alloc_domain(NULL, domid))
 				return ENOMEM;
diff --git a/tools/xenstored/lu.c b/tools/xenstored/lu.c
index bec2a84e10..4fccbbc195 100644
--- a/tools/xenstored/lu.c
+++ b/tools/xenstored/lu.c
@@ -11,6 +11,7 @@
 #include <stdlib.h>
 #include <syslog.h>
 #include <time.h>
+#include <unistd.h>
 #include <sys/mman.h>
 #include <sys/stat.h>
 
diff --git a/tools/xenstored/lu_daemon.c b/tools/xenstored/lu_daemon.c
index 6df6c80a2a..88d8d9e1b3 100644
--- a/tools/xenstored/lu_daemon.c
+++ b/tools/xenstored/lu_daemon.c
@@ -6,6 +6,7 @@
  */
 
 #include <syslog.h>
+#include <unistd.h>
 #include <sys/stat.h>
 
 #include "talloc.h"
-- 
2.43.0


