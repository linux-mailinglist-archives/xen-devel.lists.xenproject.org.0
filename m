Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 343896F2950
	for <lists+xen-devel@lfdr.de>; Sun, 30 Apr 2023 16:48:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527816.820462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pt8KD-0001bq-9c; Sun, 30 Apr 2023 14:46:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527816.820462; Sun, 30 Apr 2023 14:46:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pt8KD-0001a9-6m; Sun, 30 Apr 2023 14:46:53 +0000
Received: by outflank-mailman (input) for mailman id 527816;
 Sun, 30 Apr 2023 14:46:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AY6w=AV=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pt8KB-0001a3-Hj
 for xen-devel@lists.xenproject.org; Sun, 30 Apr 2023 14:46:51 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d635aa53-e765-11ed-8611-37d641c3527e;
 Sun, 30 Apr 2023 16:46:49 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B4F1F221D9;
 Sun, 30 Apr 2023 14:46:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7550913319;
 Sun, 30 Apr 2023 14:46:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3fcbG1h/TmTjAgAAMHmgww
 (envelope-from <jgross@suse.com>); Sun, 30 Apr 2023 14:46:48 +0000
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
X-Inumbo-ID: d635aa53-e765-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1682866008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=4DXzQGU0fs1LGWAuV3shMeqRhZhnDtfQ/XOdGvqODYM=;
	b=pWkkDKbSxXXQwv/hwENRh+9WOto6rFtihpC9/qu40QG0BmehJc2RiMteckOom74m91CxS+
	DYWnaLnwcD5VveJjvN9AlSDEDURAQAHbcc0CFRAuc2fuPwtv4MospZ+iBn30t6lnu9ZRzv
	QzYH08NE5A/AjoEaJChhPZurCCs/11s=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] xen/sysctl: fix XEN_SYSCTL_getdomaininfolist handling with XSM
Date: Sun, 30 Apr 2023 16:46:46 +0200
Message-Id: <20230430144646.13624-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case XSM is active, the handling of XEN_SYSCTL_getdomaininfolist
can fail if the last domain scanned isn't allowed to be accessed by
the calling domain (i.e. xsm_getdomaininfo(XSM_HOOK, d) is failing).

Fix that by just ignoring scanned domains where xsm_getdomaininfo()
is returning an error, like it is effectively done when such a
situation occurs for a domain not being the last one scanned.

Fixes: d046f361dc93 ("Xen Security Modules: XSM")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/sysctl.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 02505ab044..0cbfe8bd44 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -89,8 +89,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
             if ( num_domains == op->u.getdomaininfolist.max_domains )
                 break;
 
-            ret = xsm_getdomaininfo(XSM_HOOK, d);
-            if ( ret )
+            if ( xsm_getdomaininfo(XSM_HOOK, d) )
                 continue;
 
             getdomaininfo(d, &info);
-- 
2.35.3


