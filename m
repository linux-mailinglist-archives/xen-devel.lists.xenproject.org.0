Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0970187B89B
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 08:32:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692937.1080683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkfZh-0007CI-Ag; Thu, 14 Mar 2024 07:32:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692937.1080683; Thu, 14 Mar 2024 07:32:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkfZh-00078f-6O; Thu, 14 Mar 2024 07:32:25 +0000
Received: by outflank-mailman (input) for mailman id 692937;
 Thu, 14 Mar 2024 07:32:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CDQ4=KU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rkfP8-0005cd-IZ
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 07:21:30 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a07dfa7-e1d3-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 08:21:29 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7881E21CCF;
 Thu, 14 Mar 2024 07:21:29 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2C5B413977;
 Thu, 14 Mar 2024 07:21:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id pRJvCXml8mV4DgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 14 Mar 2024 07:21:29 +0000
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
X-Inumbo-ID: 7a07dfa7-e1d3-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1710400889; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lmSzZbPq+fuy/WPTZvVH6l4HYZ5NaZICGCs9qLuY+8E=;
	b=QtyrVSiL8myusCEnPXafNPhTR2V+wduG3G6xGsJX/oqnOWhS+maITNelnRsSaBaFjqi6bC
	M73SkcYctb9Vd+z0bT3jeNCpUEVs3K4x5b/GkYNsoFIG1MFztH1ux88W166noW6hNbXGmC
	JfnKCIfnn/XLqxSdbs+sEikhsZUAiBg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1710400889; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lmSzZbPq+fuy/WPTZvVH6l4HYZ5NaZICGCs9qLuY+8E=;
	b=QtyrVSiL8myusCEnPXafNPhTR2V+wduG3G6xGsJX/oqnOWhS+maITNelnRsSaBaFjqi6bC
	M73SkcYctb9Vd+z0bT3jeNCpUEVs3K4x5b/GkYNsoFIG1MFztH1ux88W166noW6hNbXGmC
	JfnKCIfnn/XLqxSdbs+sEikhsZUAiBg=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 10/13] xen/spinlock: let all is_locked and trylock variants return bool
Date: Thu, 14 Mar 2024 08:20:26 +0100
Message-Id: <20240314072029.16937-11-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240314072029.16937-1-jgross@suse.com>
References: <20240314072029.16937-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: +
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=QtyrVSiL
X-Spamd-Result: default: False [1.19 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 DWL_DNSWL_MED(-2.00)[suse.com:dkim];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_IN_DNSWL_HI(-0.50)[2a07:de40:b281:106:10:150:64:167:received];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[28.51%]
X-Spam-Score: 1.19
X-Spam-Level: *
X-Rspamd-Queue-Id: 7881E21CCF
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

Switch the remaining trylock and is_locked variants to return bool.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V5:
- new patch (Jan Beulich)
---
 xen/common/spinlock.c      | 4 ++--
 xen/include/xen/spinlock.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index a88ad9b93c..b28239f74d 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -393,7 +393,7 @@ static bool always_inline spin_is_locked_common(const spinlock_tickets_t *t)
     return t->head != t->tail;
 }
 
-int _spin_is_locked(const spinlock_t *lock)
+bool _spin_is_locked(const spinlock_t *lock)
 {
     return spin_is_locked_common(&lock->tickets);
 }
@@ -429,7 +429,7 @@ static bool always_inline spin_trylock_common(spinlock_tickets_t *t,
     return true;
 }
 
-int _spin_trylock(spinlock_t *lock)
+bool _spin_trylock(spinlock_t *lock)
 {
     return spin_trylock_common(&lock->tickets, &lock->debug, LOCK_PROFILE_PAR);
 }
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index 181e5c7d35..1b50a7e6a0 100644
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


