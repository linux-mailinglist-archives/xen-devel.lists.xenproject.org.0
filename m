Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA061E4E3D
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 21:34:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1je1on-0006a7-OA; Wed, 27 May 2020 19:34:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/dLv=7J=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1je1om-0006Zn-Lz
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 19:34:24 +0000
X-Inumbo-ID: 11666ca2-a051-11ea-a779-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 11666ca2-a051-11ea-a779-12813bfff9fa;
 Wed, 27 May 2020 19:34:23 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: wY10bV6tZiw8sRMAEjklee9H8RWGt6pqPgLjQ3cvNmM25+VfjtEE08bM7dz9/CBxYagtPn4LQ9
 9ZPonaohusmVZGlVGlaSY1fLc4vEQzXgXV3Yr6ZDI1uZZZPDRKuR+aRqwlEOWGnSBSOOHK7054
 CkoiN1AupubV16bKGGtSqGLVA6RuL/rHFOrdGnXEKATOiFpGSoHyhCb4cNaAUOdEKdru+jFRi6
 EEuEuMhCcHhljANqiK7tKQo2J3/9jRGidOEUY09coR0Ek2+tzdSE5HXOIj+lJGwhLT0gjFgi0I
 pzw=
X-SBRS: 2.7
X-MesageID: 18615173
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,442,1583211600"; d="scan'208";a="18615173"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 11/14] x86/alt: Adjust _alternative_instructions() to not
 create shadow stacks
Date: Wed, 27 May 2020 20:18:44 +0100
Message-ID: <20200527191847.17207-12-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200527191847.17207-1-andrew.cooper3@citrix.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
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

The current alternatives algorithm clears CR0.WP and writes into .text.  This
has a side effect of the mappings becoming shadow stacks once CET is active.

Adjust _alternative_instructions() to clean up after itself.  This involves
extending the set of bits modify_xen_mappings() to include Dirty (and Accessed
for good measure).

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/alternative.c | 14 ++++++++++++++
 xen/arch/x86/mm.c          |  6 +++---
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index ce2b4302e6..004e9ede25 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -21,6 +21,7 @@
 #include <asm/processor.h>
 #include <asm/alternative.h>
 #include <xen/init.h>
+#include <asm/setup.h>
 #include <asm/system.h>
 #include <asm/traps.h>
 #include <asm/nmi.h>
@@ -398,6 +399,19 @@ static void __init _alternative_instructions(bool force)
         panic("Timed out waiting for alternatives self-NMI to hit\n");
 
     set_nmi_callback(saved_nmi_callback);
+
+    /*
+     * When Xen is using shadow stacks, the alternatives clearing CR0.WP and
+     * writing into the mappings set dirty bits, turning the mappings into
+     * shadow stack mappings.
+     *
+     * While we can execute from them, this would also permit them to be the
+     * target of WRSS instructions, so reset the dirty after patching.
+     */
+    if ( cpu_has_xen_shstk )
+        modify_xen_mappings(XEN_VIRT_START + MB(2),
+                            (unsigned long)&__2M_text_end,
+                            PAGE_HYPERVISOR_RX);
 }
 
 void __init alternative_instructions(void)
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 4d6d22cc41..711b12828f 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5442,8 +5442,8 @@ int populate_pt_range(unsigned long virt, unsigned long nr_mfns)
  * mappings, but will shatter superpages if necessary, and will destroy
  * mappings if not passed _PAGE_PRESENT.
  *
- * The only flags considered are NX, RW and PRESENT.  All other input flags
- * are ignored.
+ * The only flags considered are NX, D, A, RW and PRESENT.  All other input
+ * flags are ignored.
  *
  * It is an error to call with present flags over an unpopulated range.
  */
@@ -5456,7 +5456,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
     unsigned long v = s;
 
     /* Set of valid PTE bits which may be altered. */
-#define FLAGS_MASK (_PAGE_NX|_PAGE_RW|_PAGE_PRESENT)
+#define FLAGS_MASK (_PAGE_NX|_PAGE_DIRTY|_PAGE_ACCESSED|_PAGE_RW|_PAGE_PRESENT)
     nf &= FLAGS_MASK;
 
     ASSERT(IS_ALIGNED(s, PAGE_SIZE));
-- 
2.11.0


