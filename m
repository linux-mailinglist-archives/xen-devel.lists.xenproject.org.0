Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJg4Kg7hsmmXQgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 16:51:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B157274E67
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 16:51:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252554.1549202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0iK0-00086I-OZ; Thu, 12 Mar 2026 15:51:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252554.1549202; Thu, 12 Mar 2026 15:51:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0iK0-00084L-Kb; Thu, 12 Mar 2026 15:51:36 +0000
Received: by outflank-mailman (input) for mailman id 1252554;
 Thu, 12 Mar 2026 15:51:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGPq=BM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w0iJz-0006Wy-3o
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 15:51:35 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5802642e-1e2b-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Mar 2026 16:51:33 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3CCCE5BF78;
 Thu, 12 Mar 2026 15:51:33 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 17D3140047;
 Thu, 12 Mar 2026 15:51:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id oBJEBAXhsmlFTQAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 12 Mar 2026 15:51:33 +0000
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
X-Inumbo-ID: 5802642e-1e2b-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773330693; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R7AkpMLYUCg9U/TuLd24tXnRN78cZgI9ZdfIFLQokTk=;
	b=kSVxdU/+xtRELQvXNRr33Vuqbv4dV42vRrWa71olS+ee+FAm0dZpzPh9fEw+ZY2xQeqdC1
	to4UZ1UoKlvrkBMfSlC/mgFVZoJcxhJ/J/RcBWsScnahu1Ow4RSzmqKSH9FaU881GlubrR
	RZmTDMvxd6OUfV2mvFhollWIM2me8Ko=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="kSVxdU/+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773330693; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R7AkpMLYUCg9U/TuLd24tXnRN78cZgI9ZdfIFLQokTk=;
	b=kSVxdU/+xtRELQvXNRr33Vuqbv4dV42vRrWa71olS+ee+FAm0dZpzPh9fEw+ZY2xQeqdC1
	to4UZ1UoKlvrkBMfSlC/mgFVZoJcxhJ/J/RcBWsScnahu1Ow4RSzmqKSH9FaU881GlubrR
	RZmTDMvxd6OUfV2mvFhollWIM2me8Ko=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2 5/8] docs: add man page for xenstore-watch
Date: Thu, 12 Mar 2026 16:50:59 +0100
Message-ID: <20260312155102.2862824-6-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312155102.2862824-1-jgross@suse.com>
References: <20260312155102.2862824-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: 8B157274E67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There is no man page for xenstore-watch, add it.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- add -h parameter description (Andrew Cooper)
---
 docs/man/xenstore-watch.1.pod | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 docs/man/xenstore-watch.1.pod

diff --git a/docs/man/xenstore-watch.1.pod b/docs/man/xenstore-watch.1.pod
new file mode 100644
index 0000000000..de28d380b7
--- /dev/null
+++ b/docs/man/xenstore-watch.1.pod
@@ -0,0 +1,29 @@
+=head1 NAME
+
+xenstore-watch - wait for Xenstore watch events
+
+=head1 SYNOPSIS
+
+B<xenstore-watch> [I<OPTION>]... [I<PATH>]...
+
+=head1 DESCRIPTION
+
+Set Xenstore watches to the specified I<PATH>s and print the path for each
+event happening.
+
+=over
+
+=item B<-h>
+
+Show the usage information for xenstore-watch and exit the program.
+
+=item B<-n> B<NR>
+
+Stop waiting after having received B<NR> watch events.
+
+=back
+
+=head1 BUGS
+
+Send bugs to xen-devel@lists.xenproject.org, see
+https://wiki.xenproject.org/wiki/Reporting_Bugs_against_Xen_Project on how to send bug reports.
-- 
2.53.0


