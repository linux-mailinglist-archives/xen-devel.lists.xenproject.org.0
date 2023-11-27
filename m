Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 174DD7F9AF2
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 08:29:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641629.1000353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7W2r-0004nj-Iv; Mon, 27 Nov 2023 07:28:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641629.1000353; Mon, 27 Nov 2023 07:28:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7W2r-0004kW-FV; Mon, 27 Nov 2023 07:28:41 +0000
Received: by outflank-mailman (input) for mailman id 641629;
 Mon, 27 Nov 2023 07:28:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YRKV=HI=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1r7W2q-0004kO-Bw
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 07:28:40 +0000
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93e22585-8cf6-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 08:28:37 +0100 (CET)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 5DE171B90A1;
 Mon, 27 Nov 2023 02:28:36 -0500 (EST)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 42BB81B90A0;
 Mon, 27 Nov 2023 02:28:36 -0500 (EST)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [188.163.75.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 11A0D1B909F;
 Mon, 27 Nov 2023 02:28:34 -0500 (EST)
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
X-Inumbo-ID: 93e22585-8cf6-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=MYnPoETdUxJ/TLIQahbfyCUvdmhPJe4Jj/xrR19sxn8=; b=naLe
	HRVUaEVyY4Cj2bfm8V8NwMp8JxjoWOqgv9Y1bhFQ2w3j9MsnMCkq6D+ZYZKcENrQ
	4ev5eeXRb63XP63L+539B07m5El2vjVohkUBJ1qkwtIR/hx0VtoYgcF/4JzjUTE3
	WW/bXYP11rX+awLQTkQzu2KAabVi5s7B9yLF9oM=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org,
	Julien Grall <julien@xen.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Juergen Gross <jgross@suse.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [RFC PATCH v1 0/5] ARM virtio-pci initial support
Date: Mon, 27 Nov 2023 09:27:49 +0200
Message-Id: <20231127072754.4045254-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 92FC8734-8CF6-11EE-B193-25B3960A682E-90055647!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable

Hi,
The next iteration of RFC series introducing support of PCI devices emula=
ted by Virtio=20
on ARM platform.

A guest system is presented with Virtio Host bridge device, through
which a number of emulated PCI devices (e.g. disk, network, graphic, audi=
o etc)
can work with corresponding guests' subsystems.

For that purpose we add a new "pci" virtio transport mechanism in xl
configuration, in addition to present "mmio" mechanism.

Suitable MMIO and IRQ ranges are reverved and guest's DT extended with PC=
I
(#INTA..#INTD) interrupt mappings.

For now only supported combination of backends is when both PCI Host brid=
ge
and all PCI devices behind it are emulated by the same single instance (i=
.e. Qemu).

The code was tested with QEMU backends, yet it aims to be extendable to s=
upport
stand-alone backends.

Initial series:

https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg157743.htm=
l

Changes in v1:
  - one virtio-pci bus instead of two, hence cut reserved memory regions'=
 size by 2
  - drop the code to trap & forward MMIO access to IOREQ server, since we=
 can
    do without it in this series
  - better describe reserver resources' limits both in code & commit desc=
ription

 -Sergiy


Oleksandr Tyshchenko (5):
  libxl: Pass max_vcpus to Qemu in case of PVH domain (Arm) as well
  xen/public: arch-arm: reserve resources for virtio-pci
  libxl/arm: Add basic virtio-pci support
  libxl/arm: Reuse generic PCI-IOMMU bindings for virtio-pci devices
  libxl: Add "backend_type" property for the Virtio devices

 docs/man/xl.cfg.5.pod.in          |  18 +-
 tools/libs/light/libxl_arm.c      | 351 ++++++++++++++++++++++++++++--
 tools/libs/light/libxl_create.c   |  18 +-
 tools/libs/light/libxl_dm.c       |  98 ++++++++-
 tools/libs/light/libxl_internal.h |   5 +
 tools/libs/light/libxl_types.idl  |  41 +++-
 tools/libs/light/libxl_virtio.c   | 119 ++++++++--
 tools/xl/xl_parse.c               |  39 ++++
 xen/include/public/arch-arm.h     |  26 +++
 9 files changed, 656 insertions(+), 59 deletions(-)

--=20
2.25.1


