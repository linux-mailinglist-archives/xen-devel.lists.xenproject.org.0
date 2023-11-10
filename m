Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3787E7BDD
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 12:35:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630212.982914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Pmn-0008Pf-9G; Fri, 10 Nov 2023 11:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630212.982914; Fri, 10 Nov 2023 11:34:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Pmn-0008MI-66; Fri, 10 Nov 2023 11:34:53 +0000
Received: by outflank-mailman (input) for mailman id 630212;
 Fri, 10 Nov 2023 11:34:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ap16=GX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r1Pmm-0007he-4H
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 11:34:52 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2819436e-7fbd-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 12:34:49 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4191C1F8BA;
 Fri, 10 Nov 2023 11:34:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 153EA13398;
 Fri, 10 Nov 2023 11:34:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Pte9A1kVTmXsAwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 10 Nov 2023 11:34:49 +0000
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
X-Inumbo-ID: 2819436e-7fbd-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699616089; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oEkaTvWrd2nXatjBd0EXJy9ZObp+JBhOQHMFm6gHKW4=;
	b=s9UoIFSj79bmGo8WgY7yrK18Ld9fC6vQctHhLCTBqkGMmsjBmbVM1gDtyGugGGBjAj0Qlz
	tADXA2DapRZ48BJzdZWkqnuM3OO/grtYiQPXRQRi9CeGacPQAj9eVUd5axRdrZU09BDte6
	VtrGrER+gGEF/hmdiIKl0QHRxHg8J3I=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 2/5] Mini-OS: get own domid
Date: Fri, 10 Nov 2023 12:34:32 +0100
Message-Id: <20231110113435.22609-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231110113435.22609-1-jgross@suse.com>
References: <20231110113435.22609-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 events.c         | 32 ++++++++++++++++++++++++++++++++
 include/events.h |  2 ++
 2 files changed, 34 insertions(+)

diff --git a/events.c b/events.c
index cdae90f4..af9f9f9e 100644
--- a/events.c
+++ b/events.c
@@ -261,6 +261,38 @@ int evtchn_get_peercontext(evtchn_port_t local_port, char *ctx, int size)
     return rc;
 }
 
+domid_t evtchn_get_domid(void)
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
diff --git a/include/events.h b/include/events.h
index 705ad93a..87311481 100644
--- a/include/events.h
+++ b/include/events.h
@@ -57,4 +57,6 @@ static inline int notify_remote_via_evtchn(evtchn_port_t port)
 void fini_events(void);
 void suspend_events(void);
 
+domid_t evtchn_get_domid(void);
+
 #endif /* _EVENTS_H_ */
-- 
2.35.3


