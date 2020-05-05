Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEB81C54A2
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 13:43:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVvyc-0005ee-GZ; Tue, 05 May 2020 11:43:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u3eM=6T=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jVvya-0005eZ-NE
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 11:43:04 +0000
X-Inumbo-ID: 9456eb70-8ec5-11ea-9dab-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9456eb70-8ec5-11ea-9dab-12813bfff9fa;
 Tue, 05 May 2020 11:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588678983;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=31zhRKWgpHkbWlayt6sZYj3rSqkFq6i7AiR+Kki79xM=;
 b=IdEVt6T/edDXGhbXGyzdYV6BUpjJ32lnTHsXSwrmO+Ehwxy9nwOdckbP
 Sg8YRueWxM8V0NAtZjYnCcH0YoPO/zcsaEgR1O19F5hcT4DFsKK44caBz
 J4dm8mD+YutVFgRr976kAZ2ZZ+WxAqpn+ZgaYqCOHz5uAMwzZZSCk1VmM 8=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: VNq9br66eKc0dRkhyp6a8k7+W7qo8Ef2Uk/EamQMXwxBJ5LS3FXQJu36AVsrCkdMZSxz8GORjc
 X1Y85i2Ta/jH3b5d0VBYwXp88hT6jef0QYYhiyMw9R9CJeDURfUVG5jsEEJ6dl0woerE50Ztax
 LhC5mW1uVXS1Zsogf9zVJco9H/C9tYmNq2N1V9vbl93Facea3+FiF/vhqvn4YNFGX7KVc+GWSA
 gCr/N+f8fr4ggSSHcOc0E13y0Ij2xjkqNof/7A9hpapq/M64nnRevc6s/POkY4pX7ElbAdxNko
 7TE=
X-SBRS: 2.7
X-MesageID: 17149542
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,354,1583211600"; d="scan'208";a="17149542"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/pv: Prune include lists
Date: Tue, 5 May 2020 12:42:36 +0100
Message-ID: <20200505114236.31269-1-andrew.cooper3@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Several of these in particular haven't been pruned since the logic was all
part of arch/x86/traps.c

Some adjustments to header files are required to avoid compile errors:
 * emulate.h needs xen/sched.h because gdt_ldt_desc_ptr() uses v->vcpu_id.
 * mmconfig.h needs to forward declare acpi_table_header.
 * shadow.h and trace.h need to have uint*_t in scope before including the Xen
   public headers.  For shadow.h, reorder the includes.  For trace.h, include
   types.h

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/pv/callback.c      |  5 -----
 xen/arch/x86/pv/emul-gate-op.c  | 19 -------------------
 xen/arch/x86/pv/emul-inv-op.c   | 18 ------------------
 xen/arch/x86/pv/emul-priv-op.c  |  9 +--------
 xen/arch/x86/pv/emulate.h       |  2 ++
 xen/arch/x86/pv/ro-page-fault.c |  8 --------
 xen/arch/x86/pv/shim.c          |  3 ---
 xen/arch/x86/x86_64/mmconfig.h  |  1 +
 xen/include/asm-x86/shadow.h    |  3 ++-
 xen/include/xen/trace.h         |  1 +
 10 files changed, 7 insertions(+), 62 deletions(-)

diff --git a/xen/arch/x86/pv/callback.c b/xen/arch/x86/pv/callback.c
index 106c16ed01..97242cd3d4 100644
--- a/xen/arch/x86/pv/callback.c
+++ b/xen/arch/x86/pv/callback.c
@@ -19,15 +19,10 @@
 #include <xen/event.h>
 #include <xen/hypercall.h>
 #include <xen/guest_access.h>
-#include <xen/lib.h>
-#include <xen/sched.h>
 #include <compat/callback.h>
 #include <compat/nmi.h>
 
-#include <asm/current.h>
-#include <asm/nmi.h>
 #include <asm/shared.h>
-#include <asm/traps.h>
 
 #include <public/callback.h>
 
diff --git a/xen/arch/x86/pv/emul-gate-op.c b/xen/arch/x86/pv/emul-gate-op.c
index 3c7f6d70bc..61e65ce521 100644
--- a/xen/arch/x86/pv/emul-gate-op.c
+++ b/xen/arch/x86/pv/emul-gate-op.c
@@ -20,25 +20,6 @@
  */
 
 #include <xen/err.h>
-#include <xen/errno.h>
-#include <xen/event.h>
-#include <xen/guest_access.h>
-#include <xen/iocap.h>
-#include <xen/spinlock.h>
-#include <xen/trace.h>
-
-#include <asm/apic.h>
-#include <asm/debugreg.h>
-#include <asm/hpet.h>
-#include <asm/hypercall.h>
-#include <asm/mc146818rtc.h>
-#include <asm/p2m.h>
-#include <asm/pv/traps.h>
-#include <asm/shared.h>
-#include <asm/traps.h>
-#include <asm/x86_emulate.h>
-
-#include <xsm/xsm.h>
 
 #include "emulate.h"
 
diff --git a/xen/arch/x86/pv/emul-inv-op.c b/xen/arch/x86/pv/emul-inv-op.c
index 91d05790c2..59e3edc8c4 100644
--- a/xen/arch/x86/pv/emul-inv-op.c
+++ b/xen/arch/x86/pv/emul-inv-op.c
@@ -19,26 +19,8 @@
  * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include <xen/errno.h>
