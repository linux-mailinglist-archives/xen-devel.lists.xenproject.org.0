Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 526E46E2E93
	for <lists+xen-devel@lfdr.de>; Sat, 15 Apr 2023 04:24:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521423.810107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnVZ5-00041Y-KM; Sat, 15 Apr 2023 02:22:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521423.810107; Sat, 15 Apr 2023 02:22:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnVZ5-0003zt-Ct; Sat, 15 Apr 2023 02:22:59 +0000
Received: by outflank-mailman (input) for mailman id 521423;
 Sat, 15 Apr 2023 02:22:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hXtF=AG=citrix.com=prvs=462c9d09f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pnVZ2-0003zn-Ny
 for xen-devel@lists.xenproject.org; Sat, 15 Apr 2023 02:22:57 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b832a43-db34-11ed-8611-37d641c3527e;
 Sat, 15 Apr 2023 04:22:52 +0200 (CEST)
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
X-Inumbo-ID: 6b832a43-db34-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681525372;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QJ+3HwfGXzkynQSqiJEwjODBvnbypPPunqE44a4eZqg=;
  b=CxPzn36aSeSYE3Jhy7rnlQYNu535953G4exGqRZal1aOPbd41w1Cj9zM
   Q6GZSb/dAlON+mZP0j7zYN+uu7gCS0ooX4fh5MGYJQZcd4sD2d/xz8ioT
   ZfX8/bqvN6FnV/s5F1yRKnBSXb0ab+AmPx6ceBQLDPMYipIL8hQ6x2yfa
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 105999310
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:XjWoIqBjFW9+hRVW/1/jw5YqxClBgxIJ4kV8jS/XYbTApD0q1mYHx
 zEfXmiBP/eNNDH0fox/Pd+w9UoH7Z7RztFgQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFuspvlDs15K6p4G9B4gRlDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw0956B3kVr
 cckCQtdUD/AruOa5amec7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9I4TXFJQExR/Az
 o7A11/yWTErG+aC83mAqiyBodfPxAirdp1HQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFaHuRgGUtYWDOw+6ymK0KPf5wvfDW8BJgOtc/R/6pVwH2Zzk
 AbUwZWwX2cHXKCppWy134+ZqyvpYRMpDFRSWwBHZAopxsLGmdRm5v7QdeqPAJJZn/WsR2Gpn
 2vb8Xli71kApZVVjvvmpDgrlxrp/8GUFVBtu207S0r/tmtEiJiZi5tEALQxxdJJN86nQ1aIp
 xDocODOvblVXflheMFgKdjh/Y1FBN7falUweXY1Q/EcG82FohZPh7x47jBkP1tOOc0ZYzLva
 0K7kVoPtMYPbSTxNPUtPt/Z5yEWIU/ITI2NaxwpRoAWPsgZmPGvp0mCmnJ8L0iyyRNxwMnTy
 L+QcNq2DGZyNJmLOAGeHr9HuZdyn3BW+I8mbcyjp/hR+ebENSH9pHZsGAfmU93VG4ve8ViEq
 44Ca5rao/idOcWnChTqHUcoBQhiBRAG6Vre8KS7qsbrztJaJVwc
IronPort-HdrOrdr: A9a23:XXd1qqoY9/73zW/6R1Wxb+gaV5oneYIsimQD101hICG8cqSj+f
 xG+85rsSMc6QxhPk3I9urhBEDtex/hHP1OkOws1NWZLWrbUQKTRekIh+bfKlXbakrDH4VmtJ
 uIHZIQNDSJNykZsfrH
X-Talos-CUID: =?us-ascii?q?9a23=3A5i10mWmgHQehAcGSk2hIWMj2++fXOVTlwXHIeBe?=
 =?us-ascii?q?DNUdSGIO6CnaR1IZ/tvM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AZnZwgQ1Blvc+NF+cnxSUFpyQHzUj2K/1KHEiq4g?=
 =?us-ascii?q?8+MzcawFXAzfEp2SZXdpy?=
X-IronPort-AV: E=Sophos;i="5.99,198,1677560400"; 
   d="scan'208";a="105999310"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH] xen/livepatch: Fix .altinstructions safety checks
Date: Sat, 15 Apr 2023 03:22:29 +0100
Message-ID: <20230415022229.3475033-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The prior check has && vs || mixups, making it tautologically false and thus
providing no safety at all.  There are boundary errors too.

First start with a comment describing how the .altinstructions and
.altinstr_replacement sections interact, and perform suitable cross-checking.

