Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DC6397796
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 18:11:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134978.250979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo6zJ-0005HI-PO; Tue, 01 Jun 2021 16:11:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134978.250979; Tue, 01 Jun 2021 16:11:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo6zJ-0005Em-M8; Tue, 01 Jun 2021 16:11:29 +0000
Received: by outflank-mailman (input) for mailman id 134978;
 Tue, 01 Jun 2021 16:11:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HQ7/=K3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lo6zI-0005Ec-1S
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 16:11:28 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.21])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 032e56eb-b77e-45fe-b95a-fb2950e57e76;
 Tue, 01 Jun 2021 16:11:26 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx51GBO1B5
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 1 Jun 2021 18:11:24 +0200 (CEST)
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
X-Inumbo-ID: 032e56eb-b77e-45fe-b95a-fb2950e57e76
ARC-Seal: i=1; a=rsa-sha256; t=1622563885; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=o8goBTfDenihvrljGvM2v005zlEHG9m3nfjPFkZi+A8YYUoOXANIc/PMTs2jKJtIXc
    lILFicKM6EtuEJN30gTYYvTISdXa+nfEoqRn4ziuUEhFbkDAMX5qiTCfrf78WSaMadyo
    UIITWgrFrEkP+0gz0ewjWxnQT8tiZgd007T8RwW86VPpUPON8TvVc/gGV2s0c476A6TV
    agR0h9HREPQHHMnx3iNnxkgZuEtH5oXGae6ws1KtP4jgwISbIlFATM+5WZswQAZp5TXz
    XlM3uQrxI/Fvg44UAFyjH4PM9otFaCeyhTTQZRHSS/f7K8yTUNys0xWe8zGq+mCgtGfZ
    xZ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563885;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=bw53oX3KFyhVByZkDFnW7+r8yCMylKYkPgRao8lX0jQ=;
    b=nTyRSGG038jERdFo72r9AEpau6SvPmKojB17028m0nlQ+9NAyVZc5InMFvUJdGqrVH
    AAtg0kjxm4erZWPvaWodgDMyReMmuW6qktjr0hpBLrPYZarwtXd2w7JsFjAVLTf9MPmg
    jLS9JoMZJTb88LJPBlsskVWLkmotIryv5cNEYA5Q3p8///cGNe0093qjJHGfVZ5rTpx0
    4tT7qnXbjubedi0B4jfB4IYc0GlyR+/CJHtfd+8cbQ6+u/gSzWyH86ainV+8F8OvTDD3
    1tdONo4S750Lf7hA2Yh34j4ct4bZM0Sofzepsklx0AHBXppMIoX36/Jh4eRZkvrB5pJW
    XUzA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563885;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=bw53oX3KFyhVByZkDFnW7+r8yCMylKYkPgRao8lX0jQ=;
    b=QoPbrLy6f99MRAPXmhdUHvgE6u28C46qd/vJ7g7LIN5QXuvMlVh35HbD90EKiemLye
    DHvXQ0msSeCiM6hCz9ZLjCd6gklpI9i696MtU0u0m6bBhWyUF81y3ekubgYX2uTpP/Mg
    hkdIrsegqZl733o0flIemXNYKBs5BGoDRigoGtejw/Cgl/+RCXGGOqYps0fshEo7GtIQ
    bqAIbspLY/cbCBjAizcyHGf6XZckpWcqTZGz2Z1rOpHf/Pw/xcFBQr0psiMNFJ+Pggu8
    No64kSjvhOPmewQh7RyiSayDHcOPl7hjaS+XSq/GwNzuThFOo0x74ajTvSLU8Gm7XADt
    EY/Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs09ValFcstyKtnZMLOo4jr88Zf5nXI1mYJUK+h"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>
Subject: [PATCH v20210601 00/38] leftover from 2020
Date: Tue,  1 Jun 2021 18:10:40 +0200
Message-Id: <20210601161118.18986-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Various unreviewed changes, rebase to 57f68dfd2d.

