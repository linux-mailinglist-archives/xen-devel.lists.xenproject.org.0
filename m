Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 277494AB51F
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 07:42:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266409.460111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGxim-0003WS-Fn; Mon, 07 Feb 2022 06:41:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266409.460111; Mon, 07 Feb 2022 06:41:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGxim-0003NJ-59; Mon, 07 Feb 2022 06:41:56 +0000
Received: by outflank-mailman (input) for mailman id 266409;
 Mon, 07 Feb 2022 06:41:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ddl1=SW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nGxik-0002yP-Kr
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 06:41:54 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08e550ca-87e1-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 07:41:52 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BE1F21F386;
 Mon,  7 Feb 2022 06:41:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 954EC13519;
 Mon,  7 Feb 2022 06:41:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sB8XIzC/AGLDUgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 07 Feb 2022 06:41:52 +0000
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
X-Inumbo-ID: 08e550ca-87e1-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1644216112; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O9L5VCHqoZDN85JbspHZhwKfGz0YeeeAr6knmmOSjvM=;
	b=fqfGbK+AjBnN9kden99G3s2VjnS2aqDvCscd2EKdW332AzAsrEzxGWjWxnRXdYD27mDaaP
	W6ricm/CcUTP20KgsLhwjIFPssGRNLb3ObT0xJM0DcSCrDociLS4DiOl1QJYPJzlA0W2la
	KoUZ7LGdapoAitMjLIm30Xh9MHEivSU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 4/5] tools/libs/evtchn: use _xen_list.h
Date: Mon,  7 Feb 2022 07:41:46 +0100
Message-Id: <20220207064147.9585-5-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207064147.9585-1-jgross@suse.com>
References: <20220207064147.9585-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of including xen-external/bsd-sys-queue.h use the header
_xen_list.h in minios.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/evtchn/minios.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tools/libs/evtchn/minios.c b/tools/libs/evtchn/minios.c
index 30f98bc7e4..65cfccfd09 100644
--- a/tools/libs/evtchn/minios.c
+++ b/tools/libs/evtchn/minios.c
@@ -20,7 +20,7 @@
  * Split off from xc_minios.c
  */
 
-#include "xen-external/bsd-sys-queue.h"
+#include "_xen_list.h"
 #include <mini-os/types.h>
 #include <mini-os/os.h>
 #include <mini-os/lib.h>
@@ -38,10 +38,10 @@
 
 #include "private.h"
 
-LIST_HEAD(port_list, port_info);
+XEN_LIST_HEAD(port_list, struct port_info);
 
 struct port_info {
-    LIST_ENTRY(port_info) list;
+    XEN_LIST_ENTRY(struct port_info) list;
     evtchn_port_t port;
     bool pending;
     bool bound;
@@ -62,7 +62,7 @@ static struct port_info *port_alloc(xenevtchn_handle *xce)
     port_info->port = -1;
     port_info->bound = false;
 
-    LIST_INSERT_HEAD(port_list, port_info, list);
+    XEN_LIST_INSERT_HEAD(port_list, port_info, list);
 
     return port_info;
 }
@@ -72,7 +72,7 @@ static void port_dealloc(struct port_info *port_info)
     if ( port_info->bound )
         unbind_evtchn(port_info->port);
 
-    LIST_REMOVE(port_info, list);
+    XEN_LIST_REMOVE(port_info, list);
     free(port_info);
 }
 
@@ -81,7 +81,7 @@ static int evtchn_close_fd(struct file *file)
     struct port_info *port_info, *tmp;
     struct port_list *port_list = file->dev;
 
-    LIST_FOREACH_SAFE(port_info, port_list, list, tmp)
+    XEN_LIST_FOREACH_SAFE(port_info, port_list, list, tmp)
         port_dealloc(port_info);
     free(port_list);
 
@@ -126,7 +126,7 @@ int osdep_evtchn_open(xenevtchn_handle *xce, unsigned int flags)
     }
 
     file->dev = list;
-    LIST_INIT(list);
+    XEN_LIST_INIT(list);
     xce->fd = fd;
     printf("evtchn_open() -> %d\n", fd);
 
@@ -173,7 +173,7 @@ static void evtchn_handler(evtchn_port_t port, struct pt_regs *regs, void *data)
     assert(file);
     port_list = file->dev;
     mask_evtchn(port);
-    LIST_FOREACH(port_info, port_list, list)
+    XEN_LIST_FOREACH(port_info, port_list, list)
     {
         if ( port_info->port == port )
             goto found;
@@ -257,7 +257,7 @@ int xenevtchn_unbind(xenevtchn_handle *xce, evtchn_port_t port)
     struct port_info *port_info;
     struct port_list *port_list = file->dev;
 
-    LIST_FOREACH(port_info, port_list, list)
+    XEN_LIST_FOREACH(port_info, port_list, list)
     {
         if ( port_info->port == port )
         {
@@ -314,7 +314,7 @@ xenevtchn_port_or_error_t xenevtchn_pending(xenevtchn_handle *xce)
 
     file->read = false;
 
-    LIST_FOREACH(port_info, port_list, list)
+    XEN_LIST_FOREACH(port_info, port_list, list)
     {
         if ( port_info->port != -1 && port_info->pending )
         {
-- 
2.34.1


