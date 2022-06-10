Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E8A546510
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 13:08:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346389.572177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzcUM-0002kJ-7t; Fri, 10 Jun 2022 11:07:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346389.572177; Fri, 10 Jun 2022 11:07:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzcUM-0002hp-4B; Fri, 10 Jun 2022 11:07:38 +0000
Received: by outflank-mailman (input) for mailman id 346389;
 Fri, 10 Jun 2022 11:07:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d6gm=WR=citrix.com=prvs=15368b7f5=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nzcUK-0002hi-P0
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 11:07:36 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87618fd6-e8ad-11ec-bd2c-47488cf2e6aa;
 Fri, 10 Jun 2022 13:07:35 +0200 (CEST)
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
X-Inumbo-ID: 87618fd6-e8ad-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654859255;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TIIlT2YCZV5kt/tlpkQ71ZA41ADB8x6cU93JUDAjEZA=;
  b=UXIOypdIC269byQrQZ0czCzXxbgNeT5YlTJCzUZb0KHQ5Shl8cwG+zd/
   R5W7h8+VF6ly7jfXvA7MHtHG+ANZPSEAp9p2GAgN8pbizMGHq/cARH6lx
   QWerTWZ4SaWCuspx0yQ3JP4/s71P8czRSxFjXjOWRO6RduQaWAAxuAJju
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 75863028
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:dUpG7KiMM9ovV31zk/Kn6DD+X161NxAKZh0ujC45NGQN5FlHY01je
 htvUW6HOfaMYzH2Ld0jOY638h5Qvp/SzNNhSFc5rnwwF3gb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M68wIFqtQw24LhXVrV4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YVgqPPGQo+staStjOSZwPoMX1uHpLUHq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bklNpyzyfKP8iSJTKRaji7t5ExjYgwMtJGJ4yY
 uJGNGoxN0yaM3WjPH8XCZxhm9iln0DdbhN1rVK+u7NpoGH6mVkZPL/Fb4OOJ43iqd9utlmcj
 nLL+SL+GB5yHN6VxCeB83msrvTShi69U4UXfJWo+/gvjFCNy2g7DBwNSUD9sfS/klS5Wd9UN
 woT4CVGkEQp3BX1FJ+nBUT++SPa+E5HMzZNLwEkwF6OyPaI2AmpPFo/ZDlPa/J3mpEYSQV/g
 zdlgOjV6SxTXKy9ECzAqufO8GjuZ0D5PkdZO3ZaEFJtD83L5dhq00mRFosL/Lud1IWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiG2NPdXABaDzt6ooEWpgZgDpU
 II4s8af9vsSKpqGiTaARu4AdJnwuavZb2yN3wE1RMN/n9hIx5JEVdE43d2DDB0xbpZslcHBO
 yc/Rj+9FLcMZSD3PMebkqq6CtgwzLiIKOkJosv8N4IUCrAoLVfv1Hg3OSa4gjG2+GBxwP5XB
 HtuWZv1ZZrsIf8/nGTeqiZ0+eJD+x3SMkuCHMuhlUn6iuH2ibz8Ye5tDWZip9sRtMusyDg5O
 f4FXydW432ziNHDXxQ=
IronPort-HdrOrdr: A9a23:73H5xqrcJtGA2zhz6TDLTmEaV5pMeYIsimQD101hICG9E/bo9P
 xG88526faZslgssRIb+exoWpPsfZq0z/cciuMs1N+ZLWvbUQCTTb2Kg7GM/wHd
X-IronPort-AV: E=Sophos;i="5.91,290,1647316800"; 
   d="scan'208";a="75863028"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v4] x86/hvm: Widen condition for is_hvm_pv_evtchn_domain() and report fix in CPUID
Date: Fri, 10 Jun 2022 12:07:04 +0100
Message-ID: <20220610110704.29039-1-jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Have is_hvm_pv_evtchn_domain() return true for vector callbacks for
evtchn delivery set up on a per-vCPU basis via
HVMOP_set_evtchn_upcall_vector.

Assume that if vCPU0 uses HVMOP_set_evtchn_upcall_vector, all
remaining vCPUs will too and thus remove is_hvm_pv_evtchn_vcpu() and
replace sole caller with is_hvm_pv_evtchn_domain().

is_hvm_pv_evtchn_domain() returning true is a condition for setting up
physical IRQ to event channel mappings. Therefore, also add a CPUID
bit so that guests know whether the check in is_hvm_pv_evtchn_domain()
will fail when using HVMOP_set_evtchn_upcall_vector. This matters for
guests that route PIRQs over event channels since
is_hvm_pv_evtchn_domain() is a condition in physdev_map_pirq().

The naming of the CPUID bit is quite generic about upcall support
being available. That's done so that the define name doesn't become
overly long.

A guest that doesn't care about physical interrupts routed over event
channels can just test for the availability of the hypercall directly
(HVMOP_set_evtchn_upcall_vector) without checking the CPUID bit.

Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v4:
 * Remove is_hvm_pv_evtchn_vcpu and replace sole caller.

v3:
 * Improve commit message and title.

v2:
 * Since the naming of the CPUID bit is quite generic, better explain
   when it should be checked for, in code comments and commit message.
---
 xen/arch/x86/hvm/irq.c              | 2 +-
 xen/arch/x86/include/asm/domain.h   | 9 +++++++--
 xen/arch/x86/traps.c                | 6 ++++++
 xen/include/public/arch-x86/cpuid.h | 5 +++++
 4 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
index 5a7f39b54f..19252448cb 100644
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -325,7 +325,7 @@ void hvm_assert_evtchn_irq(struct vcpu *v)
 
         vlapic_set_irq(vcpu_vlapic(v), vector, 0);
     }
-    else if ( is_hvm_pv_evtchn_vcpu(v) )
+    else if ( is_hvm_pv_evtchn_domain(v->domain) )
         vcpu_kick(v);
     else if ( v->vcpu_id == 0 )
         hvm_set_callback_irq_level(v);
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 35898d725f..dcd221cc6f 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -14,9 +14,14 @@
 
 #define has_32bit_shinfo(d)    ((d)->arch.has_32bit_shinfo)
 
+/*
+ * Set to true if either the global vector-type callback or per-vCPU
+ * LAPIC vectors are used. Assume all vCPUs will use
+ * HVMOP_set_evtchn_upcall_vector as long as the initial vCPU does.
+ */
 #define is_hvm_pv_evtchn_domain(d) (is_hvm_domain(d) && \
-        (d)->arch.hvm.irq->callback_via_type == HVMIRQ_callback_vector)
-#define is_hvm_pv_evtchn_vcpu(v) (is_hvm_pv_evtchn_domain(v->domain))
+        ((d)->arch.hvm.irq->callback_via_type == HVMIRQ_callback_vector || \
+         (d)->vcpu[0]->arch.hvm.evtchn_upcall_vector))
 #define is_domain_direct_mapped(d) ((void)(d), 0)
 
 #define VCPU_TRAP_NONE         0
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


