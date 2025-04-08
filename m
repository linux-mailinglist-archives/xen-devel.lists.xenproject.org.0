Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF96A80735
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 14:35:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941911.1341292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u28Au-0004DW-AF; Tue, 08 Apr 2025 12:35:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941911.1341292; Tue, 08 Apr 2025 12:35:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u28Au-0004Bd-71; Tue, 08 Apr 2025 12:35:32 +0000
Received: by outflank-mailman (input) for mailman id 941911;
 Tue, 08 Apr 2025 12:35:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ii8P=W2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1u28As-0003x9-Hu
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 12:35:30 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4a65b05-1475-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 14:35:29 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 91E3121187;
 Tue,  8 Apr 2025 12:35:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1D50213691;
 Tue,  8 Apr 2025 12:35:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YnGoBRAY9Wf2IQAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 08 Apr 2025 12:35:28 +0000
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
X-Inumbo-ID: f4a65b05-1475-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1744115728; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=t3O/Nr7rI8B8JB64yGo0yQESPbYj98bgGdYU6htvRo8=;
	b=FenUcLSuIeeo1O5yIfI9b3F7tcyR9bAyAa15Vk9lIzwgE6V+y9SjtAowcheuPfPKcOs5So
	qc/BzV30Gjacsl1hxKkUvSpvYZLjPqSbbey6/p7DdY1GG6UdzznIBLFEi0QX+zfUO2WUlI
	+iB77sW4QIXih99koBrrIrhdUSF1Mlg=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1744115728; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=t3O/Nr7rI8B8JB64yGo0yQESPbYj98bgGdYU6htvRo8=;
	b=FenUcLSuIeeo1O5yIfI9b3F7tcyR9bAyAa15Vk9lIzwgE6V+y9SjtAowcheuPfPKcOs5So
	qc/BzV30Gjacsl1hxKkUvSpvYZLjPqSbbey6/p7DdY1GG6UdzznIBLFEi0QX+zfUO2WUlI
	+iB77sW4QIXih99koBrrIrhdUSF1Mlg=
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
Subject: [PATCH v2 0/6] remove qemu-traditional
Date: Tue,  8 Apr 2025 14:35:18 +0200
Message-ID: <20250408123526.14613-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.30
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:mid];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[suse.com,gmail.com,xenproject.org,citrix.com,vates.tech,amd.com,xen.org,kernel.org,invisiblethingslab.com,ens-lyon.org];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 

Remove the qemu-traditional support. This includes the Mini-OS
based ioemu-stubdom.

Don't remove ROMBIOS for now, as it can be used with qemu (XenServer
is doing that).

After adding the series a run of autoconf should be done.

Changes in V2:
- addressed comments

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
 SUPPORT.md                                    |  21 +-
 config/Tools.mk.in                            |   1 -
 docs/man/xl-pci-configuration.5.pod           |   4 +-
 docs/man/xl.cfg.5.pod.in                      |  46 +--
 docs/misc/stubdom.txt                         |  52 ---
 docs/misc/xenstore-paths.pandoc               |   3 +-
 docs/process/branching-checklist.txt          |   4 -
 docs/process/release-technician-checklist.txt |   3 -
 docs/process/xen-release-management.pandoc    |   2 +-
 stubdom/Makefile                              |  84 +----
 stubdom/configure                             |  89 -----
 stubdom/configure.ac                          |  15 -
 stubdom/ioemu-minios.cfg                      |   6 -
 stubdom/stubdom-dm                            | 182 ----------
 tools/Makefile                                |  58 ----
 tools/Rules.mk                                |   3 -
 tools/config.h.in                             |   3 -
 tools/configure                               |  42 +--
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
 44 files changed, 81 insertions(+), 1636 deletions(-)
 delete mode 100644 stubdom/ioemu-minios.cfg
 delete mode 100644 stubdom/stubdom-dm

-- 
2.43.0


