Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 738AD7C9127
	for <lists+xen-devel@lfdr.de>; Sat, 14 Oct 2023 01:07:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616913.959251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrREl-00071d-P3; Fri, 13 Oct 2023 23:06:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616913.959251; Fri, 13 Oct 2023 23:06:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrREl-0006yV-LJ; Fri, 13 Oct 2023 23:06:31 +0000
Received: by outflank-mailman (input) for mailman id 616913;
 Fri, 13 Oct 2023 23:06:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4sWS=F3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qrREk-0006yP-7a
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 23:06:30 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23fbb7a8-6a1d-11ee-98d4-6d05b1d4d9a1;
 Sat, 14 Oct 2023 01:06:28 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 042E0B82C26;
 Fri, 13 Oct 2023 23:06:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F43AC433C7;
 Fri, 13 Oct 2023 23:06:26 +0000 (UTC)
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
X-Inumbo-ID: 23fbb7a8-6a1d-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697238387;
	bh=87Gjsk4VvEL82nSTllu/9UJTiYiNbtBHSO6aHVA5vfk=;
	h=From:To:Cc:Subject:Date:From;
	b=ZFYu5tV814uQkQAOzCeo1X6dr6Elj4igQ7gxVJbw2eHZcwFrlBfyDxaaIf0FhCE0u
	 LiLbeVlrqUZliO2uq1qeh1coIIDRy/D/e8kIfH8cyg8MNrGOnoVtu04sEjipGuvLMl
	 DXKfVblYP5jZ10o6lcu6ZqtXV2flBNxuHRJ/7Yah9WIOKg3ux2NCtF9Gc2gkvlpRRt
	 lrkNfW8nluHx3RucdNo9k75AiIjxlvvQKGfabeeg0iQuxE8lBaMPTGrfW4louz4vgv
	 lrsGvIR0yLE4ZbTRc0th65vBYKkLHBKijttk++wgm6Y9+ra1seJOV1hn1pkcqWE+ab
	 //gd8XtTlhE0A==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	George Dunlap <george.dunlap@cloud.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>,
	jgross@suse.com,
	julien@xen.org,
	wl@xen.org
Subject: [PATCH] cxenstored: wait until after reset to notify dom0less domains
Date: Fri, 13 Oct 2023 16:06:24 -0700
Message-Id: <20231013230624.1007969-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: George Dunlap <george.dunlap@cloud.com>

Commit fc2b57c9a ("xenstored: send an evtchn notification on
introduce_domain") introduced the sending of an event channel to the
guest when first introduced, so that dom0less domains waiting for the
connection would know that xenstore was ready to use.

Unfortunately, it was introduced in introduce_domain(), which 1) is
called by other functions, where such functionality is unneeded, and
2) after the main XS_INTRODUCE call, calls domain_conn_reset().  This
introduces a race condition, whereby if xenstored is delayed, a domain
can wake up, send messages to the buffer, only to have them deleted by
xenstore before finishing its processing of the XS_INTRODUCE message.

Move the connect-and-notfy call into do_introduce() instead, after the
domain_conn_rest(); predicated on the state being in the
XENSTORE_RECONNECT state.

(We don't need to check for "restoring", since that value is always
passed as "false" from do_domain_introduce()).

Also take the opportunity to add a missing wmb barrier after resetting
the indexes of the ring in domain_conn_reset.

This change will also remove an extra event channel notification for
dom0 (because the notification is now done by do_introduce which is not
called for dom0.) The extra dom0 event channel notification was only
introduced by fc2b57c9a and was never present before. It is not needed
because dom0 is the one to tell xenstored the connection parameters, so
dom0 has to know that the ring page is setup correctly by the time
xenstored starts looking at it. It is dom0 that performs the ring page
init.

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
CC: jgross@suse.com
CC: julien@xen.org
CC: wl@xen.org
---
 tools/xenstored/domain.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index a6cd199fdc..f6ef37856c 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -923,6 +923,7 @@ static void domain_conn_reset(struct domain *domain)
 
 	domain->interface->req_cons = domain->interface->req_prod = 0;
 	domain->interface->rsp_cons = domain->interface->rsp_prod = 0;
+	xen_wmb();
 }
 
 /*
@@ -988,12 +989,6 @@ static struct domain *introduce_domain(const void *ctx,
 		/* Now domain belongs to its connection. */
 		talloc_steal(domain->conn, domain);
 
-		if (!restore) {
-			/* Notify the domain that xenstore is available */
-			interface->connection = XENSTORE_CONNECTED;
-			xenevtchn_notify(xce_handle, domain->port);
-		}
-
 		if (!is_master_domain && !restore)
 			fire_special_watches("@introduceDomain");
 	} else {
@@ -1033,6 +1028,13 @@ int do_introduce(const void *ctx, struct connection *conn,
 
 	domain_conn_reset(domain);
 
+	if (domain->interface != NULL &&
+		domain->interface->connection == XENSTORE_RECONNECT) {
+		/* Notify the domain that xenstore is available */
+		domain->interface->connection = XENSTORE_CONNECTED;
+		xenevtchn_notify(xce_handle, domain->port);
+	}
+
 	send_ack(conn, XS_INTRODUCE);
 
 	return 0;
-- 
2.25.1


