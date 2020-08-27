Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3210254EC8
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 21:37:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBNiI-0000no-Q9; Thu, 27 Aug 2020 19:37:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/ja+=CF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kBNiH-0000ni-7v
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 19:37:33 +0000
X-Inumbo-ID: 0ee15d7d-28d1-4427-888f-a1be9a4f53c4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ee15d7d-28d1-4427-888f-a1be9a4f53c4;
 Thu, 27 Aug 2020 19:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598557052;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aTEmhtlbG37htLU5wjvrE/bKXPGiC/cuQF8eP+eZXzQ=;
 b=Dy+F/bKLmFSKQb5UWWVFg3bFSOb2j81INXdUUgFd9QoXm8Xmh5AoiOhF
 Js3LDINu+GY18NEcFsn0SHSBO9em6SOdcZBLCtkPaFCEiGAdU3FAMxTXn
 91VWt4Hc6pDnRhRckWx6nbbzmZ9NJExVAhWizIODVT/QfzCkaiZl+1gA6 w=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: tmn1WcmJDk1niVoHYQb1zeAMt7Gvkv6cO8tMOCCgF6RKcBNKiRWREKewE65qdCO5MDOPoH7g2a
 lpOWe9n1gbTmwSu1s+RQDnvIKiGv9jXaBv+SD5NuTdk0ExwhPo6KjUztPO7+f6ClTBsIOHrD2y
 EZEN+2VP7vE4YG+2BpO7acQutGiVSebvtwgy6cd9tDj0lU6igyabWlfm8VhhvlplKe3oYIvQmZ
 t4ZZjkopgv1g8wwRLJ2iQBrrdIgVuzc0TW7ifI4HZ+HqD4zY77tedutj7pNWaExbrK0CEPzXUs
 ies=
X-SBRS: 2.7
X-MesageID: 25456872
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,360,1592884800"; d="scan'208";a="25456872"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <amc96@cam.ac.uk>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>
Subject: [PATCH] x86/intel: Expose MSR_ARCH_CAPS to dom0
Date: Thu, 27 Aug 2020 20:37:13 +0100
Message-ID: <20200827193713.4962-1-andrew.cooper3@citrix.com>
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

The overhead of (the lack of) MDS_NO alone has been measured at 30% on some
workloads.  While we're not in a position yet to offer MSR_ARCH_CAPS generally
to guests, dom0 doesn't migrate, so we can pass a subset of hardware values
straight through.

This will cause PVH dom0's not to use KPTI by default, and all dom0's not to
use VERW flushing by default, and to use eIBRS in preference to retpoline on
recent Intel CPUs.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/cpuid.c |  8 ++++++++
 xen/arch/x86/msr.c   | 16 ++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 63a03ef1e5..6c608cc00b 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -719,6 +719,14 @@ int init_domain_cpuid_policy(struct domain *d)
     if ( d->disable_migrate )
         p->extd.itsc = cpu_has_itsc;
 
+    /*
+     * Expose the "hardware speculation behaviour" bits of ARCH_CAPS to dom0,
+     * so dom0 can turn off workaround as appropriate.  Temporary, until the
+     * domain policy logic gains a better understanding of MSRs.
+     */
+    if ( is_hardware_domain(d) && boot_cpu_has(X86_FEATURE_ARCH_CAPS) )
+        p->feat.arch_caps = true;
+
     d->arch.cpuid = p;
 
     recalculate_cpuid_policy(d);
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index c3862033eb..420a55f165 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -130,6 +130,22 @@ int init_domain_msr_policy(struct domain *d)
     if ( !opt_dom0_cpuid_faulting && is_control_domain(d) && is_pv_domain(d) )
         mp->platform_info.cpuid_faulting = false;
 
+    /*
+     * Expose the "hardware speculation behaviour" bits of ARCH_CAPS to dom0,
+     * so dom0 can turn off workaround as appropriate.  Temporary, until the
+     * domain policy logic gains a better understanding of MSRs.
+     */
+    if ( is_hardware_domain(d) && boot_cpu_has(X86_FEATURE_ARCH_CAPS) )
+    {
+        uint64_t val;
+
+        rdmsrl(MSR_ARCH_CAPABILITIES, val);
+
+        mp->arch_caps.raw = val &
+            (ARCH_CAPS_RDCL_NO | ARCH_CAPS_IBRS_ALL | ARCH_CAPS_RSBA |
+             ARCH_CAPS_SSB_NO | ARCH_CAPS_MDS_NO | ARCH_CAPS_TAA_NO);
+    }
+
     d->arch.msr = mp;
 
     return 0;
-- 
2.11.0


