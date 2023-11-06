Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4D47E2DB8
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 21:10:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628437.979968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05vI-0003Ge-3m; Mon, 06 Nov 2023 20:10:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628437.979968; Mon, 06 Nov 2023 20:10:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05vI-0003EA-0D; Mon, 06 Nov 2023 20:10:12 +0000
Received: by outflank-mailman (input) for mailman id 628437;
 Mon, 06 Nov 2023 20:10:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OHvK=GT=casper.srs.infradead.org=BATV+7ad6dfa9aff48d363c6b+7379+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r05hM-00024f-OZ
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 19:55:48 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7731e206-7cde-11ee-98da-6d05b1d4d9a1;
 Mon, 06 Nov 2023 20:55:42 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1r05fb-007tac-T3; Mon, 06 Nov 2023 19:54:00 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1r05fc-001GOn-0l; Mon, 06 Nov 2023 19:54:00 +0000
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
X-Inumbo-ID: 7731e206-7cde-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=zmRxefaOlZ1QCUdKZwdqB/DEaAmsXLMPcBmPIeG+a8A=; b=CULtrOgTvy2P+uj3GUT44YcvX5
	Oa6Y9aiFioc+wiiL3dwrqXBdUNnksVq5ypvQ8/iMRfKOBx30TQhHQ4xdg8TcHy3QzBAAzuWa5p5E6
	nAIseoMtwSdN7oulDwRDgsx4hWFaqLK5k21qgGeYz33T+m+tv9KF+lE8wc6IX/1xdg+bkhfP7LsXT
	vj6e+cD+9NazieNKE7mcE+KO7hcPrgfrRPO9WXY1UF5Z3DYohZxea8vDJmI0JNHzzwwWHoEFHJIfy
	/kpmpy6SbXnR/74ud8Czsbx3eS7b9jlYt0PS+b1R9fy6omZBi0VOBU5iT8gXsk8z74k/wRowc2fWB
	KZa17tGQ==;
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
Subject: [PATCH for-8.3 v2 31/46] hw/net/etraxfs-eth: use qemu_configure_nic_device()
Date: Mon,  6 Nov 2023 19:49:36 +0000
Message-ID: <20231106195352.301038-32-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106195352.301038-1-dwmw2@infradead.org>
References: <20231106195352.301038-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/cris/axis_dev88.c      | 9 ++++-----
 hw/net/etraxfs_eth.c      | 5 ++---
 include/hw/cris/etraxfs.h | 2 +-
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/hw/cris/axis_dev88.c b/hw/cris/axis_dev88.c
index d82050d927..5556634921 100644
--- a/hw/cris/axis_dev88.c
+++ b/hw/cris/axis_dev88.c
@@ -308,15 +308,14 @@ void axisdev88_init(MachineState *machine)
 
     /* Add the two ethernet blocks.  */
     dma_eth = g_malloc0(sizeof dma_eth[0] * 4); /* Allocate 4 channels.  */
-    etraxfs_eth_init(&nd_table[0], 0x30034000, 1, &dma_eth[0], &dma_eth[1]);
-    if (nb_nics > 1) {
-        etraxfs_eth_init(&nd_table[1], 0x30036000, 2, &dma_eth[2], &dma_eth[3]);
-    }
 
+    etraxfs_eth_init(0x30034000, 1, &dma_eth[0], &dma_eth[1]);
     /* The DMA Connector block is missing, hardwire things for now.  */
     etraxfs_dmac_connect_client(etraxfs_dmac, 0, &dma_eth[0]);
     etraxfs_dmac_connect_client(etraxfs_dmac, 1, &dma_eth[1]);
-    if (nb_nics > 1) {
+
+    if (qemu_find_nic_info("etraxfs-eth", true, "fseth")) {
+        etraxfs_eth_init(0x30036000, 2, &dma_eth[2], &dma_eth[3]);
         etraxfs_dmac_connect_client(etraxfs_dmac, 6, &dma_eth[2]);
         etraxfs_dmac_connect_client(etraxfs_dmac, 7, &dma_eth[3]);
     }
diff --git a/hw/net/etraxfs_eth.c b/hw/net/etraxfs_eth.c
index 1b82aec794..ab60eaac04 100644
--- a/hw/net/etraxfs_eth.c
+++ b/hw/net/etraxfs_eth.c
@@ -646,15 +646,14 @@ static void etraxfs_eth_class_init(ObjectClass *klass, void *data)
 
 /* Instantiate an ETRAXFS Ethernet MAC.  */
 DeviceState *
-etraxfs_eth_init(NICInfo *nd, hwaddr base, int phyaddr,
+etraxfs_eth_init(hwaddr base, int phyaddr,
                  struct etraxfs_dma_client *dma_out,
                  struct etraxfs_dma_client *dma_in)
 {
     DeviceState *dev;
-    qemu_check_nic_model(nd, "fseth");
 
     dev = qdev_new("etraxfs-eth");
-    qdev_set_nic_properties(dev, nd);
+    qemu_configure_nic_device(dev, true, "fseth");
     qdev_prop_set_uint32(dev, "phyaddr", phyaddr);
 
     /*
diff --git a/include/hw/cris/etraxfs.h b/include/hw/cris/etraxfs.h
index 467b529dc0..012c4e9974 100644
--- a/include/hw/cris/etraxfs.h
+++ b/include/hw/cris/etraxfs.h
@@ -31,7 +31,7 @@
 #include "hw/sysbus.h"
 #include "qapi/error.h"
 
-DeviceState *etraxfs_eth_init(NICInfo *nd, hwaddr base, int phyaddr,
+DeviceState *etraxfs_eth_init(hwaddr base, int phyaddr,
                               struct etraxfs_dma_client *dma_out,
                               struct etraxfs_dma_client *dma_in);
 
-- 
2.41.0


