Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EEF5236E6
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 17:16:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327037.549741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noo3U-0006KB-JJ; Wed, 11 May 2022 15:15:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327037.549741; Wed, 11 May 2022 15:15:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noo3U-0006Gp-Fd; Wed, 11 May 2022 15:15:12 +0000
Received: by outflank-mailman (input) for mailman id 327037;
 Wed, 11 May 2022 15:15:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0JXS=VT=citrix.com=prvs=1233435a7=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1noo3S-0006Gj-Sv
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 15:15:11 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23198c7b-d13d-11ec-8fc4-03012f2f19d4;
 Wed, 11 May 2022 17:15:07 +0200 (CEST)
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
X-Inumbo-ID: 23198c7b-d13d-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652282107;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0+WTyQ6WE3kGVK9uh25l57/PyAwZp1z/qpa8H5lsp7g=;
  b=MUsqOP445j2nY+4cL5nIvIlX1+Sxyq/QiQ6/x1ya1aeVUN+yNgb7JTDO
   7WcwMH6AutlR5PTycNR1JSxvh5BR+JrvvVW7ckXGeFCaj2/zgw5qV3hk3
   iROxTU08dYVWNASDHPyLw6tB8a7Roxte8byMnnKv+NETDxEgmiHacXo8l
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 70950634
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:IkzVhq9Klyy2KtsOEEhjDrUD6H6TJUtcMsCJ2f8bNWPcYEJGY0x3n
 WcXUGqBa/eDNDOhLdsiOYiz804GvZOHy4NgSlE5/ng8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ44f5fs7Rh2NQw3IHgW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnbCVVzgvOo/vpNQ+CAJRSTEmM4kfx6CSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKEWvHwm6DjdBPIvR53rSKTW/95Imjw3g6iiGN6BP
 5tEMWQ0MHwsZTVFMX0mKKt9x93vi0nuSDEHqAqsgK0etj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKhMQOcGbyDGF2mmxneKJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO8Ef9j6Lzoj33za6XXMNFC4ZZvh/i9BjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WvQVnNL
 ya2QD/Sbln5peoCzO2F8F/OmFpATbCZH1dutm07so9Ihz6VhbJJhaT1sTA3Dt4ade51q2VtW
 1BewqCjABgmV83lqcB0aLxl8EuVz/iEKibAplVkAoMs8T+gk1b6I90KumkhehozbpxeEdMMX
 KM0kVkKjKK/wVPwNfMnC25PI5pCIVfc+STNCamPM4smjmlZfw6b5iB+DXN8LEi2+HXAZZoXY
 M/BGe71VC5yIf0+kFKeGrZGuZd2l39W+I8mbc2ip/hR+eHGNCD9pHZsGAbmU93VG4ve/lqPr
 4YEZ5viJtc2eLSWXxQ7OLU7dTgiRUXXz7ivwyCLXoZv+jZbJVw=
IronPort-HdrOrdr: A9a23:xedE6a238L0FqAJM3/cZcwqjBL4kLtp133Aq2lEZdPRUGvb3qy
 nIpoV96faUskd0ZJhOo7C90cW7LU80lqQFhLX5X43SPzUO0VHAROoJgLcKqweQfREWndQ96U
 4PScdD4aXLfDpHsfo=
X-IronPort-AV: E=Sophos;i="5.91,217,1647316800"; 
   d="scan'208";a="70950634"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH] x86/hvm: Widen condition for is_hvm_pv_evtchn_vcpu()
Date: Wed, 11 May 2022 16:14:23 +0100
Message-ID: <20220511151423.20241-1-jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Have is_hvm_pv_evtchn_vcpu() return true for vector callbacks for
evtchn delivery set up on a per-vCPU basis via
HVMOP_set_evtchn_upcall_vector.

is_hvm_pv_evtchn_vcpu() returning true is a condition for setting up
physical IRQ to event channel mappings.

Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/include/asm/domain.h   | 8 +++++++-
 xen/arch/x86/traps.c                | 3 +++
 xen/include/public/arch-x86/cpuid.h | 2 ++
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 35898d725f..f044e0a492 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -14,8 +14,14 @@
 
 #define has_32bit_shinfo(d)    ((d)->arch.has_32bit_shinfo)
 
+/*
+ * Set to true if either the global vector-type callback or per-vCPU
+ * LAPIC vectors are used. Assume all vCPUs will use
+ * HVMOP_set_evtchn_upcall_vector as long as the initial vCPU does.
+ */
 #define is_hvm_pv_evtchn_domain(d) (is_hvm_domain(d) && \
-        (d)->arch.hvm.irq->callback_via_type == HVMIRQ_callback_vector)
+        ((d)->arch.hvm.irq->callback_via_type == HVMIRQ_callback_vector || \
+         (d)->vcpu[0]->arch.hvm.evtchn_upcall_vector))
 #define is_hvm_pv_evtchn_vcpu(v) (is_hvm_pv_evtchn_domain(v->domain))
 #define is_domain_direct_mapped(d) ((void)(d), 0)
 
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 25bffe47d7..2c51faab2c 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1152,6 +1152,9 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
         res->a |= XEN_HVM_CPUID_DOMID_PRESENT;
         res->c = d->domain_id;
 
+        /* Per-vCPU event channel upcalls are implemented. */
+        res->a |= XEN_HVM_CPUID_UPCALL_VECTOR;
+
         break;
 
     case 5: /* PV-specific parameters */
diff --git a/xen/include/public/arch-x86/cpuid.h b/xen/include/public/arch-x86/cpuid.h
index f2b2b3632c..1760e2c405 100644
--- a/xen/include/public/arch-x86/cpuid.h
+++ b/xen/include/public/arch-x86/cpuid.h
@@ -109,6 +109,8 @@
  * field from 8 to 15 bits, allowing to target APIC IDs up 32768.
  */
 #define XEN_HVM_CPUID_EXT_DEST_ID      (1u << 5)
+/* Per-vCPU event channel upcalls. */
+#define XEN_HVM_CPUID_UPCALL_VECTOR    (1u << 6)
 
 /*
  * Leaf 6 (0x40000x05)
-- 
2.11.0


