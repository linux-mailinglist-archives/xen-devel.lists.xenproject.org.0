Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F75B3A9B10
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 14:51:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142933.263577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltV17-0006ou-G0; Wed, 16 Jun 2021 12:51:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142933.263577; Wed, 16 Jun 2021 12:51:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltV17-0006mM-Bu; Wed, 16 Jun 2021 12:51:37 +0000
Received: by outflank-mailman (input) for mailman id 142933;
 Wed, 16 Jun 2021 12:51:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qy3q=LK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ltV16-0006lZ-1h
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 12:51:36 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.24])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 50c90775-fee9-4da9-8daa-1e23d6d55a8e;
 Wed, 16 Jun 2021 12:51:34 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx5GCpWtln
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 16 Jun 2021 14:51:32 +0200 (CEST)
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
X-Inumbo-ID: 50c90775-fee9-4da9-8daa-1e23d6d55a8e
ARC-Seal: i=1; a=rsa-sha256; t=1623847893; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=SpoGYODFxJ/5rDv5XIvz1RqNoqFifqHZwD6DLa4DNHnd/lo3KVLAD+BiLqnbgoT9hL
    oRfHvLbVJgxtnCEUshlXhPJY1QHDZY6xU0kGR8+IYPP13Dfz/Zqqi6tZhZkOK/P7pcGJ
    PIr1eTNNKXXGvvyXMi8TolFvUjhXpv0amWLuGHHzCgvwAYfnkeYCZ97Kww3ulYS9aGli
    TRTuiEmogda+iOSj/QhhdlRIn5EEhIXVMVMbr4Yt0kuzc52oTZOSPW7c4RxxgUDITwmR
    GBAYzgnF4JPQow6k1p4KVzdZNF+6Ul6T3wIQXioBZok0K4F8glSMk1EgEQrYlyBWvrBG
    0GJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847893;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=FAEv0aYDzvB+OwgbknaQXf2VrLPGXUF/L40vFVnPX+s=;
    b=tXIcAeMbFHeCFS6CCX7DQQAmTKxKfqlKccfljrlmWM5kVwJ++lVIUfqL54QrLIeFQI
    RXvMhvSK8q61MkHO2eJh5UlSjCsw5VcRWASYwfS7zNaWFZTAqlZYp+Qvk6RW1xzQgcIc
    Y4EiQpvE0Kx19c2+pXOsOMGmweOsmmxeOCxPUO3DTAArsXq9uz+mFTlG2ymZ7FBydksp
    nBe2UqHf2NkhGEjqZySO0EImfoBEv5iQI/RrEQQcmtYheDA6cOTzost/mvSOuEw8iugE
    iGKngi3+8CvaLuOsM3NcDWwPCcnRJfFFvKMdRU/2MxbCKNC0npigTnSp643oS7a5JuWx
    BafQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847893;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=FAEv0aYDzvB+OwgbknaQXf2VrLPGXUF/L40vFVnPX+s=;
    b=MphKgNpmJvNkbN9WvF7ZtMOP5zZx20+IRAmEaA1JVzYN8asMzg4gbpzK708PHsmh5s
    kCtPjbsoIUYpibIeaeVSVNSCdwNE4JS5VRE6VuDACHtgQLRaCG0iwjpITc5FIbypowsq
    t7TxuM3tcZkLNpWj9ClW1GusLhtOjMHGHMqaWL1hvx/B1IF4NfFsKEgVJoNwaaFk73ic
    1CF1sAK2iLJQv7xRCFSGk+sbpsJWxplxYfUyTZIQ5idjJmi/2wzrVe+FzqNJ6yX5uyrE
    Jmteb896IDU4Vlp975P9KpMxftE3kFPTcG+dPwQ4deNz+LCbmRtXgO+ou878pVxLhwAR
    Cjcw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg5l+Vz7FJgt8+TgOd9sTrMwXjWWExsBKQCrpnqhqg=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>
Subject: [PATCH v20210616 00/36] leftover from 2020
Date: Wed, 16 Jun 2021 14:50:53 +0200
Message-Id: <20210616125129.26563-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Various unreviewed changes, rebase to 4bcf6433ee.

