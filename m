Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B49EC64BF69
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 23:35:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461317.719449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5DrX-00027N-Tb; Tue, 13 Dec 2022 22:34:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461317.719449; Tue, 13 Dec 2022 22:34:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5DrX-00025i-P0; Tue, 13 Dec 2022 22:34:59 +0000
Received: by outflank-mailman (input) for mailman id 461317;
 Tue, 13 Dec 2022 22:34:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mJcE=4L=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p5DlO-000519-5m
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 22:28:38 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a2ad0b1-7b35-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 23:28:34 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id EEA683200923;
 Tue, 13 Dec 2022 17:28:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 13 Dec 2022 17:28:32 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Dec 2022 17:28:30 -0500 (EST)
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
X-Inumbo-ID: 7a2ad0b1-7b35-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1670970511; x=1671056911; bh=BC3rEI9VJdr8/NKr5K4rhG8NtAbe23W3rKw
	dQB/q0PI=; b=boiZQ6S06M8d1hzB+lj7vkstYJDNme6RqwXitfhnFltFa3axR3q
	oTcXbU2NVK6jPxZAfJtgsXiDRmwZRJqR6OZX0UG/CGAhmqs7rH4tbOcJmM9Yqi6W
	g/wNghmTOKUJe9sXHT3VkAjuPA5IriKl581UgnB+6yrM30RSr7y+/7nLeRi/uquV
	XWkDDSxND9MnQ1/gngmdWeUVbJBHcLLs4Nfvs054IzMAk3Tc+ZT/eOuUUFyJ2ZDz
	xAD3leDvL2aa4j3FZY2TxmRbtsB2wsClUYIZrdMc4evJRhLknrflD1hmRDrUUL4z
	C+nnJcxnFLRbRFH3KFCXX4Y/hhOmWRd9B3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1670970511; x=1671056911; bh=BC3rEI9VJdr8/
	NKr5K4rhG8NtAbe23W3rKwdQB/q0PI=; b=pUEP3YGyBQr1eAFHdIlD1ufCfl0oj
	2aZybNVhIBzdP4gSl9GvB8W7wv9iE3PUJ4Ow2FUezN8C68G/RcSBXhvE/l7xNa4F
	SbR+SdCNHW+AxxefTCSGuw43v9/M3WhSRyk2ZsyYxruBUd7+eF+FHL5HL8t29ZXi
	rp5z7eEvWEj9gCubT3aJk+NvX2lYwKwVmWYp/a+dqijVptU1VPkc6lKsy0YtKBSn
	DWOXW2BhTO5D/aszbW/TIsU3kVIyGSvyDZRMO/P5Lza0V89o8PCqVXlI5sieyOrR
	hvBA+YQQERbkbHgP5vZCGi2509ETdrshwyx6Q2mCBDdn0mK6KYOJX5KSg==
X-ME-Sender: <xms:j_yYYzmOdD9Yrh8qduao0fgbuBMULvJtLhhLJaMnNwJoSeyw8Sla0Q>
    <xme:j_yYY23g6Y5LwqTuxqOYbsRN1qR4XGTTl8TNE0I7Bi3DPkmTfConrmMT_99nQtU8U
    uGc3j3Ci0S9wwE>
X-ME-Received: <xmr:j_yYY5rUElux8Y1wPNrobT1gz7RQ0PCYvi34MHDzg1ZarSk1qxOwblky9D2ueWdJ8JnmDt2GKI-m>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedugdekjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedvnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:j_yYY7lN4oAuOGTqJHIuokqrlQnahYAETKEDq80nYfGnti431gUjPw>
    <xmx:j_yYYx0S_4K69WQlhDqClilNi-OlHC9tjAr7lUSNLFrrxLJWOkKx4Q>
    <xmx:j_yYY6tgg0qem_DSrW28nXrFUDfj2-R-PuLv0UAHss10FW79oQ4UTw>
    <xmx:j_yYY6IX6JKcj2Jh5hV75SSJZ7PYQkMt51awP1Y4vbEzOKYSTYdt0w>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Tim Deegan <tim@xen.org>
