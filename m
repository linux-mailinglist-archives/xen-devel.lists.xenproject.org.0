Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AE4849830
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 11:57:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675833.1051436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwfL-0002At-59; Mon, 05 Feb 2024 10:57:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675833.1051436; Mon, 05 Feb 2024 10:57:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwfK-00027j-WE; Mon, 05 Feb 2024 10:57:31 +0000
Received: by outflank-mailman (input) for mailman id 675833;
 Mon, 05 Feb 2024 10:57:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b4fC=JO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rWwaP-0002wU-Fm
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 10:52:25 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a554a333-c414-11ee-8a45-1f161083a0e0;
 Mon, 05 Feb 2024 11:52:25 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A66501F8BA;
 Mon,  5 Feb 2024 10:52:24 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6982913707;
 Mon,  5 Feb 2024 10:52:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yqo1GOi9wGXdNgAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 05 Feb 2024 10:52:24 +0000
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
X-Inumbo-ID: a554a333-c414-11ee-8a45-1f161083a0e0
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 25/32] tools/xenstored: get own domid in stubdom case
Date: Mon,  5 Feb 2024 11:49:54 +0100
Message-Id: <20240205105001.24171-26-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240205105001.24171-1-jgross@suse.com>
References: <20240205105001.24171-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: A66501F8BA
X-Spam-Level: 
X-Spam-Score: -4.00
X-Spam-Flag: NO

Obtain own domid when running as stubdom.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
V2:
- replacement of V1 patch (Andrew Cooper)
V3:
- rename called function to get_domid() (Julien Grall)
- change stub_domid type to domid_t (Julien Grall)
---
 tools/xenstored/core.c   | 1 +
 tools/xenstored/core.h   | 1 +
 tools/xenstored/minios.c | 4 ++++
 3 files changed, 6 insertions(+)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index c045a6e5db..9eb3cdf446 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -2557,6 +2557,7 @@ static struct option options[] = {
 int dom0_domid = 0;
 int dom0_event = 0;
 int priv_domid = 0;
+domid_t stub_domid = DOMID_INVALID;
 
 static unsigned int get_optval_uint(const char *arg)
 {
diff --git a/tools/xenstored/core.h b/tools/xenstored/core.h
index 6180ec8b5c..f6af086f01 100644
--- a/tools/xenstored/core.h
+++ b/tools/xenstored/core.h
@@ -361,6 +361,7 @@ do {						\
 extern int dom0_domid;
 extern int dom0_event;
 extern int priv_domid;
+extern domid_t stub_domid;
 extern bool keep_orphans;
 
 extern struct pollfd *poll_fds;
diff --git a/tools/xenstored/minios.c b/tools/xenstored/minios.c
index 6d0c11423c..22ac8defbd 100644
--- a/tools/xenstored/minios.c
+++ b/tools/xenstored/minios.c
@@ -20,6 +20,7 @@
 #include "core.h"
 #include "utils.h"
 #include <xen/grant_table.h>
+#include <mini-os/lib.h>
 
 void finish_daemonize(void)
 {
@@ -48,6 +49,9 @@ void unmap_xenbus(void *interface)
 
 void early_init(bool live_update, bool dofork, const char *pidfile)
 {
+	stub_domid = get_domid();
+	if (stub_domid == DOMID_INVALID)
+		barf("could not get own domid");
 }
 
 void late_init(bool live_update)
-- 
2.35.3


