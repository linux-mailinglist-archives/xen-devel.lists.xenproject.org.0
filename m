Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF462D9F35
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 19:36:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52382.91590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koshG-0001qm-5K; Mon, 14 Dec 2020 18:35:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52382.91590; Mon, 14 Dec 2020 18:35:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koshF-0001pm-Oq; Mon, 14 Dec 2020 18:35:45 +0000
Received: by outflank-mailman (input) for mailman id 52382;
 Mon, 14 Dec 2020 16:36:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nuho=FS=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1koqqF-0006vN-IW
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 16:36:55 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 48725c45-d918-4625-8df9-1a2d00cdb5b0;
 Mon, 14 Dec 2020 16:36:34 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0BEGaW4U006564;
 Mon, 14 Dec 2020 17:36:32 +0100 (CET)
Received: from borneo.soc.lip6.fr (borneo [132.227.103.47])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 0BEGaWqO005623;
 Mon, 14 Dec 2020 17:36:32 +0100 (MET)
Received: by borneo.soc.lip6.fr (Postfix, from userid 373)
 id 8BA1FAAC66; Mon, 14 Dec 2020 17:36:32 +0100 (MET)
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
X-Inumbo-ID: 48725c45-d918-4625-8df9-1a2d00cdb5b0
From: Manuel Bouyer <bouyer@netbsd.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>
Subject: [PATCH 00/24] NetBSD fixes
Date: Mon, 14 Dec 2020 17:35:59 +0100
Message-Id: <20201214163623.2127-1-bouyer@netbsd.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 14 Dec 2020 17:36:32 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

Hello,
here is a set of 24 patches, which are needed to build and run the
tools on NetBSD. They are extracted from NetBSD's pkgsrc repository for
Xen 4.13, and ported to 4.15. 

Manuel Bouyer (24):
  Fix lock directory path for NetBSD
  NetBSD doens't need xenbackendd with xl toolstack
  Fix lock directory path for NetBSD
  Make it build on NetBSD
  Introduce locking functions for block device setup on NetBSD
  Handle the case where vifname is not present in xenstore.
  Remove NetBSD's system headers. We'll use the system-provided ones,
    which are up to date.
  Make it build on NetBSD
  Use xen/xenio.h on NetBSD
  Make it build on NetBSD
  Implement foreignmemory on NetBSD
  Implement gnttab on NetBSD
  Don't assume tv_sec is a unsigned long (for NetBSD)
  Pass bridge name to qemu When starting qemu, set an environnement
    variable XEN_DOMAIN_ID, to be used by qemu helper scripts
  Make it build on NetBSD
  Switch NetBSD to QEMU_XEN (!traditional)
  Make it build on NetBSD
  This doens't need xen/sys/evtchn.h (NetBSD fix)
  errno may not be a gobal R/W variable, use a local variable instead
    (fix build on NetBSD)
  If FILENAME_MAX is defined, use it instead of arbitrary value (fix
    format-truncation errors with GCC >= 7)
  Fix unused functions/variables error
  If PTHREAD_STACK_MIN is not defined, use DEFAULT_THREAD_STACKSIZE
  Use xen/xenio.h on NetBSD
  Fix error: array subscript has type 'char' [-Werror=char-subscripts]

 m4/paths.m4                                   |   2 +-
 tools/Makefile                                |   1 -
 tools/configure                               |   2 +-
 tools/debugger/gdbsx/xg/xg_main.c             |  11 +
 tools/hotplug/NetBSD/Makefile                 |   1 +
 tools/hotplug/NetBSD/block                    |   5 +-
 tools/hotplug/NetBSD/locking.sh               |  72 +++++
 tools/hotplug/NetBSD/vif-bridge               |   5 +-
 tools/hotplug/NetBSD/vif-ip                   |   4 +
 tools/include/Makefile                        |   2 +-
 tools/include/xen-sys/NetBSD/evtchn.h         |  86 ------
 tools/include/xen-sys/NetBSD/privcmd.h        | 106 -------
 tools/libs/call/netbsd.c                      |  18 +-
 tools/libs/call/private.h                     |   8 +-
 tools/libs/ctrl/xc_private.h                  |   4 +
 tools/libs/evtchn/netbsd.c                    |   8 +-
 tools/libs/foreignmemory/Makefile             |   2 +-
 tools/libs/foreignmemory/netbsd.c             |  76 ++++-
 tools/libs/foreignmemory/private.h            |  10 +-
 tools/libs/gnttab/Makefile                    |   2 +-
 tools/libs/gnttab/netbsd.c                    | 267 ++++++++++++++++++
 tools/libs/light/libxl_create.c               |   8 +-
 tools/libs/light/libxl_dm.c                   |  19 ++
 tools/libs/light/libxl_netbsd.c               |   2 +-
 tools/libs/light/libxl_qmp.c                  |   2 +-
 tools/libs/light/libxl_uuid.c                 |   4 +-
 tools/libs/stat/xenstat_netbsd.c              |  11 -
 tools/libs/store/xs.c                         |   4 +
 tools/ocaml/libs/eventchn/xeneventchn_stubs.c |   1 -
 tools/xenpaging/xenpaging.c                   |   5 +-
 tools/xenpmd/xenpmd.c                         |   4 +
 tools/xentrace/xentrace.c                     |   2 +-
 xen/tools/symbols.c                           |   4 +-
 33 files changed, 508 insertions(+), 250 deletions(-)
 create mode 100644 tools/hotplug/NetBSD/locking.sh
 delete mode 100644 tools/include/xen-sys/NetBSD/evtchn.h
 delete mode 100644 tools/include/xen-sys/NetBSD/privcmd.h
 create mode 100644 tools/libs/gnttab/netbsd.c

-- 
2.28.0


