Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EdUMQPhsmncQQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 16:51:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 784DF274E33
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 16:51:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252542.1549175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0iJl-00073w-1N; Thu, 12 Mar 2026 15:51:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252542.1549175; Thu, 12 Mar 2026 15:51:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0iJk-00070X-UD; Thu, 12 Mar 2026 15:51:20 +0000
Received: by outflank-mailman (input) for mailman id 1252542;
 Thu, 12 Mar 2026 15:51:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGPq=BM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w0iJi-0006Wy-To
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 15:51:18 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e243145-1e2b-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Mar 2026 16:51:17 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9AD9D4D425;
 Thu, 12 Mar 2026 15:51:16 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 768F140047;
 Thu, 12 Mar 2026 15:51:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id FppjG/Tgsmn7TAAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 12 Mar 2026 15:51:16 +0000
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
X-Inumbo-ID: 4e243145-1e2b-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773330676; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=64En+YQYgXvNWq4oftoVnzADngq8/UtZY61tW+VANyE=;
	b=feB459sCfIJ+OVVPLAdMzwxMFhNaAG4MmbbL+WfbDZ3oiJxZ+lfPQgtXlXXT3mMm7XnuQZ
	sI8nR7VWjqBZ02NhhNNwevN20PDJ3Gm16TREV2+zlSwZlt5Nfd4qb3Z4kIJvc1O4+J8vIq
	kSBZaTAMlrjZgeKIlAvm4vi63MgD4Ns=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773330676; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=64En+YQYgXvNWq4oftoVnzADngq8/UtZY61tW+VANyE=;
	b=feB459sCfIJ+OVVPLAdMzwxMFhNaAG4MmbbL+WfbDZ3oiJxZ+lfPQgtXlXXT3mMm7XnuQZ
	sI8nR7VWjqBZ02NhhNNwevN20PDJ3Gm16TREV2+zlSwZlt5Nfd4qb3Z4kIJvc1O4+J8vIq
	kSBZaTAMlrjZgeKIlAvm4vi63MgD4Ns=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2 2/8] docs: add man page for xenstore-exists
Date: Thu, 12 Mar 2026 16:50:56 +0100
Message-ID: <20260312155102.2862824-3-jgross@suse.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,xenproject.org:email,xenproject.org:url];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 784DF274E33
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There is no man page for xenstore-exists, add it.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- fix title grammar (Andrew Coopoer)
- add -h parameter description (Andrew Cooper)
---
 docs/man/xenstore-exists.1.pod | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 docs/man/xenstore-exists.1.pod

diff --git a/docs/man/xenstore-exists.1.pod b/docs/man/xenstore-exists.1.pod
new file mode 100644
index 0000000000..a6eeb7ff96
--- /dev/null
+++ b/docs/man/xenstore-exists.1.pod
@@ -0,0 +1,25 @@
+=head1 NAME
+
+xenstore-exists - test whether Xenstore key exists
+
+=head1 SYNOPSIS
+
+B<xenstore-exists> I<PATH>
+
+=head1 DESCRIPTION
+
+Tests whether the specified Xenstore I<PATH> is readable and sets
+the exit value accordingly (B<0> if I<PTAH> is readable, B<1> if not).
+
+=over
+
+=item B<-h>
+
+Show the usage information for xenstore-exists and exit the program.
+
+=back
+
+=head1 BUGS
+
+Send bugs to xen-devel@lists.xenproject.org, see
+https://wiki.xenproject.org/wiki/Reporting_Bugs_against_Xen_Project on how to send bug reports.
-- 
2.53.0


