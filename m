Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 773A0233825
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 20:10:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1D0E-0001p9-IM; Thu, 30 Jul 2020 18:10:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IK5u=BJ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k1D0D-0001eP-AE
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 18:10:01 +0000
X-Inumbo-ID: dd9a0340-d28f-11ea-ab01-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd9a0340-d28f-11ea-ab01-12813bfff9fa;
 Thu, 30 Jul 2020 18:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JvdgUN4G+hJQeSgeZrRHkKlqRzJx599CQaDONH0J3Tw=; b=G49/hj4voipbAEp54p6KOONjVL
 EBBtQPz9TM37BQARWen0u2rGIiCOM1lKpy75LRQzyev8VMWqqlUICDLopFXH0SngWA8QF4oU9bjWr
 ids1sQqsfB7kGAiv53cNyyeC0f6Q1iXu+IPIEECd1++ggXCiZHOgzVpjmI1hZYI/nAjw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k1D02-0007cn-95; Thu, 30 Jul 2020 18:09:50 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k1CjH-0004nV-7m; Thu, 30 Jul 2020 17:52:31 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 5/7] xen: include xen/guest_access.h rather than
 asm/guest_access.h
Date: Thu, 30 Jul 2020 18:52:10 +0100
Message-Id: <20200730175213.30679-11-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200730175213.30679-1-julien@xen.org>
References: <20200730175213.30679-1-julien@xen.org>
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
    Changes in v2:
        - Remove some changes that weren't meant to be here.
---
 xen/arch/arm/decode.c                | 2 +-
 xen/arch/arm/domain.c                | 2 +-
 xen/arch/arm/guest_walk.c            | 3 ++-
 xen/arch/arm/guestcopy.c             | 2 +-
 xen/arch/arm/vgic-v3-its.c           | 2 +-
 xen/arch/x86/hvm/svm/svm.c           | 2 +-
 xen/arch/x86/hvm/viridian/viridian.c | 2 +-
 xen/arch/x86/hvm/vmx/vmx.c           | 2 +-
 xen/common/libelf/libelf-loader.c    | 2 +-
 xen/include/asm-arm/guest_access.h   | 1 -
 xen/lib/x86/private.h                | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
index 144793c8cea0..792c2e92a7eb 100644
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
index 31169326b2e3..9258f6d3faa2 100644
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
index a1cdd7f4afea..b4496c4c86c6 100644
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
index c8023e2bca5d..32681606d8fc 100644
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
index 6e153c698d56..58d939b85f92 100644
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
index ca3bbfcbb355..7301f3cd6004 100644
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
index 977c1bc54fad..dc7183a54627 100644
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
index eb54aadfbafb..cb5df1e81c9c 100644
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
index 0f468727d04a..629cc0d3e611 100644
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
index 31b9f03f0015..b9a89c495527 100644
--- a/xen/include/asm-arm/guest_access.h
+++ b/xen/include/asm-arm/guest_access.h
@@ -1,7 +1,6 @@
 #ifndef __ASM_ARM_GUEST_ACCESS_H__
 #define __ASM_ARM_GUEST_ACCESS_H__
 
-#include <xen/guest_access.h>
 #include <xen/errno.h>
 #include <xen/sched.h>
 
diff --git a/xen/lib/x86/private.h b/xen/lib/x86/private.h
index b793181464f3..2d53bd3ced23 100644
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


