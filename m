Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDD675B1FD
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 17:05:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566648.885751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMVDE-0002mO-KS; Thu, 20 Jul 2023 15:05:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566648.885751; Thu, 20 Jul 2023 15:05:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMVDE-0002k4-Hb; Thu, 20 Jul 2023 15:05:04 +0000
Received: by outflank-mailman (input) for mailman id 566648;
 Thu, 20 Jul 2023 15:05:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F2Z1=DG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qMVDD-0002jy-Em
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 15:05:03 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ccde953e-270e-11ee-b23a-6b7b168915f2;
 Thu, 20 Jul 2023 17:05:01 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4BE072069F;
 Thu, 20 Jul 2023 15:05:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1C790138EC;
 Thu, 20 Jul 2023 15:05:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eKp3BR1NuWQJCwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 20 Jul 2023 15:05:01 +0000
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
X-Inumbo-ID: ccde953e-270e-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1689865501; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=NUCvlbyVM3C9s83ic5gsJCxga3aRHaTw7ZzMi+f7U5E=;
	b=jSmsj7krLV7I6B3RnlQtlBM8idaPXxe15xPPxjaqzF98DA/iwNAl9CUuBxtadsjjTpfDpH
	/UvfE6kehcC2KdnIG2vBLCmOjHCKYX6FKcoPdFHBj9xu5HTuZ6mx3U7Uf8i3kl62ebBjgA
	wWmowCrYMJBTtncX6mqTz7lKCQgTlME=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tools/xenstore: fix XSA-417 patch
Date: Thu, 20 Jul 2023 17:04:59 +0200
Message-Id: <20230720150459.31111-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fix for XSA-417 had a bug: domain_alloc_permrefs() will not return
a negative value in case of an error, but a plain errno value.

Note this is not considered to be a security issue, as the only case
where domain_alloc_permrefs() will return an error is a failed memory
allocation. As a guest should not be able to drive Xenstore out of
memory, this is NOT a problem a guest can trigger at will.

Fixes: ab128218225d ("tools/xenstore: fix checking node permissions")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 31a862b715..a1d3047e48 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -1784,7 +1784,7 @@ static int do_set_perms(const void *ctx, struct connection *conn,
 	if (!xenstore_strings_to_perms(perms.p, perms.num, permstr))
 		return errno;
 
-	if (domain_alloc_permrefs(&perms) < 0)
+	if (domain_alloc_permrefs(&perms))
 		return ENOMEM;
 	if (perms.p[0].perms & XS_PERM_IGNORE)
 		return ENOENT;
-- 
2.35.3


