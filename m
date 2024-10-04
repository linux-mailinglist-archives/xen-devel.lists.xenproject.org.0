Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A697498FFD3
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 11:34:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810228.1222920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swehG-000104-3E; Fri, 04 Oct 2024 09:34:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810228.1222920; Fri, 04 Oct 2024 09:34:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swehG-0000yG-02; Fri, 04 Oct 2024 09:34:02 +0000
Received: by outflank-mailman (input) for mailman id 810228;
 Fri, 04 Oct 2024 09:34:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IKoM=RA=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1swehE-0000y7-5D
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 09:34:00 +0000
Received: from fforwardh-a2-smtp.messagingengine.com
 (fforwardh-a2-smtp.messagingengine.com [103.168.172.197])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c756b6c1-8233-11ef-99a2-01e77a169b0f;
 Fri, 04 Oct 2024 11:33:58 +0200 (CEST)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfforwardh.phl.internal (Postfix) with ESMTP id E23262920276;
 Fri,  4 Oct 2024 05:33:56 -0400 (EDT)
Received: from phl-frontend-02 ([10.202.2.161])
 by phl-compute-10.internal (MEProxy); Fri, 04 Oct 2024 05:33:56 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Oct 2024 05:33:55 -0400 (EDT)
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
X-Inumbo-ID: c756b6c1-8233-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pobox.com; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1728034436; x=
	1728120836; bh=iFp9K5MGCW7+gkI5DtCOpQKX7h2U+MWfWZWlhRdQB44=; b=n
	KEsaJTTjAU/zd9TokIbxzlxPPIJMSxKo0t0Q1YNkWr6pzL4kPlT8HiANDGm3WKC3
	q8QwluM4Kgdxjg1pRUm3QbZQpM7d75I+TJuqQew7q+yXJfgaQB0+eFfKk5Lqm1m3
	KV2npdLpqnGc9zqL5mK7hPBZksgddLjXsadzdnwvrLBx1TVJsaQssLMJoAHsXAA3
	t3DIqc827DGM4Xi12zNm85oU73u9ChOgr/LplrmsyEcvd7gtsVubvPCuEntGlA9u
	fISZPWNEZPrEeJty/SQda043X5xjVZ8Cx0d13Ro2cNj9Dr3+GX+2tBOqvKd4LnvC
	VwxLnO1smGhWZW6y2WVwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728034436; x=
	1728120836; bh=iFp9K5MGCW7+gkI5DtCOpQKX7h2U+MWfWZWlhRdQB44=; b=c
	dHQ3cgTaP3OLIQ7SEV6AwBQhdHQd5xNbqCUSrm7dW+tm9MYMo26Rc4N/i99vdwBz
	RKCpGijqKyqx+iHVhCpbcHJT+PuQIsuWc8L1LTUMYUxfopJA/cgoO2TsP52GoSTq
	C0N0dVKz/Pa1rSptUEfIhLD0yc00RU6LEIRE6C+/iEBHdcnW2j65OVB+bnlifYzd
	p7JervRypS0x0zzltbmKFHpzUEUcfMMKVfeKPDPowC6T9AKlpknemIlUYNtW2/6o
	IH73j0VVbjXZ+iwU87ztxiCorzLEG09aXBSsxLpwrNsHnGCfcECgL0ZEDkxk2dev
	oonfl46Sf9r8YHc1G+qtQ==
X-ME-Sender: <xms:hLb_Zph_QuwbXcneIy-0Ur_OZjWf4LgNYN8Kq7Pz4ghRUxoiDjBKhw>
    <xme:hLb_ZuD_CA8WeCZCgQVypDT8eDTaZF4oVZ8YCRxak3JQ4a6aQiVFn9xmsnP_czpMJ
    T-Sdjl0dsoGA1UE2lc>
X-ME-Received: <xmr:hLb_ZpGKmJZ_9uoKzxHbfAjlfgUSN-O8XLSJY3MhqkEojt4JMKKbxkQMbx1NQIdSuWs87t4OQYiblgNZW-m4kqGv6cMJ8pEwxV6PukR2cadpWZx->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvfedgudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomhepufgvrhhgihihucfmihgsrhhikhcuoefuvghrghhihigpmfhisghrihhkse
    gvphgrmhdrtghomheqnecuggftrfgrthhtvghrnheptdejgeegvdffkeekleefueevgfdu
    heevkedvhfdvkeeludehleegheeivedugfejnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepshgrkhhisgesuggrrhhkshhtrghrrdhsihhtvgdp
    nhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnh
    dquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohep
    shgvrhhgihihpghkihgsrhhikhesvghprghmrdgtohhmpdhrtghpthhtoheprghnughrvg
    ifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopehrohhgvghrrdhp
    rghusegtihhtrhhigidrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrdgtohhm
