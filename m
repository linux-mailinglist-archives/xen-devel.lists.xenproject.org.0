Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C42FC6E4756
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 14:14:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522033.811177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poNkb-0001KL-6o; Mon, 17 Apr 2023 12:14:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522033.811177; Mon, 17 Apr 2023 12:14:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poNkb-0001HE-49; Mon, 17 Apr 2023 12:14:29 +0000
Received: by outflank-mailman (input) for mailman id 522033;
 Mon, 17 Apr 2023 12:14:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=696H=AI=citrix.com=prvs=464f2b76b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1poNkY-0000xC-Vw
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 12:14:26 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6479c75b-dd19-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 14:14:25 +0200 (CEST)
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
X-Inumbo-ID: 6479c75b-dd19-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681733664;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ew+rB9d1GFmavjWRsz8+3kGUcmwxQ2u2fM4aYYZINb4=;
  b=e/ow2rp1E2xrM7btd1qpiSEkma/y2KWlQ64rBQJRF4SoeAY681cceWwZ
   z6QNGkuXfcjuNYamDiME3LQpYSydCmhNuNCzga+XqZxzn5CD8bnFNM260
   8vmSsADNpDn6E+R9adlyUZz56L6SDgl6wymQqZp1wYpNzm055MrCFMpvJ
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 105144452
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:nPoUKaJ8dejJkM8MFE+RoJUlxSXFcZb7ZxGr2PjKsXjdYENSgTFWm
 GpOWGnSOvyLM2f8LYx1bY7l/RhU7ZWDz9dqQQVlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPSwP9TlK6q4mhA4gVhPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5FRkFL/
 9E5dglONDvb3e+H8oPrds5F05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TTHZgMwhrE+
 ziuE2LRITIcMfiT4xW80XOW3M3UunuiW8UiPejtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslh0bXcBZH6sl6QWO4q3O6g2dCy4PSTspVTA9nJZoH3pwj
 AbPxo63Q2U169V5VE5x6J+m6hO3MwU0c1ZBPwRcFwY00eiznKYa20enoslYLEKlsjHkMWiuk
 2nW93lj1ul7Yd0jjPviow2e6964jt2QF1NuuF2KNo6wxlkhDLNJcbBE/rQyARxoCI+CBmeMs
 3Ef8yR1xLBfVMrd/MBhrQhkIV1I2xpmGGeG6bKXN8N9nwlBAlb6FWyq3BlwJV1yLuEPciLzb
 UnYtGt5vcEDZSX1NfcqPt3pV6zGKJQM8vy8D5jpgidmOMAtJGdrAgk1DaJv44wduBd1yvxuU
 XtqWc2tEWwbGcxa8dZCfM9EieVD7nlnlQvuqWXTk0zPPUy2OCTEFt/o8TKmMogE0U9ziF+Nq
 4wAbJPalUw3vS+XSnC/zLP/5GsidRATba0aYeQOJoZv/iIO9LkdNsLs
IronPort-HdrOrdr: A9a23:iUwiKaEgP1UZ1KT/pLqELMeALOsnbusQ8zAXPiBKJCC9E/bo8v
 xG+c5w6faaslkssR0b9+xoW5PwI080l6QU3WB5B97LMDUO0FHCEGgI1/qA/9SPIUzDHu4279
 YbT0B9YueAcGSTW6zBkXWF+9VL+qj5zEix792uq0uE1WtRGtldBwESMHf9LmRGADNoKLAeD5
 Sm6s9Ot1ObCA8qhpTSPAhiYwDbzee77a7bXQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AOe38jWhWonu2y6/LPwG1wDm0pzJuQDr9yX39AhG?=
 =?us-ascii?q?BSjxCEOeYeG2hqJ9Dup87?=
X-Talos-MUID: 9a23:qp6IBwkdYm03/lQX3dkJdnpBF8Ftx6iEJ3kukK9cmdKjbXVzfAe02WE=
X-IronPort-AV: E=Sophos;i="5.99,204,1677560400"; 
   d="scan'208";a="105144452"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v2 3/3] xen/livepatch: Fix .altinstructions safety checks
Date: Mon, 17 Apr 2023 13:13:57 +0100
Message-ID: <20230417121357.3738919-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230417121357.3738919-1-andrew.cooper3@citrix.com>
References: <20230417121357.3738919-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The prior check has && vs || mixups, making it tautologically false and thus
providing no safety at all.  There are boundary errors too.

