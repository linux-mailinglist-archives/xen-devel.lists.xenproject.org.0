Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA5E64D30F
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 00:13:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462670.720887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5avm-00026N-DG; Wed, 14 Dec 2022 23:12:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462670.720887; Wed, 14 Dec 2022 23:12:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5avm-00024T-6h; Wed, 14 Dec 2022 23:12:54 +0000
Received: by outflank-mailman (input) for mailman id 462670;
 Wed, 14 Dec 2022 23:12:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IksU=4M=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p5avk-0000n2-94
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 23:12:52 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d41be170-7c04-11ed-8fd2-01056ac49cbb;
 Thu, 15 Dec 2022 00:12:50 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id AEB2A320055E;
 Wed, 14 Dec 2022 18:12:48 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 14 Dec 2022 18:12:49 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Dec 2022 18:12:47 -0500 (EST)
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
X-Inumbo-ID: d41be170-7c04-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1671059568; x=1671145968; bh=xq/7AzYNw/o1jMOYl29ZQus5z/RisXCH6hV
	d+SD7smw=; b=h8bqhXljvt6VIaUJZBo16Ey1rLQ7BD8kFSvB0fRiqw+/DJwlht5
	WlY6Aj9WYxCvpINkA3JMOO/a+4Nb16D2RhfpQ13prjLVOHyGerYSbs4Oi47RzyFV
	aQMWHWKpCYE3DzioWcAFtZ2U93O3nbBVIE7nNXQ4FmWk0FpONLznOW8orvgG6UVT
	6xigBsTQaWNyLOXaBOF4dI1Zw2IQr6Q0oyL4K5o0FQqESSBSMqCH0eBpNGHGthSs
	Zv2L5i0W8QGTYYyVK3WruAfyJzDe8auznjGOgxcZU2B7/K/XBfbUOqOJ+WEAqlBS
	+6uvA6fPgbX3vWlixZ+mVLjEqU6fedDFuuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1671059568; x=1671145968; bh=xq/7AzYNw/o1j
	MOYl29ZQus5z/RisXCH6hVd+SD7smw=; b=PvQqaLFEt3SWgoIkvwwGe5uGb/Iwr
	iE9gWXsE20TzNVJjUXkv6VNqZWIEK8DGaZ1oimldvsAo4HLtT3CdAqfE2wvGm3U6
	5ZF0Yi9miEP51hIk+KN1gZUm3HU/8fBlkSiRYD02YCHJ1aOb9DVhyv7f7Bg3SpCI
	NJwjafh3OVxhHP/1tGO9puiVFe5oPbKDA+MfnWGdOpn3QcEDv8d8gnfAQBdcKAq7
	S07x/w2lQOX/d/50/eJTud4dENpL6tn30x/dlaDMNXW0BnzK3To6DhNKW1UEWy1Y
	Qb4aF7zQZnOSzHZA32qI+5eVhSKZTjzzS83ICadduC86KN7Cih0WVWRmg==
X-ME-Sender: <xms:cFiaYytl-rsNDw00T2Az-y5--iY9xRhYIp5VOoyoXkATgthyvd4tDQ>
    <xme:cFiaY3fRG9Z7h57sn9J33bRMKKpjgiMnRXqF7RzdOu38SwmPj_MP8KQERPQGpATYs
    pgQRyjptiyc7cc>
