Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7010D83E06B
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 18:38:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672292.1046227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTQ9J-0006pr-5B; Fri, 26 Jan 2024 17:37:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672292.1046227; Fri, 26 Jan 2024 17:37:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTQ9J-0006lL-0E; Fri, 26 Jan 2024 17:37:53 +0000
Received: by outflank-mailman (input) for mailman id 672292;
 Fri, 26 Jan 2024 17:37:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=46+y=JE=desiato.srs.infradead.org=BATV+5cc348fc898a3f56ac6c+7460+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1rTQ5E-0004m7-Sv
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 17:33:40 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05876c47-bc71-11ee-98f5-efadbce2ee36;
 Fri, 26 Jan 2024 18:33:30 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rTQ4A-000000069Uf-1sy3; Fri, 26 Jan 2024 17:32:35 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1rTQ48-00000001em2-21yn;
 Fri, 26 Jan 2024 17:32:32 +0000
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
X-Inumbo-ID: 05876c47-bc71-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=11Xexm/zfEQsP0C5lVH66y3jNuSB03J3oevWpWV4QDE=; b=J5wO8JEkkhyeDWgg6bi+L0kaFG
	z8WmsTAHijYoKW/KHa0AJ/dFQToJ5llh906NAjxJNlaQVVgtZ1AK+w9xp88vwX0PxRMrMjrILPzw9
	9qwrRq5v290fYBfp4WN/7Q/QNb3QaUIUPjrllJMAOTKqZ8nUoutZY9sy8af8wFqQLksb2ItJVeukD
	CmORWp0+U239cZgQ/WmA/Xc9qFByy+rMUjh7Pqbm5ECAnoId3nu6h2gW9Cbjx4Q3ZrATtmzlEd6F8
	tQzKRGeo+AeN++aiiuZfA8GNazNFeAwNU4W7CGU+m4asCHHYTdtNYcYPSt/iV31elDlWT+BQ9KJJc
	Jyb0FrFg==;
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
	David Woodhouse <dwmw@amazon.co.uk>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH v4 17/47] hw/ppc: use pci_init_nic_devices()
Date: Fri, 26 Jan 2024 17:24:54 +0000
Message-ID: <20240126173228.394202-18-dwmw2@infradead.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126173228.394202-1-dwmw2@infradead.org>
References: <20240126173228.394202-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/ppc/e500.c          |  4 +---
 hw/ppc/mac_newworld.c  |  4 +---
 hw/ppc/mac_oldworld.c  |  4 +---
 hw/ppc/ppc440_bamboo.c | 14 +++++---------
 4 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 566f1200dd..3bd12b54ab 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -1079,9 +1079,7 @@ void ppce500_init(MachineState *machine)
 
     if (pci_bus) {
         /* Register network interfaces. */
-        for (i = 0; i < nb_nics; i++) {
-            pci_nic_init_nofail(&nd_table[i], pci_bus, mc->default_nic, NULL);
-        }
+        pci_init_nic_devices(pci_bus, mc->default_nic);
     }
 
     /* Register spinning region */
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 535710314a..b36dbaf2b6 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -444,9 +444,7 @@ static void ppc_core99_init(MachineState *machine)
         graphic_depth = 15;
     }
 
-    for (i = 0; i < nb_nics; i++) {
-        pci_nic_init_nofail(&nd_table[i], pci_bus, mc->default_nic, NULL);
-    }
+    pci_init_nic_devices(pci_bus, mc->default_nic);
 
     /* The NewWorld NVRAM is not located in the MacIO device */
     if (kvm_enabled() && qemu_real_host_page_size() > 4096) {
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 9acc7adfc9..1981d3d8f6 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -277,9 +277,7 @@ static void ppc_heathrow_init(MachineState *machine)
 
     pci_vga_init(pci_bus);
 
-    for (i = 0; i < nb_nics; i++) {
-        pci_nic_init_nofail(&nd_table[i], pci_bus, mc->default_nic, NULL);
-    }
+    pci_init_nic_devices(pci_bus, mc->default_nic);
 
     /* MacIO IDE */
     ide_drive_get(hd, ARRAY_SIZE(hd));
diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index a189942de4..c75c3083e6 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -161,7 +161,6 @@ static void bamboo_init(MachineState *machine)
     DeviceState *uicdev;
     SysBusDevice *uicsbd;
     int success;
-    int i;
 
     if (kvm_enabled()) {
         error_report("machine %s does not support the KVM accelerator",
@@ -234,14 +233,11 @@ static void bamboo_init(MachineState *machine)
     }
 
     if (pcibus) {
-        /* Register network interfaces. */
-        for (i = 0; i < nb_nics; i++) {
-            /*
-             * There are no PCI NICs on the Bamboo board, but there are
-             * PCI slots, so we can pick whatever default model we want.
-             */
-            pci_nic_init_nofail(&nd_table[i], pcibus, mc->default_nic, NULL);
-        }
+        /*
+         * There are no PCI NICs on the Bamboo board, but there are
+         * PCI slots, so we can pick whatever default model we want.
+         */
+        pci_init_nic_devices(pcibus, mc->default_nic);
     }
 
     /* Load kernel. */
-- 
2.43.0


