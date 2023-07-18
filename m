Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A98A6757D29
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 15:19:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565224.883198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLkbc-0003ml-H7; Tue, 18 Jul 2023 13:19:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565224.883198; Tue, 18 Jul 2023 13:19:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLkbc-0003kc-E3; Tue, 18 Jul 2023 13:19:08 +0000
Received: by outflank-mailman (input) for mailman id 565224;
 Tue, 18 Jul 2023 13:19:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ju50=DE=invisiblethingslab.com=simon@srs-se1.protection.inumbo.net>)
 id 1qLkba-0003kW-Kt
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 13:19:06 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa9d8e93-256d-11ee-8611-37d641c3527e;
 Tue, 18 Jul 2023 15:19:04 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id A45D45C0193;
 Tue, 18 Jul 2023 09:19:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 18 Jul 2023 09:19:03 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Jul 2023 09:19:01 -0400 (EDT)
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
X-Inumbo-ID: aa9d8e93-256d-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1689686343; x=1689772743; bh=vQAfZhUrBpa7qA7Trj9KoRSCGHtH50yM51Z
	WOCl4HAs=; b=Mr4+xxhA+W4AB0CdU0J70g9qLPClwRqWruxqizF1f5O4ALU1LNT
	Fe74xAVlM3i2QC2KSMJBR5/Up2pVpWvKeK4pd2iYB2E60R8MkWN2M63mA98M3Kn/
	FvDXcJMqf8RYn24v4QkXzY9U2BbeTJ7V9q9DaWqJ52gC7iaX4dt2GarbpBXvFK5Q
	RWWyQC0d1OYRra+qqM8S1yoHGX407MN+joNtpdyLgrqAlAd5zrTSJIZmDMf8aCDg
	Epu/z8xMEdquHbecx3suFUbAsWQ2nb1g8EMpPux89EMHiPau081UXMxHoHl5RnhZ
	YlPnVNSCCTnBQAr/6vZNS5BKKuzsQ/RxxRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1689686343; x=1689772743; bh=vQAfZhUrBpa7q
	A7Trj9KoRSCGHtH50yM51ZWOCl4HAs=; b=MXqqICGqBacMiR4Lz23PGtjkMPDOa
	i7MC21MOF1PN0J8ciPfAAbf+WHsVdTV5YXaoCY3YdBsSko8aNIh0v8XSpb3qGF2i
	cM36KsoTrtDQtsCIMpnNJnqdjpk7h/kG8gk5KoXAe5MKsmg0H/xY+kMW1Nu1Rk48
	8RZa4qMOZ15rLnGYoQC3BV6t1a3PKHYbucCZfFjShSqq9ae5oVjVgCGHNoY/HQsc
	M3EUsJ0Y9McFBwQwp+5ezmS2Z/zmvlexY6wJsvJEPfNeA53OUnYZgFXMgTFDVJ0e
	Tab/GsVcv8wb4EbP47Bos9s0SIxqdHScjhqR7y0lB7eXgRyVWwcP3iNfw==
X-ME-Sender: <xms:R5G2ZJoID0DT8p10aZ7sT2S7toyL4ZUDHP_mp4vSDYCnZ_AqAxuzow>
    <xme:R5G2ZLohD4pnkWqzQUiVTz0rHQV8ZZGxQ199UCdW3iEB1Gfhl4ivKHJFvGoqMSsYQ
    _k1Fujupb7Ip4g>
X-ME-Received: <xmr:R5G2ZGPQlrsXXrUrhbzFbRSXV49dsjoNtRkJqJL1Fm1ESYAkj9Q4RV82d_d2_eOIYjILRliUB3IkrlCJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrgeeggdehlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuihhmohhnucfi
    rghishgvrhcuoehsihhmohhnsehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    eqnecuggftrfgrthhtvghrnhepieevhfekveefjedvvdehhfdtudfhieegvdehveeffeet
    heekleejudeuieetudfgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepshhimhhonhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:R5G2ZE4Yl5hvv2hmydyEFaFNtlrL06wMNQ43JLPdcqdWg-Y7o5ID3A>
    <xmx:R5G2ZI4xVwAjhx8Du5xssiIzTk9D6mChlOZ8C7y7iUG6yprQoiJi4Q>
    <xmx:R5G2ZMhJdM-Ka1BiZcc1xtf8Q6NthfBzgYbUVBujfyHzyH5C6krfuQ>
    <xmx:R5G2ZD3C2IbtEiFNg4_QpnzFBvf6d0tzP1QdZtUDgwEVQNyYwEsFPg>
Feedback-ID: idc5945a3:Fastmail
From: Simon Gaiser <simon@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Simon Gaiser <simon@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [XEN PATCH] x86/msr: Allow hardware domain to read package C-state residency counters
Date: Tue, 18 Jul 2023 15:17:55 +0200
Message-Id: <946e5494801866c93332cc5d9ec0fa03a4df00d7.1689686046.git.simon@invisiblethingslab.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since it's limited to the hardware domain it should be safe and it's
very useful to have access to this directly in dom0 when debugging power
related things for example S0ix.
---
 xen/arch/x86/include/asm/msr-index.h |  9 +++++++++
 xen/arch/x86/pv/emul-priv-op.c       | 14 ++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 4f861c0bb4..7e7255383d 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -704,4 +704,13 @@
 #define MSR_PKGC9_IRTL			0x00000634
 #define MSR_PKGC10_IRTL			0x00000635
 
+/* Package C-state residency counters */
+#define MSR_PKG_C2_RESIDENCY            0x0000060d
+#define MSR_PKG_C3_RESIDENCY            0x000003f8
+#define MSR_PKG_C6_RESIDENCY            0x000003f9
+#define MSR_PKG_C7_RESIDENCY            0x000003fa
+#define MSR_PKG_C8_RESIDENCY            0x00000630
+#define MSR_PKG_C9_RESIDENCY            0x00000631
+#define MSR_PKG_C10_RESIDENCY           0x00000632
+
 #endif /* __ASM_MSR_INDEX_H */
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 142bc4818c..4593295ee2 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -965,6 +965,20 @@ static int cf_check read_msr(
         *val = 0;
         return X86EMUL_OKAY;
 
+    case MSR_PKG_C2_RESIDENCY:
+    case MSR_PKG_C3_RESIDENCY:
+    case MSR_PKG_C6_RESIDENCY:
+    case MSR_PKG_C7_RESIDENCY:
+    case MSR_PKG_C8_RESIDENCY:
+    case MSR_PKG_C9_RESIDENCY:
+    case MSR_PKG_C10_RESIDENCY:
+        if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL )
+            break;
+        if ( is_hardware_domain(currd) )
+            goto normal;
+        *val = 0;
+        return X86EMUL_OKAY;
+
     case MSR_P6_PERFCTR(0) ... MSR_P6_PERFCTR(7):
     case MSR_P6_EVNTSEL(0) ... MSR_P6_EVNTSEL(3):
     case MSR_CORE_PERF_FIXED_CTR0 ... MSR_CORE_PERF_FIXED_CTR2:
-- 
2.40.1


