Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52ED8651781
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 02:10:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466402.725320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7R9O-0005av-Mn; Tue, 20 Dec 2022 01:10:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466402.725320; Tue, 20 Dec 2022 01:10:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7R9O-0005YL-Ho; Tue, 20 Dec 2022 01:10:34 +0000
Received: by outflank-mailman (input) for mailman id 466402;
 Tue, 20 Dec 2022 01:10:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tFeQ=4S=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p7R9N-0004T7-J5
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 01:10:33 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18f6490e-8003-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 02:10:32 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id D5D143200916;
 Mon, 19 Dec 2022 20:10:29 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 19 Dec 2022 20:10:30 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Dec 2022 20:10:28 -0500 (EST)
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
X-Inumbo-ID: 18f6490e-8003-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1671498629; x=1671585029; bh=bgytBg0d5kZ/2u9oOHlePhKhWAPvt5pdQvy
	Ccbzuwv0=; b=chKYcnlUCeNwbxoEdiFHiyx/gI9eYjeet/HxlgkfzmRa74bPJHl
	XqMAyii+coVyzypKraJAPAODQRvWD+X4qhtRfOLaEcmubWr5pegbSIbFJzz+Xp+x
	hoG9EgPBcMXZmlmf/g/UxmKTWPAvCJqXKEcQkKDkxAs7EZ6X1Z1DqZmU+IdzuTJV
	lGOfoigHUDLgp8Lf1HV/gusetJN4tcwrJPEzF6yeuTDO6KviS5Fo1yzMZ68YoRcB
	nWxvcQKzjtpjn5+5yb0o6aXhlHbLmkqdsqRUKU74eDuzGLX7Lzej1LxIshAAdFNk
	twJYW2nRfTt4lsP1XbycAA+YihGb+K7QVTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1671498629; x=1671585029; bh=bgytBg0d5kZ/2
	u9oOHlePhKhWAPvt5pdQvyCcbzuwv0=; b=bKJ7jMaNn3VReebkzJoSti0T9sYgu
	u2kjtqslyTwtyHI3ztPoIcHzUWSb4RdE7FGxpd3o4bjRhmX74Wo28ExGyiTv39zG
	7hChxlljdDQS6EuQNrw6Br8Vb2nhf24to50HIt4pUkaLjiviz2TzNodkZsGyWvZR
	cPIShhLcR11Fvn/ae0ffzNJCYo5OTFxrhaZV0ejXJiGfmf/SeMTIh6vffEKnyHVq
	a/JFnLs9z0Mg/wc+IqwM09aPCErF12iAbppD0h5uKImaKULKNl5b046YTD+iGIFt
	0F1A3f9flXGN9e2L5Wr3JggRS8g5OMi6UcbIQRu3yHFv5+o+KmZ3SwgyQ==
X-ME-Sender: <xms:hQuhYwTKhipIexb7oomvABbP_UaFpidWOFpM8y3TCrp0UlhdPow72A>
    <xme:hQuhY9y3iTA2zmYRtJsXbbRJZ9uvOu_dHWX3JC7EtkFWtahQjDqgOy31n-F7yWVaC
    sWqRT4jAbKGFbM>
X-ME-Received: <xmr:hQuhY91IA6SN6gRtiW5brr4ij7dENJ92lpVcrcDRXvKNYwUDMOCJEtmz-3m1dZi2mKw56T24hjSF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeeggdefvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:hQuhY0AAfN-KvyLyN5NED-C3OTPYvOOSBxko224uef6ZgbHBoehapw>
    <xmx:hQuhY5hfSYeaRMbE4eVBcWxAkyP12WLW6SN5MPtFFmBoMShZQqhlww>
    <xmx:hQuhYwrgJvcAxpSEORA3PcZIog6Tb4AwfBEEJTGYad22O-FoOs8CRg>
    <xmx:hQuhY6UiOseRQcKygEFIzvUjnEZ9NBaheG5woxqYabDKupbwJxpArA>
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
Subject: [PATCH v5 04/10] x86: Replace MTRR_* constants with X86_MT_* constants
Date: Mon, 19 Dec 2022 20:07:06 -0500
Message-Id: <7a0c5f8f12b97e93258d91c4ffd036a8e9d74061.1671497984.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671497984.git.demi@invisiblethingslab.com>
References: <cover.1671497984.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows eliminating of the former, with the exception of
MTRR_NUM_TYPES.  MTRR_NUM_TYPES is kept, as due to a quirk of the x86
architecture X86_MT_UCM (7) is not valid in an MTRR.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v2:

