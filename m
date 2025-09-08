Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F1FB49B9E
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 23:12:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115533.1462076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvj9W-0007ZH-3c; Mon, 08 Sep 2025 21:11:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115533.1462076; Mon, 08 Sep 2025 21:11:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvj9W-0007WG-0p; Mon, 08 Sep 2025 21:11:54 +0000
Received: by outflank-mailman (input) for mailman id 1115533;
 Mon, 08 Sep 2025 21:11:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uvj9U-0007W4-Em
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 21:11:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uvj9T-000FS0-2v;
 Mon, 08 Sep 2025 21:11:51 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uvj9T-000gJu-2i;
 Mon, 08 Sep 2025 21:11:51 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From; bh=gFl0pRnNZtxdAQg1cH6a2vl8FVoMMNPhvd73iF81Bqg=; b=s5plSy
	eBY98SlAnKiuPKEhC87k3fqn6JQLp/bK8olYIb4As6Kb+yMR0ZXiemaIYUpTguPLG2rcshBeK2Ep8
	6Y7BuzFYcGZ4YrYzs4E/pzbGRpYFhHlR9ZjEnAKfLLxBpg4407fN2qxquwN8/E+ZI70M6dZvDJzV8
	qVRT1uL03FQ=;
From: dmukhin@xen.org
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	dmukhin@ford.com
Subject: [PATCH v7 00/16] x86: introduce NS16550-compatible UART emulator
Date: Mon,  8 Sep 2025 14:11:33 -0700
Message-ID: <20250908211149.279143-1-dmukhin@ford.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

x86 port of Xen lacks vUART facility similar to Arm's vpl011 to support x86
guest OS bring up in the embedded setups.

This patch series introduces initial in-hypervisor emulator for
NS8250/NS16x50-compatible UARTs under CONFIG_VUART_NS16X50.

In parallel domain creation scenario (hyperlaunch), NS16550 emulator helps
early guest firmware and OS bringup debugging, because it eliminates
dependency on the external emulator (qemu) being operational by the time
domains are created.

The emulator also allows to forward the physical console input to the x86
domain which is useful when a system has only one physical UART for early
debugging and this UART is owned by Xen.

By default, CONFIG_VUART_NS16X50 enables emulation of NS16550 at I/O port
0x3f8, IRQ#4 in guest OS (legacy COM1). Legacy COM resources can be selected
at run-time via temporary and undocumented switch 'vuart='.

CONFIG_VUART_NS16X50_DEBUG enables some extra debugging facilities useful
for NS16550 emulator development/debugging (disabled by default).

The NS16550 emulator is disabled in default x86 configuration and goes under
CONFIG_EXPERT in Kconfig.

Limitations
===========
- Only x86;
- Only legacy COM resources, custom I/O ports/IRQs are not supported;
- Only Xen console as a backend, no inter-domain communication (similar to
  vpl011 on Arm);
- Only 8n1 emulation (8-bit data, no parity, 1 stop bit);
- No toolstack integration;
- No baud rate emulation (reports 115200 baud to the guest OS);
- No FIFO-less mode emulation;
- No RX FIFO interrupt moderation (FCR) emulation;
- No integration w/ VM snapshotting (HVM_REGISTER_SAVE_RESTORE() and
  friends);
- No MMIO-based UART emulation.

Series
======

  Patch 1 introduces the new vUART framework, that is the code originally
  posted here:
    https://lore.kernel.org/xen-devel/20250624035443.344099-16-dmukhin@ford.com/
  Required for emulator.

  Patch 2 adds missing NS16550 definitions, required for emulator.

  Patch 3 introduces the basic emulator skeleton - state machine
  initialization stubs, I/O port handler stub, logging, etc.

  Patches 4-11 incrementally populate the minimal NS16550 register emulation.

  Patch 12 adds Kconfig for enabling minimal NS16550 UART (disabled by default).

  Patch 13 hooks vUART state debugging (disabled by default).

  Pathes 14-16 introduce necessary changes to enable NS16550 on dom0 (and PVH).

Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2028388344
Link to branch: https://gitlab.com/xen-project/people/dmukhin/xen/-/tree/vuart-ns8250-v7?ref_type=heads

Testing
=======

  ```shell
  echo CONFIG_EXPERT=y >> .config
  echo CONFIG_VUART_NS16X50=y >> .config
  make olddefconfig
  ```

  To test w/ virtual COM2, the guest kernel parameters should contain
  something like the following:
    earlycon=uart,io,0x2f8,115200n8 console=uart,io,0x2f8,115200n8

  Xen command line should have:
    vuart=<DOMID>,com2

  HVM
  ---
  Tested only boot of HVM linux guest with OVMF as the virtual firmware.
  SeaBIOS as a virtual firmware is not tested.

  PVH (dom0)
  ----------
  Xen is able to forward physical console input to the domain with virtual
  NS16550. To switch the console focus press Ctrl+aaa.
  Console switch is limited on x86 to dom0 and Xen (fixes pending).

Changes since v6:
- Addressed feedback from v6, mainly DLL, THRE interrupt reason handling and
  fixups in vuart.c and ns16x50.c. Also plumbed new temporary swicth 'vuart='
  for ease of testing (CI unit test jobs are pending).
- Link to v6:  https://lore.kernel.org/xen-devel/20250905232715.440758-1-dmukhin@ford.com/

