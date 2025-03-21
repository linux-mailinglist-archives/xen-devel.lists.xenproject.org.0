Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA5AA6B761
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 10:30:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.923513.1327051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvYi6-0002Ob-Ej; Fri, 21 Mar 2025 09:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 923513.1327051; Fri, 21 Mar 2025 09:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvYi6-0002Jg-9Y; Fri, 21 Mar 2025 09:30:38 +0000
Received: by outflank-mailman (input) for mailman id 923513;
 Fri, 21 Mar 2025 09:30:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1wue=WI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tvYdU-0005bg-It
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 09:25:52 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a6d88b2-0636-11f0-9ffa-bf95429c2676;
 Fri, 21 Mar 2025 10:25:50 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CEBA621B2C;
 Fri, 21 Mar 2025 09:25:49 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A30A0139AA;
 Fri, 21 Mar 2025 09:25:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MTRaJp0w3WdYGQAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 21 Mar 2025 09:25:49 +0000
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
X-Inumbo-ID: 7a6d88b2-0636-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1742549149; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jRl2WQrPM47yD+AI8wwwhvNT+l4iLc6RLY7/18FmBWM=;
	b=g7ldaqdNgS8V2/ZT0oYPT4jSVMYntY2X/qr2JYWIKjeT7roT8nKxrA2oNV9ir6E5pGIZLU
	66flxxbSsyJyQVnvRVUnUqIEAmy2e9IjziIE1ah77FuCrQAz9mp9eoA8AWU85618gIMGcy
	UcvWtvZTTde+MaQ/GGsBfrFg+DKDB5E=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=g7ldaqdN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1742549149; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jRl2WQrPM47yD+AI8wwwhvNT+l4iLc6RLY7/18FmBWM=;
	b=g7ldaqdNgS8V2/ZT0oYPT4jSVMYntY2X/qr2JYWIKjeT7roT8nKxrA2oNV9ir6E5pGIZLU
	66flxxbSsyJyQVnvRVUnUqIEAmy2e9IjziIE1ah77FuCrQAz9mp9eoA8AWU85618gIMGcy
	UcvWtvZTTde+MaQ/GGsBfrFg+DKDB5E=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 10/12] kexec: switch read-only area to be writable again
Date: Fri, 21 Mar 2025 10:24:49 +0100
Message-ID: <20250321092451.17309-11-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321092451.17309-1-jgross@suse.com>
References: <20250321092451.17309-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: CEBA621B2C
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

In order to allow writing the new kernel, make the readonly area
covering current kernel text writable again.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 kexec.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kexec.c b/kexec.c
index 16a0030a..2992f58f 100644
--- a/kexec.c
+++ b/kexec.c
@@ -184,6 +184,8 @@ int kexec(void *kernel, unsigned long kernel_size, const char *cmdline)
         goto err;
     }
 
+    change_readonly(false);
+
     ret = kexec_move_used_pages(kexec_last_addr, (unsigned long)kernel,
                                 kernel_size);
     if ( ret )
@@ -193,6 +195,7 @@ int kexec(void *kernel, unsigned long kernel_size, const char *cmdline)
     ret = ENOSYS;
 
  err:
+    change_readonly(true);
     unreserve_memory_below();
     kexec_move_used_pages_undo();
     kexec_get_entry_undo();
-- 
2.43.0


