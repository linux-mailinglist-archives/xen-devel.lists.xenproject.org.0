Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6580715DC5
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 13:48:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541123.843523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3xps-0000Z1-Ji; Tue, 30 May 2023 11:48:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541123.843523; Tue, 30 May 2023 11:48:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3xps-0000WS-GE; Tue, 30 May 2023 11:48:20 +0000
Received: by outflank-mailman (input) for mailman id 541123;
 Tue, 30 May 2023 11:48:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2tj/=BT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1q3xpr-0000WM-P6
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 11:48:19 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ddfe51f0-fedf-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 13:48:17 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0B8AF1F8D9;
 Tue, 30 May 2023 11:48:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B2A7113597;
 Tue, 30 May 2023 11:48:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dww+KoDidWSbBgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 30 May 2023 11:48:16 +0000
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
X-Inumbo-ID: ddfe51f0-fedf-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1685447297; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=5og6JTPEvFEXVd4ZjHNiLOHRV6jX+qn1ll+b3g6Psaw=;
	b=T8hcyKbTTJ9UQm4ATIms445u8ebF8bCPB3AB1J1+zTpfl31lJ24ZB0SWtFfNh1e5qWiadD
	3WRqh1bpB22/JwlLNwicjRFGnmNk6D7dvi3KSvTPa1AKtl96tUGaJMl47FcwcH7YK+Ew3z
	LQemV/+YPxk8lu3h/PTEhXmGk336zWk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/include/public: fix 9pfs xenstore path description
Date: Tue, 30 May 2023 13:48:15 +0200
Message-Id: <20230530114815.18362-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In xen/include/public/io/9pfs.h the name of the Xenstore backend node
"security-model" should be "security_model", as this is how the Xen
tools are creating it and qemu is reading it.

Fixes: ad58142e73a9 ("xen/public: move xenstore related doc into 9pfs.h")
Fixes: cf1d2d22fdfd ("docs/misc: Xen transport for 9pfs")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/include/public/io/9pfs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/public/io/9pfs.h b/xen/include/public/io/9pfs.h
index a0ce82d0a8..9ad2773082 100644
--- a/xen/include/public/io/9pfs.h
+++ b/xen/include/public/io/9pfs.h
@@ -64,7 +64,7 @@
  *
  *         Host filesystem path to share.
  *
- *    security-model
+ *    security_model
  *         Values:         "none"
  *
  *         *none*: files are stored using the same credentials as they are
-- 
2.35.3


