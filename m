Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 781EC849821
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 11:52:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675814.1051367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwaj-0006j0-3A; Mon, 05 Feb 2024 10:52:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675814.1051367; Mon, 05 Feb 2024 10:52:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwai-0006fh-Un; Mon, 05 Feb 2024 10:52:44 +0000
Received: by outflank-mailman (input) for mailman id 675814;
 Mon, 05 Feb 2024 10:52:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b4fC=JO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rWwah-00064Q-Qk
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 10:52:43 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af8e7d03-c414-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 11:52:42 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id ACCA222288;
 Mon,  5 Feb 2024 10:52:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 72995132DD;
 Mon,  5 Feb 2024 10:52:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Lxx6Gvm9wGX2NgAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 05 Feb 2024 10:52:41 +0000
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
X-Inumbo-ID: af8e7d03-c414-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707130361; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CNBMmRI5jm2OY3r5fUBNPy2uDNZ81cgAaFW7uO2/RZQ=;
	b=rd2j+e3DNUEu/4Q9X+OKH3cW4mxygqpC2Q4CSidj4iIM6NEpol3IKANp8g8I2Vkv//VyIi
	kJzIkXPdk4Wu5Pse18J6awFQUOfbrZ1ZqINl9rPR8O0YgA0RsNJPBa2mUpCIIw/ZR3B2Hx
	gOp/VaS1Jxatyn3uVijFCGVU6N7sHXA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707130361; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CNBMmRI5jm2OY3r5fUBNPy2uDNZ81cgAaFW7uO2/RZQ=;
	b=rd2j+e3DNUEu/4Q9X+OKH3cW4mxygqpC2Q4CSidj4iIM6NEpol3IKANp8g8I2Vkv//VyIi
	kJzIkXPdk4Wu5Pse18J6awFQUOfbrZ1ZqINl9rPR8O0YgA0RsNJPBa2mUpCIIw/ZR3B2Hx
	gOp/VaS1Jxatyn3uVijFCGVU6N7sHXA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 28/32] tools/xenstored: map stubdom interface
Date: Mon,  5 Feb 2024 11:49:57 +0100
Message-Id: <20240205105001.24171-29-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240205105001.24171-1-jgross@suse.com>
References: <20240205105001.24171-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-2.10 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[suse.com,xen.org,citrix.com,gmail.com,amazon.com];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.10

When running as stubdom, map the stubdom's Xenstore ring page in order
to support using the 9pfs frontend.

Use the same pattern as in dom0_init() when running as daemon in dom0
(introduce the own domain, then send an event to the client side to
signal Xenstore is ready to communicate).

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstored/core.c   |  2 ++
 tools/xenstored/domain.c | 27 ++++++++++++++++++++++++++-
 tools/xenstored/domain.h |  1 +
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 3bf2ec7734..48fc787ac1 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -2767,6 +2767,8 @@ int main(int argc, char *argv[])
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


