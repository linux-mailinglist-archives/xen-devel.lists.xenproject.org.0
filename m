Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBF28B3EB3
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 19:56:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712995.1113937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Pn4-00052h-F0; Fri, 26 Apr 2024 17:55:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712995.1113937; Fri, 26 Apr 2024 17:55:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Pn4-00050J-CA; Fri, 26 Apr 2024 17:55:18 +0000
Received: by outflank-mailman (input) for mailman id 712995;
 Fri, 26 Apr 2024 17:55:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/r3b=L7=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s0Pn3-0004Xj-1L
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 17:55:17 +0000
Received: from wfhigh5-smtp.messagingengine.com
 (wfhigh5-smtp.messagingengine.com [64.147.123.156])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22cd8763-03f6-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 19:55:16 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailfhigh.west.internal (Postfix) with ESMTP id 6107A1800120;
 Fri, 26 Apr 2024 13:55:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 26 Apr 2024 13:55:14 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Apr 2024 13:55:12 -0400 (EDT)
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
X-Inumbo-ID: 22cd8763-03f6-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1714154113; x=1714240513; bh=honjTb6abt
	tQjuzNiX/lJMZfyWZ6V6USbB6qxEtNQxA=; b=ji60msnEKEfXtuFeFuu4U4C+4j
	HTwVTgFU+Afx133SGtZNHGazKsnVf0u1AUR3w1B+of3PJEN9eGdmXPLc/zbqsqGv
	gCvY7fjSoMyLZq1i7PDW+9N000KRW++R/m3c2AP1bGnHTGXhXl7SqxpBgzTFXe/+
	hUA2qiYGBOBU8bgJLM1q0Uk/jiEwoIUS0x+mABxmemxjcnQZ+lmTiA6woFBuWzLL
	83qlcFcP3f69mk3ljYtnZvi7wrXDsgj5HeexfHuGUkoPmJWGMchdHZe4GnMTy94I
	v0t0f4OJfEzvbJr7K93lnmCE04G6KTr5CpHXcGBir1YWX6VtBaiVnOmUcwRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1714154113; x=
	1714240513; bh=honjTb6abttQjuzNiX/lJMZfyWZ6V6USbB6qxEtNQxA=; b=B
	xO8B9qNEStbq4S0dLaDT7ls3zo5cUAFKYLDrfzK5G0gOcDgBwn8fVgB2aRkbIhCT
	HGHifMGjoKa5wjIGT56Oq5384+rFDfkALqGGdFJaVjM2O4qreyrZRWBa7nCsOwNp
	v8oF/36mJ1XprsUWxg0/QDDiY64TBqhGVJfPaT/GJhFRnqLTB77pPgMK41+ocI7N
	VmmjMx/tLYfdSIMFXi/zX+78ayIveTgk4J59vdda9IlXlD27vUgsdnf7BPiabC5h
	UkSvle246P+4caaIRczwohFcrHG7RZO5XrCvTN840xY0mm+bV7GVkp8dsKoiuYjk
	xzu5CJju+wyufBksSMzCw==
X-ME-Sender: <xms:georZqnqSLeLLSnKhNz8mVxmILp2iRqzsq1GFTTxasjRypdNdW7aCg>
    <xme:georZh3cobb_PPpKJQ-rqKTCoT2IbNCb1r2Zfc6msl3vH2OYEqEMeE0TsJ9TARliq
    kO0RI-O8apSYg>
X-ME-Received: <xmr:georZooeyTbpV8v2b7m8S_4yTQgm4B6pPQ6KmtY-RCR232G5Z6nG8b9Q4Q2mww87_sMVUyTrqbNTVHnhTpBkw7Y3iLew0wXgKP9HgUqxaq1p5YD5rxw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudelledguddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgr
    rhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghkse
    hinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhep
    gfeuudehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghr
    vghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:georZuloLR31hb5ruSBs4OXx7UsmpPbJmf3MCECNE42uYmyb4o_TYg>
    <xmx:georZo3FpjmahsHeOO-EChMuskGLXNj27IhityXlmbd0I8V7LjTSnw>
    <xmx:georZltnYUYl3W2ViFczZ1A1Xh4ASdADQ4Fsx_Cr-nLYm1G-r5fXwA>
    <xmx:georZkVV1h5pSYUBehpYDjxh6kDcnvVEcjuwZnIjVW1dtCiwjZHc_g>
    <xmx:georZrRngZu9gD2EoWoO73tzrUw0-VX8SQlTIbgoNzQ2cZTky3nZOYly>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 2/7] x86/msi: Extend per-domain/device warning mechanism
Date: Fri, 26 Apr 2024 19:53:59 +0200
Message-ID: <46f33e8ae1aa7d310e7a99e9da29d29096b0935b.1714154036.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.3491f479d5b6238106af8ddc56ec6834090b330f.1714154036.git-series.marmarek@invisiblethingslab.com>
References: <cover.3491f479d5b6238106af8ddc56ec6834090b330f.1714154036.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The arch_msix struct had a single "warned" field with a domid for which
warning was issued. Upcoming patch will need similar mechanism for few
more warnings, so change it to save a bit field of issued warnings.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v6:
- add MSIX_CHECK_WARN macro (Jan)
- drop struct name from warned_kind union (Jan)

New in v5
---
 xen/arch/x86/include/asm/msi.h | 17 ++++++++++++++++-
 xen/arch/x86/msi.c             |  5 +----
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
index 997ccb87be0c..bcfdfd35345d 100644
--- a/xen/arch/x86/include/asm/msi.h
+++ b/xen/arch/x86/include/asm/msi.h
@@ -208,6 +208,15 @@ struct msg_address {
                                        PCI_MSIX_ENTRY_SIZE + \
                                        (~PCI_MSIX_BIRMASK & (PAGE_SIZE - 1)))
 
+#define MSIX_CHECK_WARN(msix, domid, which) ({ \
+    if ( (msix)->warned_domid != (domid) ) \
+    { \
+        (msix)->warned_domid = (domid); \
+        (msix)->warned_kind.all = 0; \
+    } \
+    (msix)->warned_kind.which ? false : ((msix)->warned_kind.which = true); \
+})
+
 struct arch_msix {
     unsigned int nr_entries, used_entries;
     struct {
@@ -217,7 +226,13 @@ struct arch_msix {
     int table_idx[MAX_MSIX_TABLE_PAGES];
     spinlock_t table_lock;
     bool host_maskall, guest_maskall;
-    domid_t warned;
+    domid_t warned_domid;
+    union {
+        uint8_t all;
+        struct {
+            bool maskall                   : 1;
+        };
+    } warned_kind;
 };
 
 void early_msi_init(void);
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index e721aaf5c001..42c793426da3 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -364,13 +364,10 @@ static bool msi_set_mask_bit(struct irq_desc *desc, bool host, bool guest)
             domid_t domid = pdev->domain->domain_id;
 
             maskall = true;
-            if ( pdev->msix->warned != domid )
-            {
-                pdev->msix->warned = domid;
+            if ( MSIX_CHECK_WARN(pdev->msix, domid, maskall) )
                 printk(XENLOG_G_WARNING
                        "cannot mask IRQ %d: masking MSI-X on Dom%d's %pp\n",
                        desc->irq, domid, &pdev->sbdf);
-            }
         }
         pdev->msix->host_maskall = maskall;
         if ( maskall || pdev->msix->guest_maskall )
-- 
git-series 0.9.1

