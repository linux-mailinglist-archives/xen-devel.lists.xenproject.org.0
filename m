Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B10107D2435
	for <lists+xen-devel@lfdr.de>; Sun, 22 Oct 2023 18:08:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.620758.966606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qub0E-0004VG-TU; Sun, 22 Oct 2023 16:08:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 620758.966606; Sun, 22 Oct 2023 16:08:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qub0E-0004R8-Q8; Sun, 22 Oct 2023 16:08:34 +0000
Received: by outflank-mailman (input) for mailman id 620758;
 Sun, 22 Oct 2023 16:08:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RY1I=GE=desiato.srs.infradead.org=BATV+fd6248c3715d1825373b+7364+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1quamk-0007Cq-Rp
 for xen-devel@lists.xenproject.org; Sun, 22 Oct 2023 15:54:38 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c7c9cde-70f3-11ee-9b0e-b553b5be7939;
 Sun, 22 Oct 2023 17:54:36 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1quakI-00DCmh-0V; Sun, 22 Oct 2023 15:52:51 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1quakG-001qYN-2W; Sun, 22 Oct 2023 16:52:04 +0100
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
X-Inumbo-ID: 4c7c9cde-70f3-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=gAqi4IHvyxyTJg+N0Ik5PY/rM2q46ZCGuyPvahYwG5k=; b=cRbRpczYlxtrJ0EMdutYGeIBIl
	3V4CpMaDhfBqINOapf2F/gKHf+PgU3iwVQeTm5lVX9xNdGoH8TYMteH/nQcGNcNI3BcKh+CWUiWpL
	LbtNiAJsgwEHdMVmuNmfyuyVAP7f0W7JkbsxhMiWqH4q+bbsarvrWtE9jVRGnI/EHRbx/G70Etxbw
	CZ30nG0gPXyVMUtzmvYFCv0b3+Z/+jCGDk7YmUkeRkcus/I/rRzABdQ4ucyfQQTqz6/rNkXeSHqbM
	Nlndu5rdkCTQv6mErcA0WRVLKeTqjLVQkMDovzpLxKNVo2R0CpNPRyZH7ke5ogJ7cesaOLN3L/iWq
	6Ar0Y1oA==;
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
Subject: [PATCH 03/45] net: add qemu_create_nic_bus_devices()
Date: Sun, 22 Oct 2023 16:51:18 +0100
Message-Id: <20231022155200.436340-4-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231022155200.436340-1-dwmw2@infradead.org>
References: <20231022155200.436340-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

This will instantiate any NICs which live on a given bus type. Each bus
is allowed *one* substitution (for PCI it's virtio → virtio-net-pci, for
Xen it's xen → xen-net-device; no point in overengineering it unless we
actually want more).

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 include/net/net.h |  3 +++
 net/net.c         | 53 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/include/net/net.h b/include/net/net.h
index 56be694c75..ce830a47d0 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -211,6 +211,9 @@ bool qemu_configure_nic_device(DeviceState *dev, bool match_default,
                                const char *alias);
 DeviceState *qemu_create_nic_device(const char *typename, bool match_default,
                                     const char *alias);
+void qemu_create_nic_bus_devices(BusState *bus, const char *parent_type,
+                                 const char *default_model,
+                                 const char *alias, const char *alias_target);
 void print_net_client(Monitor *mon, NetClientState *nc);
 void net_socket_rs_init(SocketReadState *rs,
                         SocketReadStateFinalize *finalize,
diff --git a/net/net.c b/net/net.c
index 6e20f9d2e9..23fd716b98 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1207,6 +1207,59 @@ DeviceState *qemu_create_nic_device(const char *typename, bool match_default,
     return dev;
 }
 
+void qemu_create_nic_bus_devices(BusState *bus, const char *parent_type,
+                                 const char *default_model,
+                                 const char *alias, const char *alias_target)
+{
+    GPtrArray *nic_models = qemu_get_nic_models(parent_type);
+    const char *model;
+    DeviceState *dev;
+    NICInfo *nd;
+    int i;
+
+    if (nic_model_help) {
+        if (alias_target) {
+            add_nic_model_help(alias_target, alias);
+        }
+        for (i = 0; i < nic_models->len - 1; i++) {
+            add_nic_model_help(nic_models->pdata[i], NULL);
+        }
+    }
+
+    /* Drop the NULL terminator which would make g_str_equal() unhappy */
+    nic_models->len--;
+
+    for (i = 0; i < nb_nics; i++) {
+        nd = &nd_table[i];
+
+        if (!nd->used || nd->instantiated) {
+            continue;
+        }
+
+        model = nd->model ? nd->model : default_model;
+        if (!model) {
+            continue;
+        }
+
+        /* Each bus type is allowed *one* substitution */
+        if (g_str_equal(model, alias)) {
+            model = alias_target;
+        }
+
+        if (!g_ptr_array_find_with_equal_func(nic_models, model,
+                                              g_str_equal, NULL)) {
+            /* This NIC does not live on this bus. */
+            continue;
+        }
+
+        dev = qdev_new(model);
+        qdev_set_nic_properties(dev, nd);
+        qdev_realize_and_unref(dev, bus, &error_fatal);
+    }
+
+    g_ptr_array_free(nic_models, true);
+}
+
 static int (* const net_client_init_fun[NET_CLIENT_DRIVER__MAX])(
     const Netdev *netdev,
     const char *name,
-- 
2.40.1


