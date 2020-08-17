Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9112C246B91
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 17:58:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7hWz-0006wN-3t; Mon, 17 Aug 2020 15:58:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AGoP=B3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k7hWy-0006wI-5y
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 15:58:40 +0000
X-Inumbo-ID: 5296d3ac-2f89-4bd3-a818-f53f58972ed2
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5296d3ac-2f89-4bd3-a818-f53f58972ed2;
 Mon, 17 Aug 2020 15:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597679919;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6w3kKtr8dxzTp7d5a4w7HCmqV91lln+T4hMNRlRHfJo=;
 b=SW83lcFd3UbyrD9/SiLV2k3/0WbuOTCfqEaLsRNJ4KYAlNsqRfFlxaS9
 9MhICLpciDR27LK7K5ZC58DbiM5ojCj3bX1GswD+0HjGWWI8HWAebOovL
 0bpzEc7tvpzuy/KVb5RMMbWCuQC7z/Us6awTcHBYZWetv2z0p9kjT/0MD 0=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: jQROIrXvZCYwiL+G7Nb30V5n3IrUgjotJdpIohDaJoDN++9CHWTEqqZFx6fNns8OKLvzHfnU//
 2n1+hRYF6cdJnbJadpEJkvHVvAfLXni/h6yXy4mjKvuxTRW+kXbLF2Hb+nE9odEo0X2rd6Y0uy
 PVFtm1BWScwViFNSsaGPWNWYtOhgBcCL+ZmYINQuFt7dbJKh+kvXvABpdoU6u85w8ZLKLHdBHs
 DQwgGRKotxCsSTK+5iB+s0nWPJvnCjRrKQuAepxliADCgqGjopUL0WYiRlei57RK5ooKMaIEl+
 GZU=
X-SBRS: 2.7
X-MesageID: 25027582
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,324,1592884800"; d="scan'208";a="25027582"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jun Nakajima
 <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
 <wl@xen.org>
Subject: [PATCH 0/8] x86: switch default MSR behavior
Date: Mon, 17 Aug 2020 17:57:49 +0200
Message-ID: <20200817155757.3372-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
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

Hello,

The current series attempts to change the current MSR default handling
behavior, which is to silently drop writes to writable MSRs, and allow
reading any MSR not explicitly handled.

After this series access to MSRs not explicitly handled will trigger a
#GP fault. I've tested this series with osstest and it doesn't introduce
any regression, at least on the boxes selected for testing:

http://logs.test-lab.xenproject.org/osstest/logs/152602/

Thanks, Roger.

Andrew Cooper (1):
  x86/hvm: Disallow access to unknown MSRs

Roger Pau Monne (7):
  x86/vmx: handle writes to MISC_ENABLE MSR
  x86/svm: silently drop writes to SYSCFG and related MSRs
  x86/pv: handle writes to the EFER MSR
  x86/pv: handle reads to the PAT MSR
  x86/pv: allow reading APIC_BASE MSR
  x86/pv: allow reading FEATURE_CONTROL MSR
  x86/pv: disallow access to unknown MSRs

 xen/arch/x86/hvm/svm/svm.c     | 21 +++++++++--
 xen/arch/x86/hvm/vmx/vmx.c     | 20 ++++++----
 xen/arch/x86/pv/emul-priv-op.c | 68 +++++++++++++++++++++++++---------
 3 files changed, 79 insertions(+), 30 deletions(-)

-- 
2.28.0


