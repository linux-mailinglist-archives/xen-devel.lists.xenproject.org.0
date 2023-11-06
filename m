Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4417E2DA6
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 21:08:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628385.979838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05tN-00030w-Aq; Mon, 06 Nov 2023 20:08:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628385.979838; Mon, 06 Nov 2023 20:08:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05tN-0002zF-6t; Mon, 06 Nov 2023 20:08:13 +0000
Received: by outflank-mailman (input) for mailman id 628385;
 Mon, 06 Nov 2023 20:08:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OHvK=GT=casper.srs.infradead.org=BATV+7ad6dfa9aff48d363c6b+7379+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r05hX-0001Ig-Gy
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 19:55:59 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e24d68d-7cde-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 20:55:53 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1r05fa-007taO-Kr; Mon, 06 Nov 2023 19:53:59 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1r05fa-001GNn-33; Mon, 06 Nov 2023 19:53:58 +0000
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
X-Inumbo-ID: 7e24d68d-7cde-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=mKejtkSe+nFfQ0aoeWucod44zhEmF2o9bYQegdFzkdU=; b=Rk23+bVe1uIucZnhqpW349FZ+y
	COtS9j6HVINOASM87trkyxdyoXEKEExBGPZCo0r51i8vE9fdkBU4t5bDpimD0Z9xRnYrg+35a3s3n
	VEw62xkWw34eQptQZjbrnUCSIAzgj18Wr6p7Tw1s13pPMK5m8cgESyzOJZ6CAebER98ZMDSzDMTF8
	74m6OdxEHV2vTDtEsI9QtKc2jf2BGO77UaO9Tg7nOSZp4PWRa99idqW/BK0F9M5ou8UHXCaW4X0DP
	lZyWMgICBLhH1K5EaV8GegsYRSnlz+aymO6vQeWf9ko0nNiWSzNq6EZgQhXxAA730V15hB+c/yvRB
	TRQacxNw==;
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
Subject: [PATCH for-8.3 v2 18/46] hw/sh4/r2d: use pci_init_nic_devices()
Date: Mon,  6 Nov 2023 19:49:23 +0000
Message-ID: <20231106195352.301038-19-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106195352.301038-1-dwmw2@infradead.org>
References: <20231106195352.301038-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Previously, the first PCI NIC would be assigned to slot 2 even if the
user override the model and made it something other than an rtl8139
which is the default. Everything else would be dynamically assigned.

Now, the first rtl8139 gets slot 2 and everything else is dynamic.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 hw/sh4/r2d.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index 4944994e9c..e9f316a6ce 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -240,7 +240,6 @@ static void r2d_init(MachineState *machine)
     MemoryRegion *sdram = g_new(MemoryRegion, 1);
     qemu_irq *irq;
     DriveInfo *dinfo;
-    int i;
     DeviceState *dev;
     SysBusDevice *busdev;
     MemoryRegion *address_space_mem = get_system_memory();
@@ -309,9 +308,8 @@ static void r2d_init(MachineState *machine)
                           0x555, 0x2aa, 0);
 
     /* NIC: rtl8139 on-board, and 2 slots. */
-    for (i = 0; i < nb_nics; i++)
-        pci_nic_init_nofail(&nd_table[i], pci_bus,
-                            mc->default_nic, i == 0 ? "2" : NULL);
+    pci_init_nic_in_slot(pci_bus, mc->default_nic, NULL, "2");
+    pci_init_nic_devices(pci_bus, mc->default_nic);
 
     /* USB keyboard */
     usb_create_simple(usb_bus_find(-1), "usb-kbd");
-- 
2.41.0


