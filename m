Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95315A71B68
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 17:05:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928050.1330811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txTFJ-0001Vv-LF; Wed, 26 Mar 2025 16:04:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928050.1330811; Wed, 26 Mar 2025 16:04:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txTFJ-0001Sw-IB; Wed, 26 Mar 2025 16:04:49 +0000
Received: by outflank-mailman (input) for mailman id 928050;
 Wed, 26 Mar 2025 16:04:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Vdm=WN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1txTFI-0001Sq-4p
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 16:04:48 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 099f89d0-0a5c-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 17:04:47 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2080B21188;
 Wed, 26 Mar 2025 16:04:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8DB421374A;
 Wed, 26 Mar 2025 16:04:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id /Sl6IJwl5GfjaAAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 26 Mar 2025 16:04:44 +0000
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
X-Inumbo-ID: 099f89d0-0a5c-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1743005085; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Mw4RxgaffXF8Asm/Kqv9wRh52ywIsAgZd0gvW87OnkM=;
	b=M1k7/HcC1cN+TX+Zmc3kfJPxIj/7BublygEVoGtXNfroGxyTIk2+hGMWWwYvIspV/TCp4S
	cEttVUqp1/rlGMa2DSnA3rJ9WDReRYhnn8JDs32SbPduXxNthd4S006WM0c2ArEyom9otb
	2zD8DqlWUQzWcX8VDelKGfry5SnSeJ8=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="M1k7/HcC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1743005085; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Mw4RxgaffXF8Asm/Kqv9wRh52ywIsAgZd0gvW87OnkM=;
	b=M1k7/HcC1cN+TX+Zmc3kfJPxIj/7BublygEVoGtXNfroGxyTIk2+hGMWWwYvIspV/TCp4S
	cEttVUqp1/rlGMa2DSnA3rJ9WDReRYhnn8JDs32SbPduXxNthd4S006WM0c2ArEyom9otb
	2zD8DqlWUQzWcX8VDelKGfry5SnSeJ8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	George Dunlap <gwd@xenproject.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH 0/6] remove qemu-traditional
Date: Wed, 26 Mar 2025 17:04:34 +0100
Message-ID: <20250326160442.19706-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2080B21188
X-Spam-Score: -1.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.com:+];
	FREEMAIL_CC(0.00)[suse.com,gmail.com,xenproject.org,citrix.com,vates.tech,amd.com,xen.org,kernel.org,invisiblethingslab.com,ens-lyon.org];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Remove the qemu-traditional support. This includes the Mini-OS
based ioemu-stubdom.

I _think_ rombios support could be removed, too, but this can be
done in a second step.

After adding the series a run of autoconf should be done.

Juergen Gross (6):
  SUPPORT.md: make Linux based stubdom fully supported
  docs: remove qemu-traditional support from documentation
  tools: remove support for running a guest with qemu-traditional
  tools: remove qemu-traditional
  stubdom: remove ancient stubdom-dm script
  build: don't require full tools build for building stubdoms

 .gitignore                                    |   3 -
 CHANGELOG.md                                  |   2 +
 Config.mk                                     |  24 --
 INSTALL                                       |  12 -
 MAINTAINERS                                   |   4 -
 Makefile                                      |   2 +-
 README                                        |   2 +-
 SUPPORT.md                                    |  18 +-
 config/Tools.mk.in                            |   1 -
 docs/man/xl-pci-configuration.5.pod           |   4 +-
 docs/man/xl.cfg.5.pod.in                      |  46 +--
 docs/misc/stubdom.txt                         |  52 ---
 docs/misc/xenstore-paths.pandoc               |   2 +-
 docs/process/branching-checklist.txt          |   4 -
 docs/process/release-technician-checklist.txt |   3 -
 docs/process/xen-release-management.pandoc    |   2 +-
 stubdom/Makefile                              |  84 +----
 stubdom/configure                             |  90 -----
 stubdom/configure.ac                          |  15 -
 stubdom/ioemu-minios.cfg                      |   6 -
 stubdom/stubdom-dm                            | 182 ----------
 tools/Makefile                                |  58 ----
 tools/Rules.mk                                |   3 -
 tools/config.h.in                             |   3 -
 tools/configure                               |  40 +--
 tools/configure.ac                            |  21 +-
 tools/firmware/hvmloader/pci.c                |  19 +-
 tools/firmware/hvmloader/util.c               |   9 +-
 tools/golang/xenlight/types.gen.go            |   1 -
 tools/libacpi/mk_dsdt.c                       | 177 ++--------
 tools/libs/light/libxl_create.c               |  60 +---
 tools/libs/light/libxl_disk.c                 |   7 -
 tools/libs/light/libxl_dm.c                   | 320 +-----------------
 tools/libs/light/libxl_dom.c                  |  10 -
 tools/libs/light/libxl_dom_save.c             | 140 --------
 tools/libs/light/libxl_dom_suspend.c          |  65 ----
 tools/libs/light/libxl_domain.c               |  15 -
 tools/libs/light/libxl_internal.c             |   6 +-
 tools/libs/light/libxl_internal.h             |   5 +-
 tools/libs/light/libxl_pci.c                  | 183 ----------
 tools/libs/light/libxl_stream_write.c         |   4 -
 tools/libs/light/libxl_types.idl              |   1 -
 tools/python/xen/migration/libxl.py           |   2 -
 tools/xl/xl_parse.c                           |   5 +-
 44 files changed, 74 insertions(+), 1638 deletions(-)
 delete mode 100644 stubdom/ioemu-minios.cfg
 delete mode 100644 stubdom/stubdom-dm

-- 
2.43.0


