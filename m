Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E15B1827966
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 21:51:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663904.1033889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMwaR-0002PG-HO; Mon, 08 Jan 2024 20:51:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663904.1033889; Mon, 08 Jan 2024 20:51:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMwaR-0002Ei-AY; Mon, 08 Jan 2024 20:51:07 +0000
Received: by outflank-mailman (input) for mailman id 663904;
 Mon, 08 Jan 2024 20:51:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NrlO=IS=casper.srs.infradead.org=BATV+41a72dc6539c0dfbbc31+7442+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1rMwaO-0000R6-8c
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 20:51:04 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1629df7-ae67-11ee-9b0f-b553b5be7939;
 Mon, 08 Jan 2024 21:51:01 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1rMwYk-008RQ3-KA; Mon, 08 Jan 2024 20:49:23 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1rMwYl-002NGS-0Y; Mon, 08 Jan 2024 20:49:23 +0000
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
X-Inumbo-ID: a1629df7-ae67-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=wozYunS9mL+E+NW7be8DLpB1Vtj79zSyr6dMjYfNaXI=; b=jcI3zWKyisQTWt932lF8taMSuX
	Fh58CKyE7nQO1wPJEhwKWAyAOihnTcN3D88J/0ElKQ04mAla5ZQvWXnaJKqK6nCkcTf4tPvJle/p/
	9CpBVgea3QhoLhn7gcat3RbTtqNqgSnxqw6uKNtJNt/tDXW5lCvqchHSrcRdot0vV4S2/SUWSCqCp
	+phQiHWjzINAILVomuhlMZGxsE2OAX1d3CBs8+xqtzNgA4sVpyrezcQeflHUo/inybz+jxsDChiqB
	Wg6i/u5ga2dtNc0038HhRYZdL7UsrzOb2pzE6aFKKrZWfn9LDsYF/a0C7xBenPqv32d2nHKcvUVR+
	a8xUQsFQ==;
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
Subject: [PATCH v3 34/46] hw/microblaze: use qemu_configure_nic_device()
Date: Mon,  8 Jan 2024 20:27:03 +0000
Message-ID: <20240108204909.564514-35-dwmw2@infradead.org>
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
 hw/microblaze/petalogix_ml605_mmu.c      | 3 +--
 hw/microblaze/petalogix_s3adsp1800_mmu.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_ml605_mmu.c
index fb7889cf67..0f5fabc32e 100644
--- a/hw/microblaze/petalogix_ml605_mmu.c
+++ b/hw/microblaze/petalogix_ml605_mmu.c
@@ -133,7 +133,6 @@ petalogix_ml605_init(MachineState *machine)
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, irq[TIMER_IRQ]);
 
     /* axi ethernet and dma initialization. */
-    qemu_check_nic_model(&nd_table[0], "xlnx.axi-ethernet");
     eth0 = qdev_new("xlnx.axi-ethernet");
     dma = qdev_new("xlnx.axi-dma");
 
@@ -145,7 +144,7 @@ petalogix_ml605_init(MachineState *machine)
                                   "axistream-connected-target", NULL);
     cs = object_property_get_link(OBJECT(dma),
                                   "axistream-control-connected-target", NULL);
-    qdev_set_nic_properties(eth0, &nd_table[0]);
+    qemu_configure_nic_device(eth0, true, NULL);
     qdev_prop_set_uint32(eth0, "rxmem", 0x1000);
     qdev_prop_set_uint32(eth0, "txmem", 0x1000);
     object_property_set_link(OBJECT(eth0), "axistream-connected", ds,
diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/petalogix_s3adsp1800_mmu.c
index 505639c298..dad46bd7f9 100644
--- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
+++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
@@ -114,9 +114,8 @@ petalogix_s3adsp1800_init(MachineState *machine)
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, TIMER_BASEADDR);
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, irq[TIMER_IRQ]);
 
-    qemu_check_nic_model(&nd_table[0], "xlnx.xps-ethernetlite");
     dev = qdev_new("xlnx.xps-ethernetlite");
-    qdev_set_nic_properties(dev, &nd_table[0]);
+    qemu_configure_nic_device(dev, true, NULL);
     qdev_prop_set_uint32(dev, "tx-ping-pong", 0);
     qdev_prop_set_uint32(dev, "rx-ping-pong", 0);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-- 
2.41.0


