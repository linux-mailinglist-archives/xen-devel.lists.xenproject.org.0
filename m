Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE491ADAB1D
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 10:51:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016939.1393930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR5YA-0003sF-Eq; Mon, 16 Jun 2025 08:50:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016939.1393930; Mon, 16 Jun 2025 08:50:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR5YA-0003qb-AO; Mon, 16 Jun 2025 08:50:42 +0000
Received: by outflank-mailman (input) for mailman id 1016939;
 Mon, 16 Jun 2025 08:50:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GKzt=Y7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uR5Ut-0007jR-Ts
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 08:47:19 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8307937a-4a8e-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 10:47:19 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B273A1F38F;
 Mon, 16 Jun 2025 08:47:17 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 80FDD139E2;
 Mon, 16 Jun 2025 08:47:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sunAHRXaT2g6QAAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 16 Jun 2025 08:47:17 +0000
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
X-Inumbo-ID: 8307937a-4a8e-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750063639; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9oEFTpU9aU3slJF04hBQYd4aVGaCv7knMZrTTup/bd0=;
	b=sheYdGj3pN/vC/Rmbq1lGWAmA2IZKgGLUu21+LihgsnyaOqBqkqlcef+YPpQOyq9qBTq7L
	NrPP5vKsYlPjyqVBpOYgFHhD2Up59/C+xiOJuB+8KsrQVU82c6aoS6iKL+MssAIV3z9uty
	iyautI2uJP/Yk0cXjsJbJSspA9XiWsw=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=oY+0NaNR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750063637; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9oEFTpU9aU3slJF04hBQYd4aVGaCv7knMZrTTup/bd0=;
	b=oY+0NaNR88YKEezyZT76ajQXIDV6E/w9gQmjqDAGaSEp+OI27LwPkMzRPFnCt2NOmklteT
	LNdGLs2sHtlW2IduhOupmr47jHWggPSzL1iN0NOYKkuFQXzU7euxBNVgUa35m9b63vV3cx
	Qp3e2ZqoEmOBFzN0sH79WGnM9zETq3s=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [MINI-OS PATCH v2 10/12] Mini-OS: kexec: switch read-only area to be writable again
Date: Mon, 16 Jun 2025 10:46:17 +0200
Message-ID: <20250616084619.11112-11-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250616084619.11112-1-jgross@suse.com>
References: <20250616084619.11112-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: B273A1F38F
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,amd.com:email,suse.com:mid,suse.com:dkim,suse.com:email]
X-Spam-Score: -3.01
X-Spam-Level: 

In order to allow writing the new kernel, make the readonly area
covering current kernel text writable again.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
V2:
- modify printk() statement (Jason Andryuk)
---
 arch/x86/mm.c | 3 ++-
 kexec.c       | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/x86/mm.c b/arch/x86/mm.c
index f4419d95..26ede6f4 100644
--- a/arch/x86/mm.c
+++ b/arch/x86/mm.c
@@ -529,7 +529,8 @@ void change_readonly(bool readonly)
 #endif
     }
 
-    printk("setting %p-%p readonly\n", &_text, &_erodata);
+    printk("setting %p-%p %s\n", &_text, &_erodata,
+           readonly ? "readonly" : "writable");
     walk_pt(start_address, ro.etext, change_readonly_func, &ro);
 
 #ifdef CONFIG_PARAVIRT
diff --git a/kexec.c b/kexec.c
index 3b11a69c..1ef7ce84 100644
--- a/kexec.c
+++ b/kexec.c
@@ -183,6 +183,8 @@ int kexec(void *kernel, unsigned long kernel_size, const char *cmdline)
         goto err;
     }
 
+    change_readonly(false);
+
     ret = kexec_move_used_pages(kexec_last_addr, (unsigned long)kernel,
                                 kernel_size);
     if ( ret )
@@ -192,6 +194,7 @@ int kexec(void *kernel, unsigned long kernel_size, const char *cmdline)
     ret = ENOSYS;
 
  err:
+    change_readonly(true);
     unreserve_memory_below();
     kexec_move_used_pages_undo();
     kexec_get_entry_undo();
-- 
2.43.0


