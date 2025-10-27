Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB06C0FA09
	for <lists+xen-devel@lfdr.de>; Mon, 27 Oct 2025 18:27:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151699.1482264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDQzT-0002vY-0l; Mon, 27 Oct 2025 17:26:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151699.1482264; Mon, 27 Oct 2025 17:26:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDQzS-0002su-TN; Mon, 27 Oct 2025 17:26:42 +0000
Received: by outflank-mailman (input) for mailman id 1151699;
 Mon, 27 Oct 2025 17:26:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2wYw=5E=bounce.vates.tech=bounce-md_30504962.68ffab4a.v1-e398a002f6d4460abb9430a6f194f0fa@srs-se1.protection.inumbo.net>)
 id 1vDQzQ-0002R5-Qb
 for xen-devel@lists.xenproject.org; Mon, 27 Oct 2025 17:26:40 +0000
Received: from mail132-22.atl131.mandrillapp.com
 (mail132-22.atl131.mandrillapp.com [198.2.132.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 162cf369-b35a-11f0-980a-7dc792cee155;
 Mon, 27 Oct 2025 18:26:35 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-22.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4cwL5k0J97zGlswD6
 for <xen-devel@lists.xenproject.org>; Mon, 27 Oct 2025 17:26:34 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 e398a002f6d4460abb9430a6f194f0fa; Mon, 27 Oct 2025 17:26:34 +0000
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
X-Inumbo-ID: 162cf369-b35a-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1761585994; x=1761855994;
	bh=cXuN84KuaZFRe6aRXpvY17AsdlfQZOrMM+Ab77LOAIc=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=eQ/8YMJk7r4Q/ctdhb4rkSnYx5u8VhqGPdh9/nO7h0HwdrfuxuKfAK7gR5v98Kit1
	 lA9uyt+16WOtHK/mkJFe7ND/OBwv8GgJ38XZ6nhknszwREwonxo/VLN7Pxdssf0M3G
	 27c1TMSD0KnxrhwFG9i5TfD1aBpe2bx9mBEuqnZj3CCmohpJUSD7VG7fpm0SSaLpwT
	 BDCs793tjs2Yylww0URlle5YmpctMLO+8AWQxr+8el5CQ4PFhoF9HXcr3QZ1+cc4Sq
	 4SkESlIqJXmiuFYJuOzPSCPbP5axUqTaK5lHgDWwzYDfSVB9ofa8ot14vYND6T73FZ
	 1iYfdm3tMzJIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1761585994; x=1761846494; i=teddy.astie@vates.tech;
	bh=cXuN84KuaZFRe6aRXpvY17AsdlfQZOrMM+Ab77LOAIc=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=GaK9Y2iXiuz8m9vUZUouueuiCSdLyei80/nQmg7hSvtAVLuqAtwul6kax+8KLxyJ2
	 dxuRkPaxXbiyScIsA/4Y+E6b8VaKkfSoTOoH29blkvolY+I/DJQmezGfuOTuq1kYcb
	 nuRfjA3zjRewNslX+FFHlqurhvGFPhvziTbpG2PgTHiYA5dJy/+wGVtC2492/23iOM
	 ENn+IUhzX7h132wCCMXxEDCid51BwXKOllmSodtT5BZ9Fpc2JKbJ+zqQVYzpaNN8u/
	 j3oJ+LT/mI0PmK/px1ZMWrTFHa6E9MmN8cvlVPzmoLCkQD24ztgvuP/UAU10dCYkHM
	 L1uruMFtWOuSQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20for-4.22=201/2]=20x86/platform:=20Expose=20DTS=20sensors=20MSR?=
X-Mailer: git-send-email 2.51.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1761585993124
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <48b15617f248852560a0e0674eea65d25330c605.1761585640.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1761585640.git.teddy.astie@vates.tech>
References: <cover.1761585640.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.e398a002f6d4460abb9430a6f194f0fa?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251027:md
Date: Mon, 27 Oct 2025 17:26:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Intel provide CPU sensors through "DTS" MSRs. As there MSR are core-specific
(or package-specific), we can't reliably fetch them from Dom0 directly.
Expose these MSR (if supported) through XENPF_resource_op so that it is
accessible through hypercall.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
I'm not a fan of doing a inline cpuid check here, but I don't have a
better approach in mind.

 xen/arch/x86/include/asm/msr-index.h | 2 ++
 xen/arch/x86/platform_hypercall.c    | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index df52587c85..98dda629e5 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -510,6 +510,8 @@
 #define MSR_IA32_THERM_INTERRUPT	0x0000019b
 #define MSR_IA32_THERM_STATUS		0x0000019c
 #define MSR_IA32_MISC_ENABLE		0x000001a0
+#define MSR_IA32_TEMPERATURE_TARGET   0x000001a2
+#define MSR_IA32_PACKAGE_THERM_STATUS 0x000001b1
 #define MSR_IA32_MISC_ENABLE_FAST_STRING  (1<<0)
 #define MSR_IA32_MISC_ENABLE_PERF_AVAIL   (1<<7)
 #define MSR_IA32_MISC_ENABLE_BTS_UNAVAIL  (1<<11)
diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index 79bb99e0b6..3190803cc2 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -86,6 +86,12 @@ static bool msr_read_allowed(unsigned int msr)
 
     case MSR_MCU_OPT_CTRL:
         return cpu_has_srbds_ctrl;
+    
+    case MSR_IA32_TEMPERATURE_TARGET:
+    case MSR_IA32_THERM_STATUS:
+    case MSR_IA32_PACKAGE_THERM_STATUS:
+        return boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
+            (cpuid_eax(0x6) & 0x1); /* Digital temperature sensor */
     }
 
     if ( ppin_msr && msr == ppin_msr )
-- 
2.51.1



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


