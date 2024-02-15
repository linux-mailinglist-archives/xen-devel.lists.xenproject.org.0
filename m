Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1018E855AD5
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 07:56:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681244.1059902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raVeu-0003Qe-E4; Thu, 15 Feb 2024 06:55:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681244.1059902; Thu, 15 Feb 2024 06:55:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raVeu-0003NZ-BM; Thu, 15 Feb 2024 06:55:48 +0000
Received: by outflank-mailman (input) for mailman id 681244;
 Thu, 15 Feb 2024 06:55:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4buu=JY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1raVet-0003NA-8e
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 06:55:47 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e5f860f-cbcf-11ee-8a4d-1f161083a0e0;
 Thu, 15 Feb 2024 07:55:46 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EE26D21DA6;
 Thu, 15 Feb 2024 06:55:43 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id A95C41346A;
 Thu, 15 Feb 2024 06:55:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id hvnfJ2+1zWVASQAAn2gu4w
 (envelope-from <jgross@suse.com>); Thu, 15 Feb 2024 06:55:43 +0000
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
X-Inumbo-ID: 3e5f860f-cbcf-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707980144; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ECSeBWWjKQHdyNMNTJRjvPW6+HyR8VrvmXmI6Qt0kLI=;
	b=ecFi8c1VNfIHhOyrUKXzC5qmYy7NobQrWIQvr8VvGXOioVIZo96IlqFP+DRGYZJyU7T/wY
	suBDeePN3+4StP7UnTreaQcOKX18Ene05c5/MCAVR+BstAPbV6FCjXHMQFj9pxwOt+ArYA
	6yhRh+q9Yzy04+ZPm2lXBA/w82yPt50=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707980143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ECSeBWWjKQHdyNMNTJRjvPW6+HyR8VrvmXmI6Qt0kLI=;
	b=nv5DNbUemAO/zdgoljnsrZvKBtBJVcKw3AI5qMOqP5B6KgjJYwzRqbjLU9hEiPgDbsC9WN
	7q9IzZkJ2EEqAhSE9VVxyjeAS9IvBpbmYz+YmkdgkYVxQBJEQlJ1OGef/fiEdcKhn7sgl2
	dxLZv8wRfxlcqye8HdYONRgU6oDIdyE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH v6 00/21] tools: enable xenstore-stubdom to use 9pfs
Date: Thu, 15 Feb 2024 07:55:20 +0100
Message-Id: <20240215065541.21067-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=nv5DNbUe
X-Spamd-Result: default: False [1.69 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[suse.com,xen.org,citrix.com,gmail.com,ens-lyon.org];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 1.69
X-Rspamd-Queue-Id: EE26D21DA6
X-Spam-Level: *
X-Spam-Flag: NO
X-Spamd-Bar: +

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

Juergen Gross (21):
  tools: add a new xen 9pfs daemon
  tools/xen-9pfsd: connect to frontend
  tools/xen-9pfsd: add transport layer
  tools/xen-9pfsd: add 9pfs response generation support
  tools/xen-9pfsd: add 9pfs version request support
  tools/xen-9pfsd: add 9pfs attach request support
  tools/xen-9pfsd: add 9pfs walk request support
  tools/xen-9pfsd: add 9pfs open request support
  tools/xen-9pfsd: add 9pfs clunk request support
  tools/xen-9pfsd: add 9pfs create request support
  tools/xen-9pfsd: add 9pfs stat request support
  tools/xen-9pfsd: add 9pfs write request support
  tools/xen-9pfsd: add 9pfs read request support
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
 tools/golang/xenlight/helpers.gen.go          |   10 +
 tools/golang/xenlight/types.gen.go            |   12 +
 tools/helpers/init-xenstore-domain.c          |    7 +
 .../Linux/init.d/sysconfig.xencommons.in      |    1 -
 tools/hotplug/Linux/launch-xenstore.in        |    1 +
 tools/include/libxl.h                         |   22 +
 tools/libs/light/libxl_9pfs.c                 |  191 ++-
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
 28 files changed, 2866 insertions(+), 42 deletions(-)
 create mode 100644 tools/9pfsd/.gitignore
 create mode 100644 tools/9pfsd/Makefile
 create mode 100644 tools/9pfsd/io.c
 create mode 100644 tools/9pfsd/xen-9pfsd.c
 create mode 100644 tools/9pfsd/xen-9pfsd.h

-- 
2.35.3


