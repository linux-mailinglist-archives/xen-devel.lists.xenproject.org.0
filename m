Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 260DBC4F000
	for <lists+xen-devel@lfdr.de>; Tue, 11 Nov 2025 17:20:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159090.1487507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIr6Q-0002gS-M3; Tue, 11 Nov 2025 16:20:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159090.1487507; Tue, 11 Nov 2025 16:20:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIr6Q-0002fE-HR; Tue, 11 Nov 2025 16:20:18 +0000
Received: by outflank-mailman (input) for mailman id 1159090;
 Tue, 11 Nov 2025 16:20:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6vR8=5T=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vIr6O-0002cf-HU
 for xen-devel@lists.xenproject.org; Tue, 11 Nov 2025 16:20:16 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4dc7bffa-bf1a-11f0-980a-7dc792cee155;
 Tue, 11 Nov 2025 17:20:14 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EA1CF21CE5;
 Tue, 11 Nov 2025 16:20:13 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9815A14A47;
 Tue, 11 Nov 2025 16:20:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id /xtlIz1iE2lYDQAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 11 Nov 2025 16:20:13 +0000
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
X-Inumbo-ID: 4dc7bffa-bf1a-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1762878014; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6/icCTTtv5rJ6FYoAuIqJyhSavJniLkM4kKGv1wpb8o=;
	b=emMRyEOJEMR4txVJq43sjPHczZwLu3XjxqJ1ggsiy8mKxM6jFoEpCQDA0UXixoWsnvoLvL
	3uk/aZ/Xni/BvdmJcvbkEWHpjJmWXDC2Xpvv/3QgWu34DeKKJ1m31hwywgm49xUFon1f4k
	e5AbGWFel2dt9MdPB4PGOzTfghmf0Ig=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=tOGIctiu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1762878013; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6/icCTTtv5rJ6FYoAuIqJyhSavJniLkM4kKGv1wpb8o=;
	b=tOGIctiuADyOGbDT4ZOWRU9iDqJFmnl3cOXk3NsGSXTujVd6V9nTFzpNm/R1qaXxqANtSz
	tWIm7VFr8wPXL/RbyM0GH515oGnr/pv+gDtXiTHV5V+ntMjeJD0l1cwMbklyjQ7Uc3xgQW
	kyePb/BXc8kyOapdYScJY3GCOLrv7vk=
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
Subject: [PATCH 2/5] build: add new make pattern for making file from file.src
Date: Tue, 11 Nov 2025 17:19:56 +0100
Message-ID: <20251111161959.13667-3-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251111161959.13667-1-jgross@suse.com>
References: <20251111161959.13667-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EA1CF21CE5
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
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
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

Add a new make pattern for creating <file> from <file>.src at build
time. Define the recipe as a macro in order to avoid replicating it
for cases where it needs to handle subdirectories (creating
<dir>/<file> from <dir>/<file>.src).

This can be used instead of the current approach to perform the similar
step for file.in during ./configure by renaming the source file to
file.src.

This will avoid having to run ./configure just because of modifying a
file depending on a variable set by configure.

Prepare to have multiple files as source for the replacement patterns.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 Config.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Config.mk b/Config.mk
index e1556dfbfa..0ea1640371 100644
--- a/Config.mk
+++ b/Config.mk
@@ -159,6 +159,20 @@ define move-if-changed
 	if ! cmp -s $(1) $(2); then mv -f $(1) $(2); else rm -f $(1); fi
 endef
 
+PATH_FILES := Paths
+INC_FILES := $(foreach f, $(PATH_FILES), $(XEN_ROOT)/config/$(f).mk)
+
+include $(INC_FILES)
+
+BUILD_MAKE_VARS := $(foreach f, $(PATH_FILES), $(shell awk '$$2 == ":=" { print $$1; }' $(XEN_ROOT)/config/$(f).mk.in))
+
+define apply-build-vars
+	sed $(foreach v, $(BUILD_MAKE_VARS), -e 's#@$(v)@#$($(v))#g') <$< >$@
+endef
+
+%:: %.src
+	$(apply-build-vars)
+
 CFLAGS += -fno-strict-aliasing
 
 CFLAGS += -std=gnu99
-- 
2.51.0


