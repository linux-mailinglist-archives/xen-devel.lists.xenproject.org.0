Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49983A03C07
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 11:18:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866250.1277565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV6eK-0002JL-Ir; Tue, 07 Jan 2025 10:17:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866250.1277565; Tue, 07 Jan 2025 10:17:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV6eK-0002HY-GD; Tue, 07 Jan 2025 10:17:24 +0000
Received: by outflank-mailman (input) for mailman id 866250;
 Tue, 07 Jan 2025 10:17:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qdqe=T7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tV6eJ-0002Gw-3e
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 10:17:23 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 944e748f-cce0-11ef-99a4-01e77a169b0f;
 Tue, 07 Jan 2025 11:17:21 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4274421101;
 Tue,  7 Jan 2025 10:17:20 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EEE4613763;
 Tue,  7 Jan 2025 10:17:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ByjcOC//fGf1YQAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 07 Jan 2025 10:17:19 +0000
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
X-Inumbo-ID: 944e748f-cce0-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1736245040; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HhXkIABEk1e1lqyLU/BUaX78Jkdwo9F7qhL5iVLjc+A=;
	b=buR/RyB+4IOMLZ7dP+bBBplJxeXAOvtJPpYw/7IlGXJ7MYJOyimydNRs9XPlkMQhqFOdAX
	BkKkdONtYlvaSbFoywkz7o5C7iLrjA42mLTI8TsurjKjcLOmeukjgP6isuxToYdY7Vz64R
	TSQ/pOl2OdwXra05kj/k+tXeo4AzM7w=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="buR/RyB+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1736245040; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HhXkIABEk1e1lqyLU/BUaX78Jkdwo9F7qhL5iVLjc+A=;
	b=buR/RyB+4IOMLZ7dP+bBBplJxeXAOvtJPpYw/7IlGXJ7MYJOyimydNRs9XPlkMQhqFOdAX
	BkKkdONtYlvaSbFoywkz7o5C7iLrjA42mLTI8TsurjKjcLOmeukjgP6isuxToYdY7Vz64R
	TSQ/pOl2OdwXra05kj/k+tXeo4AzM7w=
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
Subject: [PATCH v6 1/7] xen/events: fix race with set_global_virq_handler()
Date: Tue,  7 Jan 2025 11:17:05 +0100
Message-ID: <20250107101711.5980-2-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107101711.5980-1-jgross@suse.com>
References: <20250107101711.5980-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4274421101
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

There is a possible race scenario between set_global_virq_handler()
and clear_global_virq_handlers() targeting the same domain, which
might result in that domain ending as a zombie domain.

In case set_global_virq_handler() is being called for a domain which
is just dying, it might happen that clear_global_virq_handlers() is
running first, resulting in set_global_virq_handler() taking a new
reference for that domain and entering in the global_virq_handlers[]
array afterwards. The reference will never be dropped, thus the domain
will never be freed completely.

This can be fixed by checking the is_dying state of the domain inside
the region guarded by global_virq_handlers_lock. In case the domain is
dying, handle it as if the domain wouldn't exist, which will be the
case in near future anyway.

Fixes: 87521589aa6a ("xen: allow global VIRQ handlers to be delegated to other domains")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V6:
- new patch
---
 xen/common/event_channel.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index 8db2ca4ba2..f2b64c48fb 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -979,6 +979,7 @@ void send_global_virq(uint32_t virq)
 int set_global_virq_handler(struct domain *d, uint32_t virq)
 {
     struct domain *old;
+    int rc = 0;
 
     if (virq >= NR_VIRQS)
         return -EINVAL;
@@ -992,14 +993,23 @@ int set_global_virq_handler(struct domain *d, uint32_t virq)
         return -EINVAL;
 
     spin_lock(&global_virq_handlers_lock);
-    old = global_virq_handlers[virq];
-    global_virq_handlers[virq] = d;
+
+    if ( d->is_dying != DOMDYING_alive )
+    {
+        old = d;
+        rc = -EINVAL;
+    }
+    else
+    {
+        old = global_virq_handlers[virq];
+        global_virq_handlers[virq] = d;
+    }
     spin_unlock(&global_virq_handlers_lock);
 
     if (old != NULL)
         put_domain(old);
 
-    return 0;
+    return rc;
 }
 
 static void clear_global_virq_handlers(struct domain *d)
-- 
2.43.0


