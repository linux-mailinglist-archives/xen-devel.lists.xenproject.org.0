Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A0C7F2953
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 10:50:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637630.993631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5NOV-00019B-E5; Tue, 21 Nov 2023 09:50:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637630.993631; Tue, 21 Nov 2023 09:50:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5NOV-00017B-Ay; Tue, 21 Nov 2023 09:50:11 +0000
Received: by outflank-mailman (input) for mailman id 637630;
 Tue, 21 Nov 2023 09:50:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AdV8=HC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r5NOT-00008u-Eb
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 09:50:09 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a711029-8853-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 10:50:07 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 82EC321979;
 Tue, 21 Nov 2023 09:50:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4D18B138E3;
 Tue, 21 Nov 2023 09:50:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id n6yPEU99XGVxNQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 21 Nov 2023 09:50:07 +0000
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
X-Inumbo-ID: 5a711029-8853-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1700560207; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v1odbQaI2Gr+IB2DF9QOM7VdackHo1o2+QYsBMZ4bdY=;
	b=KfLurMQ4BH9ZlhxVuC+1e+vLr0vYONRl4iXWBkaynG9Z7bfUaO4P1xNdCOD9UOacQQLsAI
	zTpGlS3ZaK7AbJSmwdygH959eIAlFyzRk3e/NsDZmKamfMPFYoGXsA7jymLIW71o3ghiKL
	OerhNh/G/0uOnNeB1Hkm1nVZpKMswKE=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 2/5] Mini-OS: get own domid
Date: Tue, 21 Nov 2023 10:49:50 +0100
Message-Id: <20231121094953.22430-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231121094953.22430-1-jgross@suse.com>
References: <20231121094953.22430-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -0.83
X-Spamd-Result: default: False [-0.83 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.53)[80.55%]
X-Spam-Flag: NO

Get the own domid via creation of a temporary event channel. There is
no "official" way to read the own domid in PV guests, so use the event
channel interface to get it:

- allocate an unbound event channel specifying DOMID_SELF for the
  other end

- read the event channel status which will contain the own domid in
  unbound.dom

- close the event channel

Signed-off-by: Juergen Gross <jgross@suse.com
---
V2:
- new patch
V3:
- rename function to get_domid() (Julien Grall)
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 events.c      | 33 +++++++++++++++++++++++++++++++++
 include/lib.h |  3 +++
 2 files changed, 36 insertions(+)

diff --git a/events.c b/events.c
index cdae90f4..4683e8e1 100644
--- a/events.c
+++ b/events.c
@@ -261,6 +261,39 @@ int evtchn_get_peercontext(evtchn_port_t local_port, char *ctx, int size)
     return rc;
 }
 
+/* Replace below when a hypercall is available to get the domid. */
+domid_t get_domid(void)
+{
+    int rc;
+    domid_t domid = DOMID_INVALID;
+    evtchn_alloc_unbound_t op;
+    struct evtchn_status status;
+    struct evtchn_close close;
+
+    op.dom = DOMID_SELF;
+    op.remote_dom = DOMID_SELF;
+    rc = HYPERVISOR_event_channel_op(EVTCHNOP_alloc_unbound, &op);
+    if ( rc )
+    {
+        printk("ERROR: alloc_unbound failed with rc=%d", rc);
+        return domid;
+    }
+
+    status.dom = DOMID_SELF;
+    status.port = op.port;
+    rc = HYPERVISOR_event_channel_op(EVTCHNOP_status, &status);
+    if ( rc )
+        printk("ERROR: EVTCHNOP_status failed with rc=%d", rc);
+    else
+        domid = status.u.unbound.dom;
+
+    close.port = op.port;
+    rc = HYPERVISOR_event_channel_op(EVTCHNOP_close, &close);
+    if ( rc )
+        printk("WARN: close_port %d failed rc=%d. ignored\n", close.port, rc);
+
+    return domid;
+}
 
 /*
  * Local variables:
diff --git a/include/lib.h b/include/lib.h
index fd8c36de..dd68985a 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -154,6 +154,9 @@ do {                                                           \
 /* Consistency check as much as possible. */
 void sanity_check(void);
 
+/* Get own domid. */
+domid_t get_domid(void);
+
 #ifdef HAVE_LIBC
 extern struct wait_queue_head event_queue;
 
-- 
2.35.3


