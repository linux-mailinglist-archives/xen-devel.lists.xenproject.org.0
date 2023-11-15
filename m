Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FCA7EC143
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 12:26:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633571.988513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3E2M-0004XP-EW; Wed, 15 Nov 2023 11:26:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633571.988513; Wed, 15 Nov 2023 11:26:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3E2M-0004Vb-9w; Wed, 15 Nov 2023 11:26:26 +0000
Received: by outflank-mailman (input) for mailman id 633571;
 Wed, 15 Nov 2023 11:26:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zXr+=G4=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1r3E2L-00040Y-C9
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 11:26:25 +0000
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf16a516-83a9-11ee-98db-6d05b1d4d9a1;
 Wed, 15 Nov 2023 12:26:24 +0100 (CET)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id D393F1C1C59;
 Wed, 15 Nov 2023 06:26:23 -0500 (EST)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id C90C21C1C58;
 Wed, 15 Nov 2023 06:26:23 -0500 (EST)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 166421C1C56;
 Wed, 15 Nov 2023 06:26:22 -0500 (EST)
 (envelope-from sakib@darkstar.site)
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
X-Inumbo-ID: cf16a516-83a9-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=sk3rL+DVQWnHfmbcVD4VUySak
	WU6iSq3V+yGTLD5SnE=; b=d65LZKjGp9RuGE/Irs55jSZ1205eAfYsgucZKQ6Fk
	svlBIePhvi7Q+jm1yIk0jQUQ278uRo5MqWBdP7OEud1ysi/WamDU1Tc+abwrQI2w
	uwQKK8tnRQXNzr06GI9av+WQNDJJruqI7fDWV6Jy8XUQta2VaN+eKv/ElQg1iZxr
	ZU=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [RFC PATCH 2/6] xen/public: arch-arm: reserve resources for virtio-pci
Date: Wed, 15 Nov 2023 13:26:07 +0200
Message-Id: <20231115112611.3865905-3-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231115112611.3865905-1-Sergiy_Kibrik@epam.com>
References: <20231115112611.3865905-1-Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 CE6E5C9E-83A9-11EE-8331-25B3960A682E-90055647!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

In order to enable more use-cases such as having multiple
device-models (Qemu) running in different backend domains which provide
virtio-pci devices for the same guest, we allocate and expose one
PCI host bridge for every virtio backend domain for that guest.

For that purpose, reserve separate virtio-pci resources (memory and SPI r=
ange
for Legacy PCI interrupts) up to 8 possible PCI hosts (to be aligned with
MAX_NR_IOREQ_SERVERS) and allocate a host per backend domain. The PCI hos=
t
details including its host_id to be written to dedicated Xenstore node fo=
r
the device-model to retrieve.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/include/public/arch-arm.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.=
h
index a25e87dbda..e6c9cd5335 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -466,6 +466,19 @@ typedef uint64_t xen_callback_t;
 #define GUEST_VPCI_MEM_ADDR                 xen_mk_ullong(0x23000000)
 #define GUEST_VPCI_MEM_SIZE                 xen_mk_ullong(0x10000000)
=20
+/*
+ * 16 MB is reserved for virtio-pci configuration space based on calcula=
tion
+ * 8 bridges * 2 buses x 32 devices x 8 functions x 4 KB =3D 16 MB
+ */
+#define GUEST_VIRTIO_PCI_ECAM_BASE          xen_mk_ullong(0x33000000)
+#define GUEST_VIRTIO_PCI_TOTAL_ECAM_SIZE    xen_mk_ullong(0x01000000)
+#define GUEST_VIRTIO_PCI_HOST_ECAM_SIZE     xen_mk_ullong(0x00200000)
+
+/* 64 MB is reserved for virtio-pci memory */
+#define GUEST_VIRTIO_PCI_ADDR_TYPE_MEM    xen_mk_ullong(0x02000000)
+#define GUEST_VIRTIO_PCI_MEM_ADDR         xen_mk_ullong(0x34000000)
+#define GUEST_VIRTIO_PCI_MEM_SIZE         xen_mk_ullong(0x04000000)
+
 /*
  * 16MB =3D=3D 4096 pages reserved for guest to use as a region to map i=
ts
  * grant table in.
@@ -476,6 +489,11 @@ typedef uint64_t xen_callback_t;
 #define GUEST_MAGIC_BASE  xen_mk_ullong(0x39000000)
 #define GUEST_MAGIC_SIZE  xen_mk_ullong(0x01000000)
=20
+/* 64 MB is reserved for virtio-pci Prefetch memory */
+#define GUEST_VIRTIO_PCI_ADDR_TYPE_PREFETCH_MEM    xen_mk_ullong(0x42000=
000)
+#define GUEST_VIRTIO_PCI_PREFETCH_MEM_ADDR         xen_mk_ullong(0x3a000=
000)
+#define GUEST_VIRTIO_PCI_PREFETCH_MEM_SIZE         xen_mk_ullong(0x04000=
000)
+
 #define GUEST_RAM_BANKS   2
=20
 /*
@@ -515,6 +533,9 @@ typedef uint64_t xen_callback_t;
 #define GUEST_VIRTIO_MMIO_SPI_FIRST   33
 #define GUEST_VIRTIO_MMIO_SPI_LAST    43
=20
+#define GUEST_VIRTIO_PCI_SPI_FIRST   44
+#define GUEST_VIRTIO_PCI_SPI_LAST    76
+
 /* PSCI functions */
 #define PSCI_cpu_suspend 0
 #define PSCI_cpu_off     1
--=20
2.25.1


