Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADD41F99CD
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 16:16:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkpu7-0007tO-Ou; Mon, 15 Jun 2020 14:16:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OSTQ=74=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jkpu5-0007r6-Fq
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 14:16:01 +0000
X-Inumbo-ID: ba6d0701-af12-11ea-b801-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ba6d0701-af12-11ea-b801-12813bfff9fa;
 Mon, 15 Jun 2020 14:15:58 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 0liUADho4YHnmkjoHbiQmt3aEb6H97PEKmCdIyS/QYd/PgEY1aj75590t45RXVJQjRaXyMvEFZ
 jD+nNaacMLVx8GZPk+qwZZfCzy3P5DAfeZD2Ht47pFY8ZVnD+USKOBEk+qidyxs6iaRFjFAHav
 VNnEDu6cjfeEre4NKKSvotgfNWs2bkeQyBYMJzidgcuZj7OASp9YqnDUqGOdT0pUw0+hrZBxNe
 s/y9NZjpjWs4f8XVnLh8I9L0qBhIF21WN8FjFiFnNTbEj5a3gZCIkP6IMUEO8w/7GpbpEKcLri
 16w=
X-SBRS: 2.7
X-MesageID: 20410406
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,514,1583211600"; d="scan'208";a="20410406"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14 0/9] XSA-320 follow for IvyBridge
Date: Mon, 15 Jun 2020 15:15:23 +0100
Message-ID: <20200615141532.1927-1-andrew.cooper3@citrix.com>
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
Cc: Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is some work in light of IvyBridge not gaining microcode to combat SRBDS
/ XSA-320.  It is a mix of some work I'd planned for 4.15, and some patches
posted already and delayed due to dependence's I'd discovered after-the-fact.

This provides a more user-friendly way of making IvyBridge safe by default
without encountering migration incompatibilities.

In terms of functionality, it finishes the "fresh boot" vs "migrate/restore
from pre-4.14" split in the libxc CPUID logic, and uses this to let us safely
hide features by default without breaking the "divine what a guest may have
seen previously" logic on migrate.

On top of that, we hide RDRAND by default to mitigate XSA-320.

Additionally, take the opportunity of finally getting this logic working to
hide MPX by default (as posted previously), due to upcoming Intel timelines.

Request for 4.14.  The IvyBridge angle only became apparent after the public
embargo on Tue 9th.  Otherwise, I would have made a concerted effort to get
this logic sorted sooner and/or part of XSA-320 itself.

Strictly speaking, patches 1-4 aren't necessary, but without them the logic is
very confusing to follow, particularly the reasoning about the safely of later
changes.  As it is a simple set of transforms, we're better with them than
without.

Also, the MPX patch isn't related to the RDRAND issue, but I was planning to
get it into 4.14 already, until realising that the migration path was broken.
Now that the path is fixed for the RDRAND issue, include the MPX patch as it
pertains to future hardware compatibility (and would be backported to 4.14.1
if it misses 4.14.0).

Andrew Cooper (9):
  tools/libx[cl]: Introduce struct xc_xend_cpuid for xc_cpuid_set()
  tests/cpu-policy: Confirm that CPUID serialisation is sorted
  tools/libx[cl]: Move processing loop down into xc_cpuid_set()
  tools/libx[cl]: Merge xc_cpuid_set() into xc_cpuid_apply_policy()
  tools/libx[cl]: Plumb bool restore down into xc_cpuid_apply_policy()
  x86/gen-cpuid: Distinguish default vs max in feature annotations
  x86/hvm: Disable MPX by default
  x86/cpuid: Introduce missing feature adjustment in calculate_pv_def_policy()
  x86/spec-ctrl: Hide RDRAND by default on IvyBridge

 docs/misc/xen-command-line.pandoc           |  20 ++-
 tools/libxc/include/xenctrl.h               |  42 ++++-
 tools/libxc/xc_cpuid_x86.c                  | 239 ++++++++++++++++------------
 tools/libxl/libxl.h                         |   8 +-
 tools/libxl/libxl_cpuid.c                   |  17 +-
 tools/libxl/libxl_create.c                  |   2 +-
 tools/libxl/libxl_dom.c                     |   2 +-
 tools/libxl/libxl_internal.h                |  12 +-
 tools/libxl/libxl_nocpuid.c                 |   2 +-
 tools/tests/cpu-policy/test-cpu-policy.c    |  49 +++++-
 xen/arch/x86/cpuid.c                        |  23 +++
 xen/include/public/arch-x86/cpufeatureset.h |   4 +-
 xen/tools/gen-cpuid.py                      |  18 +--
 13 files changed, 278 insertions(+), 160 deletions(-)

-- 
2.11.0