X-ME-Proxy: <xmx:hLb_ZuSxAOyuD5nbDHnqR3y0of4mrUrGW2qiQ-E-naxzahihOmI5wA>
    <xmx:hLb_Zmxakg6404u2-9EzXO7EE_Pr2Igiyg5BGuKCW11dDG2vC99UVQ>
    <xmx:hLb_Zk4kBDaEHuLq2UI-eI2p3XMc104yrM-MHIxdH5BgpIIiSr7LuA>
    <xmx:hLb_Zrwa50bUHpKYP0R5DB0yWqZklBW6ceYWYLUJW76zqJEXnj0CGA>
    <xmx:hLb_ZgvFgqPKlSFrcip7GjJWQXIqVVSS07knUoSyfn3PJIh65S0TZrk1KSEJ>
Feedback-ID: i5d7f6ead:Fastmail
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH v1 2/3] x86/hvm: introduce config option for stdvga emulation
Date: Fri,  4 Oct 2024 12:33:53 +0300
Message-Id: <05a027b7021ce6deb5b48078034e560a38ca8d23.1728032664.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1728032664.git.Sergiy_Kibrik@epam.com>
References: <cover.1728032664.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce config option X86_STDVGA so that stdvga emulation driver can later be
made configurable and be disabled on systems that don't need it.

As a first step the option is hidden from user. No functional changes intended.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/Kconfig              | 3 +++
 xen/arch/x86/hvm/Makefile         | 2 +-
 xen/arch/x86/include/asm/domain.h | 3 ++-
 xen/arch/x86/include/asm/hvm/io.h | 4 ++++
 4 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 95275dc17e..89c42ff6da 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -147,6 +147,9 @@ config INTEL_VMX
 config X86_PMTIMER
 	def_bool HVM
 
+config X86_STDVGA
+	def_bool HVM
+
 config XEN_SHSTK
 	bool "Supervisor Shadow Stacks"
 	depends on HAS_AS_CET_SS
diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
index 321241f0bf..b7741b0f60 100644
--- a/xen/arch/x86/hvm/Makefile
+++ b/xen/arch/x86/hvm/Makefile
@@ -22,7 +22,7 @@ obj-$(CONFIG_X86_PMTIMER) += pmtimer.o
 obj-y += quirks.o
 obj-y += rtc.o
 obj-y += save.o
-obj-y += stdvga.o
+obj-$(CONFIG_X86_STDVGA) += stdvga.o
 obj-y += vioapic.o
 obj-y += vlapic.o
 obj-y += vm_event.o
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 3f65bfd190..675a13d917 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -501,7 +501,8 @@ struct arch_domain
 #define has_vrtc(d)        (!!((d)->arch.emulation_flags & X86_EMU_RTC))
 #define has_vioapic(d)     (!!((d)->arch.emulation_flags & X86_EMU_IOAPIC))
 #define has_vpic(d)        (!!((d)->arch.emulation_flags & X86_EMU_PIC))
-#define has_vvga(d)        (!!((d)->arch.emulation_flags & X86_EMU_VGA))
+#define has_vvga(d)        (IS_ENABLED(CONFIG_X86_STDVGA) && \
+                            !!((d)->arch.emulation_flags & X86_EMU_VGA))
 #define has_viommu(d)      (!!((d)->arch.emulation_flags & X86_EMU_IOMMU))
 #define has_vpit(d)        (!!((d)->arch.emulation_flags & X86_EMU_PIT))
 #define has_pirq(d)        (!!((d)->arch.emulation_flags & X86_EMU_USE_PIRQ))
diff --git a/xen/arch/x86/include/asm/hvm/io.h b/xen/arch/x86/include/asm/hvm/io.h
index f2b8431fac..32a2490fbc 100644
--- a/xen/arch/x86/include/asm/hvm/io.h
+++ b/xen/arch/x86/include/asm/hvm/io.h
@@ -108,7 +108,11 @@ struct vpci_arch_msix_entry {
     int pirq;
 };
 
+#ifdef CONFIG_X86_STDVGA
 void stdvga_init(struct domain *d);
+#else
+static inline void stdvga_init(struct domain *d) {}
+#endif
 
 extern void hvm_dpci_msi_eoi(struct domain *d, int vector);
 
-- 
2.25.1


