Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC7DB05C52
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 15:30:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044119.1414255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfjN-0001ou-SP; Tue, 15 Jul 2025 13:30:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044119.1414255; Tue, 15 Jul 2025 13:30:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfjN-0001m3-JI; Tue, 15 Jul 2025 13:30:01 +0000
Received: by outflank-mailman (input) for mailman id 1044119;
 Tue, 15 Jul 2025 13:30:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7giJ=Z4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ubfjM-00013q-2m
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 13:30:00 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce14d656-617f-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 15:29:59 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 541731F452;
 Tue, 15 Jul 2025 13:29:59 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2440F13A68;
 Tue, 15 Jul 2025 13:29:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 12lqB9dXdmgeNwAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 15 Jul 2025 13:29:59 +0000
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
X-Inumbo-ID: ce14d656-617f-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1752586199; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x9TLANKlez8tsN2wKkkD1NspuAsBv9mWQ6EyKJDqy7M=;
	b=P0Sr58IXZDYS9lagLZeK0j4k2WZ6T7TS2CPWKg3jSegJIvVCC8/7dUfYFQLxZHjfRNG+iA
	n6e46D69/yao2bnupS46sHIYTGfX5iVtPrYjeDeczlHvE/bMTyz6ULSEQNU/qgH4WGjkun
	bx5UURBrtwE5Pa5B8ujRWLUp1yHaayU=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1752586199; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x9TLANKlez8tsN2wKkkD1NspuAsBv9mWQ6EyKJDqy7M=;
	b=P0Sr58IXZDYS9lagLZeK0j4k2WZ6T7TS2CPWKg3jSegJIvVCC8/7dUfYFQLxZHjfRNG+iA
	n6e46D69/yao2bnupS46sHIYTGfX5iVtPrYjeDeczlHvE/bMTyz6ULSEQNU/qgH4WGjkun
	bx5UURBrtwE5Pa5B8ujRWLUp1yHaayU=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [MINI-OS PATCH v2 03/14] e820: don't count lapic page as initially reserved
Date: Tue, 15 Jul 2025 15:29:25 +0200
Message-ID: <20250715132936.2798-4-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250715132936.2798-1-jgross@suse.com>
References: <20250715132936.2798-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.com:mid];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

The number of pages marked initially as reserved in the memory map
are counted to be allocated, as they are normally populated by Xen
tools for e.g. xenbus and console ring pages.

This is wrong in case the lapic page is marked as reserved in the
memory map, as there is never memory allocated for a lapic.

So when finding the lapic page to be marked as reserved, don't add
it to the number of reserved pages.

Fixes: 9b87429d2864 ("mini-os: fix number of pages for PVH")
Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 e820.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/e820.c b/e820.c
index 16622e23..44cfac05 100644
--- a/e820.c
+++ b/e820.c
@@ -275,7 +275,10 @@ static void e820_sanitize(void)
             e820_initial_reserved_pfns += e820_map[i].size / PAGE_SIZE;
             if ( e820_map[i].addr <= LAPIC_ADDRESS &&
                  e820_map[i].addr + e820_map[i].size > LAPIC_ADDRESS )
+            {
                 found_lapic = true;
+                e820_initial_reserved_pfns--;
+            }
         }
     }
 
-- 
2.43.0


