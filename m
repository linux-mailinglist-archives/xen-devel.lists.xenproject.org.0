Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE694287BF1
	for <lists+xen-devel@lfdr.de>; Thu,  8 Oct 2020 20:58:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4559.11946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQb6s-0005V6-FB; Thu, 08 Oct 2020 18:57:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4559.11946; Thu, 08 Oct 2020 18:57:50 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQb6s-0005UX-AM; Thu, 08 Oct 2020 18:57:50 +0000
Received: by outflank-mailman (input) for mailman id 4559;
 Thu, 08 Oct 2020 18:57:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3RzB=DP=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kQb6q-0005RO-OX
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 18:57:48 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d15dbb8b-9b40-4fbc-a5ba-a99a04bb68db;
 Thu, 08 Oct 2020 18:57:43 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kQb6g-000417-Lg; Thu, 08 Oct 2020 18:57:38 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kQb6g-0002P9-9v; Thu, 08 Oct 2020 18:57:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3RzB=DP=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kQb6q-0005RO-OX
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 18:57:48 +0000
X-Inumbo-ID: d15dbb8b-9b40-4fbc-a5ba-a99a04bb68db
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d15dbb8b-9b40-4fbc-a5ba-a99a04bb68db;
	Thu, 08 Oct 2020 18:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From;
	bh=nLbQbDyKtmQ0zyuBxr1DU07QHvJLOR8wLN3+oQCa8vE=; b=CXLvN0UYgu8NTpeor46WvaZ7CK
	2gVN5A7Hwl32wXCnUGBbzo0+mqyJsgrgX/X+xggKKkL3pEvTvv7h0BRxWyr6GxoRxrTGXaiemq8LV
	Qp0FgTBnzcCG1xv4nKEsorfpZ9NjjICL9rlESpR6FmGZHE5geWtoHjcT15rGHAO7weyE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kQb6g-000417-Lg; Thu, 08 Oct 2020 18:57:38 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kQb6g-0002P9-9v; Thu, 08 Oct 2020 18:57:38 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v10 00/11] domain context infrastructure
Date: Thu,  8 Oct 2020 19:57:24 +0100
Message-Id: <20201008185735.29875-1-paul@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

Paul Durrant (11):
  docs / include: introduce a new framework for 'domain context' records
  xen: introduce implementation of save/restore of 'domain context'
  xen/common/domctl: introduce XEN_DOMCTL_get/set_domain_context
  tools/misc: add xen-domctx to present domain context
  common/domain: add a domain context record for shared_info...
  x86/time: add a domain context record for tsc_info...
  docs/specs: add missing definitions to libxc-migration-stream
  docs / tools: specify migration v4 to include DOMAIN_CONTEXT
  tools/python: modify libxc.py to verify v4 stream
  tools/libs/guest: add code to restore a v4 libxc stream
  tools/libs/guest: add code to save a v4 libxc stream

 .gitignore                               |   1 +
 docs/specs/domain-context.md             | 198 +++++++++++++
 docs/specs/libxc-migration-stream.pandoc |  69 ++++-
 tools/flask/policy/modules/xen.if        |   4 +-
 tools/libs/ctrl/include/xenctrl.h        |   5 +
 tools/libs/ctrl/xc_domain.c              |  56 ++++
 tools/libs/guest/xg_sr_common.c          |   1 +
 tools/libs/guest/xg_sr_common.h          |   3 +
 tools/libs/guest/xg_sr_common_x86.c      |  20 --
 tools/libs/guest/xg_sr_common_x86.h      |   6 -
 tools/libs/guest/xg_sr_restore.c         |  24 +-
 tools/libs/guest/xg_sr_restore_x86_hvm.c |   9 +
 tools/libs/guest/xg_sr_restore_x86_pv.c  |   9 +
 tools/libs/guest/xg_sr_save.c            |  52 +++-
 tools/libs/guest/xg_sr_save_x86_hvm.c    |   5 -
 tools/libs/guest/xg_sr_save_x86_pv.c     |  22 --
 tools/libs/guest/xg_sr_stream_format.h   |   1 +
 tools/misc/Makefile                      |   4 +
 tools/misc/xen-domctx.c                  | 264 ++++++++++++++++++
 tools/python/xen/migration/libxc.py      |  22 +-
 xen/arch/x86/time.c                      |  30 ++
 xen/common/Makefile                      |   1 +
 xen/common/domain.c                      | 113 ++++++++
 xen/common/domctl.c                      | 173 ++++++++++++
 xen/common/save.c                        | 339 +++++++++++++++++++++++
 xen/include/public/arch-arm/hvm/save.h   |   5 +
 xen/include/public/arch-x86/hvm/save.h   |   5 +
 xen/include/public/domctl.h              |  39 +++
 xen/include/public/save.h                |  85 ++++++
 xen/include/xen/save.h                   | 160 +++++++++++
 xen/xsm/flask/hooks.c                    |   6 +
 xen/xsm/flask/policy/access_vectors      |   4 +
 32 files changed, 1661 insertions(+), 74 deletions(-)
 create mode 100644 docs/specs/domain-context.md
 create mode 100644 tools/misc/xen-domctx.c
 create mode 100644 xen/common/save.c
 create mode 100644 xen/include/public/save.h
 create mode 100644 xen/include/xen/save.h
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: "Marek Marczykowski-Górecki" <marmarek@invisiblethingslab.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Wei Liu <wl@xen.org>
-- 
2.20.1


