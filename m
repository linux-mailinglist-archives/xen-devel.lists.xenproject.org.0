Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CE2563AD8
	for <lists+xen-devel@lfdr.de>; Fri,  1 Jul 2022 22:19:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359173.588584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7N6G-0005jK-Sf; Fri, 01 Jul 2022 20:18:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359173.588584; Fri, 01 Jul 2022 20:18:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7N6G-0005be-Jp; Fri, 01 Jul 2022 20:18:48 +0000
Received: by outflank-mailman (input) for mailman id 359173;
 Fri, 01 Jul 2022 20:01:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rlr7=XG=sholland.org=samuel@srs-se1.protection.inumbo.net>)
 id 1o7MpX-000470-F1
 for xen-devel@lists.xenproject.org; Fri, 01 Jul 2022 20:01:31 +0000
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9903102a-f978-11ec-bd2d-47488cf2e6aa;
 Fri, 01 Jul 2022 22:01:30 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id D5ADC580285;
 Fri,  1 Jul 2022 16:01:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 01 Jul 2022 16:01:29 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Jul 2022 16:01:23 -0400 (EDT)
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
X-Inumbo-ID: 9903102a-f978-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1656705689; x=1656712889; bh=f2
	gTOnVVlawVp6N5bLg8smmhsDaH+rFeOulG3ok0Jrc=; b=S00usAZDc/YM64VNCn
	FjrEnQNeYOIV4LNXFxrNe+DvmbJ1spyaNknAlkMKCOYdB8xZAB6BY9sx7dI8cRwD
	aNrKuvCkIxj/PKyZRFpy+snzjxdT/wGYVUKvGizh4ybfVco0jpNkt9KuqI3lODmv
	VgMOfXezM/xbArBQvHUjLN61LUq2x7L0hMa6QJigRe0ReXc8M/xo9kR71pvG5fav
	zb0DMcwbxYzRwjHctt2+SKmtMgzgd0yTB8uENd3D0VqTECGgquIpAjLlEagHYC3j
	iGuAmAltKJ2/jWPPQ1vs09gP9bynvMqw+WFPrd9CKAWkKbcNwG53wW45gJRugpgB
	7etg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1656705689; x=1656712889; bh=f2gTOnVVlawVp
	6N5bLg8smmhsDaH+rFeOulG3ok0Jrc=; b=p8dJ+iBG+yyKxcHv8Ird4QI+8K5e2
	deriiVPbLfaAp7jH0aTFXbKRlCyn1EkHQyKB2khg8+haSRMztqOCdPVXCF1Z0WCH
	XMZ2dC520GBYyCM3t4JRbY69RiaW08lpNIFhNE6+kx66gd+4fAfUbrwSyPs6mbPc
	nB4SQ4rjMwxLFceJ639l6X5Gnfabx0+YkFVX26GUHctAf/ClGo5S4UwBUh4m9yPh
	5lA0hUcpMSQycZcnZaO6J6XLkQxj0nrANK1+St4Vqj9eYNEZlQb3hS2C/cwKEL+5
	BILChd6I7vOuP7X0g3FgLvTGrvQkLzGX2qG9+nUpNgkqLUj+CVjSJhhdQ==
X-ME-Sender: <xms:lVK_YvMmv4ox1Eme9_eVm7hG98FH-UgFJb0oHUzgJo8sA_XFPRxfzA>
    <xme:lVK_Yp8DXLpqeSNLMrpiZQDvQSkKhvABFdw5gwEoYfjWHhRkkQPOyIiDrHvopn-gK
    IdJbuVQ556syyMePg>
X-ME-Received: <xmr:lVK_YuS8YjQHh6ATVN-N4qX2fapbY-KSFXLVNMLNNU3la4fhZVjZ3PEBhHGMgyvtfYJwcKnlGeDVe5f_RB6iDTTAKBt_f8gdCnW9mFED1WsqFUsldFlpUIHZTBu7mGIVas_bhA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehfedgudeggecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeeh
    gfdufeeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:lVK_Yjux0iKsqVqtDdBsTLFTukN4c0i-NDydJA7FsffE7qkd6SRhLg>
    <xmx:lVK_Ync8mOd5Hs3XKGkkxQQutCnfzJtCXnCoUWrkxN9GQqvqdz4-EA>
    <xmx:lVK_Yv1Ev9KmbIm3eUXMINBReiNIuyQcc8fQ3WcdbBD2eNMZPxFqzw>
    <xmx:mVK_YimYxP6DsLw8htRlTj1olHyqAnO6Ea3SMp1xmXtGFF9Eh_CABA>
