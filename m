Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECA319E523
	for <lists+xen-devel@lfdr.de>; Sat,  4 Apr 2020 15:10:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKiZY-0005vN-3C; Sat, 04 Apr 2020 13:10:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7qE9=5U=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jKiZW-0005uY-9g
 for xen-devel@lists.xenproject.org; Sat, 04 Apr 2020 13:10:50 +0000
X-Inumbo-ID: abf13c0a-7675-11ea-be20-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id abf13c0a-7675-11ea-be20-12813bfff9fa;
 Sat, 04 Apr 2020 13:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3TNR7ldYljZZcx1x7OLW4LGPIWLoF2a6IJjm2LPtFSs=; b=LOBkKd6QLC9U68DkJii93KqBIO
 XI4MvnFuoczBqtJCCRyQ6w19PwxWS9q4mnVoAC8oX7kO1jaSEyFz0AcT3Nd6zgRpB3hB2zsBjrSAd
 Eh2hL93k2Ow1FD4PIVCk0TCuiGhtTd+HzV+3Qom7lgHHB5FB7MbIama2TeVsJ7p3HKg8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jKiZG-0008G9-1N; Sat, 04 Apr 2020 13:10:34 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jKiZF-0007rM-Oh; Sat, 04 Apr 2020 13:10:33 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 5/7] xen: include xen/guest_access.h rather than
 asm/guest_access.h
Date: Sat,  4 Apr 2020 14:10:15 +0100
Message-Id: <20200404131017.27330-6-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404131017.27330-1-julien@xen.org>
References: <20200404131017.27330-1-julien@xen.org>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

Only a few places are actually including asm/guest_access.h. While this
is fine today, a follow-up patch will want to move most of the helpers
from asm/guest_access.h to xen/guest_access.h.

To prepare the move, everyone should include xen/guest_access.h rather
than asm/guest_access.h.

Interestingly, asm-arm/guest_access.h includes xen/guest_access.h. The
inclusion is now removed as no-one but the latter should include the
former.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/decode.c                |  2 +-
 xen/arch/arm/domain.c                |  2 +-
 xen/arch/arm/guest_walk.c            |  3 ++-
 xen/arch/arm/guestcopy.c             |  2 +-
 xen/arch/arm/vgic-v3-its.c           |  2 +-
 xen/arch/x86/hvm/svm/svm.c           |  2 +-
 xen/arch/x86/hvm/viridian/viridian.c |  2 +-
 xen/arch/x86/hvm/vmx/vmx.c           |  2 +-
 xen/common/libelf/libelf-loader.c    |  2 +-
 xen/include/asm-arm/guest_access.h   |  1 -
 xen/include/asm-x86/guest_access.h   | 22 ++++++++++++----------
 xen/lib/x86/private.h                |  2 +-
 12 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
index 144793c8ce..792c2e92a7 100644
--- a/xen/arch/arm/decode.c
+++ b/xen/arch/arm/decode.c
@@ -17,12 +17,12 @@
  * GNU General Public License for more details.
  */
 
+#include <xen/guest_access.h>
 #include <xen/lib.h>
 #include <xen/sched.h>
 #include <xen/types.h>
 
 #include <asm/current.h>
-#include <asm/guest_access.h>
 
 #include "decode.h"
 
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 2190d908eb..b062c232b6 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -12,6 +12,7 @@
 #include <xen/bitops.h>
 #include <xen/errno.h>
 #include <xen/grant_table.h>
+#include <xen/guest_access.h>
 #include <xen/hypercall.h>
 #include <xen/init.h>
 #include <xen/lib.h>
@@ -26,7 +27,6 @@
 #include <asm/current.h>
 #include <asm/event.h>
 #include <asm/gic.h>
-#include <asm/guest_access.h>
 #include <asm/guest_atomics.h>
 #include <asm/irq.h>
 #include <asm/p2m.h>
diff --git a/xen/arch/arm/guest_walk.c b/xen/arch/arm/guest_walk.c
index a1cdd7f4af..b4496c4c86 100644
--- a/xen/arch/arm/guest_walk.c
+++ b/xen/arch/arm/guest_walk.c
@@ -16,8 +16,9 @@
  */
 
 #include <xen/domain_page.h>
+#include <xen/guest_access.h>
 #include <xen/sched.h>
-#include <asm/guest_access.h>
+
 #include <asm/guest_walk.h>
 #include <asm/short-desc.h>
 
diff --git a/xen/arch/arm/guestcopy.c b/xen/arch/arm/guestcopy.c
index c8023e2bca..32681606d8 100644
--- a/xen/arch/arm/guestcopy.c
+++ b/xen/arch/arm/guestcopy.c
@@ -1,10 +1,10 @@
 #include <xen/domain_page.h>
+#include <xen/guest_access.h>
 #include <xen/lib.h>
 #include <xen/mm.h>
 #include <xen/sched.h>
 
 #include <asm/current.h>
-#include <asm/guest_access.h>
 
 #define COPY_flush_dcache   (1U << 0)
 #define COPY_from_guest     (0U << 1)
diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
index 6e153c698d..58d939b85f 100644
--- a/xen/arch/arm/vgic-v3-its.c
+++ b/xen/arch/arm/vgic-v3-its.c
@@ -32,6 +32,7 @@
 #include <xen/bitops.h>
 #include <xen/config.h>
 #include <xen/domain_page.h>
+#include <xen/guest_access.h>
 #include <xen/lib.h>
 #include <xen/init.h>
 #include <xen/softirq.h>
