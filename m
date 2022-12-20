Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D559651780
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 02:10:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466404.725342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7R9U-0006HA-Be; Tue, 20 Dec 2022 01:10:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466404.725342; Tue, 20 Dec 2022 01:10:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7R9U-0006DZ-7h; Tue, 20 Dec 2022 01:10:40 +0000
Received: by outflank-mailman (input) for mailman id 466404;
 Tue, 20 Dec 2022 01:10:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tFeQ=4S=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p7R9S-0004iO-9d
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 01:10:38 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c000886-8003-11ed-91b6-6bf2151ebd3b;
 Tue, 20 Dec 2022 02:10:37 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id E4B963200920;
 Mon, 19 Dec 2022 20:10:34 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 19 Dec 2022 20:10:35 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Dec 2022 20:10:33 -0500 (EST)
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
X-Inumbo-ID: 1c000886-8003-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1671498634; x=1671585034; bh=ZFVd1zipbDmyuM5p7z7I6kIgLQvhgJ+UDrK
	byLqFiao=; b=uIn3JRZh+wE8wl0bAnlNSxLWynzbB/S5/vfgKn89TTu7J428rcb
	r7jYay3VCc3p9h909ZWHe1c26nbsrLeM3rIqHOiWlhhPSQDzvcVEo5/9eajKe+e8
	0vV3nqh5WNDr7EV7h4jfGyw0eqfgGh4z4Y9ScQ4wW3vC7MLT896aFTWCzRwscdf3
	nIDJwNxzivuhpAcz6fPaqauhlsE0qxe9xZ9LBrw6DfLwmsht/BQtmah08WmSSn1W
	yUv0tlV40PRJbfjZy1SWUuEFthWSSZXTBw5Zc2lAPks3wPWRkbO1onaszAH3XEoe
	dhBmuj+rxMg+NQrzFPulsznNoa+voZ7PCbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1671498634; x=1671585034; bh=ZFVd1zipbDmyu
	M5p7z7I6kIgLQvhgJ+UDrKbyLqFiao=; b=DDpCTCT5d0Acst/Kd2JqpA8/+2WKO
	mPKwax/l8HA7rkaiv3Gb/UgU0oO0ctNmsmo0vMyrS4NX6z8Qjridl1sOomqozglf
	h5JopvMDpH/myu32XMbQIh16qYXxHrxNsybzWn8JIRByZ8uZXPx49uWx6pZukvSM
	ip87LWtoKjUP5dMdMkHDF+SJpO07eB6cfqteCQRz95t8MSyzSzxo7gMQrRd+QRCl
	fXf3JbiPuEOnU2+dtjCjU74dmfBmVnweLnhi1qtY3IpFclfSrn5VuWRgeI6aOwg/
	kPXM0eqsHn9lSxd/0flVR6UDrXwTKEvOixqBnmk0O+uXGKd9RMlb/hPGQ==
X-ME-Sender: <xms:iguhY8MQfd_l0p-4IUGWRyfRW80d2J48aGV02YIa14_PqlQ5mw1rTw>
    <xme:iguhYy9xCVuqJrd5mxjZJLjHuRXRl0xEJfXnx8wdJ_rTZGkg1pta-hHfQHIHUihUE
    bEjWdZYcTk8WVo>
X-ME-Received: <xmr:iguhYzTDaU-a1yBTZ0kkfsLmeUnNHctkhnmjxI5T31xQfe155gDX-ZEqmg1UAHD5gg8T7F5bwdRD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeeggdefvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:iguhY0tBPCaZANuR59cL4EJn-OcaWL2OhxHoj1GmMvJ5HBUTMNLwig>
    <xmx:iguhY0fzuOG6yfiaZTm6uww5_Ah1mdLYN-EpCaLkf_fHYLtr8RIWew>
    <xmx:iguhY437q57RMB35dq9wfl9LqOuwwnEpLkFutdYfsAp--T8Jb-Tztg>
    <xmx:iguhY7zgnyiTpSzbhccJJcQRT98CPp4QeQNemlCS7KZqxEWc1YJdMQ>
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
Subject: [PATCH v5 06/10] x86: Remove MEMORY_NUM_TYPES and NO_HARDCODE_MEM_TYPE
Date: Mon, 19 Dec 2022 20:07:08 -0500
Message-Id: <8516b1a8da8ea536e65653e998e7c79d98cb53b4.1671497984.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671497984.git.demi@invisiblethingslab.com>
References: <cover.1671497984.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change intended.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
This patch is optional.  Subsequent patches should not depend on it.

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

