Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB44B01B6E
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 14:04:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040820.1412112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaCTb-0003vm-VN; Fri, 11 Jul 2025 12:03:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040820.1412112; Fri, 11 Jul 2025 12:03:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaCTb-0003ts-SJ; Fri, 11 Jul 2025 12:03:39 +0000
Received: by outflank-mailman (input) for mailman id 1040820;
 Fri, 11 Jul 2025 12:03:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s7n+=ZY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uaCTa-0003tM-9Z
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 12:03:38 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 139d6bf7-5e4f-11f0-a318-13f23c93f187;
 Fri, 11 Jul 2025 14:03:37 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F3B4E1F38C;
 Fri, 11 Jul 2025 12:03:35 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CB7AF1388B;
 Fri, 11 Jul 2025 12:03:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id D7dFMJf9cGiJIAAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 11 Jul 2025 12:03:35 +0000
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
X-Inumbo-ID: 139d6bf7-5e4f-11f0-a318-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1752235416; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=qnrnmP4GBV65UhqhO5BYhyi+ALFTJcryFgnMgTcHZS4=;
	b=EJi93OCV0bXb3JoYUvvXrPp3qf/iUNMMFkGJIIxwafu9KdsDbQUasmsojIJaSkeLNRxBhf
	9eYJe/Wz0qI51iAL0Vf+GQpu4QKNHRHjDE1E1cb+O/eaG7BJZhfhTqho/o90vH7mNPigsX
	RIMS0DUUJAxgfUQHkH54O0hoEWuuwsM=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=EJi93OCV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1752235416; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=qnrnmP4GBV65UhqhO5BYhyi+ALFTJcryFgnMgTcHZS4=;
	b=EJi93OCV0bXb3JoYUvvXrPp3qf/iUNMMFkGJIIxwafu9KdsDbQUasmsojIJaSkeLNRxBhf
	9eYJe/Wz0qI51iAL0Vf+GQpu4QKNHRHjDE1E1cb+O/eaG7BJZhfhTqho/o90vH7mNPigsX
	RIMS0DUUJAxgfUQHkH54O0hoEWuuwsM=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH] e820: fix e820_get_reserved_pfns() to reserve page aligned area
Date: Fri, 11 Jul 2025 14:03:33 +0200
Message-ID: <20250711120333.23745-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: F3B4E1F38C
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:dkim,suse.com:mid,suse.com:email];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Score: -3.01

e820_get_reserved_pfns() needs to make sure to reserve only page
aligned memory areas.

Fixes: a7d27a7332ba ("mini-os: add memory map service functions")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 e820.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/e820.c b/e820.c
index d8cfb1f4..1ffeaf00 100644
--- a/e820.c
+++ b/e820.c
@@ -365,7 +365,7 @@ unsigned long e820_get_reserved_pfns(int pages)
     unsigned long last = 0, needed = (long)pages << PAGE_SHIFT;
 
     for ( i = 0; i < e820_entries && e820_map[i].addr < last + needed; i++ )
-        last = e820_map[i].addr + e820_map[i].size;
+        last = round_pgup(e820_map[i].addr + e820_map[i].size);
 
     if ( i == 0 || e820_map[i - 1].type != E820_TYPE_SOFT_RESERVED )
         e820_insert_entry_at(i, last, needed, E820_TYPE_SOFT_RESERVED);
-- 
2.43.0


