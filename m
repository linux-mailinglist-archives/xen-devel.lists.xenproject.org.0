Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DB92F650B
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 16:51:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67322.120049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04uO-0007J6-GZ; Thu, 14 Jan 2021 15:51:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67322.120049; Thu, 14 Jan 2021 15:51:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04uO-0007IG-A4; Thu, 14 Jan 2021 15:51:36 +0000
Received: by outflank-mailman (input) for mailman id 67322;
 Thu, 14 Jan 2021 15:51:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P5GR=GR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l04iA-0002SV-Nj
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:38:58 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11f01b16-e4ab-40dd-ad32-d34a03110e68;
 Thu, 14 Jan 2021 15:38:14 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C606CAF31;
 Thu, 14 Jan 2021 15:38:11 +0000 (UTC)
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
X-Inumbo-ID: 11f01b16-e4ab-40dd-ad32-d34a03110e68
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610638691; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8fzisLFHra+8irPIn/ZYbpu+ZVxDRPBpXZRvcHrNvww=;
	b=ZK7rg2EF7pui5cHKjCSm70j+6qVc4zBC7xUvTUaV+o5PvHgjgle9BUpHYKUxlotAxUFXln
	hCEHt6SI1zzQe1pNofpaU4pr/vgW0FZPGb/oE+y9hIgPvLBMMUjTJFmWWlFMkeLwJLVtX0
	387kbBwRHbxaCWoqngkOZZyTymGpKTk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v11 25/27] tools/xenstore: add read watch state for live update
Date: Thu, 14 Jan 2021 16:38:01 +0100
Message-Id: <20210114153803.2591-26-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114153803.2591-1-jgross@suse.com>
References: <20210114153803.2591-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add reading the watch state records for live update.

This requires factoring out some of the add watch functionality into a
dedicated function.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Paul Durrant <paul@xen.org>
---
V4:
- add comment (Julien Grall)

V6:
- correct check_watch_path() (setting errno)
---
 tools/xenstore/xenstored_control.c |   2 +
 tools/xenstore/xenstored_watch.c   | 114 +++++++++++++++++++++--------
 tools/xenstore/xenstored_watch.h   |   2 +
 3 files changed, 88 insertions(+), 30 deletions(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index d73e1dca7e..ba48358c31 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -35,6 +35,7 @@ Interactive commands for Xen Store Daemon.
 #include "xenstored_core.h"
 #include "xenstored_control.h"
 #include "xenstored_domain.h"
+#include "xenstored_watch.h"
 
 /* Mini-OS only knows about MAP_ANON. */
 #ifndef MAP_ANONYMOUS
@@ -542,6 +543,7 @@ void lu_read_state(void)
 			read_state_connection(ctx, head + 1);
 			break;
 		case XS_STATE_TYPE_WATCH:
+			read_state_watch(ctx, head + 1);
 			break;
 		case XS_STATE_TYPE_TA:
 			xprintf("live-update: ignore transaction record\n");
diff --git a/tools/xenstore/xenstored_watch.c b/tools/xenstore/xenstored_watch.c
index 9248f08bd9..db89e0141f 100644
--- a/tools/xenstore/xenstored_watch.c
+++ b/tools/xenstore/xenstored_watch.c
@@ -205,6 +205,62 @@ static int destroy_watch(void *_watch)
 	return 0;
 }
 
