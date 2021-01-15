Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8F72F7467
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 09:31:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67740.121195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0KVU-0001AN-DA; Fri, 15 Jan 2021 08:30:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67740.121195; Fri, 15 Jan 2021 08:30:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0KVU-00019M-6O; Fri, 15 Jan 2021 08:30:56 +0000
Received: by outflank-mailman (input) for mailman id 67740;
 Fri, 15 Jan 2021 08:30:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v6X5=GS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l0KVS-0008Gh-GS
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 08:30:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id acfd7906-a0f8-44f6-9433-5f2cd337fc91;
 Fri, 15 Jan 2021 08:30:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C920DB733;
 Fri, 15 Jan 2021 08:30:07 +0000 (UTC)
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
X-Inumbo-ID: acfd7906-a0f8-44f6-9433-5f2cd337fc91
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610699408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s87EsQNdAKvx1lyH1QYgj42flvmI+1JRarXqGbeqazE=;
	b=h4Ueuj6ktVUvlU9OkLdiz7S6rQoAbig8eG+Le9/7fJVdo+GjKRNcAQTNKdVbpda48o7Kl8
	pIhtaaE/f6FHNdD2RmMQ15Lj3Qyz5T8gPOowkawF63bIjM+lA5bBkdCUCVb1CdpodWZkxp
	06Pnb9KYB32wqCFVs35GSK5drdwnR8U=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v12 26/27] tools/xenstore: handle dying domains in live update
Date: Fri, 15 Jan 2021 09:29:59 +0100
Message-Id: <20210115083000.14186-27-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210115083000.14186-1-jgross@suse.com>
References: <20210115083000.14186-1-jgross@suse.com>
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
---
 tools/xenstore/xenstored_control.c |  7 +++++++
 tools/xenstore/xenstored_domain.c  | 25 +++++++++++++++++--------
 tools/xenstore/xenstored_domain.h  |  2 ++
 3 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index b8195eed41..3c212cc4d4 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -561,6 +561,13 @@ void lu_read_state(void)
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
index 6934f1bc89..cbeb2a309c 100644
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


