Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4E37D23D7
	for <lists+xen-devel@lfdr.de>; Sun, 22 Oct 2023 17:54:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.620667.966288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qualy-000889-VO; Sun, 22 Oct 2023 15:53:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 620667.966288; Sun, 22 Oct 2023 15:53:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qualy-0007yb-J3; Sun, 22 Oct 2023 15:53:50 +0000
Received: by outflank-mailman (input) for mailman id 620667;
 Sun, 22 Oct 2023 15:53:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zZR7=GE=casper.srs.infradead.org=BATV+88d8721f4af1339c2fab+7364+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qualw-0007Cq-S6
 for xen-devel@lists.xenproject.org; Sun, 22 Oct 2023 15:53:48 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d261ffa-70f3-11ee-9b0e-b553b5be7939;
 Sun, 22 Oct 2023 17:53:44 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1quakJ-008TGU-Gp; Sun, 22 Oct 2023 15:52:07 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1quakI-001qZR-1q; Sun, 22 Oct 2023 16:52:06 +0100
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
X-Inumbo-ID: 2d261ffa-70f3-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=ZVsyEacZEPo9v+IdyFxa1vXiELDpVwrjFPgVgSsBPjo=; b=BnpKw0aGF9RE8oqIh+1zerFI2O
	i2TeYnOG/6eq5NNZFZl91siM/I5XWWsFZRW2Hcx1rzj/lkefeQUTW/zoGtBpuL40ZcWjDJwPi1J+j
	QfMrHR8GaM6s4n79Bpw53eqaG8GsdBqWzxoT0KBKD8HiBg+Ld/IMSgQnO7Auo/rxCqKFiKWkWDyEv
	vAPT7N3t2Vj1QVlqTUIiKEJCXD3SrL0cVAfQ8Ivyxcsg2iRKwe+PlvXpwPWm9E/2WDx5hZ6HVulRe
	hY+qBA00V2aEatxie5CHJYSn13wZGqxMQWelAUyKkhM3mebuo+3Qwrfqo9D9c9X8O0R5nL0JCOdt7
	YaCU9giA==;
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
Subject: [PATCH 18/45] hw/sh4/r2d: use pci_init_nic_devices()
Date: Sun, 22 Oct 2023 16:51:33 +0100
Message-Id: <20231022155200.436340-19-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231022155200.436340-1-dwmw2@infradead.org>
References: <20231022155200.436340-1-dwmw2@infradead.org>
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
2.40.1


