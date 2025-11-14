Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B32CC5CE08
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 12:33:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162447.1490098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJs2s-0001n6-6a; Fri, 14 Nov 2025 11:32:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162447.1490098; Fri, 14 Nov 2025 11:32:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJs2s-0001jx-3B; Fri, 14 Nov 2025 11:32:50 +0000
Received: by outflank-mailman (input) for mailman id 1162447;
 Fri, 14 Nov 2025 11:32:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=leFb=5W=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vJs2r-0001jd-0C
 for xen-devel@lists.xenproject.org; Fri, 14 Nov 2025 11:32:49 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4f52825-c14d-11f0-9d18-b5c5bf9af7f9;
 Fri, 14 Nov 2025 12:32:47 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 294EF21137;
 Fri, 14 Nov 2025 11:32:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CC3EE3EA61;
 Fri, 14 Nov 2025 11:32:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 81sMMF4TF2nASwAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 14 Nov 2025 11:32:46 +0000
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
X-Inumbo-ID: a4f52825-c14d-11f0-9d18-b5c5bf9af7f9
Authentication-Results: smtp-out1.suse.de;
	none
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
Subject: [PATCH v2 1/4] build: add make macro for making file from file.in
Date: Fri, 14 Nov 2025 12:32:35 +0100
Message-ID: <20251114113238.9279-2-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251114113238.9279-1-jgross@suse.com>
References: <20251114113238.9279-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Queue-Id: 294EF21137
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]

Add a new make macro for creating <file> from <file>.in at build
time. To be used like this:

$(foreach file,$(IN_FILES),$(eval $(call apply-build-vars,$(file))))

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
---
 Config.mk | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Config.mk b/Config.mk
index e1556dfbfa..d21d67945a 100644
--- a/Config.mk
+++ b/Config.mk
@@ -159,6 +159,19 @@ define move-if-changed
 	if ! cmp -s $(1) $(2); then mv -f $(1) $(2); else rm -f $(1); fi
 endef
 
+PATH_FILES := Paths
+INC_FILES := $(foreach f, $(PATH_FILES), $(XEN_ROOT)/config/$(f).mk)
+
+include $(INC_FILES)
+
+BUILD_MAKE_VARS := $(foreach f, $(PATH_FILES), $(shell awk '$$2 == ":=" { print $$1; }' $(XEN_ROOT)/config/$(f).mk.in))
+
+# Replace @xxx@ markers in $(1).in with $(xxx) variable contents, write to $(1)
+define apply-build-vars
+ $(1): $(1).in
+	sed $$(foreach v, $$(BUILD_MAKE_VARS), -e 's#@$$(v)@#$$($$(v))#g') <$$< >$$@
+endef
+
 CFLAGS += -fno-strict-aliasing
 
 CFLAGS += -std=gnu99
-- 
2.51.0


