Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D71A373C8
	for <lists+xen-devel@lfdr.de>; Sun, 16 Feb 2025 11:24:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889558.1298638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjbol-00086n-GE; Sun, 16 Feb 2025 10:24:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889558.1298638; Sun, 16 Feb 2025 10:24:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjbol-00083l-DF; Sun, 16 Feb 2025 10:24:07 +0000
Received: by outflank-mailman (input) for mailman id 889558;
 Sun, 16 Feb 2025 10:24:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6kBj=VH=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tjboj-00083Q-La
 for xen-devel@lists.xenproject.org; Sun, 16 Feb 2025 10:24:05 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22e9d895-ec50-11ef-9896-31a8f345e629;
 Sun, 16 Feb 2025 11:24:00 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 65D031F381;
 Sun, 16 Feb 2025 10:23:59 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 10ED3136AD;
 Sun, 16 Feb 2025 10:23:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id SNBSAr+8sWe5VQAAD6G6ig
 (envelope-from <jgross@suse.com>); Sun, 16 Feb 2025 10:23:59 +0000
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
X-Inumbo-ID: 22e9d895-ec50-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1739701439; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=tQLejpycJyfhgeuWoEwhrhOH4VfkZDJL/McppNVy4fA=;
	b=pfHqMfbVM7BZ2zLQ9BzkZYVKybJCixp6IlwxsSWbjhkektA9xjqBJXRilk83L0wJjEjxvU
	6fX1EmRBIjxX6E23KhVxB4/2O0yJDbiwyirnYULdZgRnca9wfq3T+aAZBTnKQWUH45uMaN
	wlMxhw+Gr2S6KSQtYFqHD0oCk4i7vCk=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=pfHqMfbV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1739701439; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=tQLejpycJyfhgeuWoEwhrhOH4VfkZDJL/McppNVy4fA=;
	b=pfHqMfbVM7BZ2zLQ9BzkZYVKybJCixp6IlwxsSWbjhkektA9xjqBJXRilk83L0wJjEjxvU
	6fX1EmRBIjxX6E23KhVxB4/2O0yJDbiwyirnYULdZgRnca9wfq3T+aAZBTnKQWUH45uMaN
	wlMxhw+Gr2S6KSQtYFqHD0oCk4i7vCk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/2] xen/list: some fixes in list.h
Date: Sun, 16 Feb 2025 11:23:54 +0100
Message-ID: <20250216102356.18801-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 65D031F381
X-Spam-Score: -1.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,suse.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Patch 1 is a fix for an undefined behavior reported by Andrew. I think
this patch should be considered for 4.20.

Patch 2 is fixing wrong comments in list.h I stumbled over when doing
patch 1. As it is absolutely no risk involved with this patch, I think
it should be 4.20 material, too.

There are some additional cleanups possible in list.h, which I can do
for 4.21 when wanted:

- Removal of list_prepare_entry(), which seems to be unused since
  some time now (and it seems to be thought of as a list.h internal
  macro only).

- More questionable: removal of unused iterators, like e.g.
  list_for_each_entry_continue() or list_for_each_entry_from(). The main
  idea to keep list.h in sync with the Linux version would be violated
  by this removal, though. OTOH with patch 1 they are out of sync anyway
  now, but I'm planning to submit a Linux kernel patch fixing the UB in
  the Linux variant, too.

Juergen Gross (2):
  xen/list: avoid UB in list iterators
  xen/list: fix comments in include/xen/list.h

 xen/include/xen/list.h | 144 +++++++++++++++++++++++++----------------
 1 file changed, 89 insertions(+), 55 deletions(-)

-- 
2.43.0


