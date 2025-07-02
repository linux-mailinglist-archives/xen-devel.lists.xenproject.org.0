Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B10AF0DB0
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 10:20:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030430.1404090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWshs-00045C-6K; Wed, 02 Jul 2025 08:20:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030430.1404090; Wed, 02 Jul 2025 08:20:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWshs-00042i-2H; Wed, 02 Jul 2025 08:20:40 +0000
Received: by outflank-mailman (input) for mailman id 1030430;
 Wed, 02 Jul 2025 08:20:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFiP=ZP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uWsby-00082X-Ot
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 08:14:34 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9574905e-571c-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 10:14:33 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7ED902117F;
 Wed,  2 Jul 2025 08:14:32 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5243213A24;
 Wed,  2 Jul 2025 08:14:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CtF3EmjqZGh/SQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 02 Jul 2025 08:14:32 +0000
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
X-Inumbo-ID: 9574905e-571c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751444072; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=54mI4K8Jcav8/UHRZBznVBm2r964lgKK2S2ajy90lfI=;
	b=fQ91/Tq1HHqJAZXlitD6NTxWGKPPuAPEEk9yW0rDf+nuEHweE0EAuAGuC2V8HRZf5WAWV5
	M/xczjTIe2iIXLlinC61i/f0wPUGimKtMh1+pL9vglLC81m712y4AJmAA2HDolJufqlyuL
	MYs/6LkebIWR+huYNvzaP6iVw1m+yJM=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="fQ91/Tq1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751444072; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=54mI4K8Jcav8/UHRZBznVBm2r964lgKK2S2ajy90lfI=;
	b=fQ91/Tq1HHqJAZXlitD6NTxWGKPPuAPEEk9yW0rDf+nuEHweE0EAuAGuC2V8HRZf5WAWV5
	M/xczjTIe2iIXLlinC61i/f0wPUGimKtMh1+pL9vglLC81m712y4AJmAA2HDolJufqlyuL
	MYs/6LkebIWR+huYNvzaP6iVw1m+yJM=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 17/19] gnttab: add function to obtain memory address from grantref
Date: Wed,  2 Jul 2025 10:12:52 +0200
Message-ID: <20250702081254.14383-18-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702081254.14383-1-jgross@suse.com>
References: <20250702081254.14383-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 7ED902117F
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01

Add a new function gnttab_get_addr() to obtain a memory pointer for a
given grant reference.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 gnttab.c         | 10 ++++++++++
 include/gnttab.h |  1 +
 2 files changed, 11 insertions(+)

diff --git a/gnttab.c b/gnttab.c
index 6bac0905..52d6792a 100644
--- a/gnttab.c
+++ b/gnttab.c
@@ -149,6 +149,16 @@ gnttab_end_transfer(grant_ref_t ref)
 }
 EXPORT_SYMBOL(gnttab_end_transfer);
 
+void *gnttab_get_addr(grant_ref_t ref)
+{
+    BUG_ON(ref >= NR_GRANT_ENTRIES || ref < NR_RESERVED_ENTRIES);
+
+    if ( !gnttab_table[ref].flags )
+        return NULL;
+
+    return mfn_to_virt(gnttab_table[ref].frame);
+}
+
 static const char * const gnttabop_error_msgs[] = GNTTABOP_error_msgs;
 
 const char *
diff --git a/include/gnttab.h b/include/gnttab.h
index 108c4425..46e72a36 100644
--- a/include/gnttab.h
+++ b/include/gnttab.h
@@ -9,6 +9,7 @@ grant_ref_t gnttab_grant_access(domid_t domid, unsigned long frame,
 grant_ref_t gnttab_grant_transfer(domid_t domid, unsigned long pfn);
 unsigned long gnttab_end_transfer(grant_ref_t gref);
 int gnttab_end_access(grant_ref_t ref);
+void *gnttab_get_addr(grant_ref_t ref);
 const char *gnttabop_error(int16_t status);
 void fini_gnttab(void);
 void suspend_gnttab(void);
-- 
2.43.0


