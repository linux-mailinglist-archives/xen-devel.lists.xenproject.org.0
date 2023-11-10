Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 034DF7E7DAD
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 17:14:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630526.983464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1U9e-00077A-3U; Fri, 10 Nov 2023 16:14:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630526.983464; Fri, 10 Nov 2023 16:14:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1U9d-00073r-Sy; Fri, 10 Nov 2023 16:14:45 +0000
Received: by outflank-mailman (input) for mailman id 630526;
 Fri, 10 Nov 2023 16:14:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ap16=GX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r1U5U-0004cS-Dt
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 16:10:28 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a92a9192-7fe3-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 17:10:26 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A64232187C;
 Fri, 10 Nov 2023 16:10:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7A11813398;
 Fri, 10 Nov 2023 16:10:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dKiIHPJVTmWHCQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 10 Nov 2023 16:10:26 +0000
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
X-Inumbo-ID: a92a9192-7fe3-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699632626; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mAbYvWWcrF68SCYMWW0W6XWNuB7mZzftdWlLKLvl9pU=;
	b=DVUj5/b6cpWnCnGmCTFbetK58RT9pBIJUTQXyRAHou6IK0XzoQ5554iTmQf/oWfGJadQMi
	u4dIppB5EArsihlHbayzARU95IQ/gLlOBjrYLdDooFnQYClowIVx7XY8xZ4GG8BVRT3VkT
	ymiIhwAQA7WUy7xxq6NEC4ejYJ6saeo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 25/29] tools/xenstored: map stubdom interface
Date: Fri, 10 Nov 2023 17:08:00 +0100
Message-Id: <20231110160804.29021-26-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231110160804.29021-1-jgross@suse.com>
References: <20231110160804.29021-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When running as stubdom, map the stubdom's Xenstore ring page in order
to support using the 9pfs frontend.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstored/core.c   |  2 ++
 tools/xenstored/domain.c | 27 ++++++++++++++++++++++++++-
 tools/xenstored/domain.h |  1 +
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index b9ec50b34c..4a9d874f17 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -2991,6 +2991,8 @@ int main(int argc, char *argv[])
 		lu_read_state();
 #endif
 
+	stubdom_init();
+
 	check_store();
 
 	/* Get ready to listen to the tools. */
diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index fa17f68618..162b87b460 100644
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
index 6c00540311..49c60c56bf 100644
--- a/tools/xenstored/domain.h
+++ b/tools/xenstored/domain.h
@@ -85,6 +85,7 @@ int do_reset_watches(const void *ctx, struct connection *conn,
 void domain_static_init(void);
 void domain_init(int evtfd);
 void dom0_init(void);
+void stubdom_init(void);
 void domain_deinit(void);
 void ignore_connection(struct connection *conn, unsigned int err);
 
-- 
2.35.3


