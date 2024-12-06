Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0C79E6652
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 05:42:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849410.1264026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQ9x-0004qP-1t; Fri, 06 Dec 2024 04:41:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849410.1264026; Fri, 06 Dec 2024 04:41:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQ9w-0004jY-So; Fri, 06 Dec 2024 04:41:44 +0000
Received: by outflank-mailman (input) for mailman id 849410;
 Fri, 06 Dec 2024 04:41:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5aHD=S7=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tJQ9u-0004Ka-LG
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 04:41:42 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 617d9a09-b38c-11ef-a0d5-8be0dac302b0;
 Fri, 06 Dec 2024 05:41:39 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E20305C0EDA;
 Fri,  6 Dec 2024 04:40:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 60592C4CED1;
 Fri,  6 Dec 2024 04:41:37 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 4A145E7716F;
 Fri,  6 Dec 2024 04:41:37 +0000 (UTC)
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
X-Inumbo-ID: 617d9a09-b38c-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733460097;
	bh=9q7mVixn7WzU3hMQhPlch4KRDD8wW06V5dyXPxftnZY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=HSZKSdXeeElirLWxydyj60En5Xpa2uuBKbiWdiLm3k4sgIBdGPt04BWNxuyYhMwjo
	 lKjBbVsVC+fpOK26zpQ1VLdXY80Ubsn2UyvjamQR4VatuXq3IW2cewqSlNIrzVojgI
	 wJGnE4HnpuUBnP19lTqs4PnH7IMMEQ0pSnEjpf07Nd0Tm26Cb1r4BCMRoWP7XxC+9O
	 7accDtFZbyuK5kELp7prgSVCKQ+gDQKq5B2aAgFWb8Ohz1FOKpdSUUDxBYNvMoLQyS
	 Y6NZZTYX5J3eHS+xoHzCCiNQ4Nl4eIY9cIda9OE3a6d73fA9XiQH88MAa3VvtMH6lJ
	 eEkRLdTivPiCA==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Subject: [PATCH v2 00/35] Introduce NS8250 UART emulator
Date: Thu, 05 Dec 2024 20:41:30 -0800
Message-Id: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHqAUmcC/x3MMQqAMAxA0atIZgtpSFG8ijhojZqlSqtFEO9uc
 XzD/w8kiSoJuuqBKFmT7qHA1hX4bQyrGJ2LgZDYEjqTrzGeJqSWHBp2LTeTR7aMUJIjyqL3v+s
 hEwzv+wHHGfG5YgAAAA==
X-Change-ID: 20241205-vuart-ns8250-45847bc04140
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Denis Mukhin <dmukhin@ford.com>, 
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733460094; l=7806;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=9q7mVixn7WzU3hMQhPlch4KRDD8wW06V5dyXPxftnZY=;
 b=wu87/WMMcq7kCGsWrNsCbOgz6lVO553WIrzg76dgaUMYmqQj4Bqs4n0nP7xVOkHdu46kASzcf
 mHjyChvpabRAC05U5Ldjv9zsXyZFwIJPV7ZCOE0r5qYf0IFrxFFEE/c
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

The patch series introduces initial in-hypervisor emulator for
NS8250/NS16x50-compatible UARTs under CONFIG_HAS_VUART_NS8250.

In parallel domain creation scenario (hyperlaunch), NS8520 emulator helps
early guest OS bringup debugging, because it eliminates dependency on the
external emulator being operational by the time domains are created. Also,
there's no early console facility similar to vpl011 to support x86 guest OS
bring up.

The NS8250 emulator is disabled by default.

Series
======
- patches 1-11: preparation fixes for xen console and NS8250 emulator.

- patches 12-27: xen console driver cleanup, fixes and preparation for enabling
  physical serial console focus assignment to the guest VM w/ virtual NS8250.

- patches 28-35: initial NS8250 emulator. That adds the I/O port emulator
  for legacy PC COM UARTs, Kconfig option, enabling emulator and libxl
  plumbing.

Limitations
===========
- Only x86;
- Only Linux guest tested so far;
- Only legacy COM{1,2,3,4} resources, no customization;
- Only Xen console as a backend, no inter-domain communication (similar to
  vpl011 on Arm);
- Only 8-bit characters;
- Baud rate is not emulated;
- FIFO-less mode is not emulated properly;
- RX FIFO interrupt moderation (FCR) is not emulated properly, TL16C750
  has special FCR handling;
- No integration w/ VM snapshotting (HVM_REGISTER_SAVE_RESTORE() and
  friends);
- Assumes no ISA-device IRQ sharing;
- MMIO-based UART is not supported.

Testing
=======

Gitlab CI:
  https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/1576164352

I tested boot of HVM linux guest w/ OVMF as the virtual firmware.

The emulator, if enabled via CONFIG_HAS_VUART_NS8250=y, will use COM1 (0x3f8)
resources by default.

To test w/ virtual COM1, the guest kernel parameters should contain
  earlycon=uart,io,0x3f8,115200n8 console=uart,io,0x3f8,115200n8

Xen is able to forward physical console input to the domain w/ virtual NS8250.
To switch the console focus press Ctrl+aaa. If console= is given to the HVM
kernel, then the user shall be able to see the login prompt on xen console once
console focus is switched to the HVM guest.

Luca Fancellu helped big time w/ verifying the patch series on arm{32,64} w/
FVP Linux as a guest OS.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes in v2:
- dropped kmalloc/kfree aliases
- fixed ECLAIR jobs (thanks Andrew Cooper)
- addressed console forwarding on arm32 and arm64 (thanks to Luca Fancellu)
- moved NS8250 debugging stubs into its own patch
- added fix for https://gitlab.com/xen-project/xen/-/issues/184
- Link to v1: https://lore.kernel.org/r/20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com

