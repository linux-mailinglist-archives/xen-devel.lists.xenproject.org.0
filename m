Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC53CA03C0B
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 11:18:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866253.1277585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV6eT-0002to-8o; Tue, 07 Jan 2025 10:17:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866253.1277585; Tue, 07 Jan 2025 10:17:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV6eT-0002rV-5N; Tue, 07 Jan 2025 10:17:33 +0000
Received: by outflank-mailman (input) for mailman id 866253;
 Tue, 07 Jan 2025 10:17:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qdqe=T7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tV6eS-00022t-Hu
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 10:17:32 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b167782-cce0-11ef-a0df-8be0dac302b0;
 Tue, 07 Jan 2025 11:17:32 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id ACDFD1F385;
 Tue,  7 Jan 2025 10:17:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 62BB713763;
 Tue,  7 Jan 2025 10:17:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id FZekFjv/fGcAYgAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 07 Jan 2025 10:17:31 +0000
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
X-Inumbo-ID: 9b167782-cce0-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1736245051; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hNgtNgsIKg1oLK4j/cMgMwg+c8JSaY2oYqCfVRclRKk=;
	b=nprIg0sIS/7P22cri3uy8fJH2nL4D6pci8Jh1evSCvb2QQ5CbtEUpf8eHovJrRIi4e5v/U
	F7en4yqATml0VrC4QFs8I6U0ft2alAKn8Dmp6bMjPiw/tzopKrFZApc2FVeT3H9Y1JXFHY
	6NeS2ccayl+gbaN2zgKAj7vAKs8AUt8=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1736245051; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hNgtNgsIKg1oLK4j/cMgMwg+c8JSaY2oYqCfVRclRKk=;
	b=nprIg0sIS/7P22cri3uy8fJH2nL4D6pci8Jh1evSCvb2QQ5CbtEUpf8eHovJrRIi4e5v/U
	F7en4yqATml0VrC4QFs8I6U0ft2alAKn8Dmp6bMjPiw/tzopKrFZApc2FVeT3H9Y1JXFHY
	6NeS2ccayl+gbaN2zgKAj7vAKs8AUt8=
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
Subject: [PATCH v6 3/7] xen/events: allow setting of global virq handler only for unbound virqs
Date: Tue,  7 Jan 2025 11:17:07 +0100
Message-ID: <20250107101711.5980-4-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107101711.5980-1-jgross@suse.com>
References: <20250107101711.5980-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
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
index 62060dc66b..341221d420 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -988,7 +988,8 @@ void send_global_virq(uint32_t virq)
 
 int set_global_virq_handler(struct domain *d, uint32_t virq)
 {
-    struct domain *old;
+    struct domain *old, *hdl;
+    const struct vcpu *v;
     int rc = 0;
 
     if (virq >= NR_VIRQS)
@@ -1012,7 +1013,22 @@ int set_global_virq_handler(struct domain *d, uint32_t virq)
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


