Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCD6734B07
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 06:14:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550784.859972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qB6GR-0004eX-IX; Mon, 19 Jun 2023 04:13:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550784.859972; Mon, 19 Jun 2023 04:13:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qB6GR-0004c8-Ff; Mon, 19 Jun 2023 04:13:15 +0000
Received: by outflank-mailman (input) for mailman id 550784;
 Sun, 18 Jun 2023 22:23:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pw1W=CG=gmail.com=jupham125@srs-se1.protection.inumbo.net>)
 id 1qB0ne-0003MH-PO
 for xen-devel@lists.xenproject.org; Sun, 18 Jun 2023 22:23:10 +0000
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [2607:f8b0:4864:20::b35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1f782c1-0e26-11ee-8611-37d641c3527e;
 Mon, 19 Jun 2023 00:23:05 +0200 (CEST)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-bd5f20508f2so3051976276.3
 for <xen-devel@lists.xenproject.org>; Sun, 18 Jun 2023 15:23:05 -0700 (PDT)
Received: from joel-Precision-7920-Tower.. ([24.53.71.1])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a259ac2000000b00bcc0f2e4f05sm3389532ybo.59.2023.06.18.15.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jun 2023 15:23:03 -0700 (PDT)
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
X-Inumbo-ID: b1f782c1-0e26-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687126984; x=1689718984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WA4/ztD/0nKcnp5J0Yr7EQHeA3bsKgodo79kQY3qqUg=;
        b=OZwWao/ihwENyAIawJfaIQ1mrrz3l55YS94Xpa4drALGGy2vlTqBUyA5KdybhMQ/OO
         I+FOiRI0BxqUPBILyKiudlCzscUMj9//8Z09pxSlVzUc8iEEflrAgnnJG7/AZJI2RoZ+
         uUnVV43CZTOs2fVIhZTxAPlsm4BO7O8rAxFgrnMtJzJ4AzULAWE2Acgj9RmzA+b/mGcv
         UojUk32RY6SpKYKiKQUnMdLmZI1IixARQVzBMfUNQAiSv36NjTNMcY4cyuUbiz2+RY3r
         TTK3tpEfSNermfCa7ZR6d7ZXqZIahc8psz8dOwNECbGUeZG/95912ZYKg5MJWrBf6/6w
         fjCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687126984; x=1689718984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WA4/ztD/0nKcnp5J0Yr7EQHeA3bsKgodo79kQY3qqUg=;
        b=XaGNjZP9bGDHM9QYbw8bLtbmNV070ITJpn0p4qizznWWFSo8JiTIwALEHQF1sEm+F1
         bQqWiMDVm9PqVTEqNDxYfhSFR7XV9u3TT/HEA0Jwf4lSARBbvN1ThCv7XEeiJzHG68rX
         lgLi1xElwJFsaBoKSukBkI5D7A455XXjWgDcqPrg1acAfmZirGvKt+yy0/y3LaEjPIP7
         luY3/KiLGVLwjzkYZ2F1yV5ulMzijNqwMdNtJ6UoT20YwifUAaBLSmq+YTpKUVy9LCQ/
         dhCicgPQskMMKp9rzBAbf9q7FsbardtsAtffYZdjBmVhSd7dVvscS/+0u2cc++0yKlwk
         KYTw==
X-Gm-Message-State: AC+VfDxgwjVhCDEWlyT8Rq5/bpPiJRAxgoH2lXXpoI6Be4saieJvd5om
	1KG4qFGrtkn6gVa5irDkaDHmhZ5uo/5hkw==
X-Google-Smtp-Source: ACHHUZ4aNni+pgtl68ym0H1nEYvq7byMDrr+eqNl8YE9IdlP871NrOwwgYBB2F9NGT28rioFkzDmgQ==
X-Received: by 2002:a25:b195:0:b0:b8e:cb88:1b69 with SMTP id h21-20020a25b195000000b00b8ecb881b69mr5267643ybj.34.1687126984249;
        Sun, 18 Jun 2023 15:23:04 -0700 (PDT)
From: Joel Upham <jupham125@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Joel Upham <jupham125@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v1 0/1] Q35 Support
Date: Sun, 18 Jun 2023 18:22:01 -0400
Message-Id: <cover.1687121835.git.jupham125@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Q35 support using Qemu's device emulation.  I based the patches from 2017
found on the mailing list here:
https://lists.xenproject.org/archives/html/xen-devel/2018-03/msg01176.html

I have been using a version of these patches on Xen 4.16 with Qemu
version 4.1 for over 6 months.  The guest VMs are very stable, and PCIe
PT is working as was designed (all of the PCIe devices are on the root
PCIe device).  I have successfully passed through GPUs, NICs, etc. I was
asked by those in the community to attempt to once again upstream the
patches.  I have them working with Seabios and OVMF (patches are needed
to OVMF which I will be sending to the mailing list).  I will be sending
my Qemu patches to their mailing list in hopes of getting everything
upstreamed. The Qemu patches allow for the xenvbd to properly unplug the
AHCI SATA device, and all xen pv windows drivers work as intended.

I used the original author of the patches to get a majority of this to work:
Alexey Gerasimenko.  I fixed the patches to be in line with the upstream
Qemu and Xen versions.  Any original issues may still exist; however, I
am sure in time they can be improved. If the code doesn't exist then they 
can't be actively looked at by the community.

I am not an expert on the Q35 chipset or PCIe technology.  This is my
first patch to this mailing list.

