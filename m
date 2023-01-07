Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C936611F6
	for <lists+xen-devel@lfdr.de>; Sat,  7 Jan 2023 23:08:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473027.733523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEHLb-0000DE-Tk; Sat, 07 Jan 2023 22:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473027.733523; Sat, 07 Jan 2023 22:07:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEHLb-00009S-QX; Sat, 07 Jan 2023 22:07:27 +0000
Received: by outflank-mailman (input) for mailman id 473027;
 Sat, 07 Jan 2023 22:07:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TYdO=5E=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pEHLZ-0007Zv-9R
 for xen-devel@lists.xenproject.org; Sat, 07 Jan 2023 22:07:25 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8363c73-8ed7-11ed-91b6-6bf2151ebd3b;
 Sat, 07 Jan 2023 23:07:21 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id C4D2E5C00A0;
 Sat,  7 Jan 2023 17:07:20 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Sat, 07 Jan 2023 17:07:20 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Jan 2023 17:07:19 -0500 (EST)
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
X-Inumbo-ID: a8363c73-8ed7-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1673129240; x=1673215640; bh=POJFkOQt3y
	GloJZrLhIV9nkjsTfKozCDcDniLFyd4nI=; b=Oifh/nCYWga5HbxTHiQazgkc/l
	33df31xXEvqm7IuHvb04cpwFAHVo3eY36wRdCX1Xov2Qt0xcoR+eTIz6f+u9Rqs0
	uXeW9FDccKhntA3lYBsF/hdozXlbugTNJdcozNUBMEDebUqA/f9dE99EYMMJy3c+
	cPObnEE5Y6QHgludXMJvmNCgag7OJLgPe7xxb2t9f30kZTXPf2m3aeGTxL3dpw0V
	XUKGJErAu8nNMsPf/ZHQZonny8a34/RfyDOaQqbvkCNI/IsJEVLDfW2hbiqhu3v3
	kKtXIRO1uoV1ouOEB8PrAkh2cvbSwoXMauUsxRUst3Z8C0QqrRDhjAGCJo0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1673129240; x=
	1673215640; bh=POJFkOQt3yGloJZrLhIV9nkjsTfKozCDcDniLFyd4nI=; b=e
	++Ev6cFb5oNXBg6Delfd4mJ6yWRBP9oYyPFvo+/UXkxif9fa0AJuMT2yrKRG7xSs
	iXV35wznh1y5awDMHnO8nt1KIJ4ooZg4LBtH3SxfdUZQQBbH8aZ8qrFTclW/0QK3
	L7UkIt5nfBvZrPWw0FcHcFxShKWJ47dJpaM0BZlqECYlw2FqiAmvqkl4X9Pn2Pvx
	6ZSSm163HjRVJZ6MmiIWtZ8cWhS5ssONXl8bQUCWs1t1+iTk9ti+9q/xtu3p3btS
	3IH+jzSkMLCJPKa4/ctTLfPTIge7/uTFwdPVzoCJXZmozzju1SofvKsNaXIQqs+T
	3fKZvlwjY+CQM+p0NE7YQ==
X-ME-Sender: <xms:GO25YyxdBjS1rRYb3hIKf2rOLsN3ecWkixfolkijTpWLc91lcEYxAA>
    <xme:GO25Y-RP8TLHCnJpvlBiqy6V806Zy2mV_YOClRZ9osg75XUSiNyPiMcXgzeO-MZqf
    xdqgr6gR4RogTg>
X-ME-Received: <xmr:GO25Y0U0FtQEkOMlcdq1g7eJtspL6CEgCFA1dOvPHpJFGgJPhhm1qIyBIWj4g3GOHJwIYzrZQUpd>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrkedvgdduheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeludekleeljeekveekfeeghfff
    gedvieegleeigeejffefieeviedvjeegveetieenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhm
