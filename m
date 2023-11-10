Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E637E7D8F
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 17:09:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630464.983293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1U3N-0004Ag-Ec; Fri, 10 Nov 2023 16:08:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630464.983293; Fri, 10 Nov 2023 16:08:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1U3N-00048S-BW; Fri, 10 Nov 2023 16:08:17 +0000
Received: by outflank-mailman (input) for mailman id 630464;
 Fri, 10 Nov 2023 16:08:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ap16=GX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r1U3M-00048H-F3
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 16:08:16 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 586a9784-7fe3-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 17:08:11 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 24575219B5;
 Fri, 10 Nov 2023 16:08:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E2C8F13398;
 Fri, 10 Nov 2023 16:08:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id moMDNmZVTmVPCAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 10 Nov 2023 16:08:06 +0000
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
X-Inumbo-ID: 586a9784-7fe3-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699632487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Oy6p5mHKldYOArZoGEoFZdgZCp4/yrE2J+vFUsp0epM=;
	b=hMuAXtTyaKZlOUCppPhgnS07yfb0wG0YpCY15a4d01bDOK3PaDf/+PNYYM4rZD8IRTBQcl
	Dl2z819wEc6jeAhiV8CTKq/pfd52HeuqVCbOew4Kk5xZ3qCuzz2h+tEF2I42/E2x8F3mio
	KJ73bwp7JJwKdi9AhFebWXy1Oku4374=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <julien@xen.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH v2 00/29] tools: enable xenstore-stubdom to use 9pfs
Date: Fri, 10 Nov 2023 17:07:35 +0100
Message-Id: <20231110160804.29021-1-jgross@suse.com>
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

[1]: https://lists.xen.org/archives/html/xen-devel/2023-11/threads.html#00639

Changes in V2:
- support of multiple rings per device
- xenlogd->xen-9pfsd rename
- addressed review comments
- fixed some bugs

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
  tools/xl: support new 9pfs backend xen-9pfsd
  tools/helpers: allocate xenstore event channel for xenstore stubdom
  tools/xenstored: rename xenbus_evtchn()
  stubdom: extend xenstore stubdom configs
  tools: add 9pfs device to xenstore-stubdom
  tools/xenstored: add early_init() function
  tools/xenstored: get own domid in stubdom case
  tools/xenstored: rework ring page (un)map functions
  tools/xenstored: split domain_init()
  tools/xenstored: map stubdom interface
  tools/xenstored: mount 9pfs device in stubdom
  tools/xenstored: add helpers for filename handling
  tools/xenstored: support complete log capabilities in stubdom
  tools/xenstored: have a single do_control_memreport()

 docs/man/xl.cfg.5.pod.in                  |   36 +-
 stubdom/xenstore-minios.cfg               |    2 +-
 stubdom/xenstorepvh-minios.cfg            |    2 +-
 tools/Makefile                            |    1 +
 tools/helpers/init-xenstore-domain.c      |    9 +
 tools/hotplug/Linux/launch-xenstore.in    |    1 +
 tools/include/libxl.h                     |   17 +
 tools/include/xen-tools/common-macros.h   |    4 +
 tools/libs/light/libxl_9pfs.c             |  174 ++-
 tools/libs/light/libxl_create.c           |    4 +-
 tools/libs/light/libxl_dm.c               |    2 +-
 tools/libs/light/libxl_types.idl          |   11 +
 tools/libs/light/libxl_types_internal.idl |    1 +
 tools/xen-9pfsd/.gitignore                |    1 +
 tools/xen-9pfsd/Makefile                  |   38 +
 tools/xen-9pfsd/io.c                      | 1462 +++++++++++++++++++++
 tools/xen-9pfsd/xen-9pfsd.c               |  770 +++++++++++
 tools/xen-9pfsd/xen-9pfsd.h               |   98 ++
 tools/xenstored/control.c                 |   29 +-
 tools/xenstored/core.c                    |   20 +-
 tools/xenstored/core.h                    |   13 +-
 tools/xenstored/domain.c                  |   72 +-
 tools/xenstored/domain.h                  |    2 +
 tools/xenstored/lu_daemon.c               |    4 +-
 tools/xenstored/minios.c                  |   54 +-
 tools/xenstored/posix.c                   |   18 +-
 tools/xl/xl_parse.c                       |   36 +
 xen/include/public/io/9pfs.h              |   34 +
 28 files changed, 2847 insertions(+), 68 deletions(-)
 create mode 100644 tools/xen-9pfsd/.gitignore
 create mode 100644 tools/xen-9pfsd/Makefile
 create mode 100644 tools/xen-9pfsd/io.c
 create mode 100644 tools/xen-9pfsd/xen-9pfsd.c
 create mode 100644 tools/xen-9pfsd/xen-9pfsd.h

-- 
2.35.3