- Improve commit message
- Do not replace MTRR_NUM_TYPES with X86_MT_UCM
- State explicitly that MTRR_NUM_TYPES is kept
---
 xen/arch/x86/cpu/mtrr/generic.c         | 10 ++---
 xen/arch/x86/cpu/mtrr/main.c            | 26 ++++++-------
 xen/arch/x86/e820.c                     |  4 +-
 xen/arch/x86/hvm/mtrr.c                 | 30 +++++++--------
 xen/arch/x86/hvm/vmx/vmcs.c             |  2 +-
 xen/arch/x86/hvm/vmx/vmx.c              |  2 +-
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  2 +-
 xen/arch/x86/include/asm/mtrr.h         | 10 +----
 xen/arch/x86/mm/p2m-ept.c               | 51 ++++++++++++-------------
 xen/arch/x86/mm/shadow/multi.c          |  2 +-
 10 files changed, 66 insertions(+), 73 deletions(-)

diff --git a/xen/arch/x86/cpu/mtrr/generic.c b/xen/arch/x86/cpu/mtrr/generic.c
index 47aaf76226e0a8a0712b7211ed339a4a032ab3f3..660ae26c2350b3436a471155fc0426699ba8ac1d 100644
--- a/xen/arch/x86/cpu/mtrr/generic.c
+++ b/xen/arch/x86/cpu/mtrr/generic.c
@@ -127,11 +127,11 @@ static const char *__init mtrr_attrib_to_str(mtrr_type x)
 {
 	static const char __initconst strings[MTRR_NUM_TYPES][16] =
 	{
-		[MTRR_TYPE_UNCACHABLE]     = "uncachable",
-		[MTRR_TYPE_WRCOMB]         = "write-combining",
-		[MTRR_TYPE_WRTHROUGH]      = "write-through",
-		[MTRR_TYPE_WRPROT]         = "write-protect",
-		[MTRR_TYPE_WRBACK]         = "write-back",
+		[X86_MT_UC] = "uncachable",
+		[X86_MT_WC] = "write-combining",
+		[X86_MT_WT] = "write-through",
+		[X86_MT_WP] = "write-protect",
+		[X86_MT_WB] = "write-back",
 	};
 
 	return (x < ARRAY_SIZE(strings) && strings[x][0]) ? strings[x] : "?";
diff --git a/xen/arch/x86/cpu/mtrr/main.c b/xen/arch/x86/cpu/mtrr/main.c
index 4e01c8d6f9df6562b94438f265d79a0a6fca8de6..2946003b84938f3b83c98b62dfaa3ace90822983 100644
--- a/xen/arch/x86/cpu/mtrr/main.c
+++ b/xen/arch/x86/cpu/mtrr/main.c
@@ -163,10 +163,10 @@ static void cf_check ipi_handler(void *info)
 }
 
 static inline int types_compatible(mtrr_type type1, mtrr_type type2) {
-	return type1 == MTRR_TYPE_UNCACHABLE ||
-	       type2 == MTRR_TYPE_UNCACHABLE ||
-	       (type1 == MTRR_TYPE_WRTHROUGH && type2 == MTRR_TYPE_WRBACK) ||
-	       (type1 == MTRR_TYPE_WRBACK && type2 == MTRR_TYPE_WRTHROUGH);
+	return type1 == X86_MT_UC ||
+	       type2 == X86_MT_UC ||
+	       (type1 == X86_MT_WT && type2 == X86_MT_WB) ||
+	       (type1 == X86_MT_WB && type2 == X86_MT_WT);
 }
 
 /**
@@ -297,13 +297,13 @@ static void set_mtrr(unsigned int reg, unsigned long base,
  *
  *	The available types are
  *
- *	%MTRR_TYPE_UNCACHABLE	-	No caching
+ *	%X86_MT_UC	-	No caching
  *
- *	%MTRR_TYPE_WRBACK	-	Write data back in bursts whenever
+ *	%X86_MT_WB	-	Write data back in bursts whenever
  *
- *	%MTRR_TYPE_WRCOMB	-	Write data back soon but allow bursts
+ *	%X86_MT_WC	-	Write data back soon but allow bursts
  *
- *	%MTRR_TYPE_WRTHROUGH	-	Cache reads but not writes
+ *	%X86_MT_WT	-	Cache reads but not writes
  *
  *	BUGS: Needs a quiet flag for the cases where drivers do not mind
  *	failures and do not wish system log messages to be sent.
@@ -328,7 +328,7 @@ int mtrr_add_page(unsigned long base, unsigned long size,
 	}
 
 	/*  If the type is WC, check that this processor supports it  */
