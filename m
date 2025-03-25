Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B71DA6EC66
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 10:24:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926182.1329065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx0Wc-0005WQ-0q; Tue, 25 Mar 2025 09:24:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926182.1329065; Tue, 25 Mar 2025 09:24:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx0Wb-0005Ue-SJ; Tue, 25 Mar 2025 09:24:45 +0000
Received: by outflank-mailman (input) for mailman id 926182;
 Tue, 25 Mar 2025 09:24:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DLt0=WM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tx0Wa-0004sM-FS
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 09:24:44 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc9adeb7-095a-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 10:24:44 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 897D21F391;
 Tue, 25 Mar 2025 09:24:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 50915137AC;
 Tue, 25 Mar 2025 09:24:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id /Bk7Elt24meHMwAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 25 Mar 2025 09:24:43 +0000
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
X-Inumbo-ID: fc9adeb7-095a-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1742894683; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HmEfZe35xoFKsWhTqhezGsxyfw0BNdUzc5kZ9BZLcMM=;
	b=Y/ZnsIxMGqnt5F5Cp1fY8W2OV3jNnQ5EoigwZkACeHSCFm0jVVytoSI7dDGcrLL5rJPT/6
	qMkToPoB1c2JcvVPW8bEoudLYna1u82IZb51cyKjathwPsAKXixnw2oprJczURwE6ZDSQP
	9nKkIkV9gM6/MAYDqiG0ZfT3CeVx5yg=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1742894683; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HmEfZe35xoFKsWhTqhezGsxyfw0BNdUzc5kZ9BZLcMM=;
	b=Y/ZnsIxMGqnt5F5Cp1fY8W2OV3jNnQ5EoigwZkACeHSCFm0jVVytoSI7dDGcrLL5rJPT/6
	qMkToPoB1c2JcvVPW8bEoudLYna1u82IZb51cyKjathwPsAKXixnw2oprJczURwE6ZDSQP
	9nKkIkV9gM6/MAYDqiG0ZfT3CeVx5yg=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [MINI-OS PATCH v3 2/2] 9pfs: add lseek file operation hook
Date: Tue, 25 Mar 2025 10:24:28 +0100
Message-ID: <20250325092428.23040-3-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250325092428.23040-1-jgross@suse.com>
References: <20250325092428.23040-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Add a file operations lseek hook to the 9pfs frontend. Just use the
lseek_default() implementation.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
---
 9pfront.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/9pfront.c b/9pfront.c
index e676da35..895426d1 100644
--- a/9pfront.c
+++ b/9pfront.c
@@ -1326,6 +1326,7 @@ static const struct file_ops ops_9pfs = {
     .write = write_9pfs,
     .close = close_9pfs,
     .fstat = fstat_9pfs,
+    .lseek = lseek_default,
 };
 
 __attribute__((constructor))
-- 
2.43.0