Subject: [PATCH v2 10/14] x86: Remove remaining uses of MTRR_* constants
Date: Tue, 13 Dec 2022 17:26:51 -0500
Message-Id: <6b68a168ec09b1044f39082646255d104751b598.1670948141.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <71482430c20a701b1d577e87dc72e7c2661e69de.1670948141.git.demi@invisiblethingslab.com>
References: <71482430c20a701b1d577e87dc72e7c2661e69de.1670948141.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change intended.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 xen/arch/x86/cpu/mtrr/generic.c |  2 +-
 xen/arch/x86/cpu/mtrr/main.c    |  7 +++++--
 xen/arch/x86/hvm/mtrr.c         | 22 +++++++++++-----------
 xen/arch/x86/include/asm/mtrr.h |  4 ----
 xen/arch/x86/mm/p2m-ept.c       | 18 +++++++++---------
 xen/arch/x86/mm/shadow/multi.c  |  2 +-
 6 files changed, 27 insertions(+), 28 deletions(-)

diff --git a/xen/arch/x86/cpu/mtrr/generic.c b/xen/arch/x86/cpu/mtrr/generic.c
index 660ae26c2350b3436a471155fc0426699ba8ac1d..85744fd881f888c9a1b92d2d99f24d8cad1395bd 100644
--- a/xen/arch/x86/cpu/mtrr/generic.c
+++ b/xen/arch/x86/cpu/mtrr/generic.c
@@ -125,7 +125,7 @@ boolean_param("mtrr.show", mtrr_show);
 
 static const char *__init mtrr_attrib_to_str(mtrr_type x)
 {
-	static const char __initconst strings[MTRR_NUM_TYPES][16] =
+	static const char __initconst strings[X86_NUM_MT - 1][16] =
 	{
 		[X86_MT_UC] = "uncachable",
 		[X86_MT_WC] = "write-combining",
diff --git a/xen/arch/x86/cpu/mtrr/main.c b/xen/arch/x86/cpu/mtrr/main.c
index 2946003b84938f3b83c98b62dfaa3ace90822983..61e514e557106b09b317766e104feaa0fd838106 100644
--- a/xen/arch/x86/cpu/mtrr/main.c
+++ b/xen/arch/x86/cpu/mtrr/main.c
@@ -62,7 +62,7 @@ const struct mtrr_ops *__read_mostly mtrr_if = NULL;
 static void set_mtrr(unsigned int reg, unsigned long base,
 		     unsigned long size, mtrr_type type);
 
-static const char *const mtrr_strings[MTRR_NUM_TYPES] =
+static const char *const mtrr_strings[X86_NUM_MT] =
 {
     "uncachable",               /* 0 */
     "write-combining",          /* 1 */
@@ -71,6 +71,7 @@ static const char *const mtrr_strings[MTRR_NUM_TYPES] =
     "write-through",            /* 4 */
     "write-protect",            /* 5 */
     "write-back",               /* 6 */
+    "?",                        /* 7 */
 };
 
 static const char *mtrr_attrib_to_str(int x)
@@ -322,7 +323,9 @@ int mtrr_add_page(unsigned long base, unsigned long size,
 	if ((error = mtrr_if->validate_add_page(base,size,type)))
 		return error;
 
-	if (type >= MTRR_NUM_TYPES) {
+	if (type == X86_MT_RESERVED_1 ||
+	    type == X86_MT_RESERVED_2 ||
+	    type >= X86_MT_UCM) {
 		printk(KERN_WARNING "mtrr: type: %u invalid\n", type);
 		return -EINVAL;
 	}
diff --git a/xen/arch/x86/hvm/mtrr.c b/xen/arch/x86/hvm/mtrr.c
index 31756e4e8b0a5c73400f5f12f2c88197eb68c474..81f33947bc7513d6b403eef6c485160ec8a6ba92 100644
--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -37,8 +37,8 @@ static const uint8_t pat_entry_2_pte_flags[8] = {
     _PAGE_PAT | _PAGE_PCD, _PAGE_PAT | _PAGE_PCD | _PAGE_PWT };
 
 /* Effective mm type lookup table, according to MTRR and PAT. */
-static const uint8_t mm_type_tbl[MTRR_NUM_TYPES][X86_NUM_MT] = {
-#define RS MEMORY_NUM_TYPES
+static const uint8_t mm_type_tbl[X86_NUM_MT - 1][X86_NUM_MT] = {
+#define RS X86_MT_UCM
 #define UC X86_MT_UC
 #define WB X86_MT_WB
 #define WC X86_MT_WC
@@ -66,9 +66,9 @@ static const uint8_t mm_type_tbl[MTRR_NUM_TYPES][X86_NUM_MT] = {
  * Reverse lookup table, to find a pat type according to MTRR and effective
  * memory type. This table is dynamically generated.
  */
-static uint8_t __read_mostly mtrr_epat_tbl[MTRR_NUM_TYPES][MEMORY_NUM_TYPES] =
-    { [0 ... MTRR_NUM_TYPES-1] =
-        { [0 ... MEMORY_NUM_TYPES-1] = INVALID_MEM_TYPE }
+static uint8_t __read_mostly mtrr_epat_tbl[X86_NUM_MT - 1][X86_NUM_MT] =
+    { [0 ... X86_NUM_MT - 2] =
+        { [0 ... X86_NUM_MT - 2] = INVALID_MEM_TYPE }
     };
 
 /* Lookup table for PAT entry of a given PAT value in host PAT. */
@@ -79,13 +79,13 @@ static int __init cf_check hvm_mtrr_pat_init(void)
 {
     unsigned int i, j;
 
-    for ( i = 0; i < MTRR_NUM_TYPES; i++ )
+    for ( i = 0; i < X86_NUM_MT - 1; i++ )
     {
         for ( j = 0; j < X86_NUM_MT; j++ )
         {
             unsigned int tmp = mm_type_tbl[i][j];
 
-            if ( tmp < MEMORY_NUM_TYPES )
+            if ( tmp < X86_NUM_MT - 1 )
                 mtrr_epat_tbl[i][tmp] = j;
         }
     }
@@ -317,11 +317,11 @@ static uint8_t effective_mm_type(struct mtrr_state *m,
                                  uint8_t gmtrr_mtype)
 {
     uint8_t mtrr_mtype, pat_value;
-   
+
     /* if get_pat_flags() gives a dedicated MTRR type,
      * just use it
-     */ 
-    if ( gmtrr_mtype == NO_HARDCODE_MEM_TYPE )
+     */
+    if ( gmtrr_mtype == X86_MT_UCM )
         mtrr_mtype = mtrr_get_type(m, gpa, 0);
     else
         mtrr_mtype = gmtrr_mtype;
@@ -346,7 +346,7 @@ uint32_t get_pat_flags(struct vcpu *v,
     /* 1. Get the effective memory type of guest physical address,
      * with the pair of guest MTRR and PAT
      */
-    guest_eff_mm_type = effective_mm_type(g, pat, gpaddr, 
+    guest_eff_mm_type = effective_mm_type(g, pat, gpaddr,
                                           gl1e_flags, gmtrr_mtype);
     /* 2. Get the memory type of host physical address, with MTRR */
     shadow_mtrr_type = mtrr_get_type(&mtrr_state, spaddr, 0);
diff --git a/xen/arch/x86/include/asm/mtrr.h b/xen/arch/x86/include/asm/mtrr.h
index 23f908063fb987ee8a5b2dd3d772106d3a55e644..b82d4587a3c4a1aac12f961b63c9e5b56a1be72a 100644
--- a/xen/arch/x86/include/asm/mtrr.h
+++ b/xen/arch/x86/include/asm/mtrr.h
@@ -3,10 +3,6 @@
 
 #include <xen/mm.h>
 
-#define MTRR_NUM_TYPES       7
-#define MEMORY_NUM_TYPES     MTRR_NUM_TYPES
-#define NO_HARDCODE_MEM_TYPE    MTRR_NUM_TYPES
-
 #define NORMAL_CACHE_MODE          0
 #define NO_FILL_CACHE_MODE         2
 
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index aa7a3287c46ace715106385151e1834b3cd64508..9f048a5680eb87518c1ac6b6bf25178d82ebc018 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -394,10 +394,10 @@ static bool ept_invalidate_emt_subtree(struct p2m_domain *p2m, mfn_t mfn,
         ept_entry_t e = atomic_read_ept_entry(&epte[i]);
 
         if ( !is_epte_valid(&e) || !is_epte_present(&e) ||
-             (e.emt == MTRR_NUM_TYPES && (e.recalc || !recalc)) )
+             (e.emt == X86_MT_UCM && (e.recalc || !recalc)) )
             continue;
 
-        e.emt = MTRR_NUM_TYPES;
+        e.emt = X86_MT_UCM;
         if ( recalc )
             e.recalc = 1;
         rc = atomic_write_ept_entry(p2m, &epte[i], e, level - 1);
@@ -470,9 +470,9 @@ static int ept_invalidate_emt_range(struct p2m_domain *p2m,
         ept_entry_t e = atomic_read_ept_entry(&table[index]);
 
         if ( is_epte_valid(&e) && is_epte_present(&e) &&
-             (e.emt != MTRR_NUM_TYPES || !e.recalc) )
+             (e.emt != X86_MT_UCM || !e.recalc) )
         {
-            e.emt = MTRR_NUM_TYPES;
+            e.emt = X86_MT_UCM;
             e.recalc = 1;
             wrc = atomic_write_ept_entry(p2m, &table[index], e, target);
             ASSERT(wrc == 0);
@@ -655,7 +655,7 @@ static int cf_check resolve_misconfig(struct p2m_domain *p2m, unsigned long gfn)
         {
             bool ipat;
 
-            if ( e.emt != MTRR_NUM_TYPES )
+            if ( e.emt != X86_MT_UCM )
                 break;
 
             if ( level == 0 )
@@ -665,7 +665,7 @@ static int cf_check resolve_misconfig(struct p2m_domain *p2m, unsigned long gfn)
                     p2m_type_t nt;
 
                     e = atomic_read_ept_entry(&epte[i]);
-                    if ( e.emt == MTRR_NUM_TYPES )
+                    if ( e.emt == X86_MT_UCM )
                         e.emt = 0;
                     if ( !is_epte_valid(&e) || !is_epte_present(&e) )
                         continue;
@@ -741,7 +741,7 @@ static int cf_check resolve_misconfig(struct p2m_domain *p2m, unsigned long gfn)
             break;
         }
 
-        if ( e.emt == MTRR_NUM_TYPES )
+        if ( e.emt == X86_MT_UCM )
         {
             ASSERT(is_epte_present(&e));
             ept_invalidate_emt_subtree(p2m, _mfn(e.mfn), e.recalc, level);
@@ -931,7 +931,7 @@ ept_set_entry(struct p2m_domain *p2m, gfn_t gfn_, mfn_t mfn,
         if ( emt >= 0 )
             new_entry.emt = emt;
         else /* ept_handle_misconfig() will need to take care of this. */
-            new_entry.emt = MTRR_NUM_TYPES;
+            new_entry.emt = X86_NUM_MT - 1;
 
         new_entry.ipat = ipat;
         new_entry.sp = !!i;
@@ -1471,7 +1471,7 @@ static void cf_check ept_dump_p2m_table(unsigned char key)
             for ( i = ept->wl; i > 0; i-- )
             {
                 ept_entry = table + (gfn_remainder >> (i * EPT_TABLE_ORDER));
-                if ( ept_entry->emt == MTRR_NUM_TYPES )
+                if ( ept_entry->emt == X86_MT_UCM )
                     c = '?';
                 ret = ept_next_level(p2m, 1, &table, &gfn_remainder, i);
                 if ( ret != GUEST_TABLE_NORMAL_PAGE )
diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index f5f7ff021bd9e057c5b6f6329de7acb5ef05d58f..964f21829841777156aa9bfc24490ea4e052c344 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -578,7 +578,7 @@ _sh_propagate(struct vcpu *v,
                             gflags,
                             gfn_to_paddr(target_gfn),
                             mfn_to_maddr(target_mfn),
-                            NO_HARDCODE_MEM_TYPE);
+                            X86_MT_UCM);
             }
     }
 
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

