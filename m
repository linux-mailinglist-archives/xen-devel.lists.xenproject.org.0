Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA247827965
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 21:51:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663906.1033908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMwaT-0002rZ-B3; Mon, 08 Jan 2024 20:51:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663906.1033908; Mon, 08 Jan 2024 20:51:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMwaS-0002fu-QO; Mon, 08 Jan 2024 20:51:08 +0000
Received: by outflank-mailman (input) for mailman id 663906;
 Mon, 08 Jan 2024 20:51:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NrlO=IS=casper.srs.infradead.org=BATV+41a72dc6539c0dfbbc31+7442+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1rMwaP-0000R6-8w
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 20:51:05 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a24ba91e-ae67-11ee-9b0f-b553b5be7939;
 Mon, 08 Jan 2024 21:51:02 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1rMwYj-008RPl-Eh; Mon, 08 Jan 2024 20:49:22 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1rMwYk-002NFO-0e; Mon, 08 Jan 2024 20:49:22 +0000
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
X-Inumbo-ID: a24ba91e-ae67-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=hIoRnAOMf4YLSnQadmaBzYXHMtK98X95ymuChZmuyOk=; b=nfxsfbqV1CHr1yheFZqmqLuDWj
	OkCLvnwbhPHn2IVSnOAZlJcmn3l++D3kgPeT6bXOqWCPoFwuMqq4di8mfLBX9m3NESJ0NiMZJVYdY
	A+OO59fTIAzChlNUEYpim+kMzrYnSgEY8y8oqz6pB2juLoGEPrW9WE6gQOiWcl6UaumHGjhLukdLn
	xW/kDvmrsqXhVWnlafADfHvUWavzvCPo/+D9N2eKUEPzFC5ayE9nYyc8LtXHw/KOj0WfTVgx3v14M
	o93mKqGsZVbRFaHaToR+1JuwA6mCR6EY/rPI2QAFvSMx7dqTsPo0o2ktlvxJnt7wd9L3Toaw3Ejlo
	tAby7F6Q==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Beniamino Galvani <b.galvani@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
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
	Weiwei Li <liwei1518@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
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
	xen-devel@lists.xenproject.org,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH v3 21/46] hw/arm/allwinner: use qemu_configure_nic_device()
Date: Mon,  8 Jan 2024 20:26:50 +0000
Message-ID: <20240108204909.564514-22-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240108204909.564514-1-dwmw2@infradead.org>
References: <20240108204909.564514-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/arm/allwinner-a10.c |  6 +-----
 hw/arm/allwinner-h3.c  |  6 +-----
 hw/arm/allwinner-r40.c | 27 ++-------------------------
 3 files changed, 4 insertions(+), 35 deletions(-)

diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index b0ea3f7f66..57f52871ec 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -142,11 +142,7 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
     sysbus_realize(SYS_BUS_DEVICE(&s->dramc), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->dramc), 0, AW_A10_DRAMC_BASE);
 
-    /* FIXME use qdev NIC properties instead of nd_table[] */
-    if (nd_table[0].used) {
-        qemu_check_nic_model(&nd_table[0], TYPE_AW_EMAC);
-        qdev_set_nic_properties(DEVICE(&s->emac), &nd_table[0]);
-    }
+    qemu_configure_nic_device(DEVICE(&s->emac), true, NULL);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->emac), errp)) {
         return;
     }
diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
index f05afddf7e..4f102ad082 100644
--- a/hw/arm/allwinner-h3.c
+++ b/hw/arm/allwinner-h3.c
@@ -369,11 +369,7 @@ static void allwinner_h3_realize(DeviceState *dev, Error **errp)
                               "sd-bus");
 
     /* EMAC */
-    /* FIXME use qdev NIC properties instead of nd_table[] */
-    if (nd_table[0].used) {
-        qemu_check_nic_model(&nd_table[0], TYPE_AW_SUN8I_EMAC);
-        qdev_set_nic_properties(DEVICE(&s->emac), &nd_table[0]);
-    }
+    qemu_configure_nic_device(DEVICE(&s->emac), true, NULL);
     object_property_set_link(OBJECT(&s->emac), "dma-memory",
                              OBJECT(get_system_memory()), &error_fatal);
     sysbus_realize(SYS_BUS_DEVICE(&s->emac), &error_fatal);
diff --git a/hw/arm/allwinner-r40.c b/hw/arm/allwinner-r40.c
index a0d367c60d..4d5661b014 100644
--- a/hw/arm/allwinner-r40.c
+++ b/hw/arm/allwinner-r40.c
@@ -294,7 +294,6 @@ static void allwinner_r40_init(Object *obj)
 
 static void allwinner_r40_realize(DeviceState *dev, Error **errp)
 {
-    const char *r40_nic_models[] = { "gmac", "emac", NULL };
     AwR40State *s = AW_R40(dev);
 
     /* CPUs */
@@ -454,31 +453,8 @@ static void allwinner_r40_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->dramc), 2,
                     s->memmap[AW_R40_DEV_DRAMPHY]);
 
-    /* nic support gmac and emac */
-    for (int i = 0; i < ARRAY_SIZE(r40_nic_models) - 1; i++) {
-        NICInfo *nic = &nd_table[i];
-
-        if (!nic->used) {
-            continue;
-        }
-        if (qemu_show_nic_models(nic->model, r40_nic_models)) {
-            exit(0);
-        }
-
-        switch (qemu_find_nic_model(nic, r40_nic_models, r40_nic_models[0])) {
-        case 0: /* gmac */
-            qdev_set_nic_properties(DEVICE(&s->gmac), nic);
-            break;
-        case 1: /* emac */
-            qdev_set_nic_properties(DEVICE(&s->emac), nic);
-            break;
-        default:
-            exit(1);
-            break;
-        }
-    }
-
     /* GMAC */
+    qemu_configure_nic_device(DEVICE(&s->gmac), true, "gmac");
     object_property_set_link(OBJECT(&s->gmac), "dma-memory",
                                      OBJECT(get_system_memory()), &error_fatal);
     sysbus_realize(SYS_BUS_DEVICE(&s->gmac), &error_fatal);
@@ -487,6 +463,7 @@ static void allwinner_r40_realize(DeviceState *dev, Error **errp)
                        qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_GMAC));
 
     /* EMAC */
+    qemu_configure_nic_device(DEVICE(&s->emac), true, "emac");
     sysbus_realize(SYS_BUS_DEVICE(&s->emac), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->emac), 0, s->memmap[AW_R40_DEV_EMAC]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->emac), 0,
-- 
2.41.0


