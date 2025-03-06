Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83199A54FB4
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 16:54:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903822.1311762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqDYL-0002IM-JO; Thu, 06 Mar 2025 15:54:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903822.1311762; Thu, 06 Mar 2025 15:54:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqDYL-0002Fa-GC; Thu, 06 Mar 2025 15:54:29 +0000
Received: by outflank-mailman (input) for mailman id 903822;
 Thu, 06 Mar 2025 15:54:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TCcn=VZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tqDYJ-0002FS-Ek
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 15:54:27 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47d7be84-faa3-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 16:54:26 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F1ADE1F449;
 Thu,  6 Mar 2025 15:54:25 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A8D7F13A61;
 Thu,  6 Mar 2025 15:54:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id TOW5JzHFyWfOHQAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 06 Mar 2025 15:54:25 +0000
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
X-Inumbo-ID: 47d7be84-faa3-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1741276466; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=mTaHPsRRZCOiGdkTNUlAF5ltZ53FofM6pZK2QJOi+YU=;
	b=f4SxGwdT4C0Wak8bjlu6y2+L4icbFlf9HjErbrhPytL5o5xUjOhfFaRgP4gnGJCAARM+nq
	oSDFtp0JDlD+oM8xmbA+5xGMXKfDVhYESJN7YS4RJjmuzcpZ9Umf3tXZJ9z3hZQjl8zUDL
	Cmtf31WBcG2LXvoQSsTcxxGemofulXQ=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1741276465; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=mTaHPsRRZCOiGdkTNUlAF5ltZ53FofM6pZK2QJOi+YU=;
	b=lknokf5AOD2/EnJ/h9cVNMLaHtyXttCECPwLOhG0shrjICDeciJQDRUfMfmBBk49QNFP2V
	ukEXyq+q6ssrsFP+bCxJpOyAnWLKDXJDwKK+LMlN1C4eyhkpl2I5gZwt6ISfLRu6NvMAOn
	mhbrTB0ODQHjGdm0OYCNrBGweO0Ilys=
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
Subject: [PATCH] xen/events: fix get_global_virq_handler() usage without hardware domain
Date: Thu,  6 Mar 2025 16:54:23 +0100
Message-ID: <20250306155423.3168-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Some use cases of get_global_virq_handler() didn't account for the
case of running without hardware domain.

Fix that by testing get_global_virq_handler() returning NULL where
needed (e.g. when directly dereferencing the result).

Fixes: 980822c5edd1 ("xen/events: allow setting of global virq handler only for unbound virqs")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/event_channel.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index 4ee6b6b4ce..fa83d9dd1a 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -1036,7 +1036,9 @@ int set_global_virq_handler(struct domain *d, uint32_t virq)
     {
         old = global_virq_handlers[virq];
         hdl = get_global_virq_handler(virq);
-        if ( hdl != d )
+        if ( !hdl )
+            global_virq_handlers[virq] = d;
+        else if ( hdl != d )
         {
             read_lock(&hdl->event_lock);
 
@@ -1091,7 +1093,7 @@ struct domain *lock_dom_exc_handler(void)
     struct domain *d;
 
     d = get_global_virq_handler(VIRQ_DOM_EXC);
-    if ( unlikely(!get_domain(d)) )
+    if ( unlikely(!d || !get_domain(d)) )
         return NULL;
 
     read_lock(&d->event_lock);
-- 
2.43.0