Feedback-ID: i0ad843c9:Fastmail
From: Samuel Holland <samuel@sholland.org>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Samuel Holland <samuel@sholland.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,	Bjorn Helgaas <bhelgaas@google.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Borislav Petkov <bp@alien8.de>,
	Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,	Chris Zankel <chris@zankel.net>,
	Colin Ian King <colin.king@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dexuan Cui <decui@microsoft.com>,
	Florian Fainelli <f.fainelli@gmail.com>,	Guo Ren <guoren@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,	Haiyang Zhang <haiyangz@microsoft.com>,
	Helge Deller <deller@gmx.de>,	Ingo Molnar <mingo@redhat.com>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Jan Beulich <jbeulich@suse.com>,	Joerg Roedel <joro@8bytes.org>,
	Juergen Gross <jgross@suse.com>,	Julia Lawall <Julia.Lawall@inria.fr>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Kees Cook <keescook@chromium.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,	Matt Turner <mattst88@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,	Maximilian Heyne <mheyne@amazon.de>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Rich Felker <dalias@libc.org>,	Richard Henderson <rth@twiddle.net>,
	Rikard Falkeborn <rikard.falkeborn@gmail.com>,
	Rob Herring <robh@kernel.org>,	Russell King <linux@armlinux.org.uk>,
	Serge Semin <fancer.lancer@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	Sven Schnelle <svens@stackframe.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Wei Liu <wei.liu@kernel.org>,	Wei Xu <xuwei5@hisilicon.com>,
	Will Deacon <will@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	iommu@lists.linux-foundation.org,	iommu@lists.linux.dev,
	linux-alpha@vger.kernel.org,	linux-arm-kernel@lists.infradead.org,
	linux-hyperv@vger.kernel.org,	linux-ia64@vger.kernel.org,
	linux-kernel@vger.kernel.org,	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,	linux-pci@vger.kernel.org,
	linux-sh@vger.kernel.org,	linux-xtensa@linux-xtensa.org,	x86@kernel.org,
	xen-devel@lists.xenproject.org,	kernel test robot <lkp@intel.com>
Subject: [PATCH v3 2/8] genirq: GENERIC_IRQ_IPI depends on SMP
Date: Fri,  1 Jul 2022 15:00:50 -0500
Message-Id: <20220701200056.46555-3-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220701200056.46555-1-samuel@sholland.org>
References: <20220701200056.46555-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The generic IPI code depends on the IRQ affinity mask being allocated
and initialized. This will not be the case if SMP is disabled. Fix up
the remaining driver that selected GENERIC_IRQ_IPI in a non-SMP config.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v2)

Changes in v2:
 - New patch to prevent GENERIC_IRQ_IPI from being selected on !SMP

 drivers/irqchip/Kconfig | 2 +-
 kernel/irq/Kconfig      | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index d26a4ff7c99f..5dd98a81efc8 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -177,7 +177,7 @@ config MADERA_IRQ
 config IRQ_MIPS_CPU
 	bool
 	select GENERIC_IRQ_CHIP
-	select GENERIC_IRQ_IPI if SYS_SUPPORTS_MULTITHREADING
+	select GENERIC_IRQ_IPI if SMP && SYS_SUPPORTS_MULTITHREADING
 	select IRQ_DOMAIN
 	select GENERIC_IRQ_EFFECTIVE_AFF_MASK
 
diff --git a/kernel/irq/Kconfig b/kernel/irq/Kconfig
index 10929eda9825..fc760d064a65 100644
--- a/kernel/irq/Kconfig
+++ b/kernel/irq/Kconfig
@@ -82,6 +82,7 @@ config IRQ_FASTEOI_HIERARCHY_HANDLERS
 # Generic IRQ IPI support
 config GENERIC_IRQ_IPI
 	bool
+	depends on SMP
 	select IRQ_DOMAIN_HIERARCHY
 
 # Generic MSI interrupt support
-- 
2.35.1


