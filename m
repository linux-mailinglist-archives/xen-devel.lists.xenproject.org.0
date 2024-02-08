Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AE884E595
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 17:56:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678350.1055523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY7gn-0005de-Nd; Thu, 08 Feb 2024 16:55:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678350.1055523; Thu, 08 Feb 2024 16:55:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY7gn-0005bJ-JJ; Thu, 08 Feb 2024 16:55:53 +0000
Received: by outflank-mailman (input) for mailman id 678350;
 Thu, 08 Feb 2024 16:55:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m/2e=JR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rY7gl-0005bD-Al
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 16:55:51 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e96963d0-c6a2-11ee-8a4a-1f161083a0e0;
 Thu, 08 Feb 2024 17:55:50 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 616B71FCF6;
 Thu,  8 Feb 2024 16:55:49 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0B6DD1326D;
 Thu,  8 Feb 2024 16:55:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id trolAZUHxWWfEwAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 08 Feb 2024 16:55:49 +0000
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
X-Inumbo-ID: e96963d0-c6a2-11ee-8a4a-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707411349; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=jvl+vfXWB3anELPj+eNKY9N43mJyk/v1hE3rU19JhxI=;
	b=Ew4JmYzJ1T5Ef90BZhaYHrWje39cyQIuNkYQZPAxfA0cs9bIqQLJhcO20eeAuTiWpB0boJ
	DGkfKhcf/B26+m/3wasCLaMEqs9CYERLJ5OGzu/JClSFOIVGL6zmVf1lUvtGd7NvlANhJa
	gCYg66cR0gJhecRiFASrrUQahGgjnLc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707411349; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=jvl+vfXWB3anELPj+eNKY9N43mJyk/v1hE3rU19JhxI=;
	b=Ew4JmYzJ1T5Ef90BZhaYHrWje39cyQIuNkYQZPAxfA0cs9bIqQLJhcO20eeAuTiWpB0boJ
	DGkfKhcf/B26+m/3wasCLaMEqs9CYERLJ5OGzu/JClSFOIVGL6zmVf1lUvtGd7NvlANhJa
	gCYg66cR0gJhecRiFASrrUQahGgjnLc=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH v5 00/22] tools: enable xenstore-stubdom to use 9pfs
Date: Thu,  8 Feb 2024 17:55:24 +0100
Message-Id: <20240208165546.5715-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [1.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[suse.com,xen.org,citrix.com,gmail.com,ens-lyon.org];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Level: *
X-Spam-Score: 1.90
X-Spam-Flag: NO

This series is adding 9pfs support to Xenstore-stubdom, enabling it
to do logging to a dom0 directory.

This is a prerequisite for the final goal to add live update support
to Xenstore-stubdom, as it enables the stubdom to store its state in
a dom0 file.

The 9pfs backend is a new daemon written from scratch. Using a
dedicated 9pfs daemon has several advantages:

- it is using much less resources than a full blown qemu process
- it can serve multiple guests (the idea is to use it for other
  infrastructure domains, like qemu-stubdom or driver domains, too)
- it is designed to support several security enhancements, like
  limiting the number of files for a guest, or limiting the allocated
  file system space
- it doesn't support file links (neither hard nor soft links) or
  referencing parent directories via "..", minimizing the risk that
  a guest can "escape" from its home directory

Note that for now the daemon only contains the minimal needed
functionality to do logging from Xenstore-stubdom. I didn't want to
add all the 9pfs commands and security add-ons in the beginning, in
order to avoid needless efforts in case the idea of the daemon is
being rejected.

Please note that the pending patch for updating the Mini-OS commit
in Config.mk needs to be applied for patch "stubdom: extend xenstore
stubdom configs" and the following ones.

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

Juergen Gross (22):
  tools: add access macros for unaligned data
  tools: add a new xen 9pfs daemon
  tools/9pfsd: connect to frontend
  tools/9pfsd: add transport layer
  tools/9pfsd: add 9pfs response generation support
  tools/9pfsd: add 9pfs version request support
  tools/9pfsd: add 9pfs attach request support
  tools/9pfsd: add 9pfs walk request support
  tools/9pfsd: add 9pfs open request support
  tools/9pfsd: add 9pfs clunk request support
  tools/9pfsd: add 9pfs create request support
  tools/9pfsd: add 9pfs stat request support
  tools/9pfsd: add 9pfs write request support
  tools/9pfsd: add 9pfs read request support
  tools/libs/light: add backend type for 9pfs PV devices
  tools/xl: support new 9pfs backend xen_9pfsd
  stubdom: extend xenstore stubdom configs
  tools: add 9pfs device to xenstore-stubdom
  tools/xenstored: mount 9pfs device in stubdom
  tools/xenstored: add helpers for filename handling
  tools/xenstored: support complete log capabilities in stubdom
  tools/xenstored: have a single do_control_memreport()

 docs/man/xl.cfg.5.pod.in                      |   36 +-
 stubdom/xenstore-minios.cfg                   |    2 +-
 stubdom/xenstorepvh-minios.cfg                |    2 +-
 tools/9pfsd/.gitignore                        |    1 +
 tools/9pfsd/Makefile                          |   38 +
 tools/9pfsd/io.c                              | 1513 +++++++++++++++++
 tools/9pfsd/xen-9pfsd.c                       |  800 +++++++++
 tools/9pfsd/xen-9pfsd.h                       |   99 ++
 tools/Makefile                                |    1 +
 tools/golang/xenlight/helpers.gen.go          |   16 +
 tools/golang/xenlight/types.gen.go            |   13 +
 tools/helpers/init-xenstore-domain.c          |    7 +
 .../Linux/init.d/sysconfig.xencommons.in      |    1 -
 tools/hotplug/Linux/launch-xenstore.in        |    1 +
 tools/include/libxl.h                         |   22 +
 tools/include/xen-tools/common-macros.h       |   17 +
 tools/libs/light/libxl_9pfs.c                 |  193 ++-
 tools/libs/light/libxl_create.c               |    4 +-
 tools/libs/light/libxl_dm.c                   |    2 +-
 tools/libs/light/libxl_types.idl              |   11 +
 tools/libs/light/libxl_types_internal.idl     |    1 +
 tools/xenstored/control.c                     |   29 +-
 tools/xenstored/core.c                        |   15 +-
 tools/xenstored/core.h                        |   11 +-
 tools/xenstored/domain.c                      |    2 +
 tools/xenstored/lu_daemon.c                   |    4 +-
 tools/xenstored/minios.c                      |   62 +
 tools/xenstored/posix.c                       |    8 +-
 tools/xl/xl_parse.c                           |   23 +-
 29 files changed, 2892 insertions(+), 42 deletions(-)
 create mode 100644 tools/9pfsd/.gitignore
 create mode 100644 tools/9pfsd/Makefile
 create mode 100644 tools/9pfsd/io.c
 create mode 100644 tools/9pfsd/xen-9pfsd.c
 create mode 100644 tools/9pfsd/xen-9pfsd.h

-- 
2.35.3


