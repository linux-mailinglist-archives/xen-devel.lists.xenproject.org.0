Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4599764D31E
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 00:15:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462737.720942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5axr-00068m-5m; Wed, 14 Dec 2022 23:15:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462737.720942; Wed, 14 Dec 2022 23:15:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5axq-000660-VW; Wed, 14 Dec 2022 23:15:02 +0000
Received: by outflank-mailman (input) for mailman id 462737;
 Wed, 14 Dec 2022 23:15:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IksU=4M=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p5awA-0000Gw-26
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 23:13:18 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3b71ae3-7c04-11ed-91b6-6bf2151ebd3b;
 Thu, 15 Dec 2022 00:13:17 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id E255C320016F;
 Wed, 14 Dec 2022 18:13:14 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 14 Dec 2022 18:13:15 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Dec 2022 18:13:13 -0500 (EST)
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
X-Inumbo-ID: e3b71ae3-7c04-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1671059594; x=1671145994; bh=8HdS0C58v8DuAAjtm9L8m2ErkGOALkKTDMX
	7IVJUtxs=; b=M2jGyrN7EN6ik3b8+tAcaSjpfDFjFHZH3WkjA8z+JXAlhxMyK+L
	6GQMwXQ8nxzmfCN3pvAHirAajIWImrkWSqmDb2S3+vlDIUQU7P4Vt+XJD/ShNojv
	hhqOXARmti3/KN94WJJkiHVO8bR7DvPgMRp0Uan8CmEfU2hCg1/1STE3t7PdBoD9
	bJ63nQPB57d5yUoQPIvVRnM7sJMX4INN11S1izBaxAR3jR6dnFgKhiJtWVMwPM/q
	5/rjMmMDFOsVoMPUQnaoy8OjE3pUBfnuhe7Q0OSyBBVhRfx8D9BLAkCrMpZTPH9l
	W8jZNHKOxsCpMBHzGx4CjBTPXoBSEJmMJ9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1671059594; x=1671145994; bh=8HdS0C58v8DuA
	Ajtm9L8m2ErkGOALkKTDMX7IVJUtxs=; b=HEsrr2c0KzGibJKU42QWqM/RedYCs
	CVYmcCBfNWsLikAz6WFFQtekiyQ21cw262HXLi/DKlezsnvQneIxO1oVeNJ29Jw9
	hRyO5O8kEZOreDj4vVfRPqJWCYy/CVdab5wW+4tdTeoN3zyy3d+DRXlvvqaFJyaD
	jlbCYyk8DDspR83JiKL32Bhtd/qryop8KzDhOIR1Y8GPbLAaPFcdbceN0sQTmuTQ
	qmumf+FGrmI6OBzj1Tp4HdASG6ijIow6FmBBB8pFjIrkdJaCoMQuNbTRCrZwTVIV
	agiZmaxhbLyXb/UT3UA3Xxct+8coJdw3rLaV9oH01cb+PxtNdFifyxLXA==
X-ME-Sender: <xms:iliaY1PQeAogOh-Pwx5QZd6D9c6wqwYQsZRSbSUTEQ6kEZVmm_ab9w>
    <xme:iliaY39hFU-ka4M2VgTxIO5BFwqlTM1LHJn2qexlMzITG4rJFEpfEMY29tMrTBOtc
    uD78xe8GjRkGHE>
X-ME-Received: <xmr:iliaY0T1JtzIDSj87CGiFLEwdI67c8HAOUDSo0qjqykselOeGy_4k6g14povFZwxd3FEX3Cc32AK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeggddtgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedvnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:iliaYxvyhBTjYXEqaiFf41r3b4WRr7cdY6tJrutxB50iAFLVyss60w>
    <xmx:iliaY9cbRwUks1J5uOIV2BGgkFjq9rIcUbk0fUOMbUEpHu5V2W7GaQ>
    <xmx:iliaY92gZL9cy3qIEn2soMUkikz_GykX4v-g91zbFo5pxBIPmYHvHQ>
    <xmx:iliaY8y2TQ6SPqaPKb9iw9DzvH0U8KY8KfgpzjXPOFOfJZAIFakmlg>
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
Subject: [PATCH v3 12/12] x86: Use Linux's PAT
Date: Wed, 14 Dec 2022 18:12:02 -0500
Message-Id: <d12d9a73be5cfc427f98925eede298a2d439a369.1671057808.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671057808.git.demi@invisiblethingslab.com>
References: <cover.1671057808.git.demi@invisiblethingslab.com>
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


