Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8218B14CA2
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 13:02:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062437.1428128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugi5r-0002X5-CS; Tue, 29 Jul 2025 11:02:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062437.1428128; Tue, 29 Jul 2025 11:02:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugi5r-0002Uj-9b; Tue, 29 Jul 2025 11:02:03 +0000
Received: by outflank-mailman (input) for mailman id 1062437;
 Tue, 29 Jul 2025 11:02:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TZvG=2K=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ugi5p-0001sN-Ny
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 11:02:01 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73eed49e-6c6b-11f0-a31e-13f23c93f187;
 Tue, 29 Jul 2025 13:02:01 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9E6381F750;
 Tue, 29 Jul 2025 11:02:00 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7369613876;
 Tue, 29 Jul 2025 11:02:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 58G7GiiqiGjDbQAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 29 Jul 2025 11:02:00 +0000
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
X-Inumbo-ID: 73eed49e-6c6b-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753786920; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qAIGrxx2nEOfVbbdi00mX1QNy/nUomoCEuUw7xe2Xek=;
	b=saCfDmzMFjE5nmlIO5iWvxu7fn14+rC0BGwC8Xe0cdgcziigQIUoQ/R74etVCX/PK5NUen
	ETa6YD75Heu6p+L17TLJz10SGOzovXz3+srHI19QbJhxMSWwtBqeLEVQaT4sY+EI030b8v
	8mMtIlOsX9mG4/DLFQBfIEXL+9X/mgU=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753786920; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qAIGrxx2nEOfVbbdi00mX1QNy/nUomoCEuUw7xe2Xek=;
	b=saCfDmzMFjE5nmlIO5iWvxu7fn14+rC0BGwC8Xe0cdgcziigQIUoQ/R74etVCX/PK5NUen
	ETa6YD75Heu6p+L17TLJz10SGOzovXz3+srHI19QbJhxMSWwtBqeLEVQaT4sY+EI030b8v
	8mMtIlOsX9mG4/DLFQBfIEXL+9X/mgU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v2 2/9] libevtchn: add O_CLOEXEC support for Mini-OS
Date: Tue, 29 Jul 2025 13:01:38 +0200
Message-ID: <20250729110146.10580-3-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250729110146.10580-1-jgross@suse.com>
References: <20250729110146.10580-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:mid,suse.com:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

With Mini-OS now supporting O_CLOEXEC for the kexec case, no longer
ignore the XENEVTCHN_NO_CLOEXEC flag in minios.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/libs/evtchn/minios.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tools/libs/evtchn/minios.c b/tools/libs/evtchn/minios.c
index 046cd28d37..0d2a201438 100644
--- a/tools/libs/evtchn/minios.c
+++ b/tools/libs/evtchn/minios.c
@@ -114,10 +114,6 @@ static void evtchn_initialize(void)
     ftype_evtchn = alloc_file_type(&evtchn_ops);
 }
 
-/*
- * XENEVTCHN_NO_CLOEXEC is being ignored, as there is no exec() call supported
- * in Mini-OS.
- */
 int osdep_evtchn_open(xenevtchn_handle *xce, unsigned int flags)
 {
     int fd;
@@ -137,6 +133,8 @@ int osdep_evtchn_open(xenevtchn_handle *xce, unsigned int flags)
         return -1;
     }
 
+    if ( !(flags & XENEVTCHN_NO_CLOEXEC) )
+        file->cloexec = true;
     file->dev = ports;
     XEN_LIST_INIT(&ports->list);
     xce->fd = fd;
-- 
2.43.0


