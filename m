Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE97A011A1
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 02:59:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864709.1275988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtQm-0006IM-N3; Sat, 04 Jan 2025 01:58:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864709.1275988; Sat, 04 Jan 2025 01:58:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtQm-0006Ct-3S; Sat, 04 Jan 2025 01:58:24 +0000
Received: by outflank-mailman (input) for mailman id 864709;
 Sat, 04 Jan 2025 01:58:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AhC6=T4=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tTtQj-0005Ay-Gq
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 01:58:21 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c7b8b6b-ca3f-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 02:58:16 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8F53E5C6009;
 Sat,  4 Jan 2025 01:57:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F0E4C4CED6;
 Sat,  4 Jan 2025 01:58:14 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB62E77188;
 Sat,  4 Jan 2025 01:58:14 +0000 (UTC)
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
X-Inumbo-ID: 5c7b8b6b-ca3f-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735955894;
	bh=1HQw4baaGqIA4Q4VIxDGGIV5uTvw8beKaHffthhNRSs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ktgD9ioY/Z9BoGCJD9pBEQT8YQHZ8NRHqKgs9CtlAAS0aZuO05QARNBA3UgfjcHVk
	 hVj7DuCm7oHa6KvGPBjl4I+9egxt7Kb2xrNdJwyMiDhorLLM8nHLBgfZe54YiJ7aZj
	 VFpxp8Cs2n+mYtjeJQmrDJvpWZ5GPftchlCt9+lrPBySRzpSdsuUm0PJ9yiTWxZ21i
	 Y8SXugn/+IduPMYM3KrnV8EGhqUpXxtU9MwUQChqkqqdjJmAhWVQPbR6s8CpztJLBY
	 Iw8k6fm7gVyU1D3pk+sitpJpIV5d8FxRQiZLp2op7/6xg1ni99EfuRuoa30jGc0Jys
	 /JW/dZyQcsjmw==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Subject: [PATCH v3 00/24] x86: introduce NS16550-compatible UART emulator
Date: Fri, 03 Jan 2025 17:58:06 -0800
Message-Id: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAK+VeGcC/x3MQQqAIBBA0avIrBtwlDC6SrSQGms2FloShHdPW
 r7F/y9kTsIZRvVC4iJZjthAnYJl93FjlLUZjDa9Jm2x3D5dGPPQjMViGJiItHMuMLTqTBzk+Y8
 TFAtzrR/CAUqbZQAAAA==
X-Change-ID: 20250103-vuart-ns8250-v3-f8e1110777fe
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, 
 Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735955892; l=9222;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=1HQw4baaGqIA4Q4VIxDGGIV5uTvw8beKaHffthhNRSs=;
 b=fkDafXWa43fpq2gRtrfNjRvLOzfCHdAEdZg4Ae1fWU5Q36l4DhEJsA4pzz2lXgYR4pH/a+Q90
 EaLxVy/2LdFALar/4HQfBr773t0jIui/Uy/5xfvDBim/oZDzPZGytyh
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

x86 port of Xen lacks vUART facility similar to Arm's vpl011 to support x86
guest OS bring up in the embedded setups.

This patch series introduces initial in-hypervisor emulator for
NS8250/NS16x50-compatible UARTs under CONFIG_VUART_NS16550.

In parallel domain creation scenario (hyperlaunch), NS16550 emulator helps
early guest firmware and OS bringup debugging, because it eliminates dependency
on the external emulator (qemu) being operational by the time domains are
created.

The emulator also allows to forward the physical console input to the x86
domain which is useful when a system has only one physical UART for early
debugging and this UART is owned by Xen.

By default, CONFIG_VUART_NS16550 enables emulation of NS16550 at I/O port
0x3f8, IRQ#4 in guest OS (legacy COM1).

Legacy COM resources can be selected at built-time and cannot be configured
per-domain yet.

The NS16550 emulator is disabled by default.

