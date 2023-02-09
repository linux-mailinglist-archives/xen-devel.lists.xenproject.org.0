Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE82690C26
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 15:49:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492538.762131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ8EL-0005tR-BE; Thu, 09 Feb 2023 14:48:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492538.762131; Thu, 09 Feb 2023 14:48:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ8EL-0005q8-7l; Thu, 09 Feb 2023 14:48:57 +0000
Received: by outflank-mailman (input) for mailman id 492538;
 Thu, 09 Feb 2023 14:48:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7iTR=6F=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pQ8EJ-0005q0-TN
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 14:48:55 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd4ea7e8-a888-11ed-93b5-47a8fe42b414;
 Thu, 09 Feb 2023 15:48:50 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B68B833D84;
 Thu,  9 Feb 2023 14:48:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7E0D5138E4;
 Thu,  9 Feb 2023 14:48:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4WuNHdEH5WOUIQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 09 Feb 2023 14:48:49 +0000
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
X-Inumbo-ID: dd4ea7e8-a888-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1675954129; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=YjnpbWlmXohZDrED88H73FNHl2lxTAanQxhg+wPy9ao=;
	b=flUWnbOojtD+1k4RLXKRfdwpPfhfAd07cMb9StAj8t6A65Qp3FKQZuzHFll8SUbrN9dfUG
	018xslWP5gQXtF0YIggHBlTxBjduw7QARas+dyDpaecl10sIA+ClPh5VOwjdvDnim2sCsz
	AjeVGtDgPnRtBafjvAKsP4J33XiTmg4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] docs: clarify xenstore permission documentation
Date: Thu,  9 Feb 2023 15:41:48 +0100
Message-Id: <20230209144148.4132-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In docs/misc/xenstore.txt the description of the Xenstore node access
permissions is missing one important aspect, which can be found only
in the code or in the wiki [1]:

The first permission entry is defining the owner of the node via the
domid, and the access rights for all domains NOT having a dedicated
permission entry.

Make that aspect clear in the official documentation.

[1]: https://wiki.xenproject.org/wiki/XenBus#Permissions

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 docs/misc/xenstore.txt | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/docs/misc/xenstore.txt b/docs/misc/xenstore.txt
index 8887e7df88..d807ef0709 100644
--- a/docs/misc/xenstore.txt
+++ b/docs/misc/xenstore.txt
@@ -45,13 +45,16 @@ them to within 2048 bytes.  (See XENSTORE_*_PATH_MAX in xs_wire.h.)
 
 Each node has one or multiple permission entries.  Permissions are
 granted by domain-id, the first permission entry of each node specifies
-the owner of the node.  Permissions of a node can be changed by the
-owner of the node, the owner can only be modified by the control
-domain (usually domain id 0).  The owner always has the right to read
-and write the node, while other permissions can be setup to allow
-read and/or write access.  When a domain is being removed from Xenstore
-nodes owned by that domain will be removed together with all of those
-nodes' children.
+the owner of the node, who always has full access to the node (read and
+write permission).  The access rights of the first entry specify the
+allowed access for all domains not having a dedicated permission entry
+(the default is "n", removing access for all domains not explicitly
+added via additional permission entries).  Permissions of a node can be
+changed by the owner of the node, the owner can only be modified by the
+control domain (usually domain id 0).  Other permissions can be setup to
+allow read and/or write access for other domains.  When a domain is
+being removed from Xenstore nodes owned by that domain will be removed
+together with all of those nodes' children.
 
 
 Communication with xenstore is via either sockets, or event channel
-- 
2.35.3


