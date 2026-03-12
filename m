Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEavNAPhsmncQQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 16:51:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E8D274E34
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 16:51:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252541.1549166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0iJf-0006mA-Pt; Thu, 12 Mar 2026 15:51:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252541.1549166; Thu, 12 Mar 2026 15:51:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0iJf-0006kf-MA; Thu, 12 Mar 2026 15:51:15 +0000
Received: by outflank-mailman (input) for mailman id 1252541;
 Thu, 12 Mar 2026 15:51:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGPq=BM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w0iJe-0006Wy-SV
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 15:51:14 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ac5963a-1e2b-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Mar 2026 16:51:11 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 16F815BF65;
 Thu, 12 Mar 2026 15:51:11 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E6F5D40047;
 Thu, 12 Mar 2026 15:51:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id w9fRNu7gsmnyTAAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 12 Mar 2026 15:51:10 +0000
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
X-Inumbo-ID: 4ac5963a-1e2b-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773330671; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0+JIAs1pcc2G6ixxT0YQyIlB5jR3EwTDQy9/ZF90Iog=;
	b=ON+CzDybp8wGKKYzLSH92G/yDt81Sz6JxmUCQ71OB7E54cwLxECDubPYvcUJZO9Bp4fx/s
	LSMdXu37qONVpLhfFlW18tTR5jIj7hnlDk1/tvsAhVhX6MzS+6oyeyEJsJDRXAlT66gvjS
	+gGgZRUNhQ6N5v+M0mKOsqkq/66bVXc=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773330671; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0+JIAs1pcc2G6ixxT0YQyIlB5jR3EwTDQy9/ZF90Iog=;
	b=ON+CzDybp8wGKKYzLSH92G/yDt81Sz6JxmUCQ71OB7E54cwLxECDubPYvcUJZO9Bp4fx/s
	LSMdXu37qONVpLhfFlW18tTR5jIj7hnlDk1/tvsAhVhX6MzS+6oyeyEJsJDRXAlT66gvjS
	+gGgZRUNhQ6N5v+M0mKOsqkq/66bVXc=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2 1/8] docs: add -h parameter description to xenstore-* man pages
Date: Thu, 12 Mar 2026 16:50:55 +0100
Message-ID: <20260312155102.2862824-2-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312155102.2862824-1-jgross@suse.com>
References: <20260312155102.2862824-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 79E8D274E34
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The "-h" parameter is missing in the man pages of the xenstore-*
programs.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 docs/man/xenstore-chmod.1.pod | 4 ++++
 docs/man/xenstore-ls.1.pod    | 4 ++++
 docs/man/xenstore-read.1.pod  | 4 ++++
 docs/man/xenstore-write.1.pod | 4 ++++
 4 files changed, 16 insertions(+)

diff --git a/docs/man/xenstore-chmod.1.pod b/docs/man/xenstore-chmod.1.pod
index d221f5dffc..ca1a2172f9 100644
--- a/docs/man/xenstore-chmod.1.pod
+++ b/docs/man/xenstore-chmod.1.pod
@@ -42,6 +42,10 @@ write, and set permissions).
 
 =over
 
+=item B<-h>
+
+Show the usage information for xenstore-chmod and exit the program.
+
 =item B<-r>
 
 Apply the permissions to the key and all its I<children>.
diff --git a/docs/man/xenstore-ls.1.pod b/docs/man/xenstore-ls.1.pod
index a9f8b32653..b070e8368c 100644
--- a/docs/man/xenstore-ls.1.pod
+++ b/docs/man/xenstore-ls.1.pod
@@ -13,6 +13,10 @@ using a nested, tree-like view.
 
 =over
 
+=item B<-h>
+
+Show the usage information for xenstore-ls and exit the program.
+
 =item B<-f>
 
 Show the full path for all keys.
diff --git a/docs/man/xenstore-read.1.pod b/docs/man/xenstore-read.1.pod
index c7768cbbe5..7fe63268bd 100644
--- a/docs/man/xenstore-read.1.pod
+++ b/docs/man/xenstore-read.1.pod
@@ -12,6 +12,10 @@ Read values of one or more Xenstore I<PATH>s.
 
 =over
 
+=item B<-h>
+
+Show the usage information for xenstore-read and exit the program.
+
 =item B<-p>
 
 Prefix value with key name.
diff --git a/docs/man/xenstore-write.1.pod b/docs/man/xenstore-write.1.pod
index 74f80f7b1b..33a8af2db4 100644
--- a/docs/man/xenstore-write.1.pod
+++ b/docs/man/xenstore-write.1.pod
@@ -13,6 +13,10 @@ provided to write them at once - in one Xenstore transaction.
 
 =over
 
+=item B<-h>
+
+Show the usage information for xenstore-write and exit the program.
+
 =item B<-R>
 
 Write raw value, skip parsing escaped characters (\x..).
-- 
2.53.0