Series
======
- patches 1-17: preparation patches. That covers existing UART emulators
  cleanup, UART emulation framework, console driver cleanups and fixes.

- patches 18-24: initial NS16550 emulator. That adds the I/O port emulator
  for legacy PC COM UARTs, Kconfig option and enabling emulator for HVM
  domains globally and build-time.

Limitations
===========
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

Testing
=======

Gitlab CI
  https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/1610989357

Manual Testing
  I tested boot of HVM linux guest w/ OVMF as the virtual firmware.

  The emulator, if enabled via CONFIG_VUART_NS16550=y, will use COM1
  (0x3f8) resources by default.

  To test w/ virtual COM1, the guest kernel parameters should contain
    earlycon=uart,io,0x3f8,115200n8 console=uart,io,0x3f8,115200n8

  Xen is able to forward physical console input to the domain w/ virtual
  NS16550. To switch the console focus press Ctrl+aaa. If console= is given to
  the HVM kernel, then the user shall be able to see the login prompt on xen
  console once console focus is switched to the HVM guest.

---
Changes in v3:
- renamed emulator s/NS8250/NS16550/g
- reduced the patch series after addressing v2 feedback
- introduced driver framework for UART emulators
- unified guest OS printouts across all available UART emulators
- Link to v2: https://lore.kernel.org/xen-devel/20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com/

Changes in v2:
- dropped kmalloc/kfree aliases
- fixed ECLAIR jobs (thanks Andrew Cooper)
- addressed console forwarding on arm32 and arm64 (thanks to Luca Fancellu)
- moved NS8250 debugging stubs into its own patch
- added fix for https://gitlab.com/xen-project/xen/-/issues/184
- Link to v1: https://lore.kernel.org/r/20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com
---

Signed-off-by: Denis Mukhin <dmukhin@ford.com>

