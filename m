Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 628CFA55055
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 17:13:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903875.1311813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqDqS-0007dC-Vx; Thu, 06 Mar 2025 16:13:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903875.1311813; Thu, 06 Mar 2025 16:13:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqDqS-0007as-SL; Thu, 06 Mar 2025 16:13:12 +0000
Received: by outflank-mailman (input) for mailman id 903875;
 Thu, 06 Mar 2025 16:13:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TCcn=VZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tqDqR-0007am-37
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 16:13:11 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4bc8390-faa5-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 17:13:08 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 29D5D211AD;
 Thu,  6 Mar 2025 16:13:08 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CDD5313676;
 Thu,  6 Mar 2025 16:13:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MnbSMJPJyWfSIwAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 06 Mar 2025 16:13:07 +0000
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
X-Inumbo-ID: e4bc8390-faa5-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1741277588; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=v5uko6E5cVIr+MsII93vIpFkDP7ZwwKMSiAwJqtLneU=;
	b=DfYWwFVXrQHRzmpXtrO8IHNhT5znD4eQPAg4gAx1ZOyJrO++r50/4DtZa6wvmwt0oMaw3R
	jAzlnwbp9nCE7muZm6Amg/tDeiO/FIYC4d9Cqs18E9Yju2r/HA2y543lqaJ3aWUCj7mjtp
	AgRt4rsv3D1ulXbTQHm886w51MYZNcM=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1741277588; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=v5uko6E5cVIr+MsII93vIpFkDP7ZwwKMSiAwJqtLneU=;
	b=DfYWwFVXrQHRzmpXtrO8IHNhT5znD4eQPAg4gAx1ZOyJrO++r50/4DtZa6wvmwt0oMaw3R
	jAzlnwbp9nCE7muZm6Amg/tDeiO/FIYC4d9Cqs18E9Yju2r/HA2y543lqaJ3aWUCj7mjtp
	AgRt4rsv3D1ulXbTQHm886w51MYZNcM=
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
Subject: [PATCH v2] xen/events: fix get_global_virq_handler() usage without hardware domain
Date: Thu,  6 Mar 2025 17:13:05 +0100
Message-ID: <20250306161305.10236-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
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

Some use cases of get_global_virq_handler() didn't account for the
case of running without hardware domain.

Fix that by testing get_global_virq_handler() returning NULL where
needed (e.g. when directly dereferencing the result).

Fixes: 980822c5edd1 ("xen/events: allow setting of global virq handler only for unbound virqs")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- fix use case of unlikely() (Jan Beulich)
- add test for NULL in unlock_dom_exc_handler() (Jan Beulich)
---
 xen/common/event_channel.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index 4ee6b6b4ce..c68aa97135 100644
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
+    if ( unlikely(!d) || unlikely(!get_domain(d)) )
         return NULL;
 
     read_lock(&d->event_lock);
@@ -1101,6 +1103,9 @@ struct domain *lock_dom_exc_handler(void)
 
 void unlock_dom_exc_handler(struct domain *d)
 {
+    if ( likely(!d) )
+        return;
+
     read_unlock(&d->event_lock);
 
     put_domain(d);
-- 
2.43.0


