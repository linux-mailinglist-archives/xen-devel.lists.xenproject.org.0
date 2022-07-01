Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F31563ADA
	for <lists+xen-devel@lfdr.de>; Fri,  1 Jul 2022 22:19:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359179.588609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7N6I-0006Ev-AR; Fri, 01 Jul 2022 20:18:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359179.588609; Fri, 01 Jul 2022 20:18:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7N6H-00061B-UN; Fri, 01 Jul 2022 20:18:49 +0000
Received: by outflank-mailman (input) for mailman id 359179;
 Fri, 01 Jul 2022 20:01:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rlr7=XG=sholland.org=samuel@srs-se1.protection.inumbo.net>)
 id 1o7Mpo-000470-Md
 for xen-devel@lists.xenproject.org; Fri, 01 Jul 2022 20:01:48 +0000
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a33720c3-f978-11ec-bd2d-47488cf2e6aa;
 Fri, 01 Jul 2022 22:01:47 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id F1DE55802F6;
 Fri,  1 Jul 2022 16:01:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 01 Jul 2022 16:01:46 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Jul 2022 16:01:41 -0400 (EDT)
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
X-Inumbo-ID: a33720c3-f978-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1656705706; x=1656712906; bh=SS
	qXvxPvOnT181Alnoj0HfgL9fqTJVzreJxmfCVyBec=; b=hcAoBpvIf8eiMsWnHm
	b6RJp+0UU2OILuy21U79vOjusxjAcQG94kzCl/SLOhhz8J4ASW+y84iY/hEL50ms
	+t+80HjBAylZNEJe73yGhHSZF1RSQ8RBU9Nk62QyCXZpUC4CexurEGTlBgY/Xqfo
	fnfCIqYMFwRBTgEwEckqi0Kl9E6cHZVfUrF5kxIWdFViA5bUJ11OHLJ7T0XapXw2
	hQWKkSyPabF2oJi63qd5eTn9Zl4sQmG20eYW/wqRNYdW/SrAsFhGxn4LKFrrzqDC
	C0MqxbtLaYxpKOf9o9kKWlf6yKvCjeXy1x18+k24AKggcDhNdzIH/iJu5OZQ3wo4
	ssMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1656705706; x=1656712906; bh=SSqXvxPvOnT18
	1Alnoj0HfgL9fqTJVzreJxmfCVyBec=; b=HeWsMOcvIEpk7+MFtWHCXsiI6BlFC
	2TQ2SkcGU6TjX/RAuIxgMoxDlrLAJRLOQUP5M4Vjn/Sk2LIfFF6zmyCdELkbAfiW
	sNvfuqkLM1Vey2QklfYRRWjhcegVctGnxhxUwegYbB0z6YgklYBKnTe07fR9Aokx
	OJk4Rl2PfNKRw931jKDBYNYjhcdhJJxhHzUaHJY1VFb0uXTx2Qq9+O7Z8+sDYq3K
	dW+YTOeJLeT+EWHVFce25KHIXMDeukkeCTF05NMBW9QbVqWeENDneUsjCVRvIwS4
	+pREO1Ryo1aq2EmzH+e4VaMl82vWzrZw+kMmsklRZow8dIJvLbZg3JAtQ==
X-ME-Sender: <xms:qFK_YsIaYF4zQr4W2reW40ZCVdf18qMP0jUxBhRM2F9XT3OMoZE-fQ>
    <xme:qFK_YsLMw7Ul-MFWvL5vjLl8kF8OII4_AxB68OblZjKrRy2kL3D-hexNKYm7eeilY
    r3A0Nm-DvJnaB1bqw>
X-ME-Received: <xmr:qFK_YsvSjEToVoJH77gEMjDuattqvftr9In9WoGGrsXJF0G4gbll_vSjSD0PfO7MeF139vM38mNTdntEoLC6DmjMwlneu3GzSMNeIsU0zW-j4HFzvCUiSUQZYQsfYrB4ht35Fw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehfedgudeggecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeeh
    gfdufeeitdevteenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:qFK_YpaOX1fO-6TE3RDUrGUqEks9gqQTGKtyHpwS4EkpGFs3D_QX1g>
    <xmx:qFK_YjY-VtD47ytaYrZ-MHfYlS9aFWa7-aZfO5UVVLGUS3nufnJ-2Q>
    <xmx:qFK_YlCdS98PzzFa3RHRnOz63A6BS-YMIMrSNYdRpcIEip8IzR4YhQ>
    <xmx:qlK_YnrH17XSu6_tw5n16RVzGLdNEhRKaiCIhf79YUHgEBSwJGS5nQ>
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
Subject: [PATCH v3 5/8] genirq: Refactor accessors to use irq_data_get_affinity_mask
Date: Fri,  1 Jul 2022 15:00:53 -0500
Message-Id: <20220701200056.46555-6-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220701200056.46555-1-samuel@sholland.org>
References: <20220701200056.46555-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A couple of functions directly reference the affinity mask. Route them
through irq_data_get_affinity_mask so they will pick up any refactoring
done there.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v1)

 include/linux/irq.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index 505308253d23..69ee4e2f36ce 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -879,16 +879,16 @@ static inline int irq_data_get_node(struct irq_data *d)
 	return irq_common_data_get_node(d->common);
 }
 
-static inline struct cpumask *irq_get_affinity_mask(int irq)
+static inline struct cpumask *irq_data_get_affinity_mask(struct irq_data *d)
 {
-	struct irq_data *d = irq_get_irq_data(irq);
-
-	return d ? d->common->affinity : NULL;
+	return d->common->affinity;
 }
 
-static inline struct cpumask *irq_data_get_affinity_mask(struct irq_data *d)
+static inline struct cpumask *irq_get_affinity_mask(int irq)
 {
-	return d->common->affinity;
+	struct irq_data *d = irq_get_irq_data(irq);
+
+	return d ? irq_data_get_affinity_mask(d) : NULL;
 }
 
 #ifdef CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK
@@ -910,7 +910,7 @@ static inline void irq_data_update_effective_affinity(struct irq_data *d,
 static inline
 struct cpumask *irq_data_get_effective_affinity_mask(struct irq_data *d)
 {
-	return d->common->affinity;
+	return irq_data_get_affinity_mask(d);
 }
 #endif
 
-- 
2.35.1


