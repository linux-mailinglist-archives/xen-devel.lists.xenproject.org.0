Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BF464E4E2
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 00:58:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463964.722346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5y7U-0004gb-JT; Thu, 15 Dec 2022 23:58:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463964.722346; Thu, 15 Dec 2022 23:58:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5y7U-0004e8-FE; Thu, 15 Dec 2022 23:58:32 +0000
Received: by outflank-mailman (input) for mailman id 463964;
 Thu, 15 Dec 2022 23:58:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t+b5=4N=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p5y7T-0001B1-2R
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 23:58:31 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e9e6898-7cd4-11ed-8fd3-01056ac49cbb;
 Fri, 16 Dec 2022 00:58:29 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 8C232320090F;
 Thu, 15 Dec 2022 18:58:26 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 15 Dec 2022 18:58:27 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Dec 2022 18:58:25 -0500 (EST)
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
X-Inumbo-ID: 5e9e6898-7cd4-11ed-8fd3-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1671148706; x=1671235106; bh=I3xtknO0zKAM1mAB5LApuppxGZmwfI++tAq
	sarKIiGg=; b=OO7yQ2Ior/nA/NIgaEsMNk3mj0DtE2w1/iCMl6BF0Joat4KCjNd
	egcxDCaUuVA1942dAgUp6koosDEo1dWqCmRQiQSda2CrUSyt9/guGXgQDma33Bmw
	Oy4Un03NM+Izlrb5rNBAeKj+SVm+WY8JIWcroLOxR1Tp7c5muq4MsT7d3uC2K1zq
	oDpWEM+aBjZeO1X/qB8N5EvBxYjbQWxggwOHowNAz+PgDENBV+2IO0PAuixEFcXY
	ZywndfaSf0CSHyTwd5gCo9vCuyHRyqVTTzwNCwFD3yrDlEWw88Jn3B8XtsKCHoTG
	AKOqLPnVQ7IQqF3T3MRC7NvkQQ7tDrqB/Pg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1671148706; x=1671235106; bh=I3xtknO0zKAM1
	mAB5LApuppxGZmwfI++tAqsarKIiGg=; b=UOBSp19teokqrfC4dYr5MWd7yi1YZ
	67FvLIaAtlrMPL8lfG/HNbZd2tdeLbbpg/UxVWK7u8uqNvomrDvGCxqT6KCsjmhp
	XQz9GpZ6dHk2UJZV+IXjt1ImJt1QRS/oTOq/qUkbA2J2frWGaX0wjB0nvGqJfE1j
	cIHYruraH3EbAZ906FZw+OgXHMCQYZfFO40r15cxSa42Ll+y5WPxQ+T95zwtAXnJ
	ad94+9ya0OnLiZvGVsV4bPrfVM1CyJxtfXBItXBOzbs9aQLmPsbRUmG3A6lpu8vt
	xhIipNglI1FOgD2nQ256wYPkhCyn43ob+GyuUWytKqeyfk42g04KduBxQ==
X-ME-Sender: <xms:orSbY2Wzb99ChLzt8qJnH1X82AiJbwB2yX0qF0DzMMIjxjsgFUzgMw>
    <xme:orSbYyk8zrymhKDS8hK-4S65z9Hlt7sT9mwBjsbLBNAnQWS7oGoUenVUhw-nxNUb9
    NiJE6KXT9nl9as>
X-ME-Received: <xmr:orSbY6bLCKnRtlxRzfMZ1Zuw4ejIeJpsiUOOwWatv0dyXa8jScVhoZpn4YxGm3--Sds8isEa3Xtd>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeigddugecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedvnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:orSbY9VFodXt0vEP1aWxe4SHleNjAdLgeONWDqTuUjQI9tQdQg1tHw>
    <xmx:orSbYwneBy3eWnSHe3ITDjo80S2zohKiXlr2bTf2tvl8QTeWwC1vGg>
    <xmx:orSbYyc8CD3ql2euXkk3vPapqMDbCYNny8SqFsy2PzrQe2IKL-ZnxA>
    <xmx:orSbY67pubvQIVnd_EeLbH-MOgiuYW46Jq57_BpklBu6CS4qQE8VEg>
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
Subject: [PATCH v4 10/10] x86: Use Linux's PAT
Date: Thu, 15 Dec 2022 18:57:52 -0500
Message-Id: <4199a62efcfb0b648ebb006340623500e2b8d200.1671139149.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671139149.git.demi@invisiblethingslab.com>
References: <cover.1671139149.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is purely for testing, to see if it works around a bug in i915.  It
is not intended to be merged.

