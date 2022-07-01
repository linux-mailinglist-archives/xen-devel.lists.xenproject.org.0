Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAB4563ADD
	for <lists+xen-devel@lfdr.de>; Fri,  1 Jul 2022 22:19:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359169.588570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7N6G-0005VT-2h; Fri, 01 Jul 2022 20:18:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359169.588570; Fri, 01 Jul 2022 20:18:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7N6F-0005TN-Ug; Fri, 01 Jul 2022 20:18:47 +0000
Received: by outflank-mailman (input) for mailman id 359169;
 Fri, 01 Jul 2022 20:01:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rlr7=XG=sholland.org=samuel@srs-se1.protection.inumbo.net>)
 id 1o7MpJ-000470-V1
 for xen-devel@lists.xenproject.org; Fri, 01 Jul 2022 20:01:18 +0000
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d8d8aa0-f978-11ec-bd2d-47488cf2e6aa;
 Fri, 01 Jul 2022 22:01:13 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 28AC058020B;
 Fri,  1 Jul 2022 16:01:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 01 Jul 2022 16:01:10 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Jul 2022 16:00:57 -0400 (EDT)
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
X-Inumbo-ID: 8d8d8aa0-f978-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1656705670; x=1656712870; bh=h3WN3AcddFJuwhQ39XPEdgr5t
	ejPWmRF9a5JWUKLi6w=; b=mK5frjjpRETCdaizhOvpq/mQo5UlOZqfHCt356wLu
	+SqVP3qKJ9LvP7YyRWEopUxCgCJ/Co0nb1GRIXbVwdtlJ5JrYoRlSvc+27WDag9+
	3jqJC6Nc5lLjDB1EbFnpv2S6VMiJgoGG3ESQyrzvFx4wbwb1+hfvfkj14nzE1iZ9
	iHVs2Uh7tOwAj5coKNt98E1KuIr4Dy7ZidSi8Si+tRxxbGIc8g9/Wkp/PXxkdKWp
	GwXvkDhS2Mkt7Y8U+OzIUgUEfaENyM7PjR+7UVXgmM8J+652ddmFvBKyk157w8wr
	Skl8C3hKCbHheCLVFZJbuy7hz1/cffoSdxxCfnrh8YV+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1656705670; x=1656712870; bh=h3WN3AcddFJuwhQ39XPEdgr5tejPWmRF9a5
	JWUKLi6w=; b=hcCVwh1PvSeKLtV/WWesjzpJEJOw4znKr5Z/2vhxnZuKQA9kLw4
	/4+bCBG81guTmscsfsRlkY2MRf/An6IfLb4PqUB9cFC2NzaudqFlvP/yY19K+3XC
	pDHCoLiIcwUV2Xv5FAIqCmEYAOVR+oCL2f261uukUnOGmb9sZJ1Wjru1FpMPNx9q
	O20C8qlSGZIk/uqxcd6LnT2yDuqwiTmpUUWND72se1ELzfF/mrU6icJu6Gm0jlH3
	iWOFR5OoOCZxlEPQplc7c7ud1SjE6qek/nk6mnJ70FNjkvapXHjyVwlAV5qpv1MZ
	45+fzYTFXAvc9YboPqeOQ31my0wQpPDiZ5Q==
X-ME-Sender: <xms:e1K_YqJAKXaKPgqyd59ldyt87npfqKJCG8Fa8IiJ1JGRiUiSXx5JZg>
    <xme:e1K_YiIt8LjVqOvwpx_JqZXxhJz3pskkEoDpx0DfqF9QwrmlD77DvYrLphtzsH91c
    60EnwaE7sSCA8LhkQ>
X-ME-Received: <xmr:e1K_YqsbiJXFwsSStjJJO67Bifhg0yOnU6Z4_h1F4ezRCF_0D6gcyJ1rBH7JskXj8BCpGV4CECN0ypLF1eSiq5ghfDtA6Nb3u4bteUm49CHrPVJYe6DLnAKCGajaiAQKWL5-Lw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehfedgudeggecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpeekheffteehtdetfffgfeetteejvdefleeuvedufffguedtjedvheel
    vddvfffhveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
    ugdrohhrgh
