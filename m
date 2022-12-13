Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D12964BF6E
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 23:35:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461345.719503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Dri-0003x8-96; Tue, 13 Dec 2022 22:35:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461345.719503; Tue, 13 Dec 2022 22:35:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Dri-0003tu-3A; Tue, 13 Dec 2022 22:35:10 +0000
Received: by outflank-mailman (input) for mailman id 461345;
 Tue, 13 Dec 2022 22:35:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mJcE=4L=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p5DlR-000519-FP
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 22:28:41 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b930665-7b35-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 23:28:36 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 557AB3200921;
 Tue, 13 Dec 2022 17:28:34 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 13 Dec 2022 17:28:35 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Dec 2022 17:28:33 -0500 (EST)
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
X-Inumbo-ID: 7b930665-7b35-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1670970513; x=1671056913; bh=87eKmhvdtfrb1isW/t1MA2+ANFEQ1h0ZL33
	QPdjF+bA=; b=fYrqb9W2l1VBOPO7O/EYfNHg2sWG4WZjnXiC8OjDVfOyhUDsfEt
	fN5l+sGSUm8QtFmkNI4YmCQnBoUjSlVM6rMcgqFrodehqliYuvWtVU/69SywlDpm
	F0TdFWgaqtsIYaBy1gnFwRvJfbKSic94fvtZJR9AXuWITbpNvWdeRIuZ/G8KAQx0
	tCCRaXuD2uxQzeYR9xHzi8ob1sIOiSpdqJDrDgc1F7os5oJoP2L+s8jP9cRPloOn
	ktDdFd7BtL2HNlWumoJ/6gs1C/1jhFImHhrCjZ1ww6XT67lDsBTUxRGZTYVz/PXo
	9F3AW+pNxME+KHW2P+VATIuLeKuD5e2dbmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1670970513; x=1671056913; bh=87eKmhvdtfrb1
	isW/t1MA2+ANFEQ1h0ZL33QPdjF+bA=; b=A/uzdRVFDMh5HMBL1S7CcRd1MBWHG
	TjXVc3RF4uxPS/IoBphNrHjwXXXGSyCiomLvO4F6/+h0dLZgNxCYhhbH2j7wTD3Q
	9n8ALMFaRcguqg6CY7mL0u1znXzpbN7ZMRMMgZeuwCvfsdDiC/1Szb7SYmz23PSW
	kDXrkVDOlXQq0ZCOyvZVZv9PcwlqUbVAojPNf19V6dF5QQWv3sq0dQvGZj533qUs
	/uDXLg14AmMNM8a/NGDgpcWSmbaNPcxbcJAaizrtRXOPsH8C0Xdy9dfMyzRRBc3L
	3MvWGKA8dCLAO1GeE3piU2tdZwZY6x3wTHnRAmBonykqhdl1uG+xXlzUw==
X-ME-Sender: <xms:kfyYY_thb4-ia1XXJcA3n4gGixQzXW6R0IMwa2cAZhubN4A2U4rFTg>
    <xme:kfyYYwdWzmnWkRm2B1yUyEi2quHHS7RTn4uWj73pwm9FFuAOouxpeeW3I5okiyfUs
    li9d0Rq01VdQ4E>
X-ME-Received: <xmr:kfyYYyxD-cVrEhALXwSHya8aYfN2f6yFxc9dbGVffuUrw16NwELoSGzePCN22cE0WOFXNoLj5MYI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedugdekjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:kfyYY-ON7pYTUNkLiKqHpfxeuyFiRVR6Kmh5YZuhnsI9lJ0f_YAMdQ>
    <xmx:kfyYY_8flHq3sSArv9D3gttrni7qffGVE5HHyV18qGdM7DragJbHSg>
    <xmx:kfyYY-VVy2cbEvbQ_9qH_eTculd9X4v0Hu4dS4j64MpRUP5M1-PfFA>
    <xmx:kfyYY7ROb14R3CfYCzBdBtSxlwwPHN0Euf5dM-X2---43f24-1fNjQ>
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
Subject: [PATCH v2 11/14] x86: Derive XEN_MSR_PAT from its individual entries
Date: Tue, 13 Dec 2022 17:26:52 -0500
Message-Id: <5088d6bada42380948bcee333a3b347307888b17.1670948141.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <71482430c20a701b1d577e87dc72e7c2661e69de.1670948141.git.demi@invisiblethingslab.com>
References: <71482430c20a701b1d577e87dc72e7c2661e69de.1670948141.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This avoids it being a magic constant that is difficult for humans to
decode.  Use BUILD_BUG_ON to check that the old and new values are
identical.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 xen/arch/x86/include/asm/processor.h | 10 +++++++++-
 xen/arch/x86/mm.c                    |  6 ++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index 8e2816fae9b97bd4e153a30cc3802971fe0355af..9535b1f7f49d75e6853365e6109a33359c740f4f 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -96,7 +96,15 @@
  * Host IA32_CR_PAT value to cover all memory types.  This is not the default
  * MSR_PAT value, and is an ABI with PV guests.
  */
-#define XEN_MSR_PAT _AC(0x050100070406, ULL)
+#define XEN_MSR_PAT (X86_MT_WB  << 0x00 | \
+                     X86_MT_WT  << 0x08 | \
+                     X86_MT_UCM << 0x10 | \
+                     X86_MT_UC  << 0x18 | \
+                     X86_MT_WC  << 0x20 | \
+                     X86_MT_WP  << 0x28 | \
+                     X86_MT_UC  << 0x30 | \
+                     X86_MT_UC  << 0x38 | \
+                     0)
 
 #ifndef __ASSEMBLY__
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index b73cb29327ba49703673886d09d79f2f8928a6c0..a8def47aa3bf9770576c62a190032d45d63dd86e 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6355,6 +6355,12 @@ unsigned long get_upper_mfn_bound(void)
     return min(max_mfn, 1UL << (paddr_bits - PAGE_SHIFT)) - 1;
 }
 
+static void __init __maybe_unused build_assertions(void)
+{
+    BUILD_BUG_ON(XEN_MSR_PAT != 0x050100070406ULL &&
+                 "wrong XEN_MSR_PAT breaks PV guests");
+}
+
 /*
  * Local variables:
  * mode: C
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

