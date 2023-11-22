Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B435B7F4026
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 09:32:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638514.995136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5ieX-00022C-0C; Wed, 22 Nov 2023 08:32:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638514.995136; Wed, 22 Nov 2023 08:32:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5ieW-00020O-SM; Wed, 22 Nov 2023 08:32:08 +0000
Received: by outflank-mailman (input) for mailman id 638514;
 Wed, 22 Nov 2023 08:32:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9zcJ=HD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r5ieV-0001zJ-KS
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 08:32:07 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9eb2bdea-8911-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 09:32:06 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 594821F85D;
 Wed, 22 Nov 2023 08:32:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1BF5D139FD;
 Wed, 22 Nov 2023 08:32:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xkd6BYa8XWXbWAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 22 Nov 2023 08:32:06 +0000
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
X-Inumbo-ID: 9eb2bdea-8911-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1700641926; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OZXGIvs860A1OXmMIwGKtEn6mzTWfeL0TAPGoZmgBkM=;
	b=eyW+GC3HQB0uNy2Lq4U4NdxwCWEqyvj4GWUwspN30I74AWgMzvPn1p+8uUGqfVk23sSvFK
	E9dGBxrHuNSfsE3wwT2XnEVOjbhVhSqW1Fm3es91j1cvOh+nrs1zXvhTgqZdlJw+ldLKfe
	WhtLbPTHUIxhByVvKbH4KTeGGEFM8uY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 2/2] tools/python: add .gitignore file
Date: Wed, 22 Nov 2023 09:31:53 +0100
Message-Id: <20231122083153.24101-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231122083153.24101-1-jgross@suse.com>
References: <20231122083153.24101-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -0.30
X-Spamd-Result: default: False [-0.30 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-1.00)[-0.995];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[10];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[16.83%]
X-Spam-Flag: NO

Add a local .gitignore file for tools/python.

As at least on some systems (e.g. OpenSUSE Leap 15.5) the build will
produce a tools/python/xen.egg-info directory, add it to the new
.gitignore file, too.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 .gitignore              | 3 ---
 tools/python/.gitignore | 4 ++++
 2 files changed, 4 insertions(+), 3 deletions(-)
 create mode 100644 tools/python/.gitignore

diff --git a/.gitignore b/.gitignore
index 3009545af2..5b8f23271e 100644
--- a/.gitignore
+++ b/.gitignore
@@ -213,7 +213,6 @@ tools/misc/xencov
 tools/pkg-config/*
 tools/qemu-xen-build
 tools/xentrace/xenalyze
-tools/python/build/*
 tools/tests/depriv/depriv-fd-checker
 tools/tests/x86_emulator/*.bin
 tools/tests/x86_emulator/*.tmp
@@ -370,8 +369,6 @@ tools/ocaml/test/raise_exception
 tools/debugger/kdd/kdd
 tools/firmware/etherboot/ipxe.tar.gz
 tools/firmware/etherboot/ipxe/
-tools/python/xen/lowlevel/xl/_pyxl_types.c
-tools/python/xen/lowlevel/xl/_pyxl_types.h
 tools/xl/xl
 
 docs/txt/misc/*.txt
diff --git a/tools/python/.gitignore b/tools/python/.gitignore
new file mode 100644
index 0000000000..ffee7b4c4b
--- /dev/null
+++ b/tools/python/.gitignore
@@ -0,0 +1,4 @@
+build/*
+xen.egg-info/*
+xen/lowlevel/xl/_pyxl_types.c
+xen/lowlevel/xl/_pyxl_types.h
-- 
2.35.3


