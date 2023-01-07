Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D2B6611F5
	for <lists+xen-devel@lfdr.de>; Sat,  7 Jan 2023 23:08:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473024.733484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEHLY-0007gL-0z; Sat, 07 Jan 2023 22:07:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473024.733484; Sat, 07 Jan 2023 22:07:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEHLX-0007bX-TL; Sat, 07 Jan 2023 22:07:23 +0000
Received: by outflank-mailman (input) for mailman id 473024;
 Sat, 07 Jan 2023 22:07:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TYdO=5E=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pEHLW-0007Zv-Ro
 for xen-devel@lists.xenproject.org; Sat, 07 Jan 2023 22:07:22 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a673a04f-8ed7-11ed-91b6-6bf2151ebd3b;
 Sat, 07 Jan 2023 23:07:19 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id CE6FC5C0070;
 Sat,  7 Jan 2023 17:07:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Sat, 07 Jan 2023 17:07:17 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Jan 2023 17:07:17 -0500 (EST)
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
X-Inumbo-ID: a673a04f-8ed7-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1673129237; x=1673215637; bh=lFRjAyz2V8QJ7yU1YRzmTT1WULJJ6rEk/i2
	CB/Rdt1o=; b=TcfGk5AK7ZARdCLVukNVb/Z5aT/jz9wzzUuiOrlE0r1WL2jGFpg
	vA3eRk53cB04tmhryKp4f3DUnv2jK9fCH1TjNtEpUhnAUvWqRu7G+KzcZJHibL2K
	pWAP7rYDXZl8CIAps8E04TYn6dbgKqcejusmBQBRK4MHGgVDLJZN/euE9gt9Tpjx
	lCYCfUXwWXyFVjsWnyD0quqe6P7rI06/yC5lF0aiuP9ET3mGkIfkET0k4kew4xa9
	iRH9z3cNWYEM52O47fsG1F1cKLzO4j7SM3QKVjWky0LsLvLvA7IEIp43UXlFbuNP
	cXwFz4bjYf5UKGj+LNAT+u1Vssl7aVksESg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1673129237; x=1673215637; bh=lFRjAyz2V8QJ7
	yU1YRzmTT1WULJJ6rEk/i2CB/Rdt1o=; b=AdLhRwqTNTZZqgenNh0x4w8h3eh6Y
	G+Zq5P8NlXojtpNaBHghUWWZsY8fZIL5LZ5K4V43tOFYFicwLqSzfNXWetyK/vFO
	iZyebRdy5EgtWaPgS/+S19r22V6vYfJSB8eOF9J3FBFfQpdwzo0nxt/H4LqPQUQJ
	YXTyeKfETokij1et7xogLh0NPxRBZ7SChOenZbdGMtF4fbRO0dZ45gOuEmza8pWL
	6tYZBlMz69s8aTHn7Q+7o4ih3mAPOnv+WOkIUrz6R3RlR4GmWaZoX4fUQbql9OvU
	AiF0W/e7VUYuftYigqDLpeHS2qv8cwOs6U9cuuKwA5GnONHwcUVfiNbpw==
X-ME-Sender: <xms:Fe25Y5lnOWPudxwEXwtW7gTbm91C1gBwKpKKSY12RraIkVNo1e6Ydg>
    <xme:Fe25Y02uhkkSydBMSiIRCQC7NPQ0n28RcYmpH_F0AX29EnIvxpENYsXUnXLmf5b21
    LDBSMSMsTlpGtQ>
X-ME-Received: <xmr:Fe25Y_q8TbuShyalWqgCZ7XLEzvecc43xdhOU5Mo9GZK6WhwW-TmU0IZFnjI3_nZ65VoOykKk8Oz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrkedvgdduheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepjeffjefggfeugeduvedvjeekgfeh
    gffhhfffjeetkeelueefffetfffhtdduheetnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:Fe25Y5l-Pd9tqLHp5e3AlJTnl56Kv6X4Qvgbt2vnJc1kPnMjrxuO7g>
    <xmx:Fe25Y30hPOylGRWE_ucBJPaExmgGrEDMCGwoZA4dEM9qI2NMRP823w>
    <xmx:Fe25Y4ss02GaXAl9hHv3ukLwZaCWJq60_x9iKPqS8qRsIufPt82vXQ>
    <xmx:Fe25YwLYLcOOpQNTAPza_cyrMCIbeNe_2d1q7wsC6eUepdN31hs3LA>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tim Deegan <tim@xen.org>
Subject: [PATCH v7 1/4] x86: Remove MEMORY_NUM_TYPES and NO_HARDCODE_MEM_TYPE
Date: Sat,  7 Jan 2023 17:07:03 -0500
Message-Id: <dda75fd1ad51d041b7ff2fd934395040352fd6aa.1673123823.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1673123823.git.demi@invisiblethingslab.com>
References: <cover.1673123823.git.demi@invisiblethingslab.com>
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


