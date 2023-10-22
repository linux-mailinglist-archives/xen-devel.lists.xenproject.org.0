Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA897D242E
	for <lists+xen-devel@lfdr.de>; Sun, 22 Oct 2023 18:08:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.620737.966537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quazc-0000WM-Ej; Sun, 22 Oct 2023 16:07:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 620737.966537; Sun, 22 Oct 2023 16:07:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quazc-0000UX-Bb; Sun, 22 Oct 2023 16:07:56 +0000
Received: by outflank-mailman (input) for mailman id 620737;
 Sun, 22 Oct 2023 16:07:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zZR7=GE=casper.srs.infradead.org=BATV+88d8721f4af1339c2fab+7364+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1quam2-0006wY-U6
 for xen-devel@lists.xenproject.org; Sun, 22 Oct 2023 15:53:54 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33947c9c-70f3-11ee-98d5-6d05b1d4d9a1;
 Sun, 22 Oct 2023 17:53:54 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1quakJ-008TGS-5c; Sun, 22 Oct 2023 15:52:07 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1quakI-001qZX-2D; Sun, 22 Oct 2023 16:52:06 +0100
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
X-Inumbo-ID: 33947c9c-70f3-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=dSwI1h0y4SH0kpqtgw6L1Gm8G2MktnLyUJxVywGZwBA=; b=mY5ncA8vKDZJwpYEQFDiCDsbub
	fHgnJI7txngbGu+bLv8Ww/hB84od8jtF86VqAGHFXCEvxaPZjDoRZoJeV6PiYNAkyO11Ko9aiMDV8
	9KOpskxJPGs79JNvLAnHcNsQDluDR3ydBcND6AeKpT04tMbMSLRzAb499Ik/l0Jzv+Rlky+cl/05Y
	CvaapmmWi50n0joewZBp0ylKt15DFZD5L35vW/jpErE4JKXm+Imjs69CAi1rij50OrXcl/l0suHiy
	C9RUAuw6ABEpKOd+M0s9n5GHYQt92fduphuK88Zn1vTrUw5hPVSZmKN9QT2utnbMSOWtyBgrQJ/9L
	b8T4xEHQ==;
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
Subject: [PATCH 19/45] hw/sparc64/sun4u: use pci_init_nic_devices()
Date: Sun, 22 Oct 2023 16:51:34 +0100
Message-Id: <20231022155200.436340-20-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231022155200.436340-1-dwmw2@infradead.org>
References: <20231022155200.436340-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

The first sunhme NIC gets placed a function 1 on slot 1 of PCI bus A,
and the rest are dynamically assigned on PCI bus B.

Previously, any PCI NIC would get the special treatment purely by
virtue of being first in the list.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/sparc64/sun4u.c | 27 ++++++++-------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index d908a38f73..13e4380f30 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -642,29 +642,18 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
 
     memset(&macaddr, 0, sizeof(MACAddr));
     onboard_nic = false;
-    for (i = 0; i < nb_nics; i++) {
-        PCIBus *bus;
-        nd = &nd_table[i];
-
-        if (!nd->model || strcmp(nd->model, mc->default_nic) == 0) {
-            if (!onboard_nic) {
-                pci_dev = pci_new_multifunction(PCI_DEVFN(1, 1), mc->default_nic);
-                bus = pci_busA;
-                memcpy(&macaddr, &nd->macaddr.a, sizeof(MACAddr));
-                onboard_nic = true;
-            } else {
-                pci_dev = pci_new(-1, mc->default_nic);
-                bus = pci_busB;
-            }
-        } else {
-            pci_dev = pci_new(-1, nd->model);
-            bus = pci_busB;
-        }
 
+    nd = qemu_find_nic_info(mc->default_nic, true, NULL);
+    if (nd) {
+        pci_dev = pci_new_multifunction(PCI_DEVFN(1, 1), mc->default_nic);
         dev = &pci_dev->qdev;
         qdev_set_nic_properties(dev, nd);
-        pci_realize_and_unref(pci_dev, bus, &error_fatal);
+        pci_realize_and_unref(pci_dev, pci_busA, &error_fatal);
+
+        memcpy(&macaddr, &nd->macaddr.a, sizeof(MACAddr));
+        onboard_nic = true;
     }
+    pci_init_nic_devices(pci_busB, mc->default_nic);
 
     /* If we don't have an onboard NIC, grab a default MAC address so that
      * we have a valid machine id */
-- 
2.40.1


