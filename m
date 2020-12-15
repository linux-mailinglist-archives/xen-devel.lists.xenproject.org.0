Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9B52DB1BC
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 17:46:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54669.95160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDTJ-0001mL-Vh; Tue, 15 Dec 2020 16:46:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54669.95160; Tue, 15 Dec 2020 16:46:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDTJ-0001lw-SO; Tue, 15 Dec 2020 16:46:45 +0000
Received: by outflank-mailman (input) for mailman id 54669;
 Tue, 15 Dec 2020 16:46:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2CwE=FT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kpDJt-00066M-Ib
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:37:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ef3335b5-2c28-45c3-b9c3-4c4ff1e53e81;
 Tue, 15 Dec 2020 16:36:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AA173B712;
 Tue, 15 Dec 2020 16:36:12 +0000 (UTC)
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
X-Inumbo-ID: ef3335b5-2c28-45c3-b9c3-4c4ff1e53e81
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608050172; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FspAu+0zxN5f+kBxTUaFqpiXMEMEL35uaqc65DYbH+U=;
	b=WYjMGffV3cHOlieIVijpD/JpBAYGwjWoFeZF+pBfxCAeriK5IAr+ISrP0xfa/hcw6SuHCt
	jVVXGRZY/WKCML5J9L3bMHYydkYN5FEnpFZdSTQM+vHbq/qv1JjkYMn4SgqMgGmGZVsbCt
	kV3F5wAAexfDePQ4yB2IC1tJrdS4XMI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v10 24/25] tools/xenstore: handle dying domains in live update
Date: Tue, 15 Dec 2020 17:36:02 +0100
Message-Id: <20201215163603.21700-25-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201215163603.21700-1-jgross@suse.com>
References: <20201215163603.21700-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

A domain could just be dying when live updating Xenstore, so the case
of not being able to map the ring page or to connect to the event
channel must be handled gracefully.

Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Paul Durrant <paul@xen.org>
---
V4:
- new patch (Julien, I hope adding the Sob: is okay?)

V10:
- removed "XXX..." comment (Julien Grall)

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_control.c |  7 +++++++
 tools/xenstore/xenstored_domain.c  | 25 +++++++++++++++++--------
 tools/xenstore/xenstored_domain.h  |  2 ++
 3 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index 8a1e3b35fe..dee55de264 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -544,6 +544,13 @@ void lu_read_state(void)
 	lu_close_dump_state(&state);
 
 	talloc_free(ctx);
+
+	/*
+	 * We may have missed the VIRQ_DOM_EXC notification and a domain may
+	 * have died while we were live-updating. So check all the domains are
+	 * still alive.
+	 */
+	check_domains(true);
 }
 
 static const char *lu_activate_binary(const void *ctx)
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 0cd8234bd1..dfda90c791 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -220,7 +220,7 @@ static bool get_domain_info(unsigned int domid, xc_dominfo_t *dominfo)
 	       dominfo->domid == domid;
 }
 
-static void domain_cleanup(void)
+void check_domains(bool restore)
 {
 	xc_dominfo_t dominfo;
 	struct domain *domain;
@@ -244,7 +244,14 @@ static void domain_cleanup(void)
 				domain->shutdown = true;
 				notify = 1;
 			}
-			if (!dominfo.dying)
+			/*
+			 * On Restore, we may have been unable to remap the
+			 * interface and the port. As we don't know whether
+			 * this was because of a dying domain, we need to
+			 * check if the interface and port are still valid.
+			 */
+			if (!dominfo.dying && domain->port &&
+			    domain->interface)
 				continue;
 		}
 		if (domain->conn) {
@@ -270,7 +277,7 @@ void handle_event(void)
 		barf_perror("Failed to read from event fd");
 
 	if (port == virq_port)
-		domain_cleanup();
+		check_domains(false);
 
 	if (xenevtchn_unmask(xce_handle, port) == -1)
 		barf_perror("Failed to write to event fd");
@@ -442,14 +449,16 @@ static struct domain *introduce_domain(const void *ctx,
 	if (!domain->introduced) {
 		interface = is_master_domain ? xenbus_map()
 					     : map_interface(domid);
-		if (!interface)
+		if (!interface && !restore)
 			return NULL;
 		if (new_domain(domain, port, restore)) {
 			rc = errno;
-			if (is_master_domain)
-				unmap_xenbus(interface);
-			else
-				unmap_interface(interface);
+			if (interface) {
+				if (is_master_domain)
+					unmap_xenbus(interface);
+				else
+					unmap_interface(interface);
+			}
 			errno = rc;
 			return NULL;
 		}
diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
index 8f3b4e0f8b..1cc1c03ed8 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -21,6 +21,8 @@
 
 void handle_event(void);
 
+void check_domains(bool restore);
+
 /* domid, mfn, eventchn, path */
 int do_introduce(struct connection *conn, struct buffered_data *in);
 
-- 
2.26.2


