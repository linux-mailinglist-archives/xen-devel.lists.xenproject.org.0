Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIGhIzmwsmmEOwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 13:23:21 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56820271A58
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 13:23:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252262.1549031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0f4G-00074R-DM; Thu, 12 Mar 2026 12:23:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252262.1549031; Thu, 12 Mar 2026 12:23:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0f4G-00072V-8r; Thu, 12 Mar 2026 12:23:08 +0000
Received: by outflank-mailman (input) for mailman id 1252262;
 Thu, 12 Mar 2026 12:23:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGPq=BM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w0f4F-00063r-3d
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 12:23:07 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3837d540-1e0e-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Mar 2026 13:23:04 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 881993E7E4;
 Thu, 12 Mar 2026 12:23:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6250F3FF79;
 Thu, 12 Mar 2026 12:23:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id BaJ2FiiwsmmkbgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 12 Mar 2026 12:23:04 +0000
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
X-Inumbo-ID: 3837d540-1e0e-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773318184; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cew8ONz1GlDtI3N7ZBZEdFx+Io4/1ntEyxcOISKEG90=;
	b=dsK+RkMS3zl7mxLsNRSPS+MOjV5IV9sCF5C9RTnhSg4GL9b03m5XQ+AidsQzOQmE7zyUWa
	Mr142wrM0BtFYQu97q2OPxDo9D/2HukOtaHiPFPnvTTrD1H5rXYx966LDh8wSZ4zUHHnRK
	7BZ2GyORu/hIuKRYSdrYIuqkgMTDWY4=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773318184; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cew8ONz1GlDtI3N7ZBZEdFx+Io4/1ntEyxcOISKEG90=;
	b=dsK+RkMS3zl7mxLsNRSPS+MOjV5IV9sCF5C9RTnhSg4GL9b03m5XQ+AidsQzOQmE7zyUWa
	Mr142wrM0BtFYQu97q2OPxDo9D/2HukOtaHiPFPnvTTrD1H5rXYx966LDh8wSZ4zUHHnRK
	7BZ2GyORu/hIuKRYSdrYIuqkgMTDWY4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 4/4] docs: add man page for xenstore-watch
Date: Thu, 12 Mar 2026 13:22:40 +0100
Message-ID: <20260312122240.2784725-5-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312122240.2784725-1-jgross@suse.com>
References: <20260312122240.2784725-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spam-Flag: NO
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 56820271A58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There is no man page for xenstore-watch, add it.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 docs/man/xenstore-watch.1.pod | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 docs/man/xenstore-watch.1.pod

diff --git a/docs/man/xenstore-watch.1.pod b/docs/man/xenstore-watch.1.pod
new file mode 100644
index 0000000000..b9b60c645c
--- /dev/null
+++ b/docs/man/xenstore-watch.1.pod
@@ -0,0 +1,25 @@
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


