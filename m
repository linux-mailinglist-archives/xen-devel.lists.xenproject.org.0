Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4097EC142
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 12:26:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633569.988493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3E2J-00043k-TD; Wed, 15 Nov 2023 11:26:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633569.988493; Wed, 15 Nov 2023 11:26:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3E2J-00040j-QM; Wed, 15 Nov 2023 11:26:23 +0000
Received: by outflank-mailman (input) for mailman id 633569;
 Wed, 15 Nov 2023 11:26:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zXr+=G4=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1r3E2H-00040Y-Tf
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 11:26:21 +0000
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cbb761b4-83a9-11ee-98db-6d05b1d4d9a1;
 Wed, 15 Nov 2023 12:26:19 +0100 (CET)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id ECD491CC41E;
 Wed, 15 Nov 2023 06:26:17 -0500 (EST)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id E471B1CC41D;
 Wed, 15 Nov 2023 06:26:17 -0500 (EST)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id D12831CC419;
 Wed, 15 Nov 2023 06:26:16 -0500 (EST)
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
X-Inumbo-ID: cbb761b4-83a9-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=IYnOcdGdFg+jMm+KFkyEmtwhFYJmyjS/Q+tOUVXRUvo=; b=lKzZ
	Ua2yHiUFz9LpkkQwJHsHv6pGvc4JlgBtB9jLxaeYR51zybAjmjmpZgap+bA6xanR
	8QG0P8zVDxNhKpf9KI68CuYF8fsOFBvId8aoSKwjx5xRAVT6XGLZPSYh0d4zI/CW
	WWrMMl0j9sJSkGWsFoiNeq6x/l+QHisR/y100jU=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 0/6] ARM virtio-pci initial support
Date: Wed, 15 Nov 2023 13:26:05 +0200
Message-Id: <20231115112611.3865905-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 CAB65B88-83A9-11EE-B3ED-78DCEB2EC81B-90055647!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable

Hi,
In this patch series we introduce support of PCI devices emulated by Virt=
io=20
on ARM platform. A guest system is presented with Virtio Host bridge devi=
ce, through
which a number of emulated PCI devices (e.g. disk, network, graphic, audi=
o etc)
can work with corresponding guests' subsystems.

For that purpose we add a new "pci" virtio transport mechanism in xl
configuration, in addition to present "mmio" mechanism.

Suitable MMIO and IRQ ranges are reverved, for guests' PCI accesses are t=
rapped
and forwarded to IOREQ server to be handled outside of Xen. Also guest's =
DT
extended with PCI (#INTA..#INTD) interrupt mappings.

For now only supported combination of backends is when both PCI Host brid=
ge
and all PCI devices behind it are emulated by the same single instance (i=
.e. Qemu).

The code was tested with QEMU backends, yet it aims to be extendable to s=
upport
stand-alone backends.

 -Sergiy

Oleksandr Tyshchenko (6):
  libxl: Pass max_vcpus to Qemu in case of PVH domain (Arm) as well
  xen/public: arch-arm: reserve resources for virtio-pci
  libxl/arm: Add basic virtio-pci support
  libxl/arm: Reuse generic PCI-IOMMU bindings for virtio-pci devices
  xen/arm: Intercept vPCI config accesses and forward them to emulator
  libxl: Add "backend_type" property for the Virtio devices

 docs/man/xl.cfg.5.pod.in              |  18 +-
 tools/libs/light/libxl_arm.c          | 351 ++++++++++++++++++++++++--
 tools/libs/light/libxl_create.c       |  18 +-
 tools/libs/light/libxl_dm.c           |  98 ++++++-
 tools/libs/light/libxl_internal.h     |   5 +
 tools/libs/light/libxl_types.idl      |  41 ++-
 tools/libs/light/libxl_virtio.c       | 119 +++++++--
 tools/xl/xl_parse.c                   |  39 +++
 xen/arch/arm/Kconfig                  |  10 +
 xen/arch/arm/domain.c                 |   2 +-
 xen/arch/arm/{ =3D> include/asm}/vpci.h |  11 +
 xen/arch/arm/io.c                     |   8 +-
 xen/arch/arm/ioreq.c                  |  19 +-
 xen/arch/arm/vpci.c                   | 106 +++++++-
 xen/include/public/arch-arm.h         |  21 ++
 15 files changed, 797 insertions(+), 69 deletions(-)
 rename xen/arch/arm/{ =3D> include/asm}/vpci.h (75%)

--=20
2.25.1