X-ME-Proxy: <xmx:e1K_YvbVVgQANbs4tH6mMUrH5LaNLres37xpgQFzFinmY6f7nPb4Fg>
    <xmx:e1K_YhbiP6yq2Gi3AoIAcfhp4QohMreFnvgTLD9awWXIWatRIZ3Cjw>
    <xmx:e1K_YrCjgb2M3iT9zxycFn46jQ9pLIWED1rqKrx13LiM_I0tfM9RnQ>
    <xmx:hlK_YgfaZPstR3sDyiLp39VIN104HgzzMuXBbFWrwe3H_JzEL7MHlA>
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
Subject: [PATCH v3 0/8] genirq: Provide real IRQ affinity masks in non-SMP configs
Date: Fri,  1 Jul 2022 15:00:48 -0500
Message-Id: <20220701200056.46555-1-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series solves some inconsistency with how IRQ affinity masks are
handled between SMP and non-SMP configurations.

In non-SMP configs, an IRQ's true affinity is always cpumask_of(0), so
irq_{,data_}get_affinity_mask now return that, instead of returning an
uninitialized per-IRQ cpumask. This change makes iterating over the
affinity mask do the right thing in both SMP and non-SMP configurations.

To accomplish that:
 - patches 1-3 disable some library code that was broken anyway on !SMP
 - patches 4-7 refactor the code so that irq_{,data_}get_affinity_mask
   can return a const cpumask, since that is what cpumask_of provides
 - patch 8 drops the per-IRQ cpumask and replaces it with cpumask_of(0)

This series was split from the v2 series here, which uses the new
behavior in the RISC-V PLIC irqchip driver:

https://lore.kernel.org/lkml/20220616064028.57933-1-samuel@sholland.org/

Changes in v3:
 - New patch to fix build errors in uniprocessor MIPS configs
 - New patch to drop irq_init_effective_affinity
 - New patch to introduce irq_data_update_affinity
 - New patch to make the returned cpumasks const
 - Use cpumask_of(0) instead of cpu_possible_mask

Changes in v2:
 - New patch to prevent GENERIC_IRQ_IPI from being selected on !SMP

Samuel Holland (8):
  irqchip/mips-gic: Only register IPI domain when SMP is enabled
  genirq: GENERIC_IRQ_IPI depends on SMP
  genirq: GENERIC_IRQ_EFFECTIVE_AFF_MASK depends on SMP
  genirq: Drop redundant irq_init_effective_affinity
  genirq: Refactor accessors to use irq_data_get_affinity_mask
  genirq: Add and use an irq_data_update_affinity helper
  genirq: Return a const cpumask from irq_data_get_affinity_mask
  genirq: Provide an IRQ affinity mask in non-SMP configs

 arch/alpha/kernel/irq.c              |  2 +-
 arch/arm/mach-hisi/Kconfig           |  2 +-
 arch/ia64/kernel/iosapic.c           |  2 +-
 arch/ia64/kernel/irq.c               |  4 +-
 arch/ia64/kernel/msi_ia64.c          |  4 +-
 arch/mips/cavium-octeon/octeon-irq.c |  4 +-
 arch/parisc/kernel/irq.c             |  2 +-
 arch/sh/kernel/irq.c                 |  7 +--
 arch/x86/hyperv/irqdomain.c          |  2 +-
 arch/xtensa/kernel/irq.c             |  7 +--
 drivers/iommu/hyperv-iommu.c         |  2 +-
 drivers/irqchip/Kconfig              | 19 +++----
 drivers/irqchip/irq-bcm6345-l1.c     |  4 +-
 drivers/irqchip/irq-mips-gic.c       | 80 +++++++++++++++++++---------
 drivers/parisc/iosapic.c             |  2 +-
 drivers/pci/controller/pci-hyperv.c  | 10 ++--
 drivers/sh/intc/chip.c               |  2 +-
 drivers/xen/events/events_base.c     |  7 +--
 include/linux/irq.h                  | 34 ++++++++----
 kernel/irq/Kconfig                   |  2 +
 kernel/irq/chip.c                    |  8 +--
 kernel/irq/debugfs.c                 |  2 +-
 kernel/irq/ipi.c                     | 16 +++---
 kernel/irq/manage.c                  | 10 +---
 24 files changed, 140 insertions(+), 94 deletions(-)

-- 
2.35.1


