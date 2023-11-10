Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3021C7E7BE0
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 12:35:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630215.982933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Pmu-0000Rv-MX; Fri, 10 Nov 2023 11:35:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630215.982933; Fri, 10 Nov 2023 11:35:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Pmu-0000Oy-JN; Fri, 10 Nov 2023 11:35:00 +0000
Received: by outflank-mailman (input) for mailman id 630215;
 Fri, 10 Nov 2023 11:34:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ap16=GX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r1Pms-0007he-NU
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 11:34:58 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b71cb8c-7fbd-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 12:34:55 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D74AB1F8BA;
 Fri, 10 Nov 2023 11:34:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A717613398;
 Fri, 10 Nov 2023 11:34:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mZB6J14VTmUABAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 10 Nov 2023 11:34:54 +0000
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
X-Inumbo-ID: 2b71cb8c-7fbd-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699616094; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UMM1Ggz+vBiGVJdcd2QMUJ1ZGIfkpwMwpm/gMVXFLeQ=;
	b=hZooTPeThVheEzRapoEd6UFJiQa3WN3RnkHWOV0CJVv/fy91v0n9hCFLqDjphzDoFl8Ocj
	M/UUI9z1zxlzsSupMF80JwZRdnLSJiyKbHXUZZlMLPNEcEi6OrOe3fO2GUCPLlWrRukScl
	OZmwN4JSkTsHU1iD8eiNiwBvJryxXrM=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v2 3/5] Mini-OS: don't crash if no shutdown node is available
Date: Fri, 10 Nov 2023 12:34:33 +0100
Message-Id: <20231110113435.22609-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231110113435.22609-1-jgross@suse.com>
References: <20231110113435.22609-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It might be perfectly fine not to have a control/shutdown Xenstore
node. If this is the case, don't crash, but just terminate the
shutdown thread after issuing a message that shutdown isn't available.

In fini_shutdown() clearing the watch can result in an error now, in
case the early exit above was taken. Just ignore this error now.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
---
 shutdown.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/shutdown.c b/shutdown.c
index bb2c6f11..ded6b64d 100644
--- a/shutdown.c
+++ b/shutdown.c
@@ -75,7 +75,9 @@ static void shutdown_thread(void *p)
         xenbus_wait_for_watch(&events);
         if ((err = xenbus_read(XBT_NIL, path, &shutdown))) {
             free(err);
-            do_exit();
+            free(xenbus_unwatch_path_token(XBT_NIL, path, token));
+            printk("Shutdown Xenstore node not available.\n");
+            return;
         }
 
         if (end_shutdown_thread)
@@ -117,15 +119,9 @@ void init_shutdown(void)
 
 void fini_shutdown(void)
 {
-    char *err;
-
     end_shutdown_thread = 1;
     xenbus_release_wait_for_watch(&events);
-    err = xenbus_unwatch_path_token(XBT_NIL, path, token);
-    if (err) {
-        free(err);
-        do_exit();
-    }
+    free(xenbus_unwatch_path_token(XBT_NIL, path, token));
 }
 #endif
 
-- 
2.35.3


