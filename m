Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F017F2954
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 10:50:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637633.993646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5NOa-0001Zi-PC; Tue, 21 Nov 2023 09:50:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637633.993646; Tue, 21 Nov 2023 09:50:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5NOa-0001Xk-Ky; Tue, 21 Nov 2023 09:50:16 +0000
Received: by outflank-mailman (input) for mailman id 637633;
 Tue, 21 Nov 2023 09:50:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AdV8=HC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r5NOY-00008u-PU
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 09:50:14 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5dc3f73e-8853-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 10:50:13 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0F1111F8A8;
 Tue, 21 Nov 2023 09:50:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D7941138E3;
 Tue, 21 Nov 2023 09:50:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3wJuM1R9XGV9NQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 21 Nov 2023 09:50:12 +0000
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
X-Inumbo-ID: 5dc3f73e-8853-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1700560213; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UMM1Ggz+vBiGVJdcd2QMUJ1ZGIfkpwMwpm/gMVXFLeQ=;
	b=phAppV4EtZF0Z3rNx4++xXTxpsVGKl2OMvyHuw2nsrHhk8IYRMThKWX5ZIDV0mdkApKgPH
	Y0jkNgcwq5SOHnDkjjPZrypWT3TkSVIrNSZbKhf4GLMEmWrZ//GfAzSXHiaZYSZwVU6m+E
	WlLe8nboqcgT6YEz9yQ8n2mpkSx2Muo=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v3 3/5] Mini-OS: don't crash if no shutdown node is available
Date: Tue, 21 Nov 2023 10:49:51 +0100
Message-Id: <20231121094953.22430-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231121094953.22430-1-jgross@suse.com>
References: <20231121094953.22430-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -1.16
X-Spamd-Result: default: False [-1.16 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_HAM(-0.86)[85.56%];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[6];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[ens-lyon.org,xen.org,suse.com,gmail.com];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

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


