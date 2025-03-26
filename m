Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A98DBA71B8F
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 17:12:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928109.1330881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txTMQ-0006xh-5v; Wed, 26 Mar 2025 16:12:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928109.1330881; Wed, 26 Mar 2025 16:12:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txTMQ-0006vN-2R; Wed, 26 Mar 2025 16:12:10 +0000
Received: by outflank-mailman (input) for mailman id 928109;
 Wed, 26 Mar 2025 16:12:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Vdm=WN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1txTFp-0001z3-KL
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 16:05:21 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d74f11e-0a5c-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 17:05:19 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6963121175;
 Wed, 26 Mar 2025 16:05:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 15A521374A;
 Wed, 26 Mar 2025 16:05:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 62zSA78l5GcsaQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 26 Mar 2025 16:05:19 +0000
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
X-Inumbo-ID: 1d74f11e-0a5c-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1743005119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z9A+fu0CkA24A42L4jKEcCYh+ApxXI6+jMZ38aW5FWI=;
	b=YWI4DgwUPVoFj5zC265JUgQjHUdPLC3PcTzLWDPdNzU8pcPy1mEH9h2nd+A+at2wK6Ugn/
	ykU6fmaiI4OXDsWGu6S2RQK4xVi9UfatlLIMWeE6HGzfCdNwMW6kujpprqghFSflf1OdQG
	g/VrIksYi1kdIhHQkwtI124UysAJBc4=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=YWI4DgwU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1743005119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z9A+fu0CkA24A42L4jKEcCYh+ApxXI6+jMZ38aW5FWI=;
	b=YWI4DgwUPVoFj5zC265JUgQjHUdPLC3PcTzLWDPdNzU8pcPy1mEH9h2nd+A+at2wK6Ugn/
	ykU6fmaiI4OXDsWGu6S2RQK4xVi9UfatlLIMWeE6HGzfCdNwMW6kujpprqghFSflf1OdQG
	g/VrIksYi1kdIhHQkwtI124UysAJBc4=
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
Subject: [PATCH 6/6] build: don't require full tools build for building stubdoms
Date: Wed, 26 Mar 2025 17:04:40 +0100
Message-ID: <20250326160442.19706-7-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326160442.19706-1-jgross@suse.com>
References: <20250326160442.19706-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6963121175
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
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

With the drop of qemu-traditional "make stubdom" no longer requires
"make tools" to have finished.

It is enough to add "install-tools-public-headers" as a prereq of
"install-stubdom".

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index c9d80a6dc6..67b71ac3d4 100644
--- a/Makefile
+++ b/Makefile
@@ -147,7 +147,7 @@ install-tools: install-tools-public-headers
 	$(MAKE) -C tools install
 
 .PHONY: install-stubdom
-install-stubdom: mini-os-dir install-tools
+install-stubdom: mini-os-dir install-tools-public-headers
 	$(MAKE) -C stubdom install
 ifeq (x86_64,$(XEN_TARGET_ARCH))
 	XEN_TARGET_ARCH=x86_32 $(MAKE) -C stubdom install-grub-if-enabled
-- 
2.43.0