Olaf Hering (36):
  hotplug/Linux: fix starting of xenstored with restarting systemd
  tools: add API to work with sevaral bits at once
  xl: fix description of migrate --debug
  tools: create libxensaverestore
  MAINTAINERS: add myself as saverestore maintainer
  tools: add readv_exact to libxenctrl
  tools: add sr_is_known_page_type to libsaverestore
  tools: use sr_is_known_page_type
  tools: unify type checking for data pfns in migration stream
  tools: show migration transfer rate in send_dirty_pages
  tools: prepare to allocate saverestore arrays once
  tools: save: move mfns array
  tools: save: move types array
  tools: save: move errors array
  tools: save: move iov array
  tools: save: move rec_pfns array
  tools: save: move guest_data array
  tools: save: move local_pages array
  tools: restore: move types array
  tools: restore: move mfns array
  tools: restore: move map_errs array
  tools: restore: move mfns array in populate_pfns
  tools: restore: move pfns array in populate_pfns
  tools: restore: split record processing
  tools: restore: split handle_page_data
  tools: restore: write data directly into guest
  tools: recognize LIBXL_API_VERSION for 4.16
  tools: adjust libxl_domain_suspend to receive a struct props
  tools: change struct precopy_stats to precopy_stats_t
  tools: add callback to libxl for precopy_policy and precopy_stats_t
  tools: add --max_iters to libxl_domain_suspend
  tools: add --min_remaining to libxl_domain_suspend
  tools: add --abort_if_busy to libxl_domain_suspend
  tools: add API for expandable bitmaps
  tools: use sr_bitmap for populated_pfns
  tools: use superpages during restore of HVM guest

 .gitignore                                    |   2 +
 MAINTAINERS                                   |   6 +
 docs/man/xl.1.pod.in                          |  22 +-
 tools/hotplug/Linux/init.d/xencommons.in      |   2 +-
 tools/hotplug/Linux/launch-xenstore.in        |  40 +-
 .../Linux/systemd/xenstored.service.in        |   2 +-
 tools/include/libxl.h                         |  32 +-
 tools/include/xenguest.h                      | 186 -----
 tools/include/xensaverestore.h                | 207 ++++++
 tools/libs/Makefile                           |   1 +
 tools/libs/ctrl/xc_bitops.h                   |  28 +
 tools/libs/ctrl/xc_private.c                  |  57 +-
 tools/libs/ctrl/xc_private.h                  |   1 +
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
 .../xg_sr_common.c => saverestore/common.c}   |  76 ++-
 .../xg_sr_common.h => saverestore/common.h}   | 253 ++++++-
 .../common_x86.c}                             |   2 +-
 .../common_x86.h}                             |   2 +-
 .../common_x86_pv.c}                          |   2 +-
 .../common_x86_pv.h}                          |   2 +-
 .../nomigrate.c}                              |   0
 .../xg_sr_restore.c => saverestore/restore.c} | 617 +++++++++--------
 tools/libs/saverestore/restore_x86_hvm.c      | 645 ++++++++++++++++++
 .../restore_x86_pv.c}                         |  70 +-
 .../xg_sr_save.c => saverestore/save.c}       | 165 ++---
 .../save_restore.h}                           |   2 -
 .../save_x86_hvm.c}                           |   7 +-
 .../save_x86_pv.c}                            |  33 +-
 .../stream_format.h}                          |   0
 tools/libs/uselibs.mk                         |   4 +-
 tools/ocaml/libs/xl/xenlight_stubs.c          |   3 +-
 tools/xl/xl_cmdtable.c                        |  26 +-
 tools/xl/xl_migrate.c                         |  54 +-
 tools/xl/xl_saverestore.c                     |   3 +-
 47 files changed, 2006 insertions(+), 941 deletions(-)
 create mode 100644 tools/include/xensaverestore.h
 delete mode 100644 tools/libs/guest/xg_sr_restore_x86_hvm.c
 create mode 100644 tools/libs/saverestore/Makefile
 rename tools/libs/{guest/xg_sr_common.c => saverestore/common.c} (72%)
 rename tools/libs/{guest/xg_sr_common.h => saverestore/common.h} (68%)
 rename tools/libs/{guest/xg_sr_common_x86.c => saverestore/common_x86.c} (99%)
 rename tools/libs/{guest/xg_sr_common_x86.h => saverestore/common_x86.h} (98%)
 rename tools/libs/{guest/xg_sr_common_x86_pv.c => saverestore/common_x86_pv.c} (99%)
 rename tools/libs/{guest/xg_sr_common_x86_pv.h => saverestore/common_x86_pv.h} (98%)
 rename tools/libs/{guest/xg_nomigrate.c => saverestore/nomigrate.c} (100%)
 rename tools/libs/{guest/xg_sr_restore.c => saverestore/restore.c} (66%)
 create mode 100644 tools/libs/saverestore/restore_x86_hvm.c
 rename tools/libs/{guest/xg_sr_restore_x86_pv.c => saverestore/restore_x86_pv.c} (94%)
 rename tools/libs/{guest/xg_sr_save.c => saverestore/save.c} (88%)
 rename tools/libs/{guest/xg_save_restore.h => saverestore/save_restore.h} (98%)
 rename tools/libs/{guest/xg_sr_save_x86_hvm.c => saverestore/save_x86_hvm.c} (96%)
 rename tools/libs/{guest/xg_sr_save_x86_pv.c => saverestore/save_x86_pv.c} (97%)
 rename tools/libs/{guest/xg_sr_stream_format.h => saverestore/stream_format.h} (100%)


