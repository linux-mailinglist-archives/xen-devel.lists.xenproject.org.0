Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA20B83E02A
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 18:33:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672252.1046042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTQ4f-0004be-Jg; Fri, 26 Jan 2024 17:33:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672252.1046042; Fri, 26 Jan 2024 17:33:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTQ4f-0004Zu-Gf; Fri, 26 Jan 2024 17:33:05 +0000
Received: by outflank-mailman (input) for mailman id 672252;
 Fri, 26 Jan 2024 17:33:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bPDA=JE=casper.srs.infradead.org=BATV+7caeb094913322f6f00d+7460+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1rTQ4e-0004Zo-Hg
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 17:33:04 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f54d430b-bc70-11ee-8a43-1f161083a0e0;
 Fri, 26 Jan 2024 18:33:03 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rTQ49-0000000EKUd-01Tz; Fri, 26 Jan 2024 17:32:34 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1rTQ49-00000001enQ-3kks;
 Fri, 26 Jan 2024 17:32:33 +0000
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
X-Inumbo-ID: f54d430b-bc70-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=+e8WGyk26Nx6F3/v612EfiHjqzKx8nYkFPtvGlnGd3w=; b=Wj7wVHpMtDarRXMBToq7G9m/GR
	JIyL+umLSadU7YtXppHGohydct6iE2OaSPxQt+ONIgMnY6+6w/sul+wfD5BEOHoSRAba6pl7/iFG6
	pzB+Qmg/XzA5Bcgpdv0Sv3H7Ypa3FuqdDSzmGBfk4nF9gM9Jr73sQXltSASv7KghBB2lEuqrBhs5K
	tg/ZVNvLN3exxn+r1l2s9SkJ98IzX5zeIrUo6rK0r0NtzTeEHwyBi4wY4iPvf5Cgr3+0FepwwsCLR
	CPE023t4WgOJN/AJAjtsl5ltjaMkSVfKE29fdVhX+Ab6pRk+sFWxlHtSnjChWv61xjwzhtviZaPoF
	wt8AgzYA==;
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
Subject: [PATCH v4 33/47] hw/m68k/q800: use qemu_find_nic_info()
Date: Fri, 26 Jan 2024 17:25:10 +0000
Message-ID: <20240126173228.394202-34-dwmw2@infradead.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126173228.394202-1-dwmw2@infradead.org>
References: <20240126173228.394202-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

If a corresponding NIC configuration was found, it will have a MAC address
already assigned, so use that. Else, generate and assign a default one.

Using qemu_find_nic_info() is simpler than the alternative of using
qemu_configure_nic_device() and then having to fetch the "mac" property
as a string and convert it.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/m68k/q800.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index b80a3b6d5f..fa7683bf76 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -48,6 +48,7 @@
 #include "hw/display/macfb.h"
 #include "hw/block/swim.h"
 #include "net/net.h"
+#include "net/util.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "sysemu/qtest.h"
@@ -270,6 +271,8 @@ static void q800_machine_init(MachineState *machine)
     BusState *adb_bus;
     NubusBus *nubus;
     DriveInfo *dinfo;
+    NICInfo *nd;
+    MACAddr mac;
     uint8_t rng_seed[32];
 
     linux_boot = (kernel_filename != NULL);
@@ -370,13 +373,6 @@ static void q800_machine_init(MachineState *machine)
 
     /* MACSONIC */
 
-    if (nb_nics > 1) {
-        error_report("q800 can only have one ethernet interface");
-        exit(1);
-    }
-
-    qemu_check_nic_model(&nd_table[0], "dp83932");
-
     /*
      * MacSonic driver needs an Apple MAC address
      * Valid prefix are:
@@ -386,14 +382,21 @@ static void q800_machine_init(MachineState *machine)
      * 08:00:07 Apple
      * (Q800 use the last one)
      */
-    nd_table[0].macaddr.a[0] = 0x08;
-    nd_table[0].macaddr.a[1] = 0x00;
-    nd_table[0].macaddr.a[2] = 0x07;
-
     object_initialize_child(OBJECT(machine), "dp8393x", &m->dp8393x,
                             TYPE_DP8393X);
     dev = DEVICE(&m->dp8393x);
-    qdev_set_nic_properties(dev, &nd_table[0]);
+    nd = qemu_find_nic_info(TYPE_DP8393X, true, "dp83932");
+    if (nd) {
+        qdev_set_nic_properties(dev, nd);
+        memcpy(mac.a, nd->macaddr.a, sizeof(mac.a));
+    } else {
+        qemu_macaddr_default_if_unset(&mac);
+    }
+    mac.a[0] = 0x08;
+    mac.a[1] = 0x00;
+    mac.a[2] = 0x07;
+    qdev_prop_set_macaddr(dev, "mac", mac.a);
+
     qdev_prop_set_uint8(dev, "it_shift", 2);
     qdev_prop_set_bit(dev, "big_endian", true);
     object_property_set_link(OBJECT(dev), "dma_mr",
@@ -414,7 +417,7 @@ static void q800_machine_init(MachineState *machine)
     prom = memory_region_get_ram_ptr(&m->dp8393x_prom);
     checksum = 0;
     for (i = 0; i < 6; i++) {
-        prom[i] = revbit8(nd_table[0].macaddr.a[i]);
+        prom[i] = revbit8(mac.a[i]);
         checksum ^= prom[i];
     }
     prom[7] = 0xff - checksum;
-- 
2.43.0


