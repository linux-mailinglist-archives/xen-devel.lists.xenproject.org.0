Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE958903EC
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 16:55:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699004.1091360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rps5V-0006od-CK; Thu, 28 Mar 2024 15:54:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699004.1091360; Thu, 28 Mar 2024 15:54:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rps5V-0006mB-91; Thu, 28 Mar 2024 15:54:45 +0000
Received: by outflank-mailman (input) for mailman id 699004;
 Thu, 28 Mar 2024 15:54:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yxy0=LC=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rps5U-0006m5-9t
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 15:54:44 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e1863c4-ed1b-11ee-afe3-a90da7624cb6;
 Thu, 28 Mar 2024 16:54:43 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-56c08d1e900so1331688a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 08:54:43 -0700 (PDT)
Received: from m1x-phil.lan (pas38-h02-176-184-5-52.dsl.sta.abo.bbox.fr.
 [176.184.5.52]) by smtp.gmail.com with ESMTPSA id
 f4-20020a056402194400b0056c4cdc987esm968928edz.8.2024.03.28.08.54.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 28 Mar 2024 08:54:42 -0700 (PDT)
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
X-Inumbo-ID: 7e1863c4-ed1b-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711641282; x=1712246082; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9jGFJM87g0s+QJiSxyo+fFml0FCFfdp02zPTSZX+zrs=;
        b=IPfKbGGB6oISl05QkxKMgKjKA/rQehTGRooIeNAzefd5hUyyEFqOch7j7wnEKL399m
         p4F9MgAllghxKulDzn76UPGod4z11js/72ZOy5SYA1iD7xVpZWxJYVgKPvnOIV++zlbX
         JlSG/K+fxYZhTzgJa5/RD9knN5t1Y45aTknWwP76XKXqYY29937JGZkiUTqLU+MYlUfi
         p++qu+4XV4BpWB604tnq3xcJVuTdtTmtmhmdmMf3o5cUR6TV/hHgRkc+lTQELGEztqd6
         kNpABkUeZqONod6ogs4LyeuyDnnQ+IkKdc3EjlAa4V/s7+oOYHtpbCBV4zu50dkR8Dzq
         cs8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711641283; x=1712246083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9jGFJM87g0s+QJiSxyo+fFml0FCFfdp02zPTSZX+zrs=;
        b=IADmHnFsXEaCpHd1g399LQOrrrLglT5uXOc4mM245L1Q/uDiWL14Rqgr/tE7YhANdF
         5S8i1yGCisHL7SPqPbmzyPVW9qFtBqlZOz03vV+yqrkzrPGMWEBz3J2sVseZjbcciIdE
         iYDxkqvz/SOEjCMj2E8ooMGSpvYoZ2642iKnorx8OdLJwxg/pghQ46SvDV9J2Gv0p0yu
         dI5PgpENEEE+u/3UIzMJvraXgSEsx1yGds8aaHpiGntmXBAo9l1nDFXZarDf689Z72yc
         pvhiaPrm2qSV2mHsr4k3ZWiwRfNmfFcr/vcye2O40/Q27F14uaEC1QbLyI0NAlf0eGYA
         zZag==
X-Forwarded-Encrypted: i=1; AJvYcCWOpLdQHM3Gf44UN3eqPzCRmOdvKRAEfZ/+JnsxgFvJ5h4+1QiSKojlz9NMusbST0yg+KuxdixHDQwFn8aozG1XK+z2aJtcet8JUY8iEbI=
X-Gm-Message-State: AOJu0Yz4u15TWgNkbD/wpx3zD5kKazja+NNLeo1fU6xUq459OAKyaepq
	FrWz/XwvUsc3HrriiFTh8p6O+u6x5ZG1V7a+wJCIF8phdYg7UFCkHrsU4fGWErc=
X-Google-Smtp-Source: AGHT+IF49DaXGjHZW9HD9cL+HRM/1d+LDb7jwUvaelY4b9yVxDNea692GvPtisYDleFJnYb7JifYOA==
X-Received: by 2002:a50:99c2:0:b0:56c:2ef7:f3ed with SMTP id n2-20020a5099c2000000b0056c2ef7f3edmr2553704edb.35.1711641282639;
        Thu, 28 Mar 2024 08:54:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Bernhard Beschow <shentey@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Ani Sinha <anisinha@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH-for-9.1 00/29] hw/i386/pc: Decouple ISA vs PCI-based machines
