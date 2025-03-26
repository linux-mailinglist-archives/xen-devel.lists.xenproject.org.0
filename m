Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F27D6A71B69
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 17:05:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928051.1330820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txTFM-0001ji-Vu; Wed, 26 Mar 2025 16:04:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928051.1330820; Wed, 26 Mar 2025 16:04:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txTFM-0001hI-SV; Wed, 26 Mar 2025 16:04:52 +0000
Received: by outflank-mailman (input) for mailman id 928051;
 Wed, 26 Mar 2025 16:04:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Vdm=WN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1txTFL-0001Sq-WB
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 16:04:52 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c831113-0a5c-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 17:04:51 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D3EB21F391;
 Wed, 26 Mar 2025 16:04:50 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7F2B11374A;
 Wed, 26 Mar 2025 16:04:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id fPuLHaIl5Gf0aAAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 26 Mar 2025 16:04:50 +0000
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
X-Inumbo-ID: 0c831113-0a5c-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1743005091; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=76i+/SKsEEHaJ6yk2WS1+eCvnz0Uet3AVyzi+W0nPmE=;
	b=lc7ISap1qr60d3IkB+rP89ZMQVVczERMCvfFTFvEUjZF1yFOBRPG9San4+Bwd5rhjQCrRU
	Eu4PTMeNtVGJTWBV6Xs+OYRjIGloU/TiuFsgHodS4NgT1aBdHCOf9tXokd0jXi4dHoeVFp
	WpgeZvTc76oUb4upmkHnc+2XEhWsQIY=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=OBllyPoq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1743005090; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=76i+/SKsEEHaJ6yk2WS1+eCvnz0Uet3AVyzi+W0nPmE=;
	b=OBllyPoqtfr36dk/GCUYk0V7W32FfU6lwoY1tm6wgGo4J33I08dBfiC7hjZFyCG1wUo5BS
	/jm3FB4C/L7aFvWpmX3xhhKS/QKnnROtYN6rBVqA3o7ZtTQbnY2JKvXX2oiZjNAv/Zu+0B
	PVtq9VKd75037lnxu4MJADIpJIm+WF8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/6] SUPPORT.md: make Linux based stubdom fully supported
Date: Wed, 26 Mar 2025 17:04:35 +0100
Message-ID: <20250326160442.19706-2-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326160442.19706-1-jgross@suse.com>
References: <20250326160442.19706-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D3EB21F391
X-Spam-Score: -1.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[99.98%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[suse.com,gmail.com,xenproject.org,citrix.com,vates.tech,amd.com,xen.org,kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:dkim,suse.com:mid,suse.com:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

All patches needed for running with a Linux stubdom device model are
in the tree and QubesOS is using and testing Linux stubdoms nowadays.

Switch support from "Tech Preview" to "Supported".

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 CHANGELOG.md | 1 +
 SUPPORT.md   | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 9a5919585d..b03e2c73d7 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -7,6 +7,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 ## [4.21.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
 
 ### Changed
+ - Linux based device model stubdomains are now fully supported.
 
 ### Added
  - On x86:
diff --git a/SUPPORT.md b/SUPPORT.md
index 91cb6f8ed2..ed4412f0af 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -260,7 +260,7 @@ Go (golang) bindings for libxl
 
 Support for running qemu-xen device model in a linux stubdomain.
 
-    Status: Tech Preview
+    Status: Supported
 
 ## Xenstore
 
-- 
2.43.0


