Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 089784052B9
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 14:49:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183220.331271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOJUh-0004ng-2f; Thu, 09 Sep 2021 12:49:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183220.331271; Thu, 09 Sep 2021 12:49:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOJUg-0004kK-Uy; Thu, 09 Sep 2021 12:49:30 +0000
Received: by outflank-mailman (input) for mailman id 183220;
 Thu, 09 Sep 2021 12:49:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vCZp=N7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mOJUf-0004iJ-5N
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 12:49:29 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 600b41ca-0bd0-4bd4-b3f9-5f9e83374f20;
 Thu, 09 Sep 2021 12:49:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7D5EE222FA;
 Thu,  9 Sep 2021 12:49:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 242D513CC1;
 Thu,  9 Sep 2021 12:49:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QB9TB9cCOmEyAgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 09 Sep 2021 12:49:27 +0000
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
X-Inumbo-ID: 600b41ca-0bd0-4bd4-b3f9-5f9e83374f20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1631191767; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=apPVVY/Or6068NSgAcAK1NyxZlsZ0S/Udfzjsh8c7Lc=;
	b=E1vtToLOsUatlm7chF20KBa/molARloaccxU0c3pKL4bDfD7/pgwUnIA6P4vc8qYJDbiRK
	kNY5hXJyJZLDjEvJZip43BDoF2f+8gbrdmjgl5jC23MCp133QAIJdXIi6bRxU2zuiTGebd
	WNsnqvVMjYS58fqH0YUQxEKT7qwJIzE=
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
Subject: [PATCH v2 1/3] stubdom: fix build with disabled pv-grub
Date: Thu,  9 Sep 2021 14:49:22 +0200
Message-Id: <20210909124924.1698-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210909124924.1698-1-jgross@suse.com>
References: <20210909124924.1698-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today the build will fail if --disable-pv-grub as a parameter of
configure, as the main Makefile will unconditionally try to build a
32-bit pv-grub stubdom.

Fix that by introducing a pv-grub32 target in stubdom/Makefile taking
care of this situation.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
---
 Makefile         |  4 ++--
 stubdom/Makefile | 13 +++++++++++++
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 96d32cfd50..5b5cef3e49 100644
--- a/Makefile
+++ b/Makefile
@@ -72,7 +72,7 @@ build-tools-oxenstored: build-tools-public-headers
 build-stubdom: mini-os-dir build-tools-public-headers
 	$(MAKE) -C stubdom build
 ifeq (x86_64,$(XEN_TARGET_ARCH))
-	XEN_TARGET_ARCH=x86_32 $(MAKE) -C stubdom pv-grub
+	XEN_TARGET_ARCH=x86_32 $(MAKE) -C stubdom pv-grub32
 endif
 
 .PHONY: build-docs
@@ -143,7 +143,7 @@ install-tools: install-tools-public-headers
 install-stubdom: mini-os-dir install-tools
 	$(MAKE) -C stubdom install
 ifeq (x86_64,$(XEN_TARGET_ARCH))
-	XEN_TARGET_ARCH=x86_32 $(MAKE) -C stubdom install-grub
+	XEN_TARGET_ARCH=x86_32 $(MAKE) -C stubdom install-grub32
 endif
 
 .PHONY: tools/firmware/seabios-dir-force-update
diff --git a/stubdom/Makefile b/stubdom/Makefile
index 06aa69d8bc..b339ae701c 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -531,6 +531,13 @@ vtpmmgr-stubdom: mini-os-$(XEN_TARGET_ARCH)-vtpmmgr vtpmmgr
 pv-grub: mini-os-$(XEN_TARGET_ARCH)-grub libxenguest grub
 	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/grub/minios.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< APP_OBJS=$(CURDIR)/grub-$(XEN_TARGET_ARCH)/main.a
 
+.PHONY: pv-grub32
+ifneq ($(filter grub,$(STUBDOM_TARGETS)),)
+pv-grub32: pv-grub
+else
+pv-grub32:
+endif
+
 .PHONY: xenstore-stubdom
 xenstore-stubdom: mini-os-$(XEN_TARGET_ARCH)-xenstore libxenguest xenstore
 	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/xenstore-minios.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< APP_OBJS=$(CURDIR)/xenstore/xenstored.a
@@ -560,6 +567,12 @@ install-grub: pv-grub
 	$(INSTALL_DIR) "$(DESTDIR)$(XENFIRMWAREDIR)"
 	$(INSTALL_DATA) mini-os-$(XEN_TARGET_ARCH)-grub/mini-os.gz "$(DESTDIR)$(XENFIRMWAREDIR)/pv-grub-$(XEN_TARGET_ARCH).gz"
 
+ifneq ($(filter grub,$(STUBDOM_TARGETS)),)
+install-grub32: install-grub
+else
+install-grub32:
+endif
+
 install-c: c-stubdom
 
 install-caml: caml-stubdom
-- 
2.26.2