Changes since v5:
- Split THR/RBR into two separate patches.
- Addressed feedback from v5.
- Link to v5: https://lore.kernel.org/xen-devel/20250828235409.2835815-1-dmukhin@ford.com/

Changes since v4:
- Split the series to make it simpler to review.
- Addressed feedback from v4.
- Dropped xl changes, which I will submit separately.
- Link to v4: https://lore.kernel.org/xen-devel/20250731192130.3948419-1-dmukhin@ford.com/

Changes since v3:
- Reduced the blast radius of the series, thanks to reviews, individual
  aspects (like console focus) touched in v3 moved to separate threads.
- Kept the UART emulator framework since I need to redo some of emulator code
  and there's more-or-less agreement on it (where to place, naming, scope).
- Applied the feedback from
    https://lore.kernel.org/xen-devel/20250624035443.344099-1-dmukhin@ford.com/
- Link to v3: https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com/

Changes since v2:
- renamed emulator s/NS8250/NS16550/g
- reduced the patch series after addressing v2 feedback
- introduced driver framework for UART emulators
- unified guest OS printouts across all available UART emulators
- Link to v2: https://lore.kernel.org/xen-devel/20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com/

Changes since v1:
- dropped kmalloc/kfree aliases
- fixed ECLAIR jobs (thanks Andrew Cooper)
- addressed console forwarding on arm32 and arm64 (thanks to Luca Fancellu)
- moved NS8250 debugging stubs into its own patch
- added fix for https://gitlab.com/xen-project/xen/-/issues/184
- Link to v1: https://lore.kernel.org/r/20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com

Denis Mukhin (16):
  emul/vuart: introduce framework for UART emulators
  xen/8250-uart: update definitions
  emul/ns16x50: implement emulator stub
  emul/ns16x50: implement DLL/DLM registers
  emul/ns16x50: implement SCR register
  emul/ns16x50: implement IER/IIR registers
  emul/ns16x50: implement LCR/LSR registers
  emul/ns16x50: implement MCR/MSR registers
  emul/ns16x50: implement RBR register
  emul/ns16x50: implement THR register
  emul/ns16x50: implement FCR register (write-only)
  emul/ns16550: implement dump_state() hook
  emul/ns16x50: add Kconfig options
  x86/domain: enable per-domain I/O port bitmaps
  xen/domain: allocate d->irq_caps before arch-specific initialization
  emul/ns16x50: implement IRQ emulation via vIOAPIC

 xen/arch/arm/xen.lds.S                   |   1 +
 xen/arch/ppc/xen.lds.S                   |   1 +
 xen/arch/riscv/xen.lds.S                 |   1 +
 xen/arch/x86/Makefile                    |   1 +
 xen/arch/x86/dom0_build.c                | 112 +--
 xen/arch/x86/hvm/dom0_build.c            |   7 +
 xen/arch/x86/hvm/hvm.c                   | 110 ++-
 xen/arch/x86/hvm/nestedhvm.c             |   8 +-
 xen/arch/x86/hvm/quirks.c                |   3 -
 xen/arch/x86/hvm/svm/nestedsvm.c         |   2 +-
 xen/arch/x86/hvm/vioapic.c               |  10 +
 xen/arch/x86/hvm/vmx/vvmx.c              |   4 +-
 xen/arch/x86/include/asm/hvm/nestedhvm.h |   3 +-
 xen/arch/x86/include/asm/hvm/support.h   |   2 -
 xen/arch/x86/include/asm/iocap.h         |   2 +
 xen/arch/x86/include/asm/irq.h           |   8 +
 xen/arch/x86/ioport.c                    | 163 ++++
 xen/arch/x86/irq.c                       |   8 +
 xen/arch/x86/pv/dom0_build.c             |   7 +
 xen/arch/x86/xen.lds.S                   |   1 +
 xen/common/Kconfig                       |   2 +
 xen/common/Makefile                      |   1 +
 xen/common/domain.c                      |   8 +-
 xen/common/emul/Kconfig                  |   6 +
 xen/common/emul/Makefile                 |   1 +
 xen/common/emul/vuart/Kconfig            |  25 +
 xen/common/emul/vuart/Makefile           |   2 +
 xen/common/emul/vuart/ns16x50.c          | 970 +++++++++++++++++++++++
 xen/common/emul/vuart/vuart.c            | 165 ++++
 xen/common/keyhandler.c                  |   3 +
 xen/drivers/char/console.c               |   6 +-
 xen/drivers/char/ns16550.c               |  16 +-
 xen/drivers/passthrough/x86/hvm.c        |  11 +-
 xen/include/xen/8250-uart.h              |  36 +-
 xen/include/xen/sched.h                  |   4 +
 xen/include/xen/serial.h                 |   3 +
 xen/include/xen/vuart.h                  | 115 +++
 xen/include/xen/xen.lds.h                |  10 +
 38 files changed, 1674 insertions(+), 164 deletions(-)
 create mode 100644 xen/arch/x86/ioport.c
 create mode 100644 xen/common/emul/Kconfig
 create mode 100644 xen/common/emul/Makefile
 create mode 100644 xen/common/emul/vuart/Kconfig
 create mode 100644 xen/common/emul/vuart/Makefile
 create mode 100644 xen/common/emul/vuart/ns16x50.c
 create mode 100644 xen/common/emul/vuart/vuart.c
 create mode 100644 xen/include/xen/vuart.h

-- 
2.51.0


