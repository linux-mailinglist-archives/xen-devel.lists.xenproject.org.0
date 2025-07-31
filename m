Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15752B17691
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 21:22:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066269.1431490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhYqj-0007MD-0S; Thu, 31 Jul 2025 19:21:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066269.1431490; Thu, 31 Jul 2025 19:21:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhYqi-0007Jh-Qw; Thu, 31 Jul 2025 19:21:56 +0000
Received: by outflank-mailman (input) for mailman id 1066269;
 Thu, 31 Jul 2025 19:21:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hI6J=2M=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uhYqh-00075q-BD
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 19:21:55 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98e1e7d6-6e43-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 21:21:45 +0200 (CEST)
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
X-Inumbo-ID: 98e1e7d6-6e43-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=cbgos2aicnaebnowu5g2q5qjj4.protonmail; t=1753989702; x=1754248902;
	bh=QMuzyRitbRoVJOIAme1kkxG7s903+v6NlN6w78QfTqQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=NiJpezx4VWxFznfR+2iwxBXr4FwOR/WQ9QdAEZLgXK36N5X/bcKIyIVFJSwPwtjHa
	 n564bB0ci4614Rl79yqm4TKeegMJaF7nsfO3Moz6Q/L4M9YtPkeKGs/TZNFscunecb
	 XKAp9WtYUpbceBX0WoqgJurUR4L24LUqcNPcouX0fVJeAUKz6w/eve4qLhrMquNa7+
	 ZPzjFhfQO6KYX/8HUyQlHhfdzTSlP0kT/D2Is2tUQgXf2RSV+TwqcXagg2RDR36vYy
	 gavOKLIM3n3STnxAzEhffwAmiCCozxhw2jJsMwbwO9XUngkFIMCmF3yvLsK+VjfOwO
	 NisBRhIzZ6D8A==
Date: Thu, 31 Jul 2025 19:21:37 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v4 0/8] x86: introduce NS16550-compatible UART emulator
Message-ID: <20250731192130.3948419-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: e60b0dbbb766120180b0a18f7bf6686bada2b63a
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

x86 port of Xen lacks vUART facility similar to Arm's vpl011 to support x86
guest OS bring up in the embedded setups.

This patch series introduces initial in-hypervisor emulator for
NS8250/NS16x50-compatible UARTs under CONFIG_VUART_NS16550.

In parallel domain creation scenario (hyperlaunch), NS16550 emulator helps
early guest firmware and OS bringup debugging, because it eliminates
dependency on the external emulator (qemu) being operational by the time
domains are created.

The emulator also allows to forward the physical console input to the x86
domain which is useful when a system has only one physical UART for early
debugging and this UART is owned by Xen.

By default, CONFIG_VUART_NS16550 enables emulation of NS16550 at I/O port
0x3f8, IRQ#4 in guest OS (legacy COM1). But all legacy COM resources can be
selected at built-time (no per-domain configuration yet).

The NS16550 emulator is disabled in default x86 configuration and goes unde=
r
CONFIG_EXPERT in menuconfig.

Limitations
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Only x86;
- Only HVM domains support (build-time), PVH domains are not supported yet;
- Only legacy COM{1,2,3,4} resources via Kconfig, custom I/O ports/IRQs
  are not supported;
- Only Xen console as a backend, no inter-domain communication (similar to
  vpl011 on Arm);
- Only 8n1 emulation (8-bit data, no parity, 1 stop bit);
- No toolstack integration;
- No baud rate emulation (reports 115200 baud to the guest OS);
- No FIFO-less mode emulation;
- No RX FIFO interrupt moderation (FCR) emulation;
- No integration w/ VM snapshotting (HVM_REGISTER_SAVE_RESTORE() and
  friends);
- No ISA IRQ sharing allowed;
- No MMIO-based UART emulation.

Series
=3D=3D=3D=3D=3D=3D

  Patch 1 is reviewed and moved here as per request from the original revie=
w.

  Patch 2 introduces the new vUART framework, that is the code originally
  posted here:
    https://lore.kernel.org/xen-devel/20250624035443.344099-16-dmukhin@ford=
.com/
  Required for emulator.

  Patch 3 solves the problem of registeing custom resources from the emulat=
or
  code (NS16550 has configurable legacy PC resources), required for emulato=
r.

  Patch 4 adds missing NS16550 definitions, required for emulator.

  Patch 5 introduces the the initial emulator.
  Initialization for HVM/PVH is split across follow on changes.

  Patch 6 enables NS16550 emualator for HVM guests.

  Patch 7 enables NS16550 emulator for PVH guests.

  Patch 8 enables NS16550 emulator for PVH dom0 and enables console
  forwarding.

Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/1=
959793795
Link to branch: https://gitlab.com/xen-project/people/dmukhin/xen/-/tree/vu=
art-ns8250-v4?ref_type=3Dheads

Testing
=3D=3D=3D=3D=3D=3D=3D

  ```shell
  echo CONFIG_HAS_VUART=3Dy >> .config
  echo CONFIG_VUART_NS16550=3Dy >> .config
  echo CONFIG_VUART_NS16550_PC_COM1=3Dy >> .config
  echo CONFIG_VUART_CONSOLE_FOCUS=3Dy >> .config  # for PVH dom0
  make olddefconfig
  ```
  CONFIG_VUART_NS16550_PC_COM1 will select COM1 (0x2f8) resources by defaul=
