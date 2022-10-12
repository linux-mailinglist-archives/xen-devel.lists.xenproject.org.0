Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D14375FC0E2
	for <lists+xen-devel@lfdr.de>; Wed, 12 Oct 2022 08:45:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.420779.665792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiVUd-0000MK-Ng; Wed, 12 Oct 2022 06:45:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 420779.665792; Wed, 12 Oct 2022 06:45:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiVUd-0000JK-Kt; Wed, 12 Oct 2022 06:45:27 +0000
Received: by outflank-mailman (input) for mailman id 420779;
 Wed, 12 Oct 2022 06:45:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zRMe=2N=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oiVUb-0000JA-LT
 for xen-devel@lists.xenproject.org; Wed, 12 Oct 2022 06:45:25 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 730e5eb8-49f9-11ed-8fd0-01056ac49cbb;
 Wed, 12 Oct 2022 08:45:24 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3B71C22529;
 Wed, 12 Oct 2022 06:45:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0744813A5C;
 Wed, 12 Oct 2022 06:45:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4tpkAIRiRmO3LAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 12 Oct 2022 06:45:24 +0000
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
X-Inumbo-ID: 730e5eb8-49f9-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1665557124; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=pfSBOvu1OjtBmklXcnPKbzHd/cYxESBbfDXDCYhcEtE=;
	b=kzVeL9jJSSEXJ7XZEyVllcu9uwCi6gWxGyYSmMqxxFFCUwMpR2IwVQFjnbhA0jR5kY59md
	CSWj4VG/hD7hJ1Em2z17jbV8rNs9glyE8ebi5oYAqcvpnhriYa890kJyrbbKmla7tAWKS0
	y8PBYs50+IxWHiiVGU03h+mh6fmXwWU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH-for-4.15] tools/tests: fix wrong backport of upstream commit 52daa6a8483e4
Date: Wed, 12 Oct 2022 08:45:22 +0200
Message-Id: <20221012064522.6827-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The backport of upstream commit 52daa6a8483e4 had a bug, correct it.

Fixes: 3ac64b375183 ("xen/gnttab: fix gnttab_acquire_resource()")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/tests/resource/test-resource.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/tests/resource/test-resource.c b/tools/tests/resource/test-resource.c
index bf485baff2..51a8f4a000 100644
--- a/tools/tests/resource/test-resource.c
+++ b/tools/tests/resource/test-resource.c
@@ -71,7 +71,7 @@ static void test_gnttab(uint32_t domid, unsigned int nr_frames)
     res = xenforeignmemory_map_resource(
         fh, domid, XENMEM_resource_grant_table,
         XENMEM_resource_grant_table_id_status, 0, 1,
-        (void **)&gnttab, PROT_READ | PROT_WRITE, 0);
+        &addr, PROT_READ | PROT_WRITE, 0);
 
     if ( res )
     {
-- 
2.35.3


