Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA106B8941
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 05:02:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509443.785203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbvqu-0003YD-F4; Tue, 14 Mar 2023 04:01:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509443.785203; Tue, 14 Mar 2023 04:01:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbvqu-0003Lv-9N; Tue, 14 Mar 2023 04:01:32 +0000
Received: by outflank-mailman (input) for mailman id 509443;
 Tue, 14 Mar 2023 04:01:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9LtO=7G=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pbvqs-0003Fb-7j
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 04:01:30 +0000
Received: from sonic315-8.consmr.mail.gq1.yahoo.com
 (sonic315-8.consmr.mail.gq1.yahoo.com [98.137.65.32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4f85328-c21c-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 05:01:28 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic315.consmr.mail.gq1.yahoo.com with HTTP; Tue, 14 Mar 2023 04:01:26 +0000
Received: by hermes--production-ne1-759c9b8c64-fztnz (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 76100b2c878269fd1c2471a41328eeeb; 
 Tue, 14 Mar 2023 04:01:20 +0000 (UTC)
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
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: e4f85328-c21c-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1678766486; bh=Yh7BMEzcRZJ+tv+RTBvmQkKgDEiGrGLXLZqIzDGAwlQ=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=BEicIvdf4yOe9xOcm8CjCWj+mQCzTh3YK4u+fLIL8K0QUWMRAYGLjfvZ/F1KxH3KFEY+6lWNLaD8BmVYbeO6M3hz15RYLfvRUyIoKeDtq+9STwsPU4KTErzNlCXvIF/AsTptRBzD7ZtM4JgKNg4BsPnVAcOnjGKwHuB/Xlr4J0jeBf9kjbxaoeuD6lrTVMkf5+8PzRlEMJxNCD8BxvcjruUEQXSCMVC9bTixk/oKkkMYUEX6UBtD5ZwC4XtCG9+C3xDHuWZetnAFWapSpRYPPcuXjOFh+qz67hpkbz3ijQyUxP1alr0ZfsFO+nAmFMgKZwqBDDbV914iPYIwNgxtXw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1678766486; bh=1TjimQk1PnAKw1DHZs4ZFq5F31xo0tUPFSNrOyB2J0a=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=AO02/DkrBs0qhPCWCqMMJzT4PlajBIVUNh1FiSnJK0csPVvpy0t5iVk2f+WCoh0bVvnyyRAe+bpizzvwy0cjWYWX/EkbKoen86zPI7cTyyc1JYCXG/bR+Uzd0C+7CPpa0g185Xn7DmySBNquHs4YQR774OQkeEne6dD7/RLNi4T2dPyZDjlyCP5fAUr/uWPQp9NYOkcFgM5m7YVPFJ6lcfRnWcUlv4gB2+w8rrKE31+StUOTiIkfTKPg3u+QmM2WydtvtlvBOgn/UpsS6pN3MypsGZUWdKA6lNhIJ6YU8r/jRTAh36F2O0O8kAE0YMOM8rnu0PbETfRc2KjA6Z71aw==
X-YMail-OSG: AAciPvsVM1nT78ZwoyN5Obl_Z.6ppE9V0Zyviu.KWJyZ3MTNVtOhkBheJ9AW_Ab
 n73G_beEzW8i_ncTqZ0GsAKMVuDiQWVM2dHJOpFMVtIi9SZiEX91B0Gr59aK9YRsntJ5NQhP0038
 scK6tdCr5M_z_rtcLFK9adrKWlp.cPGMcAJgr_YPNMmcZaKDz8uLIDd1AE9OAYTdqOKxmdR2l9hx
 4eUDIATFAc6eOCm9pD_PhhDPAD4ge2Ltvv6J4L4u4QgT0ADjgs8JV32JF29GJo5xHRRzH5z69BqO
 DSllNAiS_ama55B7j.9fK9AMJWmq3mmoYAtAIIBmlibPqpjaz_pp.7byL_dr7eWyQLua2f5kRTr8
 QAZf3CvT335fakrqrkUVUz_4grP9.fxUMprTMdijCN8pTRUKaIsN4ux_Zt3KGOXiUhtoMXGEoExc
 2KQ1dNbWOS8vN8VtR_ctkizFACf6lr76HiVRlXlfClyu9ytBiZI4uebdSjnuIwlQqtuhfMIc1M5T
 RyfrvEAIcmM6.ujIc7t0I4vtCxeYBoZpFkPeMMFH0u1QVD6yIvtM5YjWFUCCqjtIJud1UHFuWugS
 B7zZVq4Zj1tXaimkCZKvSYvnxjUg0EpZMy.cqtYdyxzGGQJZnzehJl2VyG0wb84qKHpLd_n3yVVN
 L0SUtGocpcJqG_khe7sRnFiK8SALXtYTQjL5vwqZkVIWB0BstZRAKLcP5tTVDIgzaDcyd00A4G0M
 CLUYX3jZXwsDt20hqSGiy0.MtzzPRBSmAESyEzPF7RM7VwKiZMA_KPqylQ8zfdNy_l8t_AKxdQ4q
 i9OQpprA7ZuMeg7324RJoGmMRhviWYfwXcOmhR.911jHJDXqyt59qW.92lQXgJbblonsJkkMxZBE
 FZ7aDbJNErNPCajCus8Q9I3Euiq2xWYfA9AeuECSzFlp3CxZ.E2WhoTdOQQ_du_earc5CUnv9Axo
 G1cZc9ZvU66CGXRIHeY0GHB2IKkFuDZbRNWRvVFgI4TjqUJDQh6UhJFe.cUr4Q44k1N6TEYGL9QP
 fRKgHwnGWweYEwv_w07YfFpq25DoucC5DKBz.tSJL90pKydUYz8k0VqYXmKlmwsu1st4bn1v0vae
 r6R5ugq1bUKOiY8Eg2w2xd94_BhtHnkKBh9x3lLlIzf10_Db8rbYpRsOMO3Kxkid536szIXG6sJ_
 _8hDDoQSx6UQZA4_BVpHcQdt96tBRNPa.Rxp.qorh78MoLDmq8gwbWEzA4JxqJ6VgbKRP714QLlm
 f0wF21UReDuEVhkraNteH0fTD0gWTT.ud5mt_3GJIgRessTVXeXXU0GZ76sDStya1OZrLJ.3TdyT
 V4JEvx.VuY_ft_XXs7MnKybffPynesUsd0vTgeXqYw1BQLRTsMT22k53QrmgBOvF_bjOqxja6HWu
 ehqU1wcgLQaF7bf0NTer6a_UUtG3zDNQBBTIIvUJElZm_s8t9IFlVoZSKlSe15Bq1hEZldLirXcI
 PyRfklDgjJGvNlJGNiMBdBQe3vxXTmiIWQovBwFtvhZCoHjEobh08rvwME9zkzCCMB7q45pYLEHa
 WK6JLptt1hauLQvmC4Ld2OtAwVXRtRRClh21V2R1QgwUD8rWke8CYo2wtwbV8ZBiCel1uBpFaPba
 JMrF4CU7Ok4j9DjjxU1hPeTjvs1J5JRXdpujsfwgNZMa9L1PXy38BG4aw6fWS1IbIsri3UXKySD1
 Ga3FV3nKfdzR5uBH5ZcRWPO1pQgD91IObfHeqVWvJ_tqYvZ99jV7XUR0krYcWpmP.C9qefPX4C9q
 Dyb.A.ZXfdEWPX95I9Fi1.7U9erUl9xpomoEVFiKfSmc2p7Ki7Pptco3qLST5wrCWkzmhA5Wr2kg
 .uq4eRsOqY72Ui1YdaVaNE1MibGiMG4_WJCTspJDmecYu5ua2V5sTyVDAamvedeUK7v.rt9Sl5Cb
 5FhK7LyD5U31Oq1CmRYKn.Vs.QHYywiq3DiYGuJEQ13mpW_E9y7zFKc2tpEFUc9hungXghmmzyk5
 ibsCalaM2iYXCxaqNR9YG6H_GRYqf2Tv7J0H4YnILYbOUAsjdeyYkrTSCGaD3lkP6xO3zDZYeuSn
 hwPJJWyFL7nCyDuB6JZFWUboRbHPt1Rb1bPbtEPaXjtDAm.j_WX8cAOGK0isv92v_MfbaVgWkICL
 19CVymnBOG9g_U5lgRIAZT8HgzKEFzQlqAC4dti1rlUSdbuID7w7byIXogI7qFIBVS75wsmd.VhI
 Vsjs-
X-Sonic-MF: <brchuckz@aim.com>
X-Sonic-ID: f36d0bbb-79cf-4dde-9e7b-8f81bf7803dc
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 2/2] pci: allow slot_reserved_mask to be ignored with manual slot assignment
Date: Tue, 14 Mar 2023 00:01:09 -0400
Message-Id: <d9ae459b2814425c2d9e756e45d993c824da150a.1678763217.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678763217.git.brchuckz@aol.com>
References: <cover.1678763217.git.brchuckz@aol.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 4f67543bb8c5 ("xen/pt: reserve PCI slot 2 for Intel igd-passthru")
uses slot_reserved_mask to reserve slot 2 for the Intel IGD for the
xenfv machine when the guest is configured for igd-passthru.

A desired extension to that commit is to allow use of the reserved slot
if the administrator manually configures a device to use the reserved
slot. Currently, slot_reserved_mask is enforced unconditionally. With
this patch, the pci bus can be configured so the slot is only reserved
if the pci device to be added to the bus is configured for automatic
slot assignment.

To enable the desired behavior of slot_reserved_mask machine, add a
boolean member enforce_slot_reserved_mask_manual to struct PCIBus and
add a function pci_bus_ignore_slot_reserved_mask_manual which can be
called to change the default behavior of always enforcing
slot_reserved_mask so, in that case, slot_reserved_mask is only enforced
when the pci device being added is configured for automatic slot
assignment.

Call the new pci_bus_ignore_slot_reserved_mask_manual function after
creating the pci bus for the pc/i440fx/xenfv machine type to implement
the desired behavior of causing slot_reserved_mask to only apply when
the pci device to be added to a pc/i440fx/xenfv machine is configured
for automatic slot assignment.

Link: https://lore.kernel.org/qemu-devel/20230106064838-mutt-send-email-mst@kernel.org/
Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
---
Changelog

v2: Change Subject of patch from
    "pci: add enforce_slot_reserved_mask_manual property" To
    "pci: allow slot_reserved_mask to be ignored with manual slot assignment"

    Add pci_bus_ignore_slot_reserved_mask_manual function

    Call pci_bus_ignore_slot_reserved_mask_manual at appropriate place
    in hw/pci-host/i440fx.c

 hw/pci-host/i440fx.c     |  1 +
 hw/pci/pci.c             | 14 +++++++++++++-
 include/hw/pci/pci.h     |  1 +
 include/hw/pci/pci_bus.h |  1 +
 4 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index 262f82c303..8e00b88926 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -257,6 +257,7 @@ PCIBus *i440fx_init(const char *pci_type,
     s = PCI_HOST_BRIDGE(dev);
     b = pci_root_bus_new(dev, NULL, pci_address_space,
                          address_space_io, 0, TYPE_PCI_BUS);
+    pci_bus_ignore_slot_reserved_mask_manual(b);
     s->bus = b;
     object_property_add_child(qdev_get_machine(), "i440fx", OBJECT(dev));
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 8a87ccc8b0..670ecc6986 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -501,6 +501,7 @@ static void pci_root_bus_internal_init(PCIBus *bus, DeviceState *parent,
     assert(PCI_FUNC(devfn_min) == 0);
     bus->devfn_min = devfn_min;
     bus->slot_reserved_mask = 0x0;
+    bus->enforce_slot_reserved_mask_manual = true;
     bus->address_space_mem = address_space_mem;
     bus->address_space_io = address_space_io;
     bus->flags |= PCI_BUS_IS_ROOT;
@@ -1116,6 +1117,17 @@ static bool pci_bus_devfn_reserved(PCIBus *bus, int devfn)
     return bus->slot_reserved_mask & (1UL << PCI_SLOT(devfn));
 }
 
+static bool pci_bus_devfn_reserved_manual(PCIBus *bus, int devfn)
+{
+    return bus->enforce_slot_reserved_mask_manual &&
+            (bus->slot_reserved_mask & (1UL << PCI_SLOT(devfn)));
+}
+
+void pci_bus_ignore_slot_reserved_mask_manual(PCIBus *bus)
+{
+    bus->enforce_slot_reserved_mask_manual = false;
+}
+
 uint32_t pci_bus_get_slot_reserved_mask(PCIBus *bus)
 {
     return bus->slot_reserved_mask;
@@ -1164,7 +1176,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
                    "or reserved", name);
         return NULL;
     found: ;
-    } else if (pci_bus_devfn_reserved(bus, devfn)) {
+    } else if (pci_bus_devfn_reserved_manual(bus, devfn)) {
         error_setg(errp, "PCI: slot %d function %d not available for %s,"
                    " reserved",
                    PCI_SLOT(devfn), PCI_FUNC(devfn), name);
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 935b4b91b4..48d29ec234 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -287,6 +287,7 @@ void pci_bus_irqs(PCIBus *bus, pci_set_irq_fn set_irq,
 void pci_bus_map_irqs(PCIBus *bus, pci_map_irq_fn map_irq);
 void pci_bus_irqs_cleanup(PCIBus *bus);
 int pci_bus_get_irq_level(PCIBus *bus, int irq_num);
+void pci_bus_ignore_slot_reserved_mask_manual(PCIBus *bus);
 uint32_t pci_bus_get_slot_reserved_mask(PCIBus *bus);
 void pci_bus_set_slot_reserved_mask(PCIBus *bus, uint32_t mask);
 void pci_bus_clear_slot_reserved_mask(PCIBus *bus, uint32_t mask);
diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
index 5653175957..e0f15ee9be 100644
--- a/include/hw/pci/pci_bus.h
+++ b/include/hw/pci/pci_bus.h
@@ -37,6 +37,7 @@ struct PCIBus {
     void *iommu_opaque;
     uint8_t devfn_min;
     uint32_t slot_reserved_mask;
+    bool enforce_slot_reserved_mask_manual;
     pci_set_irq_fn set_irq;
     pci_map_irq_fn map_irq;
     pci_route_irq_fn route_intx_to_irq;
-- 
2.39.2