t.

  To test w/ virtual COM1, the guest kernel parameters should contain
  something like the following:
    earlycon=3Duart,io,0x2f8,115200n8 console=3Duart,io,0x2f8,115200n8

  HVM
  ---
  Tested only boot of HVM linux guest with OVMF as the virtual firmware.
  SeaBIOS as a virtual firmware is not tested.

  PVH (dom0)
  ----------
  Xen is able to forward physical console input to the domain with virtual
  NS16550. To switch the console focus press Ctrl+aaa.
  Switch is limited on x86 to dom0 and Xen (fixes pending).
  With COM1, Linux kernel complains nobody cared about IRQ#3. Likely that's
  because guest DSDT needs patching, which is a follow on change, but not
  critical for demonstration; the code is disabled in default config.

Changes since v3:
- Reduced the blast radius of the series, thanks to reviews, individual
  aspects (like console focus) touched in v3 moved to separate threads.
- Kept the UART emulator framework since I need to redo some of emulator co=
de
  and there's more-or-less agreement on it (where to place, naming, scope).
- Applied the feedback from
    https://lore.kernel.org/xen-devel/20250624035443.344099-1-dmukhin@ford.=
com/
- Link to v3: https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1=
-0-c5d36b31d66c@ford.com/

Changes since v2:
- renamed emulator s/NS8250/NS16550/g
- reduced the patch series after addressing v2 feedback
- introduced driver framework for UART emulators
- unified guest OS printouts across all available UART emulators
- Link to v2: https://lore.kernel.org/xen-devel/20241205-vuart-ns8250-v1-0-=
e9aa923127eb@ford.com/

Changes since v1:
- dropped kmalloc/kfree aliases
- fixed ECLAIR jobs (thanks Andrew Cooper)
- addressed console forwarding on arm32 and arm64 (thanks to Luca Fancellu)
- moved NS8250 debugging stubs into its own patch
- added fix for https://gitlab.com/xen-project/xen/-/issues/184
- Link to v1: https://lore.kernel.org/r/20241126-vuart-ns8250-v1-v1-0-87b9a=
8375b7a@ford.com

Denis Mukhin (8):
  xen/domain: introduce common emulation flags
  emul/vuart: introduce framework for UART emulators
  x86/domain: allocate d->{iomem,irq}_caps before arch-specific
    initialization
  xen/8250-uart: update definitions
  emul/vuart-ns16550: introduce NS16550-compatible UART emulator (x86)
  tools/xl: enable NS16550-compatible UART emulator for HVM (x86)
  tools/xl: enable NS16550-compatible UART emulator for PVH (x86)
  emul/vuart: introduce console forwarding enforcement via vUART

 docs/man/xl.cfg.5.pod.in              |    9 +-
 tools/golang/xenlight/helpers.gen.go  |    4 +-
 tools/golang/xenlight/types.gen.go    |    3 +-
 tools/libs/light/libxl_arm.c          |   26 +-
 tools/libs/light/libxl_create.c       |    2 +-
 tools/libs/light/libxl_types.idl      |    3 +-
 tools/libs/light/libxl_x86.c          |   42 +
 tools/ocaml/libs/xc/xenctrl.ml        |    1 +
 tools/ocaml/libs/xc/xenctrl.mli       |    1 +
 tools/xl/xl_parse.c                   |    2 +-
 xen/arch/arm/xen.lds.S                |    1 +
 xen/arch/ppc/xen.lds.S                |    1 +
 xen/arch/riscv/xen.lds.S              |    1 +
 xen/arch/x86/dom0_build.c             |   26 +
 xen/arch/x86/domain.c                 |   15 +-
 xen/arch/x86/domctl.c                 |    2 +-
 xen/arch/x86/hvm/dom0_build.c         |   39 -
 xen/arch/x86/hvm/hvm.c                |   25 +
 xen/arch/x86/hvm/vioapic.c            |   10 +
 xen/arch/x86/include/asm/domain.h     |   29 +-
 xen/arch/x86/include/asm/hvm/domain.h |    4 +
 xen/arch/x86/include/asm/irq.h        |    1 +
 xen/arch/x86/xen.lds.S                |    1 +
 xen/common/Kconfig                    |    2 +
 xen/common/Makefile                   |    1 +
 xen/common/domain.c                   |   12 +-
 xen/common/emul/Kconfig               |    6 +
 xen/common/emul/Makefile              |    1 +
 xen/common/emul/vuart/Kconfig         |   59 ++
 xen/common/emul/vuart/Makefile        |    2 +
 xen/common/emul/vuart/vuart-ns16550.c | 1032 +++++++++++++++++++++++++
 xen/common/emul/vuart/vuart.c         |  116 +++
 xen/common/keyhandler.c               |    4 +
 xen/drivers/char/console.c            |    6 +-
 xen/drivers/char/ns16550.c            |    6 +-
 xen/drivers/passthrough/x86/hvm.c     |    9 +-
 xen/include/public/arch-x86/xen.h     |    4 +-
 xen/include/xen/8250-uart.h           |   50 +-
 xen/include/xen/resource.h            |    3 +
 xen/include/xen/sched.h               |    2 +
 xen/include/xen/vuart.h               |   84 ++
 xen/include/xen/xen.lds.h             |   10 +
 42 files changed, 1558 insertions(+), 99 deletions(-)
 create mode 100644 xen/common/emul/Kconfig
 create mode 100644 xen/common/emul/Makefile
 create mode 100644 xen/common/emul/vuart/Kconfig
 create mode 100644 xen/common/emul/vuart/Makefile
 create mode 100644 xen/common/emul/vuart/vuart-ns16550.c
 create mode 100644 xen/common/emul/vuart/vuart.c
 create mode 100644 xen/include/xen/vuart.h

--=20
2.34.1



