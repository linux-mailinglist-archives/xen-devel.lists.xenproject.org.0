Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 856015B3831
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 14:54:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404308.646739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWdW4-0006yG-Ct; Fri, 09 Sep 2022 12:53:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404308.646739; Fri, 09 Sep 2022 12:53:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWdW4-0006vX-A7; Fri, 09 Sep 2022 12:53:52 +0000
Received: by outflank-mailman (input) for mailman id 404308;
 Fri, 09 Sep 2022 12:53:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F8UZ=ZM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oWdW2-0006vQ-HY
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 12:53:50 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72c9561b-303e-11ed-a31c-8f8a9ae3403f;
 Fri, 09 Sep 2022 14:53:49 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AE5EA1F8DA;
 Fri,  9 Sep 2022 12:53:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 670FA139D5;
 Fri,  9 Sep 2022 12:53:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id D6rjF1w3G2PVNQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 09 Sep 2022 12:53:48 +0000
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
X-Inumbo-ID: 72c9561b-303e-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662728028; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Ywj87vOwTKhT5iZ677cNQ2Fr/sHl0+j5C9vmNgewlYk=;
	b=VUeiWhP8lEn+qG5qfDVDxma3RCTLiKgJ46VzrYNT1RczaXbLHtPRwlcsvPFML7xYKeUUWd
	T/fGb42kZC5pMy9LRB3x6+q8J0CbWwvmEHaTMqLYdS1lU+96UEeIntlXfd94lm70UIiPux
	DEhPe+23x6CMjXxu4W6xp0WFUKNXSQ4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3] xen/gnttab: fix gnttab_acquire_resource()
Date: Fri,  9 Sep 2022 14:53:47 +0200
Message-Id: <20220909125347.25734-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 9dc46386d89d ("gnttab: work around "may be used uninitialized"
warning") was wrong, as vaddrs can legitimately be NULL in case
XENMEM_resource_grant_table_id_status was specified for a grant table
v1. This would result in crashes in debug builds due to
ASSERT_UNREACHABLE() triggering.

Check vaddrs only to be NULL in the rc == 0 case.

Expand the tests in tools/tests/resource to verify that using
XENMEM_resource_grant_table_id_status on a V1 grant table will result
in EINVAL.

Fixes: 9dc46386d89d ("gnttab: work around "may be used uninitialized" warning")
Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com> # xen
Release-acked-by: Henry Wang <Henry.Wang@arm.com>
---
V2:
- rework (Jan Beulich, Julien Grall)
V3:
- added test support (Andrew Cooper)
---
 tools/tests/resource/test-resource.c | 11 +++++++++++
 xen/common/grant_table.c             |  2 +-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/tools/tests/resource/test-resource.c b/tools/tests/resource/test-resource.c
index 189353ebcb..71a81f207e 100644
--- a/tools/tests/resource/test-resource.c
+++ b/tools/tests/resource/test-resource.c
@@ -106,6 +106,17 @@ static void test_gnttab(uint32_t domid, unsigned int nr_frames,
     if ( rc )
         return fail("    Fail: Unmap grant table %d - %s\n",
                     errno, strerror(errno));
+
+    /* Verify that the attempt to map the status frames is failing for V1. */
+    res = xenforeignmemory_map_resource(
+        fh, domid, XENMEM_resource_grant_table,
+        XENMEM_resource_grant_table_id_status, 0, 1,
+        (void **)&gnttab, PROT_READ | PROT_WRITE, 0);
+    if ( res || errno != EINVAL )
+        fail("    Fail: Map status not failing with EINVAL %d - %s\n",
+             res ? 0 : errno, res ? "no error" : strerror(errno));
+    if ( res )
+        xenforeignmemory_unmap_resource(fh, res);
 }
 
 static void test_domain_configurations(void)
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index ad773a6996..fba329dcc2 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -4140,7 +4140,7 @@ int gnttab_acquire_resource(
      * on non-error paths, and hence it needs setting to NULL at the top of the
      * function.  Leave some runtime safety.
      */
-    if ( !vaddrs )
+    if ( !rc && !vaddrs )
     {
         ASSERT_UNREACHABLE();
         rc = -ENODATA;
-- 
2.35.3


