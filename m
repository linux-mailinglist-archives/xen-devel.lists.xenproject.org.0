Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2722DB195
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 17:37:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54568.95040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDJl-0007UX-SC; Tue, 15 Dec 2020 16:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54568.95040; Tue, 15 Dec 2020 16:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDJl-0007Sj-Jd; Tue, 15 Dec 2020 16:36:53 +0000
Received: by outflank-mailman (input) for mailman id 54568;
 Tue, 15 Dec 2020 16:36:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2CwE=FT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kpDJj-00066M-IB
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:36:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 28d56c77-03f2-431c-867b-f6c7232bc192;
 Tue, 15 Dec 2020 16:36:14 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D1B29B27F;
 Tue, 15 Dec 2020 16:36:11 +0000 (UTC)
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
X-Inumbo-ID: 28d56c77-03f2-431c-867b-f6c7232bc192
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608050171; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QJPffHFIyMSKdd75zSh1AO2Awnj/+F1fuoew120PJO0=;
	b=tpTufBOz6DdHVRPPJ1z+8UZ/7CD0gbq77+pAvlUXSrOhGTgXhTgspf2cwO9+Pq+OXIxAdl
	hCbNNX+3Wla3Fb2b4gkcWBzTMlfo0HNjMl5894nx9TukfLj9iUVP9Ye+r+YqV6QvnPI3Kb
	W+X6lXqPSNgLXLQUwieVvfrf/iLq/9o=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v10 20/25] tools/xenstore: add reading global state for live update
Date: Tue, 15 Dec 2020 17:35:58 +0100
Message-Id: <20201215163603.21700-21-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201215163603.21700-1-jgross@suse.com>
References: <20201215163603.21700-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add reading the global state for live update.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 tools/xenstore/xenstored_control.c | 1 +
 tools/xenstore/xenstored_core.c    | 9 +++++++++
 tools/xenstore/xenstored_core.h    | 2 ++
 3 files changed, 12 insertions(+)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index 129d2b44bb..f6c4ab3d8a 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -519,6 +519,7 @@ void lu_read_state(void)
 	     head = (void *)head + sizeof(*head) + head->length) {
 		switch (head->type) {
 		case XS_STATE_TYPE_GLOBAL:
+			read_state_global(ctx, head + 1);
 			break;
 		case XS_STATE_TYPE_CONN:
 			break;
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index d6f8373ee0..5922a03a98 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -2451,6 +2451,15 @@ const char *dump_state_nodes(FILE *fp, const void *ctx)
 	return dump_state_node_tree(fp, path);
 }
 
+void read_state_global(const void *ctx, const void *state)
+{
+	const struct xs_state_global *glb = state;
+
+	sock = glb->socket_fd;
+
+	domain_init(glb->evtchn_fd);
+}
+
 /*
  * Local variables:
  *  mode: C
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index e40e0e6806..6c9d838f11 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -244,6 +244,8 @@ const char *dump_state_node_perms(FILE *fp, struct xs_state_node *sn,
 				  const struct xs_permissions *perms,
 				  unsigned int n_perms);
 
+void read_state_global(const void *ctx, const void *state);
+
 #endif /* _XENSTORED_CORE_H */
 
 /*
-- 
2.26.2


