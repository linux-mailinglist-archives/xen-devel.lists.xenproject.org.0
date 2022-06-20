Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D94605511A6
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 09:39:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352526.579322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3Bza-0002vR-Vh; Mon, 20 Jun 2022 07:38:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352526.579322; Mon, 20 Jun 2022 07:38:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3Bza-0002sq-Pu; Mon, 20 Jun 2022 07:38:38 +0000
Received: by outflank-mailman (input) for mailman id 352526;
 Mon, 20 Jun 2022 07:38:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hycu=W3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o3BzY-0002ZE-Jq
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 07:38:36 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fca02103-f06b-11ec-bd2d-47488cf2e6aa;
 Mon, 20 Jun 2022 09:38:34 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 758BA21BCC;
 Mon, 20 Jun 2022 07:38:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 48E2F13A79;
 Mon, 20 Jun 2022 07:38:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0H4eEPkjsGI3DAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 20 Jun 2022 07:38:33 +0000
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
X-Inumbo-ID: fca02103-f06b-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655710713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mXoU4RmuES8ycHpl3QBq4ZigOK3MOzKFqQcwP9Rcli4=;
	b=QqRprFy/46avRj+XmmN+NOAl8ov8kRK941KMadJFb9N5OhcdNsIwPfT4lZRBj4mv8wOeXD
	yCLGF+ZwcfA6RIcs0RScMTmzzllsCd+ZkJ+rRr87E7/U9RpLu8RoEiB1Oyko0lWwoF9YfL
	0U88RrGFfrwgRAeaagcxsn8Uvuy4QGk=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 3/8] mini-os: eliminate console/console.h
Date: Mon, 20 Jun 2022 09:38:15 +0200
Message-Id: <20220620073820.9336-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220620073820.9336-1-jgross@suse.com>
References: <20220620073820.9336-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

console/console.h contains only a single prototype. Move that to
include/console.h and remove console/console.h.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 console/console.h      | 2 --
 console/xenbus.c       | 2 +-
 console/xencons_ring.c | 2 +-
 include/console.h      | 1 +
 4 files changed, 3 insertions(+), 4 deletions(-)
 delete mode 100644 console/console.h

diff --git a/console/console.h b/console/console.h
deleted file mode 100644
index e85147a4..00000000
--- a/console/console.h
+++ /dev/null
@@ -1,2 +0,0 @@
-
-void console_handle_input(evtchn_port_t port, struct pt_regs *regs, void *data);
diff --git a/console/xenbus.c b/console/xenbus.c
index d8950454..73659656 100644
--- a/console/xenbus.c
+++ b/console/xenbus.c
@@ -5,13 +5,13 @@
 #include <mini-os/events.h>
 #include <mini-os/os.h>
 #include <mini-os/lib.h>
+#include <mini-os/console.h>
 #include <mini-os/xenbus.h>
 #include <xen/io/console.h>
 #include <xen/io/protocols.h>
 #include <xen/io/ring.h>
 #include <mini-os/xmalloc.h>
 #include <mini-os/gnttab.h>
-#include "console.h"
 
 void free_consfront(struct consfront_dev *dev)
 {
diff --git a/console/xencons_ring.c b/console/xencons_ring.c
index efedf46b..495f0a19 100644
--- a/console/xencons_ring.c
+++ b/console/xencons_ring.c
@@ -5,6 +5,7 @@
 #include <mini-os/events.h>
 #include <mini-os/os.h>
 #include <mini-os/lib.h>
+#include <mini-os/console.h>
 #include <mini-os/xenbus.h>
 #include <xen/io/console.h>
 #include <xen/io/protocols.h>
@@ -12,7 +13,6 @@
 #include <xen/hvm/params.h>
 #include <mini-os/xmalloc.h>
 #include <mini-os/gnttab.h>
-#include "console.h"
 
 DECLARE_WAIT_QUEUE_HEAD(console_queue);
 
diff --git a/include/console.h b/include/console.h
index e76e4234..d216d247 100644
--- a/include/console.h
+++ b/include/console.h
@@ -98,5 +98,6 @@ void free_consfront(struct consfront_dev *dev);
 extern const struct file_ops console_ops;
 int open_consfront(char *nodename);
 #endif
+void console_handle_input(evtchn_port_t port, struct pt_regs *regs, void *data);
 
 #endif /* _LIB_CONSOLE_H_ */
-- 
2.35.3


