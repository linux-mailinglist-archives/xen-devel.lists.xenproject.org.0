Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF9C1E4BF4
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 19:35:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdzwW-00030j-EJ; Wed, 27 May 2020 17:34:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=baN0=7J=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1jdzwU-00030e-Kc
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 17:34:14 +0000
X-Inumbo-ID: 4850a874-a040-11ea-9dbe-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4850a874-a040-11ea-9dbe-bc764e2007e4;
 Wed, 27 May 2020 17:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ouw0yJUdxV0BhlDmLIeXobKVtd5FgZApf/B2Dwn+OQM=; b=Uwu1jO1/PuroMhuSvZa5Dcb1Z+
 oU3OjuAHJOk/Arj+oLxoA6ZaKqV68f3MTYa7FjoutIHs7/aj22CKk5HyHL+W8nurzCA0o+lm5jCH4
 4hbqKqddMMOjPry5ObZ13odiCz8YXcKeVZ+SkN0ggJkCro13g9o2gZCBB49As3BTrnx0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jdzwR-00015w-Kv; Wed, 27 May 2020 17:34:11 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=u2f063a87eabd5f.cbg10.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jdzwR-0003od-AJ; Wed, 27 May 2020 17:34:11 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 0/5] domain context infrastructure
Date: Wed, 27 May 2020 18:34:02 +0100
Message-Id: <20200527173407.1398-1-paul@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

Paul Durrant (5):
  xen/common: introduce a new framework for save/restore of 'domain'
    context
  xen/common/domctl: introduce XEN_DOMCTL_get/setdomaincontext
  tools/misc: add xen-domctx to present domain context
  common/domain: add a domain context record for shared_info...
  tools/libxc: make use of domain context SHARED_INFO record...

 .gitignore                             |   1 +
 tools/flask/policy/modules/xen.if      |   4 +-
 tools/libxc/include/xenctrl.h          |   5 +
 tools/libxc/xc_domain.c                |  56 +++++
 tools/libxc/xc_sr_common.c             |  67 ++++++
 tools/libxc/xc_sr_common.h             |  11 +-
 tools/libxc/xc_sr_common_x86_pv.c      |  74 ++++++
 tools/libxc/xc_sr_common_x86_pv.h      |   3 +
 tools/libxc/xc_sr_restore_x86_pv.c     |  26 +-
 tools/libxc/xc_sr_save_x86_pv.c        |  44 ++--
 tools/libxc/xg_save_restore.h          |   1 +
 tools/misc/Makefile                    |   4 +
 tools/misc/xen-domctx.c                | 278 ++++++++++++++++++++++
 xen/common/Makefile                    |   1 +
 xen/common/domain.c                    |  70 ++++++
 xen/common/domctl.c                    | 173 ++++++++++++++
 xen/common/save.c                      | 315 +++++++++++++++++++++++++
 xen/include/public/arch-arm/hvm/save.h |   5 +
 xen/include/public/arch-x86/hvm/save.h |   5 +
 xen/include/public/domctl.h            |  41 ++++
 xen/include/public/save.h              | 100 ++++++++
 xen/include/xen/save.h                 | 170 +++++++++++++
 xen/xsm/flask/hooks.c                  |   6 +
 xen/xsm/flask/policy/access_vectors    |   4 +
 24 files changed, 1418 insertions(+), 46 deletions(-)
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
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Wei Liu <wl@xen.org>
-- 
2.20.1


