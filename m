Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8234A0740D
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 12:00:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868106.1279660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVqGb-0003sC-3k; Thu, 09 Jan 2025 10:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868106.1279660; Thu, 09 Jan 2025 10:59:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVqGb-0003pf-0N; Thu, 09 Jan 2025 10:59:57 +0000
Received: by outflank-mailman (input) for mailman id 868106;
 Thu, 09 Jan 2025 10:59:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vJOs=UB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tVqGZ-0003VB-RH
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 10:59:55 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db40f77d-ce78-11ef-99a4-01e77a169b0f;
 Thu, 09 Jan 2025 11:59:54 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B25E421120;
 Thu,  9 Jan 2025 10:59:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6CBC0139AB;
 Thu,  9 Jan 2025 10:59:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id utUfGSisf2f1HAAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 09 Jan 2025 10:59:52 +0000
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
X-Inumbo-ID: db40f77d-ce78-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1736420393; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5p5IyWPyTuIHb0h9GGipzK1yvNuuVibrJGPX4pXZKbw=;
	b=I9+XVLcxWKDKEVbFvuUQaC2jw5P1eMsLfWhOp0Vcqa3DQhDstH5hi46Ef74WaZb16DS+9O
	qniAidnzA8fCrMxUlOXIBSUyHGiSudyJu80AklLxbmU8y+FJ3zUhqbK18Gygac8DiZduVF
	Qk0f1A3D0YpzKXYtk0WQSuNjyHfqQfY=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1736420392; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5p5IyWPyTuIHb0h9GGipzK1yvNuuVibrJGPX4pXZKbw=;
	b=CdBaX8ShhnWukCa8y3lc1dRQ7gtFe+hCJH32O4dORNRnuTN6+SkOX9sCLqR9S+HUXiPEI8
	Psl0LqkPcLvQfkTnIkuWRxkYw4gxgrfpvpn62NKwFo+u9sc6aMM8gwgHD4hm72w5sUKJG0
	+x9a1kR5sJb1VjDwI0faBCiWIMX5PIY=
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
Subject: [PATCH v7 2/7] xen/events: don't allow binding a global virq from any domain
Date: Thu,  9 Jan 2025 11:59:30 +0100
Message-ID: <20250109105935.23585-3-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250109105935.23585-1-jgross@suse.com>
References: <20250109105935.23585-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Today Xen will happily allow binding a global virq by a domain which
isn't configured to receive it. This won't result in any bad actions,
but the bind will appear to have succeeded with no event ever being
received by that event channel.

Instead of allowing the bind, error out if the domain isn't set to
handle that virq. Note that this check is inside the write_lock() on
purpose, as a future patch will put a related check into
set_global_virq_handler() with the addition of using the same lock.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V6:
- new patch
V7:
- move handling domain check inside locked region (Jan Beulich)
- style fix (Jan Beulich)
---
 xen/common/event_channel.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index 46281b16ce..cd6f5a1211 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -120,6 +120,13 @@ static uint8_t get_xen_consumer(xen_event_channel_notification_t fn)
 /* Get the notification function for a given Xen-bound event channel. */
 #define xen_notification_fn(e) (xen_consumers[(e)->xen_consumer-1])
 
+static struct domain *__read_mostly global_virq_handlers[NR_VIRQS];
+
+static struct domain *get_global_virq_handler(unsigned int virq)
+{
+    return global_virq_handlers[virq] ?: hardware_domain;
+}
+
 static bool virq_is_global(unsigned int virq)
 {
     switch ( virq )
@@ -469,6 +476,7 @@ int evtchn_bind_virq(evtchn_bind_virq_t *bind, evtchn_port_t port)
     struct domain *d = current->domain;
     int            virq = bind->virq, vcpu = bind->vcpu;
     int            rc = 0;
+    bool           is_global;
 
     if ( (virq < 0) || (virq >= ARRAY_SIZE(v->virq_to_evtchn)) )
         return -EINVAL;
@@ -478,8 +486,9 @@ int evtchn_bind_virq(evtchn_bind_virq_t *bind, evtchn_port_t port)
     * speculative execution.
     */
     virq = array_index_nospec(virq, ARRAY_SIZE(v->virq_to_evtchn));
+    is_global = virq_is_global(virq);
 
-    if ( virq_is_global(virq) && (vcpu != 0) )
+    if ( is_global && vcpu != 0 )
         return -EINVAL;
 
     if ( (v = domain_vcpu(d, vcpu)) == NULL )
@@ -487,6 +496,12 @@ int evtchn_bind_virq(evtchn_bind_virq_t *bind, evtchn_port_t port)
 
     write_lock(&d->event_lock);
 
+    if ( is_global && get_global_virq_handler(virq) != d )
+    {
+        rc = -EBUSY;
+        goto out;
+    }
+
     if ( read_atomic(&v->virq_to_evtchn[virq]) )
     {
         rc = -EEXIST;
@@ -965,15 +980,13 @@ void send_guest_pirq(struct domain *d, const struct pirq *pirq)
     }
 }
 
-static struct domain *global_virq_handlers[NR_VIRQS] __read_mostly;
-
 static DEFINE_SPINLOCK(global_virq_handlers_lock);
 
 void send_global_virq(uint32_t virq)
 {
     ASSERT(virq_is_global(virq));
 
-    send_guest_global_virq(global_virq_handlers[virq] ?: hardware_domain, virq);
+    send_guest_global_virq(get_global_virq_handler(virq), virq);
 }
 
 int set_global_virq_handler(struct domain *d, uint32_t virq)
-- 
2.43.0