-	if ((type == MTRR_TYPE_WRCOMB) && !have_wrcomb()) {
+	if ((type == X86_MT_WC) && !have_wrcomb()) {
 		printk(KERN_WARNING
 		       "mtrr: your processor doesn't support write-combining\n");
 		return -EOPNOTSUPP;
@@ -442,13 +442,13 @@ static int mtrr_check(unsigned long base, unsigned long size)
  *
  *	The available types are
  *
- *	%MTRR_TYPE_UNCACHABLE	-	No caching
+ *	%X86_MT_UC	-	No caching
  *
- *	%MTRR_TYPE_WRBACK	-	Write data back in bursts whenever
+ *	%X86_MT_WB	-	Write data back in bursts whenever
  *
- *	%MTRR_TYPE_WRCOMB	-	Write data back soon but allow bursts
+ *	%X86_MT_WC	-	Write data back soon but allow bursts
  *
- *	%MTRR_TYPE_WRTHROUGH	-	Cache reads but not writes
+ *	%X86_MT_WT	-	Cache reads but not writes
  *
  *	BUGS: Needs a quiet flag for the cases where drivers do not mind
  *	failures and do not wish system log messages to be sent.
diff --git a/xen/arch/x86/e820.c b/xen/arch/x86/e820.c
index b653a19c93afb98c2d64330384cb4fa7b4d2e1ec..c5911cf48dc4a281c03ddef35f23b19bc7af42eb 100644
--- a/xen/arch/x86/e820.c
+++ b/xen/arch/x86/e820.c
@@ -459,7 +459,7 @@ static uint64_t __init mtrr_top_of_ram(void)
         printk(" MTRR cap: %"PRIx64" type: %"PRIx64"\n", mtrr_cap, mtrr_def);
 
     /* MTRRs enabled, and default memory type is not writeback? */
-    if ( !test_bit(11, &mtrr_def) || ((uint8_t)mtrr_def == MTRR_TYPE_WRBACK) )
+    if ( !test_bit(11, &mtrr_def) || ((uint8_t)mtrr_def == X86_MT_WB) )
         return 0;
 
     /*
@@ -476,7 +476,7 @@ static uint64_t __init mtrr_top_of_ram(void)
             printk(" MTRR[%d]: base %"PRIx64" mask %"PRIx64"\n",
                    i, base, mask);
 
-        if ( !test_bit(11, &mask) || ((uint8_t)base != MTRR_TYPE_WRBACK) )
+        if ( !test_bit(11, &mask) || ((uint8_t)base != X86_MT_WB) )
             continue;
         base &= addr_mask;
         mask &= addr_mask;
diff --git a/xen/arch/x86/hvm/mtrr.c b/xen/arch/x86/hvm/mtrr.c
index 242623f3c239ee18a44f882ecb3910a00c615825..093103f6c768cf64f880d1b20e1c14f5918c1250 100644
--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -39,11 +39,11 @@ static const uint8_t pat_entry_2_pte_flags[8] = {
 /* Effective mm type lookup table, according to MTRR and PAT. */
 static const uint8_t mm_type_tbl[MTRR_NUM_TYPES][X86_NUM_MT] = {
 #define RS MEMORY_NUM_TYPES
-#define UC MTRR_TYPE_UNCACHABLE
-#define WB MTRR_TYPE_WRBACK
-#define WC MTRR_TYPE_WRCOMB
-#define WP MTRR_TYPE_WRPROT
-#define WT MTRR_TYPE_WRTHROUGH
+#define UC X86_MT_UC
+#define WB X86_MT_WB
+#define WC X86_MT_WC
+#define WP X86_MT_WP
+#define WT X86_MT_WT
 
 /*          PAT(UC, WC, RS, RS, WT, WP, WB, UC-) */
 /* MTRR(UC) */ {UC, WC, RS, RS, UC, UC, UC, UC},
@@ -202,7 +202,7 @@ int mtrr_get_type(const struct mtrr_state *m, paddr_t pa, unsigned int order)
    unsigned int seg, num_var_ranges = MASK_EXTR(m->mtrr_cap, MTRRcap_VCNT);
 
    if ( unlikely(!m->enabled) )
-       return MTRR_TYPE_UNCACHABLE;
+       return X86_MT_UC;
 
    pa &= mask;
    if ( (pa < 0x100000) && m->fixed_enabled )
@@ -277,13 +277,13 @@ int mtrr_get_type(const struct mtrr_state *m, paddr_t pa, unsigned int order)
        return -1;
 
    /* Two or more matches, one being UC? */
-   if ( overlap_mtrr & (1 << MTRR_TYPE_UNCACHABLE) )
-       return MTRR_TYPE_UNCACHABLE;
+   if ( overlap_mtrr & (1 << X86_MT_UC) )
+       return X86_MT_UC;
 
    /* Two or more matches, all of them WT and WB? */
    if ( overlap_mtrr ==
-        ((1 << MTRR_TYPE_WRTHROUGH) | (1 << MTRR_TYPE_WRBACK)) )
-       return MTRR_TYPE_WRTHROUGH;
+        ((1 << X86_MT_WT) | (1 << X86_MT_WB)) )
+       return X86_MT_WT;
 
    /* Behaviour is undefined, but return the last overlapped type. */
    return overlap_mtrr_pos;
@@ -381,11 +381,11 @@ static inline bool_t valid_mtrr_type(uint8_t type)
 {
     switch ( type )
     {
-    case MTRR_TYPE_UNCACHABLE:
-    case MTRR_TYPE_WRBACK:
-    case MTRR_TYPE_WRCOMB:
-    case MTRR_TYPE_WRPROT:
-    case MTRR_TYPE_WRTHROUGH:
+    case X86_MT_UC:
+    case X86_MT_WB:
+    case X86_MT_WC:
+    case X86_MT_WP:
+    case X86_MT_WT:
         return 1;
     }
     return 0;
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 84dbb88d33b76111833a37339186199f8bc03b5e..f0825216d722d978f221bb34a797d8de5505cb80 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -555,7 +555,7 @@ static int vmx_init_vmcs_config(bool bsp)
     /* Require Write-Back (WB) memory type for VMCS accesses. */
     opt = (vmx_basic_msr_high & (VMX_BASIC_MEMORY_TYPE_MASK >> 32)) /
           ((VMX_BASIC_MEMORY_TYPE_MASK & -VMX_BASIC_MEMORY_TYPE_MASK) >> 32);
-    if ( opt != MTRR_TYPE_WRBACK )
+    if ( opt != X86_MT_WB )
     {
         printk("VMX: CPU%d has unexpected VMCS access type %u\n",
                smp_processor_id(), opt);
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index b543c3983d77ae807e8bd97330691a79d8d39bae..4ae7dd56c9981d32ac545d6e7b7c126b15f68969 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -434,7 +434,7 @@ static void cf_check domain_creation_finished(struct domain *d)
         return;
 
     ASSERT(epte_get_entry_emt(d, gfn, apic_access_mfn, 0, &ipat,
-                              p2m_mmio_direct) == MTRR_TYPE_WRBACK);
+                              p2m_mmio_direct) == X86_MT_WB);
     ASSERT(ipat);
 
     if ( set_mmio_p2m_entry(d, gfn, apic_access_mfn, PAGE_ORDER_4K) )
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
index 75f9928abfad28e3895fe3dd4058b2b0a6e145c3..65e9e27b5437adff59abc46976f73a9f2cc587da 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -38,7 +38,7 @@ struct vmx_msr_entry {
     u64 data;
 };
 
-#define EPT_DEFAULT_MT      MTRR_TYPE_WRBACK
+#define EPT_DEFAULT_MT      X86_MT_WB
 
 struct ept_data {
     union {
diff --git a/xen/arch/x86/include/asm/mtrr.h b/xen/arch/x86/include/asm/mtrr.h
index 92fc930c692039b6c709d6a04f6553593f40aa55..e4f6ca6048334b2094a1836cc2f298453641232f 100644
--- a/xen/arch/x86/include/asm/mtrr.h
+++ b/xen/arch/x86/include/asm/mtrr.h
@@ -3,15 +3,9 @@
 
 #include <xen/mm.h>
 
-/* These are the region types. They match the architectural specification. */
-#define MTRR_TYPE_UNCACHABLE 0
-#define MTRR_TYPE_WRCOMB     1
-#define MTRR_TYPE_WRTHROUGH  4
-#define MTRR_TYPE_WRPROT     5
-#define MTRR_TYPE_WRBACK     6
-#define MTRR_NUM_TYPES       7
+#define MTRR_NUM_TYPES       X86_MT_UCM
 #define MEMORY_NUM_TYPES     MTRR_NUM_TYPES
-#define NO_HARDCODE_MEM_TYPE    MTRR_NUM_TYPES
+#define NO_HARDCODE_MEM_TYPE MTRR_NUM_TYPES
 
 #define NORMAL_CACHE_MODE          0
 #define NO_FILL_CACHE_MODE         2
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index 126437285d8a9f222fca6a7b6ff4434b60637847..bb143c6c42c69db4e054b9156aad9a18ea0b2378 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -506,7 +506,7 @@ int epte_get_entry_emt(struct domain *d, gfn_t gfn, mfn_t mfn,
                                                mfn_x(mfn) | ((1UL << order) - 1)) )
         {
             *ipat = true;
-            return MTRR_TYPE_UNCACHABLE;
+            return X86_MT_UC;
         }
         /* Force invalid memory type so resolve_misconfig() will split it */
         return -1;
@@ -515,7 +515,7 @@ int epte_get_entry_emt(struct domain *d, gfn_t gfn, mfn_t mfn,
     if ( !mfn_valid(mfn) )
     {
         *ipat = true;
-        return MTRR_TYPE_UNCACHABLE;
+        return X86_MT_UC;
     }
 
     /*
@@ -526,7 +526,7 @@ int epte_get_entry_emt(struct domain *d, gfn_t gfn, mfn_t mfn,
          !cache_flush_permitted(d) )
     {
         *ipat = true;
-        return MTRR_TYPE_WRBACK;
+        return X86_MT_WB;
     }
 
     for ( special_pgs = i = 0; i < (1ul << order); i++ )
@@ -539,13 +539,13 @@ int epte_get_entry_emt(struct domain *d, gfn_t gfn, mfn_t mfn,
             return -1;
 
         *ipat = true;
-        return MTRR_TYPE_WRBACK;
+        return X86_MT_WB;
     }
 
     switch ( type )
     {
     case p2m_mmio_direct:
-        return MTRR_TYPE_UNCACHABLE;
+        return X86_MT_UC;
 
     case p2m_grant_map_ro:
     case p2m_grant_map_rw:
@@ -563,7 +563,7 @@ int epte_get_entry_emt(struct domain *d, gfn_t gfn, mfn_t mfn,
          * diverges. See p2m_type_to_flags for the AMD attributes.
          */
         *ipat = true;
-        return MTRR_TYPE_WRBACK;
+        return X86_MT_WB;
 
     default:
         break;
@@ -573,15 +573,14 @@ int epte_get_entry_emt(struct domain *d, gfn_t gfn, mfn_t mfn,
     if ( gmtrr_mtype >= 0 )
     {
         *ipat = true;
-        return gmtrr_mtype != X86_MT_UCM ? gmtrr_mtype
-                                         : MTRR_TYPE_UNCACHABLE;
+        return gmtrr_mtype != X86_MT_UCM ? gmtrr_mtype : X86_MT_UC;
     }
     if ( gmtrr_mtype == -EADDRNOTAVAIL )
         return -1;
 
     gmtrr_mtype = v ? mtrr_get_type(&v->arch.hvm.mtrr,
                                     gfn_x(gfn) << PAGE_SHIFT, order)
-                    : MTRR_TYPE_WRBACK;
+                    : X86_MT_WB;
     hmtrr_mtype = mtrr_get_type(&mtrr_state, mfn_x(mfn) << PAGE_SHIFT,
                                 order);
     if ( gmtrr_mtype < 0 || hmtrr_mtype < 0 )
@@ -592,14 +591,14 @@ int epte_get_entry_emt(struct domain *d, gfn_t gfn, mfn_t mfn,
         return hmtrr_mtype;
 
     /* If either type is UC, we have to go with that one. */
-    if ( gmtrr_mtype == MTRR_TYPE_UNCACHABLE ||
-         hmtrr_mtype == MTRR_TYPE_UNCACHABLE )
-        return MTRR_TYPE_UNCACHABLE;
+    if ( gmtrr_mtype == X86_MT_UC ||
+         hmtrr_mtype == X86_MT_UC )
+        return X86_MT_UC;
 
     /* If either type is WB, we have to go with the other one. */
-    if ( gmtrr_mtype == MTRR_TYPE_WRBACK )
+    if ( gmtrr_mtype == X86_MT_WB )
         return hmtrr_mtype;
-    if ( hmtrr_mtype == MTRR_TYPE_WRBACK )
+    if ( hmtrr_mtype == X86_MT_WB )
         return gmtrr_mtype;
 
     /*
@@ -610,13 +609,13 @@ int epte_get_entry_emt(struct domain *d, gfn_t gfn, mfn_t mfn,
      * permit this), while WT and WP require writes to go straight to memory
      * (WC can buffer them).
      */
-    if ( (gmtrr_mtype == MTRR_TYPE_WRTHROUGH &&
-          hmtrr_mtype == MTRR_TYPE_WRPROT) ||
-         (gmtrr_mtype == MTRR_TYPE_WRPROT &&
-          hmtrr_mtype == MTRR_TYPE_WRTHROUGH) )
-        return MTRR_TYPE_WRPROT;
+    if ( (gmtrr_mtype == X86_MT_WT &&
+          hmtrr_mtype == X86_MT_WP) ||
+         (gmtrr_mtype == X86_MT_WP &&
+          hmtrr_mtype == X86_MT_WT) )
+        return X86_MT_WP;
 
-    return MTRR_TYPE_UNCACHABLE;
+    return X86_MT_UC;
 }
 
 /*
@@ -1426,12 +1425,12 @@ void ept_p2m_uninit(struct p2m_domain *p2m)
 static const char *memory_type_to_str(unsigned int x)
 {
     static const char memory_types[8][3] = {
-        [MTRR_TYPE_UNCACHABLE]     = "UC",
-        [MTRR_TYPE_WRCOMB]         = "WC",
-        [MTRR_TYPE_WRTHROUGH]      = "WT",
-        [MTRR_TYPE_WRPROT]         = "WP",
-        [MTRR_TYPE_WRBACK]         = "WB",
-        [MTRR_NUM_TYPES]           = "??"
+        [X86_MT_UC]      = "UC",
+        [X86_MT_WC]      = "WC",
+        [X86_MT_WT]      = "WT",
+        [X86_MT_WP]      = "WP",
+        [X86_MT_WB]      = "WB",
+        [MTRR_NUM_TYPES] = "??",
     };
 
     ASSERT(x < ARRAY_SIZE(memory_types));
diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index b64bba70fc17906236872a017ad48ce91fd30803..f5f7ff021bd9e057c5b6f6329de7acb5ef05d58f 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -570,7 +570,7 @@ _sh_propagate(struct vcpu *v,
                             gflags,
                             gfn_to_paddr(target_gfn),
                             mfn_to_maddr(target_mfn),
-                            MTRR_TYPE_UNCACHABLE);
+                            X86_MT_UC);
                 else if ( iommu_snoop )
                     sflags |= pat_type_2_pte_flags(X86_MT_WB);
                 else
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

