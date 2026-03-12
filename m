Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /3BTNgPhsmmWQgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 16:51:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB0B274E35
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 16:51:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252540.1549156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0iJd-0006ZW-IH; Thu, 12 Mar 2026 15:51:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252540.1549156; Thu, 12 Mar 2026 15:51:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0iJd-0006X4-Fk; Thu, 12 Mar 2026 15:51:13 +0000
Received: by outflank-mailman (input) for mailman id 1252540;
 Thu, 12 Mar 2026 15:51:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGPq=BM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w0iJc-0006Wy-J2
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 15:51:12 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47969df3-1e2b-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Mar 2026 16:51:06 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 86F6E4D40A;
 Thu, 12 Mar 2026 15:51:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5D44940047;
 Thu, 12 Mar 2026 15:51:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Zcw7FengsmntTAAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 12 Mar 2026 15:51:05 +0000
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
X-Inumbo-ID: 47969df3-1e2b-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773330665; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=TQU4G2RSwxCfUXXUKJGE4oEooMml3JLP9LP1/mmSleA=;
	b=dZj3aAuMFQYuyNd6Tb6i49iyQp53Uq+TscmnBaHqSx9skFQN0q29d6mWorUkIlQ+VRe9Xn
	1i3Snjw3AUYyj3/QYArI+sgUtti/gQjL82JcjxSEuxwG/LEvhg2qE7I3coU9xubZY2sNMB
	F663GHmgDdhoZafRAZ6nfMD9qWwHH0Q=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=dZj3aAuM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773330665; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=TQU4G2RSwxCfUXXUKJGE4oEooMml3JLP9LP1/mmSleA=;
	b=dZj3aAuMFQYuyNd6Tb6i49iyQp53Uq+TscmnBaHqSx9skFQN0q29d6mWorUkIlQ+VRe9Xn
	1i3Snjw3AUYyj3/QYArI+sgUtti/gQjL82JcjxSEuxwG/LEvhg2qE7I3coU9xubZY2sNMB
	F663GHmgDdhoZafRAZ6nfMD9qWwHH0Q=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Julien Grall <julien@xen.org>
Subject: [PATCH v2 0/8] tools/xs-clients: add some man pages and fixes
Date: Thu, 12 Mar 2026 16:50:54 +0100
Message-ID: <20260312155102.2862824-1-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:anthony.perard@vates.tech,m:julien@xen.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 7DB0B274E35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

For some of the Xenstore client programs the man pages are missing
entirely, the existing man pages don't mention the "-h" parameter.

Additionally fix some other minor bugs in the code. Those bugs seem
to exist since roughly 20 years now, so I didn't do a thorough
archaeological examination for finding the exact commits introducing
them, as any potential backport candidate will need to go to all
still supported Xen versions anyway.

Changes in V2:
- new patches 1 and 6-8
- some small fixes in the other patches

Juergen Gross (8):
  docs: add -h parameter description to xenstore-* man pages
  docs: add man page for xenstore-exists
  docs: add man page for xenstore-list
  docs: add man page for xenstore-rm
  docs: add man page for xenstore-watch
  tools/xs-clients: don't exit with error when using -h parameter
  tools/xs-clients: fix usage information of xenstore-exists
  tools/xs-clients: fix output of "xenstore-list -p /"

 docs/man/xenstore-chmod.1.pod      |  4 +++
 docs/man/xenstore-exists.1.pod     | 25 ++++++++++++++++
 docs/man/xenstore-list.1.pod       | 28 +++++++++++++++++
 docs/man/xenstore-ls.1.pod         |  4 +++
 docs/man/xenstore-read.1.pod       |  4 +++
 docs/man/xenstore-rm.1.pod         | 28 +++++++++++++++++
 docs/man/xenstore-watch.1.pod      | 29 ++++++++++++++++++
 docs/man/xenstore-write.1.pod      |  4 +++
 tools/xs-clients/xenstore_client.c | 48 ++++++++++++++++--------------
 9 files changed, 152 insertions(+), 22 deletions(-)
 create mode 100644 docs/man/xenstore-exists.1.pod
 create mode 100644 docs/man/xenstore-list.1.pod
 create mode 100644 docs/man/xenstore-rm.1.pod
 create mode 100644 docs/man/xenstore-watch.1.pod

-- 
2.53.0


