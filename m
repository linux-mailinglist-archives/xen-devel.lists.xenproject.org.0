Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD1F27481F
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 20:25:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKmyu-00008x-92; Tue, 22 Sep 2020 18:25:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J35V=C7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kKmyt-0008V0-80
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 18:25:35 +0000
X-Inumbo-ID: 48dcaa99-9115-4127-9811-3dcfce06f1bd
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 48dcaa99-9115-4127-9811-3dcfce06f1bd;
 Tue, 22 Sep 2020 18:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600799131;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+DQD+d+fvBmJ1gvBN17a246Lozt0hdVhxfIVLanu6Lk=;
 b=TvcE21CnnGpK6skpKAdPPIM7p++CsWPsOJ5VHDJlxs0DrFH3MObqG70v
 +MTpbblsSCjQEAgBILUgT8zniMnPWV1WfsfUHPNx8DtNbDCNO0QvX2Nb0
 w4qJCQBB4KlRlVo6wC7RD7iyoKFqhfXyvKcyERy4MMAbMWvuVB4R1kho8 0=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: B74LoXN6PKJ0DWkCj+DMON9PaUwJyMVKF84Cd4s+E+c7a/EhVqSrThKDocdMwniWImzEdoMk5m
 90jqBY5o6FZT1wt9cL2Mdw4+FwQb4p+uKn9su6ZOuvNYjzmJEnNu1QEcpBAz3LpOizEzJYecXw
 NtnB7XRRsKLjWA5xbQMtqWTDTwWdPLgbr7vQc0AMzqD+EBWivrNyH7CP0UWUUGKO4aMYJVysCk
 dOD1mWOgQMyTbTgpbC+QumuM2LjjUtWmI1dnF1VLeWaL4WAj5LsGP2gim9M9cuUQQDIrgvAOi4
 nYo=
X-SBRS: 2.7
X-MesageID: 27631643
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,291,1596513600"; d="scan'208";a="27631643"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
 <JBeulich@suse.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
 Hubert Jasudowicz <hubert.jasudowicz@cert.pl>, Tamas K Lengyel
 <tamas@tklengyel.com>
Subject: [PATCH v2 00/11] Multiple fixes to XENMEM_acquire_resource
Date: Tue, 22 Sep 2020 19:24:33 +0100
Message-ID: <20200922182444.12350-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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

I thought this was going to be a very simple small bugfix for Michał's
Processor Trace series.  Serves me right for expecting it not to be full of
bear traps...

The sole implementation of acquire_resource never asks for size, so its little
surprise that Xen is broken for compat callers, and returns incorrect
information for regular callers.

v2 was delayed substantially due to the discovery of XSA-334, but is complete
now, permitting the mapping of arbitrary sized resouces, along with fixes to
the compat XLAT logic.

The final two patches are only local testing, and not intended for committing.

A branch can be obtained from:

  https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen.git;a=shortlog;h=refs/heads/xen-acquire-resource

Andrew Cooper (11):
  xen/memory: Introduce CONFIG_ARCH_ACQUIRE_RESOURCE
  xen/gnttab: Rework resource acquisition
  xen/memory: Fix compat XENMEM_acquire_resource for size requests
  xen/memory: Fix acquire_resource size semantics
  tools/foreignmem: Support querying the size of a resource
  xen/memory: Clarify the XENMEM_acquire_resource ABI description
  xen/memory: Improve compat XENMEM_acquire_resource handling
  xen/memory: Indent part of acquire_resource()
  xen/memory: Fix mapping grant tables with XENMEM_acquire_resource
  TESTING dom0
  TESTING XTF

 tools/libs/foreignmemory/Makefile                  |   2 +-
 tools/libs/foreignmemory/core.c                    |  14 ++
 .../libs/foreignmemory/include/xenforeignmemory.h  |  15 ++
 tools/libs/foreignmemory/libxenforeignmemory.map   |   4 +
 tools/libs/foreignmemory/linux.c                   |  36 +++
 tools/libs/foreignmemory/private.h                 |  14 ++
 tools/libs/uselibs.mk                              |   2 +-
 tools/misc/Makefile                                |   4 +
 tools/misc/xen-resource.c                          | 106 +++++++++
 xen/arch/x86/Kconfig                               |   1 +
 xen/arch/x86/mm.c                                  |  24 +-
 xen/common/Kconfig                                 |   3 +
 xen/common/compat/memory.c                         | 151 +++++++++----
 xen/common/grant_table.c                           | 128 ++++++++---
 xen/common/memory.c                                | 244 ++++++++++++++-------
 xen/include/asm-arm/mm.h                           |   8 -
 xen/include/asm-x86/mm.h                           |   3 +
 xen/include/public/memory.h                        |  23 +-
 xen/include/xen/grant_table.h                      |  21 +-
 xen/include/xen/mm.h                               |  15 ++
 20 files changed, 647 insertions(+), 171 deletions(-)
 create mode 100644 tools/misc/xen-resource.c

-- 
2.11.0


