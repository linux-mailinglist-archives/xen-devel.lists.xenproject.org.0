Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E55A0740A
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 12:00:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868104.1279649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVqGU-0003XL-QV; Thu, 09 Jan 2025 10:59:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868104.1279649; Thu, 09 Jan 2025 10:59:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVqGU-0003Vd-Nh; Thu, 09 Jan 2025 10:59:50 +0000
Received: by outflank-mailman (input) for mailman id 868104;
 Thu, 09 Jan 2025 10:59:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vJOs=UB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tVqGT-0003VB-77
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 10:59:49 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7260af7-ce78-11ef-99a4-01e77a169b0f;
 Thu, 09 Jan 2025 11:59:47 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 089C51F385;
 Thu,  9 Jan 2025 10:59:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A9BC6139AB;
 Thu,  9 Jan 2025 10:59:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Uoi3JyKsf2fpHAAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 09 Jan 2025 10:59:46 +0000
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
X-Inumbo-ID: d7260af7-ce78-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1736420387; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6yHKHkyNV7SkbCgUGT5IGKtS0fWOirj5mabK6I1iS1M=;
	b=tIkuLkoZ1RsqofILUwpYenfPKoxWVFiQ3sVLieZq5lLcrGTFUEi2fEPCnFHUHd0Z/UsUmx
	HUUcJ2/fKa/59D/0it4SAUrpNI99Utq+8gL9tJNeorLMB2lMU5zL9CCTaTqltAyQteO69r
	wCv8BsNBiQdc4udRCV+II17k/Wd2+T0=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1736420387; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6yHKHkyNV7SkbCgUGT5IGKtS0fWOirj5mabK6I1iS1M=;
	b=tIkuLkoZ1RsqofILUwpYenfPKoxWVFiQ3sVLieZq5lLcrGTFUEi2fEPCnFHUHd0Z/UsUmx
	HUUcJ2/fKa/59D/0it4SAUrpNI99Utq+8gL9tJNeorLMB2lMU5zL9CCTaTqltAyQteO69r
	wCv8BsNBiQdc4udRCV+II17k/Wd2+T0=
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
Subject: [PATCH v7 1/7] xen/events: fix race with set_global_virq_handler()
Date: Thu,  9 Jan 2025 11:59:29 +0100
Message-ID: <20250109105935.23585-2-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250109105935.23585-1-jgross@suse.com>
References: <20250109105935.23585-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
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
V7:
- add comment (Jan Beulich)
---
 xen/common/event_channel.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index 8db2ca4ba2..46281b16ce 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -979,6 +979,7 @@ void send_global_virq(uint32_t virq)
 int set_global_virq_handler(struct domain *d, uint32_t virq)
 {
     struct domain *old;
+    int rc = 0;
 
     if (virq >= NR_VIRQS)
         return -EINVAL;
@@ -992,14 +993,32 @@ int set_global_virq_handler(struct domain *d, uint32_t virq)
         return -EINVAL;
 
     spin_lock(&global_virq_handlers_lock);
-    old = global_virq_handlers[virq];
-    global_virq_handlers[virq] = d;
+
+    /*
+     * Note that this check won't guarantee that a domain just going down can't
+     * be set as the handling domain of a virq, as the is_dying indicator might
+     * change just after testing it.
+     * This isn't going to be a major problem, as clear_global_virq_handlers()
+     * is guaranteed to run afterwards and it will reset the handling domain
+     * for the virq to the hardware domain.
+     */
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
+
     spin_unlock(&global_virq_handlers_lock);
 
     if (old != NULL)
         put_domain(old);
 
-    return 0;
+    return rc;
 }
 
 static void clear_global_virq_handlers(struct domain *d)
-- 
2.43.0


