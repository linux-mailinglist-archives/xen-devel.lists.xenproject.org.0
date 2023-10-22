Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C48487D2431
	for <lists+xen-devel@lfdr.de>; Sun, 22 Oct 2023 18:08:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.620743.966572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quazo-0001lY-Nf; Sun, 22 Oct 2023 16:08:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 620743.966572; Sun, 22 Oct 2023 16:08:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quazo-0001hv-Ib; Sun, 22 Oct 2023 16:08:08 +0000
Received: by outflank-mailman (input) for mailman id 620743;
 Sun, 22 Oct 2023 16:08:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RY1I=GE=desiato.srs.infradead.org=BATV+fd6248c3715d1825373b+7364+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1quama-0006wY-Nc
 for xen-devel@lists.xenproject.org; Sun, 22 Oct 2023 15:54:28 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 441ce548-70f3-11ee-98d5-6d05b1d4d9a1;
 Sun, 22 Oct 2023 17:54:22 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1quakK-00DCmx-2q; Sun, 22 Oct 2023 15:52:30 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1quakJ-001qa9-1a; Sun, 22 Oct 2023 16:52:07 +0100
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
X-Inumbo-ID: 441ce548-70f3-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=c0xx8TE45H7mqNibBdaKqXZz525uhIFbtBrVwQI6/yE=; b=mzt9/M2tO54FWw2MlPjMC+HeN0
	WfmOcNbA9opj8a0JF8uKEDYRY42oUrs9TeoSwMM3kTCW9sh6+/z0peT3bxYnMKENHh6yCfGCdmz4n
	NR/UwvI2zHAMNeAefZxbihdGHZz7tef6l0wfM7JBuQk2AzbXmyObz25qh3c2EYL4DLREs5TWxRqWk
	8pJKExjCH50+duuqU6AxmcWmYkpO8/OUVm0YyQrH73mzL8UqZpCo05m5vv+ejjvUw7YS/X8jsvyMf
	W7jW/BKVYlmPlTRpS8UVZqnVnTaUzZuGSH6/HzcsEIMNN5mchYLrJv1isqsny3dsOdGUD4zqj3UIo
	iXnaUfjg==;
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
Subject: [PATCH 28/45] hw/arm/npcm7xx: use qemu_configure_nic_device, allow emc0/emc1 as aliases
Date: Sun, 22 Oct 2023 16:51:43 +0100
Message-Id: <20231022155200.436340-29-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231022155200.436340-1-dwmw2@infradead.org>
References: <20231022155200.436340-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Also update the test to specify which device to attach the test socket
to, and remove the comment lamenting the fact that we can't do so.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/arm/npcm7xx.c               | 16 +++++++++-------
 tests/qtest/npcm7xx_emc-test.c | 18 ++++--------------
 2 files changed, 13 insertions(+), 21 deletions(-)

diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index 15ff21d047..7124547b50 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -655,8 +655,9 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
 
     /*
      * EMC Modules. Cannot fail.
-     * The mapping of the device to its netdev backend works as follows:
-     * emc[i] = nd_table[i]
+     * Use the available NIC configurations in order, allowing 'emc0' and
+     * 'emc1' to by used as aliases for the model= parameter to override.
+     *
      * This works around the inability to specify the netdev property for the
      * emc device: it's not pluggable and thus the -device option can't be
      * used.
@@ -664,12 +665,13 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm7xx_emc_addr) != ARRAY_SIZE(s->emc));
     QEMU_BUILD_BUG_ON(ARRAY_SIZE(s->emc) != 2);
     for (i = 0; i < ARRAY_SIZE(s->emc); i++) {
-        s->emc[i].emc_num = i;
         SysBusDevice *sbd = SYS_BUS_DEVICE(&s->emc[i]);
-        if (nd_table[i].used) {
-            qemu_check_nic_model(&nd_table[i], TYPE_NPCM7XX_EMC);
-            qdev_set_nic_properties(DEVICE(sbd), &nd_table[i]);
-        }
+        char alias[6];
+
+        s->emc[i].emc_num = i;
+        snprintf(alias, sizeof(alias), "%u", i);
+        qemu_configure_nic_device(DEVICE(sbd), true, alias);
+
         /*
          * The device exists regardless of whether it's connected to a QEMU
          * netdev backend. So always instantiate it even if there is no
diff --git a/tests/qtest/npcm7xx_emc-test.c b/tests/qtest/npcm7xx_emc-test.c
index b046f1d76a..506f6980d4 100644
--- a/tests/qtest/npcm7xx_emc-test.c
+++ b/tests/qtest/npcm7xx_emc-test.c
@@ -225,21 +225,11 @@ static int *packet_test_init(int module_num, GString *cmd_line)
     g_assert_cmpint(ret, != , -1);
 
     /*
-     * KISS and use -nic. We specify two nics (both emc{0,1}) because there's
-     * currently no way to specify only emc1: The driver implicitly relies on
-     * emc[i] == nd_table[i].
+     * KISS and use -nic. The driver accepts 'emc0' and 'emc1' as aliases
+     * in the 'model' field to specify the device to match.
      */
-    if (module_num == 0) {
-        g_string_append_printf(cmd_line,
-                               " -nic socket,fd=%d,model=" TYPE_NPCM7XX_EMC " "
-                               " -nic user,model=" TYPE_NPCM7XX_EMC " ",
-                               test_sockets[1]);
-    } else {
-        g_string_append_printf(cmd_line,
-                               " -nic user,model=" TYPE_NPCM7XX_EMC " "
-                               " -nic socket,fd=%d,model=" TYPE_NPCM7XX_EMC " ",
-                               test_sockets[1]);
-    }
+    g_string_append_printf(cmd_line, " -nic socket,fd=%d,model=emc%d "
+                           test_sockets[1], module_num);
 
     g_test_queue_destroy(packet_test_clear, test_sockets);
     return test_sockets;
-- 
2.40.1