Olaf Hering (38):
  tools: add API to work with sevaral bits at once
  xl: fix description of migrate --debug
  tools: create libxensaverestore
  tools: add readv_exact to libxenctrl
  tools: add xc_is_known_page_type to libxenctrl
  tools: use xc_is_known_page_type
  tools: unify type checking for data pfns in migration stream
  tools: show migration transfer rate in send_dirty_pages
  tools/guest: prepare to allocate arrays once
  tools/guest: save: move batch_pfns
  tools/guest: save: move mfns array
  tools/guest: save: move types array
  tools/guest: save: move errors array
  tools/guest: save: move iov array
  tools/guest: save: move rec_pfns array
  tools/guest: save: move guest_data array
  tools/guest: save: move local_pages array
  tools/guest: restore: move pfns array
  tools/guest: restore: move types array
  tools/guest: restore: move mfns array
  tools/guest: restore: move map_errs array
  tools/guest: restore: move mfns array in populate_pfns
  tools/guest: restore: move pfns array in populate_pfns
  tools/guest: restore: split record processing
  tools/guest: restore: split handle_page_data
  tools/guest: restore: write data directly into guest
  tools: recognize LIBXL_API_VERSION for 4.16
  tools: adjust libxl_domain_suspend to receive a struct props
  tools: change struct precopy_stats to precopy_stats_t
  tools: add callback to libxl for precopy_policy and precopy_stats_t
  tools: add --max_iters to libxl_domain_suspend
  tools: add --min_remaining to libxl_domain_suspend
  tools: add --abort_if_busy to libxl_domain_suspend
  tools: add API for expandable bitmaps
  tools: use xg_sr_bitmap for populated_pfns
  tools: use superpages during restore of HVM guest
  tools: remove migration stream verify code
  hotplug/Linux: fix starting of xenstored with restarting systemd

 .gitignore                                    |   2 +
 docs/man/xl.1.pod.in                          |  24 +-
 tools/hotplug/Linux/init.d/xencommons.in      |   2 +-
 tools/hotplug/Linux/launch-xenstore.in        |  40 +-
 .../Linux/systemd/xenstored.service.in        |   2 +-
 tools/include/libxl.h                         |  32 +-
 tools/include/xenguest.h                      | 186 -----
 tools/include/xensaverestore.h                | 207 ++++++
 tools/libs/Makefile                           |   1 +
 tools/libs/ctrl/xc_bitops.h                   |  25 +
 tools/libs/ctrl/xc_private.c                  |  55 +-
 tools/libs/ctrl/xc_private.h                  |  34 +
 tools/libs/guest/Makefile                     |  11 -
 tools/libs/guest/xg_dom_x86.c                 |   5 -
 tools/libs/guest/xg_offline_page.c            |   1 -
 tools/libs/guest/xg_private.h                 |   5 +
 tools/libs/guest/xg_sr_restore_x86_hvm.c      | 274 --------
 tools/libs/light/Makefile                     |   4 +-
 tools/libs/light/libxl_dom_save.c             |  24 +
 tools/libs/light/libxl_domain.c               |  10 +-
 tools/libs/light/libxl_internal.h             |   7 +
 tools/libs/light/libxl_save_helper.c          |   1 +
 tools/libs/light/libxl_save_msgs_gen.pl       |   5 +-
 tools/libs/light/libxl_stream_write.c         |   9 +-
 tools/libs/light/libxl_types.idl              |   1 +
 tools/libs/saverestore/Makefile               |  38 ++
 .../xg_sr_common.c => saverestore/common.c}   |  77 ++-
 .../xg_sr_common.h => saverestore/common.h}   | 224 +++++-
 .../common_x86.c}                             |   2 +-
 .../common_x86.h}                             |   2 +-
 .../common_x86_pv.c}                          |   2 +-
 .../common_x86_pv.h}                          |   2 +-
 .../nomigrate.c}                              |   0
 .../xg_sr_restore.c => saverestore/restore.c} | 598 ++++++++--------
 tools/libs/saverestore/restore_x86_hvm.c      | 644 ++++++++++++++++++
 .../restore_x86_pv.c}                         |  70 +-
 .../xg_sr_save.c => saverestore/save.c}       | 209 +++---
 .../save_restore.h}                           |   2 -
 .../save_x86_hvm.c}                           |   7 +-
 .../save_x86_pv.c}                            |  33 +-
 .../stream_format.h}                          |   0
 tools/libs/uselibs.mk                         |   4 +-
 tools/ocaml/libs/xl/xenlight_stubs.c          |   3 +-
 tools/xl/xl_cmdtable.c                        |  26 +-
 tools/xl/xl_migrate.c                         |  54 +-
 tools/xl/xl_saverestore.c                     |   3 +-
 46 files changed, 1970 insertions(+), 997 deletions(-)
 create mode 100644 tools/include/xensaverestore.h
 delete mode 100644 tools/libs/guest/xg_sr_restore_x86_hvm.c
 create mode 100644 tools/libs/saverestore/Makefile
 rename tools/libs/{guest/xg_sr_common.c => saverestore/common.c} (71%)
 rename tools/libs/{guest/xg_sr_common.h => saverestore/common.h} (70%)
 rename tools/libs/{guest/xg_sr_common_x86.c => saverestore/common_x86.c} (99%)
 rename tools/libs/{guest/xg_sr_common_x86.h => saverestore/common_x86.h} (98%)
 rename tools/libs/{guest/xg_sr_common_x86_pv.c => saverestore/common_x86_pv.c} (99%)
 rename tools/libs/{guest/xg_sr_common_x86_pv.h => saverestore/common_x86_pv.h} (98%)
 rename tools/libs/{guest/xg_nomigrate.c => saverestore/nomigrate.c} (100%)
 rename tools/libs/{guest/xg_sr_restore.c => saverestore/restore.c} (67%)
 create mode 100644 tools/libs/saverestore/restore_x86_hvm.c
 rename tools/libs/{guest/xg_sr_restore_x86_pv.c => saverestore/restore_x86_pv.c} (94%)
 rename tools/libs/{guest/xg_sr_save.c => saverestore/save.c} (85%)
 rename tools/libs/{guest/xg_save_restore.h => saverestore/save_restore.h} (98%)
 rename tools/libs/{guest/xg_sr_save_x86_hvm.c => saverestore/save_x86_hvm.c} (96%)
 rename tools/libs/{guest/xg_sr_save_x86_pv.c => saverestore/save_x86_pv.c} (97%)
 rename tools/libs/{guest/xg_sr_stream_format.h => saverestore/stream_format.h} (100%)


