Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CDE7E2DAC
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 21:08:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628400.979888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05ty-0005T2-QM; Mon, 06 Nov 2023 20:08:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628400.979888; Mon, 06 Nov 2023 20:08:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05ty-0005QN-Lj; Mon, 06 Nov 2023 20:08:50 +0000
Received: by outflank-mailman (input) for mailman id 628400;
 Mon, 06 Nov 2023 20:08:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwd5=GT=desiato.srs.infradead.org=BATV+aa7b7dce24b49c47a83c+7379+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r05hN-00024f-Oc
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 19:55:49 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 779c45cb-7cde-11ee-98da-6d05b1d4d9a1;
 Mon, 06 Nov 2023 20:55:42 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1r05fb-00AkFy-2Z; Mon, 06 Nov 2023 19:54:02 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1r05fb-001GO0-0s; Mon, 06 Nov 2023 19:53:59 +0000
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
X-Inumbo-ID: 779c45cb-7cde-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=hIoRnAOMf4YLSnQadmaBzYXHMtK98X95ymuChZmuyOk=; b=qUzKCqpVO6Udx/7XIIZTFy0bXa
	8m85YwoNugBIZJ3XycbR/IgX5y/nXHX99FXCHqy5/o1vseWe0iaTrMoL7MC9FrQ0dc15abMItpQYp
	ZWJR1xN6KWhkW72+kWxsmKO27l6QjOeqBVWusI+Hz2MbeJrLM2hFQkN4Kf/4BSyixYnl65hkvrThQ
	qUJl8QRy1qnLdzOGW+Q2qIXWES9a99eal/SYiDM/UTBtyKCjIVqTujTI8PVOfA0Hg0nF4M2XIhOPE
	pqd28U2LshWkEgecDecNcvuQck8JMbE2m/iNgYoQnZgpMkJjSO7ZVbLHC9lvfQYXkLzxlaVVbyegU
	pI4+5QFA==;
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
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
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
Subject: [PATCH for-8.3 v2 21/46] hw/arm/allwinner: use qemu_configure_nic_device()
Date: Mon,  6 Nov 2023 19:49:26 +0000
Message-ID: <20231106195352.301038-22-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106195352.301038-1-dwmw2@infradead.org>
References: <20231106195352.301038-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

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


