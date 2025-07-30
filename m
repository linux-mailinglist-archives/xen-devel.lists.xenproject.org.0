Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0934B16041
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 14:23:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063887.1429643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh5qN-0006J7-Dt; Wed, 30 Jul 2025 12:23:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063887.1429643; Wed, 30 Jul 2025 12:23:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh5qN-0006GL-Aq; Wed, 30 Jul 2025 12:23:39 +0000
Received: by outflank-mailman (input) for mailman id 1063887;
 Wed, 30 Jul 2025 12:23:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=txka=2L=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uh5qL-0004Wg-7t
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 12:23:37 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0432f4b0-6d40-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 14:23:36 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1DC311F809;
 Wed, 30 Jul 2025 12:23:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E9F0D1388B;
 Wed, 30 Jul 2025 12:23:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 7+uwN8cOimi2JAAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 30 Jul 2025 12:23:35 +0000
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
X-Inumbo-ID: 0432f4b0-6d40-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753878216; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K6iAtxXMUrScZVtmsx02gxIyebOq1l4zjJnLdM45pk4=;
	b=eYx5eR5H61tZe6+OLjjtLIpj8Wx69jx5nnTa061+LJj1XfEW8dwe0Krvw60p/oPmkMM5YT
	DqqxIvfZwzgW95cMvpoH2HEUEOVzXk6pImORQXo3Hqm5PVjPZMiv8umP3D/Viw+1JE7wWz
	Ia6Dia8t/iJLgkdcDAcODzl8mujKSzA=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=eYx5eR5H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753878216; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K6iAtxXMUrScZVtmsx02gxIyebOq1l4zjJnLdM45pk4=;
	b=eYx5eR5H61tZe6+OLjjtLIpj8Wx69jx5nnTa061+LJj1XfEW8dwe0Krvw60p/oPmkMM5YT
	DqqxIvfZwzgW95cMvpoH2HEUEOVzXk6pImORQXo3Hqm5PVjPZMiv8umP3D/Viw+1JE7wWz
	Ia6Dia8t/iJLgkdcDAcODzl8mujKSzA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v3 5/9] tools/libxenevtchn: add xenevtchn_bind() under Mini-OS
Date: Wed, 30 Jul 2025 14:23:01 +0200
Message-ID: <20250730122305.4050-6-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730122305.4050-1-jgross@suse.com>
References: <20250730122305.4050-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:mid,suse.com:dkim,suse.com:email];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 1DC311F809
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

In order to reactivate an event channel after kexec() of Mini-OS,
libxenevtchn needs to allocate the port data for the event channel
and set the handler again. Add a new interface xenevtchn_bind()
for that purpose, available under Mini-OS only.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
Acked-by: Anthony PERARD <anthony.perard@vates.tech>
---
V3:
- add #ifdef __MINIOS__ (Anthony Perard)
---
 tools/include/xenevtchn.h  | 13 +++++++++++++
 tools/libs/evtchn/minios.c | 17 +++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/tools/include/xenevtchn.h b/tools/include/xenevtchn.h
index 1255c85178..5748af530b 100644
--- a/tools/include/xenevtchn.h
+++ b/tools/include/xenevtchn.h
@@ -173,6 +173,19 @@ int xenevtchn_unmask(xenevtchn_handle *xce, evtchn_port_t port);
  */
 int xenevtchn_restrict(xenevtchn_handle *xce, domid_t domid);
 
+#ifdef __MINIOS__
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
+#endif
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


