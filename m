Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B51F9A543E6
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 08:48:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903017.1310937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq5xY-0004Or-1x; Thu, 06 Mar 2025 07:48:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903017.1310937; Thu, 06 Mar 2025 07:48:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq5xX-0004Mp-V5; Thu, 06 Mar 2025 07:47:59 +0000
Received: by outflank-mailman (input) for mailman id 903017;
 Thu, 06 Mar 2025 07:47:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TCcn=VZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tq5xW-0004Mi-F9
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 07:47:58 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51364355-fa5f-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 08:47:56 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AD0081F385;
 Thu,  6 Mar 2025 07:47:55 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5E5F413A61;
 Thu,  6 Mar 2025 07:47:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id fd8eFStTyWf+dAAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 06 Mar 2025 07:47:55 +0000
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
X-Inumbo-ID: 51364355-fa5f-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1741247275; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IXajTnQR6rguwzjmxMX4Wjp94Ht5U2Pcz/IXQXqMUu8=;
	b=FF7Les/tnzWnKSZnD5kBac+Z59P2OIaD9j+Az4jc2In4kHQ7t1i7rOEUosDZ0DKbxQ3pdx
	FvvhuoV8X7nbQDwMQPg/3lULgbqHEhrj1UUFInScPZ6XX3Zk8XRiJtHDlKGTSUA/1F656c
	W2i8zupzweTNS6HQlFAogM/wCs4GQhE=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="FF7Les/t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1741247275; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IXajTnQR6rguwzjmxMX4Wjp94Ht5U2Pcz/IXQXqMUu8=;
	b=FF7Les/tnzWnKSZnD5kBac+Z59P2OIaD9j+Az4jc2In4kHQ7t1i7rOEUosDZ0DKbxQ3pdx
	FvvhuoV8X7nbQDwMQPg/3lULgbqHEhrj1UUFInScPZ6XX3Zk8XRiJtHDlKGTSUA/1F656c
	W2i8zupzweTNS6HQlFAogM/wCs4GQhE=
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
Subject: [PATCH v2] docs: fix INTRODUCE description in xenstore.txt
Date: Thu,  6 Mar 2025 08:47:52 +0100
Message-ID: <20250306074752.13208-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AD0081F385
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

The description of the Xenstore INTRODUCE command is still referencing
xend. Fix that.

The <evtchn> description is starting with a grammatically wrong
sentence. Fix that.

While at it, make clear that the Xenstore implementation is allowed
to ignore the specified gfn and use the Xenstore reserved grant id
GNTTAB_RESERVED_XENSTORE instead.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- fix <evtchn> description
- reword <gfn> vs. grant usage (Andrew Cooper)
---
 docs/misc/xenstore.txt | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/docs/misc/xenstore.txt b/docs/misc/xenstore.txt
index 38015835b1..7e1f031520 100644
--- a/docs/misc/xenstore.txt
+++ b/docs/misc/xenstore.txt
@@ -286,19 +286,32 @@ TRANSACTION_END		F|
 INTRODUCE		<domid>|<gfn>|<evtchn>|?
 	Notifies xenstored to communicate with this domain.
 
-	INTRODUCE is currently only used by xend (during domain
+	INTRODUCE is currently only used by xen tools (during domain
 	startup and various forms of restore and resume), and
 	xenstored prevents its use other than by dom0.
 
 	<domid> must be a real domain id (not 0 and not a special
 	DOMID_... value).  <gfn> must be a page in that domain
-	represented in signed decimal (!).  <evtchn> must be event
-	channel is an unbound event channel in <domid> (likewise in
-	decimal), on which xenstored will call bind_interdomain.
+	represented in signed decimal (!).  <evtchn> is an unbound
+	event channel in <domid> (likewise in decimal), on which
+	xenstored will call bind_interdomain.
+
 	Violations of these rules may result in undefined behaviour;
 	for example passing a high-bit-set 32-bit gfn as an unsigned
 	decimal will attempt to use 0x7fffffff instead (!).
 
+	The <gfn> field is used by xenstoreds which use foreign
+	mapping to access the ring page.
+
+	Alternatively, Grant 1 (GNTTAB_RESERVED_XENSTORE) is reserved
+	for the same purpose, and is populated by the domain builder
+	on behalf of the guest.  This mechanism is preferred because
+	it reduces the permissions that xenstored needs in order to
+	function.
+
+	Both <gfn> and Grant 1 need to agree, because implementations
+	of xenstored will use one and ignore the other.
+
 RELEASE			<domid>|
 	Manually requests that xenstored disconnect from the domain.
 	The event channel is unbound at the xenstored end and the page
-- 
2.43.0


