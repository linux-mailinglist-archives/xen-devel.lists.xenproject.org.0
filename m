Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2317F1239
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 12:39:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636633.992258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r52cO-0005HS-4h; Mon, 20 Nov 2023 11:39:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636633.992258; Mon, 20 Nov 2023 11:39:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r52cO-0005DX-0Z; Mon, 20 Nov 2023 11:39:08 +0000
Received: by outflank-mailman (input) for mailman id 636633;
 Mon, 20 Nov 2023 11:39:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WPLm=HB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r52cN-0005BS-2Q
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 11:39:07 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68624bf4-8799-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 12:39:05 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6B5221F85D;
 Mon, 20 Nov 2023 11:39:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 28E4213499;
 Mon, 20 Nov 2023 11:39:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id h0ycCFhFW2XYPQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 20 Nov 2023 11:39:04 +0000
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
X-Inumbo-ID: 68624bf4-8799-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1700480344; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OU0wp6/cfvoXHBxh5ftXVgQk6pxaDg52jlXuCjTjR+I=;
	b=DqURFbNIzy/Znk68IgW7n6vLyCNKG3GMU4zi+y7g/LBNxahYDJg+luvGu/8ZzwWon8Dp77
	wk58zKfU/iMHut0QMbYYxAzwprlw0uKaUsJDYGGcyCXHxum3XV0mAmx9LuLXtJmNgaImyr
	ndAeLK3b5/66XKFLowWIkzq8XF/IVdQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: javi.merino@cloud.com,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 03/13] xen/spinlock: make spinlock initializers more readable
Date: Mon, 20 Nov 2023 12:38:32 +0100
Message-Id: <20231120113842.5897-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231120113842.5897-1-jgross@suse.com>
References: <20231120113842.5897-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO

Use named member initializers instead of positional ones for the macros
used to initialize structures.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
V2:
- new patch
---
 xen/include/xen/spinlock.h | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index 02a062a5b0..bbe1472571 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -21,7 +21,7 @@ union lock_debug {
         bool unseen:1;
     };
 };
-#define _LOCK_DEBUG { LOCK_DEBUG_INITVAL }
+#define _LOCK_DEBUG { .val = LOCK_DEBUG_INITVAL }
 void check_lock(union lock_debug *debug, bool try);
 void lock_enter(const union lock_debug *debug);
 void lock_exit(const union lock_debug *debug);
@@ -94,12 +94,16 @@ struct lock_profile_qhead {
     int32_t                   idx;     /* index for printout */
 };
 
-#define _LOCK_PROFILE(name) { NULL, #name, &name, 0, 0, 0, 0, 0 }
+#define _LOCK_PROFILE(lockname) { .name = #lockname, .lock = &lockname, }
 #define _LOCK_PROFILE_PTR(name)                                               \
     static struct lock_profile * const __lock_profile_##name                  \
     __used_section(".lockprofile.data") =                                     \
     &__lock_profile_data_##name
-#define _SPIN_LOCK_UNLOCKED(x) { { 0 }, SPINLOCK_NO_CPU, 0, _LOCK_DEBUG, x }
+#define _SPIN_LOCK_UNLOCKED(x) {                                              \
+    .recurse_cpu = SPINLOCK_NO_CPU,                                           \
+    .debug =_LOCK_DEBUG,                                                      \
+    .profile = x,                                                             \
+}
 #define SPIN_LOCK_UNLOCKED _SPIN_LOCK_UNLOCKED(NULL)
 #define DEFINE_SPINLOCK(l)                                                    \
     spinlock_t l = _SPIN_LOCK_UNLOCKED(NULL);                                 \
@@ -142,7 +146,10 @@ extern void cf_check spinlock_profile_reset(unsigned char key);
 
 struct lock_profile_qhead { };
 
-#define SPIN_LOCK_UNLOCKED { { 0 }, SPINLOCK_NO_CPU, 0, _LOCK_DEBUG }
+#define SPIN_LOCK_UNLOCKED {                                                  \
+    .recurse_cpu = SPINLOCK_NO_CPU,                                           \
+    .debug =_LOCK_DEBUG,                                                      \
+}
 #define DEFINE_SPINLOCK(l) spinlock_t l = SPIN_LOCK_UNLOCKED
 
 #define spin_lock_init_prof(s, l) spin_lock_init(&((s)->l))
-- 
2.35.3


