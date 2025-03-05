Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 255B6A4F92E
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 09:52:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901835.1309760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpkU8-0000FL-IH; Wed, 05 Mar 2025 08:52:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901835.1309760; Wed, 05 Mar 2025 08:52:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpkU8-0000Dt-F4; Wed, 05 Mar 2025 08:52:12 +0000
Received: by outflank-mailman (input) for mailman id 901835;
 Wed, 05 Mar 2025 08:52:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/re5=VY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tpkU6-0000Dn-QH
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 08:52:10 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d1dcd6e-f99f-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 09:52:05 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 27B3421199;
 Wed,  5 Mar 2025 08:52:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CF2BC13939;
 Wed,  5 Mar 2025 08:52:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4kCsMLQQyGdSYAAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 05 Mar 2025 08:52:04 +0000
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
X-Inumbo-ID: 1d1dcd6e-f99f-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1741164725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=I5Bc9rU0KT2B8+T8rdQdBb6mywfIx5ZdefRDz/gR084=;
	b=cBnylPGgHI8W0cfwahhf1qDi1l+ltYs4y08oRp7U//Szs1bBLxlt+6hQK5t6cWaOOTvUn1
	U0QeLjOWtqM57s1m2RjnOmkUislCDPoiiLL1QSuMtUYLEH0D/aFEfHl38oZiOfTV4x4Jwh
	bCIh9Y7AMw5lU1lCaJOeBG2v43dntNo=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=cBnylPGg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1741164725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=I5Bc9rU0KT2B8+T8rdQdBb6mywfIx5ZdefRDz/gR084=;
	b=cBnylPGgHI8W0cfwahhf1qDi1l+ltYs4y08oRp7U//Szs1bBLxlt+6hQK5t6cWaOOTvUn1
	U0QeLjOWtqM57s1m2RjnOmkUislCDPoiiLL1QSuMtUYLEH0D/aFEfHl38oZiOfTV4x4Jwh
	bCIh9Y7AMw5lU1lCaJOeBG2v43dntNo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] docs: fix INTRODUCE description in xenstore.txt
Date: Wed,  5 Mar 2025 09:52:01 +0100
Message-ID: <20250305085201.14258-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 27B3421199
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

The description of the Xenstore INTRODUCE command is still referencing
xend. Fix that.

While at it, make clear that the Xenstore implementation is allowed
to ignore the specified gfn and use the Xenstore reserved grant id
GNTTAB_RESERVED_XENSTORE instead.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 docs/misc/xenstore.txt | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/docs/misc/xenstore.txt b/docs/misc/xenstore.txt
index 38015835b1..d894d24d11 100644
--- a/docs/misc/xenstore.txt
+++ b/docs/misc/xenstore.txt
@@ -286,7 +286,7 @@ TRANSACTION_END		F|
 INTRODUCE		<domid>|<gfn>|<evtchn>|?
 	Notifies xenstored to communicate with this domain.
 
-	INTRODUCE is currently only used by xend (during domain
+	INTRODUCE is currently only used by xen tools (during domain
 	startup and various forms of restore and resume), and
 	xenstored prevents its use other than by dom0.
 
@@ -299,6 +299,10 @@ INTRODUCE		<domid>|<gfn>|<evtchn>|?
 	for example passing a high-bit-set 32-bit gfn as an unsigned
 	decimal will attempt to use 0x7fffffff instead (!).
 
+	Xenstored might ignore the <gfn> value and use the reserved
+	grant table entry GNTTAB_RESERVED_XENSTORE instead for mapping
+	the Xenstore interface page of the guest.
+
 RELEASE			<domid>|
 	Manually requests that xenstored disconnect from the domain.
 	The event channel is unbound at the xenstored end and the page
-- 
2.43.0


