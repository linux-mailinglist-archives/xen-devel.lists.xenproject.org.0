Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE764DB5B1
	for <lists+xen-devel@lfdr.de>; Wed, 16 Mar 2022 17:11:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291213.494162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUWEX-00010Z-87; Wed, 16 Mar 2022 16:10:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291213.494162; Wed, 16 Mar 2022 16:10:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUWEX-0000vB-2i; Wed, 16 Mar 2022 16:10:45 +0000
Received: by outflank-mailman (input) for mailman id 291213;
 Wed, 16 Mar 2022 16:10:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/w4J=T3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nUWEV-0000RR-9D
 for xen-devel@lists.xenproject.org; Wed, 16 Mar 2022 16:10:43 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9434545b-a543-11ec-8eba-a37418f5ba1a;
 Wed, 16 Mar 2022 17:10:40 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CB8E4212C6;
 Wed, 16 Mar 2022 16:10:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 930DF139B5;
 Wed, 16 Mar 2022 16:10:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2E2tIuwLMmK2OwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 16 Mar 2022 16:10:20 +0000
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
X-Inumbo-ID: 9434545b-a543-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1647447020; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LgNIQyH5+Xwv5DmZji7YTH5ZmS1Ip538z39IFfnqOPE=;
	b=YkZYeQzdQsLlfTJZTh1fsGrn3xCSLeDEjKPXT+iJ22ANeLVauU7LwDzQG1YKHwDVBjMuli
	v6+rrvhB+6jbvIjuTx5mIW24tCry+Wt4Lo9gofxmHK7gg9qyjUdvEvQL/fh0zjwnsSFWDV
	9NF/MowsvlBbroHve/UQV0eHK/n7eeU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 3/3] tools/xenstore: add documentation for extended watch command
Date: Wed, 16 Mar 2022 17:10:17 +0100
Message-Id: <20220316161017.3579-4-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220316161017.3579-1-jgross@suse.com>
References: <20220316161017.3579-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for an extension of the WATCH command used to limit
the scope of watched paths. Additionally it enables to receive more
information in the events related to special watches (@introduceDomain
or @releaseDomain).

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 docs/misc/xenstore-ring.txt |  1 +
 docs/misc/xenstore.txt      | 16 +++++++++++++---
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/docs/misc/xenstore-ring.txt b/docs/misc/xenstore-ring.txt
index 0cb72a3e35..eaa6d0a1a3 100644
--- a/docs/misc/xenstore-ring.txt
+++ b/docs/misc/xenstore-ring.txt
@@ -70,6 +70,7 @@ Mask    Description
 2       Connection error indicator (see connection error feature below)
 4       GET_FEATURE and SET_FEATURE Xenstore wire commands are available
 8       GET_QUOTA and SET_QUOTA Xenstore wire commands are available
+16      WATCH can take a third parameter limiting its scope
 
 The "Connection state" field is used to request a ring close and reconnect.
 The "Connection state" field only contains valid data if the server has
diff --git a/docs/misc/xenstore.txt b/docs/misc/xenstore.txt
index dd75a81328..f86c6d9757 100644
--- a/docs/misc/xenstore.txt
+++ b/docs/misc/xenstore.txt
@@ -188,7 +188,7 @@ SET_PERMS		<path>|<perm-as-string>|+?
 
 ---------- Watches ----------
 
-WATCH			<wpath>|<token>|?
+WATCH			<wpath>|<token>|[<depth>|]?
 	Adds a watch.
 
 	When a <path> is modified (including path creation, removal,
@@ -199,7 +199,11 @@ WATCH			<wpath>|<token>|?
 	matching watch results in a WATCH_EVENT message (see below).
 
 	The event's path matches the watch's <wpath> if it is an child
-	of <wpath>.
+	of <wpath>. This match can be limited by specifying <depth> (a
+	decimal value of 0 or larger): it denotes the directory levels
+	below <wpath> to consider for a match ("0" would not match for
+	a child of <wpath>, "1" would match only for a direct child,
+	etc.).
 
 	<wpath> can be a <path> to watch or @<wspecial>.  In the
 	latter case <wspecial> may have any syntax but it matches
@@ -210,7 +214,13 @@ WATCH			<wpath>|<token>|?
 				shutdown, and also on RELEASE
 				and domain destruction
 	<wspecial> events are sent to privileged callers or explicitly
-	via SET_PERMS enabled domains only.
+	via SET_PERMS enabled domains only. The semantics for a
+	specification of <depth> differ for generating <wspecial>
+	events: specifying "1" will report the related domid by using
+	@<wspecial>/<domid> for the reported path. Other <depth>
+	values are not supported.
+	For @releaseDomain it is possible to watch only for a specific
+	domain by specifying @releaseDomain/<domid> for the path.
 
 	When a watch is first set up it is triggered once straight
 	away, with <path> equal to <wpath>.  Watches may be triggered
-- 
2.34.1


