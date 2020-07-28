Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 047612308D8
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 13:37:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0NvQ-0006D0-54; Tue, 28 Jul 2020 11:37:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K5Bo=BH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k0NvO-0006Bw-PZ
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 11:37:38 +0000
X-Inumbo-ID: b98ebc40-d0c6-11ea-a8af-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b98ebc40-d0c6-11ea-a8af-12813bfff9fa;
 Tue, 28 Jul 2020 11:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595936253;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3No2HcQqm9xHBXNjS9kD8Wz1wiCqHR/Ty8ECtIr5Vtg=;
 b=V6P5/adkx3u7+PqSh8S3wXgaP5TvmvPKjXWo6i135bdDlJuwBzdH90sS
 aZoSuW5Sv0qHJ5ov4yLPbfsk9/1SXwRg20/uy3VVsTNr5ZDu+29mhMMuR
 IcJbGhnj7fqOJcXSpXT6uqatKmvQnOnqnVAk32CJmHEofoyIhxKNbsQ+x o=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: lDNkjIazj4HQryWxseOpakg+d+ncEDdqGsqTiRxwvfZROzNMooGTh9Q5S1oseHkmy1Q6Ysctvo
 u3aAEjJYUM864kQXvyL5E7bxYHNRdDIJjeM7ikIecx4ezxYMtWKEtNVzpIligCKQZ7cTrgkoqW
 VucbE9igE84WEVyZjsGkQoKKKFFDQVNYGVE7h5klzDRWP1lVOZ2zOeepG9bjxPNMaPOub0rQ0M
 g6bQWpF4LviyPqD8T0p58gvYAPE1/wyVuUrtpTI3Sy7UPyCMGYN2MSzs3WtVlzvNWHOtgwsMw+
 2eY=
X-SBRS: 2.7
X-MesageID: 23330306
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,406,1589256000"; d="scan'208";a="23330306"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 0/5] Multiple fixes to XENMEM_acquire_resource
Date: Tue, 28 Jul 2020 12:37:06 +0100
Message-ID: <20200728113712.22966-1-andrew.cooper3@citrix.com>
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
Cc: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
 Jan Beulich <JBeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

I thought this was going to be a very simple small bugfix for Michał's
Processor Trace series.  Serves me right for expecting it not to be full of
bear traps...

The sole implementation of acquire_resource never asks for size, so its little
surprise that Xen is broken for compat callers, and returns incorrect
information for regular callers.

Patches 1-2 are cleanup with no net functional change.  Patches 3-5 are fixes
to the size side of this interface, and allow userspace to obtain the actual
size of resources.

I'm still working on fixing the batch mapping support, which has further sharp
corners, especially for compat callers.

This is sufficenet of a series so far to post for comments.  A branch can be
obtained from:

  https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen.git;a=shortlog;h=refs/heads/xen-acquire-size

Andrew Cooper (5):
  xen/memory: Introduce CONFIG_ARCH_ACQUIRE_RESOURCE
  xen/gnttab: Rework resource acquisition
  xen/memory: Fix compat XENMEM_acquire_resource for size requests
  xen/memory: Fix acquire_resource size semantics
  tools/foreignmem: Support querying the size of a resource

 tools/libs/foreignmemory/Makefile                  |   2 +-
 tools/libs/foreignmemory/core.c                    |  14 +++
 .../libs/foreignmemory/include/xenforeignmemory.h  |  15 +++
 tools/libs/foreignmemory/libxenforeignmemory.map   |   4 +
 tools/libs/foreignmemory/linux.c                   |  35 +++++++
 tools/libs/foreignmemory/private.h                 |  14 +++
 xen/arch/x86/Kconfig                               |   1 +
 xen/arch/x86/mm.c                                  |  20 ++++
 xen/common/Kconfig                                 |   3 +
 xen/common/compat/memory.c                         |   2 +-
 xen/common/grant_table.c                           | 112 ++++++++++++++++-----
 xen/common/memory.c                                |  85 +++++++---------
 xen/include/asm-arm/mm.h                           |   8 --
 xen/include/asm-x86/mm.h                           |   3 +
 xen/include/public/memory.h                        |  16 ++-
 xen/include/xen/grant_table.h                      |  21 ++--
 xen/include/xen/mm.h                               |  15 +++
 17 files changed, 273 insertions(+), 97 deletions(-)

-- 
2.11.0


