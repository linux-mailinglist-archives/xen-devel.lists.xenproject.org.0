Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4427852B8
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 10:33:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589046.920759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYjHu-0001bE-82; Wed, 23 Aug 2023 08:32:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589046.920759; Wed, 23 Aug 2023 08:32:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYjHu-0001Yr-4p; Wed, 23 Aug 2023 08:32:26 +0000
Received: by outflank-mailman (input) for mailman id 589046;
 Wed, 23 Aug 2023 08:32:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2ZVo=EI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qYjHs-0001Yl-7O
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 08:32:24 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94a063c1-418f-11ee-8783-cb3800f73035;
 Wed, 23 Aug 2023 10:32:22 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E8A2222186;
 Wed, 23 Aug 2023 08:32:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B57BA13458;
 Wed, 23 Aug 2023 08:32:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id tce2KhXE5WTAXgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 23 Aug 2023 08:32:21 +0000
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
X-Inumbo-ID: 94a063c1-418f-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1692779541; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=KZf5kSjJWu8FUoC0WchwMriRXqjv94Z9qL9dZfUWNBE=;
	b=FSxXvCL3K3xQCCMZxACpojMWqRzH8e0oQAMpjwUFoEwxW7RGKeHeekFjqekVx40acqnTJG
	cAvglFsh/fJ62we81sDm6jaWkyiwCeUzxEsTY/R+/qou8MXQlLXeIIPeR6RUBT2Y2HETv4
	DDNI8OfOXHczkTOshkRQAyHNP1ksytw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH] stubdom: remove openssl related clean actions
Date: Wed, 23 Aug 2023 10:32:19 +0200
Message-Id: <20230823083219.19517-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When introducing polarssl into stubdom building the clean targets of
stubdom/Makefile gained actions for removing openssl directories and
files additional to polarssl ones.

As those openssl files are never downloaded or created during build,
the related actions can be dropped.

Fixes: bdd516dc6b2f ("vtpm/vtpmmgr and required libs to stubdom/Makefile")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 stubdom/Makefile | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/stubdom/Makefile b/stubdom/Makefile
index d5fb354e7e..23ea8bb92e 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -670,7 +670,6 @@ crossclean: clean
 	rm -fr ioemu xenstore xenstorepvh
 	rm -fr gmp-$(XEN_TARGET_ARCH)
 	rm -fr polarssl-$(XEN_TARGET_ARCH)
-	rm -fr openssl-$(XEN_TARGET_ARCH)
 	rm -fr tpm_emulator-$(XEN_TARGET_ARCH)
 	rm -f mk-headers-$(XEN_TARGET_ARCH)
 	rm -fr ocaml-$(XEN_TARGET_ARCH)
@@ -682,7 +681,6 @@ patchclean: crossclean
 	rm -fr newlib-$(NEWLIB_VERSION)
 	rm -fr gmp-$(XEN_TARGET_ARCH)
 	rm -fr polarssl-$(XEN_TARGET_ARCH)
-	rm -fr openssl-$(XEN_TARGET_ARCH)
 	rm -fr tpm_emulator-$(XEN_TARGET_ARCH)
 	rm -fr lwip-$(XEN_TARGET_ARCH)
 	rm -fr grub-upstream
@@ -699,7 +697,6 @@ downloadclean: patchclean
 	rm -f lwip-$(LWIP_VERSION).tar.gz
 	rm -f ocaml-$(OCAML_VERSION).tar.gz
 	rm -f polarssl-$(POLARSSL_VERSION)-gpl.tgz
-	rm -f openssl-$(POLARSSL_VERSION)-gpl.tgz
 
 .PHONY: distclean
 distclean: downloadclean
-- 
2.35.3