Recap of changes to Qemu, only here for reference:
  pc/xen: Xen Q35 support: provide IRQ handling for PCI devices
  pc/q35: Apply PCI bus BSEL property for Xen PCI device hotplug
  acpi/ich9: Multiple fixes for S3 support
  acpi/pcihp: Allow for machines to hotplug when using Xen
  isa/lpc_ich9: Write lpc configuration for xen IRQs
  q35/acpi/xen: Provide ACPI PCI hotplug interface for Xen on Q35
  q35/xen: Add Xen platform device support for Q35
  q35: Fix incorrect values for PCIEXBAR masks
  xen/pt: XenHostPCIDevice: provide functions for PCI Capabilities and
    PCIe Extended Capabilities enumeration
  xen/pt: avoid reading PCIe device type and cap version multiple times
  xen/pt: determine the legacy/PCIe mode for a passed through device
  xen/pt: Xen PCIe passthrough support for Q35: bypass PCIe topology
    check
  xen/pt: add support for PCIe Extended Capabilities and larger config
    space
  xen/pt: handle PCIe Extended Capabilities Next register
  xen/pt: allow to hide PCIe Extended Capabilities
  xen/pt: add Vendor-specific PCIe Extended Capability descriptor and
    sizing
  xen/pt: add fixed-size PCIe Extended Capabilities descriptors
  xen/pt: add AER PCIe Extended Capability descriptor and sizing
  xen/pt: add descriptors and size calculation for
    RCLD/ACS/PMUX/DPA/MCAST/TPH/DPC PCIe Extended Capabilities
  xen/pt: add Resizable BAR PCIe Extended Capability descriptor and
    sizing
  xen/pt: add VC/VC9/MFVC PCIe Extended Capabilities descriptors and
    sizing

Changes that would be going to upstream Qemu:
 hw/acpi/ich9.c                |   22 +-
 hw/acpi/pcihp.c               |    6 +-
 hw/core/machine.c             |   19 +
 hw/i386/pc_piix.c             |    3 +-
 hw/i386/pc_q35.c              |   39 +-
 hw/i386/xen/xen-hvm.c         |    7 +-
 hw/i386/xen/xen_platform.c    |   19 +-
 hw/ide/ahci.c                 |    2 +-
 hw/isa/lpc_ich9.c             |   53 +-
 hw/isa/piix3.c                |    2 +-
 hw/pci-host/q35.c             |   28 +-
 hw/pci/pci.c                  |   17 +
 hw/xen/xen-host-pci-device.c  |  106 +++-
 hw/xen/xen-host-pci-device.h  |    6 +-
 hw/xen/xen_pt.c               |   49 +-
 hw/xen/xen_pt.h               |   19 +-
 hw/xen/xen_pt_config_init.c   | 1103 ++++++++++++++++++++++++++++++---
 include/hw/acpi/ich9.h        |    1 +
 include/hw/acpi/pcihp.h       |    2 +
 include/hw/boards.h           |    1 +
 include/hw/i386/pc.h          |    3 +
 include/hw/pci-host/q35.h     |    4 +-
 include/hw/pci/pci.h          |    3 +
 include/hw/southbridge/ich9.h |    1 +
 include/hw/xen/xen.h          |    4 +-
 qemu-options.hx               |    1 +
 softmmu/datadir.c             |    1 -
 softmmu/qdev-monitor.c        |    3 +-
 stubs/xen-hw-stub.c           |    4 +-
 29 files changed, 1396 insertions(+), 132 deletions(-)
*** These patches are not found in this series, if they are supposed to
be I will send them here as well. ***

Recap of changes to Xen:
  libacpi: new DSDT ACPI table for Q35
  Makefile: build and use new DSDT table for Q35
  hvmloader: add function to query an emulated machine type (i440/Q35)
  hvmloader: add ACPI enabling for Q35
  hvmloader: add Q35 DSDT table loading
  hvmloader: add basic Q35 support
  hvmloader: allocate MMCONFIG area in the MMIO hole + minor code
    refactoring
  hvmloader: seabios dsdt set to load correct config
  hvmloader: ovmf dsdt set to load correct config
  libxl: Q35 support (new option device_model_machine)
  libxl: Xen Platform device support for Q35
  libacpi: build ACPI MCFG table if requested
  hvmloader: use libacpi to build MCFG table
  docs: provide description for device_model_machine option

Joel Upham (1):
  Q35 support

 docs/man/xl.cfg.5.pod.in             |  27 ++
 tools/firmware/hvmloader/Makefile    |   2 +-
 tools/firmware/hvmloader/config.h    |   6 +
 tools/firmware/hvmloader/hvmloader.c |  13 +-
 tools/firmware/hvmloader/ovmf.c      |   7 +-
 tools/firmware/hvmloader/pci.c       | 285 +++++++++----
 tools/firmware/hvmloader/pci_regs.h  |   6 +
 tools/firmware/hvmloader/seabios.c   |   5 +
 tools/firmware/hvmloader/util.c      | 130 +++++-
 tools/firmware/hvmloader/util.h      |  10 +
 tools/libacpi/Makefile               |  10 +-
 tools/libacpi/acpi2_0.h              |  21 +
 tools/libacpi/build.c                |  43 ++
 tools/libacpi/dsdt_q35.asl           | 578 +++++++++++++++++++++++++++
 tools/libacpi/libacpi.h              |   4 +
 tools/libs/light/libxl_dm.c          |  60 ++-
 tools/libs/light/libxl_types.idl     |   8 +
 tools/xl/xl_parse.c                  |  14 +
 18 files changed, 1120 insertions(+), 109 deletions(-)
 create mode 100644 tools/libacpi/dsdt_q35.asl

-- 
2.34.1


