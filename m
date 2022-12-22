Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6D5654893
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 23:32:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468694.727886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8U6j-0003hF-W9; Thu, 22 Dec 2022 22:32:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468694.727886; Thu, 22 Dec 2022 22:32:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8U6j-0003fp-Sp; Thu, 22 Dec 2022 22:32:09 +0000
Received: by outflank-mailman (input) for mailman id 468694;
 Thu, 22 Dec 2022 22:32:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s9VX=4U=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p8U6i-0003ch-3O
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 22:32:08 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74bb5547-8248-11ed-8fd4-01056ac49cbb;
 Thu, 22 Dec 2022 23:32:04 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 7521E5C00BE;
 Thu, 22 Dec 2022 17:32:02 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 22 Dec 2022 17:32:02 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Dec 2022 17:32:01 -0500 (EST)
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
X-Inumbo-ID: 74bb5547-8248-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1671748322; x=1671834722; bh=lFRjAyz2V8QJ7yU1YRzmTT1WULJJ6rEk/i2
	CB/Rdt1o=; b=CmjweiydWEPzaPijrx7yD0axzlmqvWGg7p6Xy5g7F+6ZBN9b1j5
	oSoz5BSyld6drG6klTB2aPG0nGAABBhNrWG82WoMm8QTPkeOO0fi8CnB5TlmAWxL
	DgK+3jvl64jvb8oZ3aw8e+G9U/m7hu8W1NmJNstH6TJXXGt4MIqcdt7RMFoiUk+7
	Yq5WqkQtsmhIMQdB5H5UHZyAnOj1BnObo6wf3RCyoO8DrddTtBlg3oWCSMvLnMjo
	X1h/n2fyorTyLJewMry+odjTXHvR3rv7ghINeFOfMB4sSgn6eSX5Oq3QJyMMKV8a
	j/aSs4AyE4otbI/yS5GVlrgGrRHf3fMNHjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1671748322; x=1671834722; bh=lFRjAyz2V8QJ7
	yU1YRzmTT1WULJJ6rEk/i2CB/Rdt1o=; b=rQY+7/wZda7tED0EbKq0qrQyOV0C3
	ZZQQVSiTlkdLHtwRuYw5qyOebCgCwgWb63tNUxykPKPPKVsLfDdGIuwIpeCFk0O0
	X65hDIT2Z1jiV1pk0ETVV+dCkdshzg350xgcDzP/OwU9L5vJ14aRwRsq0plj7VtL
	K+PDWzZaL42iYwLtL8Tz1hVQ0L3mxBI3LE1S3yd3O/KtZJSnST9tqYbNLN9xM+OX
	zUPNwvtIzn5E4BMZLked7aQoVeHO/Yzl3+yqADzFcvaRw5UpzIo8pPvAy/aGxh1U
	BCHABYmFQ7JcsWB4ELKxY6h5EVOq6StI6+vDRG0lZ5fyE9Ue2xtLh+1tg==
X-ME-Sender: <xms:4tqkY0G1llwccp0AsoskvFY1S7Q3Ex1pXWaOCpo0sffHd6WvbMhQow>
    <xme:4tqkY9Wu5ZCWWwctCIan2_C03mFw8kPjJiMjQH1aNsb0Qk6LMvejftKr8q49ylu12
    xieuOuP5p7F7Kg>
X-ME-Received: <xmr:4tqkY-Imm-aTnMbjZ2S1YxvaTde0oMbYmLD-Um1ADowFG0ZmbsYYH84Gp3h_mfuW35GAwJjWkREp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrhedtgdduieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepjeffjefggfeugeduvedvjeekgfeh
    gffhhfffjeetkeelueefffetfffhtdduheetnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:4tqkY2EGOq4C87cg52F_67V2-7LcnKORxXjo-JvL4E-v_bHHI9LvMw>
    <xmx:4tqkY6WhH4wBD8uR7PiaiJPL0UptGkCZbeD9ObNaKrILiizMdjj9Jw>
    <xmx:4tqkY5OttK9nqxvQCFNuXknH-e0nNZfVdu0b3sIkabwT21GNkKwgog>
    <xmx:4tqkY8Lsj9wgkYgcnQhpiCTV91BMO0MOTNF13FZeAjwu-1aHT8etDA>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Tim Deegan <tim@xen.org>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH v6 2/5] x86: Remove MEMORY_NUM_TYPES and NO_HARDCODE_MEM_TYPE
Date: Thu, 22 Dec 2022 17:31:47 -0500
Message-Id: <dda75fd1ad51d041b7ff2fd934395040352fd6aa.1671744225.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671744225.git.demi@invisiblethingslab.com>
References: <cover.1671744225.git.demi@invisiblethingslab.com>
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

