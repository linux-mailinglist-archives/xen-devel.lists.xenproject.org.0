Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D15786C977
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 13:49:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687039.1069778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rffq1-0003zz-9P; Thu, 29 Feb 2024 12:48:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687039.1069778; Thu, 29 Feb 2024 12:48:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rffq1-0003yP-5z; Thu, 29 Feb 2024 12:48:37 +0000
Received: by outflank-mailman (input) for mailman id 687039;
 Thu, 29 Feb 2024 12:48:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OAsO=KG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rffpz-0003yF-6c
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 12:48:35 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8929e30-d700-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 13:48:33 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 625361F7E8;
 Thu, 29 Feb 2024 12:48:32 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id F3ACF1329E;
 Thu, 29 Feb 2024 12:48:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id jHdROR994GXvIQAAn2gu4w
 (envelope-from <jgross@suse.com>); Thu, 29 Feb 2024 12:48:31 +0000
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
X-Inumbo-ID: d8929e30-d700-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709210912; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3LpVg4VR4Av9lRaWgZwCKN2sTIaBmuVNnNx2pKsXnAQ=;
	b=ez5EV45Q4D9+xFRUXrbBc1zEca1qn8clECUCYT05wNlagrpYoljdhUa8Qfr4g77XhJRTBU
	ZEjitWKtItm/a6py8tGoS36Yw/bI48w9MgfDpop+RLme9Y4oBxfZUNeqmxbiOhir9NzLGj
	encU29x7/3KusKz1S2TowZi82GxkX4c=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709210912; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3LpVg4VR4Av9lRaWgZwCKN2sTIaBmuVNnNx2pKsXnAQ=;
	b=ez5EV45Q4D9+xFRUXrbBc1zEca1qn8clECUCYT05wNlagrpYoljdhUa8Qfr4g77XhJRTBU
	ZEjitWKtItm/a6py8tGoS36Yw/bI48w9MgfDpop+RLme9Y4oBxfZUNeqmxbiOhir9NzLGj
	encU29x7/3KusKz1S2TowZi82GxkX4c=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v9 0/6] tools: enable xenstore-stubdom to use 9pfs
Date: Thu, 29 Feb 2024 13:48:24 +0100
Message-Id: <20240229124830.13680-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=ez5EV45Q
X-Spamd-Result: default: False [-0.31 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 DWL_DNSWL_MED(-2.00)[suse.com:dkim];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[10];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -0.31
X-Rspamd-Queue-Id: 625361F7E8
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Bar: /

This series is adding 9pfs support to Xenstore-stubdom, enabling it
to do logging to a dom0 directory.

This is a prerequisite for the final goal to add live update support
to Xenstore-stubdom, as it enables the stubdom to store its state in
a dom0 file.

Reposting the rest series. CI-test has passed.

Changes in V9:
- new patch 1
- patches 1+2 and 4 of V8 have been applied

Changes in V8:
- patches 1-13 of V7 have been applied

Changes in V7:
- fixed V6 bugs

Changes in V6:
- patch 1 of V5 has been applied
- rebase
- addressed comments

Changes in V5:
- 10 patches have been applied already
- rename source directory to tools/9pfsd
- addressed comments

Changes in V4:
- patch 2 of V3 was applied
- added support of reading directories
- addressed review comments

Changes in V3:
- new patches 1, 23-25
- addressed review comments

Changes in V2:
- support of multiple rings per device
- xenlogd->xen-9pfsd rename
- addressed review comments
- fixed some bugs

Juergen Gross (6):
  config: update Mini-OS commit
  stubdom: extend xenstore stubdom configs
  tools/xenstored: mount 9pfs device in stubdom
  tools/xenstored: add helpers for filename handling
  tools/xenstored: support complete log capabilities in stubdom
  tools/xenstored: have a single do_control_memreport()

 Config.mk                                     |  2 +-
 stubdom/xenstore-minios.cfg                   |  2 +-
 stubdom/xenstorepvh-minios.cfg                |  2 +-
 .../Linux/init.d/sysconfig.xencommons.in      |  1 -
 tools/hotplug/Linux/launch-xenstore.in        |  1 +
 tools/xenstored/control.c                     | 29 +++------
 tools/xenstored/core.c                        | 15 ++++-
 tools/xenstored/core.h                        | 11 +++-
 tools/xenstored/domain.c                      |  2 +
 tools/xenstored/lu_daemon.c                   |  4 +-
 tools/xenstored/minios.c                      | 62 +++++++++++++++++++
 tools/xenstored/posix.c                       |  8 ++-
 12 files changed, 108 insertions(+), 31 deletions(-)

-- 
2.35.3


