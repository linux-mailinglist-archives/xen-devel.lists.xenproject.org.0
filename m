Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBE6B11F45
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 15:19:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057789.1425485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufIKk-0006iV-S5; Fri, 25 Jul 2025 13:19:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057789.1425485; Fri, 25 Jul 2025 13:19:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufIKk-0006fz-PS; Fri, 25 Jul 2025 13:19:34 +0000
Received: by outflank-mailman (input) for mailman id 1057789;
 Fri, 25 Jul 2025 13:19:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ugva=2G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ufIKj-0006ft-AR
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 13:19:33 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fff28151-6959-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 15:19:31 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 27E8D1F79E;
 Fri, 25 Jul 2025 13:19:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DFB87134E8;
 Fri, 25 Jul 2025 13:19:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Fqb1NGKEg2i+PAAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 25 Jul 2025 13:19:30 +0000
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
X-Inumbo-ID: fff28151-6959-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753449571; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=YgmK8uFvUCMiWyL9yOmtfaqK/Y5L9jdk8BA+1UMPVYk=;
	b=rspr2oODFepqxHCmBJKyoXjTM1GoXKS3xJwb1nhqHBGhx0Ilq5epJe/Sf1i8AIDOnHj6bQ
	xqqrk0F+h+GGsiwZZxRznD1Bf8E0BngrMFkTYoe4zwejN4MlPPjc9r9Q9J31QrwTIH+IPJ
	ZwnwUllyJhMPo1aEb/zxSSxHaq2Dp9w=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=rspr2oOD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753449571; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=YgmK8uFvUCMiWyL9yOmtfaqK/Y5L9jdk8BA+1UMPVYk=;
	b=rspr2oODFepqxHCmBJKyoXjTM1GoXKS3xJwb1nhqHBGhx0Ilq5epJe/Sf1i8AIDOnHj6bQ
	xqqrk0F+h+GGsiwZZxRznD1Bf8E0BngrMFkTYoe4zwejN4MlPPjc9r9Q9J31QrwTIH+IPJ
	ZwnwUllyJhMPo1aEb/zxSSxHaq2Dp9w=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Nick Rosbrook <enr0n@ubuntu.com>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH v2 0/7] tools: add support for domain specific Xenstore features
Date: Fri, 25 Jul 2025 15:19:21 +0200
Message-ID: <20250725131928.19286-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:mid,suse.com:dkim];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 27E8D1F79E
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

Juergen Gross (7):
  tools/libs/store: add get- and set-feature related functions
  tools/xenstored: support specification of migration stream version
  tools/xenstored: add missing migration record definitions
  tools/xenstored: add server feature support
  tools/xenstored: support SET/GET_FEATURE commands
  tools/xl: add available Xenstore features to xl info output
  tools: allow to limit xenstore features via guest config

 docs/man/xl.cfg.5.pod.in             |  36 ++++++++
 tools/golang/xenlight/helpers.gen.go |   2 +
 tools/golang/xenlight/types.gen.go   |   1 +
 tools/include/libxl.h                |   6 ++
 tools/include/xenstore.h             |  13 +++
 tools/libs/light/libxl_dom.c         |  12 +++
 tools/libs/light/libxl_types.idl     |   1 +
 tools/libs/store/Makefile            |   2 +-
 tools/libs/store/libxenstore.map     |   6 ++
 tools/libs/store/xs.c                |  49 +++++++++++
 tools/xenstored/control.c            |   6 +-
 tools/xenstored/core.c               |   4 +
 tools/xenstored/domain.c             | 120 ++++++++++++++++++++++++++-
 tools/xenstored/domain.h             |  11 +++
 tools/xenstored/lu.c                 |  35 ++++++--
 tools/xenstored/lu.h                 |   3 +-
 tools/xenstored/xenstore_state.h     |  31 ++++++-
 tools/xl/Makefile                    |   3 +-
 tools/xl/xl_info.c                   |  22 +++++
 tools/xl/xl_parse.c                  |   3 +
 tools/xs-clients/xenstore_control.c  |  41 ++++++---
 21 files changed, 380 insertions(+), 27 deletions(-)

-- 
2.43.0


