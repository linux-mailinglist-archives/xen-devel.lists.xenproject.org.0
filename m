Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1FF87B86F
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 08:20:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692892.1080533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkfOL-0005vH-Cl; Thu, 14 Mar 2024 07:20:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692892.1080533; Thu, 14 Mar 2024 07:20:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkfOL-0005rn-9x; Thu, 14 Mar 2024 07:20:41 +0000
Received: by outflank-mailman (input) for mailman id 692892;
 Thu, 14 Mar 2024 07:20:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CDQ4=KU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rkfOK-0005rB-A4
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 07:20:40 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b4f105f-e1d3-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 08:20:38 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C04EB21CF1;
 Thu, 14 Mar 2024 07:20:37 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7C81F13977;
 Thu, 14 Mar 2024 07:20:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UhLnHEWl8mU9DgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 14 Mar 2024 07:20:37 +0000
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
X-Inumbo-ID: 5b4f105f-e1d3-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1710400837; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X3wK2bnFDRfOZpwTuXtrdzOv2dz+Aoq7ilBYLmKlrOE=;
	b=XtEVciV9XSAXvu2Ftt1+X3UG5p21zNQSUHdmIzP+sWEnRFuJ1G6mR2eE0/t473+PkyA25j
	XqTgtWkod6gbedfJlR9XQQ2vMSKGiSIxld5Kemrw6yTApNUKqr60B0paxCi0vZnP6j5O4X
	adH0J5hyzmO3FanzLPuyZPZOWSePXPk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1710400837; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X3wK2bnFDRfOZpwTuXtrdzOv2dz+Aoq7ilBYLmKlrOE=;
	b=XtEVciV9XSAXvu2Ftt1+X3UG5p21zNQSUHdmIzP+sWEnRFuJ1G6mR2eE0/t473+PkyA25j
	XqTgtWkod6gbedfJlR9XQQ2vMSKGiSIxld5Kemrw6yTApNUKqr60B0paxCi0vZnP6j5O4X
	adH0J5hyzmO3FanzLPuyZPZOWSePXPk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 01/13] xen/spinlock: remove misra rule 21.1 violations
Date: Thu, 14 Mar 2024 08:20:17 +0100
Message-Id: <20240314072029.16937-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240314072029.16937-1-jgross@suse.com>
References: <20240314072029.16937-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: +
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=XtEVciV9
X-Spamd-Result: default: False [1.19 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-0.00)[13.89%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 URIBL_BLOCKED(0.00)[suse.com:email,suse.com:dkim];
	 FROM_HAS_DN(0.00)[];
	 DWL_DNSWL_MED(-2.00)[suse.com:dkim];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_IN_DNSWL_HI(-0.50)[2a07:de40:b281:106:10:150:64:167:received];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 1.19
X-Spam-Level: *
X-Rspamd-Queue-Id: C04EB21CF1
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

In xen spinlock code there are several violations of MISRA rule 21.1
(identifiers starting with "__" or "_[A-Z]").

Fix them by using trailing underscores instead.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V5:
- new patch (Julien Grall)
---
 xen/include/xen/spinlock.h | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index e351fc9995..8a443efc19 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -22,7 +22,7 @@ union lock_debug {
         bool unseen:1;
     };
 };
-#define _LOCK_DEBUG { .val = LOCK_DEBUG_INITVAL }
+#define LOCK_DEBUG_ { .val = LOCK_DEBUG_INITVAL }
 void check_lock(union lock_debug *debug, bool try);
 void lock_enter(const union lock_debug *debug);
 void lock_exit(const union lock_debug *debug);
@@ -30,7 +30,7 @@ void spin_debug_enable(void);
 void spin_debug_disable(void);
 #else
 union lock_debug { };
-#define _LOCK_DEBUG { }
+#define LOCK_DEBUG_ { }
 #define check_lock(l, t) ((void)0)
 #define lock_enter(l) ((void)0)
 #define lock_exit(l) ((void)0)
@@ -95,27 +95,27 @@ struct lock_profile_qhead {
     int32_t                   idx;     /* index for printout */
 };
 
-#define _LOCK_PROFILE(lockname) { .name = #lockname, .lock = &(lockname), }
-#define _LOCK_PROFILE_PTR(name)                                               \
-    static struct lock_profile * const __lock_profile_##name                  \
+#define LOCK_PROFILE_(lockname) { .name = #lockname, .lock = &(lockname), }
+#define LOCK_PROFILE_PTR_(name)                                               \
+    static struct lock_profile * const lock_profile__##name                   \
     __used_section(".lockprofile.data") =                                     \
-    &__lock_profile_data_##name
-#define _SPIN_LOCK_UNLOCKED(x) {                                              \
+    &lock_profile_data__##name
+#define SPIN_LOCK_UNLOCKED_(x) {                                              \
     .recurse_cpu = SPINLOCK_NO_CPU,                                           \
-    .debug =_LOCK_DEBUG,                                                      \
+    .debug = LOCK_DEBUG_,                                                     \
     .profile = x,                                                             \
 }
-#define SPIN_LOCK_UNLOCKED _SPIN_LOCK_UNLOCKED(NULL)
+#define SPIN_LOCK_UNLOCKED SPIN_LOCK_UNLOCKED_(NULL)
 #define DEFINE_SPINLOCK(l)                                                    \
-    spinlock_t l = _SPIN_LOCK_UNLOCKED(NULL);                                 \
-    static struct lock_profile __lock_profile_data_##l = _LOCK_PROFILE(l);    \
-    _LOCK_PROFILE_PTR(l)
+    spinlock_t l = SPIN_LOCK_UNLOCKED_(NULL);                                 \
+    static struct lock_profile lock_profile_data__##l = LOCK_PROFILE_(l);     \
+    LOCK_PROFILE_PTR_(l)
 
 #define spin_lock_init_prof(s, l)                                             \
     do {                                                                      \
         struct lock_profile *prof;                                            \
         prof = xzalloc(struct lock_profile);                                  \
-        (s)->l = (spinlock_t)_SPIN_LOCK_UNLOCKED(prof);                       \
+        (s)->l = (spinlock_t)SPIN_LOCK_UNLOCKED_(prof);                       \
         if ( !prof )                                                          \
         {                                                                     \
             printk(XENLOG_WARNING                                             \
@@ -149,7 +149,7 @@ struct lock_profile_qhead { };
 
 #define SPIN_LOCK_UNLOCKED {                                                  \
     .recurse_cpu = SPINLOCK_NO_CPU,                                           \
-    .debug =_LOCK_DEBUG,                                                      \
+    .debug = LOCK_DEBUG_,                                                     \
 }
 #define DEFINE_SPINLOCK(l) spinlock_t l = SPIN_LOCK_UNLOCKED
 
-- 
2.35.3


