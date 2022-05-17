Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7754652A340
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 15:22:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330869.554297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqx9n-0004U8-Nl; Tue, 17 May 2022 13:22:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330869.554297; Tue, 17 May 2022 13:22:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqx9n-0004RM-Jn; Tue, 17 May 2022 13:22:35 +0000
Received: by outflank-mailman (input) for mailman id 330869;
 Tue, 17 May 2022 13:22:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ktda=VZ=citrix.com=prvs=129b277d0=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nqx9l-0003EP-UH
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 13:22:34 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67c812f1-d5e4-11ec-837e-e5687231ffcc;
 Tue, 17 May 2022 15:22:32 +0200 (CEST)
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
X-Inumbo-ID: 67c812f1-d5e4-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652793752;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=v+uvZ0yEjHIALOda2RJFXPU8SCQqSDv+lgj0prZ4Lck=;
  b=XJ8CTaNdECiMa+SJHwDLoR+xNMMGDD1r0eoF8ttCyZFmMttHeJZzsTTd
   LoWlk0V28vvHqdlJvICBEhivlL3uVKgr6fdCHgZCgzGowIslfv8t06Ok6
   SZXuHTVL8WCBWRyCyA1e4U0gAnLig23RhCPYn7AFCeX0Pn9fcKd+3zhB2
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 71351364
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:X+BUJq+rHJWkA+AsGcJ6DrUD636TJUtcMsCJ2f8bNWPcYEJGY0x3m
 GccXzyFPv6IZTfyfN0lO9y39EwE75KBzIdmSgc9/3s8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ44f5fs7Rh2NQw3IHmW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnaDgdw4zFYrpotpDeUVFOSpzGIF5pZaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKEWvHwm6DjdBPIvR53rSKTW/95Imjw3g6iiGN6BP
 pFEMGExMHwsZTVNM20XIZRnnd2oj3ThTH5biGq/qaU4tj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKhMQOcGbyDGF2mmxneKJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO9Fq1giX4Y3x2TjHLDQZZDVMTfAZ6eZjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WvQVnNL
 ya2QD/Sbln5peoCzO2F8F/OmFpATbCZH1dutm07so9Ihz6VhbJJhaT1sTA3Dt4ade51q2VtW
 1Bdx6CjABgmV83lqcB0aLxl8EuVz/iEKibAplVkAoMs8T+gk1b6I90Kv2sgfBs5bJ1dEdMMX
 KM0kVoBjKK/wVPwNfMnC25PI5pCIVfc+STNCamPM4smjmlZfw6b5iB+DXN8LEi2+HXAZZoXY
 M/BGe71VC5yIf0+kFKeGrZGuZd2l39W+I8mbc2ip/hR+eHGNCD9pHZsGAbmU93VG4ve+1WIr
 4cGbpbVo/idOcWnChTqHUcoBQhiBRAG6Vre8qS7qsbrztJaJVwc
IronPort-HdrOrdr: A9a23:le7ldqG21WEiP+orpLqFYZHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LK90c67MAnhHP9OkPIs1NKZMDUO11HYSL2KgbGD/9SkIVyGygc/79
 YeT0EBMqyWMbESt6+TjmiF+pQbsaG6GciT9JvjJhxWPGRXgs9bnmRE4lHxKDwKeOAKP+twKH
 LajfA31AaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGQ9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9wwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgjf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQy/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKp7zPKN
 MeTP002cwmMm9zNxvizytSKZ2XLzgO9y69Mwk/Upf/6UkSoJh7p3FosPD30E1wsK7VcKM0lt
 gsAp4Y6o2mcfVmHZ6VfN1xJ/dfKla9Ny4kY1jiaGgOKsk8SgDwgq+yxokJz8eXX7FN5KcOuf
 36ISZlXCgJCg/TNfE=
X-IronPort-AV: E=Sophos;i="5.91,232,1647316800"; 
   d="scan'208";a="71351364"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2] x86/hvm: Widen condition for is_hvm_pv_evtchn_vcpu()
Date: Tue, 17 May 2022 14:21:56 +0100
Message-ID: <20220517132156.7078-1-jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Have is_hvm_pv_evtchn_vcpu() return true for vector callbacks for
evtchn delivery set up on a per-vCPU basis via
HVMOP_set_evtchn_upcall_vector.

is_hvm_pv_evtchn_vcpu() returning true is a condition for setting up
physical IRQ to event channel mappings.

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


