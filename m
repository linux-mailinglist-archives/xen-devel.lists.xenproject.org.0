Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AF94AB8D0
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 11:36:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266668.460372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH1Na-00065B-PF; Mon, 07 Feb 2022 10:36:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266668.460372; Mon, 07 Feb 2022 10:36:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH1Na-00063M-LR; Mon, 07 Feb 2022 10:36:18 +0000
Received: by outflank-mailman (input) for mailman id 266668;
 Mon, 07 Feb 2022 10:36:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ddl1=SW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nH1NZ-0005wh-9l
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 10:36:17 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7370740-8801-11ec-8f75-fffcc8bd4f1a;
 Mon, 07 Feb 2022 11:36:16 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D94691F37E;
 Mon,  7 Feb 2022 10:36:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9A00B13B92;
 Mon,  7 Feb 2022 10:36:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4qQ5JB/2AGJeQgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 07 Feb 2022 10:36:15 +0000
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
X-Inumbo-ID: c7370740-8801-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1644230175; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IigLRlJyl3GnO9/rAuPdXj1reb21GnqbYc745JCT4VM=;
	b=h0LiGBDd5zv5AKSm6Q4MIMFe0vZnGMQYKYvU9SREQ4ie7Wq4VKwuZNy5F255pBPwMbF2Iu
	RQBWuubFKmZw7BYQ7O5XbE1BsuEl/wg3fVChg60YT6Y2E/zfKQTRXDZvu8ELXNllnN/8xp
	53J8Y011JjiYTFYaDBS+QamY+n4PGTw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] xen/public: partially revert commit 7c7f7e8fba01
Date: Mon,  7 Feb 2022 11:36:13 +0100
Message-Id: <20220207103613.32260-1-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 7c7f7e8fba01 changed xen/include/public/memory.h in an incompatible
way. Unfortunately the changed parts were already in use in the Linux
kernel, so an update of the header in the kernel would result in a build
breakage.

Even when removing its usage from the kernel the used flag bit should be
marked as reserved in order to avoid to give it a different semantic in
the future.

Do a partial revert of said commit in order to enable the kernel to take
an updated version of memory.h.

Fixes: 7c7f7e8fba01 ("include/public/memory.h: remove the XENMEM_rsrc_acq_caller_owned flag")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/memory.c         |  2 +-
 xen/include/public/memory.h | 12 +++++++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index 0d7c413df8..9b5214a8a9 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1234,7 +1234,7 @@ static int acquire_resource(
     if ( copy_from_guest(&xmar, arg, 1) )
         return -EFAULT;
 
-    if ( xmar.pad != 0 )
+    if ( xmar.flags != 0 )
         return -EINVAL;
 
     /*
diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index 383a9468c3..fd768e0b7b 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -662,7 +662,17 @@ struct xen_mem_acquire_resource {
      * two calls.
      */
     uint32_t nr_frames;
-    uint32_t pad;
+
+    /*
+     * OUT - Must be zero on entry. On return this may contain a bitwise
+     *       OR of the following values.
+     */
+    uint32_t flags;
+
+    /* No longer supported - will be never set */
+#define _XENMEM_rsrc_acq_caller_owned 0
+#define XENMEM_rsrc_acq_caller_owned (1u << _XENMEM_rsrc_acq_caller_owned)
+
     /*
      * IN - the index of the initial frame to be mapped. This parameter
      *      is ignored if nr_frames is 0.  This value may be updated
-- 
2.34.1