X-ME-Received: <xmr:cFiaY9xxHWtarFT3lr_wOiu8prZf9FiU95mvi7zdHMuYTH0D6B_-fna3jSRZXAhFtEtkZD5pIA9u>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeggddtgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeefkeelveethfeuffetvdeigeduteev
    geffhfekieettdfhuedtvdduteetgffftdenucffohhmrghinhephhhvmhdrihhsnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggvmhhisehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:cFiaY9OOiBPI6MDxan9hgoDAfbSGvdWqIfxtfN7Adn9I7F3ICI0Yzg>
    <xmx:cFiaYy8mPuIbqp4IMSlEGCeOQV2fgFxP6ZcaAW5ZunaNhNBXSJa2kQ>
    <xmx:cFiaY1UY_6CYgdrKu9II2gduFA8_noRuohROQZAittDOPQYz7Bqg9w>
    <xmx:cFiaY2SJvLw1q00tTNTlrSs4WU1CoIEq4G4HxfBk_knDZ8pvcTEWmQ>
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
Subject: [PATCH v3 05/12] x86: Replace PAT_* with X86_MT_*
Date: Wed, 14 Dec 2022 18:11:55 -0500
Message-Id: <06d9b2dc1e9f7e7de41414be676b5e9bcd24e5b9.1671057808.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671057808.git.demi@invisiblethingslab.com>
References: <cover.1671057808.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows eliminating the former.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v2: Style adjustments
---
 xen/arch/x86/hvm/hvm.c          | 12 ++++----
 xen/arch/x86/hvm/mtrr.c         | 52 ++++++++++++++++-----------------
 xen/arch/x86/hvm/vmx/vmx.c      | 16 +++++-----
 xen/arch/x86/include/asm/mtrr.h | 12 +-------
 xen/arch/x86/mm/p2m-ept.c       |  4 +--
 xen/arch/x86/mm/shadow/multi.c  |  4 +--
 6 files changed, 45 insertions(+), 55 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index ae4368ec4b338cf8c6cb14d383f612c91c98e800..00b3fa56e25e2934e2870e11fd19b120daff2715 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -307,12 +307,12 @@ int hvm_set_guest_pat(struct vcpu *v, uint64_t guest_pat)
     for ( i = 0, tmp = guest_pat; i < 8; i++, tmp >>= 8 )
         switch ( tmp & 0xff )
         {
-        case PAT_TYPE_UC_MINUS:
-        case PAT_TYPE_UNCACHABLE:
-        case PAT_TYPE_WRBACK:
-        case PAT_TYPE_WRCOMB:
-        case PAT_TYPE_WRPROT:
-        case PAT_TYPE_WRTHROUGH:
+        case X86_MT_UCM:
+        case X86_MT_UC:
+        case X86_MT_WB:
+        case X86_MT_WC:
+        case X86_MT_WP:
+        case X86_MT_WT:
             break;
         default:
             return 0;
diff --git a/xen/arch/x86/hvm/mtrr.c b/xen/arch/x86/hvm/mtrr.c
index 4d2aa6def86de45aeeaade7a1a7815c5ef2b3d7a..242623f3c239ee18a44f882ecb3910a00c615825 100644
--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -37,7 +37,7 @@ static const uint8_t pat_entry_2_pte_flags[8] = {
     _PAGE_PAT | _PAGE_PCD, _PAGE_PAT | _PAGE_PCD | _PAGE_PWT };
 
 /* Effective mm type lookup table, according to MTRR and PAT. */
-static const uint8_t mm_type_tbl[MTRR_NUM_TYPES][PAT_TYPE_NUMS] = {
+static const uint8_t mm_type_tbl[MTRR_NUM_TYPES][X86_NUM_MT] = {
 #define RS MEMORY_NUM_TYPES
 #define UC MTRR_TYPE_UNCACHABLE
 #define WB MTRR_TYPE_WRBACK
@@ -72,8 +72,8 @@ static uint8_t __read_mostly mtrr_epat_tbl[MTRR_NUM_TYPES][MEMORY_NUM_TYPES] =
     };
 
 /* Lookup table for PAT entry of a given PAT value in host PAT. */
-static uint8_t __read_mostly pat_entry_tbl[PAT_TYPE_NUMS] =
-    { [0 ... PAT_TYPE_NUMS-1] = INVALID_MEM_TYPE };
+static uint8_t __read_mostly pat_entry_tbl[X86_NUM_MT] =
+    { [0 ... X86_NUM_MT - 1] = INVALID_MEM_TYPE };
 
 static int __init cf_check hvm_mtrr_pat_init(void)
 {
@@ -81,7 +81,7 @@ static int __init cf_check hvm_mtrr_pat_init(void)
 
     for ( i = 0; i < MTRR_NUM_TYPES; i++ )
     {
-        for ( j = 0; j < PAT_TYPE_NUMS; j++ )
+        for ( j = 0; j < X86_NUM_MT; j++ )
         {
             unsigned int tmp = mm_type_tbl[i][j];
 
@@ -90,9 +90,9 @@ static int __init cf_check hvm_mtrr_pat_init(void)
         }
     }
 
-    for ( i = 0; i < PAT_TYPE_NUMS; i++ )
+    for ( i = 0; i < X86_NUM_MT; i++ )
     {
-        for ( j = 0; j < PAT_TYPE_NUMS; j++ )
+        for ( j = 0; j < X86_NUM_MT; j++ )
         {
             if ( pat_cr_2_paf(XEN_MSR_PAT, j) == i )
             {
@@ -115,7 +115,7 @@ uint8_t pat_type_2_pte_flags(uint8_t pat_type)
      * given pat_type. If host PAT covers all the PAT types, it can't happen.
      */
     if ( unlikely(pat_entry == INVALID_MEM_TYPE) )
-        pat_entry = pat_entry_tbl[PAT_TYPE_UNCACHABLE];
+        pat_entry = pat_entry_tbl[X86_MT_UC];
 
     return pat_entry_2_pte_flags[pat_entry];
 }
@@ -145,14 +145,14 @@ int hvm_vcpu_cacheattr_init(struct vcpu *v)
     m->mtrr_cap = (1u << 10) | (1u << 8) | num_var_ranges;
 
     v->arch.hvm.pat_cr =
-        ((uint64_t)PAT_TYPE_WRBACK) |               /* PAT0: WB */
-        ((uint64_t)PAT_TYPE_WRTHROUGH << 8) |       /* PAT1: WT */
-        ((uint64_t)PAT_TYPE_UC_MINUS << 16) |       /* PAT2: UC- */
-        ((uint64_t)PAT_TYPE_UNCACHABLE << 24) |     /* PAT3: UC */
-        ((uint64_t)PAT_TYPE_WRBACK << 32) |         /* PAT4: WB */
-        ((uint64_t)PAT_TYPE_WRTHROUGH << 40) |      /* PAT5: WT */
-        ((uint64_t)PAT_TYPE_UC_MINUS << 48) |       /* PAT6: UC- */
-        ((uint64_t)PAT_TYPE_UNCACHABLE << 56);      /* PAT7: UC */
+        ((uint64_t)X86_MT_WB) |           /* PAT0: WB */
+        ((uint64_t)X86_MT_WT << 8) |      /* PAT1: WT */
+        ((uint64_t)X86_MT_UCM << 16) |    /* PAT2: UC- */
+        ((uint64_t)X86_MT_UC << 24) |     /* PAT3: UC */
+        ((uint64_t)X86_MT_WB << 32) |     /* PAT4: WB */
+        ((uint64_t)X86_MT_WT << 40) |     /* PAT5: WT */
+        ((uint64_t)X86_MT_UCM << 48) |    /* PAT6: UC- */
+        ((uint64_t)X86_MT_UC << 56);      /* PAT7: UC */
 
     if ( is_hardware_domain(v->domain) )
     {
@@ -356,7 +356,7 @@ uint32_t get_pat_flags(struct vcpu *v,
      */
     pat_entry_value = mtrr_epat_tbl[shadow_mtrr_type][guest_eff_mm_type];
     /* If conflit occurs(e.g host MTRR is UC, guest memory type is
-     * WB),set UC as effective memory. Here, returning PAT_TYPE_UNCACHABLE will
+     * WB), set UC as effective memory. Here, returning X86_MT_UC will
      * always set effective memory as UC.
      */
     if ( pat_entry_value == INVALID_MEM_TYPE )
@@ -371,7 +371,7 @@ uint32_t get_pat_flags(struct vcpu *v,
                     "because the host mtrr type is:%d\n",
                     gl1e_flags, (uint64_t)gpaddr, guest_eff_mm_type,
                     shadow_mtrr_type);
-        pat_entry_value = PAT_TYPE_UNCACHABLE;
+        pat_entry_value = X86_MT_UC;
     }
     /* 4. Get the pte flags */
     return pat_type_2_pte_flags(pat_entry_value);
@@ -620,13 +620,13 @@ int hvm_set_mem_pinned_cacheattr(struct domain *d, uint64_t gfn_start,
                 p2m_memory_type_changed(d);
                 switch ( type )
                 {
-                case PAT_TYPE_UC_MINUS:
+                case X86_MT_UCM:
                     /*
                      * For EPT we can also avoid the flush in this case;
                      * see epte_get_entry_emt().
                      */
                     if ( hap_enabled(d) && cpu_has_vmx )
-                case PAT_TYPE_UNCACHABLE:
+                case X86_MT_UC:
                         break;
                     /* fall through */
                 default:
@@ -638,12 +638,12 @@ int hvm_set_mem_pinned_cacheattr(struct domain *d, uint64_t gfn_start,
         rcu_read_unlock(&pinned_cacheattr_rcu_lock);
         return -ENOENT;
 
-    case PAT_TYPE_UC_MINUS:
-    case PAT_TYPE_UNCACHABLE:
-    case PAT_TYPE_WRBACK:
-    case PAT_TYPE_WRCOMB:
-    case PAT_TYPE_WRPROT:
-    case PAT_TYPE_WRTHROUGH:
+    case X86_MT_UCM:
+    case X86_MT_UC:
+    case X86_MT_WB:
+    case X86_MT_WC:
+    case X86_MT_WP:
+    case X86_MT_WT:
         break;
 
     default:
@@ -681,7 +681,7 @@ int hvm_set_mem_pinned_cacheattr(struct domain *d, uint64_t gfn_start,
 
     list_add_rcu(&range->list, &d->arch.hvm.pinned_cacheattr_ranges);
     p2m_memory_type_changed(d);
-    if ( type != PAT_TYPE_WRBACK )
+    if ( type != X86_MT_WB )
         flush_all(FLUSH_CACHE);
 
     return 0;
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 7c81b80710f99e08fe8291d3e413c449322b777d..b543c3983d77ae807e8bd97330691a79d8d39bae 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1231,14 +1231,14 @@ static void cf_check vmx_handle_cd(struct vcpu *v, unsigned long value)
              * memory type are all UC.
              */
             u64 uc_pat =
-                ((uint64_t)PAT_TYPE_UNCACHABLE)       |       /* PAT0 */
-                ((uint64_t)PAT_TYPE_UNCACHABLE << 8)  |       /* PAT1 */
-                ((uint64_t)PAT_TYPE_UNCACHABLE << 16) |       /* PAT2 */
-                ((uint64_t)PAT_TYPE_UNCACHABLE << 24) |       /* PAT3 */
-                ((uint64_t)PAT_TYPE_UNCACHABLE << 32) |       /* PAT4 */
-                ((uint64_t)PAT_TYPE_UNCACHABLE << 40) |       /* PAT5 */
-                ((uint64_t)PAT_TYPE_UNCACHABLE << 48) |       /* PAT6 */
-                ((uint64_t)PAT_TYPE_UNCACHABLE << 56);        /* PAT7 */
+                ((uint64_t)X86_MT_UC)       |       /* PAT0 */
+                ((uint64_t)X86_MT_UC << 8)  |       /* PAT1 */
+                ((uint64_t)X86_MT_UC << 16) |       /* PAT2 */
+                ((uint64_t)X86_MT_UC << 24) |       /* PAT3 */
+                ((uint64_t)X86_MT_UC << 32) |       /* PAT4 */
+                ((uint64_t)X86_MT_UC << 40) |       /* PAT5 */
+                ((uint64_t)X86_MT_UC << 48) |       /* PAT6 */
+                ((uint64_t)X86_MT_UC << 56);        /* PAT7 */
 
             vmx_get_guest_pat(v, pat);
             vmx_set_guest_pat(v, uc_pat);
diff --git a/xen/arch/x86/include/asm/mtrr.h b/xen/arch/x86/include/asm/mtrr.h
index 7733800b798fc2c72ba87e4ce6500e4183553d04..92fc930c692039b6c709d6a04f6553593f40aa55 100644
--- a/xen/arch/x86/include/asm/mtrr.h
+++ b/xen/arch/x86/include/asm/mtrr.h
@@ -16,17 +16,7 @@
 #define NORMAL_CACHE_MODE          0
 #define NO_FILL_CACHE_MODE         2
 
-enum {
-    PAT_TYPE_UNCACHABLE=0,
-    PAT_TYPE_WRCOMB=1,
-    PAT_TYPE_WRTHROUGH=4,
-    PAT_TYPE_WRPROT=5,
-    PAT_TYPE_WRBACK=6,
-    PAT_TYPE_UC_MINUS=7,
-    PAT_TYPE_NUMS
-};
-
-#define INVALID_MEM_TYPE PAT_TYPE_NUMS
+#define INVALID_MEM_TYPE X86_NUM_MT
 
 /* In the Intel processor's MTRR interface, the MTRR type is always held in
    an 8 bit field: */
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index d61d66c20e4180f8cbe21bcd97b568519e0b738e..126437285d8a9f222fca6a7b6ff4434b60637847 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -573,8 +573,8 @@ int epte_get_entry_emt(struct domain *d, gfn_t gfn, mfn_t mfn,
     if ( gmtrr_mtype >= 0 )
     {
         *ipat = true;
-        return gmtrr_mtype != PAT_TYPE_UC_MINUS ? gmtrr_mtype
-                                                : MTRR_TYPE_UNCACHABLE;
+        return gmtrr_mtype != X86_MT_UCM ? gmtrr_mtype
+                                         : MTRR_TYPE_UNCACHABLE;
     }
     if ( gmtrr_mtype == -EADDRNOTAVAIL )
         return -1;
diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index 6bb564b0145285afc93b72a60b7797fcfe8696dc..b64bba70fc17906236872a017ad48ce91fd30803 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -561,7 +561,7 @@ _sh_propagate(struct vcpu *v,
              (type = hvm_get_mem_pinned_cacheattr(d, target_gfn, 0)) >= 0 )
             sflags |= pat_type_2_pte_flags(type);
         else if ( d->arch.hvm.is_in_uc_mode )
-            sflags |= pat_type_2_pte_flags(PAT_TYPE_UNCACHABLE);
+            sflags |= pat_type_2_pte_flags(X86_MT_UC);
         else
             if ( iomem_access_permitted(d, mfn_x(target_mfn), mfn_x(target_mfn)) )
             {
@@ -572,7 +572,7 @@ _sh_propagate(struct vcpu *v,
                             mfn_to_maddr(target_mfn),
                             MTRR_TYPE_UNCACHABLE);
                 else if ( iommu_snoop )
-                    sflags |= pat_type_2_pte_flags(PAT_TYPE_WRBACK);
+                    sflags |= pat_type_2_pte_flags(X86_MT_WB);
                 else
                     sflags |= get_pat_flags(v,
                             gflags,
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


