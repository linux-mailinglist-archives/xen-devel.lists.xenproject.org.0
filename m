Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7512482FE
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 12:31:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7yt5-0005zd-Gv; Tue, 18 Aug 2020 10:30:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pr8P=B4=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1k7yt3-0005zI-Lo
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 10:30:37 +0000
X-Inumbo-ID: 64f467a5-1e2d-4737-a8f9-9b0c9a029722
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 64f467a5-1e2d-4737-a8f9-9b0c9a029722;
 Tue, 18 Aug 2020 10:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From;
 bh=u2sW8Qo9MZlEDttqIvbdtCRRB8ULCbaykqttrxV2p/Q=; b=nSeOaABZtNp8bQJa1vV9k2kccc
 +SzQYfsKA9LWEKK6p06X3H3ORSMiVvewqHSIrbtXBfFFOfTdzfvmQMsais7Vz6d9PUknhluWJWnzY
 xeeMd/lUtjc3rgPNGjFFI1R3gapPTeicXz5H390fHEzl2e07DwknvlcML7VUezKWOSb0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k7yt1-00013L-67; Tue, 18 Aug 2020 10:30:35 +0000
Received: from host31-48-92-96.range31-48.btcentralplus.com ([31.48.92.96]
 helo=u2f063a87eabd5f.home) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k7yt0-0003Rw-SL; Tue, 18 Aug 2020 10:30:35 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, 
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v7 0/9] domain context infrastructure
Date: Tue, 18 Aug 2020 11:30:23 +0100
Message-Id: <20200818103032.3050-1-paul@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

The first 3 patches of the series are largely the same as v6 but patches
4 thru 9 are basically new (patch 7 being inherited from v6 but heavily
re-worked).
Patch 4 is cleanup work that I noticed needed doing whilst working patch 5.

Paul Durrant (9):
  xen/common: introduce a new framework for save/restore of 'domain'
    context
  xen/common/domctl: introduce XEN_DOMCTL_get/setdomaincontext
  tools/misc: add xen-domctx to present domain context
  docs/specs: add missing definitions to libxc-migration-stream
  docs / tools: specific migration v4 to include DOMAIN_CONTEXT
  tools/libxc: split restore handler handle_shared_info() functionality
  common/domain: add a domain context record for shared_info...
  x86/time: add a domain context record for tsc_info...
  tools/libxc: add DOMAIN_CONTEXT records to the migration stream...

 .gitignore                               |   1 +
 docs/specs/libxc-migration-stream.pandoc |  69 ++++-
 tools/flask/policy/modules/xen.if        |   4 +-
 tools/libxc/include/xenctrl.h            |   5 +
 tools/libxc/xc_domain.c                  |  56 ++++
 tools/libxc/xc_sr_common.c               |   1 +
 tools/libxc/xc_sr_common.h               |   3 +
 tools/libxc/xc_sr_common_x86.c           |  20 --
 tools/libxc/xc_sr_common_x86.h           |   6 -
 tools/libxc/xc_sr_restore.c              |  45 +++-
 tools/libxc/xc_sr_restore_x86_pv.c       |  31 ++-
 tools/libxc/xc_sr_save.c                 |  52 +++-
 tools/libxc/xc_sr_save_x86_hvm.c         |   5 -
 tools/libxc/xc_sr_save_x86_pv.c          |  22 --
 tools/libxc/xc_sr_stream_format.h        |   1 +
 tools/misc/Makefile                      |   4 +
 tools/misc/xen-domctx.c                  | 290 +++++++++++++++++++++
 tools/python/xen/migration/libxc.py      |   2 +
 xen/arch/x86/time.c                      |  34 ++-
 xen/common/Makefile                      |   1 +
 xen/common/domain.c                      | 114 ++++++++
 xen/common/domctl.c                      | 173 +++++++++++++
 xen/common/save.c                        | 315 +++++++++++++++++++++++
 xen/include/asm-x86/time.h               |   5 +-
 xen/include/public/arch-arm/hvm/save.h   |   5 +
 xen/include/public/arch-x86/hvm/save.h   |   5 +
 xen/include/public/domctl.h              |  41 +++
 xen/include/public/save.h                | 111 ++++++++
 xen/include/xen/save.h                   | 170 ++++++++++++
 xen/xsm/flask/hooks.c                    |   6 +
 xen/xsm/flask/policy/access_vectors      |   4 +
 31 files changed, 1525 insertions(+), 76 deletions(-)
 create mode 100644 tools/misc/xen-domctx.c
 create mode 100644 xen/common/save.c
 create mode 100644 xen/include/public/save.h
 create mode 100644 xen/include/xen/save.h
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: "Marek Marczykowski-Górecki" <marmarek@invisiblethingslab.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Wei Liu <wl@xen.org>
-- 
2.20.1