X-ME-Proxy: <xmx:GO25Y4ir6Yo4ScMFBjuSspTQcGQWBqomnbpnQXlq6PJD0_45UKJ5XA>
    <xmx:GO25Y0D9PWONspNsDwPSp825txx1nSTPtyPOl93Z4fYEJ5jf77SfNw>
    <xmx:GO25Y5Lw0moouHzfhRsPxJujV7LC3OlW_CUc5uhBT7vnS9tiBeHSnQ>
    <xmx:GO25Yw24_syCrPlN6zABNgNVxDaNi8s1ZRrqL1uH8Gwi6vLctdr7tg>
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
Subject: [PATCH v7 4/4] x86: Allow using Linux's PAT
Date: Sat,  7 Jan 2023 17:07:06 -0500
Message-Id: <9fd0360dd914d93dab357d16b46b4290e6119d30.1673123823.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1673123823.git.demi@invisiblethingslab.com>
References: <cover.1673123823.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Due to a hardware errata, Intel integrated GPUs are incompatible with
Xen's PAT.  Using Linux's PAT is a workaround for this flaw.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 xen/arch/x86/Kconfig                 | 33 ++++++++++++++++++++++++++++
 xen/arch/x86/include/asm/page.h      | 12 ++++++++++
 xen/arch/x86/include/asm/processor.h | 15 +++++++++++++
 xen/arch/x86/mm.c                    |  2 ++
 4 files changed, 62 insertions(+)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 6a7825f4ba3c98e0496415123fde79ee62f771fa..18efccedfd08873cd169a54825b0ba4256a12942 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -227,6 +227,39 @@ config XEN_ALIGN_2M
 
 endchoice
 
+config LINUX_PAT
+	bool "Use Linux's PAT instead of Xen's default"
+	help
+	  Use Linux's Page Attribute Table instead of the default Xen value.
+
+	  The Page Attribute Table (PAT) maps three bits in the page table entry
+	  to the actual cacheability used by the processor.  Many Intel
+	  integrated GPUs have errata (bugs) that cause CPU access to GPU memory
+	  to ignore the topmost bit.  When using Xen's default PAT, this results
+	  in caches not being flushed and incorrect images being displayed.  The
+	  default PAT used by Linux does not cause this problem.
+
+	  If you say Y here, you will be able to use Intel integrated GPUs that
+	  are attached to your Linux dom0 or other Linux PV guests.  However,
+	  you will not be able to use non-Linux OSs in dom0, and attaching a PCI
+	  device to a non-Linux PV guest will result in unpredictable guest
+	  behavior.  If you say N here, you will be able to use a non-Linux
+	  dom0, and will be able to attach PCI devices to non-Linux PV guests.
+
+	  Note that saving a PV guest with an assigned PCI device on a machine
+	  with one PAT and restoring it on a machine with a different PAT won't
+	  work: the resulting guest may boot and even appear to work, but caches
+	  will not be flushed when needed, with unpredictable results.  HVM
+	  (including PVH and PVHVM) guests and guests without assigned PCI
+	  devices do not care what PAT Xen uses, and migration (even live)
+	  between hypervisors with different PATs will work fine.  Guests using
+	  PV Shim care about the PAT used by the PV Shim firmware, not the
+	  host’s PAT.  Also, non-default PAT values are incompatible with the
+	  (deprecated) qemu-traditional stubdomain.
+
+	  Say Y if you are building a hypervisor for a Linux distribution that
+	  supports Intel iGPUs.  Say N otherwise.
+
 config X2APIC_PHYSICAL
 	bool "x2APIC Physical Destination mode"
 	help
diff --git a/xen/arch/x86/include/asm/page.h b/xen/arch/x86/include/asm/page.h
index c7d77ab2901aa5bdb03a719af810c6f8d8ba9d4e..03839eb2b78517332663daad2089677d7000852c 100644
--- a/xen/arch/x86/include/asm/page.h
+++ b/xen/arch/x86/include/asm/page.h
@@ -331,6 +331,7 @@ void efi_update_l4_pgtable(unsigned int l4idx, l4_pgentry_t);
 
 #define PAGE_CACHE_ATTRS (_PAGE_PAT | _PAGE_PCD | _PAGE_PWT)
 
