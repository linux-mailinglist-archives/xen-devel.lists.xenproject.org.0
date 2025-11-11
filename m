Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6321C4EFFE
	for <lists+xen-devel@lfdr.de>; Tue, 11 Nov 2025 17:20:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159089.1487497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIr6I-0002Nm-Do; Tue, 11 Nov 2025 16:20:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159089.1487497; Tue, 11 Nov 2025 16:20:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIr6I-0002LW-AW; Tue, 11 Nov 2025 16:20:10 +0000
Received: by outflank-mailman (input) for mailman id 1159089;
 Tue, 11 Nov 2025 16:20:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6vR8=5T=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vIr6H-00027n-4N
 for xen-devel@lists.xenproject.org; Tue, 11 Nov 2025 16:20:09 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a53aac1-bf1a-11f0-9d18-b5c5bf9af7f9;
 Tue, 11 Nov 2025 17:20:08 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 38DC521CE4;
 Tue, 11 Nov 2025 16:20:08 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CFEB414A47;
 Tue, 11 Nov 2025 16:20:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KzMnMTdiE2lDDQAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 11 Nov 2025 16:20:07 +0000
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
X-Inumbo-ID: 4a53aac1-bf1a-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1762878008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9sxmnTjwEbOo9LTw+g6Xhcgog1RwNkt63wuL1s3lR+k=;
	b=sSbz6ggdRUHPgJNvKpQMkLp7A5AgFSdjhbyP4Q3EYxoGIU3pYDYKoInd6QPS0Yr636gBEB
	4DU43bl1WTZ+vmr3d3shL1soy0ADrsKzWH/zN6kHhbMpfhraiQFph2+9p6CdPCCDnuDUsQ
	Y0sUynag83H/BDJeBxGtIU4FmOtoxbM=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=sSbz6ggd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1762878008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9sxmnTjwEbOo9LTw+g6Xhcgog1RwNkt63wuL1s3lR+k=;
	b=sSbz6ggdRUHPgJNvKpQMkLp7A5AgFSdjhbyP4Q3EYxoGIU3pYDYKoInd6QPS0Yr636gBEB
	4DU43bl1WTZ+vmr3d3shL1soy0ADrsKzWH/zN6kHhbMpfhraiQFph2+9p6CdPCCDnuDUsQ
	Y0sUynag83H/BDJeBxGtIU4FmOtoxbM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/5] config: remove stale definition from Config.mk
Date: Tue, 11 Nov 2025 17:19:55 +0100
Message-ID: <20251111161959.13667-2-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251111161959.13667-1-jgross@suse.com>
References: <20251111161959.13667-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 38DC521CE4
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:email,suse.com:mid,suse.com:dkim,config.mk:url];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

buildmakevars2shellvars is used nowhere, so remove it.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 Config.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Config.mk b/Config.mk
index 7edbab8efe..e1556dfbfa 100644
--- a/Config.mk
+++ b/Config.mk
@@ -149,12 +149,6 @@ else
 date = $(shell LC_ALL=C date $(1))
 endif
 
-define buildmakevars2shellvars
-    export PREFIX="$(prefix)";                                            \
-    export XEN_SCRIPT_DIR="$(XEN_SCRIPT_DIR)";                            \
-    export XEN_ROOT="$(XEN_ROOT)"
-endef
-
 #
 # Compare $(1) and $(2) and replace $(2) with $(1) if they differ
 #
-- 
2.51.0


