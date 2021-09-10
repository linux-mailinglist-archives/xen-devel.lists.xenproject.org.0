Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 486234066F0
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 07:55:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184032.332542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOZVV-0002pU-Vr; Fri, 10 Sep 2021 05:55:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184032.332542; Fri, 10 Sep 2021 05:55:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOZVV-0002ms-SP; Fri, 10 Sep 2021 05:55:25 +0000
Received: by outflank-mailman (input) for mailman id 184032;
 Fri, 10 Sep 2021 05:55:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dvCC=OA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mOZVU-0002mm-ET
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 05:55:24 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id afb5fd60-11fb-11ec-b210-12813bfff9fa;
 Fri, 10 Sep 2021 05:55:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2BC1A223F2;
 Fri, 10 Sep 2021 05:55:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CC9BB13D0C;
 Fri, 10 Sep 2021 05:55:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cJiAMEnzOmEDEAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 10 Sep 2021 05:55:21 +0000
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
X-Inumbo-ID: afb5fd60-11fb-11ec-b210-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1631253322; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xV8rdwiG4q9toCr/6b+aaGACeRQj1/7eJo0Ol2OKeRo=;
	b=YqZjTZsf0xfHXnshigWUy37ia2m5fkNKqan+OsRvi2PlL3ZNh03lWky1a6Rou/oVVVijsv
	EZ9GAkSwOOHDZIaAZctSYWUJNv3WmIzjkv0Lcv48lTO2ZqFuL2yoMn0U/sD+6sSQFJpeiL
	a9BR0OCfw5byHfSLdAWpwizGi9yjYPA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH v3 1/3] stubdom: fix build with disabled pv-grub
Date: Fri, 10 Sep 2021 07:55:16 +0200
Message-Id: <20210910055518.562-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210910055518.562-1-jgross@suse.com>
References: <20210910055518.562-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today the build will fail if --disable-pv-grub as a parameter of
configure, as the main Makefile will unconditionally try to build a
32-bit pv-grub stubdom.

Fix that by introducing a pv-grub-if-enabled target in
stubdom/Makefile taking care of this situation.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
--
V3:
- rename pv-grub32 target (Ian Jackson)
---
 Makefile         |  4 ++--
 stubdom/Makefile | 13 +++++++++++++
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 96d32cfd50..346d73a0dc 100644
--- a/Makefile
+++ b/Makefile
@@ -72,7 +72,7 @@ build-tools-oxenstored: build-tools-public-headers
 build-stubdom: mini-os-dir build-tools-public-headers
 	$(MAKE) -C stubdom build
 ifeq (x86_64,$(XEN_TARGET_ARCH))
-	XEN_TARGET_ARCH=x86_32 $(MAKE) -C stubdom pv-grub
+	XEN_TARGET_ARCH=x86_32 $(MAKE) -C stubdom pv-grub-if-enabled
 endif
 
 .PHONY: build-docs
@@ -143,7 +143,7 @@ install-tools: install-tools-public-headers
 install-stubdom: mini-os-dir install-tools
 	$(MAKE) -C stubdom install
 ifeq (x86_64,$(XEN_TARGET_ARCH))
-	XEN_TARGET_ARCH=x86_32 $(MAKE) -C stubdom install-grub
+	XEN_TARGET_ARCH=x86_32 $(MAKE) -C stubdom install-grub-if-enabled
 endif
 
 .PHONY: tools/firmware/seabios-dir-force-update
diff --git a/stubdom/Makefile b/stubdom/Makefile
index 06aa69d8bc..ccfcf5b75f 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -531,6 +531,13 @@ vtpmmgr-stubdom: mini-os-$(XEN_TARGET_ARCH)-vtpmmgr vtpmmgr
 pv-grub: mini-os-$(XEN_TARGET_ARCH)-grub libxenguest grub
 	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/grub/minios.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< APP_OBJS=$(CURDIR)/grub-$(XEN_TARGET_ARCH)/main.a
 
+.PHONY: pv-grub-if-enabled
+ifneq ($(filter grub,$(STUBDOM_TARGETS)),)
+pv-grub-if-enabled: pv-grub
+else
+pv-grub-if-enabled:
+endif
+
 .PHONY: xenstore-stubdom
 xenstore-stubdom: mini-os-$(XEN_TARGET_ARCH)-xenstore libxenguest xenstore
 	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/xenstore-minios.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< APP_OBJS=$(CURDIR)/xenstore/xenstored.a
@@ -560,6 +567,12 @@ install-grub: pv-grub
 	$(INSTALL_DIR) "$(DESTDIR)$(XENFIRMWAREDIR)"
 	$(INSTALL_DATA) mini-os-$(XEN_TARGET_ARCH)-grub/mini-os.gz "$(DESTDIR)$(XENFIRMWAREDIR)/pv-grub-$(XEN_TARGET_ARCH).gz"
 
+ifneq ($(filter grub,$(STUBDOM_TARGETS)),)
+install-grub-if-enabled: install-grub
+else
+install-grub-if-enabled:
+endif
+
 install-c: c-stubdom
 
 install-caml: caml-stubdom
-- 
2.26.2


