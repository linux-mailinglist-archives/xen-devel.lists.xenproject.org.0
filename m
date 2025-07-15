Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4919B05D9D
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 15:45:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044334.1414405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfyH-0005Is-4O; Tue, 15 Jul 2025 13:45:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044334.1414405; Tue, 15 Jul 2025 13:45:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfyG-0005Fq-Vu; Tue, 15 Jul 2025 13:45:24 +0000
Received: by outflank-mailman (input) for mailman id 1044334;
 Tue, 15 Jul 2025 13:45:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7giJ=Z4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ubfkA-00013q-Pj
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 13:30:50 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec4fa9b5-617f-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 15:30:50 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E34731F7C8;
 Tue, 15 Jul 2025 13:30:49 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B18BE13A68;
 Tue, 15 Jul 2025 13:30:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id jdP5KQlYdmihNwAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 15 Jul 2025 13:30:49 +0000
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
X-Inumbo-ID: ec4fa9b5-617f-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1752586249; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qDdBMgPeFsba0l0VzAB0puq0dCuMoWTPG49f+ImrdcA=;
	b=LmdRnlhEs6TXrS+snNhPQYHPcF+kgZ2u3X1P+LE40RH8d7w/IPWOzdynZX4LktCkzywV1s
	bVsnTLEgf3G9aDTBI7zFT4zmDMKS90Xhz41fVTCv0VxTuSjKzwseEdEyQ/yuQMTeXZJRdX
	Fwx5jZZeZWDTKYresiqaiqCzkipp5/8=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1752586249; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qDdBMgPeFsba0l0VzAB0puq0dCuMoWTPG49f+ImrdcA=;
	b=LmdRnlhEs6TXrS+snNhPQYHPcF+kgZ2u3X1P+LE40RH8d7w/IPWOzdynZX4LktCkzywV1s
	bVsnTLEgf3G9aDTBI7zFT4zmDMKS90Xhz41fVTCv0VxTuSjKzwseEdEyQ/yuQMTeXZJRdX
	Fwx5jZZeZWDTKYresiqaiqCzkipp5/8=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [MINI-OS PATCH v2 12/14] gnttab: add function to obtain memory address from grantref
Date: Tue, 15 Jul 2025 15:29:34 +0200
Message-ID: <20250715132936.2798-13-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250715132936.2798-1-jgross@suse.com>
References: <20250715132936.2798-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
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

Add a new function gnttab_get_addr() to obtain a memory pointer for a
given grant reference.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
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


