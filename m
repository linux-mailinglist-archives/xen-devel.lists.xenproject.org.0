Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 615732F64D0
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 16:38:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67213.119832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04ho-0003AR-Eb; Thu, 14 Jan 2021 15:38:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67213.119832; Thu, 14 Jan 2021 15:38:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04ho-00039a-AP; Thu, 14 Jan 2021 15:38:36 +0000
Received: by outflank-mailman (input) for mailman id 67213;
 Thu, 14 Jan 2021 15:38:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P5GR=GR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l04hm-0002Sh-J5
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:38:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c7470f7c-5ab8-4424-9acb-cad56fbe2503;
 Thu, 14 Jan 2021 15:38:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D5826AF0F;
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
X-Inumbo-ID: c7470f7c-5ab8-4424-9acb-cad56fbe2503
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610638689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aNFJAE4KqQnX5IjGOaMkCIzNeyfe1g2GU9xo9W5ZYdw=;
	b=sF7PjYmydkar5XuezprwYewHZOzUUcLx1IM7Ddvf3I1rDFTkvIskj2umfWZZqDK+BZRFz/
	aBHrMzMfvzg18X9a8OQhM7rPy0lhX5UQL98+wflcGf7SR4frhhMhxOsy2Yr+K6VzAJbwwy
	uZojxkSk6q2SZlh2zv8kkr/rtsJ9V1U=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v11 10/27] tools/xenstore: save new binary for live update
Date: Thu, 14 Jan 2021 16:37:46 +0100
Message-Id: <20210114153803.2591-11-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114153803.2591-1-jgross@suse.com>
References: <20210114153803.2591-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Save the new binary name for the daemon case and the new kernel for
stubdom in order to support live update of Xenstore..

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Paul Durrant <paul@xen.org>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/xenstored_control.c | 41 +++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index 7854b7f46f..95ac1a1648 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -1,5 +1,5 @@
 /*
-    Interactive commands for Xen Store Daemon.
+Interactive commands for Xen Store Daemon.
     Copyright (C) 2017 Juergen Gross, SUSE Linux GmbH
 
     This program is free software; you can redistribute it and/or modify
@@ -22,6 +22,9 @@
 #include <stdlib.h>
 #include <string.h>
 #include <syslog.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <unistd.h>
 
 #include "utils.h"
 #include "talloc.h"
@@ -31,6 +34,14 @@
 struct live_update {
 	/* For verification the correct connection is acting. */
 	struct connection *conn;
+
+#ifdef __MINIOS__
+	void *kernel;
+	unsigned int kernel_size;
+	unsigned int kernel_off;
+#else
+	char *filename;
+#endif
 };
 
 static struct live_update *lu_status;
@@ -215,6 +226,13 @@ static const char *lu_binary_alloc(const void *ctx, struct connection *conn,
 	if (ret)
 		return ret;
 
+	lu_status->kernel = talloc_size(lu_status, size);
+	if (!lu_status->kernel)
+		return "Allocation failure.";
+
+	lu_status->kernel_size = size;
+	lu_status->kernel_off = 0;
+
 	return NULL;
 }
 
@@ -224,6 +242,12 @@ static const char *lu_binary_save(const void *ctx, struct connection *conn,
 	if (!lu_status || lu_status->conn != conn)
 		return "Not in live-update session.";
 
+	if (lu_status->kernel_off + size > lu_status->kernel_size)
+		return "Too much kernel data.";
+
+	memcpy(lu_status->kernel + lu_status->kernel_off, data, size);
+	lu_status->kernel_off += size;
+
 	return NULL;
 }
 
@@ -243,13 +267,23 @@ static const char *lu_binary(const void *ctx, struct connection *conn,
 			     const char *filename)
 {
 	const char *ret;
+	struct stat statbuf;
 
 	syslog(LOG_INFO, "live-update: binary %s\n", filename);
 
+	if (stat(filename, &statbuf))
+		return "File not accessible.";
+	if (!(statbuf.st_mode & (S_IXOTH | S_IXGRP | S_IXUSR)))
+		return "File not executable.";
+
 	ret = lu_begin(conn);
 	if (ret)
 		return ret;
 
+	lu_status->filename = talloc_strdup(lu_status, filename);
+	if (!lu_status->filename)
+		return "Allocation failure.";
+
 	return NULL;
 }
 
@@ -272,6 +306,11 @@ static const char *lu_start(const void *ctx, struct connection *conn,
 	if (!lu_status || lu_status->conn != conn)
 		return "Not in live-update session.";
 
+#ifdef __MINIOS__
+	if (lu_status->kernel_size != lu_status->kernel_off)
+		return "Kernel not complete.";
+#endif
+
 	/* Will be replaced by real live-update later. */
 	talloc_free(lu_status);
 
-- 
2.26.2


