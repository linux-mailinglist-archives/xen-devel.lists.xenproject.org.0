Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 898B583E074
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 18:38:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672305.1046282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTQ9l-00016B-NS; Fri, 26 Jan 2024 17:38:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672305.1046282; Fri, 26 Jan 2024 17:38:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTQ9l-00013h-JO; Fri, 26 Jan 2024 17:38:21 +0000
Received: by outflank-mailman (input) for mailman id 672305;
 Fri, 26 Jan 2024 17:38:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=46+y=JE=desiato.srs.infradead.org=BATV+5cc348fc898a3f56ac6c+7460+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1rTQ55-0004m7-RD
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 17:33:31 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01e77551-bc71-11ee-98f5-efadbce2ee36;
 Fri, 26 Jan 2024 18:33:24 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rTQ4A-000000069Up-1vM6; Fri, 26 Jan 2024 17:32:35 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1rTQ49-00000001en3-1zqq;
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
X-Inumbo-ID: 01e77551-bc71-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=X6ke30CwveEkz5smymx38sGBgkKUHVYamBl46p3i/0I=; b=G494fFd2mP0Dj7LuDOipJm7Owz
	lg4FxCPBqEekH32mKUFiRpjvM4gbvJl8IyqV24tQnkqtoD3kIoU0//E55ptwp/KNLJLObDFWl84xA
	LyyEbvysIGcuVn6jGjouhI95tXxUJ5Wd2Y1sxDNUbYJzAg1ojC1/ejwquyKqaxjA5h1ljcaxMG72Y
	kKR324Lr/AGkF8i4Pg3J0gV8ytJQjyDewTTJR3xZfCcDxwRcsAqAf2QEZIPUmTm49PSKqH9r6ZzZo
	qoBceM7r7v7IC4Pnmllgo8gsJCI7tdgMmdddhMb++f9cefXfZaemmAftT3NzjS7qS0dXTKscg1YGC
	Zf2G4uPw==;
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
Subject: [PATCH v4 28/47] hw/arm/npcm7xx: use qemu_configure_nic_device, allow emc0/emc1 as aliases
Date: Fri, 26 Jan 2024 17:25:05 +0000
Message-ID: <20240126173228.394202-29-dwmw2@infradead.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126173228.394202-1-dwmw2@infradead.org>
References: <20240126173228.394202-1-dwmw2@infradead.org>
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
index 15ff21d047..ee395864e4 100644
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
+        snprintf(alias, sizeof(alias), "emc%u", i);
+        qemu_configure_nic_device(DEVICE(sbd), true, alias);
+
         /*
          * The device exists regardless of whether it's connected to a QEMU
          * netdev backend. So always instantiate it even if there is no
diff --git a/tests/qtest/npcm7xx_emc-test.c b/tests/qtest/npcm7xx_emc-test.c
index b046f1d76a..f7646fae2c 100644
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
+    g_string_append_printf(cmd_line, " -nic socket,fd=%d,model=emc%d ",
+                           test_sockets[1], module_num);
 
     g_test_queue_destroy(packet_test_clear, test_sockets);
     return test_sockets;
-- 
2.43.0


