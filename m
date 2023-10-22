Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3137D23D9
	for <lists+xen-devel@lfdr.de>; Sun, 22 Oct 2023 17:54:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.620661.966237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qualu-0006zM-Lc; Sun, 22 Oct 2023 15:53:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 620661.966237; Sun, 22 Oct 2023 15:53:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qualu-0006wj-Hr; Sun, 22 Oct 2023 15:53:46 +0000
Received: by outflank-mailman (input) for mailman id 620661;
 Sun, 22 Oct 2023 15:53:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zZR7=GE=casper.srs.infradead.org=BATV+88d8721f4af1339c2fab+7364+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1quals-0006wY-V7
 for xen-devel@lists.xenproject.org; Sun, 22 Oct 2023 15:53:45 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d320327-70f3-11ee-98d5-6d05b1d4d9a1;
 Sun, 22 Oct 2023 17:53:43 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1quakL-008TGt-DF; Sun, 22 Oct 2023 15:52:09 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1quakK-001qau-1b; Sun, 22 Oct 2023 16:52:08 +0100
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
X-Inumbo-ID: 2d320327-70f3-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Ej3LKCNGH6R7gA1YUwsQNgVAJx3y6GAdEng2TtdyRY8=; b=YRrUXHCFp/2EjyZhhg74ig3d9C
	VAklLPOmMqY1AU+lDxqrSZTVBKGUJq2TG/BsOhy5Mn9XbOPcVYAiatMRLrVQjGSN/Gt+07BnrKXQO
	j7CwSZi/mhHFAiWSOSq6/j9m5DOSQ7ktt3tauggh/4Jy26HTYVGZaCEZC28LEcgjeU0QVSr3x42UP
	awJVA5TRKzvTrvUm3WhXMoUgMHIelOzFLk4H9vCAMOcm58pmlEOz6naKekM6xSFMQc0lpOSlbnUhD
	oeH4GaaPLjCquXs9sZfwjgGow/7iyFJHYe7fLTBAUDR82UOQXNFjE32U16Q4LOERmXlswbGhZ/+5G
	tQn9ORvQ==;
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
Subject: [PATCH 38/45] hw/riscv: use qemu_configure_nic_device()
Date: Sun, 22 Oct 2023 16:51:53 +0100
Message-Id: <20231022155200.436340-39-dwmw2@infradead.org>
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
 hw/riscv/microchip_pfsoc.c | 13 ++-----------
 hw/riscv/sifive_u.c        |  7 +------
 2 files changed, 3 insertions(+), 17 deletions(-)

diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index b775aa8946..8e0e3aa20c 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -411,17 +411,8 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
         memmap[MICROCHIP_PFSOC_USB].size);
 
     /* GEMs */
-
-    nd = &nd_table[0];
-    if (nd->used) {
-        qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
-        qdev_set_nic_properties(DEVICE(&s->gem0), nd);
-    }
-    nd = &nd_table[1];
-    if (nd->used) {
-        qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
-        qdev_set_nic_properties(DEVICE(&s->gem1), nd);
-    }
+    qemu_configure_nic_device(DEVICE(&s->gem0), true, NULL);
+    qemu_configure_nic_device(DEVICE(&s->gem1), true, NULL);
 
     object_property_set_int(OBJECT(&s->gem0), "revision", GEM_REVISION, errp);
     object_property_set_int(OBJECT(&s->gem0), "phy-addr", 8, errp);
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index ec76dce6c9..5207ec1fa5 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -789,7 +789,6 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
     MemoryRegion *l2lim_mem = g_new(MemoryRegion, 1);
     char *plic_hart_config;
     int i, j;
-    NICInfo *nd = &nd_table[0];
 
     qdev_prop_set_uint32(DEVICE(&s->u_cpus), "num-harts", ms->smp.cpus - 1);
     qdev_prop_set_uint32(DEVICE(&s->u_cpus), "hartid-base", 1);
@@ -893,11 +892,7 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->otp), 0, memmap[SIFIVE_U_DEV_OTP].base);
 
-    /* FIXME use qdev NIC properties instead of nd_table[] */
-    if (nd->used) {
-        qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
-        qdev_set_nic_properties(DEVICE(&s->gem), nd);
-    }
+    qemu_configure_nic_device(DEVICE(&s->gem), true, NULL);
     object_property_set_int(OBJECT(&s->gem), "revision", GEM_REVISION,
                             &error_abort);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->gem), errp)) {
-- 
2.40.1


