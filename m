Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 999C673727D
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 19:16:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551977.861780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBexZ-0004tR-IY; Tue, 20 Jun 2023 17:16:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551977.861780; Tue, 20 Jun 2023 17:16:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBexZ-0004qa-ET; Tue, 20 Jun 2023 17:16:05 +0000
Received: by outflank-mailman (input) for mailman id 551977;
 Tue, 20 Jun 2023 17:16:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/wkg=CI=gmail.com=jupham125@srs-se1.protection.inumbo.net>)
 id 1qBexY-0004qU-52
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 17:16:04 +0000
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [2607:f8b0:4864:20::e32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 213a4d11-0f8e-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 19:16:01 +0200 (CEST)
Received: by mail-vs1-xe32.google.com with SMTP id
 ada2fe7eead31-44096f01658so1710473137.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jun 2023 10:16:01 -0700 (PDT)
Received: from joel-Precision-7920-Tower.. ([24.53.71.1])
 by smtp.gmail.com with ESMTPSA id
 f81-20020a25cf54000000b00bcc0f2e4f05sm461938ybg.59.2023.06.20.10.15.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 10:15:59 -0700 (PDT)
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
X-Inumbo-ID: 213a4d11-0f8e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687281360; x=1689873360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H9e69r/0hBb1Pz3HX6FalfGvqxFEmextEqSYdmN4rrc=;
        b=opB/iZoLem7H+PnWqBq9b24YYfHf8TdHx4A7YYNBeH8BAX+AyBdC+diJqSkYVlYWCM
         L8UESBpinQJbo2x6cB/aKyEWk/77fT46nkf2LT6YDJGyfg9PTbZYS+GWYWRzz1fGreX2
         ETmQU2Wl1PZRcLwrHMrgtVTTgcbaXJ+pTwlvcknUeOB56rr9cc6byBfs7USxnm7/ZM8p
         VdsYjZjhvb48aIvBoK718J5RHrtrTH7G717W4pg7voGH0z7/IBBjeie4FgviVsV380XW
         fqGEk4rhKzI90wVKBJvY9j0okHqsBWhk9mnpECgF/YcpehCVpPw4iIeXFid2Qr1Bog7T
         Dr1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687281360; x=1689873360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H9e69r/0hBb1Pz3HX6FalfGvqxFEmextEqSYdmN4rrc=;
        b=ePgXgb7Lan4Ey4sDLGtbfnqEYKmIzshLEfo34/qr4XeCSABGdupngtTWWneXGkI4Gp
         MF5iN4jjkKO6P/28Yjhfql3siF+BEm175a96m6JupEO8hyKVB/KrBjHnfo66Lk5fXAut
         tz4iAtgy+MkwMdVNcOjZl0kD6sA8L6kJm/oRz1en7kf57LlwfvJ1BLEqyTGHpOxeLoMZ
         7kS6m2JR5awdndJKR/4FNwldQOjutMHWQSobt8v6GAy33IA14k60JEKczWlYem2qkW4D
         NPxvwnWicvhQ2UnIEn9zZHYt3vDHMHfRkzlDDpECZI0GHfoSTwWBfMa4gPKH3ZE5hLj6
         2DFQ==
X-Gm-Message-State: AC+VfDy6tBqtJx1jOhs2++BrSIIG/OT5oaQdyBEJUPa0FMghiPY63VDM
	/yJl4ZuKgoZSih/dNt8M1bt3BTLpWKUDsQ==
X-Google-Smtp-Source: ACHHUZ7k+DApySytYCVci6XOU4BEoW3Jyn/QKZ38Dvl8xeVkMr0zudjtZCM/keeVEaA8jpTr9z8uKw==
X-Received: by 2002:a67:e282:0:b0:43f:5781:59c with SMTP id g2-20020a67e282000000b0043f5781059cmr5595232vsf.9.1687281360268;
        Tue, 20 Jun 2023 10:16:00 -0700 (PDT)
From: Joel Upham <jupham125@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Joel Upham <jupham125@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 00/12] Q35 Support
Date: Tue, 20 Jun 2023 13:15:40 -0400
Message-Id: <cover.1687215890.git.jupham125@gmail.com>
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
first patch to this mailing list. I realized that my first patch was not
properly formatted into a series, so this is the full series version.

Signed-off-by: Joel Upham <jupham125@gmail.com>
Joel Upham (12):
  libacpi: new DSDT ACPI table for Q35
  Makefile: build and use new DSDT table for Q35
  hvmloader: add function to query an emulated machine type (i440/Q35)
  hvmloader: add ACPI enabling for Q35
  hvmloader: add Q35 DSDT table loading
  hvmloader: add basic Q35 support
  hvmloader: allocate MMCONFIG area in the MMIO hole + minor code
    refactoring
  libxl: Q35 support (new option device_model_machine)
  libacpi: build ACPI MCFG table if requested
  hvmloader: use libacpi to build MCFG table
  docs: provide description for device_model_machine option
  libxl_dm: handle the new 6 port ahci controller

 docs/man/xl.cfg.5.pod.in             |  27 ++
 tools/firmware/hvmloader/Makefile    |   2 +-
 tools/firmware/hvmloader/config.h    |   6 +
 tools/firmware/hvmloader/hvmloader.c |  13 +-
 tools/firmware/hvmloader/ovmf.c      |   5 +
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
 18 files changed, 1119 insertions(+), 108 deletions(-)
 create mode 100644 tools/libacpi/dsdt_q35.asl

Qemu changes in bound to their mailing list:
  pc/xen: Xen Q35 support: provide IRQ handling for PCI devices
  pc/q35: Apply PCI bus BSEL property for Xen PCI device hotplug
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
  xen/pt: Fake capability id
  xen platform: unplug ahci object
  pc/q35: setup q35 for xen
  qdev-monitor/pt: bypass root device check
  s3 support: enabling s3 with q35

 hw/acpi/ich9.c                |   22 +-
 hw/acpi/pcihp.c               |    6 +-
 hw/core/machine.c             |   19 +
 hw/i386/pc_piix.c             |    3 +-
 hw/i386/pc_q35.c              |   39 +-
 hw/i386/xen/xen-hvm.c         |    7 +-
 hw/i386/xen/xen_platform.c    |   19 +-
 hw/isa/lpc_ich9.c             |   53 +-
 hw/isa/piix3.c                |    2 +-
 hw/pci-host/q35.c             |   28 +-
 hw/pci/pci.c                  |   17 +
 hw/xen/xen-host-pci-device.c  |  106 +++-
 hw/xen/xen-host-pci-device.h  |    6 +-
 hw/xen/xen_pt.c               |   49 +-
 hw/xen/xen_pt.h               |   18 +-
 hw/xen/xen_pt_config_init.c   | 1103 ++++++++++++++++++++++++++++++---
 include/hw/acpi/pcihp.h       |    2 +
 include/hw/boards.h           |    1 +
 include/hw/i386/pc.h          |    3 +
 include/hw/pci-host/q35.h     |    4 +-
 include/hw/pci/pci.h          |    3 +
 include/hw/southbridge/ich9.h |    1 +
 include/hw/xen/xen.h          |    4 +-
 qemu-options.hx               |    1 +
 softmmu/qdev-monitor.c        |    4 +-
 stubs/xen-hw-stub.c           |    4 +-
 26 files changed, 1394 insertions(+), 130 deletions(-)

-- 
2.34.1