+static int check_watch_path(struct connection *conn, const void *ctx,
+			    char **path, bool *relative)
+{
+	/* Check if valid event. */
+	if (strstarts(*path, "@")) {
+		*relative = false;
+		if (strlen(*path) > XENSTORE_REL_PATH_MAX)
+			goto inval;
+	} else {
+		*relative = !strstarts(*path, "/");
+		*path = canonicalize(conn, ctx, *path);
+		if (!*path)
+			return errno;
+		if (!is_valid_nodename(*path))
+			goto inval;
+	}
+
+	return 0;
+
+ inval:
+	errno = EINVAL;
+	return errno;
+}
+
+static struct watch *add_watch(struct connection *conn, char *path, char *token,
+			       bool relative)
+{
+	struct watch *watch;
+
+	watch = talloc(conn, struct watch);
+	if (!watch)
+		goto nomem;
+	watch->node = talloc_strdup(watch, path);
+	watch->token = talloc_strdup(watch, token);
+	if (!watch->node || !watch->token)
+		goto nomem;
+
+	if (relative)
+		watch->relative_path = get_implicit_path(conn);
+	else
+		watch->relative_path = NULL;
+
+	INIT_LIST_HEAD(&watch->events);
+
+	domain_watch_inc(conn);
+	list_add_tail(&watch->list, &conn->watches);
+	talloc_set_destructor(watch, destroy_watch);
+
+	return watch;
+
+ nomem:
+	talloc_free(watch);
+	errno = ENOMEM;
+	return NULL;
+}
+
 int do_watch(struct connection *conn, struct buffered_data *in)
 {
 	struct watch *watch;
@@ -214,19 +270,9 @@ int do_watch(struct connection *conn, struct buffered_data *in)
 	if (get_strings(in, vec, ARRAY_SIZE(vec)) != ARRAY_SIZE(vec))
 		return EINVAL;
 
-	if (strstarts(vec[0], "@")) {
-		relative = false;
-		if (strlen(vec[0]) > XENSTORE_REL_PATH_MAX)
-			return EINVAL;
-		/* check if valid event */
-	} else {
-		relative = !strstarts(vec[0], "/");
-		vec[0] = canonicalize(conn, in, vec[0]);
-		if (!vec[0])
-			return ENOMEM;
-		if (!is_valid_nodename(vec[0]))
-			return EINVAL;
-	}
+	errno = check_watch_path(conn, in, &(vec[0]), &relative);
+	if (errno)
+		return errno;
 
 	/* Check for duplicates. */
 	list_for_each_entry(watch, &conn->watches, list) {
@@ -238,26 +284,11 @@ int do_watch(struct connection *conn, struct buffered_data *in)
 	if (domain_watch(conn) > quota_nb_watch_per_domain)
 		return E2BIG;
 
-	watch = talloc(conn, struct watch);
+	watch = add_watch(conn, vec[0], vec[1], relative);
 	if (!watch)
-		return ENOMEM;
-	watch->node = talloc_strdup(watch, vec[0]);
-	watch->token = talloc_strdup(watch, vec[1]);
-	if (!watch->node || !watch->token) {
-		talloc_free(watch);
-		return ENOMEM;
-	}
-	if (relative)
-		watch->relative_path = get_implicit_path(conn);
-	else
-		watch->relative_path = NULL;
+		return errno;
 
-	INIT_LIST_HEAD(&watch->events);
-
-	domain_watch_inc(conn);
-	list_add_tail(&watch->list, &conn->watches);
 	trace_create(watch, "watch");
-	talloc_set_destructor(watch, destroy_watch);
 	send_ack(conn, XS_WATCH);
 
 	/* We fire once up front: simplifies clients and restart. */
@@ -338,6 +369,29 @@ const char *dump_state_watches(FILE *fp, struct connection *conn,
 	return ret;
 }
 
+void read_state_watch(const void *ctx, const void *state)
+{
+	const struct xs_state_watch *sw = state;
+	struct connection *conn;
+	char *path, *token;
+	bool relative;
+
+	conn = get_connection_by_id(sw->conn_id);
+	if (!conn)
+		barf("connection not found for read watch");
+
+	path = (char *)sw->data;
+	token = path + sw->path_length;
+
+	/* Don't check success, we want the relative information only. */
+	check_watch_path(conn, ctx, &path, &relative);
+	if (!path)
+		barf("allocation error for read watch");
+
+	if (!add_watch(conn, path, token, relative))
+		barf("error adding watch");
+}
+
 /*
  * Local variables:
  *  mode: C
diff --git a/tools/xenstore/xenstored_watch.h b/tools/xenstore/xenstored_watch.h
index 3d81645f45..0e693f0839 100644
--- a/tools/xenstore/xenstored_watch.h
+++ b/tools/xenstore/xenstored_watch.h
@@ -33,4 +33,6 @@ void conn_delete_all_watches(struct connection *conn);
 const char *dump_state_watches(FILE *fp, struct connection *conn,
 			       unsigned int conn_id);
 
+void read_state_watch(const void *ctx, const void *state);
+
 #endif /* _XENSTORED_WATCH_H */
-- 
2.26.2


