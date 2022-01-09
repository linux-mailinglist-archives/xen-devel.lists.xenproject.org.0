Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 499B748889B
	for <lists+xen-devel@lfdr.de>; Sun,  9 Jan 2022 11:01:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255108.437184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6V18-0003iZ-AT; Sun, 09 Jan 2022 10:01:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255108.437184; Sun, 09 Jan 2022 10:01:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6V18-0003g5-6O; Sun, 09 Jan 2022 10:01:38 +0000
Received: by outflank-mailman (input) for mailman id 255108;
 Sun, 09 Jan 2022 10:01:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uXRL=RZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n6V17-0003fz-I9
 for xen-devel@lists.xenproject.org; Sun, 09 Jan 2022 10:01:37 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 218934d0-7133-11ec-81c1-a30af7de8005;
 Sun, 09 Jan 2022 11:01:36 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E2E5921108;
 Sun,  9 Jan 2022 10:01:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B417F1323E;
 Sun,  9 Jan 2022 10:01:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9ow2Kn+y2mGrNwAAMHmgww
 (envelope-from <jgross@suse.com>); Sun, 09 Jan 2022 10:01:35 +0000
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
X-Inumbo-ID: 218934d0-7133-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641722495; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3kV9UhfBQoub1twskolZ28UNaWHA/0B8jagVlPVjjrs=;
	b=IUhJe61BYKWSYLitLmz2Z2ujma/nGrrQ7SfLmyD8w+NhMi3RMg7EnNx7ZEZsM96YZrOZOk
	oQPPsbgYDpz1YJUq2ICFoquZCHj7d967lIo9IPodCXouvyPZn+V3+tX464+YqBfO96JRtm
	pEMBM5sNDTUWTWriudj/UPscTdqtlqA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] build: fix make distclean
Date: Sun,  9 Jan 2022 11:01:33 +0100
Message-Id: <20220109100133.19731-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"make distclean" will complain that "-c" is no supported flag for make.

Fix that by using "-C".

The error has been present for a long time, but it was uncovered only
recently.

Fixes: 2400a9a365c5619 ("tools/debugger: Allow make to recurse into debugger/")
Fixes: f9c9b127753e9ed ("tools: fix make distclean")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/debugger/gdbsx/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/debugger/gdbsx/Makefile b/tools/debugger/gdbsx/Makefile
index 8d7cd94a31..5571450a89 100644
--- a/tools/debugger/gdbsx/Makefile
+++ b/tools/debugger/gdbsx/Makefile
@@ -14,7 +14,7 @@ clean:
 
 .PHONY: distclean
 distclean: clean
-	set -e; for d in xg gx; do $(MAKE) -c $$d distclean; done
+	set -e; for d in xg gx; do $(MAKE) -C $$d distclean; done
 
 .PHONY: install
 install: all
-- 
2.26.2


