Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E6C4AD1E6
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 08:07:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267540.461299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHKaM-00009A-7N; Tue, 08 Feb 2022 07:06:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267540.461299; Tue, 08 Feb 2022 07:06:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHKaM-0008Vx-2i; Tue, 08 Feb 2022 07:06:46 +0000
Received: by outflank-mailman (input) for mailman id 267540;
 Tue, 08 Feb 2022 07:06:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=co3W=SX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nHKaK-0008AS-Jw
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 07:06:44 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab265d4d-88ad-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 08:06:42 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3D4EB21107;
 Tue,  8 Feb 2022 07:06:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 153E113483;
 Tue,  8 Feb 2022 07:06:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2JryA4IWAmKxHgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 08 Feb 2022 07:06:42 +0000
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
X-Inumbo-ID: ab265d4d-88ad-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1644304002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O9L5VCHqoZDN85JbspHZhwKfGz0YeeeAr6knmmOSjvM=;
	b=pFucpYKdrfeC2ykt7q9s1nWnrqV9sAt2QBSB7t8ntYAIrAVTwHTjybqR5qsz4S4axFwM0c
	I3lTx8sVoDDqvpJrj+v2WwBEYcCNynb/JSFyNGONSn9qt+eJkoHzm8058dHyjHkkwSLTOQ
	uVQaVMTC5a+vK4a39m9Btnset4Z+ZJY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 4/5] tools/libs/evtchn: use _xen_list.h
Date: Tue,  8 Feb 2022 08:06:37 +0100
Message-Id: <20220208070638.5909-5-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208070638.5909-1-jgross@suse.com>
References: <20220208070638.5909-1-jgross@suse.com>
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