NOT-signed-off-by: DO NOT MERGE
---
 xen/arch/x86/include/asm/page.h      |  4 ++--
 xen/arch/x86/include/asm/processor.h | 10 +++++-----
 xen/arch/x86/mm.c                    |  5 -----
 3 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/include/asm/page.h b/xen/arch/x86/include/asm/page.h
index b585235d064a567082582c8e92a4e8283fd949ca..ab9b46f1d0901e50a83fd035ff28d1bda0b781a2 100644
--- a/xen/arch/x86/include/asm/page.h
+++ b/xen/arch/x86/include/asm/page.h
@@ -333,11 +333,11 @@ void efi_update_l4_pgtable(unsigned int l4idx, l4_pgentry_t);
 
 /* Memory types, encoded under Xen's choice of MSR_PAT. */
 #define _PAGE_WB         (                                0)
-#define _PAGE_WT         (                        _PAGE_PWT)
+#define _PAGE_WC         (                        _PAGE_PWT)
 #define _PAGE_UCM        (            _PAGE_PCD            )
 #define _PAGE_UC         (            _PAGE_PCD | _PAGE_PWT)
-#define _PAGE_WC         (_PAGE_PAT                        )
 #define _PAGE_WP         (_PAGE_PAT |             _PAGE_PWT)
+#define _PAGE_WT         (_PAGE_PAT | _PAGE_PCD | _PAGE_PWT)
 
 /*
  * Debug option: Ensure that granted mappings are not implicitly unmapped.
diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index ed71c9c975d56687eb126ec4ca7b271788e5f1d8..5959b0da8da98695bfe25cc521d772e541803622 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -94,16 +94,16 @@
 
 /*
  * Host IA32_CR_PAT value to cover all memory types.  This is not the default
- * MSR_PAT value, and is an ABI with PV guests.
+ * MSR_PAT value, and is needed by the Linux i915 driver.
  */
 #define XEN_MSR_PAT ((_AC(X86_MT_WB,  ULL) << 0x00) | \
-                     (_AC(X86_MT_WT,  ULL) << 0x08) | \
+                     (_AC(X86_MT_WC,  ULL) << 0x08) | \
                      (_AC(X86_MT_UCM, ULL) << 0x10) | \
                      (_AC(X86_MT_UC,  ULL) << 0x18) | \
-                     (_AC(X86_MT_WC,  ULL) << 0x20) | \
+                     (_AC(X86_MT_WB,  ULL) << 0x20) | \
                      (_AC(X86_MT_WP,  ULL) << 0x28) | \
-                     (_AC(X86_MT_UC,  ULL) << 0x30) | \
-                     (_AC(X86_MT_UC,  ULL) << 0x38))
+                     (_AC(X86_MT_UCM, ULL) << 0x30) | \
+                     (_AC(X86_MT_WT,  ULL) << 0x38))
 
 #ifndef __ASSEMBLY__
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 80b767dfe3d1797198a08f216eb525503fe31771..d0dc033a2ce63ad3d261ce3ec59f292dc051cb6d 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6382,11 +6382,6 @@ unsigned long get_upper_mfn_bound(void)
 
 static void __init __maybe_unused build_assertions(void)
 {
-    /*
-     * If this trips, live migration of PV guests to and from this Xen is
-     * broken.
-     */
-    BUILD_BUG_ON(XEN_MSR_PAT != 0x050100070406ULL);
     /* A bunch of static assertions to check that the XEN_MSR_PAT is valid
      * and consistent with the _PAGE_* macros */
     BUILD_BUG_ON(_PAGE_WB && "Linux requires _PAGE_WB to be 0");
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

