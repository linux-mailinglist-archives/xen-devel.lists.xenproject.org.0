Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 727607F9AF4
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 08:29:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641632.1000372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7W3L-0005V8-1h; Mon, 27 Nov 2023 07:29:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641632.1000372; Mon, 27 Nov 2023 07:29:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7W3K-0005ST-UI; Mon, 27 Nov 2023 07:29:10 +0000
Received: by outflank-mailman (input) for mailman id 641632;
 Mon, 27 Nov 2023 07:29:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YRKV=HI=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1r7W3J-0004kO-2v
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 07:29:09 +0000
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a553287b-8cf6-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 08:29:06 +0100 (CET)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 7EF7C1A51D;
 Mon, 27 Nov 2023 02:29:05 -0500 (EST)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 776291A51C;
 Mon, 27 Nov 2023 02:29:05 -0500 (EST)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [188.163.75.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 128D41A51B;
 Mon, 27 Nov 2023 02:29:02 -0500 (EST)
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
X-Inumbo-ID: a553287b-8cf6-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=9JyQs8aYabTMI9rypcTcqg0D+
	zlsuPF150pLvMUKNLw=; b=DCK0JzAdWuHs1rJw6rdFhZXTTx+y09Sde575U9o9D
	c1vo+MFHq4+UipolP1yjlwaL3SNujaTI9u78ApAaTYtTJlDPgG9iWz3CfHNf8p+j
	RRoiTImhqgE3GQ/dVeeJDQQpHN4BFtys47iFD92c7bw9HMClp5w3ujuFblKwUz81
	/c=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org,
	Julien Grall <julien@xen.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Juergen Gross <jgross@suse.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [RFC PATCH v1 2/5] xen/public: arch-arm: reserve resources for virtio-pci
Date: Mon, 27 Nov 2023 09:27:51 +0200
Message-Id: <20231127072754.4045254-3-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231127072754.4045254-1-Sergiy_Kibrik@epam.com>
References: <20231127072754.4045254-1-Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 A314BB46-8CF6-11EE-98F6-A19503B9AAD1-90055647!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

In order to enable more use-cases such as having multiple
device-models (Qemu) running in different backend domains which provide
virtio-pci devices for the same guest, we allocate and expose one
PCI host bridge for every virtio backend domain for that guest.

For that purpose we reserve separate virtio-pci resources (memory and SPI=
 range
for Legacy PCI interrupts) for up to 8 possible PCI host bridges
(to be aligned with MAX_NR_IOREQ_SERVERS) and allocate one host bridge pe=
r
backend domain. We'll need at most 32 interrupts (INTA..INTD legacy PCI
interrupts per each of 8 host bridges), and at most 32MB of memory
(since as it was observed virtio-pci devices use up to 16KB each, this ca=
n
be different for physical PCI devices ofc).

The details of PCI host bridge (including its host_id)
are to be written to dedicated Xenstore node for the device-model to retr=
ieve.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/include/public/arch-arm.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.=
h
index a25e87dbda..caa4e92b55 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -466,6 +466,28 @@ typedef uint64_t xen_callback_t;
 #define GUEST_VPCI_MEM_ADDR                 xen_mk_ullong(0x23000000)
 #define GUEST_VPCI_MEM_SIZE                 xen_mk_ullong(0x10000000)
=20
+/*
+ * 8 MB is reserved for virtio-pci configuration space based on calculat=
ion
+ * 8 bridges x 32 devices x 8 functions x 4 KB =3D 8 MB
+ */
+#define GUEST_VIRTIO_PCI_ECAM_BASE          xen_mk_ullong(0x33000000)
+#define GUEST_VIRTIO_PCI_TOTAL_ECAM_SIZE    xen_mk_ullong(0x00800000)
+#define GUEST_VIRTIO_PCI_HOST_ECAM_SIZE     xen_mk_ullong(0x00100000)
+
+/* 32 MB is reserved for virtio-pci memory based on calculation
+ * 8 bridges x 32 devices x 8 functions x 16 KB per virtio-pci device =3D=
 32 MB
+ */
+#define GUEST_VIRTIO_PCI_ADDR_TYPE_MEM    xen_mk_ullong(0x02000000)
+#define GUEST_VIRTIO_PCI_MEM_ADDR         xen_mk_ullong(0x33800000)
+#define GUEST_VIRTIO_PCI_MEM_SIZE         xen_mk_ullong(0x02000000)
+
+/* 32 MB is reserved for virtio-pci Prefetch memory based on calculation
+ * 8 bridges x 32 devices x 8 functions x 16 KB per virtio-pci device =3D=
 32 MB
+ */
+#define GUEST_VIRTIO_PCI_ADDR_TYPE_PREFETCH_MEM    xen_mk_ullong(0x42000=
000)
+#define GUEST_VIRTIO_PCI_PREFETCH_MEM_ADDR         xen_mk_ullong(0x35800=
000)
+#define GUEST_VIRTIO_PCI_PREFETCH_MEM_SIZE         xen_mk_ullong(0x02000=
000)
+
 /*
  * 16MB =3D=3D 4096 pages reserved for guest to use as a region to map i=
ts
  * grant table in.
@@ -515,6 +537,10 @@ typedef uint64_t xen_callback_t;
 #define GUEST_VIRTIO_MMIO_SPI_FIRST   33
 #define GUEST_VIRTIO_MMIO_SPI_LAST    43
=20
+/* 8 bridges x 4 #INTA..#INTD interrupts =3D 32 SPIs to reserve for virt=
io-pci */
+#define GUEST_VIRTIO_PCI_SPI_FIRST   44
+#define GUEST_VIRTIO_PCI_SPI_LAST    76
+
 /* PSCI functions */
 #define PSCI_cpu_suspend 0
 #define PSCI_cpu_off     1
--=20
2.25.1


