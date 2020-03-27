Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 914FF195DED
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 19:53:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHu3g-0007yA-2B; Fri, 27 Mar 2020 18:50:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KiP0=5M=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1jHu3e-0007y0-V7
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 18:50:18 +0000
X-Inumbo-ID: cdaa5976-705b-11ea-b34e-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cdaa5976-705b-11ea-b34e-bc764e2007e4;
 Fri, 27 Mar 2020 18:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wkIEPJ1JuZYRGt6sgE7UBhFdwJdQNrLdrtsw3To1y/8=; b=qPJRlg3mSrI9ZE23tvns+Mimhc
 qpRPjiLTwyhi6mkfoNo0MfL7qaAyCJmJNbGWCw6e7w86ptg/lgNThhmpjMMyArZRTaz2mma3JKlb0
 rOhkyH9bbXp9KajYAH+OEVAuKWwIzVijr2MTzWkZBTtuywvLJJcciNpvExFFamsBhgt0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <paul@xen.org>)
 id 1jHu3b-0008KE-Mz; Fri, 27 Mar 2020 18:50:15 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=u2f063a87eabd5f.cbg10.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <paul@xen.org>)
 id 1jHu3b-0007P4-DG; Fri, 27 Mar 2020 18:50:15 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Date: Fri, 27 Mar 2020 18:50:07 +0000
Message-Id: <20200327185012.1795-1-paul@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Xen-devel] [PATCH 0/5] domain context infrastructure
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Paul Durrant (5):
  xen/common: introduce a new framework for save/restore of 'domain'
    context
  xen/common/domctl: introduce XEN_DOMCTL_get/setdomaincontext
  tools/misc: add xen-ctx to present domain context
  common/domain: add a domain context record for shared_info...
  tools/libxc: make use of domain context SHARED_INFO record...

 .gitignore                          |   1 +
 tools/flask/policy/modules/xen.if   |   4 +-
 tools/libxc/include/xenctrl.h       |  11 ++
 tools/libxc/xc_domain.c             |  52 ++++++
 tools/libxc/xc_sr_common.h          |   7 +-
 tools/libxc/xc_sr_common_x86.c      |  58 ++++++
 tools/libxc/xc_sr_common_x86.h      |   4 +
 tools/libxc/xc_sr_common_x86_pv.c   |  52 ++++++
 tools/libxc/xc_sr_common_x86_pv.h   |   3 +
 tools/libxc/xc_sr_restore_x86_pv.c  |  40 ++---
 tools/libxc/xc_sr_save_x86_pv.c     |  26 +--
 tools/libxc/xg_save_restore.h       |   1 +
 tools/misc/Makefile                 |   4 +
 tools/misc/xen-ctx.c                | 152 ++++++++++++++++
 xen/common/Makefile                 |   1 +
 xen/common/domain.c                 |  55 ++++++
 xen/common/domctl.c                 | 115 ++++++++++++
 xen/common/save.c                   | 262 ++++++++++++++++++++++++++++
 xen/include/public/domctl.h         |  41 ++++-
 xen/include/public/save.h           |  82 +++++++++
 xen/include/public/xen.h            |   3 +
 xen/include/xen/save.h              | 115 ++++++++++++
 xen/xsm/flask/hooks.c               |   6 +
 xen/xsm/flask/policy/access_vectors |   4 +
 24 files changed, 1047 insertions(+), 52 deletions(-)
 create mode 100644 tools/misc/xen-ctx.c
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
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>
-- 
2.20.1


