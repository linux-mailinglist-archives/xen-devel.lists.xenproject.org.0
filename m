Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 716A85AD301
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 14:48:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398799.639754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVBW5-0000nX-DS; Mon, 05 Sep 2022 12:47:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398799.639754; Mon, 05 Sep 2022 12:47:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVBW5-0000kD-9L; Mon, 05 Sep 2022 12:47:53 +0000
Received: by outflank-mailman (input) for mailman id 398799;
 Mon, 05 Sep 2022 12:47:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XgUS=ZI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oVBW3-0000jr-TR
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 12:47:52 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3303210-2d18-11ed-a016-b9edf5238543;
 Mon, 05 Sep 2022 14:47:50 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 34494388A3;
 Mon,  5 Sep 2022 12:47:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E6C6613A66;
 Mon,  5 Sep 2022 12:47:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AN4IN/XvFWO1DAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 05 Sep 2022 12:47:49 +0000
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
X-Inumbo-ID: f3303210-2d18-11ed-a016-b9edf5238543
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662382070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rGlCKEwcU/SZ0y9iAyqoydp7gF1Ss4+EyFvuwscMXI8=;
	b=D+XbUfY5DqhzDLv3fkIGTYgyJfygElHDI+FpD++HdkoM9dZxckoFGEPSLgkmnyt/imRwHn
	sj7Lkv74+vdmwoNnbEa71JHpO6xBmt8iTRlzY7Jtxgq/NjynElc0oPzZjhbagbIbqxpLii
	UaYwhim36MYw5I0k0D/QfcaSbbPale8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 3/4] tools/xenstore: add documentation for extended watch command
Date: Mon,  5 Sep 2022 14:47:45 +0200
Message-Id: <20220905124746.1975-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220905124746.1975-1-jgross@suse.com>
References: <20220905124746.1975-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for an extension of the WATCH command used to limit
the scope of watched paths. Additionally it enables to receive more
information in the events related to special watches (@introduceDomain
or @releaseDomain).

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
 docs/misc/xenstore-ring.txt |  1 +
 docs/misc/xenstore.txt      | 16 +++++++++++++---
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/docs/misc/xenstore-ring.txt b/docs/misc/xenstore-ring.txt
index 2792d13530..dbc7335e24 100644
--- a/docs/misc/xenstore-ring.txt
+++ b/docs/misc/xenstore-ring.txt
@@ -69,6 +69,7 @@ Bit     Description
 -----------------------------------------------------------------
 0       Ring reconnection (see the ring reconnection feature below)
 1       Connection error indicator (see connection error feature below)
+2       WATCH can take a third parameter limiting its scope
 
 The "Connection state" field is used to request a ring close and reconnect.
 The "Connection state" field only contains valid data if the server has
diff --git a/docs/misc/xenstore.txt b/docs/misc/xenstore.txt
index 73670d7907..da47d7bb16 100644
--- a/docs/misc/xenstore.txt
+++ b/docs/misc/xenstore.txt
@@ -187,7 +187,7 @@ SET_PERMS		<path>|<perm-as-string>|+?
 
 ---------- Watches ----------
 
-WATCH			<wpath>|<token>|?
+WATCH			<wpath>|<token>|[<depth>|]?
 	Adds a watch.
 
 	When a <path> is modified (including path creation, removal,
@@ -198,7 +198,11 @@ WATCH			<wpath>|<token>|?
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
@@ -209,7 +213,13 @@ WATCH			<wpath>|<token>|?
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
2.35.3


