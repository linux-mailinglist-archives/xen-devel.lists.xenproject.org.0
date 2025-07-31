Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE5EB16DCD
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 10:43:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065072.1430392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhOsP-0006TG-7X; Thu, 31 Jul 2025 08:43:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065072.1430392; Thu, 31 Jul 2025 08:43:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhOsP-0006Rb-4l; Thu, 31 Jul 2025 08:43:01 +0000
Received: by outflank-mailman (input) for mailman id 1065072;
 Thu, 31 Jul 2025 08:42:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3v3Z=2M=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uhOsN-0006RV-ER
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 08:42:59 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5bd48332-6dea-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 10:42:58 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id ED7DC1F7D3;
 Thu, 31 Jul 2025 08:42:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AF71213AB4;
 Thu, 31 Jul 2025 08:42:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id zYcPKZAsi2jIDAAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 31 Jul 2025 08:42:56 +0000
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
X-Inumbo-ID: 5bd48332-6dea-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753951377; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3oEbq4sKt6r7kMK2h9RUAPYW29aeQJh/57BF7gdQyTY=;
	b=fkCSpzEC5DVBB1GQJLO20m8h8bNNbK6jqi3Q4a0hXKSxLP9rL7hA12ItviUvCZapz2Bmul
	auzGDcH310li5wF0AkDj3TVBl0KdUBwgRdbtjmK14RWwPMgi6icO+Dt06iPmq3ZMAkyyU3
	yBqMsyfhcsftlK7w9CLoU0cEFQqKThw=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="OF+99h/Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753951376; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3oEbq4sKt6r7kMK2h9RUAPYW29aeQJh/57BF7gdQyTY=;
	b=OF+99h/Z11UkK/X5SCO0PXUuKqyd6z2tF6qdv6ELn4nek6nvvTBdZ5ZyR1i1IgVocEB/jx
	bEY+neUnR8v1iX4hLHTpGI719ASFogj8IZzCf+a09RQzNZxwzG6KTX/ZpCrNTsXh6TKMGm
	YMREwFnX7LqPGrNl+qcDDws7rN9T4AY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Nick Rosbrook <enr0n@ubuntu.com>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH v3 0/2] tools: add support for domain specific Xenstore features
Date: Thu, 31 Jul 2025 10:42:52 +0200
Message-ID: <20250731084254.25591-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DWL_DNSWL_BLOCKED(0.00)[suse.com:dkim];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: ED7DC1F7D3
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Add support for limiting the optional Xenstore features via domain
configuration. This will be needed when adding features like limiting
the scope of Xenstore watch events.

This patch series is handling only the xl/libxl side, libxenstore and
C Xenstore (xenstored and xenstore-stubdom). Oxenstored is not covered.

Changes in V2:
- added Jason's Reviewed-by: tags
- a small fix of patch 4

Changes in V3:
- patches 1-5 have gone in already
- 2 fixes in patch

Juergen Gross (2):
  tools/xl: add available Xenstore features to xl info output
  tools: allow to limit xenstore features via guest config

 docs/man/xl.cfg.5.pod.in             | 36 ++++++++++++++++++++++++++++
 tools/golang/xenlight/helpers.gen.go |  2 ++
 tools/golang/xenlight/types.gen.go   |  1 +
 tools/include/libxl.h                |  6 +++++
 tools/libs/light/libxl_dom.c         | 17 ++++++++++++-
 tools/libs/light/libxl_types.idl     |  1 +
 tools/xl/Makefile                    |  3 ++-
 tools/xl/xl_info.c                   | 22 +++++++++++++++++
 tools/xl/xl_parse.c                  |  3 +++
 9 files changed, 89 insertions(+), 2 deletions(-)

-- 
2.43.0


