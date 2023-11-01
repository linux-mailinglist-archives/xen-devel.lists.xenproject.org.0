Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D051D7DDE76
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 10:33:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626227.976312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7bR-0005uC-8P; Wed, 01 Nov 2023 09:33:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626227.976312; Wed, 01 Nov 2023 09:33:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7bR-0005sT-4D; Wed, 01 Nov 2023 09:33:33 +0000
Received: by outflank-mailman (input) for mailman id 626227;
 Wed, 01 Nov 2023 09:33:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFMy=GO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qy7bP-0005sN-JY
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 09:33:31 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b72cf1d2-7899-11ee-9b0e-b553b5be7939;
 Wed, 01 Nov 2023 10:33:29 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E7C5A21846;
 Wed,  1 Nov 2023 09:33:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B23F713460;
 Wed,  1 Nov 2023 09:33:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id p5fmKWgbQmWXCAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 01 Nov 2023 09:33:28 +0000
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
X-Inumbo-ID: b72cf1d2-7899-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698831208; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=N4aL5QrzCM57AYkQNt/qmawwf/09AoMlJ0aX++1dujc=;
	b=IWGuxDDP5P8GGJxSLkfENxEEPBpMuaYIg69rLKtFrOYvNXggpLoMxUUb7YSSriA46ZzA20
	HcqVwNQKrKPhnKh43UeQxVZxAvAxIo47BiUhrl8veWqMgO4DQQ6gOlna9Pjsms/wEXeLPJ
	9IhNa9r5c6NOBQX38IHTG5N9j0aoSHE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <julien@xen.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH 00/29] tools: enable xenstore-stubdom to use 9pfs
Date: Wed,  1 Nov 2023 10:32:56 +0100
Message-Id: <20231101093325.30302-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

Note that the series can only be committed after the related Mini-OS
series [1] has gone in.

[1]: https://lists.xen.org/archives/html/xen-devel/2023-11/threads.html#00010


Juergen Gross (29):
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
  tools/xl: support new 9pfs backend xenlogd
  tools/helpers: allocate xenstore event channel for xenstore stubdom
  tools/xenstored: rename xenbus_evtchn()
  stubdom: extend xenstore stubdom configs
  tools: add 9pfs device to xenstore-stubdom
  tools: tell xenstore-stubdom its own domid
  tools/xenstored:
  tools/xenstored: split domain_init()
  tools/xenstored: map stubdom interface
  tools/xenstored: mount 9pfs device in stubdom
  tools/xenstored: add helpers for filename handling
  tools/xenstored: add daemon_init() function
  tools/xenstored: support complete log capabilities in stubdom
  tools/xenstored: have a single do_control_memreport()

 docs/man/xl.cfg.5.pod.in                  |   36 +-
 stubdom/xenstore-minios.cfg               |    2 +-
 stubdom/xenstorepvh-minios.cfg            |    2 +-
 tools/Makefile                            |    1 +
 tools/helpers/init-xenstore-domain.c      |   13 +-
 tools/hotplug/Linux/launch-xenstore.in    |    1 +
 tools/include/libxl.h                     |   17 +
 tools/include/xen-tools/common-macros.h   |    4 +
 tools/libs/light/libxl_9pfs.c             |  172 ++-
 tools/libs/light/libxl_create.c           |    4 +-
 tools/libs/light/libxl_dm.c               |    2 +-
 tools/libs/light/libxl_types.idl          |   11 +
 tools/libs/light/libxl_types_internal.idl |    1 +
 tools/xenlogd/.gitignore                  |    1 +
 tools/xenlogd/Makefile                    |   38 +
 tools/xenlogd/io.c                        | 1337 +++++++++++++++++++++
 tools/xenlogd/xenlogd.c                   |  715 +++++++++++
 tools/xenlogd/xenlogd.h                   |   85 ++
 tools/xenstored/control.c                 |   29 +-
 tools/xenstored/core.c                    |   28 +-
 tools/xenstored/core.h                    |   12 +-
 tools/xenstored/domain.c                  |   72 +-
 tools/xenstored/domain.h                  |    2 +
 tools/xenstored/lu_daemon.c               |    4 +-
 tools/xenstored/minios.c                  |   49 +-
 tools/xenstored/posix.c                   |   18 +-
 tools/xl/xl_parse.c                       |   35 +
 xen/include/public/io/9pfs.h              |   34 +
 28 files changed, 2655 insertions(+), 70 deletions(-)
 create mode 100644 tools/xenlogd/.gitignore
 create mode 100644 tools/xenlogd/Makefile
 create mode 100644 tools/xenlogd/io.c
 create mode 100644 tools/xenlogd/xenlogd.c
 create mode 100644 tools/xenlogd/xenlogd.h

-- 
2.35.3


