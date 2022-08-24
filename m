Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC3659F75F
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 12:22:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392368.630672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQnWn-0003C4-Qg; Wed, 24 Aug 2022 10:22:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392368.630672; Wed, 24 Aug 2022 10:22:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQnWn-00039l-O2; Wed, 24 Aug 2022 10:22:29 +0000
Received: by outflank-mailman (input) for mailman id 392368;
 Wed, 24 Aug 2022 10:22:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jRce=Y4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oQnWm-00039P-4i
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 10:22:28 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6d0ec8e-2396-11ed-9250-1f966e50362f;
 Wed, 24 Aug 2022 12:22:27 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B7278203AB;
 Wed, 24 Aug 2022 10:22:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 69BBE13AC0;
 Wed, 24 Aug 2022 10:22:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id z1VqGOL7BWNCGQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 24 Aug 2022 10:22:26 +0000
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
X-Inumbo-ID: a6d0ec8e-2396-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1661336546; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=/7EYD7Keid1p57myps4QR3QvxF3egN0T6fhaNudvLW0=;
	b=Vc4VIyX2sK0MlN5HoOs6QGgP7qxdRX1eTIKAMnFz3PdckVok5H88iTzSjA9UaMaEeUTwUb
	tUBwA8K17e2PkI5L1lrUwQABsF6TpWG8tBHKi58mKrjvqYoC1ilQbqtpEdiobe/wLCakYW
	gUW6IFi7xrCwtzLibB5gYT9IW+KTcvs=
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
Subject: [PATCH] xen: let ASSERT_UNREACHABLE() WARN() in non-debug builds
Date: Wed, 24 Aug 2022 12:22:25 +0200
Message-Id: <20220824102225.11431-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hitting an ASSERT_UNREACHABLE() is always wrong, so even in production
builds a warning seems to be appropriate when hitting one.

In order not to flood the console in reproducible cases, introduce
WARN_ONCE() to be used in this case.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
Notice for the release manager: this patch isn't really urgent for the
4.17 release, OTOH it is adding probably useful debug information for
the unlikely case of hitting an ASSERT_UNREACHABLE(). The risk for
taking the patch should be rather low, but you have the last saying,
of course.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/include/xen/lib.h | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index 05ee1e18af..b8472d753c 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -40,6 +40,16 @@
     unlikely(ret_warn_on_);             \
 })
 
+#define WARN_ONCE() do {                \
+    static bool warned = false;         \
+                                        \
+    if ( !warned )                      \
+    {                                   \
+        warned = true;                  \
+        WARN();                         \
+    }                                   \
+} while (0)
+
 /* All clang versions supported by Xen have _Static_assert. */
 #if defined(__clang__) || \
     (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 6))
@@ -63,7 +73,7 @@
 #define ASSERT_UNREACHABLE() assert_failed("unreachable")
 #else
 #define ASSERT(p) do { if ( 0 && (p) ) {} } while (0)
-#define ASSERT_UNREACHABLE() do { } while (0)
+#define ASSERT_UNREACHABLE() WARN_ONCE()
 #endif
 
 #define ABS(_x) ({                              \
-- 
2.35.3


