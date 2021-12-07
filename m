Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFC046B99A
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 11:54:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240870.417639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muY6h-0007uo-3W; Tue, 07 Dec 2021 10:53:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240870.417639; Tue, 07 Dec 2021 10:53:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muY6g-0007sc-Vd; Tue, 07 Dec 2021 10:53:58 +0000
Received: by outflank-mailman (input) for mailman id 240870;
 Tue, 07 Dec 2021 10:53:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WjKu=QY=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1muY6f-0007ZY-Gr
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 10:53:57 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f840c68d-574b-11ec-a831-37629979565c;
 Tue, 07 Dec 2021 11:53:55 +0100 (CET)
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
X-Inumbo-ID: f840c68d-574b-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638874435;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aUo9w7NMA0gJRwpoUWuXtmPLfdUrj41MF7NAi5apEPM=;
  b=GsExAMTQ4cNOQqKGMnzD5LLbSIYPrxzp3UFpU7jO/4evCmNvgfWGxakC
   KBXGbkC1D5zrA3YNF/UZqth5O5ynAA6+PnTKOEdW+fUsF/pZtACVtdxQT
   EznM01ej2YmsEum/HfzClkL5U3QCXkdQFNqREM4INhp7ZfmFcMIw4nVMd
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: K5HH7TtBnxror/G2Vpmn5l+DQYHY+lld85s1mk+DyljgLRMN/Csta2bCssmH6EDZ1D5jprrY9D
 r8SKCVf0CHd7IDbWS3ewrDbnnaJjfLFOX3YA9WE9WyIUtegMUCviYNcwB4ZnLWZNkmheRkfodN
 lw9EWevD1Cg6h/pxYCEE4dCRBZitbXwDNMhQHmCQuY1zItZlB8vgiZT2TaC8s7/2UZeZpNyRyQ
 SxdMZGtzSvyTAbsS4b/sDO1h4SGfcgYmprfj+/Hsq+XcR8G1K/B95Hoh2KtpMqyzpAHtE5MtdU
 BLvDVB6x6zJIu3GKmJc2aRHr
X-SBRS: 5.1
X-MesageID: 59450633
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:An7c4qhLDtd61D3LX/aIGtBNX161WRcKZh0ujC45NGQN5FlHY01je
 htvXzuDa63fMWvxedxxa4++/UxVuZLRy4JnTgM+rSA3HyIb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29Qw3oDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1y6Y3udBgLZpHTmcsPdTh1OgheIKZZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHCOo8Ft24m5jbeFfs8GrjIQrnQ5M8e1zA17ixLNauPO
 5dBN2E0BPjGS1pAfVolKspnpbiDr0n6Y2FV8l6rgKVitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzRIDsXKdiewjqt6W+3i6nEmiaTcJIfEvi0++BnhHWXx3cPE1sGWF2ju/67h0WiHdVFJ
 CQpFjEG9PZoshbxF5+kAkP+8CXsUgMgt8R4LLErtjyS6PLo/Ae2FE4lYxdoSMEtq5pjLdA17
 WOhk9TsDD1plbSaT3OB67uZxQ+P1TgpwXwqPnFdE1ZcizX3iMRq10+UEI4/eEKgpoStQWmY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtQmzARVodt/xory9U
 J8swZf20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4LsGEnehkxaJ5YJ1cFh
 XM/XisLu/du0IaCN/crM+pd9ex0pUQfKTgVfq+NNYcfCnSAXASG4DtvdSatM5PFyyARfVUEE
 c7DK66EVC9CYYw+lWbeb7pNgNcDm3FlrUuOFM+T8vhS+efHDJJjYexeawXmgyFQxP7snTg5B
 P4DbZbXkEsGD7WlCsQVmKZKRW03wbEALcieg6RqmiSre2KKwUktVK3cx60PYYtgk/gHn+vE5
 CjlCERZ1ED+lTvMLgDTMiJvb7bmXJBeq3MnPHNzYQb0iiZ7OYv/vr0Cc5YXfKU88LAxx/BDU
 PRYKd6LBe5CS2qb9m1FP4X9toFraD+imRmKY3i+eDE6cpM5H17J99bocxHB7i4LCibr58Iyr
 6f5jlHQQIYZRhQkB8HTMar9w1S0tHkbueRzQ0qXfYUDJBSyqNBncnWjgOU2LscALQT46gGbj
 wvGUw0FoeTtopMu9IWbj66zsIr0QfB1GVBXHjeH4O/uZzXa5Geq3aRJTP2MIWLGTGrx9aivO
 bdVwvX7PKFVlVpGqdMhQbNizKZ47Nrzvb5KiA9jGSyTPVisD7phJFiA3NVO6fIRluMI51PuV
 xLd4MReNJWIJNjhQQwYKwcSZ+ie0e0Zx2vJ5vMvLUSmvCJ68dJri6mJ08VgXMCFEIZIDQ==
