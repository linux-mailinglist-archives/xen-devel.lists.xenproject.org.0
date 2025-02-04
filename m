Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4972A27048
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 12:34:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881272.1291419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfHCE-0001vn-Mx; Tue, 04 Feb 2025 11:34:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881272.1291419; Tue, 04 Feb 2025 11:34:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfHCE-0001uA-J8; Tue, 04 Feb 2025 11:34:26 +0000
Received: by outflank-mailman (input) for mailman id 881272;
 Tue, 04 Feb 2025 11:34:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ljwx=U3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tfHCD-0001MV-9b
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 11:34:25 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb979923-e2eb-11ef-99a4-01e77a169b0f;
 Tue, 04 Feb 2025 12:34:23 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 81CB41F365;
 Tue,  4 Feb 2025 11:34:22 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 35A6B1393E;
 Tue,  4 Feb 2025 11:34:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gLiKCz77oWesLAAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 04 Feb 2025 11:34:22 +0000
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
X-Inumbo-ID: fb979923-e2eb-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1738668863; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g9fM0R3rr4pnSw+2kXqv7pyWo8NS0rOHw9Y3B9boDRs=;
	b=qV/vIwFpIeeCTNkIf/HWQ+T5TQXxZbOIXE6krFjp9wfAJbepsyC9CFtAF87cntLeIpqQf4
	7MCtrE00/4NzsKVo5b+x5ymjvCS9MhzKG2+FwsUllvJ/lePPOjQr8ZluRqk0kMrzvBZEyP
	N+pUDHLNfbBJi6yAkACO7wp78wMQFoc=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="Qb/MYdoC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1738668862; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g9fM0R3rr4pnSw+2kXqv7pyWo8NS0rOHw9Y3B9boDRs=;
	b=Qb/MYdoCrXDSiMtmQWaaXxJ/uVYSUyzw8ONnKmerrWshvVcu88wiqXZ7I21laPwMrBPUHh
	JAPRbfPfT2iuy7ARxAEpBny8ifPY5G68KpH0ab9WmKuGqJrrY16T7ax6litFyDxO68dwaV
	5knvjIbz3sd8z1OYrSJtppRQDlqi1GY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v8 2/9] xen/events: allow setting of global virq handler only for unbound virqs
Date: Tue,  4 Feb 2025 12:34:00 +0100
Message-ID: <20250204113407.16839-3-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204113407.16839-1-jgross@suse.com>
References: <20250204113407.16839-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 81CB41F365
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:dkim,suse.com:mid,suse.com:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

XEN_DOMCTL_set_virq_handler will happily steal a global virq from the
current domain having bound it and assign it to another domain. The
former domain will just never receive any further events for that
virq without knowing what happened.

Change the behavior to allow XEN_DOMCTL_set_virq_handler only if the
virq in question is not bound by the current domain allowed to use it.

Currently the only user of XEN_DOMCTL_set_virq_handler in the Xen code
base is init-xenstore-domain, so changing the behavior like above will
not cause any problems.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V6:
- new patch
---
 xen/common/event_channel.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index cd6f5a1211..4dba59efa2 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -991,7 +991,8 @@ void send_global_virq(uint32_t virq)
 
 int set_global_virq_handler(struct domain *d, uint32_t virq)
 {
-    struct domain *old;
+    struct domain *old, *hdl;
+    const struct vcpu *v;
     int rc = 0;
 
     if (virq >= NR_VIRQS)
@@ -1023,7 +1024,22 @@ int set_global_virq_handler(struct domain *d, uint32_t virq)
     else
     {
         old = global_virq_handlers[virq];
-        global_virq_handlers[virq] = d;
+        hdl = get_global_virq_handler(virq);
+        if ( hdl != d )
+        {
+            read_lock(&hdl->event_lock);
+
+            v = hdl->vcpu[0];
+            if ( v && read_atomic(&v->virq_to_evtchn[virq]) )
+            {
+                rc = -EBUSY;
+                old = d;
+            }
+            else
+                global_virq_handlers[virq] = d;
+
+            read_unlock(&hdl->event_lock);
+        }
     }
 
     spin_unlock(&global_virq_handlers_lock);
-- 
2.43.0


