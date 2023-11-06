Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7327E2D90
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 21:06:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628356.979778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05r6-0007Te-KA; Mon, 06 Nov 2023 20:05:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628356.979778; Mon, 06 Nov 2023 20:05:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05r6-0007Qh-Gd; Mon, 06 Nov 2023 20:05:52 +0000
Received: by outflank-mailman (input) for mailman id 628356;
 Mon, 06 Nov 2023 20:05:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OHvK=GT=casper.srs.infradead.org=BATV+7ad6dfa9aff48d363c6b+7379+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r05hO-00024f-Oi
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 19:55:50 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77cf3edf-7cde-11ee-98da-6d05b1d4d9a1;
 Mon, 06 Nov 2023 20:55:43 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1r05fc-007tah-BC; Mon, 06 Nov 2023 19:54:01 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1r05fc-001GP5-1u; Mon, 06 Nov 2023 19:54:00 +0000
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
X-Inumbo-ID: 77cf3edf-7cde-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=L5VhMhMWWBNBbH2l848PbF3Scoxc1bNY0ufdNZIbk1U=; b=iGwdZ+aCxnLlfra+boD9l6BbR5
	ZecLaYSnhd2Mj6VGcRr5cKFp3OHC4upiyzuowHAzrNm+l9PPjYHAkA4bsuk85Y4nKk52kzr3+zyEd
	WnS0EyMGlN6ZDfyfDTmHT/OpldPg+ZJbZZPEcHW5jilZh/O9C382WNiPYOg9DNJ13rHwCLDxJFCPm
	Y+L4+sh6q+geRp+KAezyv3Z+Nb5xjuNyuOBLWRC7q+PqKSiqxSUwzaBCQGXmBFP4ccIZe+YhY+YYX
	TdkNjwVq2/Gm1+kB1qfNHER9XVHZDiq28bZA9sEfSnKDxSIznvYI5NHm4VScCILsu+ZnzaauwqDEy
	7knI7PNw==;
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
Subject: [PATCH for-8.3 v2 35/46] hw/mips/mipssim: use qemu_create_nic_device()
Date: Mon,  6 Nov 2023 19:49:40 +0000
Message-ID: <20231106195352.301038-36-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106195352.301038-1-dwmw2@infradead.org>
References: <20231106195352.301038-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

The MIPS SIM platform instantiates its NIC only if a corresponding
configuration exists for it. Use qemu_create_nic_device() function for
that.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/mips/mipssim.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/hw/mips/mipssim.c b/hw/mips/mipssim.c
index 4f743f37eb..d930526fd6 100644
--- a/hw/mips/mipssim.c
+++ b/hw/mips/mipssim.c
@@ -110,13 +110,15 @@ static void main_cpu_reset(void *opaque)
     }
 }
 
-static void mipsnet_init(int base, qemu_irq irq, NICInfo *nd)
+static void mipsnet_init(int base, qemu_irq irq)
 {
     DeviceState *dev;
     SysBusDevice *s;
 
-    dev = qdev_new("mipsnet");
-    qdev_set_nic_properties(dev, nd);
+    dev = qemu_create_nic_device("mipsnet", true, NULL);
+    if (!dev) {
+        return;
+    }
 
     s = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(s, &error_fatal);
@@ -217,9 +219,8 @@ mips_mipssim_init(MachineState *machine)
                       sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0));
     }
 
-    if (nd_table[0].used)
-        /* MIPSnet uses the MIPS CPU INT0, which is interrupt 2. */
-        mipsnet_init(0x4200, env->irq[2], &nd_table[0]);
+    /* MIPSnet uses the MIPS CPU INT0, which is interrupt 2. */
+    mipsnet_init(0x4200, env->irq[2]);
 }
 
 static void mips_mipssim_machine_init(MachineClass *mc)
-- 
2.41.0


