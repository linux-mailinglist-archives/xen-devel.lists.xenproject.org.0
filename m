Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E29F4C79496
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 14:24:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1169202.1495010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMR71-0006WJ-Mv; Fri, 21 Nov 2025 13:23:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1169202.1495010; Fri, 21 Nov 2025 13:23:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMR71-0006Tx-J2; Fri, 21 Nov 2025 13:23:43 +0000
Received: by outflank-mailman (input) for mailman id 1169202;
 Fri, 21 Nov 2025 13:23:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wmUi=55=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vMR70-0006Tj-Go
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 13:23:42 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4bcfe626-c6dd-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 14:23:41 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D963321289;
 Fri, 21 Nov 2025 13:23:40 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8BAAC3EA61;
 Fri, 21 Nov 2025 13:23:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id z798INxnIGkkVQAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 21 Nov 2025 13:23:40 +0000
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
X-Inumbo-ID: 4bcfe626-c6dd-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1763731420; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6IHGZClk/KYaiG3r2nLzBNmUn7FuRkkHZ6zOcK9gZrU=;
	b=Iuqc9UN8LcQcX89oU+wk0GG2gsxQRqQocGi5YyIVig8C1RmzHhQvU58mMZRK9VP/XPRZQm
	6PAPoJhVWpkJPKHo76nAZEOyJTfvUSSIa5HdbWmWxOFFNnjrnIwU7qGZdEX28n3jTfHDCS
	TrqoZAP1AlYZznZNCDoxDWykPqshdjM=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1763731420; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6IHGZClk/KYaiG3r2nLzBNmUn7FuRkkHZ6zOcK9gZrU=;
	b=Iuqc9UN8LcQcX89oU+wk0GG2gsxQRqQocGi5YyIVig8C1RmzHhQvU58mMZRK9VP/XPRZQm
	6PAPoJhVWpkJPKHo76nAZEOyJTfvUSSIa5HdbWmWxOFFNnjrnIwU7qGZdEX28n3jTfHDCS
	TrqoZAP1AlYZznZNCDoxDWykPqshdjM=
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
Subject: [PATCH v3 1/4] build: add make macro for making file from file.in
Date: Fri, 21 Nov 2025 14:23:29 +0100
Message-ID: <20251121132332.23514-2-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251121132332.23514-1-jgross@suse.com>
References: <20251121132332.23514-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Add a new make macro for creating <file> from <file>.in at build
time. To be used like this:

$(foreach file,$(IN_TARGETS),$(eval $(call apply-build-vars,$(file))))

This can be used instead of the current approach to perform the similar
step for file.in during ./configure.

This will avoid having to run ./configure just because of modifying a
file depending on a variable set by configure.

Prepare to have multiple files as source for the replacement patterns.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- don't use pattern rule, but create explicit dependency in macro,
  don't require to rename source files (Jan Beulich, Andrew Cooper)
V3:
- prepare for $(PATH_FILES) to be extended by other Makefile
- let generated file depend on $(INC_FILES)
---
 Config.mk | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Config.mk b/Config.mk
index e1556dfbfa..39e8007b9c 100644
--- a/Config.mk
+++ b/Config.mk
@@ -159,6 +159,19 @@ define move-if-changed
 	if ! cmp -s $(1) $(2); then mv -f $(1) $(2); else rm -f $(1); fi
 endef
 
+PATH_FILES := Paths
+INC_FILES = $(foreach f, $(PATH_FILES), $(XEN_ROOT)/config/$(f).mk)
+
+include $(INC_FILES)
+
+BUILD_MAKE_VARS = $(foreach f, $(PATH_FILES), $(shell awk '$$2 == ":=" { print $$1; }' $(XEN_ROOT)/config/$(f).mk.in))
+
+# Replace @xxx@ markers in $(1).in with $(xxx) variable contents, write to $(1)
+define apply-build-vars
+ $(1): $(1).in $$(INC_FILES)
+	sed $$(foreach v, $$(BUILD_MAKE_VARS), -e 's#@$$(v)@#$$($$(v))#g') <$$< >$$@
+endef
+
 CFLAGS += -fno-strict-aliasing
 
 CFLAGS += -std=gnu99
-- 
2.51.0


