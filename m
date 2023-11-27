Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3407F9DAD
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 11:37:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641822.1000764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7YzY-0005if-2U; Mon, 27 Nov 2023 10:37:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641822.1000764; Mon, 27 Nov 2023 10:37:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7YzX-0005ff-VO; Mon, 27 Nov 2023 10:37:27 +0000
Received: by outflank-mailman (input) for mailman id 641822;
 Mon, 27 Nov 2023 10:37:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gVlU=HI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r7Yoj-0000Co-Hl
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 10:26:17 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 651adca2-8d0f-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 11:26:15 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5714D21B08;
 Mon, 27 Nov 2023 10:26:15 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 2D7B1132A6;
 Mon, 27 Nov 2023 10:26:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id ARfVCcduZGW1fgAAn2gu4w
 (envelope-from <jgross@suse.com>); Mon, 27 Nov 2023 10:26:15 +0000
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
X-Inumbo-ID: 651adca2-8d0f-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1701080775; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0DRQp+amWyFgc15qgsA7zVmZocwANgk7w1gaKIUS3eY=;
	b=d5MvaSh4q9nCVYwqr++Wx8UgiX7f6CC2PE4OGZgo2LW/fPYdtLx5j5wncG7/YYT87kEQJT
	tePy0SXfyF8EECUPGw5FYhM/bztxtBYwxGtGUMZ9idU+BlEbfXYj15Cvb1GAqgQbzZTLa4
	poPn5xzk9p54DzwuLPREzUi7oqaDYos=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 09/32] Mini-OS: add EXPORT_SYMBOL() instances to lib/math.c
Date: Mon, 27 Nov 2023 11:25:00 +0100
Message-Id: <20231127102523.28003-10-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231127102523.28003-1-jgross@suse.com>
References: <20231127102523.28003-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: ***********
X-Spam-Score: 11.43
X-Spamd-Result: default: False [11.43 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_SPAM(0.03)[52.25%];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_SPAM_SHORT(3.00)[1.000];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_SPAM_LONG(3.50)[1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

Add the needed instances of EXPORT_SYMBOL() to lib/math.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
---
 lib/math.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/math.c b/lib/math.c
index b98cc1d2..9ee9fcdb 100644
--- a/lib/math.c
+++ b/lib/math.c
@@ -338,6 +338,7 @@ __qdivrem(u_quad_t uq, u_quad_t vq, u_quad_t *arq)
 	tmp.ul[L] = COMBINE(qspace[3], qspace[4]);
 	return (tmp.q);
 }
+EXPORT_SYMBOL(__qdivrem);
 
 /*
  * From
@@ -365,6 +366,7 @@ __divdi3(quad_t a, quad_t b)
 	uq = __qdivrem(ua, ub, (u_quad_t *)0);
 	return (neg ? -uq : uq);
 }
+EXPORT_SYMBOL(__divdi3);
 
 /*
  * From
@@ -379,6 +381,7 @@ __udivdi3(u_quad_t a, u_quad_t b)
 {
 	return (__qdivrem(a, b, (u_quad_t *)0));
 }
+EXPORT_SYMBOL(__udivdi3);
 
 /*
  * From
@@ -396,6 +399,7 @@ __umoddi3(u_quad_t a, u_quad_t b)
 	(void)__qdivrem(a, b, &r);
 	return (r);
 }
+EXPORT_SYMBOL(__umoddi3);
 
 /*
  * Returns the quotient and places remainder in r
@@ -405,6 +409,7 @@ __udivmoddi4(u_quad_t a, u_quad_t b, u_quad_t *r)
 {
 	return __qdivrem(a, b, r);
 }
+EXPORT_SYMBOL(__udivmoddi4);
 
 /*
  * From
@@ -434,3 +439,4 @@ __moddi3(quad_t a, quad_t b)
 	(void)__qdivrem(ua, ub, &ur);
 	return (neg ? -ur : ur);
 }
+EXPORT_SYMBOL(__moddi3);
-- 
2.35.3


