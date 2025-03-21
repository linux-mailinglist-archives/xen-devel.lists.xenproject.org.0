Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E207A6B7C3
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 10:41:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.923696.1327158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvYsP-00026O-Lf; Fri, 21 Mar 2025 09:41:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 923696.1327158; Fri, 21 Mar 2025 09:41:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvYsP-000245-Ia; Fri, 21 Mar 2025 09:41:17 +0000
Received: by outflank-mailman (input) for mailman id 923696;
 Fri, 21 Mar 2025 09:41:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1wue=WI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tvYjR-000356-Km
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 09:32:01 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56f39bae-0637-11f0-9ffa-bf95429c2676;
 Fri, 21 Mar 2025 10:32:00 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C2DB321D86;
 Fri, 21 Mar 2025 09:31:59 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 88C62139AA;
 Fri, 21 Mar 2025 09:31:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id I5MMIA8y3WdhGwAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 21 Mar 2025 09:31:59 +0000
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
X-Inumbo-ID: 56f39bae-0637-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1742549519; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4BpHAguWxlsmt8Ud6JDitYmvVQmBcsNG/Ch0rgSbdso=;
	b=OqPlJU8F4c0C330u9Hsn9Yvosf8dzfLHgTLimxmL++mnNla64dNaz46hrNkc0DeKc2SRh2
	3tcb7m3eC2sX0+9gHkxED3FrX/S+upqcRQbCT+imI9FuTM4yEFhAf0hqlXNKUD8rF2z3kx
	q+GXRx0UFrHaawge42lz8IipdG/E6iA=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1742549519; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4BpHAguWxlsmt8Ud6JDitYmvVQmBcsNG/Ch0rgSbdso=;
	b=OqPlJU8F4c0C330u9Hsn9Yvosf8dzfLHgTLimxmL++mnNla64dNaz46hrNkc0DeKc2SRh2
	3tcb7m3eC2sX0+9gHkxED3FrX/S+upqcRQbCT+imI9FuTM4yEFhAf0hqlXNKUD8rF2z3kx
	q+GXRx0UFrHaawge42lz8IipdG/E6iA=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [MINI-OS PATCH v2 2/2] 9pfs: add lseek file operation hook
Date: Fri, 21 Mar 2025 10:31:45 +0100
Message-ID: <20250321093145.17882-3-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321093145.17882-1-jgross@suse.com>
References: <20250321093145.17882-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

Add a file operations lseek hook to the 9pfs frontend. Just use the
lseek_default() implementation.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 9pfront.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/9pfront.c b/9pfront.c
index 7257a07e..8bf3a91e 100644
--- a/9pfront.c
+++ b/9pfront.c
@@ -1325,6 +1325,7 @@ static const struct file_ops ops_9pfs = {
     .write = write_9pfs,
     .close = close_9pfs,
     .fstat = fstat_9pfs,
+    .lseek = lseek_default,
 };
 
 __attribute__((constructor))
-- 
2.43.0


