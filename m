Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A02DB24C16D
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 17:09:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8mCC-0003pW-Ft; Thu, 20 Aug 2020 15:09:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00F7=B6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k8mCB-0003lg-23
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 15:09:39 +0000
X-Inumbo-ID: bdbb1378-0677-4ef4-9ea5-1be20f41f552
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bdbb1378-0677-4ef4-9ea5-1be20f41f552;
 Thu, 20 Aug 2020 15:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597936168;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aABF1ZpA+s0LDLyA9ZO3Bf9vZtEhgE3zcRaVk4S89kM=;
 b=GGpUV/+MU4w4kho2GMZCv1/n2a33UM50i6Nw9eFE/tEJ0kAFte2FBfzD
 tR8wQV/+1JPYY7qxHAlxZIK/U0s40vDSTHX45AH+99vXWjqk/cf0VzmGX
 h1YyWr5UiUHt5sYVW5+/kLF7KYW+0G2yU8GsttVVPBEFp/mKXOKwjvDy9 Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: BvLK3rBMe9cKIDcUU4crCtKc6f1ltuf7T3147XznKoJdhLfB1IeGzpju4UStKoq2DCKpU1UwpG
 CixPOXn2xjtbx3cCcyxBkH7koGhz38IZL1qTSIqTHPFzJgfpHn5Hggqej9i3r70F1Myqyv8Zac
 z903v/UwrrvEtBf28GIMkK9yBtaiC4xvonXQwJjNuZZYVaQE3sivGJHKukkpA0mJCXEslRD8Vm
 0WLb+jkes1562Di+lcyUbQzltfz/Rj4ZA+GVyTWQrdiAktoXdj6+hwSfbu0aTeXP3W3lriN7i3
 NvM=
X-SBRS: 2.7
X-MesageID: 25266660
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,333,1592884800"; d="scan'208";a="25266660"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 3/8] x86/msr: explicitly handle AMD DE_CFG
Date: Thu, 20 Aug 2020 17:08:30 +0200
Message-ID: <20200820150835.27440-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200820150835.27440-1-roger.pau@citrix.com>
References: <20200820150835.27440-1-roger.pau@citrix.com>
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

Report the hardware value of DE_CFG on AMD hardware and silently drop
writes.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version.
---
 xen/arch/x86/msr.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index ca4307e19f..a890cb9976 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -274,6 +274,14 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
         *val = msrs->tsc_aux;
         break;
 
+    case MSR_AMD64_DE_CFG:
+        if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) ||
+             !(boot_cpu_data.x86_vendor & (X86_VENDOR_AMD |
+                                           X86_VENDOR_HYGON)) ||
+             rdmsr_safe(MSR_AMD64_DE_CFG, *val) )
+            goto gp_fault;
+        break;
+
     case MSR_AMD64_DR0_ADDRESS_MASK:
     case MSR_AMD64_DR1_ADDRESS_MASK ... MSR_AMD64_DR3_ADDRESS_MASK:
         if ( !cp->extd.dbext )
@@ -499,6 +507,12 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
             wrmsr_tsc_aux(val);
         break;
 
+    case MSR_AMD64_DE_CFG:
+        if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) ||
+             !(boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
+            goto gp_fault;
+        break;
+
     case MSR_AMD64_DR0_ADDRESS_MASK:
     case MSR_AMD64_DR1_ADDRESS_MASK ... MSR_AMD64_DR3_ADDRESS_MASK:
         if ( !cp->extd.dbext || val != (uint32_t)val )
-- 
2.28.0


