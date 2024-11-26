Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3589D9F92
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 00:23:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844049.1259621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG4tn-0000mL-9K; Tue, 26 Nov 2024 23:23:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844049.1259621; Tue, 26 Nov 2024 23:23:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG4tn-0000g8-2f; Tue, 26 Nov 2024 23:23:15 +0000
Received: by outflank-mailman (input) for mailman id 844049;
 Tue, 26 Nov 2024 23:22:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rasV=SV=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tG4sd-0000At-CO
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 23:22:03 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a43e29d-ac4d-11ef-99a3-01e77a169b0f;
 Wed, 27 Nov 2024 00:21:56 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 953F4A401CE;
 Tue, 26 Nov 2024 23:20:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 237A6C4CED0;
 Tue, 26 Nov 2024 23:21:55 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 0AAF3D66B89;
 Tue, 26 Nov 2024 23:21:55 +0000 (UTC)
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
X-Inumbo-ID: 3a43e29d-ac4d-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE0Ny43NS4xOTMuOTEiLCJoZWxvIjoibnljLnNvdXJjZS5rZXJuZWwub3JnIn0=
X-Custom-Transaction: eyJpZCI6IjNhNDNlMjlkLWFjNGQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjYzMzE3LjA3NjY1MSwic2VuZGVyIjoiZGV2bnVsbCtkbXVraGluLmZvcmQuY29tQGtlcm5lbC5vcmciLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732663315;
	bh=1Tgv8W8Bg/t7u7numSd+mYVQFp79uUbY0gFJ5smR4Lk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=MxC05qFAfdrGXMJupF6DpUCwnsBeGG/dWqvYNpoWMqdbWB7XIPJ/0BsaxJDGiT9oj
	 rKeW35vU4ZCTkwi5OvYSvofXfkDjoOosDWNlqa9tpAcEl1dv/vezZjs+HZ9bdfoqyD
	 tjmh7Ao/As3QGqRA70HjNEx0M8r8wjx4gnspTZL6s3qr3VGTmQyekwG5XvmQgNXME1
	 Ss9D3Nkcyp7W0D1EP1ixpAbnSrHUOEGPw0hU989G1oSExF+dCpiQoeMHi6IxeWGIqB
	 kzb4PXANFrypj2mK4X7XbvMhofmlj8F3PqPgG7qtV7JGuFJHnBFCDo+hkb5yICTfN/
	 GJjcv3acu7YlQ==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Subject: [PATCH 00/36] Introduce NS8250 UART emulator
Date: Tue, 26 Nov 2024 15:21:50 -0800
Message-Id: <20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA5YRmcC/x3MPQqAMAxA4atIZgM2NPhzFXGoGjVLlVaLIN7d4
 vgN7z0QJahE6IoHgiSNuvsMUxYwbc6vgjpnA1VkjSHGdLlwoo8NcYXJIDs7cj05plYgV0eQRe/
 /2A/v+wF3B1M6YQAAAA==
X-Change-ID: 20241125-vuart-ns8250-v1-5a4b57ca529e
To: Jan Beulich <jbeulich@suse.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
 Bertrand Marquis <bertrand.marquis@arm.com>, 
 Michal Orzel <michal.orzel@amd.com>, Rahul Singh <rahul.singh@arm.com>, 
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Bob Eshleman <bobbyeshleman@gmail.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
 Shawn Anastasio <sanastasio@raptorengineering.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, 
 Christian Lindig <christian.lindig@citrix.com>, 
 David Scott <dave@recoil.org>, 
 =?utf-8?q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732663312; l=7092;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=1Tgv8W8Bg/t7u7numSd+mYVQFp79uUbY0gFJ5smR4Lk=;
 b=TMajczvcEwZsVEZSpSBygegHOC6glKacY9NMJVzDrOE6mZAG5Nlxrk9ABAf2L7b1iwKOE+wnP
 f9KyyxjAaIWCU4GkH6hcub7e2wRit1jrLBqZb0DdWFhI1kC1++YP8wr
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
- patches 1-2: some miscellaneous random fixes, added into the series
  because I stepped into those while debugging NS8250 emulator.

- patches 3-14: preparation fixes for xen console and NS8250 emulator.

- patches 15-29: xen console driver cleanup and preparation for enabling
  physical serial console focus assignment to the guest VM w/ virtual NS8250.

- patches 30-36: initial NS8250 emulator. That adds the I/O port emulator
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

I tested boot of HVM linux guest w/ OVMF as the virtual firmware.

The emulator, if enabled via CONFIG_HAS_VUART_NS8250=y, will use COM1 (0x3f8)
resources by default.

