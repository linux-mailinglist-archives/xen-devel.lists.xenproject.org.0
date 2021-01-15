Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B8D2F7465
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 09:30:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67735.121171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0KVP-0000zx-Is; Fri, 15 Jan 2021 08:30:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67735.121171; Fri, 15 Jan 2021 08:30:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0KVP-0000yt-Bd; Fri, 15 Jan 2021 08:30:51 +0000
Received: by outflank-mailman (input) for mailman id 67735;
 Fri, 15 Jan 2021 08:30:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v6X5=GS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l0KVN-0008Gh-GM
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 08:30:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9b0bcde9-4c77-4637-8514-e44ab0c2e90e;
 Fri, 15 Jan 2021 08:30:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6B92AB96D;
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
X-Inumbo-ID: 9b0bcde9-4c77-4637-8514-e44ab0c2e90e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610699408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MdMyp3DEAb+9Zw9HY9kn0zId5YKGUXIMBqIQPa1Gw/Q=;
	b=W34zoFNpwNOQV0JXGHbonRNNclJ62EkYRqMPe8w2UZr1AnMJTJtMG2bEqS+lEHlCweRASF
	jYGzb/rr8KOdyJlrG/wQKc8vBwDzXduxrIQBcgn7uDII4Ma1CIjh1P/2EqsDyw7HyX0a+5
	mmfIb98qrvCWIA/t16Us1XcXQsuQaOk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v12 22/27] tools/xenstore: add reading global state for live update
Date: Fri, 15 Jan 2021 09:29:55 +0100
Message-Id: <20210115083000.14186-23-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210115083000.14186-1-jgross@suse.com>
References: <20210115083000.14186-1-jgross@suse.com>
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
index 3bced9e39e..d94b558e99 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -536,6 +536,7 @@ void lu_read_state(void)
 	     head = (void *)head + sizeof(*head) + head->length) {
 		switch (head->type) {
 		case XS_STATE_TYPE_GLOBAL:
+			read_state_global(ctx, head + 1);
 			break;
 		case XS_STATE_TYPE_CONN:
 			break;
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 4d88aeba3d..60e98104ad 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -2512,6 +2512,15 @@ const char *dump_state_nodes(FILE *fp, const void *ctx)
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
index c7567eaf0b..ac9fe1559e 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -265,6 +265,8 @@ const char *dump_state_node_perms(FILE *fp, struct xs_state_node *sn,
 				  const struct xs_permissions *perms,
 				  unsigned int n_perms);
 
+void read_state_global(const void *ctx, const void *state);
+
 #endif /* _XENSTORED_CORE_H */
 
 /*
-- 
2.26.2


