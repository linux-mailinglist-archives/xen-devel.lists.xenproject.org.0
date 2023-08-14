Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F5477B2E3
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 09:47:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583309.913460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSIJ-0002A8-Js; Mon, 14 Aug 2023 07:47:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583309.913460; Mon, 14 Aug 2023 07:47:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSIJ-00027c-F8; Mon, 14 Aug 2023 07:47:19 +0000
Received: by outflank-mailman (input) for mailman id 583309;
 Mon, 14 Aug 2023 07:47:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzbS=D7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qVSIH-0001Z5-Sf
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 07:47:17 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9b63dc8-3a76-11ee-8613-37d641c3527e;
 Mon, 14 Aug 2023 09:47:16 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E11821FD5F;
 Mon, 14 Aug 2023 07:47:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AE949138EE;
 Mon, 14 Aug 2023 07:47:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dYRaKQPc2WSsQQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 14 Aug 2023 07:47:15 +0000
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
X-Inumbo-ID: c9b63dc8-3a76-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1691999235; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b8MyYs+d/vodapG3SQQVXtJwukWs6Vue7w+HaAcL98U=;
	b=UcuJSnElVBp5KhY7S2J2I8H4Blv76OjxSAHI72PwPbt9uDhUPc8jgR0Q/IUqSmGDN88u5s
	3wr6ZbZcP56VTsx0g6kSKiNHsjKTyDK83p2qaoUF4oX8TVPChPTe2uV/HiBjy5swiJD0Du
	TqZG0BeB8/u09H2ez1QRD5QEkTWkkoM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 01/19] tools/xenstore: make hashtable key parameter const
Date: Mon, 14 Aug 2023 09:46:49 +0200
Message-Id: <20230814074707.27696-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230814074707.27696-1-jgross@suse.com>
References: <20230814074707.27696-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The key is never modified by hashtable code, so it should be marked as
const.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- make value const, too.
V4:
- undo V3 change again (Julien Grall)
---
 tools/xenstore/hashtable.c | 5 +++--
 tools/xenstore/hashtable.h | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/xenstore/hashtable.c b/tools/xenstore/hashtable.c
index 11f6bf8f15..9daddd9782 100644
--- a/tools/xenstore/hashtable.c
+++ b/tools/xenstore/hashtable.c
@@ -11,7 +11,8 @@
 
 struct entry
 {
-    void *k, *v;
+    const void *k;
+    void *v;
     unsigned int h;
     struct entry *next;
 };
@@ -140,7 +141,7 @@ static int hashtable_expand(struct hashtable *h)
     return 0;
 }
 
-int hashtable_add(struct hashtable *h, void *k, void *v)
+int hashtable_add(struct hashtable *h, const void *k, void *v)
 {
     /* This method allows duplicate keys - but they shouldn't be used */
     unsigned int index;
diff --git a/tools/xenstore/hashtable.h b/tools/xenstore/hashtable.h
index 5a2cc4a4be..792f6cda7b 100644
--- a/tools/xenstore/hashtable.h
+++ b/tools/xenstore/hashtable.h
@@ -48,8 +48,8 @@ create_hashtable(const void *ctx, const char *name,
  * If in doubt, remove before insert.
  */
 
-int 
-hashtable_add(struct hashtable *h, void *k, void *v);
+int
+hashtable_add(struct hashtable *h, const void *k, void *v);
 
 /*****************************************************************************
  * hashtable_search
-- 
2.35.3