To test w/ virtual COM1, the guest kernel parameters should contain
  earlycon=uart,io,0x3f8,115200n8 console=uart,io,0x3f8,115200n8

Xen is able to forward physical console input to the domain w/ virtual NS8250.
To switch the console focus press Ctrl+aaa. If console= is given to the HVM
kernel, then the user shall be able to see the login prompt on xen console once
console focus is switched to the HVM guest.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Denis Mukhin (36):
      x86/setup: fix typo in acpi=off description
      xsm/flask: missing breaks, MISRA rule 16.4
      xen: introduce resource.h
      xen/irq: introduce NO_IRQ
      xen/xmalloc: add kmalloc() and kfree() aliases
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
      xen/8250-uart: add missing definitions
      x86/hvm: add HVM-specific Kconfig
      x86/hvm: add helpers for raising guest IRQs
      x86/hvm: introduce NS8250 UART emulator
      x86/domain: implement domain_has_vuart()
      xen/console: enable console owners w/ emulated NS8250
      docs/misc: update console documentation

 docs/misc/console.txt                       |   48 +-
 docs/misc/xen-command-line.pandoc           |    5 +
 tools/libs/light/libxl_x86.c                |    6 +-
 tools/ocaml/libs/xc/xenctrl.ml              |    1 +
 tools/ocaml/libs/xc/xenctrl.mli             |    1 +
 tools/python/xen/lowlevel/xc/xc.c           |    4 +-
 xen/arch/arm/include/asm/domain.h           |    9 +
 xen/arch/arm/include/asm/setup.h            |    2 -
 xen/arch/arm/include/asm/vpl011.h           |    2 +-
 xen/arch/arm/setup.c                        |    2 -
 xen/arch/arm/vpl011.c                       |   21 +-
 xen/arch/arm/vuart.c                        |    9 +-
 xen/arch/ppc/include/asm/domain.h           |    2 +
 xen/arch/ppc/include/asm/setup.h            |    2 -
 xen/arch/riscv/include/asm/domain.h         |    2 +
 xen/arch/riscv/include/asm/setup.h          |    2 -
 xen/arch/x86/Kconfig                        |   66 +-
 xen/arch/x86/dom0_build.c                   |    2 +
 xen/arch/x86/domain.c                       |   16 +-
 xen/arch/x86/hvm/Kconfig                    |   77 ++
 xen/arch/x86/hvm/Makefile                   |    1 +
 xen/arch/x86/hvm/hvm.c                      |   10 +-
 xen/arch/x86/hvm/irq.c                      |   24 +
 xen/arch/x86/hvm/vuart_ns8250.c             | 1012 +++++++++++++++++++++++++++
 xen/arch/x86/include/asm/domain.h           |    8 +-
 xen/arch/x86/include/asm/hvm/domain.h       |    5 +
 xen/arch/x86/include/asm/hvm/irq.h          |    3 +
 xen/arch/x86/include/asm/hvm/vuart_ns8250.h |   75 ++
 xen/arch/x86/include/asm/pv/shim.h          |    4 +-
 xen/arch/x86/include/asm/setup.h            |    3 +-
 xen/arch/x86/pv/shim.c                      |    6 +-
 xen/arch/x86/setup.c                        |    2 +-
 xen/common/device-tree/device-tree.c        |   21 +-
 xen/common/domain.c                         |   41 +-
 xen/drivers/char/Kconfig                    |   23 +
 xen/drivers/char/console.c                  |  379 +++++-----
 xen/drivers/char/consoled.c                 |   18 +-
 xen/drivers/passthrough/arm/smmu.c          |   19 +-
 xen/include/public/arch-x86/xen.h           |   14 +-
 xen/include/xen/8250-uart.h                 |   82 ++-
 xen/include/xen/console.h                   |    4 +-
 xen/include/xen/consoled.h                  |   35 +-
 xen/include/xen/ctype.h                     |    3 +
 xen/include/xen/domain.h                    |    4 +
 xen/include/xen/irq.h                       |    1 +
 xen/include/xen/lib.h                       |    3 +
 xen/include/xen/resource.h                  |   40 ++
 xen/include/xen/xmalloc.h                   |    5 +
 xen/xsm/flask/hooks.c                       |    4 +
 49 files changed, 1778 insertions(+), 350 deletions(-)
---
base-commit: c8e3e39085bf97d1afb775d54884d239387e32cd
change-id: 20241125-vuart-ns8250-v1-5a4b57ca529e

Best regards,
-- 
Denis Mukhin <dmukhin@ford.com>



