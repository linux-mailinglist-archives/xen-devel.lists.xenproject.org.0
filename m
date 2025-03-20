Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD32A6A0BF
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 08:49:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921382.1325255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvAep-0005f9-TZ; Thu, 20 Mar 2025 07:49:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921382.1325255; Thu, 20 Mar 2025 07:49:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvAep-0005dE-PW; Thu, 20 Mar 2025 07:49:39 +0000
Received: by outflank-mailman (input) for mailman id 921382;
 Thu, 20 Mar 2025 07:49:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=496r=WH=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tvAeo-00052A-EL
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 07:49:38 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df81a8ef-055f-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 08:49:38 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 88DF31F7A4;
 Thu, 20 Mar 2025 07:49:37 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 549DB13757;
 Thu, 20 Mar 2025 07:49:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id jNY4E5HI22eOVQAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 20 Mar 2025 07:49:37 +0000
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
X-Inumbo-ID: df81a8ef-055f-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1742456977; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=En0eJdxz153L2/LgbO/YpLEdAgM+TGIE5oN+YrmacIw=;
	b=IyH8rYFIOVY7FbMpYsQVzF5LciOap1/gAEH4vB+0E92UVSbsOX9k1rP1jLaMpJq4OV+jwT
	pnK/dn8Mt+sLc/817FyI7Dy0o9DZtXNN7MCio7wfTJzcBB8jxrGG0ws3zHEcbli2YTL97C
	A2HUr728ghUg2PfYr4zXgZ0auHekGhk=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1742456977; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=En0eJdxz153L2/LgbO/YpLEdAgM+TGIE5oN+YrmacIw=;
	b=IyH8rYFIOVY7FbMpYsQVzF5LciOap1/gAEH4vB+0E92UVSbsOX9k1rP1jLaMpJq4OV+jwT
	pnK/dn8Mt+sLc/817FyI7Dy0o9DZtXNN7MCio7wfTJzcBB8jxrGG0ws3zHEcbli2YTL97C
	A2HUr728ghUg2PfYr4zXgZ0auHekGhk=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 2/2] 9pfs: add lseek file operation hook
Date: Thu, 20 Mar 2025 08:49:24 +0100
Message-ID: <20250320074924.8080-3-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250320074924.8080-1-jgross@suse.com>
References: <20250320074924.8080-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Add a file operations lseek hook to the 9pfs frontend. Just use the
lseek_default() implementation.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 9pfront.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/9pfront.c b/9pfront.c
index a65fe26d..837e404b 100644
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


