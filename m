Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E62352BB78
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 15:28:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332169.555816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrJiS-0006iN-1a; Wed, 18 May 2022 13:27:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332169.555816; Wed, 18 May 2022 13:27:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrJiR-0006g1-Tg; Wed, 18 May 2022 13:27:51 +0000
Received: by outflank-mailman (input) for mailman id 332169;
 Wed, 18 May 2022 13:27:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M1BC=V2=citrix.com=prvs=130ad9af4=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nrJiQ-0006ft-2d
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 13:27:50 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ad0d84c-d6ae-11ec-837e-e5687231ffcc;
 Wed, 18 May 2022 15:27:43 +0200 (CEST)
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
X-Inumbo-ID: 4ad0d84c-d6ae-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652880467;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ami/JJ/NXiuqy6URnl3AX30woLzB9oddmX1Yk1IpAcc=;
  b=SxMqm1TsWWRdEY6cxabaPzgpZLKhGpMeNLNGRnS9LIiYy+AFrsIPMpGV
   PVVGmHp+Y12yDqWwK7WS0ntSR7MfqlCXk2aDnAiyAOaDHsjsCkEOjbJia
   i16urFQoFOpeIfWcWOsavjGQBcaY65l4pCpGWlYuRwLZfPed8rhpyt3QP
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 74098050
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:05rS76r5DTI7A4JWT21NqEBp3uheBmJuZRIvgKrLsJaIsI4StFCzt
 garIBmFP6zfYDShftFzbY++pEoFvZ+DxtBiTFFqqiFnQSITopuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrdRbrJA24DjWVvQ4
 IOq+qUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBHqSPwPQ+aDZiCn96Eahn27nFfVHhiJnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI7zjfALADSJTKR6zM6PdT3Ssqh9AIFvHbD
 yYcQWUzNEWQO0AXUrsRIJ4vwLiDomv/Sh0buQmYqqk+sivDywMkhdABN/KKI4fXFK25hH2wu
 Wbu72n/RBYAO7S3yzCI73atje/nhj7gVcQZE7jQ3u5nhhify3IeDDUSVECnur+ph0imQdVdJ
 kcIvC00osAPGFeDF4enGUfi+Tjd40BaC4E4//AGBB+l6qOXuxa6PUc+V2BFRNkHl8k0GRV07
 wrc9z/2PgBHvLqQQHOb076bqzKuJCQYRVM/iT84oRgtuIe6/txq5v7bZpM6SfPu0IWpcd3l6
 2rSxBXSkYn/miLiO0+T2VncywyhqZHSJuLezlWGBzn1hu+ViWPMWmBJ1bQ5xasZRGp6ZgPY1
 JThpyR5xLlXZaxhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGggeR05a5xYJGa3O
 xe7VeZtCHh7ZSvCUEOKS9jpV5RCIVbIS7wJqcw4nvIRO8MsJWdrDQllZFKK3nCFraTfufpXB
 HtvSu71VSxyIf0+lFKeHr5BuZd2lnFW7T6CHvjTkkX4uYdykVbIEN/pxnPVNbtnhE5FyS2Im
 +ti2zyikEsDAbWjOHiOqOb+7zkidBAGOHw/kOQPHsbrH+asMDtJ5yP5qV/5R7FYog==
IronPort-HdrOrdr: A9a23:NNrkDKOht+Cm9cBcTs2jsMiBIKoaSvp037Eqv3oedfUzSL3+qy
 nOpoV+6faaslYssR0b9exoW5PwJE80l6QFgrX5VI3KNGKN1VdARLsSi7cKqAeAJ8SRzIFgPN
 9bAspDNOE=
X-IronPort-AV: E=Sophos;i="5.91,234,1647316800"; 
   d="scan'208";a="74098050"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v3] x86/hvm: Widen condition for is_hvm_pv_evtchn_domain() and report fix in CPUID
Date: Wed, 18 May 2022 14:27:14 +0100
Message-ID: <20220518132714.5557-1-jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Have is_hvm_pv_evtchn_domain() return true for vector callbacks for
evtchn delivery set up on a per-vCPU basis via
HVMOP_set_evtchn_upcall_vector.

is_hvm_pv_evtchn_domain() returning true is a condition for setting up
physical IRQ to event channel mappings.

Therefore, a CPUID bit is added so that guests know whether the check
in is_hvm_pv_evtchn_domain() will fail when using
HVMOP_set_evtchn_upcall_vector. This matters for guests that route
PIRQs over event channels since is_hvm_pv_evtchn_domain() is a
condition in physdev_map_pirq().

The naming of the CPUID bit is quite generic about upcall support
being available. That's done so that the define name doesn't become
overly long like XEN_HVM_CPUID_UPCALL_VECTOR_SUPPORTS_PIRQ or some
such.

A guest that doesn't care about physical interrupts routed over event
channels can just test for the availability of the hypercall directly
(HVMOP_set_evtchn_upcall_vector) without checking the CPUID bit.

Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v3:
 * Improve commit message and title.

v2:
 * Since the naming of the CPUID bit is quite generic, better explain
   when it should be checked for, in code comments and commit message.
---
 xen/arch/x86/include/asm/domain.h   | 8 +++++++-
 xen/arch/x86/traps.c                | 6 ++++++
 xen/include/public/arch-x86/cpuid.h | 5 +++++
 3 files changed, 18 insertions(+), 1 deletion(-)

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
index 25bffe47d7..1a7f9df067 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1152,6 +1152,12 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
         res->a |= XEN_HVM_CPUID_DOMID_PRESENT;
         res->c = d->domain_id;
 
+        /*
+         * Per-vCPU event channel upcalls are implemented and work
+         * correctly with PIRQs routed over event channels.
+         */
+        res->a |= XEN_HVM_CPUID_UPCALL_VECTOR;
+
         break;
 
     case 5: /* PV-specific parameters */
diff --git a/xen/include/public/arch-x86/cpuid.h b/xen/include/public/arch-x86/cpuid.h
index f2b2b3632c..c49eefeaf8 100644
--- a/xen/include/public/arch-x86/cpuid.h
+++ b/xen/include/public/arch-x86/cpuid.h
@@ -109,6 +109,11 @@
  * field from 8 to 15 bits, allowing to target APIC IDs up 32768.
  */
 #define XEN_HVM_CPUID_EXT_DEST_ID      (1u << 5)
+/*
+ * Per-vCPU event channel upcalls work correctly with physical IRQs
+ * bound to event channels.
+ */
+#define XEN_HVM_CPUID_UPCALL_VECTOR    (1u << 6)
 
 /*
  * Leaf 6 (0x40000x05)
-- 
2.11.0


