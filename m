Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 235C465178A
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 02:10:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466418.725386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7R9d-00082M-Mo; Tue, 20 Dec 2022 01:10:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466418.725386; Tue, 20 Dec 2022 01:10:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7R9d-0007xX-9D; Tue, 20 Dec 2022 01:10:49 +0000
Received: by outflank-mailman (input) for mailman id 466418;
 Tue, 20 Dec 2022 01:10:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tFeQ=4S=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p7R9b-0004T7-MT
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 01:10:47 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2163f3cf-8003-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 02:10:46 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 03E093200923;
 Mon, 19 Dec 2022 20:10:43 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 19 Dec 2022 20:10:44 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Dec 2022 20:10:42 -0500 (EST)
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
X-Inumbo-ID: 2163f3cf-8003-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1671498643; x=1671585043; bh=vPoqzj6g32+lW3ulAao0CxzhFnjnkx9j+MP
	o3++8UOA=; b=m1u8GR2Gkl9J3oa5GZw3nkVQ1u7902bz4GwiPsaorTuSZs/mC/6
	DdPB1s1TlopFgJ/GFndd8iTEC8mbyom+8TxEs75W/zjxBoZAkuMvCV1qr3KhkrhY
	TFe2KIeDYv2WyPKElQYeM0tHV8oHtUXzRiEcp3ZiY4NZ6JN6rIQsIfOdcVKHNBmO
	ntSkbco6oLEFZPmnsC2izuUdDQzu59Nj06afRh8UFwTPQzHoM5lhVNqVl4qs8KF8
	JC9DfI1AMj5ROo07eWSKcFLeDVYpKDqQ8ouhXamteDgGwieMI6uvJfYPf0tm2sL7
	frOMK4UcexKEqw9LXwRJMuBv2A05guerrnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1671498643; x=1671585043; bh=vPoqzj6g32+lW
	3ulAao0CxzhFnjnkx9j+MPo3++8UOA=; b=RG10dTwbaW7TutpHtS5Mwcdb4K29b
	K8Kjz1bcM3/9tzZ6CFtjShWh9W8xgUWQs/Lei07XnvIqfF47CZ0VafxMQfJn6Ad7
	W85aF0ytTSBx7OPlwHVqXi/PX67yn8quQvqS8/L5Y824haYi0hUNa8yCR+Ey85T4
	ZaTiARx0RvWjCxmGvYYfqsduK7LqHToasXCPWRr5/9DrRsp7xpqT6tp15NA1N42c
	eU3G7EzTaFI8GQcvPgIaNsA1f/eQqPyzr13b2to3eJfeVXbG0dXDyOIgHGkRf3d5
	WESJMYvI8YyRQ8GUoDkctWLgDQ9Rf4qSXesP/j3gNzNPcy1ia6fy1H6jA==
X-ME-Sender: <xms:kwuhY-uek8EHjYuSYYrlJcQl4v9p_1_cDKks6sNd7BA-2tu6l7pYbA>
    <xme:kwuhYzfoO5_NTzGcKm75sRAIYbOXg2tbXEbnZxOyN6uI8qEO2H2JLwkThB1cX18gq
    p0wmmesv1o5ngs>
X-ME-Received: <xmr:kwuhY5yhN1sjHOZkfZEPq7Q34ZZ7UzoqswQKtDp8nAc9Scwt8yVORCyWBCByuuT6h96mmACAYsw1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeeggdefudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpeegnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:kwuhY5NjlVpg-xmk70FEQ19-I2pKUfQoBQLMz3vbbtNMDbiKa9x1nA>
    <xmx:kwuhY-872Ur2eqERXRItDqLE4nSbHPrMi9dNnaFTe-hKzeYq-JdugQ>
    <xmx:kwuhYxXbkQ2x40Tl5dqA91Rp7WfgxqgbYyAmaIGDOv4ha6m3vpvVmw>
    <xmx:kwuhYyQpworOn7WNsAMO9yfhMyEkcarf3Vj-mK5gkA8hrKJ4wM9Vrw>
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
Subject: [PATCH v5 10/10] x86: Use Linux's PAT
Date: Mon, 19 Dec 2022 20:07:12 -0500
Message-Id: <17b2c9baa3a561919354c2fcb77c0873df9715b7.1671497984.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671497984.git.demi@invisiblethingslab.com>
References: <cover.1671497984.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is purely for testing, to see if it works around a bug in i915.  It
is not intended to be merged.

NOT-signed-off-by: DO NOT MERGE
---
 xen/arch/x86/include/asm/page.h      |  4 ++--
 xen/arch/x86/include/asm/processor.h | 10 +++++-----
 xen/arch/x86/mm.c                    |  8 --------
 3 files changed, 7 insertions(+), 15 deletions(-)

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
index 60b902060914584957db8afa5c7c1e6abdad4d13..3993d5638626f0948bb7ac8192d2eda187eb1bdb 100644
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
index 69ce597c7cd5283ae4b5f3bc0a6dfa0bb3228d3d..c536f7807a418c160366c22b6c4f937a5023f14b 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6387,14 +6387,6 @@ unsigned long get_upper_mfn_bound(void)
  */
 static void __init __maybe_unused build_assertions(void)
 {
-    /*
-     * If this trips, any guest that blindly rely on the public API in xen.h
-     * (instead of reading the PAT from Xen, as Linux 3.19+ does) will be
-     * broken.  Furthermore, live migration of PV guests between Xen versions
-     * using different PATs will not work.
-     */
-    BUILD_BUG_ON(XEN_MSR_PAT != 0x050100070406ULL);
-
     /*
      * _PAGE_WB must be zero for several reasons, not least because Linux
      * assumes it.
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

