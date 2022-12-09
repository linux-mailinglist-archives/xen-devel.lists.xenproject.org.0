Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3975648A31
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 22:44:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458248.716146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3l96-00045x-Iu; Fri, 09 Dec 2022 21:43:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458248.716146; Fri, 09 Dec 2022 21:43:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3l96-00044C-G1; Fri, 09 Dec 2022 21:43:04 +0000
Received: by outflank-mailman (input) for mailman id 458248;
 Fri, 09 Dec 2022 21:43:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/vX0=4H=citrix.com=prvs=3351f26b0=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p3l94-000445-NU
 for xen-devel@lists.xenproject.org; Fri, 09 Dec 2022 21:43:03 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71c83d76-780a-11ed-8fd2-01056ac49cbb;
 Fri, 09 Dec 2022 22:42:59 +0100 (CET)
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
X-Inumbo-ID: 71c83d76-780a-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670622179;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FR/SFLoYdR2QkEkTF92LvNk+qsaDxfKWW3VWAuwwPEw=;
  b=X80owFAInGbR2gVSJDF8s2+4G4xfHEX37/VRebccYml17E1kE6NAcjPs
   auN7flt1AFERspa7BRPuoNbQgd0v5zR8njJW++WyC5o2HGxo5/clKcvG+
   0QeYiVBeTdfxZMH2skoXydY+npjlFGeStaCIcMHiC3MBPb4PgNJYeSD2k
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 87162377
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:CTNigqjj0yZrnzpMc1LY8hcGX161dRAKZh0ujC45NGQN5FlHY01je
 htvXG/QM/2Cazf8cttxYY/goxxU7cDQz9BlTVNq+So9FCkb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6oS5gePzyJ94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQGKjoLfBOO2tjr2b6mErFr39kjdo70adZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJagx/5JEWxY9EglHWdTFCpU3Tjq0w+2XJlyR60aT3McqTcduPLSlQthbH/
 zycpDumav0cHP2h2xzV41P0vd/ognn8XJM4H5C39PE/1TV/wURMUUZLBDNXu8KRlUqWS99Zb
 UsO9UIGj4I/6UiqRdnVRACjrTiPuRt0c8pdFag25R+AzoLQ4h2FHS4UQzhZctskucQqAzsw2
 Te0c8jBXGI19ufPEDTEq+nS/Wja1TUpwXEqey0OSxkG7oTZ/Zg/k0qXSY9+EPTykYigcd3v+
 AyioC87jrQVqMcE0aSn4FzK6w6RSoj1oh0dvVuOAD/8hu9tTMv8PtHztwCHhRpVBNzBJmRtq
 kTojCR3AAomKZiW3BKAT+wWdF1Cz6bUaWaM6bKD8nRIythMx5JBVdoIiN2dDB0zWirhRdMOS
 BG7hO+pzMUPVEZGlIcuC25LN+wkzLL7CfPuXe3OY9xFb/BZLVHYpH83PR7JhT+3zCDAdJ3T3
 r/CIa6R4YsyU/w7nFJauc9CuVPU+szO7TyKHs2qp/hW+bGfeGSUWd843KimN4gEAFe/iFyNq
 b53bpLaoyizpcWiOkE7B6ZPdwFVRZX6bLiqw/FqmhmreVQ2QDF+UK6ImdvMueVNxsxoqwsBx
 VnlMmcw9bY1rSevxdmiApy7VI7SYA==
IronPort-HdrOrdr: A9a23:xTJRVqo9KGRopjwIEevml5IaV5oteYIsimQD101hICG8cqSj+P
 xG+85rsyMc6QxhP03I9urgBEDtex7hHNtOkOss1NSZLW3bUQmTTL2KhLGKq1aLJ8S9zJ856U
 4JSdkGNDSaNzZHZKjBjDVQa+xQo+W6zA==
X-IronPort-AV: E=Sophos;i="5.96,232,1665460800"; 
   d="scan'208";a="87162377"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2-ish] x86/boot: Relocate Xen using memcpy() directly
Date: Fri, 9 Dec 2022 21:42:44 +0000
Message-ID: <20221209214244.17965-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211207105339.28440-1-andrew.cooper3@citrix.com>
References: <20211207105339.28440-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

We can relocate Xen by reading out of the virtual mapping that we're executing
on, and write directly into the directmap.  In fact, this removes one
dependency on Xen being "at 0" (the XEN_IMG_OFFSET passed as src) for
relocation to occur.

This removes all the temporary pagetable handling under the covers of
move_memory(), and results in a forward copy rather than a chunked backwards
copy (caused by move_memory() always constructing src and dst in a way to
trigger memmove() to copy backwards).

With the penultimate caller of move_memory() dropped, clean up the API.  Drop
the keep boolean, folding in 0 from the final caller, and drop the return
address which has been unused since c/s 0b76ce20de85 ("x86/setup: don't
relocate the VGA hole.") in 2007.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2-ish:
 * Split out previous series.  This was the "easy to shuffle" work that still
   gets a win.  Everything else I'm going to rework differently, so will have
   to be deferred for now.
---
 xen/arch/x86/setup.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 6bb5bc7c84be..4102aae76dde 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -425,8 +425,8 @@ void *__init bootstrap_map(const module_t *mod)
     return ret;
 }
 
-static void *__init move_memory(
-    uint64_t dst, uint64_t src, unsigned int size, bool keep)
+static void __init move_memory(
+    uint64_t dst, uint64_t src, unsigned int size)
 {
     unsigned int blksz = BOOTSTRAP_MAP_LIMIT - BOOTSTRAP_MAP_BASE;
     unsigned int mask = (1L << L2_PAGETABLE_SHIFT) - 1;
@@ -463,13 +463,8 @@ static void *__init move_memory(
         src += sz;
         size -= sz;
 
-        if ( keep )
-            return size ? NULL : d + doffs;
-
         bootstrap_map(NULL);
     }
-
-    return NULL;
 }
 
 #undef BOOTSTRAP_MAP_LIMIT
@@ -1277,7 +1272,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
              * data until after we have switched to the relocated pagetables!
              */
             barrier();
-            move_memory(e, XEN_IMG_OFFSET, _end - _start, 1);
+            memcpy(__va(__pa(_start)), _start, _end - _start);
 
             /* Walk idle_pg_table, relocating non-leaf entries. */
             pl4e = __va(__pa(idle_pg_table));
@@ -1334,8 +1329,6 @@ void __init noreturn __start_xen(unsigned long mbi_p)
                    "1" (__va(__pa(cpu0_stack))), "2" (STACK_SIZE / 8)
                 : "memory" );
 
-            bootstrap_map(NULL);
-
             printk("New Xen image base address: %#lx\n", xen_phys_start);
         }
 
@@ -1361,7 +1354,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
             {
                 move_memory(end - size + headroom,
                             (uint64_t)mod[j].mod_start << PAGE_SHIFT,
-                            mod[j].mod_end, 0);
+                            mod[j].mod_end);
                 mod[j].mod_start = (end - size) >> PAGE_SHIFT;
                 mod[j].mod_end += headroom;
                 mod[j].reserved = 1;
-- 
2.11.0


