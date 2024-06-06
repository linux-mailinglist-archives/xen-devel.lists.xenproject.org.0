Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACA58FDE4F
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2024 07:48:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735895.1142006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sF5zF-0006hx-6m; Thu, 06 Jun 2024 05:48:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735895.1142006; Thu, 06 Jun 2024 05:48:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sF5zF-0006gN-41; Thu, 06 Jun 2024 05:48:33 +0000
Received: by outflank-mailman (input) for mailman id 735895;
 Thu, 06 Jun 2024 05:48:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OoW9=NI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sF5zD-0006DD-B7
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2024 05:48:31 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66b2d32b-23c8-11ef-b4bb-af5377834399;
 Thu, 06 Jun 2024 07:48:29 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4D46D21954;
 Thu,  6 Jun 2024 05:48:29 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AF75A13A7B;
 Thu,  6 Jun 2024 05:48:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id EGSgJ6xNYWb5MgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 06 Jun 2024 05:48:28 +0000
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
X-Inumbo-ID: 66b2d32b-23c8-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1717652909; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kvMczZcb48JjtaatB5WOn8l5TupQJgv8S3WnQ++h5YU=;
	b=G8D1bG0m60lW3zAuQ0f6qT4KruSxjjO/DWJoVCM5uB8e2JfQxpzetq8ae8mJtEBkeiq68p
	+GTrC+FmVF0Eez5a8VrLVYR/d5QPVbnwBtordrt1HUrk2FYbK6Uv6E/LIwb87mFIeULvf+
	OyGMyaijHtZwrAddQvfsSaJHSxlbFPE=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=G8D1bG0m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1717652909; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kvMczZcb48JjtaatB5WOn8l5TupQJgv8S3WnQ++h5YU=;
	b=G8D1bG0m60lW3zAuQ0f6qT4KruSxjjO/DWJoVCM5uB8e2JfQxpzetq8ae8mJtEBkeiq68p
	+GTrC+FmVF0Eez5a8VrLVYR/d5QPVbnwBtordrt1HUrk2FYbK6Uv6E/LIwb87mFIeULvf+
	OyGMyaijHtZwrAddQvfsSaJHSxlbFPE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] MAINTAINERS: add me as scheduer maintainer
Date: Thu,  6 Jun 2024 07:47:45 +0200
Message-Id: <20240606054745.23555-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240606054745.23555-1-jgross@suse.com>
References: <20240606054745.23555-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-0.09 / 50.00];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	BAYES_HAM(-0.08)[63.53%];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ARC_NA(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Flag: NO
X-Spam-Score: -0.09
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 4D46D21954
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

I've been active in the scheduling code since many years now. Add
me as a maintainer.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6ba7d2765f..cc40c0be9d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -490,6 +490,7 @@ F:	xen/common/sched/rt.c
 SCHEDULING
 M:	George Dunlap <george.dunlap@citrix.com>
 M:	Dario Faggioli <dfaggioli@suse.com>
+M:	Juergen Gross <jgross@suse.com>
 S:	Supported
 F:	xen/common/sched/
 
-- 
2.35.3


