Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AFB7D6FB5
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 16:51:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622966.970311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvfDv-0001Tg-EB; Wed, 25 Oct 2023 14:51:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622966.970311; Wed, 25 Oct 2023 14:51:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvfDv-0001P6-A0; Wed, 25 Oct 2023 14:51:07 +0000
Received: by outflank-mailman (input) for mailman id 622966;
 Wed, 25 Oct 2023 14:51:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LJSz=GH=casper.srs.infradead.org=BATV+85b1c44ac99574f3713d+7367+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qvfDt-0000WU-Nq
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 14:51:05 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e964e8c7-7345-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 16:51:00 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1qvfDa-009Nmu-1W; Wed, 25 Oct 2023 14:50:46 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qvfDZ-002dFl-2Q; Wed, 25 Oct 2023 15:50:45 +0100
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
X-Inumbo-ID: e964e8c7-7345-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=W3zMp4SVis8Wv7C4rIvkdlKc8TVg4WhmG+yeqSWM84w=; b=wVLFRJGQmZRYbF38D2mJVDI4T1
	J2sT8KM4AN8l2FtLiNVMEXxXJ6L5Kc0mjz9IBlRZm7hC6RBF5LH04we+oKtfcBSC0ii2kD5aymOHI
	r1+vIfiElRK7jws52xiLwzEQ28bodju9NIvkGjA5n4KIu1mF7zVr/HbatbjmspO0ljpnoSrwX6qHb
	fo02p3GSOYLaJysuyXhDThtmYiVYkUMryRS1gCn1+iInl4NGo33AqT9sIrSXuMu+cAa3Z7DlvWJV1
	6MXQwPSJ9BURTPIDSyk3QuQUxMa5405mqSg3h5s9Cn5yCcCW2oQEWqqnBAzDUjfCts1QRNvEq0LjD
	gPBOVUtw==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Jason Wang <jasowang@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	Bernhard Beschow <shentey@gmail.com>,
	Joel Upham <jupham125@gmail.com>
Subject: [PATCH v3 26/28] hw/i386/pc: use qemu_get_nic_info() and pci_init_nic_devices()
Date: Wed, 25 Oct 2023 15:50:40 +0100
Message-Id: <20231025145042.627381-27-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231025145042.627381-1-dwmw2@infradead.org>
References: <20231025145042.627381-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Eliminate direct access to nd_table[] and nb_nics by processing the the
ISA NICs first and then calling pci_init_nic_devices() for the test.

It's important to do this *before* the subsequent patch which registers
the Xen PV network devices, because the code being remove here didn't
check whether nd->instantiated was already set before using each entry.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/pc.c                | 21 +++++++++++----------
 include/hw/net/ne2000-isa.h |  2 --
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 11fed78d17..7d2ae2b3d7 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -652,8 +652,11 @@ static void pc_init_ne2k_isa(ISABus *bus, NICInfo *nd)
 {
     static int nb_ne2k = 0;
 
-    if (nb_ne2k == NE2000_NB_MAX)
+    if (nb_ne2k == NE2000_NB_MAX) {
+        error_setg(&error_fatal,
+                   "maximum number of ISA NE2000 devices exceeded");
         return;
+    }
     isa_ne2000_init(bus, ne2000_io[nb_ne2k],
                     ne2000_irq[nb_ne2k], nd);
     nb_ne2k++;
@@ -1294,19 +1297,17 @@ void pc_basic_device_init(struct PCMachineState *pcms,
 void pc_nic_init(PCMachineClass *pcmc, ISABus *isa_bus, PCIBus *pci_bus)
 {
     MachineClass *mc = MACHINE_CLASS(pcmc);
-    int i;
+    bool default_is_ne2k = g_str_equal(mc->default_nic, TYPE_ISA_NE2000);
+    NICInfo *nd;
 
     rom_set_order_override(FW_CFG_ORDER_OVERRIDE_NIC);
-    for (i = 0; i < nb_nics; i++) {
-        NICInfo *nd = &nd_table[i];
-        const char *model = nd->model ? nd->model : mc->default_nic;
 
-        if (g_str_equal(model, "ne2k_isa")) {
-            pc_init_ne2k_isa(isa_bus, nd);
-        } else {
-            pci_nic_init_nofail(nd, pci_bus, model, NULL);
-        }
+    while ((nd = qemu_find_nic_info(TYPE_ISA_NE2000, default_is_ne2k, NULL))) {
+        pc_init_ne2k_isa(isa_bus, nd);
     }
+
+    pci_init_nic_devices(pci_bus, mc->default_nic);
+
     rom_reset_order_override();
 }
 
diff --git a/include/hw/net/ne2000-isa.h b/include/hw/net/ne2000-isa.h
index af59ee0b02..73bae10ad1 100644
--- a/include/hw/net/ne2000-isa.h
+++ b/include/hw/net/ne2000-isa.h
@@ -22,8 +22,6 @@ static inline ISADevice *isa_ne2000_init(ISABus *bus, int base, int irq,
 {
     ISADevice *d;
 
-    qemu_check_nic_model(nd, "ne2k_isa");
-
     d = isa_try_new(TYPE_ISA_NE2000);
     if (d) {
         DeviceState *dev = DEVICE(d);
-- 
2.40.1


