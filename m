Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B710564BF6A
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 23:35:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461326.719464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5DrZ-0002Th-PX; Tue, 13 Dec 2022 22:35:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461326.719464; Tue, 13 Dec 2022 22:35:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5DrZ-0002R1-GP; Tue, 13 Dec 2022 22:35:01 +0000
Received: by outflank-mailman (input) for mailman id 461326;
 Tue, 13 Dec 2022 22:35:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mJcE=4L=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p5DlZ-000519-7b
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 22:28:49 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 801302a3-7b35-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 23:28:44 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id DA1D632003C0;
 Tue, 13 Dec 2022 17:28:41 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 13 Dec 2022 17:28:42 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Dec 2022 17:28:40 -0500 (EST)
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
X-Inumbo-ID: 801302a3-7b35-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1670970521; x=1671056921; bh=8HdS0C58v8DuAAjtm9L8m2ErkGOALkKTDMX
	7IVJUtxs=; b=S30AQL7dUfbtlTLCTrnRuFnxnLwBF+hn36Q3hcYO1K8kOIgaLwE
	ILodrs8Ian63UsR+T4AxLieROYUeXT3Et20zVW1QV3KtrqjnJJoCshgxKlDntzXR
	U6SuA9McQgDcoWzWwEZ5xtkaF5/gNFtcBXYSwdJWSpO7zBHS+Ne5BwNovFWEdgd2
	wTWXSZmntJFVIN/IlH90oqqo+U1k79ZTOoQOrueWx2DnKLN/cGwGwWfBxlVG+8Ly
	5gXWPVFHojO4OOGGpYuhvAyXPus2thmhkvjE0ZYaLcDyjC06NKQaEyyKK9jC31hA
	U2k4kQRlX5PWRZMzOXRxBNZQdWl0Hc8a6PQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1670970521; x=1671056921; bh=8HdS0C58v8DuA
	Ajtm9L8m2ErkGOALkKTDMX7IVJUtxs=; b=CJxMiNqL4XcEP2145xxcTGheInBJe
	la+CSDcvrq0jW1MqSzr6+/uGW/JBJbok6P81/p51nPebGkmYFKTyltzh+ps2Bzj4
	dqtTPKsb8Zxbl3LrV9zxLEAaNNIlUtOUVFFWMGuPMyaM1uRo27SE1NDuo0dXt9T3
	A+YlrtsxndUy9e19mSfjnJkuZsrHJhdnA7VwCl3c/iTUXkVeCsfEWWIqUWKEATH1
	/kN9PrMLG7dZH889mTDTobXJIhtyC8DrbHa3/CORxiY5J2jLgK2e9fWdgzIH3DIM
	Yq5d8qWTOEorp9LOIH7bJ/Fnq2OPimK6No1FwV7bB9E8KDGuRCKd12c9w==
X-ME-Sender: <xms:mfyYY3pb6etj9i3ileDveu5a9ClpoVbNQtRKL2SZOMFDjPk_K3V1Zg>
    <xme:mfyYYxqr-YK7KkYpVQ3QWEVFgOjoQcGGMPE6ppc7JKEZcOAoqxM3hJ99ockJOa8C0
    1SI89ApW7hk3MA>
X-ME-Received: <xmr:mfyYY0OOX1MEzehy9E4UlZLIny-x-6MRBiIt3hHUERJfwYmD-OyvI_9tQMmcKeh0_s1qREZXobPl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedugdekjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpeegnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:mfyYY64wJ96Qm_F77q0ZSGfecanBFo0GMCRHva8_ucL4bcLk62lHpw>
    <xmx:mfyYY27SF81WlHIeE9L4ndlc7tIcqE0dDZe4Os2iBcPz0mRkNDO-KA>
    <xmx:mfyYYygJgpyI8wyzGSWAl3j7DnU1SDx7xVJdb8UNfemWeOzJ-AXCpw>
    <xmx:mfyYY4uNariMkcU6t_vc2dyHGBv5Hr7B5WKI0F6vvOd5aLkIw5rGIw>
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
Subject: [PATCH v2 14/14] x86: Use Linux's PAT
Date: Tue, 13 Dec 2022 17:26:55 -0500
Message-Id: <d3516b2ae70a63a44d3655135f6d36b04511a901.1670948141.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <71482430c20a701b1d577e87dc72e7c2661e69de.1670948141.git.demi@invisiblethingslab.com>
References: <71482430c20a701b1d577e87dc72e7c2661e69de.1670948141.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is purely for testing, to see if it works around a bug in i915.  It
is not intended to be merged.

NOT-signed-off-by: DO NOT MERGE
---
 xen/arch/x86/include/asm/page.h      |  4 ++--
 xen/arch/x86/include/asm/processor.h | 13 +++++--------
 xen/arch/x86/mm.c                    |  2 --
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
index 9535b1f7f49d75e6853365e6109a33359c740f4f..04e9674ea76ce11a2ac00fb7457f3ce97db24d70 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -92,18 +92,15 @@
                           X86_EFLAGS_NT|X86_EFLAGS_DF|X86_EFLAGS_IF|    \
                           X86_EFLAGS_TF)
 
-/*
- * Host IA32_CR_PAT value to cover all memory types.  This is not the default
- * MSR_PAT value, and is an ABI with PV guests.
- */
+/* Linux PAT, required by i915 driver */
 #define XEN_MSR_PAT (X86_MT_WB  << 0x00 | \
-                     X86_MT_WT  << 0x08 | \
+                     X86_MT_WC  << 0x08 | \
                      X86_MT_UCM << 0x10 | \
                      X86_MT_UC  << 0x18 | \
-                     X86_MT_WC  << 0x20 | \
+                     X86_MT_WB  << 0x20 | \
                      X86_MT_WP  << 0x28 | \
-                     X86_MT_UC  << 0x30 | \
-                     X86_MT_UC  << 0x38 | \
+                     X86_MT_UCM << 0x30 | \
+                     X86_MT_WT  << 0x38 | \
                      0)
 
 #ifndef __ASSEMBLY__
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index a199bb05031e0fb1ea4c25ef1d641afe71690d74..b844ff441d8ddd371bc69f4e43c796d03638cbb3 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6382,8 +6382,6 @@ static void __init __maybe_unused build_assertions(void)
 {
     /* A bunch of static assertions to check that the XEN_MSR_PAT is valid
      * and consistent with the _PAGE_* macros */
-    BUILD_BUG_ON(XEN_MSR_PAT != 0x050100070406ULL &&
-                 "wrong XEN_MSR_PAT breaks PV guests");
     BUILD_BUG_ON(_PAGE_WB && "Linux requires _PAGE_WB to be 0");
 #define PAT_VALUE(v) (0xFF & (XEN_MSR_PAT >> (8 * (v))))
 #define BAD_VALUE(v) ((v) < 0 || (v) > 7 ||                                    \
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

