Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CED823E18
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 10:03:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661165.1030913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJdf-0004iC-Hz; Thu, 04 Jan 2024 09:03:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661165.1030913; Thu, 04 Jan 2024 09:03:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJdf-0004ev-Ex; Thu, 04 Jan 2024 09:03:43 +0000
Received: by outflank-mailman (input) for mailman id 661165;
 Thu, 04 Jan 2024 09:03:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4u2H=IO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rLJdd-0003cj-RH
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 09:03:41 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 272098ea-aae0-11ee-9b0f-b553b5be7939;
 Thu, 04 Jan 2024 10:03:40 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EE03A21EE1;
 Thu,  4 Jan 2024 09:03:39 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C454613722;
 Thu,  4 Jan 2024 09:03:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id tgyuLmt0lmViWQAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 04 Jan 2024 09:03:39 +0000
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
X-Inumbo-ID: 272098ea-aae0-11ee-9b0f-b553b5be7939
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 29/33] tools/xenstored: map stubdom interface
Date: Thu,  4 Jan 2024 10:00:51 +0100
Message-Id: <20240104090055.27323-30-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240104090055.27323-1-jgross@suse.com>
References: <20240104090055.27323-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: EE03A21EE1

When running as stubdom, map the stubdom's Xenstore ring page in order
to support using the 9pfs frontend.

Use the same pattern as in dom0_init() when running as daemon in dom0
(introduce the own domain, then send an event to the client side to
signal Xenstore is ready to communicate).

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstored/core.c   |  2 ++
 tools/xenstored/domain.c | 27 ++++++++++++++++++++++++++-
 tools/xenstored/domain.h |  1 +
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 637c2ac113..b648af16fa 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -2769,6 +2769,8 @@ int main(int argc, char *argv[])
 		lu_read_state();
 #endif
 
+	stubdom_init();
+
 	check_store();
 
 	/* Get ready to listen to the tools. */
diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index 621b415088..1a7d5e9756 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -37,6 +37,10 @@
 #include <xenctrl.h>
 #include <xen/grant_table.h>
 
+#ifdef __MINIOS__
+#include <mini-os/xenbus.h>
+#endif
+
 static xc_interface **xc_handle;
 xengnttab_handle **xgt_handle;
 static evtchn_port_t virq_port;
@@ -500,6 +504,11 @@ static void *map_interface(domid_t domid)
 	if (domid == xenbus_master_domid())
 		return xenbus_map();
 
+#ifdef __MINIOS__
+	if (domid == stub_domid)
+		return xenstore_buf;
+#endif
+
 	return xengnttab_map_grant_ref(*xgt_handle, domid,
 				       GNTTAB_RESERVED_XENSTORE,
 				       PROT_READ|PROT_WRITE);
@@ -509,7 +518,7 @@ static void unmap_interface(domid_t domid, void *interface)
 {
 	if (domid == xenbus_master_domid())
 		unmap_xenbus(interface);
-	else
+	else if (domid != stub_domid)
 		xengnttab_unmap(*xgt_handle, interface, 1);
 }
 
@@ -1214,6 +1223,22 @@ void dom0_init(void)
 	xenevtchn_notify(xce_handle, dom0->port);
 }
 
+void stubdom_init(void)
+{
+#ifdef __MINIOS__
+	struct domain *stubdom;
+
+	if (stub_domid < 0)
+		return;
+
+	stubdom = introduce_domain(NULL, stub_domid, xenbus_evtchn, false);
+	if (!stubdom)
+		barf_perror("Failed to initialize stubdom");
+
+	xenevtchn_notify(xce_handle, stubdom->port);
+#endif
+}
+
 static unsigned int domhash_fn(const void *k)
 {
 	return *(const unsigned int *)k;
diff --git a/tools/xenstored/domain.h b/tools/xenstored/domain.h
index 224c4c23e2..844ac11510 100644
--- a/tools/xenstored/domain.h
+++ b/tools/xenstored/domain.h
@@ -85,6 +85,7 @@ int do_reset_watches(const void *ctx, struct connection *conn,
 void domain_early_init(void);
 void domain_init(int evtfd);
 void dom0_init(void);
+void stubdom_init(void);
 void domain_deinit(void);
 void ignore_connection(struct connection *conn, unsigned int err);
 
-- 
2.35.3


