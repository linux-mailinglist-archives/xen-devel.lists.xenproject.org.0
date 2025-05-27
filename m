Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B84BEAC4F8C
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 15:21:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998394.1379125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJuET-0002hP-GG; Tue, 27 May 2025 13:20:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998394.1379125; Tue, 27 May 2025 13:20:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJuET-0002fc-DT; Tue, 27 May 2025 13:20:41 +0000
Received: by outflank-mailman (input) for mailman id 998394;
 Tue, 27 May 2025 13:20:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D0pS=YL=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uJuES-0002fW-R5
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 13:20:40 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61bd2c9b-3afd-11f0-a2fd-13f23c93f187;
 Tue, 27 May 2025 15:20:39 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7406122006;
 Tue, 27 May 2025 13:20:38 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0B5441388B;
 Tue, 27 May 2025 13:20:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MoKqACa8NWiwKAAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 27 May 2025 13:20:38 +0000
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
X-Inumbo-ID: 61bd2c9b-3afd-11f0-a2fd-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1748352038; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=n1tNRQt6zFhFYYvUhdqgR/JquhHinbRBa7p6fBgvX4M=;
	b=Vbv6WMhHpFngSkWk8Kd8De1gl6c6Y3uo23yOgmjq6cRe8BHOpKDsaB/Sr4iSkXfCQz54WA
	9ZglBJhBpSRpQGrQt9lAz6xzZJYEbVPbSf6i6Pr4SONqJFJUGOpNrwKZsx9NAsZhcwPyZm
	/CB9TttvkkqTvc2gU9cR4IQi9bbxqR8=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=Vbv6WMhH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1748352038; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=n1tNRQt6zFhFYYvUhdqgR/JquhHinbRBa7p6fBgvX4M=;
	b=Vbv6WMhHpFngSkWk8Kd8De1gl6c6Y3uo23yOgmjq6cRe8BHOpKDsaB/Sr4iSkXfCQz54WA
	9ZglBJhBpSRpQGrQt9lAz6xzZJYEbVPbSf6i6Pr4SONqJFJUGOpNrwKZsx9NAsZhcwPyZm
	/CB9TttvkkqTvc2gU9cR4IQi9bbxqR8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH v4 0/4] remove qemu-traditional
Date: Tue, 27 May 2025 15:20:29 +0200
Message-ID: <20250527132035.985-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,vates.tech,citrix.com,amd.com,xen.org,kernel.org,invisiblethingslab.com,gmail.com,xenproject.org,ens-lyon.org];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:mid,suse.com:dkim];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 7406122006
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -1.51

Remove the qemu-traditional support. This includes the Mini-OS
based ioemu-stubdom.

Don't remove ROMBIOS for now, as it can be used with qemu (XenServer
is doing that).

After adding the series a run of autoconf should be done.

Changes in V2:
- addressed comments

Changes in V3:
- patches 1 and 5 of V2 have been applied already
- addressed comments

Changes in V4:
- addressed comments

Juergen Gross (4):
  docs: remove qemu-traditional support from documentation
  tools: remove support for running a guest with qemu-traditional
  tools: remove qemu-traditional
  build: don't require full tools build for building stubdoms

 .gitignore                                    |   3 -
 CHANGELOG.md                                  |   2 +
 Config.mk                                     |  38 --
 INSTALL                                       |  13 -
 MAINTAINERS                                   |   4 -
 Makefile                                      |   2 +-
 README                                        |   2 +-
 SUPPORT.md                                    |  16 -
 config/Paths.mk.in                            |   3 +-
 config/Tools.mk.in                            |   1 -
 docs/man/xl-pci-configuration.5.pod           |   4 +-
 docs/man/xl.cfg.5.pod.in                      |  49 +--
 docs/misc/stubdom.txt                         |  52 ---
 docs/misc/xenstore-paths.pandoc               |   3 +-
 docs/process/branching-checklist.txt          |   4 -
 docs/process/release-technician-checklist.txt |   3 -
 docs/process/xen-release-management.pandoc    |   2 +-
 stubdom/.gitignore                            |   3 -
 stubdom/Makefile                              |  97 +-----
 stubdom/configure                             |  89 -----
 stubdom/configure.ac                          |  15 -
 stubdom/ioemu-minios.cfg                      |   6 -
 tools/Makefile                                |  58 ----
 tools/Rules.mk                                |   3 -
 tools/config.h.in                             |   3 -
 tools/configure                               |  42 +--
 tools/configure.ac                            |  21 +-
 tools/firmware/hvmloader/Makefile             |   4 +-
 tools/firmware/hvmloader/pci.c                |  17 +-
 tools/firmware/hvmloader/util.c               |   9 +-
 tools/libacpi/mk_dsdt.c                       | 185 +++-------
 tools/libs/light/libxl_create.c               |  78 +----
 tools/libs/light/libxl_device.c               |  19 -
 tools/libs/light/libxl_disk.c                 |   7 -
 tools/libs/light/libxl_dm.c                   | 327 +-----------------
 tools/libs/light/libxl_dom.c                  |  10 -
 tools/libs/light/libxl_dom_save.c             | 140 --------
 tools/libs/light/libxl_dom_suspend.c          |  65 ----
 tools/libs/light/libxl_domain.c               |  15 -
 tools/libs/light/libxl_exec.c                 |  75 ----
 tools/libs/light/libxl_internal.c             |   6 +-
 tools/libs/light/libxl_internal.h             |  68 +---
 tools/libs/light/libxl_pci.c                  | 183 ----------
 tools/libs/light/libxl_sr_stream_format.h     |   2 +-
 tools/libs/light/libxl_stream_write.c         |   4 -
 tools/libs/light/libxl_types.idl              |   2 +-
 tools/python/xen/migration/libxl.py           |   2 -
 tools/xl/xl_parse.c                           |   5 +-
 48 files changed, 107 insertions(+), 1654 deletions(-)
 delete mode 100644 stubdom/ioemu-minios.cfg

-- 
2.43.0


