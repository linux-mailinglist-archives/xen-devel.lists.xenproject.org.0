Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D93402F64D2
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 16:38:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67219.119866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04hy-0003SE-UQ; Thu, 14 Jan 2021 15:38:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67219.119866; Thu, 14 Jan 2021 15:38:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04hy-0003Qc-K4; Thu, 14 Jan 2021 15:38:46 +0000
Received: by outflank-mailman (input) for mailman id 67219;
 Thu, 14 Jan 2021 15:38:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P5GR=GR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l04hw-0002Sh-JN
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:38:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c05357bf-316d-4d21-b443-9784992fea9e;
 Thu, 14 Jan 2021 15:38:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7042CAED7;
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
X-Inumbo-ID: c05357bf-316d-4d21-b443-9784992fea9e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610638688; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/nflSyskC2kS0M54iM8hYwK5qRRqM3a5TA3r174vCRE=;
	b=L3KPxNJi/3apLs82SsjIgo5xSecUQLacvNNEwZjJUxvH2EcFMoxI6ZoMFk+1Y3vmjcIqzh
	Q5SWa2xqsAHGFhQMGx/OrIA9BqhAAB5d4l/cmkt4lkJ3oUxyBOTIubCq2Y/Z845ue28iqf
	FxebIEha/J1ZCsYHu9vqVYMx29Hehls=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v11 08/27] tools/xenstore: add basic live-update command parsing
Date: Thu, 14 Jan 2021 16:37:44 +0100
Message-Id: <20210114153803.2591-9-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114153803.2591-1-jgross@suse.com>
References: <20210114153803.2591-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the basic parts for parsing the live-update control command.

For now only add the parameter evaluation and calling appropriate
functions. Those function only print a message for now and return
success.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Paul Durrant <paul@xen.org>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
V2:
- keep consistent style in lu_arch() (Pawel Wieczorkiewicz)
- fix handling of force flag (Pawel Wieczorkiewicz)
- use xprintf() instead of trace() for better stubdom diag
- add conn parameter to subfunctions

V4:
- make several parameters/variables const (Julien Grall)
- don't reject an option specified multiple times (Julien Grall)
- use syslog() for messages
---
 tools/xenstore/xenstored_control.c | 105 ++++++++++++++++++++++++++++-
 1 file changed, 104 insertions(+), 1 deletion(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index 00fda5acdb..e3f0d34528 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -19,7 +19,9 @@
 #include <errno.h>
 #include <stdarg.h>
 #include <stdio.h>
+#include <stdlib.h>
 #include <string.h>
+#include <syslog.h>
 
 #include "utils.h"
 #include "talloc.h"
@@ -149,12 +151,113 @@ static int do_control_print(void *ctx, struct connection *conn,
 	return 0;
 }
 
+static const char *lu_abort(const void *ctx, struct connection *conn)
+{
+	syslog(LOG_INFO, "live-update: abort\n");
+	return NULL;
+}
+
+static const char *lu_cmdline(const void *ctx, struct connection *conn,
+			      const char *cmdline)
+{
+	syslog(LOG_INFO, "live-update: cmdline %s\n", cmdline);
+	return NULL;
+}
+
+#ifdef __MINIOS__
+static const char *lu_binary_alloc(const void *ctx, struct connection *conn,
+				   unsigned long size)
+{
+	syslog(LOG_INFO, "live-update: binary size %lu\n", size);
+	return NULL;
+}
+
+static const char *lu_binary_save(const void *ctx, struct connection *conn,
+				  unsigned int size, const char *data)
+{
+	return NULL;
+}
+
+static const char *lu_arch(const void *ctx, struct connection *conn,
+			   char **vec, int num)
+{
+	if (num == 2 && !strcmp(vec[0], "-b"))
+		return lu_binary_alloc(ctx, conn, atol(vec[1]));
+	if (num > 2 && !strcmp(vec[0], "-d"))
+		return lu_binary_save(ctx, conn, atoi(vec[1]), vec[2]);
+
+	errno = EINVAL;
+	return NULL;
+}
+#else
+static const char *lu_binary(const void *ctx, struct connection *conn,
+			     const char *filename)
+{
+	syslog(LOG_INFO, "live-update: binary %s\n", filename);
+	return NULL;
+}
+
+static const char *lu_arch(const void *ctx, struct connection *conn,
+			   char **vec, int num)
+{
+	if (num == 2 && !strcmp(vec[0], "-f"))
+		return lu_binary(ctx, conn, vec[1]);
+
+	errno = EINVAL;
+	return NULL;
+}
+#endif
+
+static const char *lu_start(const void *ctx, struct connection *conn,
+			    bool force, unsigned int to)
+{
+	syslog(LOG_INFO, "live-update: start, force=%d, to=%u\n", force, to);
+	return NULL;
+}
+
 static int do_control_lu(void *ctx, struct connection *conn,
 			 char **vec, int num)
 {
 	const char *resp;
+	const char *ret = NULL;
+	unsigned int i;
+	bool force = false;
+	unsigned int to = 0;
+
+	if (num < 1)
+		return EINVAL;
+
+	if (!strcmp(vec[0], "-a")) {
+		if (num == 1)
+			ret = lu_abort(ctx, conn);
+		else
+			return EINVAL;
+	} else if (!strcmp(vec[0], "-c")) {
+		if (num == 2)
+			ret = lu_cmdline(ctx, conn, vec[1]);
+		else
+			return EINVAL;
+	} else if (!strcmp(vec[0], "-s")) {
+		for (i = 1; i < num; i++) {
+			if (!strcmp(vec[i], "-F"))
+				force = true;
+			else if (!strcmp(vec[i], "-t") && i < num - 1) {
+				i++;
+				to = atoi(vec[i]);
+			} else
+				return EINVAL;
+		}
+		ret = lu_start(ctx, conn, force, to);
+	} else {
+		errno = 0;
+		ret = lu_arch(ctx, conn, vec, num);
+		if (errno)
+			return errno;
+	}
 
-	resp = talloc_strdup(ctx, "NYI");
+	if (!ret)
+		ret = "OK";
+	resp = talloc_strdup(ctx, ret);
 	send_reply(conn, XS_CONTROL, resp, strlen(resp) + 1);
 	return 0;
 }
-- 
2.26.2