---
Denis Mukhin (24):
      xen/ctype: introduce is_console_printable()
      arm/vuart: move vpl011-related code to vpl011 emulator
      arm/vuart: add hwdom prefix to UART emulator
      xen/console: introduce console_{get,put}_domain()
      xen/console: introduce consoled_is_enabled()
      xen/domain: introduce hardware emulation flags
      xen/console: introduce framework for UART emulators
      xen/console: rename switch_serial_input() to console_switch_input()
      xen/console: rename console_rx to console_owner
      xen/console: introduce use of 'is_console' flag
      xen/domain: move get_initial_domain_id() to arch-independent header
      xen/console: introduce console_{get,set}_owner()
      xen/console: introduce hwdom_crashconsole=
      xen/console: simplify console owner switch hint
      xen/console: make console buffer size configurable
      xen/console: introduce console_write()
      xen/console: flush console ring to physical console
      xen/include: introduce resource.h
      xen/8250-uart: add missing definitions
      x86/hvm: add HVM-specific Kconfig
      x86/hvm: introduce NS16550-compatible UART emulator
      x86/hvm: enable NS16550-compatible UART emulator
      docs/misc: update console documentation
      xen/console: unify printout behavior for UART emulators

 automation/eclair_analysis/ECLAIR/deviations.ecl |   1 +
 docs/misc/console.txt                            |  50 +-
 docs/misc/xen-command-line.pandoc                |  21 +-
 tools/helpers/init-xenstore-domain.c             |   1 +
 tools/libs/light/libxl_x86.c                     |   5 +-
 tools/ocaml/libs/xc/xenctrl.ml                   |   1 +
 tools/ocaml/libs/xc/xenctrl.mli                  |   1 +
 tools/ocaml/libs/xc/xenctrl_stubs.c              |   1 +
 tools/python/xen/lowlevel/xc/xc.c                |   5 +-
 tools/tests/paging-mempool/test-paging-mempool.c |   1 +
 tools/tests/resource/test-resource.c             |   1 +
 tools/tests/tsx/test-tsx.c                       |   1 +
 xen/arch/arm/Kconfig                             |   1 +
 xen/arch/arm/dom0less-build.c                    |  11 +-
 xen/arch/arm/domain.c                            |   6 +-
 xen/arch/arm/domain_build.c                      |   7 +-
 xen/arch/arm/domctl.c                            |  11 +-
 xen/arch/arm/include/asm/domain.h                |   2 +
 xen/arch/arm/include/asm/setup.h                 |   2 -
 xen/arch/arm/include/asm/vpl011.h                |  21 +-
 xen/arch/arm/setup.c                             |   2 -
 xen/arch/arm/vpl011.c                            |  57 +-
 xen/arch/arm/vuart.c                             |  49 +-
 xen/arch/arm/vuart.h                             |   8 +-
 xen/arch/arm/xen.lds.S                           |   1 +
 xen/arch/ppc/include/asm/domain.h                |   2 +
 xen/arch/ppc/include/asm/setup.h                 |   2 -
 xen/arch/ppc/xen.lds.S                           |   1 +
 xen/arch/riscv/include/asm/domain.h              |   2 +
 xen/arch/riscv/include/asm/setup.h               |   2 -
 xen/arch/riscv/xen.lds.S                         |   1 +
 xen/arch/x86/Kconfig                             |  76 +-
 xen/arch/x86/dom0_build.c                        |   2 +
 xen/arch/x86/domain.c                            |  21 +-
 xen/arch/x86/hvm/Kconfig                         | 122 +++
 xen/arch/x86/hvm/Makefile                        |   1 +
 xen/arch/x86/hvm/hvm.c                           |  14 +-
 xen/arch/x86/hvm/vuart-ns16550.c                 | 931 +++++++++++++++++++++++
 xen/arch/x86/include/asm/domain.h                |   8 +-
 xen/arch/x86/include/asm/hvm/domain.h            |   4 +
 xen/arch/x86/include/asm/pv/shim.h               |   5 +-
 xen/arch/x86/include/asm/setup.h                 |   2 -
 xen/arch/x86/pv/shim.c                           |   7 +-
 xen/arch/x86/xen.lds.S                           |   1 +
 xen/common/device-tree/device-tree.c             |  21 +-
 xen/common/domain.c                              |  31 +-
 xen/common/domctl.c                              |  11 +-
 xen/common/kernel.c                              |   8 +
 xen/common/keyhandler.c                          |   4 +
 xen/drivers/Kconfig                              |   5 +
 xen/drivers/Makefile                             |   1 +
 xen/drivers/char/Kconfig                         |  11 +
 xen/drivers/char/console.c                       | 377 +++++----
 xen/drivers/char/consoled.c                      |  17 +-
 xen/drivers/char/ns16550.c                       |   6 +-
 xen/drivers/passthrough/arm/smmu.c               |  15 +-
 xen/drivers/virtdev-uart.c                       |  68 ++
 xen/include/Makefile                             |   1 +
 xen/include/public/arch-x86/xen.h                |  30 +-
 xen/include/public/virtdev.h                     |  64 ++
 xen/include/xen/8250-uart.h                      |  78 +-
 xen/include/xen/console.h                        |   3 +-
 xen/include/xen/consoled.h                       |  32 +-
 xen/include/xen/ctype.h                          |   7 +
 xen/include/xen/domain.h                         |   9 +
 xen/include/xen/lib.h                            |   3 +
 xen/include/xen/resource.h                       |  37 +
 xen/include/xen/virtdev-uart.h                   |  72 ++
 xen/include/xen/xen.lds.h                        |  10 +
 69 files changed, 1913 insertions(+), 479 deletions(-)
---
base-commit: 7e6edeaee38c66266a941bfa66d17eeeeb492fbe
change-id: 20250103-vuart-ns8250-v3-f8e1110777fe

Best regards,
-- 
Denis Mukhin <dmukhin@ford.com>



