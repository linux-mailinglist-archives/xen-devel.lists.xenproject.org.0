Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCBEB1603E
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 14:23:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063877.1429624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh5qA-0005O4-O6; Wed, 30 Jul 2025 12:23:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063877.1429624; Wed, 30 Jul 2025 12:23:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh5qA-0005Kc-Jq; Wed, 30 Jul 2025 12:23:26 +0000
Received: by outflank-mailman (input) for mailman id 1063877;
 Wed, 30 Jul 2025 12:23:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=txka=2L=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uh5q9-0004Wg-Lt
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 12:23:25 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd68791f-6d3f-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 14:23:25 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DAA62219D1;
 Wed, 30 Jul 2025 12:23:24 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A48A71388B;
 Wed, 30 Jul 2025 12:23:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id zc6OJrwOimidJAAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 30 Jul 2025 12:23:24 +0000
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
X-Inumbo-ID: fd68791f-6d3f-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753878204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VLpe7KKQnXA6SKs55rwaL4IZ02NYf6XdE3j376Oj+TA=;
	b=D9RHVh1BTG29YB1ynPCigO2pZNIWqWnrktRaV9A6sT+ncGsDT22G9m5PmdNx0V6+85939B
	i8Cg5VL9HOasnCashQ787KFdcHoF7WjzMe5A9mS14b3Rlo+cLII7aLd6XRJRWGrwYQ3/5n
	9ZH8zUK/8w5j7PHswY2k2YoTIh345rw=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=D9RHVh1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753878204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VLpe7KKQnXA6SKs55rwaL4IZ02NYf6XdE3j376Oj+TA=;
	b=D9RHVh1BTG29YB1ynPCigO2pZNIWqWnrktRaV9A6sT+ncGsDT22G9m5PmdNx0V6+85939B
	i8Cg5VL9HOasnCashQ787KFdcHoF7WjzMe5A9mS14b3Rlo+cLII7aLd6XRJRWGrwYQ3/5n
	9ZH8zUK/8w5j7PHswY2k2YoTIh345rw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v3 3/9] libxengnttab: set the cloexec flag on Mini-OS
Date: Wed, 30 Jul 2025 14:22:59 +0200
Message-ID: <20250730122305.4050-4-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730122305.4050-1-jgross@suse.com>
References: <20250730122305.4050-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: DAA62219D1
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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
X-Spam-Score: -3.01

With Mini-OS now supporting the O_CLOEXEC flag for the kexec case,
set the related cloexec flag in minios.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
Acked-by: Anthony PERARD <anthony.perard@vates.tech>
---
 tools/libs/gnttab/minios.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/libs/gnttab/minios.c b/tools/libs/gnttab/minios.c
index cac89f0ba6..63bbdc7719 100644
--- a/tools/libs/gnttab/minios.c
+++ b/tools/libs/gnttab/minios.c
@@ -74,6 +74,7 @@ int osdep_gnttab_open(xengnttab_handle *xgt)
     }
 
     file->dev = gntmap;
+    file->cloexec = true;
     gntmap_init(gntmap);
     xgt->fd = fd;
     return 0;
-- 
2.43.0


