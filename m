Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 180C34695EE
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 13:46:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238844.413922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muDNs-0008KY-8N; Mon, 06 Dec 2021 12:46:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238844.413922; Mon, 06 Dec 2021 12:46:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muDNs-0008I0-4X; Mon, 06 Dec 2021 12:46:20 +0000
Received: by outflank-mailman (input) for mailman id 238844;
 Mon, 06 Dec 2021 12:46:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9VqD=QX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1muDNq-0008Hp-5W
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 12:46:18 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80c9bbf1-5692-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 13:46:17 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9082F212C0;
 Mon,  6 Dec 2021 12:46:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 569A413C18;
 Mon,  6 Dec 2021 12:46:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RTnhExcGrmGACgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 06 Dec 2021 12:46:15 +0000
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
X-Inumbo-ID: 80c9bbf1-5692-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1638794775; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/A9hituH0+aNT0T1wCGc2OkDoQuYF+gpjDznKK7VZyY=;
	b=sMm+Y895O0EMvsESVYoYMPjP+qY/t980M9zrWHQy010a6pGQqMqpy34xMtKhzo6hxaeM96
	L2yuI7aFWFCEaWR503e4VfHsKhGdxpghBvA68AOKebDHvflqU5YL4qxLbFXOYNEaKyK/fq
	/S7mGpe2S0PIThYZ2G4/8Q9ZpzFCDCs=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] mini-os: support event channel 0 for console
Date: Mon,  6 Dec 2021 13:46:12 +0100
Message-Id: <20211206124612.24758-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211206072337.9517-1-jgross@suse.com>
References: <20211206072337.9517-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The console event channel might be 0 for the console, so use the value
of ~0 as invalid instead.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 console/xencons_ring.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/console/xencons_ring.c b/console/xencons_ring.c
index b6db74e..5c2573e 100644
--- a/console/xencons_ring.c
+++ b/console/xencons_ring.c
@@ -17,7 +17,7 @@
 DECLARE_WAIT_QUEUE_HEAD(console_queue);
 
 static struct xencons_interface *console_ring;
-uint32_t console_evtchn;
+uint32_t console_evtchn = ~0;
 
 static struct consfront_dev* resume_xen_console(struct consfront_dev* dev);
 
@@ -55,7 +55,7 @@ static inline void notify_daemon(struct consfront_dev *dev)
 
 static inline struct xencons_interface *xencons_interface(void)
 {
-    return console_evtchn ? console_ring : NULL;
+    return (console_evtchn != ~0) ? console_ring : NULL;
 } 
  
 int xencons_ring_send_no_notify(struct consfront_dev *dev, const char *data, unsigned len)
@@ -181,7 +181,7 @@ struct consfront_dev *xencons_ring_init(void)
 {
     struct consfront_dev *dev;
 
-    if (!console_evtchn)
+    if (console_evtchn != ~0)
         return 0;
 
     dev = malloc(sizeof(struct consfront_dev));
-- 
2.26.2


