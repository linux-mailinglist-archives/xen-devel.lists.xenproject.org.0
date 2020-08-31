Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1651257820
	for <lists+xen-devel@lfdr.de>; Mon, 31 Aug 2020 13:20:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kChpt-0007tL-Rw; Mon, 31 Aug 2020 11:18:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JYEY=CJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kChps-0007tG-NM
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2020 11:18:52 +0000
X-Inumbo-ID: 531aaf37-2d4b-4068-836d-ca499a889f76
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 531aaf37-2d4b-4068-836d-ca499a889f76;
 Mon, 31 Aug 2020 11:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598872731;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e99vmX6iMfIx7xndNdCIeZco3G9FNaD/HMx64qOrfMs=;
 b=Cb4tNrNZOox4u6OAc6WllA/50XpeFgKKSeBsg1IsF5wjk/Z2vI9xzB5k
 bWaKrHDLd4G/81f1NOuiojBKc/FrYglN/4Q+SCzlhVDlPQmyRVmmT2L/L
 x2vNc7cwZUneKZVyU3JfHHrD9GmVLjkIAtJdhJsjnmgDYEqNTqc8DaKYk o=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: xTfKJcjBTZu+2/wGL/MeG3Q3akHG1Br7YDSx0IxHhLtwiWMbrez1ed/T6+9E1QuzaqkILML7Zx
 ni/bo+DVbOcUwalzKEcbcZr2Z/TVXnvrMuEdtiLPcLrZUBsfv3LLNAf1i+ip1QW1iezkNY6rer
 7RwD0IGALjQaqpachLdJ2S5tpJ/uuhDnckOZ1z2ZdxeIVe/Q6pVWOSaQ7KHoyo6cv5j/cofpMM
 tkue37FzIPHxi4nmdUE9p0Hu6To5rhpstc7+Qz/L5YW6U444d80OlPCMBKmafU5Bzo1RynpHVx
 Mvc=
X-SBRS: 2.7
X-MesageID: 25770395
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,375,1592884800"; d="scan'208";a="25770395"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Andy Lutomirski
 <luto@kernel.org>
Subject: [PATCH] x86/pv: Fix multiple bugs with SEGBASE_GS_USER_SEL
Date: Mon, 31 Aug 2020 12:18:32 +0100
Message-ID: <20200831111832.25275-1-andrew.cooper3@citrix.com>
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

The logic takes the segment selector unmodified from guest context.  This
allowed the guest to load DPL0 descriptors into %gs.  Fix up the RPL for
non-NUL selectors to be 3.

Xen's context switch logic skips saving the inactive %gs base, as it cannot be
modified by the guest behind Xen's back.  This depends on Xen caching updates
to the inactive base, which is was missing from this path.

The consequence is that, following SEGBASE_GS_USER_SEL, the next context
switch will restore the stale inactive %gs base, and corrupt vcpu state.

Rework the hypercall to update the cached idea of gs_base_user, and fix the
behaviour in the case of the AMD NUL selector bug to always zero the segment
base.

Reported-by: Andy Lutomirski <luto@kernel.org>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Andy Lutomirski <luto@kernel.org>
---
 xen/arch/x86/x86_64/mm.c | 56 +++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 46 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index 29048d34dc..95ee05cd5d 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -1059,16 +1059,52 @@ long do_set_segment_base(unsigned int which, unsigned long base)
         break;
 
     case SEGBASE_GS_USER_SEL:
-        __asm__ __volatile__ (
-            "     swapgs              \n"
-            "1:   movl %k0,%%gs       \n"
-            "    "safe_swapgs"        \n"
-            ".section .fixup,\"ax\"   \n"
-            "2:   xorl %k0,%k0        \n"
-            "     jmp  1b             \n"
-            ".previous                \n"
-            _ASM_EXTABLE(1b, 2b)
-            : "+r" (base) );
+        /*
+         * We wish to update the user %gs from the GDT/LDT.  Currently, the
+         * guest kernel's GS_BASE is in context.
+         */
+        asm volatile ( "swapgs" );
+
+        if ( base <= 3 )
+        {
+            /* Work around NUL segment behaviour on AMD hardware. */
+            if ( boot_cpu_data.x86_vendor &
+                 (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
+                asm volatile ( "mov %[sel], %%gs"
+                               :: [sel] "rm" (FLAT_USER_DS32) );
+        }
+        else
+            /* Fix up RPL. */
+            base |= 3;
+
+        /*
+         * Load the chosen selector, with fault handling.
+         *
+         * Errors ought to fail the hypercall, but that was never built in
+         * originally, and Linux will BUG() if this call fails.
+         *
+         * NUL the selector in the case of an error.  This too needs to deal
+         * with the AMD NUL segment behaviour, but it is already a slowpath in
+         * #GP context so perform the flat load unconditionally to avoid
+         * complicated logic.
+         *
+         * Anyone wanting to check for errors from this hypercall should
+         * re-read %gs and compare against the input 'base' selector.
+         */
+        asm volatile ( "1: mov %k[sel], %%gs\n\t"
+                       ".section .fixup, \"ax\", @progbits\n\t"
+                       "2: mov %k[flat], %%gs\n\t"
+                       "   xor %k[sel], %k[sel]\n\t"
+                       "   jmp 1b\n\t"
+                       ".previous\n\t"
+                       _ASM_EXTABLE(1b, 2b)
+                       : [sel] "+r" (base)
+                       : [flat] "rm" (FLAT_USER_DS32) );
+
+        /* Update the cache of the inactive base, as read from the GDT/LDT. */
+        v->arch.pv.gs_base_user = rdgsbase();
+
+        asm volatile ( safe_swapgs );
         break;
 
     default:
-- 
2.11.0