@@ -39,7 +40,6 @@
 #include <xen/sched.h>
 #include <xen/sizes.h>
 #include <asm/current.h>
-#include <asm/guest_access.h>
 #include <asm/mmio.h>
 #include <asm/gic_v3_defs.h>
 #include <asm/gic_v3_its.h>
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 888f504a94..9e14a451eb 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -16,6 +16,7 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/guest_access.h>
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/trace.h>
@@ -34,7 +35,6 @@
 #include <asm/cpufeature.h>
 #include <asm/processor.h>
 #include <asm/amd.h>
-#include <asm/guest_access.h>
 #include <asm/debugreg.h>
 #include <asm/msr.h>
 #include <asm/i387.h>
diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
index 977c1bc54f..dc7183a546 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -5,12 +5,12 @@
  * Hypervisor Top Level Functional Specification for more information.
  */
 
+#include <xen/guest_access.h>
 #include <xen/sched.h>
 #include <xen/version.h>
 #include <xen/hypercall.h>
 #include <xen/domain_page.h>
 #include <xen/param.h>
-#include <asm/guest_access.h>
 #include <asm/guest/hyperv-tlfs.h>
 #include <asm/paging.h>
 #include <asm/p2m.h>
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 1c398fdb6e..98e9c91ea3 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -15,6 +15,7 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/guest_access.h>
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/param.h>
@@ -31,7 +32,6 @@
 #include <asm/regs.h>
 #include <asm/cpufeature.h>
 #include <asm/processor.h>
-#include <asm/guest_access.h>
 #include <asm/debugreg.h>
 #include <asm/msr.h>
 #include <asm/p2m.h>
diff --git a/xen/common/libelf/libelf-loader.c b/xen/common/libelf/libelf-loader.c
index 0f468727d0..629cc0d3e6 100644
--- a/xen/common/libelf/libelf-loader.c
+++ b/xen/common/libelf/libelf-loader.c
@@ -16,7 +16,7 @@
  */
 
 #ifdef __XEN__
-#include <asm/guest_access.h>
+#include <xen/guest_access.h>
 #endif
 
 #include "libelf-private.h"
diff --git a/xen/include/asm-arm/guest_access.h b/xen/include/asm-arm/guest_access.h
index 4046d50347..93d56868f1 100644
--- a/xen/include/asm-arm/guest_access.h
+++ b/xen/include/asm-arm/guest_access.h
@@ -1,7 +1,6 @@
 #ifndef __ASM_ARM_GUEST_ACCESS_H__
 #define __ASM_ARM_GUEST_ACCESS_H__
 
-#include <xen/guest_access.h>
 #include <xen/errno.h>
 #include <xen/sched.h>
 
diff --git a/xen/include/asm-x86/guest_access.h b/xen/include/asm-x86/guest_access.h
index 9ee275d01f..5c3dfc47b6 100644
--- a/xen/include/asm-x86/guest_access.h
+++ b/xen/include/asm-x86/guest_access.h
@@ -54,22 +54,24 @@
 
 /* Cast a XEN_GUEST_HANDLE to XEN_GUEST_HANDLE_PARAM */
 #define guest_handle_to_param(hnd, type) ({                  \
+    typeof((hnd).p) _x = (hnd).p;                            \
+    XEN_GUEST_HANDLE_PARAM(type) _y = { _x };                \
     /* type checking: make sure that the pointers inside     \
      * XEN_GUEST_HANDLE and XEN_GUEST_HANDLE_PARAM are of    \
      * the same type, then return hnd */                     \
-    (void)((typeof(&(hnd).p)) 0 ==                           \
-        (typeof(&((XEN_GUEST_HANDLE_PARAM(type)) {}).p)) 0); \
-    (hnd);                                                   \
+    (void)(&_x == &_y.p);                                    \
+    _y;                                                      \
 })
 
 /* Cast a XEN_GUEST_HANDLE_PARAM to XEN_GUEST_HANDLE */
-#define guest_handle_from_param(hnd, type) ({                \
-    /* type checking: make sure that the pointers inside     \
-     * XEN_GUEST_HANDLE and XEN_GUEST_HANDLE_PARAM are of    \
-     * the same type, then return hnd */                     \
-    (void)((typeof(&(hnd).p)) 0 ==                           \
-        (typeof(&((XEN_GUEST_HANDLE_PARAM(type)) {}).p)) 0); \
-    (hnd);                                                   \
+#define guest_handle_from_param(hnd, type) ({               \
+    typeof((hnd).p) _x = (hnd).p;                           \
+    XEN_GUEST_HANDLE(type) _y = { _x };                     \
+    /* type checking: make sure that the pointers inside    \
+     * XEN_GUEST_HANDLE and XEN_GUEST_HANDLE_PARAM are of   \
+     * the same type, then return hnd */                    \
+    (void)(&_x == &_y.p);                                   \
+    _y;                                                     \
 })
 
 #define guest_handle_for_field(hnd, type, fld)          \
diff --git a/xen/lib/x86/private.h b/xen/lib/x86/private.h
index b793181464..2d53bd3ced 100644
--- a/xen/lib/x86/private.h
+++ b/xen/lib/x86/private.h
@@ -4,12 +4,12 @@
 #ifdef __XEN__
 
 #include <xen/bitops.h>
+#include <xen/guest_access.h>
 #include <xen/kernel.h>
 #include <xen/lib.h>
 #include <xen/nospec.h>
 #include <xen/types.h>
 
-#include <asm/guest_access.h>
 #include <asm/msr-index.h>
 
 #define copy_to_buffer_offset copy_to_guest_offset
-- 
2.17.1