Second, rewrite the alt_instr loop entirely from scratch.  Origin sites have
non-zero size, and must be fully contained within .text.  Any non-zero sized
replacements must be fully contained within .altinstr_replacement.

Fixes: f8a10174e8b1 ("xsplice: Add support for alternatives")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>

As a further observation, .altinstr_replacement shouldn't survive beyond its
use in apply_alternatives(), but the disp32 relative references (for x86 at
least) in alt_instr force .altinstr_replacement to be close to the payload
while being applied.
---
 xen/common/livepatch.c | 66 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 60 insertions(+), 6 deletions(-)

diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 784fbd92e913..020a9648d5ba 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -803,28 +803,82 @@ static int prepare_payload(struct payload *payload,
     if ( sec )
     {
 #ifdef CONFIG_HAS_ALTERNATIVE
+        /*
+         * (As of April 2023), Alternatives are formed of:
+         * - An .altinstructions section with an array of struct alt_instr's.
+         * - An .altinstr_replacement section containing instructions bytes.
+         *
+         * An individual alt_instr contains:
+         * - An orig reference, pointing into .text with a nonzero length
+         * - A repl reference, pointing into .altinstr_replacement
+         *
+         * It is legal to have zero-length replacements, meaning it is legal
+         * for the .altinstr_replacement section to be empty too.  An
+         * implementation detail means that a zero-length replacement's repl
+         * reference will be the start of the .altinstr_replacement section.
+         */
+        const struct livepatch_elf_sec *repl_sec;
         struct alt_instr *a, *start, *end;
 
         if ( !section_ok(elf, sec, sizeof(*a)) )
             return -EINVAL;
 
+        /* Tolerate an empty .altinstructions section... */
+        if ( sec->sec->sh_size == 0 )
+            goto alt_done;
+
+        /* ... but otherwise, there needs to be something to alter... */
+        if ( payload->text_size == 0 )
+        {
+            printk(XENLOG_ERR LIVEPATCH "%s Alternatives provided, but no .text\n",
+                   elf->name);
+            return -EINVAL;
+        }
+
+        /* ... and something to be altered to. */
+        repl_sec = livepatch_elf_sec_by_name(elf, ".altinstr_replacement");
+        if ( !repl_sec )
+        {
+            printk(XENLOG_ERR LIVEPATCH "%s .altinstructions provided, but no .altinstr_replacement\n",
+                   elf->name);
+            return -EINVAL;
+        }
+
         start = sec->load_addr;
         end = sec->load_addr + sec->sec->sh_size;
 
         for ( a = start; a < end; a++ )
         {
-            const void *instr = ALT_ORIG_PTR(a);
-            const void *replacement = ALT_REPL_PTR(a);
+            const void *orig = ALT_ORIG_PTR(a);
+            const void *repl = ALT_REPL_PTR(a);
+
+            /* orig must be fully within .text. */
+            if ( orig               < payload->text_addr ||
+                 a->orig_len        > payload->text_size ||
+                 orig + a->orig_len > payload->text_addr + payload->text_size )
+            {
+                printk(XENLOG_ERR LIVEPATCH
+                       "%s Alternative orig %p+%#x outside payload text %p+%#lx\n",
+                       elf->name, orig, a->orig_len, payload->text_addr, payload->text_size);
+                return -EINVAL;
+            }
 
-            if ( (instr < region->start && instr >= region->end) ||
-                 (replacement < region->start && replacement >= region->end) )
+            /*
+             * repl must be fully within .altinstr_replacement, even if they
+             * happen to both have zero length.
+             */
+            if ( repl               < repl_sec->load_addr ||
+                 a->repl_len        > repl_sec->sec->sh_size ||
+                 repl + a->repl_len > repl_sec->load_addr + repl_sec->sec->sh_size )
             {
-                printk(XENLOG_ERR LIVEPATCH "%s Alt patching outside payload: %p\n",
-                       elf->name, instr);
+                printk(XENLOG_ERR LIVEPATCH
+                       "%s Alternative repl %p+%#x outside .altinstr_replacement %p+%#lx\n",
+                       elf->name, repl, a->repl_len, repl_sec->load_addr, repl_sec->sec->sh_size);
                 return -EINVAL;
             }
         }
         apply_alternatives(start, end);
+    alt_done:;
 #else
         printk(XENLOG_ERR LIVEPATCH "%s: We don't support alternative patching\n",
                elf->name);
-- 
2.30.2


