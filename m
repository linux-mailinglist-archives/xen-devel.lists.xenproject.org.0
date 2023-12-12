Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B44980E817
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 10:47:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652845.1018910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCzMd-0007Lk-9z; Tue, 12 Dec 2023 09:47:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652845.1018910; Tue, 12 Dec 2023 09:47:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCzMd-0007It-4a; Tue, 12 Dec 2023 09:47:43 +0000
Received: by outflank-mailman (input) for mailman id 652845;
 Tue, 12 Dec 2023 09:47:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/k62=HX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rCzMa-0007Gv-U7
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 09:47:40 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d061412-98d3-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 10:47:40 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 74EE5224B7;
 Tue, 12 Dec 2023 09:47:39 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 3BE6E139E9;
 Tue, 12 Dec 2023 09:47:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id C59eDTsseGWwfgAAn2gu4w
 (envelope-from <jgross@suse.com>); Tue, 12 Dec 2023 09:47:39 +0000
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
X-Inumbo-ID: 7d061412-98d3-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702374459; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=doNpwSeReZ+USBSQcgU+UndKZ1tREobYqeEPZw9GeWA=;
	b=PNX5+Ub7qOIAHZAg3mwdjS51i1StvDwvNPx66nLRRjnlMAGV71xGdpFBAKLUegx2yVcQMO
	6PzMf9HqRheNMcxewW2D7KE6S6J701EC31h19BB0/BcKzGvHcfGc5CJtqrGMTc5xO+g8lR
	bh4UzrnJmW+Cw3F7rDsZjxT5XWIa3gg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702374459; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=doNpwSeReZ+USBSQcgU+UndKZ1tREobYqeEPZw9GeWA=;
	b=PNX5+Ub7qOIAHZAg3mwdjS51i1StvDwvNPx66nLRRjnlMAGV71xGdpFBAKLUegx2yVcQMO
	6PzMf9HqRheNMcxewW2D7KE6S6J701EC31h19BB0/BcKzGvHcfGc5CJtqrGMTc5xO+g8lR
	bh4UzrnJmW+Cw3F7rDsZjxT5XWIa3gg=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 02/12] xen/spinlock: make spinlock initializers more readable
Date: Tue, 12 Dec 2023 10:47:15 +0100
Message-Id: <20231212094725.22184-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231212094725.22184-1-jgross@suse.com>
References: <20231212094725.22184-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: ***************
X-Spam-Flag: YES
X-Spam-Score: 15.00
X-Spam-Level: 
X-Rspamd-Server: rspamd1
X-Spamd-Result: default: False [-0.81 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 DMARC_POLICY_ALLOW(0.00)[suse.com,quarantine];
	 DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-3.00)[100.00%];
	 ARC_NA(0.00)[];
	 R_SPF_FAIL(0.00)[-all];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 SPAM_FLAG(5.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 WHITELIST_DMARC(-7.00)[suse.com:D:+];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Rspamd-Queue-Id: 74EE5224B7
X-Spam-Flag: NO
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=PNX5+Ub7;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=fail (smtp-out1.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:98 as permitted sender) smtp.mailfrom=jgross@suse.com
X-Spamd-Bar: /
X-Spam-Score: -0.81

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
index c44e7d4929..1cd9120eac 100644
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


