Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B962F64D1
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 16:38:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67216.119845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04ht-0003JY-T1; Thu, 14 Jan 2021 15:38:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67216.119845; Thu, 14 Jan 2021 15:38:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04ht-0003IV-MW; Thu, 14 Jan 2021 15:38:41 +0000
Received: by outflank-mailman (input) for mailman id 67216;
 Thu, 14 Jan 2021 15:38:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P5GR=GR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l04hr-0002Sh-JX
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:38:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4c331215-1345-4fe4-9509-4ed179298945;
 Thu, 14 Jan 2021 15:38:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A241FAEE0;
 Thu, 14 Jan 2021 15:38:08 +0000 (UTC)
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
X-Inumbo-ID: 4c331215-1345-4fe4-9509-4ed179298945
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610638688; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=owep/JxQmqtOU8OwJCv1cz7UUEHgQaXcLN5SkEV6rDc=;
	b=sXsKxRqtcAp9Dx6W4lcV0535kvm/7N+ulOnoOssBdc+TMoIVSelUhz7w4+JJN0fGPhl4uG
	gknxQvGfVZHHMZnxGblPT+oiu9Ute2qAG8ywkEIHA5yWH+b2R/7zgX4VQDTAEtAgdpNkFw
	6+4/IS+rjCuHKQJ9GEXcT5t8fT+aUOk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v11 09/27] tools/xenstore: introduce live update status block
Date: Thu, 14 Jan 2021 16:37:45 +0100
Message-Id: <20210114153803.2591-10-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114153803.2591-1-jgross@suse.com>
References: <20210114153803.2591-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Live update of Xenstore is done in multiple steps. It needs a status
block holding the current state of live update and related data. It
is allocated as child of the connection live update was started over
in order to abort live update in case the connection is closed.

Allocation of the block is done in lu_binary[_alloc](), freeing in
lu_abort() (and for now in lu_start() as long as no real live-update
is happening).

Add tests in all live-update command handlers other than lu_abort()
and lu_binary[_alloc]() for being started via the same connection
as the begin of live-update.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Paul Durrant <paul@xen.org>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
V2:
- use talloc_zero() for allocating the status area (Julien Grall)

V4:
- const (Julien Grall)
---
 tools/xenstore/xenstored_control.c | 63 ++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index e3f0d34528..7854b7f46f 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -28,6 +28,34 @@
 #include "xenstored_core.h"
 #include "xenstored_control.h"
 
+struct live_update {
+	/* For verification the correct connection is acting. */
+	struct connection *conn;
+};
+
+static struct live_update *lu_status;
+
+static int lu_destroy(void *data)
+{
+	lu_status = NULL;
+
+	return 0;
+}
+
+static const char *lu_begin(struct connection *conn)
+{
+	if (lu_status)
+		return "live-update session already active.";
+
+	lu_status = talloc_zero(conn, struct live_update);
+	if (!lu_status)
+		return "Allocation failure.";
+	lu_status->conn = conn;
+	talloc_set_destructor(lu_status, lu_destroy);
+
+	return NULL;
+}
+
 struct cmd_s {
 	char *cmd;
 	int (*func)(void *, struct connection *, char **, int);
@@ -154,6 +182,13 @@ static int do_control_print(void *ctx, struct connection *conn,
 static const char *lu_abort(const void *ctx, struct connection *conn)
 {
 	syslog(LOG_INFO, "live-update: abort\n");
+
+	if (!lu_status)
+		return "No live-update session active.";
+
+	/* Destructor will do the real abort handling. */
+	talloc_free(lu_status);
+
 	return NULL;
 }
 
@@ -161,6 +196,10 @@ static const char *lu_cmdline(const void *ctx, struct connection *conn,
 			      const char *cmdline)
 {
 	syslog(LOG_INFO, "live-update: cmdline %s\n", cmdline);
+
+	if (!lu_status || lu_status->conn != conn)
+		return "Not in live-update session.";
+
 	return NULL;
 }
 
@@ -168,13 +207,23 @@ static const char *lu_cmdline(const void *ctx, struct connection *conn,
 static const char *lu_binary_alloc(const void *ctx, struct connection *conn,
 				   unsigned long size)
 {
+	const char *ret;
+
 	syslog(LOG_INFO, "live-update: binary size %lu\n", size);
+
+	ret = lu_begin(conn);
+	if (ret)
+		return ret;
+
 	return NULL;
 }
 
 static const char *lu_binary_save(const void *ctx, struct connection *conn,
 				  unsigned int size, const char *data)
 {
+	if (!lu_status || lu_status->conn != conn)
+		return "Not in live-update session.";
+
 	return NULL;
 }
 
@@ -193,7 +242,14 @@ static const char *lu_arch(const void *ctx, struct connection *conn,
 static const char *lu_binary(const void *ctx, struct connection *conn,
 			     const char *filename)
 {
+	const char *ret;
+
 	syslog(LOG_INFO, "live-update: binary %s\n", filename);
+
+	ret = lu_begin(conn);
+	if (ret)
+		return ret;
+
 	return NULL;
 }
 
@@ -212,6 +268,13 @@ static const char *lu_start(const void *ctx, struct connection *conn,
 			    bool force, unsigned int to)
 {
 	syslog(LOG_INFO, "live-update: start, force=%d, to=%u\n", force, to);
+
+	if (!lu_status || lu_status->conn != conn)
+		return "Not in live-update session.";
+
+	/* Will be replaced by real live-update later. */
+	talloc_free(lu_status);
+
 	return NULL;
 }
 
-- 
2.26.2


