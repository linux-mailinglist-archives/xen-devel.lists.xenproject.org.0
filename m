Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FC37F2952
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 10:50:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637628.993618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5NOQ-0000ck-4z; Tue, 21 Nov 2023 09:50:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637628.993618; Tue, 21 Nov 2023 09:50:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5NOQ-0000ZI-1f; Tue, 21 Nov 2023 09:50:06 +0000
Received: by outflank-mailman (input) for mailman id 637628;
 Tue, 21 Nov 2023 09:50:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AdV8=HC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r5NOO-00008u-Lv
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 09:50:04 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 571c7c69-8853-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 10:50:03 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D6BE51F8A8;
 Tue, 21 Nov 2023 09:50:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B1271138E3;
 Tue, 21 Nov 2023 09:50:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6KwTKkl9XGVcNQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 21 Nov 2023 09:50:01 +0000
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
X-Inumbo-ID: 571c7c69-8853-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1700560201; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3t0G5pmc2tLtGKnSz0jnViu11fvXLpv0iet8qXj51Qc=;
	b=ImnKRcdwceNKjdDVCKv+HrhuMRTPVTqJczF/AtYyDP3XK/aZDyn0FlYb7ChrOcf94ZKzeP
	tb5tdFC6UJqrHNieZjr9spJrp6QpLY87KQaoQTBz4G38P7xOdZygnyyAkEB5Hw+Dqaf3d8
	T3Ew9bDLM0otCXSHIxk0V+Qk5OdxedU=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v3 1/5] Mini-OS: make xenstore_buf externally visible
Date: Tue, 21 Nov 2023 10:49:49 +0100
Message-Id: <20231121094953.22430-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231121094953.22430-1-jgross@suse.com>
References: <20231121094953.22430-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -0.60
X-Spamd-Result: default: False [-0.60 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_HAM(-0.30)[75.12%];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
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

For support of the 9pfs frontend in Xenstore-stubdom xenstore_buf
needs to be externally visible.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
---
 include/xenbus.h | 2 ++
 xenbus.c         | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/xenbus.h b/include/xenbus.h
index c0fc0ac5..542ee456 100644
--- a/include/xenbus.h
+++ b/include/xenbus.h
@@ -8,12 +8,14 @@ typedef unsigned long xenbus_transaction_t;
 
 #ifdef CONFIG_XENBUS
 extern uint32_t xenbus_evtchn;
+extern struct xenstore_domain_interface *xenstore_buf;
 
 /* Initialize the XenBus system. */
 void init_xenbus(void);
 void get_xenbus(void *p);
 #else
 #define xenbus_evtchn ~0
+#define xenstore_buf NULL
 
 static inline void init_xenbus(void)
 {
diff --git a/xenbus.c b/xenbus.c
index 923e8181..8bfd5bd4 100644
--- a/xenbus.c
+++ b/xenbus.c
@@ -44,7 +44,7 @@
 #define DEBUG(_f, _a...)    ((void)0)
 #endif
 
-static struct xenstore_domain_interface *xenstore_buf;
+struct xenstore_domain_interface *xenstore_buf;
 static DECLARE_WAIT_QUEUE_HEAD(xb_waitq);
 DECLARE_WAIT_QUEUE_HEAD(xenbus_watch_queue);
 static __DECLARE_SEMAPHORE_GENERIC(xb_write_sem, 1);
-- 
2.35.3


