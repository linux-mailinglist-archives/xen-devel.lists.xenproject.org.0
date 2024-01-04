Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA78C823E0E
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 10:01:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661121.1030813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJb7-0007bf-AD; Thu, 04 Jan 2024 09:01:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661121.1030813; Thu, 04 Jan 2024 09:01:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJb7-0007Zs-7c; Thu, 04 Jan 2024 09:01:05 +0000
Received: by outflank-mailman (input) for mailman id 661121;
 Thu, 04 Jan 2024 09:01:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4u2H=IO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rLJb5-0007Zm-5J
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 09:01:03 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7e0e578-aadf-11ee-9b0f-b553b5be7939;
 Thu, 04 Jan 2024 10:01:01 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A2A5A21EE1;
 Thu,  4 Jan 2024 09:00:59 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 676FF13722;
 Thu,  4 Jan 2024 09:00:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id M8nwF8tzlmVwWAAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 04 Jan 2024 09:00:59 +0000
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
X-Inumbo-ID: c7e0e578-aadf-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1704358859; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=tDJDwV+ksS3RcAqm58GYLupDCL+N1fVsF7xQ9JzawIY=;
	b=oN/uwXM9xTVeWz4AiYt+Hjn3kHdi4fD3EMr2tRh2J9WzrmrHZjZlmGeEK8jclRHAuIvX5S
	tB0D8cvteBAz9dtsacnpzgX9IhXlmovezZeA3sF1HJZ+dNCBAmI/vkBIhAQyjx46vnmkrl
	OcL91DjbyJ0RAR9NhFCQDqfj0qidFxA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1704358859; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=tDJDwV+ksS3RcAqm58GYLupDCL+N1fVsF7xQ9JzawIY=;
	b=oN/uwXM9xTVeWz4AiYt+Hjn3kHdi4fD3EMr2tRh2J9WzrmrHZjZlmGeEK8jclRHAuIvX5S
	tB0D8cvteBAz9dtsacnpzgX9IhXlmovezZeA3sF1HJZ+dNCBAmI/vkBIhAQyjx46vnmkrl
	OcL91DjbyJ0RAR9NhFCQDqfj0qidFxA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Julien Grall <julien@xen.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH v3 00/33] tools: enable xenstore-stubdom to use 9pfs
Date: Thu,  4 Jan 2024 10:00:22 +0100
Message-Id: <20240104090055.27323-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: 1.90
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
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: *
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

Changes in V3:
- new patches 1, 23-25
- addressed review comments

Changes in V2:
- support of multiple rings per device
- xenlogd->xen-9pfsd rename
- addressed review comments
- fixed some bugs

Juergen Gross (33):
  tools: add access macros for unaligned data
  xen/public: add some more 9pfs xenstore paths
  tools: add a new xen logging daemon
  tools/xenlogd: connect to frontend
  tools/xenlogd: add transport layer
  tools/xenlogd: add 9pfs response generation support
  tools/xenlogd: add 9pfs version request support
  tools/xenlogd: add 9pfs attach request support
  tools/xenlogd: add 9pfs walk request support
  tools/xenlogd: add 9pfs open request support
  tools/xenlogd: add 9pfs clunk request support
  tools/xenlogd: add 9pfs create request support
  tools/xenlogd: add 9pfs stat request support
  tools/xenlogd: add 9pfs write request support
  tools/xenlogd: add 9pfs read request support
  tools/libs/light: add backend type for 9pfs PV devices
  tools/xl: support new 9pfs backend xen-9pfsd
  tools/helpers: allocate xenstore event channel for xenstore stubdom
  tools/xenstored: rename xenbus_evtchn()
  stubdom: extend xenstore stubdom configs
  tools: add 9pfs device to xenstore-stubdom
  tools/xenstored: add early_init() function
  tools/xenstored: move systemd handling to posix.c
  tools/xenstored: move all log-pipe handling into posix.c
  tools/xenstored: move all socket handling into posix.c
  tools/xenstored: get own domid in stubdom case
  tools/xenstored: rework ring page (un)map functions
  tools/xenstored: split domain_init()
  tools/xenstored: map stubdom interface
  tools/xenstored: mount 9pfs device in stubdom
  tools/xenstored: add helpers for filename handling
  tools/xenstored: support complete log capabilities in stubdom
  tools/xenstored: have a single do_control_memreport()

 docs/man/xl.cfg.5.pod.in                      |   36 +-
 stubdom/xenstore-minios.cfg                   |    2 +-
 stubdom/xenstorepvh-minios.cfg                |    2 +-
 tools/Makefile                                |    1 +
 tools/golang/xenlight/helpers.gen.go          |   10 +
 tools/golang/xenlight/types.gen.go            |   12 +
 tools/helpers/init-xenstore-domain.c          |    9 +
 .../Linux/init.d/sysconfig.xencommons.in      |    1 -
 tools/hotplug/Linux/launch-xenstore.in        |    1 +
 tools/include/libxl.h                         |   17 +
 tools/include/xen-tools/common-macros.h       |   17 +
 tools/libs/light/libxl_9pfs.c                 |  174 +-
 tools/libs/light/libxl_create.c               |    4 +-
 tools/libs/light/libxl_dm.c                   |    2 +-
 tools/libs/light/libxl_types.idl              |   11 +
 tools/libs/light/libxl_types_internal.idl     |    1 +
 tools/xen-9pfsd/.gitignore                    |    1 +
 tools/xen-9pfsd/Makefile                      |   38 +
 tools/xen-9pfsd/io.c                          | 1467 +++++++++++++++++
 tools/xen-9pfsd/xen-9pfsd.c                   |  798 +++++++++
 tools/xen-9pfsd/xen-9pfsd.h                   |   99 ++
 tools/xenstored/Makefile.common               |    4 -
 tools/xenstored/control.c                     |   29 +-
 tools/xenstored/core.c                        |  250 +--
 tools/xenstored/core.h                        |   35 +-
 tools/xenstored/domain.c                      |   81 +-
 tools/xenstored/domain.h                      |    2 +
 tools/xenstored/lu_daemon.c                   |    4 +-
 tools/xenstored/minios.c                      |   93 +-
 tools/xenstored/posix.c                       |  251 ++-
 tools/xl/xl_parse.c                           |   36 +
 xen/include/public/io/9pfs.h                  |   34 +
 32 files changed, 3197 insertions(+), 325 deletions(-)
 create mode 100644 tools/xen-9pfsd/.gitignore
 create mode 100644 tools/xen-9pfsd/Makefile
 create mode 100644 tools/xen-9pfsd/io.c
 create mode 100644 tools/xen-9pfsd/xen-9pfsd.c
 create mode 100644 tools/xen-9pfsd/xen-9pfsd.h

-- 
2.35.3


