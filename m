Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC5E7D242F
	for <lists+xen-devel@lfdr.de>; Sun, 22 Oct 2023 18:08:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.620739.966546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quaze-0000sE-Mo; Sun, 22 Oct 2023 16:07:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 620739.966546; Sun, 22 Oct 2023 16:07:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quaze-0000qD-J9; Sun, 22 Oct 2023 16:07:58 +0000
Received: by outflank-mailman (input) for mailman id 620739;
 Sun, 22 Oct 2023 16:07:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RY1I=GE=desiato.srs.infradead.org=BATV+fd6248c3715d1825373b+7364+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1quan9-0007Cq-6H
 for xen-devel@lists.xenproject.org; Sun, 22 Oct 2023 15:55:03 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b0b3ed8-70f3-11ee-9b0e-b553b5be7939;
 Sun, 22 Oct 2023 17:55:00 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1quakJ-00DCmq-21; Sun, 22 Oct 2023 15:53:37 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1quakI-001qZD-0e; Sun, 22 Oct 2023 16:52:06 +0100
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
X-Inumbo-ID: 5b0b3ed8-70f3-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=zpmWGfDJ4p47YbRsENJiPMvNNVfWBSj9DDCQL7if7Xs=; b=rJQSdHp7neRWdzDMIbjE2Zjypv
	NjPr8rhGdb3D/xMBkHChvhKzva/Hb0vatOBd4vj+sHprPyL3A2lG26OzZQAMzDGQUYKBqozMOkUW1
	Jd3tMTeIPV3NuYNI5VfrMGpi2wFnruhQLJLr8kQ5SUsQBiu3pvZNlPPL+vqwzvizOyNk/bFiB3H0g
	NhH05Um2d33Epcqk2+d8nle+kwoHD8TyASBLJUnxRuc/BILJiNAmL4PNDYzGbflS2jzPO2LTduqKy
	Yay1jg5/nZ5UdWTxshF6kqD22VbrTA+7eQRI8EY5V0fiRJT7MLBsYAxxCZowr3goq/qL/5+9SpQAA
	FLB1oMjQ==;
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
Subject: [PATCH 15/45] hw/ppc/prep: use pci_init_nic_devices()
Date: Sun, 22 Oct 2023 16:51:30 +0100
Message-Id: <20231022155200.436340-16-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231022155200.436340-1-dwmw2@infradead.org>
References: <20231022155200.436340-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Previously, the first PCI NIC would be placed in PCI slot 3 and the rest
would be dynamically assigned. Even if the user overrode the default NIC
type and made it something other than PCNet.

Now, the first PCNet NIC (that is, anything not explicitly specified
to be anything different) will go to slot 3 even if it isn't the first
NIC specified on the commnd line. And anything else will be dynamically
assigned.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/ppc/prep.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index 137276bcb9..1a08e74945 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -336,10 +336,9 @@ static void ibm_40p_init(MachineState *machine)
         /* XXX: s3-trio at PCI_DEVFN(2, 0) */
         pci_vga_init(pci_bus);
 
-        for (i = 0; i < nb_nics; i++) {
-            pci_nic_init_nofail(&nd_table[i], pci_bus, mc->default_nic,
-                                i == 0 ? "3" : NULL);
-        }
+        /* First PCNET device at PCI_DEVFN(3, 0) */
+        pci_init_nic_in_slot(pci_bus, mc->default_nic, NULL, "3");
+        pci_init_nic_devices(pci_bus, mc->default_nic);
     }
 
     /* Prepare firmware configuration for OpenBIOS */
-- 
2.40.1


