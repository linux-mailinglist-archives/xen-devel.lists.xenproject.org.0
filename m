Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0054DB0DCDF
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 16:07:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052673.1421424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueDdk-0005S3-J4; Tue, 22 Jul 2025 14:06:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052673.1421424; Tue, 22 Jul 2025 14:06:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueDdk-0005Q4-GE; Tue, 22 Jul 2025 14:06:44 +0000
Received: by outflank-mailman (input) for mailman id 1052673;
 Tue, 22 Jul 2025 14:06:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nbPo=2D=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ueDdj-0005C5-1U
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 14:06:43 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1275e016-6705-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 16:06:33 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3321B211F8;
 Tue, 22 Jul 2025 14:06:32 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DF3F813A32;
 Tue, 22 Jul 2025 14:06:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 3Tz7NOeaf2igIAAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 22 Jul 2025 14:06:31 +0000
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
X-Inumbo-ID: 1275e016-6705-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753193192; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=EOCN2VqDnRb/bIaqyt39NY38+UAK2hg+d/gIEJR17Jw=;
	b=FKGHMrg3gXKSaQrkUcstecrbfxwLEOMHt8aX2l+EdDIXRZA+5fTPd/fOncHZcG2fqub4JA
	0k/FQfFQ/XFZgTiaQF/OlmoJKjrwbTKkUs58DTthAnlQ0zIJXENj0NpugKfXFgHLc04OqE
	AeCyYIDR6jrQfx8sysltNP2K5sm3xrw=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=FKGHMrg3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753193192; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=EOCN2VqDnRb/bIaqyt39NY38+UAK2hg+d/gIEJR17Jw=;
	b=FKGHMrg3gXKSaQrkUcstecrbfxwLEOMHt8aX2l+EdDIXRZA+5fTPd/fOncHZcG2fqub4JA
	0k/FQfFQ/XFZgTiaQF/OlmoJKjrwbTKkUs58DTthAnlQ0zIJXENj0NpugKfXFgHLc04OqE
	AeCyYIDR6jrQfx8sysltNP2K5sm3xrw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Nick Rosbrook <enr0n@ubuntu.com>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH 0/7] tools: add support for domain specific Xenstore features
Date: Tue, 22 Jul 2025 16:06:21 +0200
Message-ID: <20250722140628.28947-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 3321B211F8
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Score: -3.01

Add support for limiting the optional Xenstore features via domain
configuration. This will be needed when adding features like limiting
the scope of Xenstore watch events.

This patch series is handling only the xl/libxl side, libxenstore and
C Xenstore (xenstored and xenstore-stubdom). Oxenstored is not covered.

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
 tools/libs/store/xs.c                |  49 ++++++++++
 tools/xenstored/control.c            |   6 +-
 tools/xenstored/core.c               |   4 +
 tools/xenstored/domain.c             | 131 +++++++++++++++++++++++++--
 tools/xenstored/domain.h             |  11 +++
 tools/xenstored/lu.c                 |  35 +++++--
 tools/xenstored/lu.h                 |   3 +-
 tools/xenstored/xenstore_state.h     |  31 ++++++-
 tools/xl/Makefile                    |   3 +-
 tools/xl/xl_info.c                   |  22 +++++
 tools/xl/xl_parse.c                  |   3 +
 tools/xs-clients/xenstore_control.c  |  41 +++++++--
 21 files changed, 386 insertions(+), 32 deletions(-)

-- 
2.43.0


