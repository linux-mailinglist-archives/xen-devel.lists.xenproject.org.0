Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5916B14CA6
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 13:02:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062440.1428138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugi5y-0002v1-JW; Tue, 29 Jul 2025 11:02:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062440.1428138; Tue, 29 Jul 2025 11:02:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugi5y-0002tL-Fa; Tue, 29 Jul 2025 11:02:10 +0000
Received: by outflank-mailman (input) for mailman id 1062440;
 Tue, 29 Jul 2025 11:02:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TZvG=2K=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ugi5w-0002qP-Kz
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 11:02:08 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 773fee08-6c6b-11f0-b895-0df219b8e170;
 Tue, 29 Jul 2025 13:02:06 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4F8E01F750;
 Tue, 29 Jul 2025 11:02:06 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1687B13876;
 Tue, 29 Jul 2025 11:02:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GcjDAy6qiGjLbQAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 29 Jul 2025 11:02:06 +0000
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
X-Inumbo-ID: 773fee08-6c6b-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753786926; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ph5big/v5zUZ2o0iDNXrUeGzyCUtwGM3on0hSShHDs=;
	b=ZBhvbNHxvROgbwNRUC7JjMxo1RkTyGRMjrBWL60CLcEEimYOwR0yxJT8Nl8vFzS8hob0Ru
	viqLBouy22xs1LeppAY9k3pDusgCcYAzuFATXoSxolqNMYZcwcvVPifmAjhKFLKMUPBL9c
	AZ8niwq/5ByHXyxEDjV2X/SkUATqFsA=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=ZBhvbNHx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753786926; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ph5big/v5zUZ2o0iDNXrUeGzyCUtwGM3on0hSShHDs=;
	b=ZBhvbNHxvROgbwNRUC7JjMxo1RkTyGRMjrBWL60CLcEEimYOwR0yxJT8Nl8vFzS8hob0Ru
	viqLBouy22xs1LeppAY9k3pDusgCcYAzuFATXoSxolqNMYZcwcvVPifmAjhKFLKMUPBL9c
	AZ8niwq/5ByHXyxEDjV2X/SkUATqFsA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v2 3/9] libxengnttab: set the cloexec flag on Mini-OS
Date: Tue, 29 Jul 2025 13:01:39 +0200
Message-ID: <20250729110146.10580-4-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250729110146.10580-1-jgross@suse.com>
References: <20250729110146.10580-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:mid,suse.com:dkim,suse.com:email];
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
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 4F8E01F750
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

With Mini-OS now supporting the O_CLOEXEC flag for the kexec case,
set the related cloexec flag in minios.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
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