IronPort-HdrOrdr: A9a23:e/zODanN99YMCd+BDK2sanFgIwXpDfLW3DAbv31ZSRFFG/Fw9/
 rCoB3U73/JYVcqKRUdcLW7UpVoLkmyyXcY2+cs1NSZLWzbUQmTXeJfBOLZqlWNJ8SXzIVgPM
 xbAspD4bPLbGSTjazBkXSF+9RL+qj6zEh/792usEuETmtRGt9dBx8SMHf9LqXvLjM2fqbQEv
 Cnl6x6jgvlQ1s7ROKhCEIIWuDSzue77q4PMXY9dmcaABDlt0LR1ILH
X-IronPort-AV: E=Sophos;i="5.87,293,1631592000"; 
   d="scan'208";a="59450633"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/3] x86/boot: Drop move_memory() and use memcpy() directly
Date: Tue, 7 Dec 2021 10:53:38 +0000
Message-ID: <20211207105339.28440-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211207105339.28440-1-andrew.cooper3@citrix.com>
References: <20211207105339.28440-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The way move_memory() sets up the virtual mappings means that there are always
two non-overlapping regions.  The virtual layout means that memmove()'s
forward/backwards check doesn't do what the caller intends, as the check ought
to be performed in physical space rather than virtual.

Luckily both callers already provide non-overlapping mappings, so this bug
doesn't manifest, and we can move to memcpy() to avoid a backwards copy.
Backwards rep movs's are typically far slower than forwards copies.

Furthermore, both callers already have suitable directmap mappings.  There is
no need to spend time managing early boot mappings, or chunking the copy
through them.

For the main Xen relocation, we can read out of the virtual mapping that we're
executing on, and write directly into the directmap.  In fact, this removes
one dependency on Xen being "at 0" (the XEN_IMG_OFFSET passed as src) for
relocation to occur.

For the module relocation, just transcribe the move_memory() call into an
equivalent memcpy().

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/setup.c | 58 +++++-----------------------------------------------
 1 file changed, 5 insertions(+), 53 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 0492856292cf..a6ff450daab7 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -413,53 +413,6 @@ void *__init bootstrap_map(const module_t *mod)
     return ret;
 }
 
-static void *__init move_memory(
-    uint64_t dst, uint64_t src, unsigned int size, bool keep)
-{
-    unsigned int blksz = BOOTSTRAP_MAP_LIMIT - BOOTSTRAP_MAP_BASE;
-    unsigned int mask = (1L << L2_PAGETABLE_SHIFT) - 1;
-
-    if ( src + size > BOOTSTRAP_MAP_BASE )
-        blksz >>= 1;
-
-    while ( size )
-    {
-        module_t mod;
-        unsigned int soffs = src & mask;
-        unsigned int doffs = dst & mask;
-        unsigned int sz;
-        void *d, *s;
-
-        mod.mod_start = (src - soffs) >> PAGE_SHIFT;
-        mod.mod_end = soffs + size;
-        if ( mod.mod_end > blksz )
-            mod.mod_end = blksz;
-        sz = mod.mod_end - soffs;
-        s = bootstrap_map(&mod);
-
-        mod.mod_start = (dst - doffs) >> PAGE_SHIFT;
-        mod.mod_end = doffs + size;
-        if ( mod.mod_end > blksz )
-            mod.mod_end = blksz;
-        if ( sz > mod.mod_end - doffs )
-            sz = mod.mod_end - doffs;
-        d = bootstrap_map(&mod);
-
-        memmove(d + doffs, s + soffs, sz);
-
-        dst += sz;
-        src += sz;
-        size -= sz;
-
-        if ( keep )
-            return size ? NULL : d + doffs;
-
-        bootstrap_map(NULL);
-    }
-
-    return NULL;
-}
-
 #undef BOOTSTRAP_MAP_LIMIT
 
 static uint64_t __init consider_modules(
@@ -1243,7 +1196,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
              * data until after we have switched to the relocated pagetables!
              */
             barrier();
-            move_memory(e, XEN_IMG_OFFSET, _end - _start, 1);
+            memcpy(__va(__pa(_start)), _start, _end - _start);
 
             /* Walk idle_pg_table, relocating non-leaf entries. */
             pl4e = __va(__pa(idle_pg_table));
@@ -1300,8 +1253,6 @@ void __init noreturn __start_xen(unsigned long mbi_p)
                    "1" (__va(__pa(cpu0_stack))), "2" (STACK_SIZE / 8)
                 : "memory" );
 
-            bootstrap_map(NULL);
-
             printk("New Xen image base address: %#lx\n", xen_phys_start);
         }
 
@@ -1325,9 +1276,10 @@ void __init noreturn __start_xen(unsigned long mbi_p)
                  (headroom ||
                   ((end - size) >> PAGE_SHIFT) > mod[j].mod_start) )
             {
-                move_memory(end - size + headroom,
-                            (uint64_t)mod[j].mod_start << PAGE_SHIFT,
-                            mod[j].mod_end, 0);
+                memcpy(__va(end - size + headroom),
+                       __va((uint64_t)mod[j].mod_start << PAGE_SHIFT),
+                       mod[j].mod_end);
+
                 mod[j].mod_start = (end - size) >> PAGE_SHIFT;
                 mod[j].mod_end += headroom;
                 mod[j].reserved = 1;
-- 
2.11.0