-#include <xen/event.h>
-#include <xen/guest_access.h>
-#include <xen/iocap.h>
-#include <xen/spinlock.h>
 #include <xen/trace.h>
 
-#include <asm/apic.h>
-#include <asm/debugreg.h>
-#include <asm/hpet.h>
-#include <asm/hypercall.h>
-#include <asm/mc146818rtc.h>
-#include <asm/p2m.h>
-#include <asm/pv/traps.h>
-#include <asm/shared.h>
-#include <asm/traps.h>
-#include <asm/x86_emulate.h>
-
-#include <xsm/xsm.h>
-
 #include "emulate.h"
 
 static int emulate_forced_invalid_op(struct cpu_user_regs *regs)
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index e24b84f46a..3b705299cf 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -19,25 +19,18 @@
  * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include <xen/errno.h>
+#include <xen/domain_page.h>
 #include <xen/event.h>
 #include <xen/guest_access.h>
 #include <xen/iocap.h>
-#include <xen/spinlock.h>
-#include <xen/trace.h>
 
 #include <asm/amd.h>
-#include <asm/apic.h>
 #include <asm/debugreg.h>
 #include <asm/hpet.h>
 #include <asm/hypercall.h>
 #include <asm/mc146818rtc.h>
-#include <asm/p2m.h>
 #include <asm/pv/domain.h>
-#include <asm/pv/traps.h>
 #include <asm/shared.h>
-#include <asm/traps.h>
-#include <asm/x86_emulate.h>
 
 #include <xsm/xsm.h>
 
diff --git a/xen/arch/x86/pv/emulate.h b/xen/arch/x86/pv/emulate.h
index fd2aa0a484..4b845b08e3 100644
--- a/xen/arch/x86/pv/emulate.h
+++ b/xen/arch/x86/pv/emulate.h
@@ -1,6 +1,8 @@
 #ifndef __PV_EMULATE_H__
 #define __PV_EMULATE_H__
 
+#include <xen/sched.h>
+
 #include <asm/processor.h>
 #include <asm/x86_emulate.h>
 
diff --git a/xen/arch/x86/pv/ro-page-fault.c b/xen/arch/x86/pv/ro-page-fault.c
index a920fb5e15..0eedb70002 100644
--- a/xen/arch/x86/pv/ro-page-fault.c
+++ b/xen/arch/x86/pv/ro-page-fault.c
@@ -20,15 +20,7 @@
  * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include <xen/guest_access.h>
-#include <xen/rangeset.h>
-#include <xen/sched.h>
 #include <xen/trace.h>
-
-#include <asm/domain.h>
-#include <asm/mm.h>
-#include <asm/pci.h>
-#include <asm/pv/mm.h>
 #include <asm/shadow.h>
 
 #include "emulate.h"
diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
index 31264582cc..3a0525c209 100644
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -25,14 +25,11 @@
 #include <xen/iocap.h>
 #include <xen/param.h>
 #include <xen/shutdown.h>
-#include <xen/types.h>
 #include <xen/consoled.h>
 #include <xen/pv_console.h>
 
-#include <asm/apic.h>
 #include <asm/dom0_build.h>
 #include <asm/guest.h>
-#include <asm/pv/mm.h>
 
 #include <public/arch-x86/cpuid.h>
 #include <public/hvm/params.h>
diff --git a/xen/arch/x86/x86_64/mmconfig.h b/xen/arch/x86/x86_64/mmconfig.h
index 2e836848ad..4d3b9fcbdd 100644
--- a/xen/arch/x86/x86_64/mmconfig.h
+++ b/xen/arch/x86/x86_64/mmconfig.h
@@ -75,6 +75,7 @@ static inline void mmio_config_writel(void __iomem *pos, u32 val)
 }
 
 /* function prototypes */
+struct acpi_table_header;
 int acpi_parse_mcfg(struct acpi_table_header *header);
 int pci_mmcfg_reserved(uint64_t address, unsigned int segment,
                        unsigned int start_bus, unsigned int end_bus,
diff --git a/xen/include/asm-x86/shadow.h b/xen/include/asm-x86/shadow.h
index 907c71f497..8335862c87 100644
--- a/xen/include/asm-x86/shadow.h
+++ b/xen/include/asm-x86/shadow.h
@@ -22,7 +22,6 @@
 #ifndef _XEN_SHADOW_H
 #define _XEN_SHADOW_H
 
-#include <public/domctl.h>
 #include <xen/sched.h>
 #include <xen/perfc.h>
 #include <xen/domain_page.h>
@@ -31,6 +30,8 @@
 #include <asm/p2m.h>
 #include <asm/spec_ctrl.h>
 
+#include <public/domctl.h>
+
 /*****************************************************************************
  * Macros to tell which shadow paging mode a domain is in*/
 
diff --git a/xen/include/xen/trace.h b/xen/include/xen/trace.h
index af925bcfcc..3cbb542af8 100644
--- a/xen/include/xen/trace.h
+++ b/xen/include/xen/trace.h
@@ -28,6 +28,7 @@ extern int tb_init_done;
 #define tb_init_done false
 #endif
 
+#include <xen/types.h>
 #include <public/sysctl.h>
 #include <public/trace.h>
 #include <asm/trace.h>
-- 
2.11.0


