Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D19164E4DF
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 00:58:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463948.722313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5y7K-0002yX-Fk; Thu, 15 Dec 2022 23:58:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463948.722313; Thu, 15 Dec 2022 23:58:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5y7K-0002un-Ag; Thu, 15 Dec 2022 23:58:22 +0000
Received: by outflank-mailman (input) for mailman id 463948;
 Thu, 15 Dec 2022 23:58:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t+b5=4N=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p5y7I-0001Aq-LU
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 23:58:20 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59036e86-7cd4-11ed-91b6-6bf2151ebd3b;
 Fri, 16 Dec 2022 00:58:19 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 68EA1320090F;
 Thu, 15 Dec 2022 18:58:17 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 15 Dec 2022 18:58:18 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Dec 2022 18:58:16 -0500 (EST)
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
X-Inumbo-ID: 59036e86-7cd4-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1671148697; x=1671235097; bh=lFRjAyz2V8QJ7yU1YRzmTT1WULJJ6rEk/i2
	CB/Rdt1o=; b=sLWNRh1n0ifFhiydrv5loEm2nfIUM/yIuBQcuV9zlgNQfiANVH9
	rpi3KLDvPe/UQVh46DcrArDSmoOh54y+qmTmtYXdCCO5ztQ+glA0Dc2mKX6jnZhq
	cgse7zM2Moan9xQRozUfhj6HJgyqgbPZpcCSfcgXcabmq4pF/C1b/oNWB3ocnRh1
	E9LrZxOgdi3j+GxHKgqRYQlq5IdKamLX+9VZLpWcBs569gutNeyLLPYfL95WLm1a
	Vcr3jhcGj1S9TK6IZ9Xox1SC3MpdaH8Y2IimW6HpKVSSazvu0FfZpUlsuJ9E4So8
	Tc40vh7Hr5P9xyjsaCy4ifCQrwHtsBRnoQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1671148697; x=1671235097; bh=lFRjAyz2V8QJ7
	yU1YRzmTT1WULJJ6rEk/i2CB/Rdt1o=; b=vLenk4MOqGChBkttCM48fSz2j8jer
	yyOkiK3rc4BhrjS9hE9Bs9IWis2Hy1+p659ADJ0y1X/UWKlAP4KDfMCv/YviBVTs
	GI/2lsMamvKDyiPSKOx4or8W52aofeRwg+cYyyFkP4WSlyB6Ky5OeMiq8Cl87l7z
	pfU38BSl0+sXeieI1do7ASqKNEFC2NLUrHmj+NWG97zQ+u/1iVit39QGHjN7pOVL
	NfD5Fog3l9ywQeWIh+ZnBqkzN0lSkyxhYG8WB4qrjgX3NDaIl2YmB7sb5vKGgLzZ
	AVfBO7hkOxcHMu2/IO6uYKU7mKB0BnSzWd/FpXkpYuSCpotR4E3+g8xqQ==
X-ME-Sender: <xms:mLSbY6xxHwOaix9rNPWegLK8XesRH6QsK5cLG_xZoajegT2hxcoNpw>
    <xme:mLSbY2QKCs-746zmToQfJUlgabrbC1QpVQ6ZDmv7cKeVhKF-0zT0Ep4krxToxG9Eu
    GdDURuK5gS7OUw>
X-ME-Received: <xmr:mLSbY8WcLHA_0oOtxvz3Xmm4x_tSZ9A_RrwrKJGDZOgAFZhKZwzPeGY4GpAwVQXea41voxlLn5UY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeigddugecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedunecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:mLSbYwgqV3izVenKaWJ6bjrqbQA7GV7Fb9bMYUZcmaGN58xfBW0hVw>
    <xmx:mLSbY8DZg3gsBm0gNjVJvgSyzCpJS2Eaks8U0NyHMvXpPY6gBUBiXg>
    <xmx:mLSbYxLTrIPiYVl5wurWIg2ZvOqMhvVyRMqgoiAjxWQ5xU7aDBi1Mw>
    <xmx:mbSbY41AgPXt51pewk0D5Nvdi69ug8KRpZljOQRY36Ee_YkdWvrrLQ>
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
Subject: [PATCH v4 06/10] x86: Remove MEMORY_NUM_TYPES and NO_HARDCODE_MEM_TYPE
Date: Thu, 15 Dec 2022 18:57:48 -0500
Message-Id: <b4a092bace906a10be89c113a3519e00afdea52a.1671139149.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671139149.git.demi@invisiblethingslab.com>
References: <cover.1671139149.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change intended.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
Changes since v2:

- Keep MTRR_NUM_TYPES and adjust commit message accordingly
---
 xen/arch/x86/hvm/mtrr.c         | 18 +++++++++---------
 xen/arch/x86/include/asm/mtrr.h |  2 --
 xen/arch/x86/mm/shadow/multi.c  |  2 +-
 3 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/hvm/mtrr.c b/xen/arch/x86/hvm/mtrr.c
index 093103f6c768cf64f880d1b20e1c14f5918c1250..05e978041d62fd0d559462de181a04bef8a5bca9 100644
--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -38,7 +38,7 @@ static const uint8_t pat_entry_2_pte_flags[8] = {
 
 /* Effective mm type lookup table, according to MTRR and PAT. */
 static const uint8_t mm_type_tbl[MTRR_NUM_TYPES][X86_NUM_MT] = {
-#define RS MEMORY_NUM_TYPES
+#define RS MTRR_NUM_TYPES
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
+static uint8_t __read_mostly mtrr_epat_tbl[MTRR_NUM_TYPES][MTRR_NUM_TYPES] =
+    { [0 ... MTRR_NUM_TYPES - 1] =
+        { [0 ... MTRR_NUM_TYPES - 1] = INVALID_MEM_TYPE }
     };
 
 /* Lookup table for PAT entry of a given PAT value in host PAT. */
@@ -85,7 +85,7 @@ static int __init cf_check hvm_mtrr_pat_init(void)
         {
             unsigned int tmp = mm_type_tbl[i][j];
 
-            if ( tmp < MEMORY_NUM_TYPES )
+            if ( tmp < MTRR_NUM_TYPES )
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
+    if ( gmtrr_mtype == MTRR_NUM_TYPES )
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
index e4f6ca6048334b2094a1836cc2f298453641232f..4b7f840a965954cc4b59698327a37e47026893a4 100644
--- a/xen/arch/x86/include/asm/mtrr.h
+++ b/xen/arch/x86/include/asm/mtrr.h
@@ -4,8 +4,6 @@
 #include <xen/mm.h>
 
 #define MTRR_NUM_TYPES       X86_MT_UCM
-#define MEMORY_NUM_TYPES     MTRR_NUM_TYPES
-#define NO_HARDCODE_MEM_TYPE MTRR_NUM_TYPES
 
 #define NORMAL_CACHE_MODE          0
 #define NO_FILL_CACHE_MODE         2
diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index f5f7ff021bd9e057c5b6f6329de7acb5ef05d58f..1faf9940db6b0afefc5977c00c00fb6a39cd27d2 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -578,7 +578,7 @@ _sh_propagate(struct vcpu *v,
                             gflags,
                             gfn_to_paddr(target_gfn),
                             mfn_to_maddr(target_mfn),
-                            NO_HARDCODE_MEM_TYPE);
+                            MTRR_NUM_TYPES);
             }
     }
 
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


