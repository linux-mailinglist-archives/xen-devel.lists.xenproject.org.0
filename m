Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA8A563ADC
	for <lists+xen-devel@lfdr.de>; Fri,  1 Jul 2022 22:19:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359177.588599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7N6H-00061T-MY; Fri, 01 Jul 2022 20:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359177.588599; Fri, 01 Jul 2022 20:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7N6H-0005u7-G4; Fri, 01 Jul 2022 20:18:49 +0000
Received: by outflank-mailman (input) for mailman id 359177;
 Fri, 01 Jul 2022 20:01:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rlr7=XG=sholland.org=samuel@srs-se1.protection.inumbo.net>)
 id 1o7Mpj-00047i-2s
 for xen-devel@lists.xenproject.org; Fri, 01 Jul 2022 20:01:43 +0000
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ffb7752-f978-11ec-bf74-3be3494bec92;
 Fri, 01 Jul 2022 22:01:42 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 88D6C5802F4;
 Fri,  1 Jul 2022 16:01:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 01 Jul 2022 16:01:41 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Jul 2022 16:01:36 -0400 (EDT)
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
X-Inumbo-ID: 9ffb7752-f978-11ec-bf74-3be3494bec92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1656705701; x=1656712901; bh=0L
	WuRMkphck+oUsETtbUMciB/g6XpbS+D68bi898KtM=; b=AqGoMTSNUno8lOmyDh
	KCwBkoAA7CbRzCpTwUdrVZNLF/wgidvQ7dsm+84o2fZ7gQevOX9qgVYV5nm/9kgO
	AMuQd8xE3VTWjlAJ7GrdD9VG7BV18Jcp9kKqlP10nOfIKsoMI+rW7kzM0NAfbTyC
	NWr74D8Q3JSoeOaEx9LsHr33xds/373ohmcrmDKPwF8OjXUOpnM+aWDRtp6nuvq9
	kg59XMZJPKD6+LWdXV+szMDXjt+Bh7ouD13imUf0Q05dynZ6LTdGmF8mVgEGl3Bl
	ONZn3X292lorO+Z+uaZEodDFOzhGvINgJHQDr8YSLNCPUjVe/p4PN6U1+nlRcr03
	GbWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1656705701; x=1656712901; bh=0LWuRMkphck+o
	UsETtbUMciB/g6XpbS+D68bi898KtM=; b=oa1e9Su6i+EtxBIhYMfUYN1BBIh7+
	NtLc3K9bSFNOEpdIhhM9orp+f/WF+uOfv1NI8kwLKLdemiOeS5HWJECGkfsHhJiH
	/wrY8WMMNhZUZUQf87Y6I2nlwQL4IKXSCH2sx7h4StxNsLo412pY5+cK8XhqNURa
	IF4psEvV+ZGo699etAF0/P+4jL5LalpbzQlttWsppbNEXfxA/dOghfaTOCAwlKrK
	KEvs69E1t/EoreKt1IwBdd8N4B9H428Bsjz94BHuby3lv0Gnlfekvlya7hY+n98C
	YWKS5+DGo6Bue2FdLbpuwQxoB2okv4DaH6kIF8BDFGbnyGUVJ78Jz+rvQ==
X-ME-Sender: <xms:olK_YsFQaQWqF-aONlCFJ5uetgmJnec1thbISaSBgnaCH8jS6vgdlw>
    <xme:olK_YlXkRgS5TvEifhOxL8eAll0aQOmledIk1hyN2rgNMA13JYmstRmbpGOaRmTU-
    H2H_Gklvg3vNf_76g>
X-ME-Received: <xmr:olK_YmLuD69cpfSzw-R4kmMPgu2jyauTWKCQHkDFAgmSZn9Gis4bbGNPIwkocA_DrrsH3sMvcbGjSDo8KSO7QZfNqsw4dV7PcL3l-1zAidbDC6DmKW4D1HlwVY3xH3m954qqMg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehfedgudeggecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeeh
    gfdufeeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:olK_YuH3L90nAfoF2N8s9mi1lvzCGpKg5B0fSYH1opyql0hpPhTvBg>
    <xmx:olK_YiV10CMXHptGh7LyGaSf02IoE_5CXIQLqvsRS8VJkIe4doHZvA>
    <xmx:olK_YhO7Ax5bd7URto_P8m9sgMbfhMUEE1FQyOCxW1mjUcM8gkrmbw>
    <xmx:pVK_YnWNuGw-JrwdgPZRMxAas6DoPrjYmDFLwWpctwyYTLAPtQGZKg>
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
	xen-devel@lists.xenproject.org
Subject: [PATCH v3 4/8] genirq: Drop redundant irq_init_effective_affinity
Date: Fri,  1 Jul 2022 15:00:52 -0500
Message-Id: <20220701200056.46555-5-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220701200056.46555-1-samuel@sholland.org>
References: <20220701200056.46555-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It does exactly the same thing as irq_data_update_effective_affinity.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

Changes in v3:
 - New patch to drop irq_init_effective_affinity

 kernel/irq/manage.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 8c396319d5ac..40fe7806cc8c 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -205,16 +205,8 @@ static void irq_validate_effective_affinity(struct irq_data *data)
 	pr_warn_once("irq_chip %s did not update eff. affinity mask of irq %u\n",
 		     chip->name, data->irq);
 }
-
-static inline void irq_init_effective_affinity(struct irq_data *data,
-					       const struct cpumask *mask)
-{
-	cpumask_copy(irq_data_get_effective_affinity_mask(data), mask);
-}
 #else
 static inline void irq_validate_effective_affinity(struct irq_data *data) { }
-static inline void irq_init_effective_affinity(struct irq_data *data,
-					       const struct cpumask *mask) { }
 #endif
 
 int irq_do_set_affinity(struct irq_data *data, const struct cpumask *mask,
@@ -347,7 +339,7 @@ static bool irq_set_affinity_deactivated(struct irq_data *data,
 		return false;
 
 	cpumask_copy(desc->irq_common_data.affinity, mask);
-	irq_init_effective_affinity(data, mask);
+	irq_data_update_effective_affinity(data, mask);
 	irqd_set(data, IRQD_AFFINITY_SET);
 	return true;
 }
-- 
2.35.1


