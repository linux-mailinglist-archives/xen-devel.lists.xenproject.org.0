Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2C0B14CA9
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 13:02:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062450.1428158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugi67-0003mL-AQ; Tue, 29 Jul 2025 11:02:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062450.1428158; Tue, 29 Jul 2025 11:02:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugi67-0003hu-3b; Tue, 29 Jul 2025 11:02:19 +0000
Received: by outflank-mailman (input) for mailman id 1062450;
 Tue, 29 Jul 2025 11:02:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TZvG=2K=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ugi66-0001sN-B1
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 11:02:18 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7dd56c3a-6c6b-11f0-a31e-13f23c93f187;
 Tue, 29 Jul 2025 13:02:17 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 78FA21F809;
 Tue, 29 Jul 2025 11:02:17 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4F24613876;
 Tue, 29 Jul 2025 11:02:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id tLfbETmqiGjZbQAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 29 Jul 2025 11:02:17 +0000
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
X-Inumbo-ID: 7dd56c3a-6c6b-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753786937; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vwMsNmqgx8mXwj83vGITUGipAZqvYoBArwH0UK0/Kes=;
	b=QBjOfcCgO699/qRVyvQW8vQ0Ljl2tCHxIlbL72x15HKUSMqHDSzO2Ek8yPQWZsp/wm7DSm
	foPW2DnUjjXZKVUubJCU3obWckBnq6NXX/lB3/qOdOXMSvMFj90HMARw+JUf1eElZrU9q/
	3RBc8dulxd6x5AFchRYrc5STQ2UuAkE=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753786937; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vwMsNmqgx8mXwj83vGITUGipAZqvYoBArwH0UK0/Kes=;
	b=QBjOfcCgO699/qRVyvQW8vQ0Ljl2tCHxIlbL72x15HKUSMqHDSzO2Ek8yPQWZsp/wm7DSm
	foPW2DnUjjXZKVUubJCU3obWckBnq6NXX/lB3/qOdOXMSvMFj90HMARw+JUf1eElZrU9q/
	3RBc8dulxd6x5AFchRYrc5STQ2UuAkE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v2 5/9] tools/libxenevtchn: add xenevtchn_bind() under Mini-OS
Date: Tue, 29 Jul 2025 13:01:41 +0200
Message-ID: <20250729110146.10580-6-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250729110146.10580-1-jgross@suse.com>
References: <20250729110146.10580-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

In order to reactivate an event channel after kexec() of Mini-OS,
libxenevtchn needs to allocate the port data for the event channel
and set the handler again. Add a new interface xenevtchn_bind()
for that purpose, available under Mini-OS only.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/include/xenevtchn.h  | 11 +++++++++++
 tools/libs/evtchn/minios.c | 17 +++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/tools/include/xenevtchn.h b/tools/include/xenevtchn.h
index 1255c85178..113a718d67 100644
--- a/tools/include/xenevtchn.h
+++ b/tools/include/xenevtchn.h
@@ -173,6 +173,17 @@ int xenevtchn_unmask(xenevtchn_handle *xce, evtchn_port_t port);
  */
 int xenevtchn_restrict(xenevtchn_handle *xce, domid_t domid);
 
+/**
+ * Bind an event channel under Mini-OS.
+ *
+ * Bind an event channel specified by its known port after a kexec() of
+ * Mini-OS. This function is available under Mini-OS only!
+ *
+ * @parm xce handle to the open evtchn interface
+ * @parm port the event channel to bind again
+ * @return 0 on success, -1 on failure with errno set appropriately.
+ */
+int xenevtchn_bind(xenevtchn_handle *xce, evtchn_port_t port);
 #endif
 
 /*
diff --git a/tools/libs/evtchn/minios.c b/tools/libs/evtchn/minios.c
index 0d2a201438..36e4201249 100644
--- a/tools/libs/evtchn/minios.c
+++ b/tools/libs/evtchn/minios.c
@@ -259,6 +259,23 @@ xenevtchn_port_or_error_t xenevtchn_bind_interdomain(xenevtchn_handle *xce,
     return local_port;
 }
 
+int xenevtchn_bind(xenevtchn_handle *xce, evtchn_port_t port)
+{
+    struct port_info *port_info;
+    port_info = port_alloc(xce);
+    if ( port_info == NULL )
+        return -1;
+
+    printf("xenevtchn_bind(%"PRId32")\n", port);
+    bind_evtchn(port, evtchn_handler, xce);
+
+    port_info->bound = true;
+    port_info->port = port;
+    unmask_evtchn(port);
+
+    return 0;
+}
+
 int xenevtchn_unbind(xenevtchn_handle *xce, evtchn_port_t port)
 {
     int fd = xce->fd;
-- 
2.43.0


