Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BB79ACAC6
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 15:10:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824605.1238751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3b7s-0006U3-Op; Wed, 23 Oct 2024 13:10:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824605.1238751; Wed, 23 Oct 2024 13:10:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3b7s-0006Rg-M7; Wed, 23 Oct 2024 13:10:12 +0000
Received: by outflank-mailman (input) for mailman id 824605;
 Wed, 23 Oct 2024 13:10:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W0hE=RT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1t3b7r-0006Ra-EE
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 13:10:11 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20f24c40-9140-11ef-99a3-01e77a169b0f;
 Wed, 23 Oct 2024 15:10:09 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5D73321FAB;
 Wed, 23 Oct 2024 13:10:08 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 14DB113A63;
 Wed, 23 Oct 2024 13:10:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id i8SwA7D1GGe2dwAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 23 Oct 2024 13:10:08 +0000
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
X-Inumbo-ID: 20f24c40-9140-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1729689008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ONHU4wsU1jK2R7fCbxvNJAdPA+MIG+vJ/cB84F1Y9cw=;
	b=uv1jYQvmRbe3SFB6YtNvc6l9/g8v+lRXXwcVx6GGeTjJEyUL1EeFpWqFIj8Ar+ZNBGqWLT
	ptIgePm2UlQyXxDSL/tjzYpIwMckX2LwugpVUhmYqw2rusBKcEiYrvvZh2P6VsW0qSbDMY
	wmUqmWE5QPNXSf+Xd7SYyGtXmfbL7bk=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=uv1jYQvm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1729689008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ONHU4wsU1jK2R7fCbxvNJAdPA+MIG+vJ/cB84F1Y9cw=;
	b=uv1jYQvmRbe3SFB6YtNvc6l9/g8v+lRXXwcVx6GGeTjJEyUL1EeFpWqFIj8Ar+ZNBGqWLT
	ptIgePm2UlQyXxDSL/tjzYpIwMckX2LwugpVUhmYqw2rusBKcEiYrvvZh2P6VsW0qSbDMY
	wmUqmWE5QPNXSf+Xd7SYyGtXmfbL7bk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH 0/6] remove libxenctrl usage from xenstored
Date: Wed, 23 Oct 2024 15:09:59 +0200
Message-ID: <20241023131005.32144-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5D73321FAB
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Xenstored is using libxenctrl for only one purpose: to get information
about state of domains.

This patch series is removing that dependency by introducing a new
stable interface which can be used by xenstored instead.

There was a RFC series sent out 3 years ago, which I have taken as a
base and by addressing all comments from back then.

The main differences since that RFC series are:

- Instead of introducing an new main hypercall for a stable management
  interface I have just added a new domctl sub-op, as requested in 2021.

- I have added a new library libxenmanage for easy use of the new
  stable hypervisor interface. Main motivation for adding the library
  was the recent attempt to decouple oxenstored from the Xen git tree.
  By using the new library, oxenstored could benefit in the same way as
  xenstored from the new interface: it would be possible to rely on
  stable libraries only.

- Mini-OS has gained some more config options recently, so it was rather
  easy to make xenstore[pvh]-stubdom independent from libxenctrl, too.

- By moving the CPU barrier definitions out of xenctrl.h into a new
  dedicated header xenstored code no longer needs to #include xenctrl.h,
  thus removing any xenctrl reference from xenstored code.

Please note that the last patch can be committed only after the related
Mini-OS patch "config: add support for libxenmanage" has gone in AND
the Mini-OS commit-id has been updated in Config.mk accordingly!

Juergen Gross (6):
  xen: add a domain unique id to each domain
  xen: add bitmap to indicate per-domain state changes
  xen: add new domctl get_changed_domain
  tools/libs: add a new libxenmanage library
  tools: add a dedicated header file for barrier definitions
  tools/xenstored: use new stable interface instead of libxenctrl

 stubdom/Makefile                    |   8 +-
 stubdom/mini-os.mk                  |   1 +
 tools/9pfsd/io.c                    |   5 +-
 tools/flask/policy/modules/dom0.te  |   2 +-
 tools/include/xen-barrier.h         |  51 +++++++++
 tools/include/xenctrl.h             |  28 +----
 tools/include/xenmanage.h           |  98 ++++++++++++++++
 tools/libs/Makefile                 |   1 +
 tools/libs/ctrl/Makefile            |   2 +-
 tools/libs/manage/Makefile          |  10 ++
 tools/libs/manage/Makefile.common   |   1 +
 tools/libs/manage/core.c            | 170 ++++++++++++++++++++++++++++
 tools/libs/manage/libxenmanage.map  |   8 ++
 tools/libs/uselibs.mk               |   2 +
 tools/xenstored/Makefile            |   2 +-
 tools/xenstored/Makefile.common     |   2 +-
 tools/xenstored/core.h              |   1 -
 tools/xenstored/domain.c            |  52 ++++-----
 tools/xenstored/lu.c                |   1 +
 tools/xenstored/lu_daemon.c         |   1 +
 xen/common/domain.c                 |  92 +++++++++++++++
 xen/common/domctl.c                 |  19 +++-
 xen/common/event_channel.c          |  11 +-
 xen/include/public/domctl.h         |  33 ++++++
 xen/include/xen/event.h             |   6 +
 xen/include/xen/sched.h             |   7 ++
 xen/include/xsm/dummy.h             |   8 ++
 xen/include/xsm/xsm.h               |   6 +
 xen/xsm/dummy.c                     |   1 +
 xen/xsm/flask/hooks.c               |   7 ++
 xen/xsm/flask/policy/access_vectors |   2 +
 31 files changed, 566 insertions(+), 72 deletions(-)
 create mode 100644 tools/include/xen-barrier.h
 create mode 100644 tools/include/xenmanage.h
 create mode 100644 tools/libs/manage/Makefile
 create mode 100644 tools/libs/manage/Makefile.common
 create mode 100644 tools/libs/manage/core.c
 create mode 100644 tools/libs/manage/libxenmanage.map

-- 
2.43.0


