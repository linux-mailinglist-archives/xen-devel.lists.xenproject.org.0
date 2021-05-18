Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F423871B9
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 08:20:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128709.241599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lit4j-0005SL-Vw; Tue, 18 May 2021 06:19:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128709.241599; Tue, 18 May 2021 06:19:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lit4j-0005PX-SM; Tue, 18 May 2021 06:19:29 +0000
Received: by outflank-mailman (input) for mailman id 128709;
 Tue, 18 May 2021 06:19:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+8gn=KN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lit4i-0004r5-Av
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 06:19:28 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b9eb95af-3541-49c4-a5d0-f0780bced95c;
 Tue, 18 May 2021 06:19:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 257A4AF09;
 Tue, 18 May 2021 06:19:21 +0000 (UTC)
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
X-Inumbo-ID: b9eb95af-3541-49c4-a5d0-f0780bced95c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621318761; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=989znmd4h1mcR15D9WJ4lxb1rPSUzv44K4HKKcR8q7E=;
	b=K8D2WDHhpm027ir+2xZwrN16a1x6CaO7Ak4rl1QNL70OwzTqMlWNqEk1opWnNsDYhr3xAq
	ZtZ+XeRyCjhPYWpQPoBUhtfRsgrbi0dJ9nGsC/88UCRhQr6RXvxHKVW1CoU8hGFeTI3J+i
	OIz1J3uqccvF2psrQILsefoKpj8HIV0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 2/2] tools/xenstore: simplify xenstored main loop
Date: Tue, 18 May 2021 08:19:07 +0200
Message-Id: <20210518061907.16374-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210518061907.16374-1-jgross@suse.com>
References: <20210518061907.16374-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The main loop of xenstored is rather complicated due to different
handling of socket and ring-page interfaces. Unify that handling by
introducing interface type specific functions can_read() and
can_write().

Take the opportunity to remove the empty list check before calling
write_messages() because the function is already able to cope with an
empty list.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- split off function vector introduction (Julien Grall)
V3:
- expand commit message (Julien Grall)
---
 tools/xenstore/xenstored_core.c   | 77 +++++++++++++++----------------
 tools/xenstore/xenstored_core.h   |  2 +
 tools/xenstore/xenstored_domain.c |  2 +
 3 files changed, 41 insertions(+), 40 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 856f518075..883a1a582a 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -1659,9 +1659,34 @@ static int readfd(struct connection *conn, void *data, unsigned int len)
 	return rc;
 }
 
+static bool socket_can_process(struct connection *conn, int mask)
+{
+	if (conn->pollfd_idx == -1)
+		return false;
+
+	if (fds[conn->pollfd_idx].revents & ~(POLLIN | POLLOUT)) {
+		talloc_free(conn);
+		return false;
+	}
+
+	return (fds[conn->pollfd_idx].revents & mask) && !conn->is_ignored;
+}
+
+static bool socket_can_write(struct connection *conn)
+{
+	return socket_can_process(conn, POLLOUT);
+}
+
+static bool socket_can_read(struct connection *conn)
+{
+	return socket_can_process(conn, POLLIN);
+}
+
 const struct interface_funcs socket_funcs = {
 	.write = writefd,
 	.read = readfd,
+	.can_write = socket_can_write,
+	.can_read = socket_can_read,
 };
 
 static void accept_connection(int sock)
@@ -2296,47 +2321,19 @@ int main(int argc, char *argv[])
 			if (&next->list != &connections)
 				talloc_increase_ref_count(next);
 
-			if (conn->domain) {
-				if (domain_can_read(conn))
-					handle_input(conn);
-				if (talloc_free(conn) == 0)
-					continue;
-
-				talloc_increase_ref_count(conn);
-				if (domain_can_write(conn) &&
-				    !list_empty(&conn->out_list))
-					handle_output(conn);
-				if (talloc_free(conn) == 0)
-					continue;
-			} else {
-				if (conn->pollfd_idx != -1) {
-					if (fds[conn->pollfd_idx].revents
-					    & ~(POLLIN|POLLOUT))
-						talloc_free(conn);
-					else if ((fds[conn->pollfd_idx].revents
-						  & POLLIN) &&
-						 !conn->is_ignored)
-						handle_input(conn);
-				}
-				if (talloc_free(conn) == 0)
-					continue;
-
-				talloc_increase_ref_count(conn);
-
-				if (conn->pollfd_idx != -1) {
-					if (fds[conn->pollfd_idx].revents
-					    & ~(POLLIN|POLLOUT))
-						talloc_free(conn);
-					else if ((fds[conn->pollfd_idx].revents
-						  & POLLOUT) &&
-						 !conn->is_ignored)
-						handle_output(conn);
-				}
-				if (talloc_free(conn) == 0)
-					continue;
+			if (conn->funcs->can_read(conn))
+				handle_input(conn);
+			if (talloc_free(conn) == 0)
+				continue;
 
-				conn->pollfd_idx = -1;
-			}
+			talloc_increase_ref_count(conn);
+
+			if (conn->funcs->can_write(conn))
+				handle_output(conn);
+			if (talloc_free(conn) == 0)
+				continue;
+
+			conn->pollfd_idx = -1;
 		}
 
 		if (delayed_requests) {
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 6c4845c196..bb36111ecc 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -90,6 +90,8 @@ struct connection;
 struct interface_funcs {
 	int (*write)(struct connection *, const void *, unsigned int);
 	int (*read)(struct connection *, void *, unsigned int);
+	bool (*can_write)(struct connection *);
+	bool (*can_read)(struct connection *);
 };
 
 struct connection
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index f3cd56050e..708bf68af0 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -175,6 +175,8 @@ static int readchn(struct connection *conn, void *data, unsigned int len)
 static const struct interface_funcs domain_funcs = {
 	.write = writechn,
 	.read = readchn,
+	.can_write = domain_can_write,
+	.can_read = domain_can_read,
 };
 
 static void *map_interface(domid_t domid)
-- 
2.26.2


