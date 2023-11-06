Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E88E7E2DB7
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 21:10:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628434.979952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05vA-0002Kk-S2; Mon, 06 Nov 2023 20:10:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628434.979952; Mon, 06 Nov 2023 20:10:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05vA-0002Gp-OX; Mon, 06 Nov 2023 20:10:04 +0000
Received: by outflank-mailman (input) for mailman id 628434;
 Mon, 06 Nov 2023 20:10:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OHvK=GT=casper.srs.infradead.org=BATV+7ad6dfa9aff48d363c6b+7379+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r05hQ-0001Ig-Fd
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 19:55:52 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79ca66fb-7cde-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 20:55:46 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1r05fc-007tas-W0; Mon, 06 Nov 2023 19:54:01 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1r05fd-001GPh-0e; Mon, 06 Nov 2023 19:54:01 +0000
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
X-Inumbo-ID: 79ca66fb-7cde-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=3IJgWxMmUdLOBVuYUZ4BO4uyS9hEOvqvAglyEu5N/aM=; b=j6KlICENR/MCVSKkvWFpHlDir2
	SJpTd6hXGivub3V8Rz710ZQhhjzcIYKyHLqI4xBbKgJlXCMQUtDDjojU3CtRwaOyojn2drQl74kTH
	Kcola95OJDvw1AiBtg+MWnNHBl6subOMR5K8WmYvQway11zNxqyPfd7dY/I+/T7J8Bnj6qcnIDRwg
	UXPppJ5I9BsnvVnqy7e0KHwUcjjRNae1sgCvkXqLn7Q6wLNZAyGNSsLC3bLNadONxLFNKND0u0332
	1VsdAXPFzU2KF+iIIkDrImtJZ2ad2Rl8ciGW6sNehFhqZZiXTVLM9if5CUSEg4+qs0cSblZv2qdiV
	DXZo9Nsw==;
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
Subject: [PATCH for-8.3 v2 42/46] hw/xtensa/xtfpga: use qemu_create_nic_device()
Date: Mon,  6 Nov 2023 19:49:47 +0000
Message-ID: <20231106195352.301038-43-dwmw2@infradead.org>
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
 hw/xtensa/xtfpga.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
index fbad1c83a3..f49e6591dc 100644
--- a/hw/xtensa/xtfpga.c
+++ b/hw/xtensa/xtfpga.c
@@ -141,14 +141,16 @@ static void xtfpga_net_init(MemoryRegion *address_space,
         hwaddr base,
         hwaddr descriptors,
         hwaddr buffers,
-        qemu_irq irq, NICInfo *nd)
+        qemu_irq irq)
 {
     DeviceState *dev;
     SysBusDevice *s;
     MemoryRegion *ram;
 
-    dev = qdev_new("open_eth");
-    qdev_set_nic_properties(dev, nd);
+    dev = qemu_create_nic_device("open_eth", true, NULL);
+    if (!dev) {
+        return;
+    }
 
     s = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(s, &error_fatal);
@@ -301,10 +303,7 @@ static void xtfpga_init(const XtfpgaBoardDesc *board, MachineState *machine)
         memory_region_add_subregion(system_memory, board->io[1], io);
     }
     xtfpga_fpga_init(system_io, 0x0d020000, freq);
-    if (nd_table[0].used) {
-        xtfpga_net_init(system_io, 0x0d030000, 0x0d030400, 0x0d800000,
-                        extints[1], nd_table);
-    }
+    xtfpga_net_init(system_io, 0x0d030000, 0x0d030400, 0x0d800000, extints[1]);
 
     serial_mm_init(system_io, 0x0d050020, 2, extints[0],
                    115200, serial_hd(0), DEVICE_NATIVE_ENDIAN);
-- 
2.41.0


