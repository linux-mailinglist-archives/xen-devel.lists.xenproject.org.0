Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8107F4750
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 14:03:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638756.995648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5msG-00078F-HE; Wed, 22 Nov 2023 13:02:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638756.995648; Wed, 22 Nov 2023 13:02:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5msG-00075Y-Dm; Wed, 22 Nov 2023 13:02:36 +0000
Received: by outflank-mailman (input) for mailman id 638756;
 Wed, 22 Nov 2023 13:02:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9zcJ=HD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r5msE-0006Z6-TY
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 13:02:34 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6722a356-8937-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 14:02:34 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 03F781F8D9;
 Wed, 22 Nov 2023 13:02:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B4CA913467;
 Wed, 22 Nov 2023 13:02:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id W0zGKun7XWUhXwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 22 Nov 2023 13:02:33 +0000
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
X-Inumbo-ID: 6722a356-8937-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1700658154; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eV7Y6hFZNDmw9PF0suRHLNPlYtrcxG1rZVve947RUWY=;
	b=N4GcT9DKH2y/vryVNnDrWqd3YPzTgI2LPW8c8+bMilDf4ueLCxI5MGan28o3poIr6YgdeS
	cQJ12dUJY1pY4Ku5l9BCjdHoXk06ZNa4eWxFnKnqGtCaX+n/Oqat6EeL0fpHvpzjuZlkcG
	VkOujaRJIK/TQGhPtkjsAitJr4B86FU=
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
Subject: [PATCH v2 2/2] tools/python: add .gitignore file
Date: Wed, 22 Nov 2023 14:02:20 +0100
Message-Id: <20231122130220.10247-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231122130220.10247-1-jgross@suse.com>
References: <20231122130220.10247-1-jgross@suse.com>
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
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[10];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[26.56%]
X-Spam-Flag: NO

Add a local .gitignore file for tools/python.

As at least on some systems (e.g. OpenSUSE Leap 15.5) the build will
produce a tools/python/xen.egg-info directory, add it to the new
.gitignore file, too.

Use "/dir/" as pattern for ignoring a directory and its contents, as
the "/dir/*" pattern won't ignore the directory itself (git just
doesn't complain when seeing a directory without any not ignored file
in it).

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 .gitignore              | 3 ---
 tools/python/.gitignore | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)
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
index 0000000000..e8545df68b
--- /dev/null
+++ b/tools/python/.gitignore
@@ -0,0 +1,3 @@
+/build/
+/xen.egg-info/
+/xen/lowlevel/xl/_pyxl_types.[ch]
-- 
2.35.3


