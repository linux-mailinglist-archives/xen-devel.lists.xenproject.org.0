Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A6F7D23D1
	for <lists+xen-devel@lfdr.de>; Sun, 22 Oct 2023 17:54:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.620669.966303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quam0-00008N-Hg; Sun, 22 Oct 2023 15:53:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 620669.966303; Sun, 22 Oct 2023 15:53:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quam0-0008Mz-8D; Sun, 22 Oct 2023 15:53:52 +0000
Received: by outflank-mailman (input) for mailman id 620669;
 Sun, 22 Oct 2023 15:53:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zZR7=GE=casper.srs.infradead.org=BATV+88d8721f4af1339c2fab+7364+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qualx-0007Cq-SG
 for xen-devel@lists.xenproject.org; Sun, 22 Oct 2023 15:53:49 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2daffbe2-70f3-11ee-9b0e-b553b5be7939;
 Sun, 22 Oct 2023 17:53:44 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1quakJ-008TGW-Gu; Sun, 22 Oct 2023 15:52:07 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1quakJ-001qZr-0Z; Sun, 22 Oct 2023 16:52:07 +0100
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
X-Inumbo-ID: 2daffbe2-70f3-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=EKjUCJKBd59P5cxJriDQFHF8sC3eB1BsnLW5Qch037k=; b=e2JwP3XOgcXNON2SV6S2by6iep
	34RgR39w+QTHdRpz5G3wLXbMGlpp2OwdWSD9zMC6mvvrB+qLY51mUjqzSevFFcVGrhD5lLVASVd+M
	TocwJShtBzKiZHJc8O405sOaERHgF8FZ/coOBR9VscvMhBhNr3m6mdkbeSgbTvkqfR2f2A9zY3bJm
	PHYRa4R7Ch6xFN3DXVUBzsitmK3COPKihJsAOj1x1FaOnhGhUow5RVvQKUAdbH1amNQ0Sksw++I22
	kolSa9ChKkx/F2TH+Omzll1cVli0qmDpwvXmwqaq8rcnknRrbhxXZfKL8gAkqdsZXrcy9isSlQO1A
	UbLogmLQ==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Beniamino Galvani <b.galvani@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Andrew Jeffery <andrew@aj.id.au>,
	Joel Stanley <joel@jms.id.au>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Jan Kiszka <jan.kiszka@web.de>,
	Tyrone Ting <kfting@nuvoton.com>,
	Hao Wu <wuhaotsh@google.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Helge Deller <deller@gmx.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Song Gao <gaosong@loongson.cn>,
	Thomas Huth <huth@tuxfamily.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jason Wang <jasowang@redhat.com>,
	Jia Liu <proljc@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Bin Meng <bin.meng@windriver.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH 24/45] hw/arm/fsl: use qemu_configure_nic_device()
Date: Sun, 22 Oct 2023 16:51:39 +0100
Message-Id: <20231022155200.436340-25-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231022155200.436340-1-dwmw2@infradead.org>
References: <20231022155200.436340-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/arm/fsl-imx25.c  | 2 +-
 hw/arm/fsl-imx6.c   | 2 +-
 hw/arm/fsl-imx6ul.c | 2 +-
 hw/arm/fsl-imx7.c   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
index 24c4374590..28084d2e5a 100644
--- a/hw/arm/fsl-imx25.c
+++ b/hw/arm/fsl-imx25.c
@@ -170,7 +170,7 @@ static void fsl_imx25_realize(DeviceState *dev, Error **errp)
     }
 
     object_property_set_uint(OBJECT(&s->fec), "phy-num", s->phy_num, &err);
-    qdev_set_nic_properties(DEVICE(&s->fec), &nd_table[0]);
+    qemu_configure_nic_device(DEVICE(&s->fec), true, NULL);
 
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->fec), errp)) {
         return;
diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 4fa7f0b95e..273bc79283 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -380,7 +380,7 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
     }
 
     object_property_set_uint(OBJECT(&s->eth), "phy-num", s->phy_num, &err);
-    qdev_set_nic_properties(DEVICE(&s->eth), &nd_table[0]);
+    qemu_configure_nic_device(DEVICE(&s->eth), true, NULL);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->eth), errp)) {
         return;
     }
diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
index e37b69a5e1..ca3dd439ec 100644
--- a/hw/arm/fsl-imx6ul.c
+++ b/hw/arm/fsl-imx6ul.c
@@ -442,7 +442,7 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
                                  s->phy_num[i], &error_abort);
         object_property_set_uint(OBJECT(&s->eth[i]), "tx-ring-num",
                                  FSL_IMX6UL_ETH_NUM_TX_RINGS, &error_abort);
-        qdev_set_nic_properties(DEVICE(&s->eth[i]), &nd_table[i]);
+        qemu_configure_nic_device(DEVICE(&s->eth[i]), true, NULL);
         sysbus_realize(SYS_BUS_DEVICE(&s->eth[i]), &error_abort);
 
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->eth[i]), 0,
diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index 474cfdc87c..1acbe065db 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -446,7 +446,7 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
                                  s->phy_num[i], &error_abort);
         object_property_set_uint(OBJECT(&s->eth[i]), "tx-ring-num",
                                  FSL_IMX7_ETH_NUM_TX_RINGS, &error_abort);
-        qdev_set_nic_properties(DEVICE(&s->eth[i]), &nd_table[i]);
+        qemu_configure_nic_device(DEVICE(&s->eth[i]), true, NULL);
         sysbus_realize(SYS_BUS_DEVICE(&s->eth[i]), &error_abort);
 
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->eth[i]), 0, FSL_IMX7_ENETn_ADDR[i]);
-- 
2.40.1


