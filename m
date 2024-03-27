Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A680B88E8A0
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 16:23:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698606.1090530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpV7H-0000wB-VA; Wed, 27 Mar 2024 15:23:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698606.1090530; Wed, 27 Mar 2024 15:23:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpV7H-0000s6-RL; Wed, 27 Mar 2024 15:23:03 +0000
Received: by outflank-mailman (input) for mailman id 698606;
 Wed, 27 Mar 2024 15:23:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kcEO=LB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rpV7G-0007fn-Br
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 15:23:02 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5c9d67b-ec4d-11ee-a1ef-f123f15fe8a2;
 Wed, 27 Mar 2024 16:23:00 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6AC1538B5C;
 Wed, 27 Mar 2024 15:23:00 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 3075A13215;
 Wed, 27 Mar 2024 15:23:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id 9IV1CtQ5BGZNfgAAn2gu4w
 (envelope-from <jgross@suse.com>); Wed, 27 Mar 2024 15:23:00 +0000
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
X-Inumbo-ID: e5c9d67b-ec4d-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1711552980; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c8cgLSy0wask2wusg5yB2CZKTJ/Nmqixk9O34STg5Eo=;
	b=SvsGD8lexVPB5vjcWzjfUkSBry2GtNCZ1NUCyiG7IJNtYS/JAMnu1TJqM/J/RaoEeEzwG6
	3LMuC+1MawWMZbEtFDRIIPSuRdi7olmjORl6ouQq8FAGT+S37E0mKJn4/nrI79oNOCiyaT
	8Q0BkBIRKMYtLrLV4NehG6dk9Rx5YaU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1711552980; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c8cgLSy0wask2wusg5yB2CZKTJ/Nmqixk9O34STg5Eo=;
	b=SvsGD8lexVPB5vjcWzjfUkSBry2GtNCZ1NUCyiG7IJNtYS/JAMnu1TJqM/J/RaoEeEzwG6
	3LMuC+1MawWMZbEtFDRIIPSuRdi7olmjORl6ouQq8FAGT+S37E0mKJn4/nrI79oNOCiyaT
	8Q0BkBIRKMYtLrLV4NehG6dk9Rx5YaU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 5/8] xen/spinlock: let all is_locked and trylock variants return bool
Date: Wed, 27 Mar 2024 16:22:26 +0100
Message-Id: <20240327152229.25847-6-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240327152229.25847-1-jgross@suse.com>
References: <20240327152229.25847-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: ***
X-Spam-Score: 3.70
X-Spamd-Result: default: False [3.70 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

Switch the remaining trylock and is_locked variants to return bool.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
V5:
- new patch (Jan Beulich)
---
 xen/common/spinlock.c      | 4 ++--
 xen/include/xen/spinlock.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 5aaca49a61..7ccb725171 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -393,7 +393,7 @@ static bool always_inline spin_is_locked_common(const spinlock_tickets_t *t)
     return t->head != t->tail;
 }
 
-int _spin_is_locked(const spinlock_t *lock)
+bool _spin_is_locked(const spinlock_t *lock)
 {
     /*
      * This function is suitable only for use in ASSERT()s and alike, as it
@@ -433,7 +433,7 @@ static bool always_inline spin_trylock_common(spinlock_tickets_t *t,
     return true;
 }
 
-int _spin_trylock(spinlock_t *lock)
+bool _spin_trylock(spinlock_t *lock)
 {
     return spin_trylock_common(&lock->tickets, &lock->debug, LOCK_PROFILE_PAR);
 }
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index f49ba928f0..3a4092626c 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -234,8 +234,8 @@ void _spin_unlock(spinlock_t *lock);
 void _spin_unlock_irq(spinlock_t *lock);
 void _spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags);
 
-int _spin_is_locked(const spinlock_t *lock);
-int _spin_trylock(spinlock_t *lock);
+bool _spin_is_locked(const spinlock_t *lock);
+bool _spin_trylock(spinlock_t *lock);
 void _spin_barrier(spinlock_t *lock);
 
 static always_inline void spin_lock(spinlock_t *l)
-- 
2.35.3