Date: Thu, 28 Mar 2024 16:54:08 +0100
Message-ID: <20240328155439.58719-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi Igor,

This is the first steps to decouple the isapc VS q35/i440fx
machines. A new TYPE_PC_PCI_MACHINE is introduced to help
differentiating. Fields unrelated to the legacy isapc are
moved to the new PcPciMachineState structure.

More work remain in hw/i386/pc_piix.c so we can build a
binary with only CONFIG_ISAPC enabled.

Based-on: <20240327095124.73639-1-philmd@linaro.org>
"hw/i386: Remove deprecated pc-i440fx-2.0 -> 2.3 machines"

Philippe Mathieu-Daudé (29):
  hw/i386/pc: Declare CPU QOM types using DEFINE_TYPES() macro
  hw/i386/pc: Extract pc_machine_is_pci_enabled() helper
  hw/i386/pc: Pass base machine type as argument to DEFINE_PC_MACHINE()
  hw/i386/pc: Introduce PC_PCI_MACHINE QOM type
  hw/i386/pc: Remove PCMachineClass::pci_enabled field
  hw/i386/pc: Move pci_root_uid field to PcPciMachineClass
  hw/i386/pc: Call fw_cfg_add_extra_pci_roots() in pc_pci_machine_done()
  hw/i386/pc: Move CXLState to PcPciMachineState
  hw/i386/pc: Pass PCMachineState argument to acpi_setup()
  hw/i386/pc: Remove PCMachineClass::has_acpi_build field
  hw/i386/pc: Move acpi_setup() call to pc_pci_machine_done()
  hw/i386/pc: Move acpi_build_enabled to PcPciMachineState
  hw/i386/pc: Remove non-PCI code from pc_system_firmware_init()
  hw/i386/pc: Move pc_system_flash_create() to pc_pci_machine_initfn()
  hw/i386/pc: Move FW/pflash related fields to PcPciMachineState
  hw/i386/pc: Move south-bridge related fields to PcPciMachine
  hw/i386/pc: Inline gigabyte_align()
  hw/i386/pc: Inline has_reserved_memory()
  hw/i386/pc: Pass PcPciMachineState argument to CXL helpers
  hw/i386/pc: Pass PcPciMachineState argument to pc_pci_hole64_start()
  hw/i386/fw_cfg: Include missing 'qapi-types-machine.h' header
  hw/i386/fw_cfg: Define fw_cfg_build_smbios() stub
  hw/i386/fw_cfg: Inline smbios_defaults()
  hw/i386/fw_cfg: Inline smbios_legacy_mode()
  hw/i386/fw_cfg: Replace smbios_defaults() by !smbios_legacy_mode()
  hw/i386/fw_cfg: Factor fw_cfg_build_smbios_legacy() out
  hw/i386/pc: Call fw_cfg_build_smbios_legacy() in pc_machine_done()
  hw/i386/pc: Rename pc_init1() -> pc_piix_init()
  hw/i386/pc: Move ISA-only PC machine to pc_isa.c

 MAINTAINERS                  |   1 +
 hw/i386/acpi-build.h         |   3 +-
 hw/i386/fw_cfg.h             |   2 +
 include/hw/i386/pc.h         |  78 +++++++-------
 hw/i386/acpi-build.c         |  34 ++++--
 hw/i386/fw_cfg-smbios-stub.c |  19 ++++
 hw/i386/fw_cfg.c             |  35 +++---
 hw/i386/pc.c                 | 199 ++++++++++++++++++++++-------------
 hw/i386/pc_isa.c             |  33 ++++++
 hw/i386/pc_piix.c            |  91 +++++++---------
 hw/i386/pc_q35.c             |  12 ++-
 hw/i386/pc_sysfw.c           |  68 +++++-------
 hw/i386/xen/xen-hvm.c        |   3 +-
 hw/isa/piix.c                |   2 +-
 hw/pci-host/i440fx.c         |   4 +-
 hw/pci-host/q35.c            |   2 +-
 hw/i386/meson.build          |   2 +
 17 files changed, 342 insertions(+), 246 deletions(-)
 create mode 100644 hw/i386/fw_cfg-smbios-stub.c
 create mode 100644 hw/i386/pc_isa.c

-- 
2.41.0


