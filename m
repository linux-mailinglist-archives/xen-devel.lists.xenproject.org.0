Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 134EA64D31B
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 00:15:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462740.720952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5axs-0006Rz-Jw; Wed, 14 Dec 2022 23:15:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462740.720952; Wed, 14 Dec 2022 23:15:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5axs-0006Py-Dt; Wed, 14 Dec 2022 23:15:04 +0000
Received: by outflank-mailman (input) for mailman id 462740;
 Wed, 14 Dec 2022 23:15:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IksU=4M=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p5avw-0000Gw-0C
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 23:13:04 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da2c3ab2-7c04-11ed-91b6-6bf2151ebd3b;
 Thu, 15 Dec 2022 00:13:01 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id DFD67320055E;
 Wed, 14 Dec 2022 18:12:58 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 14 Dec 2022 18:12:59 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Dec 2022 18:12:57 -0500 (EST)
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
X-Inumbo-ID: da2c3ab2-7c04-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1671059578; x=1671145978; bh=lFRjAyz2V8QJ7yU1YRzmTT1WULJJ6rEk/i2
	CB/Rdt1o=; b=jvMFriIeUh9v5EFmbRiCq39BgKcp7hyqpBmeUxI7IXBOWIMRWBz
	Aa5EbEaMP8Tn+eH8liPyFRBrsuZdSV9o84JiQwa9B8ESttOQujhYflBvtO6oLf0R
	7XNI7gTVfygZyZ2Qug4IP4adVYnsLuvoq5njy3aOszrr6sc12u42WTP2XdTcP93n
	ZBKgTIl9uhoemRb6RHXoE/Q0BPVgYsO1dPx8qkRqRLwAJAl6TuibYSDTlahnawhh
	stQNSYT6X+soi+BQ1vDJ0nx5iAecjOLPwAG/iKNE3/zIdiLL6BjgEQymN9vBP7gA
	VBWPSQjvmUZ5Q913txQ5MY+VAm/fXpF14zg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1671059578; x=1671145978; bh=lFRjAyz2V8QJ7
	yU1YRzmTT1WULJJ6rEk/i2CB/Rdt1o=; b=ivrcwgHbGcqD0QcU7FgPjKq3L/ois
	3yM4zwwazX6ivrSnQXYw8GQ7F70t/tL0R9D7Kzi0eP7zkneSoGAzFZpgg2PyvAKN
	KOsw0IRx1nczh6d1FekAz2iVF/oXDqE5cjqJ9I5RhViFQc9dxRHGky6Z7IxGWUZM
	40ulTVU6pQp5jwh7aHIb9dqcuOStx7ItQwUpoXXw7EbC28JNWPHhX1f8HNuS7MtP
	ZKMR+mi9VOSlKXitBXM7Ie1vzHAZvjnaeqQDBW2zaQxAkc2saNkxZP5dsUF4LCgv
	sBItvhC1JCd776nn5A1GwIZko1QndQMB26E8x/6AAV1mPgVqY5NiRr+pQ==
X-ME-Sender: <xms:eliaY40GoUV8doyrvOQcY8_thIr9y4OV3iA9Z3oprdLq1juPnF4H9A>
    <xme:eliaYzGUZOnl-x_AvQG3I8L-ol1S3y0GKxuLRsWAFjzSaA690sPd9lBCxuYgUmwWw
    Y1uOtFpU7_AVGw>
X-ME-Received: <xmr:eliaYw53g889ffoyTnu7YXGkH-ykQpOcFOoU-SumnbQ_7aynaeidckR51r3VgIpjXwS5gQZdianL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeggddtgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:eliaYx2xu6F3Ljn4P03zv7ZzJiFlePVoW5REfu50xDOf-nkZBCGymw>
    <xmx:eliaY7E7CidpLOOnYz14cTUp54Hfq9Ntaf8-6dJXnE8F9N9wrKxndA>
    <xmx:eliaY68MD9fFRFvsBTUjAH9Z71z8XAnxr2JOs9xDJMRLunMLyTz3xA>
    <xmx:eliaYxY_ViHBgBd21buNzqOJlUuZU9p2_Sufv5joBmk2Q3HoZjCRIQ>
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
Subject: [PATCH v3 08/12] x86: Remove MEMORY_NUM_TYPES and NO_HARDCODE_MEM_TYPE
Date: Wed, 14 Dec 2022 18:11:58 -0500
Message-Id: <1de1a7456e4501bc67faa8ee17af76ca1688781e.1671057808.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671057808.git.demi@invisiblethingslab.com>
References: <cover.1671057808.git.demi@invisiblethingslab.com>
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


