Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3405B3524
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 12:24:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404144.646493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWbBK-00028s-BE; Fri, 09 Sep 2022 10:24:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404144.646493; Fri, 09 Sep 2022 10:24:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWbBK-00026G-84; Fri, 09 Sep 2022 10:24:18 +0000
Received: by outflank-mailman (input) for mailman id 404144;
 Fri, 09 Sep 2022 10:24:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F8UZ=ZM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oWbBI-00026A-O7
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 10:24:16 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8de7793d-3029-11ed-a31c-8f8a9ae3403f;
 Fri, 09 Sep 2022 12:24:15 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E4D8A336C8;
 Fri,  9 Sep 2022 10:24:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A197A13A93;
 Fri,  9 Sep 2022 10:24:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZjAhJk4UG2MudwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 09 Sep 2022 10:24:14 +0000
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
X-Inumbo-ID: 8de7793d-3029-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662719054; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=sSUlAVYH6Gf8aAog2W5wHnm7zoNDnmFGQUM7teLNNsA=;
	b=kK8ne8O9mGwA4z53kWxhZoS9PSUcQ45HpFs2FwaeGfjDHuD3beA7KjPuNrWvkgnyiNyZWw
	ciW2A4z62DDvYWvuaR7p9LNaGvQmF/DYPAuJwjs8DUjUN1/YP+K0iZvxF8fspKbdOyMCx4
	X4QYZdYyk5DOLmC3pI1jWkLdDjTuwxY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] xen/gnttab: fix gnttab_acquire_resource()
Date: Fri,  9 Sep 2022 12:24:13 +0200
Message-Id: <20220909102413.2899-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 9dc46386d89d ("gnttab: work around "may be used uninitialized"
warning") was wrong, as vaddrs can legitimately be NULL in case
XENMEM_resource_grant_table_id_status was specified for a grant table
v1. This would result in crashes in debug builds due to
ASSERT_UNREACHABLE() triggering.

Check vaddrs only to be NULL in the rc == 0 case.

Fixes: 9dc46386d89d ("gnttab: work around "may be used uninitialized" warning")
Signed-off-by: Juergen Gross <jgross@suse.com>
Release-acked-by: Henry Wang <Henry.Wang@arm.com>
---
Might be considered for backporting
---
 xen/common/grant_table.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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


