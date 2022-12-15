Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB4564E4DA
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 00:58:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463944.722262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5y7B-0001S7-56; Thu, 15 Dec 2022 23:58:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463944.722262; Thu, 15 Dec 2022 23:58:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5y7A-0001MF-VB; Thu, 15 Dec 2022 23:58:12 +0000
Received: by outflank-mailman (input) for mailman id 463944;
 Thu, 15 Dec 2022 23:58:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t+b5=4N=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p5y79-0001B1-R0
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 23:58:11 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5359ea9a-7cd4-11ed-8fd3-01056ac49cbb;
 Fri, 16 Dec 2022 00:58:10 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id E893A320090F;
 Thu, 15 Dec 2022 18:58:07 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 15 Dec 2022 18:58:08 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Dec 2022 18:58:06 -0500 (EST)
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
X-Inumbo-ID: 5359ea9a-7cd4-11ed-8fd3-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1671148687; x=1671235087; bh=MPXIPfWh31wWF0cQJY2faTDgZMXzFYEZsmL
	3eM786Dk=; b=pauSHHNvK/Q/hPmuJap7ddmTU5f9Yh3zrKxmoW3SawoHF75s6D8
	Zuw65GgqJrVjdOcRzXqefvuhxbcrTVz4+9Od6MBnSIGWEqm032t9oKj5I9YGHqTI
	igCXo37p802Y8KRxmx6UnmyPTadDIzSBrcZ4rS+mSCbNJ2g/OqofhfdRCrQVLrE7
	s8+BMsFgiGavRfmhBF8XhGIMCNPdXXQK0SxzVe3ue7cXpwa7d5uyQpmLsM2XICwX
	79vmAT3oS/520cV1Ih335Endh/A9jyCoNGrV2lQnzgcgL7dQldv+B072HgcZ6ZkQ
	lNIO25cjcj7to1iK0b+53ml7hYOjlJAOXiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1671148687; x=1671235087; bh=MPXIPfWh31wWF
	0cQJY2faTDgZMXzFYEZsmL3eM786Dk=; b=H6WVh52sc8Hi7smyYWnZwOd8I8SkA
	sgYbyEU/Fqu9TnSKPbaWUc9+VmB3UegWTtTglhK74DNvqKNs25exGEhQOVyZvNgh
	N89FTAkHm3j+4LhtqliJ3Q1PlciDslgEJwqBsf7zwAsU7MnswjvD203F4ewEmpvq
	RHrVDBvb0zcegsMnvaSegptGHNgDQhNWBU4fuyl/N1S95mHRX3RIeoYcBGAHnuWF
	OY2sHHue4pdmtH5YYZIFVwSbTkcKSWDQGHkqH2/fi82FeSzUl9F4Hkrj0PLBBpMZ
	KVP2gegBgWI1dh0YRtjTwVo2vzhkiITsxT8mlWD9qAkAzhIJUuK//Xn4A==
X-ME-Sender: <xms:j7SbY1n1tBv8HS1B6CmyB56Cp70s44H6HuCjPTgyfjYJqojx_ieHTw>
    <xme:j7SbYw2JfARs5t-70aDpg_NHbMKT5xrQW93A41QkcOfJ6KIvdJiqAyz5xji4zzMMW
    t0OTuJ8Z5FooYI>
X-ME-Received: <xmr:j7SbY7pghGFLkHTav9BCCXM_0n3maiFMJ-JQoohjnGYK1sZktl8wTqkGcL0k3rO_leOdYzsheT1G>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeigddugecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:j7SbY1m3nzCB0PClpbAL91jKqc8ZRJ7pSnyXAGQnyUHCMHgtV7cU4w>
    <xmx:j7SbYz3LCqN2E2BdjLI7cEpoiIqaM9_GlTRiI61V-ClduIXICiI7GQ>
    <xmx:j7SbY0vzU-EOQ0vSaFGCf49eAIkg6kdg7NuQ_dYQj9_XqvmW9HhVMA>
    <xmx:j7SbY8LrVJd7LoDCkfROeR2jS2ybSc0evuToplnCQevkpHri0sODJA>
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
Subject: [PATCH v4 02/10] x86/mm: Avoid hard-coding PAT in get_page_from_l1e()
Date: Thu, 15 Dec 2022 18:57:44 -0500
Message-Id: <8f0a2f4352bf6241e66f2fea1776d0c82a3c566d.1671139149.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671139149.git.demi@invisiblethingslab.com>
References: <cover.1671139149.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

get_page_from_l1e() relied on Xen's choice of PAT, which is brittle in
the face of future PAT changes.  Instead, compute the actual cacheability
used by the CPU and switch on that, as this will work no matter what PAT
Xen uses.

No functional change intended.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
Changes since v3:
- Compute and use the actual cacheability as seen by the processor.

Changes since v2:
- Improve commit message.
---
 xen/arch/x86/include/asm/processor.h |  8 ++++++++
 xen/arch/x86/mm.c                    | 19 +++++++++++++------
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index 8e2816fae9b97bd4e153a30cc3802971fe0355af..c3205ed9e10c1a57d23c5ecead66bebd82d87d06 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -100,6 +100,14 @@
 
 #ifndef __ASSEMBLY__
 
+/* Convert from PAT/PCD/PWT embedded in PTE flags to actual cacheability value */
+static inline unsigned int pte_flags_to_cacheability(unsigned int flags)
+{
+    unsigned int pat_shift = ((flags & _PAGE_PAT) >> 2) |
+                             (flags & (_PAGE_PCD|_PAGE_PWT));
+    return 0xFF & (XEN_MSR_PAT >> pat_shift);
+}
+
 struct domain;
 struct vcpu;
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 78b1972e4170cacccc9c37c6e64e76e66a7da87f..802073a01c5cf4dc3cf1d58d28ea4d4e9e8149c7 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -959,15 +959,22 @@ get_page_from_l1e(
             flip = _PAGE_RW;
         }
 
-        switch ( l1f & PAGE_CACHE_ATTRS )
+        /* Force cacheable memtypes to UC */
+        switch ( pte_flags_to_cacheability(l1f) )
         {
-        case 0: /* WB */
-            flip |= _PAGE_PWT | _PAGE_PCD;
+        case X86_MT_UC:
+        case X86_MT_UCM:
+        case X86_MT_WC:
+            /* not cached */
             break;
-        case _PAGE_PWT: /* WT */
-        case _PAGE_PWT | _PAGE_PAT: /* WP */
-            flip |= _PAGE_PCD | (l1f & _PAGE_PAT);
+        case X86_MT_WB:
+        case X86_MT_WT:
+        case X86_MT_WP:
+            /* cacheable, force to UC */
+            flip |= (l1f & PAGE_CACHE_ATTRS) ^ _PAGE_UC;
             break;
+        default:
+            BUG();
         }
 
         return flip;
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

