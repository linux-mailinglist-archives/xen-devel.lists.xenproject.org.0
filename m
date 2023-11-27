Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5697F9DB5
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 11:38:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641836.1000782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Z0F-0006kV-It; Mon, 27 Nov 2023 10:38:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641836.1000782; Mon, 27 Nov 2023 10:38:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Z0F-0006hl-Fb; Mon, 27 Nov 2023 10:38:11 +0000
Received: by outflank-mailman (input) for mailman id 641836;
 Mon, 27 Nov 2023 10:38:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gVlU=HI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r7YpX-0000Co-8A
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 10:27:07 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82c2956e-8d0f-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 11:27:05 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1360D21B08;
 Mon, 27 Nov 2023 10:27:05 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id DDA65132A6;
 Mon, 27 Nov 2023 10:27:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id wEHaNPhuZGX0fgAAn2gu4w
 (envelope-from <jgross@suse.com>); Mon, 27 Nov 2023 10:27:04 +0000
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
X-Inumbo-ID: 82c2956e-8d0f-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1701080825; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=90LIXqRuYEhUqlUUdjvXyDMioMTVUvaIxj4Mp4Wj2kc=;
	b=QV5+kCYudc661PKbdtL8tjQn+f8YBhkFTsFP1xfGGZQz87GjDG8z2zpgl/KK4gdFqN/CKG
	6U/wC9bgs3tkGWa7QTQFLG+4NMrSkW1OuCw3xFyhBZVRAZg2SUdPUwVV5J8tcjqVXG7iLb
	fwO9QO0EqIgZlYCgBdS/L0CDtM9U8zc=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 18/32] Mini-OS: add EXPORT_SYMBOL() instances to gnttab.c
Date: Mon, 27 Nov 2023 11:25:09 +0100
Message-Id: <20231127102523.28003-19-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231127102523.28003-1-jgross@suse.com>
References: <20231127102523.28003-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: ****************
X-Spam-Score: 16.27
X-Spamd-Result: default: False [16.27 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_SPAM(4.87)[99.42%];
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

Add the needed instances of EXPORT_SYMBOL() to gnttab.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
---
 gnttab.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/gnttab.c b/gnttab.c
index 6978a9bc..8168ed5d 100644
--- a/gnttab.c
+++ b/gnttab.c
@@ -80,6 +80,7 @@ gnttab_grant_access(domid_t domid, unsigned long frame, int readonly)
 
     return ref;
 }
+EXPORT_SYMBOL(gnttab_grant_access);
 
 grant_ref_t
 gnttab_grant_transfer(domid_t domid, unsigned long pfn)
@@ -94,6 +95,7 @@ gnttab_grant_transfer(domid_t domid, unsigned long pfn)
 
     return ref;
 }
+EXPORT_SYMBOL(gnttab_grant_transfer);
 
 int
 gnttab_end_access(grant_ref_t ref)
@@ -114,6 +116,7 @@ gnttab_end_access(grant_ref_t ref)
     put_free_entry(ref);
     return 1;
 }
+EXPORT_SYMBOL(gnttab_end_access);
 
 unsigned long
 gnttab_end_transfer(grant_ref_t ref)
@@ -144,6 +147,7 @@ gnttab_end_transfer(grant_ref_t ref)
 
     return frame;
 }
+EXPORT_SYMBOL(gnttab_end_transfer);
 
 grant_ref_t
 gnttab_alloc_and_grant(void **map)
@@ -156,6 +160,7 @@ gnttab_alloc_and_grant(void **map)
     gref = gnttab_grant_access(0, mfn, 0);
     return gref;
 }
+EXPORT_SYMBOL(gnttab_alloc_and_grant);
 
 static const char * const gnttabop_error_msgs[] = GNTTABOP_error_msgs;
 
@@ -168,6 +173,7 @@ gnttabop_error(int16_t status)
     else
         return gnttabop_error_msgs[status];
 }
+EXPORT_SYMBOL(gnttabop_error);
 
 void
 init_gnttab(void)
-- 
2.35.3


