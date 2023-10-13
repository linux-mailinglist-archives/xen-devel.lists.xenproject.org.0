Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C7E7C8263
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 11:42:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616354.958317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrEgy-0001Wq-0Q; Fri, 13 Oct 2023 09:42:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616354.958317; Fri, 13 Oct 2023 09:42:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrEgx-0001T9-TE; Fri, 13 Oct 2023 09:42:47 +0000
Received: by outflank-mailman (input) for mailman id 616354;
 Fri, 13 Oct 2023 09:42:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U36v=F3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qrEgx-0000sq-88
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 09:42:47 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd804b05-69ac-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 11:42:46 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7BF471F37E;
 Fri, 13 Oct 2023 09:42:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3F7281358F;
 Fri, 13 Oct 2023 09:42:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MH1PDhYRKWUoGwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 13 Oct 2023 09:42:46 +0000
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
X-Inumbo-ID: dd804b05-69ac-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1697190166; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lf5ebmk4rqESpA2QH3GbSRR9pcDDDv70JHx4/vbOIrY=;
	b=EZraUrDqS11S7N20qMqVmiQRmuGYCvQGj/vIfUlWdF9O1QDtCoNWCvVmjZw6tvPvlbSTmV
	hotE2qvgDlDaT5ou9SE/1QxbvcuMuEzlzi8aNS/izMvpYK0nW1ZTj77RXWk5Ku7yjEaHmV
	Rsj1gAeqttFyQ9h8XDkA3EYHOVjt2WQ=
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
Subject: [PATCH v2 03/13] xen/spinlock: make spinlock initializers more readable
Date: Fri, 13 Oct 2023 11:42:14 +0200
Message-Id: <20231013094224.7060-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231013094224.7060-1-jgross@suse.com>
References: <20231013094224.7060-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.10
X-Spamd-Result: default: False [-3.10 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 MID_CONTAINS_FROM(1.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

Use named member initializers instead of positional ones for the macros
used to initialize structures.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 xen/include/xen/spinlock.h | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index 4b82739083..bbe1472571 100644
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
 
-#define _LOCK_PROFILE(name) { 0, #name, &name, 0, 0, 0, 0, 0 }
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


