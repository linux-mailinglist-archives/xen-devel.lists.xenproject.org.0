Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B74D0244AA5
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 15:39:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6Zvq-0006RO-NI; Fri, 14 Aug 2020 13:39:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UNK8=BY=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k6Zvq-0006RJ-4W
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 13:39:42 +0000
X-Inumbo-ID: ed8adeac-163a-4d13-a68b-fb41c8c201b2
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ed8adeac-163a-4d13-a68b-fb41c8c201b2;
 Fri, 14 Aug 2020 13:39:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4BAC8B02A;
 Fri, 14 Aug 2020 13:40:03 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 boris.ostrovsky@oracle.com
Subject: [GIT PULL] xen: branch for v5.9-rc1b
Date: Fri, 14 Aug 2020 15:39:39 +0200
Message-Id: <20200814133939.21185-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.9-rc1b-tag

xen: branch for v5.9-rc1, 2nd batch

It contains 2 series:

- Removal of support for running as 32-bit Xen PV-guest. 32-bit PV
  guests are rarely used, are lacking security fixes for Meltdown, and
  can be easily replaced by PVH mode. Another series for doing more
  cleanup will follow soon (removal of 32-bit-only pvops functionality).

- Fixes and additional features for the Xen display frontend driver.


Thanks.

Juergen

 arch/x86/entry/entry_32.S                | 109 +------
 arch/x86/entry/vdso/vdso32/note.S        |  30 --
 arch/x86/include/asm/proto.h             |   2 +-
 arch/x86/include/asm/segment.h           |   2 +-
 arch/x86/kernel/head_32.S                |  31 --
 arch/x86/xen/Kconfig                     |   3 +-
 arch/x86/xen/Makefile                    |   3 +-
 arch/x86/xen/apic.c                      |  17 --
 arch/x86/xen/enlighten_pv.c              |  78 +----
 arch/x86/xen/mmu_pv.c                    | 492 ++++++-------------------------
 arch/x86/xen/p2m.c                       |   6 +-
 arch/x86/xen/setup.c                     |  36 +--
 arch/x86/xen/smp_pv.c                    |  18 --
 arch/x86/xen/vdso.h                      |   6 -
 arch/x86/xen/xen-asm.S                   | 194 +++++++++++-
 arch/x86/xen/xen-asm_32.S                | 185 ------------
 arch/x86/xen/xen-asm_64.S                | 192 ------------
 arch/x86/xen/xen-head.S                  |   6 -
 arch/x86/xen/xen-ops.h                   |   1 -
 drivers/gpu/drm/xen/xen_drm_front.c      |  10 +-
 drivers/gpu/drm/xen/xen_drm_front.h      |   2 +-
 drivers/gpu/drm/xen/xen_drm_front_conn.c |   1 +
 drivers/gpu/drm/xen/xen_drm_front_gem.c  |  11 +-
 drivers/gpu/drm/xen/xen_drm_front_kms.c  |   2 +-
 drivers/xen/Kconfig                      |   4 +-
 drivers/xen/gntdev-dmabuf.c              |   8 +
 include/xen/interface/io/displif.h       |  91 +++++-
 27 files changed, 397 insertions(+), 1143 deletions(-)

Juergen Gross (3):
      x86/xen: remove 32-bit Xen PV guest support
      x86/xen: eliminate xen-asm_64.S
      x86/xen: drop tests for highmem in pv code

Oleksandr Andrushchenko (5):
      xen/gntdev: Fix dmabuf import with non-zero sgt offset
      drm/xen-front: Fix misused IS_ERR_OR_NULL checks
      drm/xen-front: Add YUYV to supported formats
      xen: Sync up with the canonical protocol definition in Xen
      drm/xen-front: Pass dumb buffer data offset to the backend

