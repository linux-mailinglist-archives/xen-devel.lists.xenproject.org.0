Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3FE7852DC
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 10:40:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589053.920768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYjOy-0002E2-Ud; Wed, 23 Aug 2023 08:39:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589053.920768; Wed, 23 Aug 2023 08:39:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYjOy-0002Bw-S5; Wed, 23 Aug 2023 08:39:44 +0000
Received: by outflank-mailman (input) for mailman id 589053;
 Wed, 23 Aug 2023 08:39:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2ZVo=EI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qYjOx-0002Bn-Ft
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 08:39:43 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9af1cbe1-4190-11ee-8783-cb3800f73035;
 Wed, 23 Aug 2023 10:39:42 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3545D1F45A;
 Wed, 23 Aug 2023 08:39:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EAF0F13458;
 Wed, 23 Aug 2023 08:39:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +9EPOM3F5WQeYgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 23 Aug 2023 08:39:41 +0000
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
X-Inumbo-ID: 9af1cbe1-4190-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1692779982; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=d4byF+rn6QX6KvQ/TU6fu/RGem5w5N1coOjP+nnUbU0=;
	b=X26wbqqmPDKVLyxkZSqUWm7Mf7EmruhsnyBC1IdRgBVj/m28PMgX5/nKjHeTcBmYyzL2ZC
	BfoQeG5gDQp9i5AdBeCWQMCo7awpt2Lnx5RKyr8oXYJGoCug5BlMN6f9uoEUh2vKInZN1c
	6WIcOEMtf2cTZzwO7oo+myrJbtTW2ic=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] build: simplify clean handling of extras directory
Date: Wed, 23 Aug 2023 10:39:40 +0200
Message-Id: <20230823083940.20020-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The extras directory is used only as a download target for Mini-OS
sources. Instead of special handling extras/mini-os* in .gitignore and
the clean targets, just use extras for that purpose.

So add "extras" to .gitignore and remove it when doing a
"make distclean".

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 .gitignore | 2 +-
 .hgignore  | 6 +-----
 Makefile   | 2 +-
 3 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/.gitignore b/.gitignore
index c1b73b0968..2d4baa4395 100644
--- a/.gitignore
+++ b/.gitignore
@@ -63,7 +63,7 @@ docs/man7/
 docs/man8/
 docs/pdf/
 docs/txt/
-extras/mini-os*
+extras/
 install/*
 stubdom/*-minios-config.mk
 stubdom/autom4te.cache/
diff --git a/.hgignore b/.hgignore
index 2d41670632..030d97803e 100644
--- a/.hgignore
+++ b/.hgignore
@@ -77,11 +77,7 @@
 ^docs/xen-api/vm_lifecycle.eps$
 ^docs/xen-api/xenapi-datamodel-graph.eps$
 ^docs/xen-api/xenapi.out$
-^extras/mini-os/include/list\.h$
-^extras/mini-os/include/mini-os$
-^extras/mini-os/include/x86/mini-os$
-^extras/mini-os/include/xen$
-^extras/mini-os/mini-os.*$
+^extras/
 ^install/.*$
 ^linux-[^/]*-paravirt/.*$
 ^linux-2.6[^/]*/.*$
diff --git a/Makefile b/Makefile
index b93b22c752..a6ca348476 100644
--- a/Makefile
+++ b/Makefile
@@ -246,6 +246,7 @@ clean-docs:
 # clean, but blow away tarballs
 .PHONY: distclean
 distclean: $(TARGS_DISTCLEAN)
+	rm -rf extras
 	$(MAKE) -C tools/include distclean
 	rm -f config/Toplevel.mk
 	rm -rf dist
@@ -265,7 +266,6 @@ distclean-stubdom:
 ifeq (x86_64,$(XEN_TARGET_ARCH))
 	XEN_TARGET_ARCH=x86_32 $(MAKE) -C stubdom distclean
 endif
-	rm -rf extras/mini-os extras/mini-os-remote
 
 .PHONY: distclean-docs
 distclean-docs:
-- 
2.35.3


