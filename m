Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E76A6B76C
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 10:31:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.923593.1327092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvYin-00056P-M5; Fri, 21 Mar 2025 09:31:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 923593.1327092; Fri, 21 Mar 2025 09:31:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvYin-00054E-Gp; Fri, 21 Mar 2025 09:31:21 +0000
Received: by outflank-mailman (input) for mailman id 923593;
 Fri, 21 Mar 2025 09:31:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1wue=WI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tvYde-0005bg-No
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 09:26:02 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8108a1a8-0636-11f0-9ffa-bf95429c2676;
 Fri, 21 Mar 2025 10:26:01 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EAAA721D79;
 Fri, 21 Mar 2025 09:26:00 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C18DF139AA;
 Fri, 21 Mar 2025 09:26:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6dHYLagw3WdpGQAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 21 Mar 2025 09:26:00 +0000
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
X-Inumbo-ID: 8108a1a8-0636-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1742549161; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r/E0X4kSUTS2znnNR4n/sGL9TrcJRaZCvVETFzkF9nM=;
	b=B9L4X8b0LyO+EsipPNlntdT73kCehyLOksZWhkXn2oV7P0F+Ved1AuISyTTvnPNcGtyWjG
	8XlL+RXUSya0e5McIEbkE4PW3GrS5sJrP/asVGdHmreh428P0qqcwpiILMGhYRw6cSEf1u
	0+BBYX1DtoyacMRW0LuCzS0HBjP1ghg=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=PYWAJsv9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1742549160; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r/E0X4kSUTS2znnNR4n/sGL9TrcJRaZCvVETFzkF9nM=;
	b=PYWAJsv9HFIHul3JqVAaDZ1tmb5ZgFhgRrgUYP2DuA6/twlMt+En73LQytp0UgOGc6Mzxc
	LtT4+HIzyCyzFix3Ejf73UZ82Qj/Reu/G/fumaSqvhhEzQuTPXWkBk6rktYD9NWuKgkLRj
	UVfkiTgNh/NBiRdXICFFtp8hYFF+m74=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 12/12] kexec: do the final kexec step
Date: Fri, 21 Mar 2025 10:24:51 +0100
Message-ID: <20250321092451.17309-13-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321092451.17309-1-jgross@suse.com>
References: <20250321092451.17309-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EAAA721D79
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

With all kexec preparations done, activate the new kernel.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 kexec.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/kexec.c b/kexec.c
index 2db876e8..85b09959 100644
--- a/kexec.c
+++ b/kexec.c
@@ -169,6 +169,7 @@ int kexec(void *kernel, unsigned long kernel_size, const char *cmdline)
 {
     int ret;
     unsigned long *func;
+    void *kexec_page;
 
     ret = analyze_kernel(kernel, kernel_size);
     if ( ret )
@@ -192,6 +193,13 @@ int kexec(void *kernel, unsigned long kernel_size, const char *cmdline)
     if ( ret )
         goto err;
 
+    kexec_page = (void *)alloc_page();
+    if ( !kexec_page )
+    {
+        ret = ENOMEM;
+        goto err;
+    }
+
     for ( func = __kexec_array_start; func < __kexec_array_end; func++ )
     {
         ret = ((kexeccall_t)(*func))(false);
@@ -204,10 +212,15 @@ int kexec(void *kernel, unsigned long kernel_size, const char *cmdline)
         }
     }
 
-    /* Error exit. */
-    ret = ENOSYS;
+    /* Activate the new kernel. */
+    do_kexec(kexec_page);
+
+    /* do_kexec() shouldn't return, crash. */
+    BUG();
 
  err:
+    if ( kexec_page )
+        free_page(kexec_page);
     change_readonly(true);
     unreserve_memory_below();
     kexec_move_used_pages_undo();
-- 
2.43.0