---
Denis Mukhin (35):
      xen: introduce resource.h
      xen/irq: introduce NO_IRQ
      xen/ctype: introduce isconsole()
      arm/vuart: use guest_printk()
      arm/vuart: make domain_has_vuart() public
      riscv/domain: introduce domain_has_vuart()
      ppc/domain: introduce domain_has_vuart()
      x86/domain: introduce domain_has_vuart()
      x86/domain: print emulation_flags
      xen/domain: add get_initial_domain_id()
      xen/domain: enable max_init_domid for all architectures
      xen/console: move vpl011-related code to vpl011 emulator
      xen/console: rename console_input_domain
      xen/console: rename switch_serial_input() to console_find_owner()
      xen/console: rename console_rx to console_owner
      xen/console: introduce printk_common()
      xen/console: introduce consoled_is_enabled()
      xen/console: introduce use of 'is_console' flag
      xen/console: introduce console_set_owner()
      xen/console: introduce console_owner_domid()
      xen/console: introduce console_init_owner()
      xen/console: introduce handle_keypress_in_domain()
      xen/console: introduce console_write()
      xen/console: introduce hwdom_crashconsole=
      xen/console: simplify console owner switch hint
      xen/console: make console buffer size configurable
      xen/console: flush console ring to physical console
      xen/8250-uart: add missing definitions
      x86/hvm: add HVM-specific Kconfig
      x86/hvm: add helpers for raising guest IRQs
      x86/hvm: introduce NS8250 UART emulator
      x86/hvm: add debugging facility to NS8250 UART emulator
      x86/domain: implement domain_has_vuart()
      xen/console: enable console owners w/ emulated NS8250
      docs/misc: update console documentation

 automation/eclair_analysis/ECLAIR/deviations.ecl |    2 +-
 docs/misc/console.txt                            |   50 +-
 docs/misc/xen-command-line.pandoc                |    5 +
 tools/libs/light/libxl_x86.c                     |    6 +-
 tools/ocaml/libs/xc/xenctrl.ml                   |    1 +
 tools/ocaml/libs/xc/xenctrl.mli                  |    1 +
 tools/python/xen/lowlevel/xc/xc.c                |    4 +-
 xen/arch/arm/dom0less-build.c                    |    4 +-
 xen/arch/arm/domain.c                            |   20 +-
 xen/arch/arm/domctl.c                            |    5 +-
 xen/arch/arm/include/asm/domain.h                |    9 +
 xen/arch/arm/include/asm/setup.h                 |    2 -
 xen/arch/arm/include/asm/vpl011.h                |    2 +-
 xen/arch/arm/setup.c                             |    2 -
 xen/arch/arm/vpl011.c                            |   19 +-
 xen/arch/arm/vuart.c                             |    7 +-
 xen/arch/ppc/include/asm/domain.h                |    2 +
 xen/arch/ppc/include/asm/setup.h                 |    2 -
 xen/arch/riscv/include/asm/domain.h              |    2 +
 xen/arch/riscv/include/asm/setup.h               |    2 -
 xen/arch/x86/Kconfig                             |   66 +-
 xen/arch/x86/dom0_build.c                        |    2 +
 xen/arch/x86/domain.c                            |   16 +-
 xen/arch/x86/hvm/Kconfig                         |   77 ++
 xen/arch/x86/hvm/Makefile                        |    1 +
 xen/arch/x86/hvm/hvm.c                           |   16 +-
 xen/arch/x86/hvm/irq.c                           |   24 +
 xen/arch/x86/hvm/vuart_ns8250.c                  | 1008 ++++++++++++++++++++++
 xen/arch/x86/include/asm/domain.h                |    8 +-
 xen/arch/x86/include/asm/hvm/domain.h            |    5 +
 xen/arch/x86/include/asm/hvm/irq.h               |    3 +
 xen/arch/x86/include/asm/hvm/vuart_ns8250.h      |   75 ++
 xen/arch/x86/include/asm/pv/shim.h               |    4 +-
 xen/arch/x86/include/asm/setup.h                 |    2 -
 xen/arch/x86/pv/shim.c                           |    6 +-
 xen/common/device-tree/device-tree.c             |   21 +-
 xen/common/domain.c                              |   35 +-
 xen/drivers/char/Kconfig                         |   23 +
 xen/drivers/char/console.c                       |  394 +++++----
 xen/drivers/char/consoled.c                      |   18 +-
 xen/drivers/passthrough/arm/smmu.c               |   15 +-
 xen/include/public/arch-x86/xen.h                |   14 +-
 xen/include/xen/8250-uart.h                      |   81 +-
 xen/include/xen/console.h                        |    4 +-
 xen/include/xen/consoled.h                       |   35 +-
 xen/include/xen/ctype.h                          |    3 +
 xen/include/xen/domain.h                         |    5 +
 xen/include/xen/irq.h                            |    1 +
 xen/include/xen/lib.h                            |    3 +
 xen/include/xen/resource.h                       |   40 +
 50 files changed, 1799 insertions(+), 353 deletions(-)
---
base-commit: dc8e1b33a525d31989c0d1ffe6ae7794484e1d99
change-id: 20241205-vuart-ns8250-45847bc04140

Best regards,
-- 
Denis Mukhin <dmukhin@ford.com>



