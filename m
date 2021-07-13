Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB4D3C761D
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 20:06:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155536.287105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3MnQ-0002Wo-6P; Tue, 13 Jul 2021 18:06:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155536.287105; Tue, 13 Jul 2021 18:06:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3MnQ-0002UR-2E; Tue, 13 Jul 2021 18:06:16 +0000
Received: by outflank-mailman (input) for mailman id 155536;
 Tue, 13 Jul 2021 18:06:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W9Py=MF=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m3MnO-0002UL-J6
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 18:06:14 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30fc50c8-e1dc-4ff1-8d1d-4c356814afbf;
 Tue, 13 Jul 2021 18:06:12 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx6DI6BtAh
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 13 Jul 2021 20:06:11 +0200 (CEST)
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
X-Inumbo-ID: 30fc50c8-e1dc-4ff1-8d1d-4c356814afbf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1626199571;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=mthTF5r+qAPoUx8ZZzZfwGJJ6UKC6kYK5J2l3AApMng=;
    b=RwKDSyLHacX4KZRAxY6H5/2WZZLcFY5/r0D8V+pOJJLSLc9gd9z4BpPmsnx7RggbrU
    Irb5Rl2s6Fep4iI9Mh0FVjboWzPyAsIhp3p4YRwE2bMe8BFZxOPn1upS+Nq0+nIZsrcy
    8JeFFtW7KoHPU3HYQsnxrm6zFQft5fs2f1MBf03ktTsNJ4GZaP9n7RugpUclz/5t0+dP
    gXMBPDVB9pXc/EufDaSHV1wIqM/Y8QuLI7weLHbhd9GdMdienjGu/wJ6VEm9dCfkG6bt
    oxYXMPVR/orohGIhwosMHQbfkd8mKE7NLVNr5QJfDgsXAHnObs1iorVr+feiMOfFuKQ3
    QR+g==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgthqlagRsstpH9XYEN5v9xf7dypFU9ge5p0Oi0V"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>
Subject: [PATCH v20210713 00/31] leftover from 2020
Date: Tue, 13 Jul 2021 20:05:34 +0200
Message-Id: <20210713180605.12096-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Various unreviewed changes, rebase to 3a98c1a4ce.

Olaf Hering (31):
  tools: fix make rpmball
  hotplug/Linux: fix starting of xenstored with restarting systemd
  tools: add API to work with sevaral bits at once
  xl: fix description of migrate --debug
  tools: add readv_exact to libxenctrl
  tools: show migration transfer rate in send_dirty_pages
  tools: save: preallocate mfns array
  tools: save: preallocate types array
  tools: save: preallocate errors array
  tools: save: preallocate iov array
  tools: save: preallocate rec_pfns array
  tools: save: preallocate guest_data array
  tools: save: preallocate local_pages array
  tools: restore: preallocate pfns array
  tools: restore: preallocate types array
  tools: restore: preallocate mfns array
  tools: restore: preallocate map_errs array
  tools: restore: preallocate populate_pfns pfns array
  tools: restore: preallocate populate_pfns mfns array
  tools: restore: split record processing
  tools: restore: split handle_page_data
  tools: restore: write data directly into guest
  tools: recognize LIBXL_API_VERSION for 4.16
  tools: adjust libxl_domain_suspend to receive a struct props
  tools: add callback to libxl for precopy_policy and precopy_stats
  tools: add --max_iters to libxl_domain_suspend
  tools: add --min_remaining to libxl_domain_suspend
  tools: add --abort_if_busy to libxl_domain_suspend
  tools: add API for expandable bitmaps
  tools: use xg_sr_bitmap for populated_pfns
  tools: use superpages during restore of HVM guest

 docs/man/xl.1.pod.in                          |  24 +-
 tools/hotplug/Linux/init.d/xencommons.in      |   2 +-
 tools/hotplug/Linux/launch-xenstore.in        |  40 +-
 .../Linux/systemd/xenstored.service.in        |   2 +-
 tools/include/libxl.h                         |  32 +-
 tools/libs/ctrl/xc_bitops.h                   |  28 +
 tools/libs/ctrl/xc_private.c                  |  57 +-
 tools/libs/ctrl/xc_private.h                  |   1 +
 tools/libs/guest/xg_dom_x86.c                 |   5 -
 tools/libs/guest/xg_private.h                 |   5 +
 tools/libs/guest/xg_sr_common.c               |  72 ++-
 tools/libs/guest/xg_sr_common.h               | 162 ++++-
 tools/libs/guest/xg_sr_restore.c              | 601 +++++++++++-------
 tools/libs/guest/xg_sr_restore_x86_hvm.c      | 371 +++++++++++
 tools/libs/guest/xg_sr_restore_x86_pv.c       |  68 +-
 tools/libs/guest/xg_sr_save.c                 | 188 +++---
 tools/libs/guest/xg_sr_save_x86_hvm.c         |   5 +-
 tools/libs/guest/xg_sr_save_x86_pv.c          |  31 +-
 tools/libs/light/libxl_dom_save.c             |  24 +
 tools/libs/light/libxl_domain.c               |  10 +-
 tools/libs/light/libxl_internal.h             |   6 +
 tools/libs/light/libxl_save_msgs_gen.pl       |   3 +-
 tools/libs/light/libxl_stream_write.c         |   9 +-
 tools/libs/light/libxl_types.idl              |   1 +
 tools/misc/mkrpm                              |  33 +-
 tools/ocaml/libs/xl/xenlight_stubs.c          |   3 +-
 tools/xl/xl_cmdtable.c                        |  26 +-
 tools/xl/xl_migrate.c                         |  54 +-
 tools/xl/xl_saverestore.c                     |   3 +-
 29 files changed, 1436 insertions(+), 430 deletions(-)