First start with a comment describing how the .altinstructions and
.altinstr_replacement sections interact, and perform suitable cross-checking.

Second, rewrite the alt_instr loop entirely from scratch.  Origin sites have
non-zero size, and must be fully contained within the livepatches .text
section(s).  Any non-zero sized replacements must be fully contained within
the .altinstr_replacement section.

Fixes: f8a10174e8b1 ("xsplice: Add support for alternatives")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>

v2:
 * Rebase over prior patches to keep the ARM build working
 * Tweak commit message and comments for clarity

As a further observation, .altinstr_replacement shouldn't survive beyond its
use in apply_alternatives(), but the disp32 relative references (for x86 at
least) in alt_instr force .altinstr_replacement to be close to the payload
while being applied.
---
 xen/common/livepatch.c       | 68 ++++++++++++++++++++++++++++++++----
 xen/include/xen/elfstructs.h |  2 ++
 2 files changed, 64 insertions(+), 6 deletions(-)

diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index c10ab1f374e0..004b5a436569 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -803,28 +803,84 @@ static int prepare_payload(struct payload *payload,
     if ( sec )
     {
 #ifdef CONFIG_HAS_ALTERNATIVE
+        /*
+         * (As of April 2023), Alternatives are formed of:
+         * - An .altinstructions section with an array of struct alt_instr's.
+         * - An .altinstr_replacement section containing instructions.
+         *
+         * An individual alt_instr contains:
+         * - An orig reference, pointing into .text with a nonzero length
+         * - A repl reference, pointing into .altinstr_replacement
+         *
+         * It is legal to have zero-length replacements, meaning it is legal
+         * for the .altinstr_replacement section to be empty too.  An
+         * implementation detail means that a zero-length replacement's repl
+         * reference will still be in the .altinstr_replacement section.
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
+                       "%s Alternative orig %p+%#x outside payload text %p+%#zx\n",
+                       elf->name, orig, a->orig_len,
+                       payload->text_addr, payload->text_size);
+                return -EINVAL;
+            }
 
-            if ( (instr < region->start && instr >= region->end) ||
-                 (replacement < region->start && replacement >= region->end) )
+            /*
+             * repl must be fully within .altinstr_replacement, even if the
+             * replacement and the section happen to both have zero length.
+             */
+            if ( repl               < repl_sec->load_addr ||
+                 a->repl_len        > repl_sec->sec->sh_size ||
+                 repl + a->repl_len > repl_sec->load_addr + repl_sec->sec->sh_size )
             {
-                printk(XENLOG_ERR LIVEPATCH "%s Alt patching outside payload: %p\n",
-                       elf->name, instr);
+                printk(XENLOG_ERR LIVEPATCH
+                       "%s Alternative repl %p+%#x outside .altinstr_replacement %p+%#"PRIxElfWord"\n",
+                       elf->name, repl, a->repl_len,
+                       repl_sec->load_addr, repl_sec->sec->sh_size);
                 return -EINVAL;
             }
         }
         apply_alternatives(start, end);
+    alt_done:;
 #else
         printk(XENLOG_ERR LIVEPATCH "%s: We don't support alternative patching\n",
                elf->name);
diff --git a/xen/include/xen/elfstructs.h b/xen/include/xen/elfstructs.h
index 3124469faeb4..eb6b87a823a8 100644
--- a/xen/include/xen/elfstructs.h
+++ b/xen/include/xen/elfstructs.h
@@ -563,6 +563,7 @@ typedef struct {
 #if defined(ELFSIZE) && (ELFSIZE == 32)
 #define PRIxElfAddr 	PRIx32
 #define PRIuElfWord 	PRIu32
+#define PRIxElfWord 	PRIx32
 
 #define Elf_Ehdr	Elf32_Ehdr
 #define Elf_Phdr	Elf32_Phdr
@@ -591,6 +592,7 @@ typedef struct {
 #elif defined(ELFSIZE) && (ELFSIZE == 64)
 #define PRIxElfAddr	PRIx64
 #define PRIuElfWord	PRIu64
+#define PRIxElfWord	PRIx64
 
 #define Elf_Ehdr	Elf64_Ehdr
 #define Elf_Phdr	Elf64_Phdr
-- 
2.30.2


