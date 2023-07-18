Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35217757BC9
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 14:28:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565159.883054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLjnH-0006zP-Q3; Tue, 18 Jul 2023 12:27:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565159.883054; Tue, 18 Jul 2023 12:27:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLjnH-0006wp-MU; Tue, 18 Jul 2023 12:27:07 +0000
Received: by outflank-mailman (input) for mailman id 565159;
 Tue, 18 Jul 2023 12:27:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ju50=DE=invisiblethingslab.com=simon@srs-se1.protection.inumbo.net>)
 id 1qLjnG-0006wj-HX
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 12:27:06 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 664f7fa7-2566-11ee-b23a-6b7b168915f2;
 Tue, 18 Jul 2023 14:27:04 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 8A5DC5C00C6;
 Tue, 18 Jul 2023 08:27:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 18 Jul 2023 08:27:02 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Jul 2023 08:26:59 -0400 (EDT)
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
X-Inumbo-ID: 664f7fa7-2566-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1689683222; x=1689769622; bh=YFBvQZCZXCQyk2yAL1JH/rTyKUf8cV2OMD+
	8hmUkdlQ=; b=Aflh+P7clq66lTjzWw9Oo8vcgXT3/af615rCFyDTtn5bb8baq/M
	fhfAVHRnHHiQsTJlFdEDVHa1+UyWuzuD7G/Rd5lgsW3Bne6JOHR3uOHpYMlu9IeG
	65Xw+nfLd9Jmu2s/azXxCfWk0iyruOMkfo70ZZKpEnu2ur9bE1gA/KFsFpMhc96M
	MOihjeSdPbDt1ZGoHHE/NPEHHAGsU1c7hnTdTr3XRLadZT6OLFs8Q058VRqien4f
	Ty92sXypNQEOUJLak+T1S2h47+V5a9HT/VJvpZ1MmvsMn+hZXVwR7xzQdhml2MNb
	TlNv+VoE4cfl4HhnTlwocfMgSm99rfpITgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1689683222; x=1689769622; bh=YFBvQZCZXCQyk
	2yAL1JH/rTyKUf8cV2OMD+8hmUkdlQ=; b=GeVNPjjizJWJzsykU/cF+9CIO/Fqa
	h0aWzeipnw7r22d7pryObNc8mVEYE1DrhkLrJ/nVNsTndIekCkJJKgjk4oRStu7P
	9/WOtrzivTdNUIdth5ZwKaioSGQqQ2BK/9zTxATMZR4o+WIKErVkMZQNyr4JjGAw
	Wj+25YGRo+IMUFms0LN6ZzscpuQQ/nY7p67FqwKxfkwkoTSUdjwenld69S7AGpLg
	Gvh+ut6gTuPBzRQ7isxzDKcx481L/W8ptwa9VuXlrwDuMH9+jt0WJK1MbhUUcgyi
	fHIBA3p8l/m/IY3+DnqAMZI7JMSmXD6Wh0suwweR0jLYx13ThnblPaUaQ==
X-ME-Sender: <xms:FoW2ZD1FJLppeHAPtk1MVXf1waoyeWnlNwdFkM7EEibGrqQijZuDGw>
    <xme:FoW2ZCFl2NlijkNKk7xqspq4WlHIs0U-3E8fkDhAlSypfULL06z_0V9W0Nu6vTAFq
    XqtI3keikByB0o>
X-ME-Received: <xmr:FoW2ZD4Ny_tvcjn45EiXG4ek-4kmzmepy8Pk5yQyBnH2S-mTMxW390tu1ogZ8AAheBTU8_5GcQsJhg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrgeeggdehtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuihhmohhnucfi
    rghishgvrhcuoehsihhmohhnsehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    eqnecuggftrfgrthhtvghrnhepueevheegtdefgeefuddvfeduueduffffffejveeugeef
    udefiedugedugeevudfgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsihhmohhnsehinhhv
    ihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:FoW2ZI3DZeEYEX6az0oa8YWM8luF-ddw5VAdDwKisJR42N3e2Pu4Cg>
    <xmx:FoW2ZGG1RC52G09QXZOPnbrMKBBgmlM3q1kMIIVN0AhKQ1O0L2bviw>
    <xmx:FoW2ZJ_8iEIU_jRct9Q6Jnj5Uapal-DmFHEq2-1Wm-PZS-IMk7_Biw>
    <xmx:FoW2ZChYMnoByX7mzTD6jq9eGWSV4chd2d1R1q0glITJx57SYlVvjw>
Feedback-ID: idc5945a3:Fastmail
From: Simon Gaiser <simon@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Simon Gaiser <simon@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [XEN PATCH] x86/hpet: Disable legacy replacement mode after IRQ test if not needed
Date: Tue, 18 Jul 2023 14:26:03 +0200
Message-Id: <20230718122603.2002-1-simon@invisiblethingslab.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As far as I understand the HPET legacy mode is not required on systems
with ARAT after the timer IRQ test. For previous discussion see [1].
Keeping it enabled prevents reaching S0ix residency.

Link: https://lore.kernel.org/xen-devel/cb408368-077d-edb5-b4ad-f80086db48c1@invisiblethingslab.com/ # [1]
Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>
---
 xen/arch/x86/io_apic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 9b8a972cf5..ea98d717d0 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -1966,6 +1966,10 @@ static void __init check_timer(void)
 
             if ( timer_irq_works() )
             {
+                if ( boot_cpu_has(X86_FEATURE_ARAT) ) {
+                    printk(XENLOG_INFO "IRQ test with HPET Legacy Replacement Mode worked. Disabling it again.\n");
+                    hpet_disable_legacy_replacement_mode();
+                }
                 local_irq_restore(flags);
                 return;
             }
-- 
2.40.1