+#ifndef CONFIG_LINUX_PAT
 /* Memory types, encoded under Xen's choice of MSR_PAT. */
 #define _PAGE_WB         (                                0)
 #define _PAGE_WT         (                        _PAGE_PWT)
@@ -340,6 +341,17 @@ void efi_update_l4_pgtable(unsigned int l4idx, l4_pgentry_t);
 #define _PAGE_WP         (_PAGE_PAT |             _PAGE_PWT)
 #define _PAGE_RSVD_1     (_PAGE_PAT | _PAGE_PCD            )
 #define _PAGE_RSVD_2     (_PAGE_PAT | _PAGE_PCD | _PAGE_PWT)
+#else
+/* Memory types, encoded under Linux's choice of MSR_PAT. */
+#define _PAGE_WB         (                                0)
+#define _PAGE_WC         (                        _PAGE_PWT)
+#define _PAGE_UCM        (            _PAGE_PCD            )
+#define _PAGE_UC         (            _PAGE_PCD | _PAGE_PWT)
+#define _PAGE_RSVD_1     (_PAGE_PAT                        )
+#define _PAGE_WP         (_PAGE_PAT |             _PAGE_PWT)
+#define _PAGE_RSVD_2     (_PAGE_PAT | _PAGE_PCD            )
+#define _PAGE_WT         (_PAGE_PAT | _PAGE_PCD | _PAGE_PWT)
+#endif
 
 /*
  * Debug option: Ensure that granted mappings are not implicitly unmapped.
diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index 60b902060914584957db8afa5c7c1e6abdad4d13..413b59ab284990cca192fa1dc44b437f58bd282f 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -92,6 +92,20 @@
                           X86_EFLAGS_NT|X86_EFLAGS_DF|X86_EFLAGS_IF|    \
                           X86_EFLAGS_TF)
 
+#ifdef CONFIG_LINUX_PAT
+/*
+ * Host IA32_CR_PAT value to cover all memory types.  This is not the default
+ * MSR_PAT value, but is the same as the one used by Linux.
+ */
+#define XEN_MSR_PAT ((_AC(X86_MT_WB,  ULL) << 0x00) | \
+                     (_AC(X86_MT_WC,  ULL) << 0x08) | \
+                     (_AC(X86_MT_UCM, ULL) << 0x10) | \
+                     (_AC(X86_MT_UC,  ULL) << 0x18) | \
+                     (_AC(X86_MT_WB,  ULL) << 0x20) | \
+                     (_AC(X86_MT_WP,  ULL) << 0x28) | \
+                     (_AC(X86_MT_UCM, ULL) << 0x30) | \
+                     (_AC(X86_MT_WT,  ULL) << 0x38))
+#else
 /*
  * Host IA32_CR_PAT value to cover all memory types.  This is not the default
  * MSR_PAT value, and is an ABI with PV guests.
@@ -104,6 +118,7 @@
                      (_AC(X86_MT_WP,  ULL) << 0x28) | \
                      (_AC(X86_MT_UC,  ULL) << 0x30) | \
                      (_AC(X86_MT_UC,  ULL) << 0x38))
+#endif
 
 #ifndef __ASSEMBLY__
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index d69e9bea6c30bc782ab4c331f42502f6e61a028a..042c1875a02092a3f19c293003ef12209d88a450 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6407,6 +6407,7 @@ unsigned long get_upper_mfn_bound(void)
 
 static void __init __maybe_unused build_assertions(void)
 {
+#ifndef CONFIG_LINUX_PAT
     /*
      * If this trips, any guests that blindly rely on the public API in xen.h
      * (instead of reading the PAT from Xen, as Linux 3.19+ does) will be
@@ -6414,6 +6415,7 @@ static void __init __maybe_unused build_assertions(void)
      * using different PATs will not work.
      */
     BUILD_BUG_ON(XEN_MSR_PAT != 0x050100070406ULL);
+#endif
 
     /*
      * _PAGE_WB must be zero.  Linux PV guests assume that _PAGE_WB will be
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


