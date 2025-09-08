Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E7CB487BF
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 11:04:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1114859.1461663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvXnW-000715-Ds; Mon, 08 Sep 2025 09:04:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1114859.1461663; Mon, 08 Sep 2025 09:04:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvXnW-0006zI-AZ; Mon, 08 Sep 2025 09:04:26 +0000
Received: by outflank-mailman (input) for mailman id 1114859;
 Mon, 08 Sep 2025 09:04:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/zpM=3T=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uvXnU-0006zC-Sh
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 09:04:24 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfeff4ea-8c92-11f0-9d13-b5c5bf9af7f9;
 Mon, 08 Sep 2025 11:04:23 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-336b071e806so36069761fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Sep 2025 02:04:23 -0700 (PDT)
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
X-Inumbo-ID: cfeff4ea-8c92-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757322263; x=1757927063; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3H+NDhuBzFU7/0BQZrmGJSHfPYagzaqwE55SgUvWRTw=;
        b=D030oT/yViWgCOr1TTDui7Ibwwrwgmiu1IFDO+BrH95P5QiuR0jlHc2eng9r4Wrv7r
         Zx6rH1/GLJhE+EFg/Gx8JUvQyVw1WGCZWFZvUDMChz0vhG7zychTUIiWylLnTcnRKfoe
         9rYv0sf5fbWh4odK5ULFROC4rB/Kt26CQw46aJK8/pzenjXPlDbdgtBgVItH4Mm3Lyyp
         kBPVuVefZjZ5y+Qi9wf5K9/KFouqIgIe9ujy1x6Fpvx3rAF+HCEAA6/6HqsvcVi8Lr72
         CERrGKabAEWTkPT9acA5xIZwcFVbp2u2YMp+N/70ZRSCWfcrg41f3Km0VHCstm8sCNSw
         LL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757322263; x=1757927063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3H+NDhuBzFU7/0BQZrmGJSHfPYagzaqwE55SgUvWRTw=;
        b=Y/QFIwpi6F8RCRKsaScCLJqO0c6LyQdTiOB+3qrf7KR5sviGOUgj7aYjuKsWU+F0Xc
         VSyNt/NVHEDuXyG7rTjxUEe+rq4hZsAUcaj2YBwEZmVSBeVwLhkp7kBBIE4VVkQ5HxiS
         qHlqtZKRGPv9fxOlzCCqA7WmDuZRYgaNTdYJJWoXuHbxwwpwY4y/xOfdYrbxNmN/ENDr
         +QPRlSuHfQjpcys3nCv1NmaygB9as5wWp39/0owg8SqkrfcMcQWXo+EfaFVS/p0coQb8
         EXMEGHIP9k0AKn1ybjWC1TSNiJ+n4nPObA1jnBEd1o4O2OqQh4TZJ9zn2wfZGzoxiK0O
         PVlA==
X-Forwarded-Encrypted: i=1; AJvYcCWq90G9SoiJ6VTO440Q2VJL+myb2OgodojoNKgO8PbkLbyXQdXlxU40G7bUKbK6P1SnTPjmcWJK+Q8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyFKqyJHTLGhkcm8A5Tvz5AvFMt6wo5EbFvbpPbvXvz0uI7jGlj
	r7DTifNh5SgaLYRc65qAGLlmMzlFIFYsOje2DdN6Xn4RQHX3L8/AEzJObkvrbyhL4BGwgelz0EA
	sYk3FqyzSdSSeFDvTjPcPpaJDUfUUURs=
X-Gm-Gg: ASbGncs09ADijldGy7OkGl6nq2PN7oxl1DvXoEJyfXPiiZQE75/7kgNDSYXLMUq86Ls
	8x5oVng9YIk1whDABAuGFeKeUuvfQQeGxpYAySqx0T859LeFVwaZONPEskLMtxDxxMhn+kJEU+U
	ZiRoEkMPn5XRePMEaA7P7KqiGmdyMWNho/loF/05Qwb88scDC2xJhHwQ90vn6DGXf7aRnBp/tvc
	ioh2Q==
X-Google-Smtp-Source: AGHT+IGvNiFAE25gOTt4VJbBRIxBdBf3jcVvF8AQIzxMcgOhwIzmR4+M/t5xlE7CZH5GseplTGCMUQfdYQPfIlAX+FE=
X-Received: by 2002:a05:651c:400d:b0:338:2ef:649b with SMTP id
 38308e7fff4ca-33b553ae8c8mr14965711fa.27.1757322262299; Mon, 08 Sep 2025
 02:04:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250905232715.440758-1-dmukhin@ford.com> <alpine.DEB.2.22.394.2509051900200.1405870@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2509051900200.1405870@ubuntu-linux-20-04-desktop>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 8 Sep 2025 12:04:10 +0300
X-Gm-Features: Ac12FXxkizsrO_ZopBmBLCyD-WlOSVLeyqe3PlqMM4Zxdj8bhhg91L1jgdKhxG4
Message-ID: <CAGeoDV87bTaDiG=5xAvSGZXKTJ0zSRUz7Nq2JSenBqu8DnLe2A@mail.gmail.com>
Subject: Re: [PATCH v6 00/15] x86: introduce NS16550-compatible UART emulator
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: oleksii.kurochko@gmail.com, xen-devel@lists.xenproject.org, 
	andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, 
	julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, dmukhin@ford.com, 
	dmukhin@xen.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Denis and Stefano

I=E2=80=99d like to acknowledge the significant effort that went into this =
patch
series -- it=E2=80=99s clear that a lot of work has been invested.

On Sat, Sep 6, 2025 at 5:02=E2=80=AFAM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> Oleksii and all,
>
> I would like to consider patches 1-12 of this patch series for 4.21,
> pending the few minor comments I made addressed.

Although I am neither a maintainer nor an official reviewer for this
project, I have looked over some of the first patches in the series. In my
opinion, the series is not yet ready for merging.

Even if my review is set aside, the changes are largely x86-specific and
produce the most impact on this architecture. I believe that before
merging, one of the x86 maintainers (or at least a trusted reviewer for
x86, if available) should carefully review these patches.

>
>
> On Fri, 5 Sep 2025, dmukhin@xen.org wrote:
> > x86 port of Xen lacks vUART facility similar to Arm's vpl011 to support=
 x86
> > guest OS bring up in the embedded setups.
> >
> > This patch series introduces initial in-hypervisor emulator for
> > NS8250/NS16x50-compatible UARTs under CONFIG_VUART_NS16X50.
> >
> > In parallel domain creation scenario (hyperlaunch), NS16550 emulator he=
lps
> > early guest firmware and OS bringup debugging, because it eliminates
> > dependency on the external emulator (qemu) being operational by the tim=
e
> > domains are created.
> >
> > The emulator also allows to forward the physical console input to the x=
86
> > domain which is useful when a system has only one physical UART for ear=
ly
> > debugging and this UART is owned by Xen.
> >
> > By default, CONFIG_VUART_NS16X50 enables emulation of NS16550 at I/O po=
rt
> > 0x2f8, IRQ#3 in guest OS (legacy COM2). Legacy COM resources cannot be
> > selected at built-time or via per-domain xl configuration in this initi=
al
> > submission.
> >
> > CONFIG_VUART_NS16X50_DEBUG enables some extra debugging facilities usef=
ul
> > for NS16550 emulator development/debugging (disabled by default).
> >
> > The NS16550 emulator is disabled in default x86 configuration and goes =
under
> > CONFIG_EXPERT in Kconfig.
> >
> > Limitations
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > - Only x86;
> > - Only legacy COM2 resources, custom I/O ports/IRQs are not supported;
> > - Only Xen console as a backend, no inter-domain communication (similar=
 to
> >   vpl011 on Arm);
> > - Only 8n1 emulation (8-bit data, no parity, 1 stop bit);
> > - No toolstack integration;
> > - No baud rate emulation (reports 115200 baud to the guest OS);
> > - No FIFO-less mode emulation;
> > - No RX FIFO interrupt moderation (FCR) emulation;
> > - No integration w/ VM snapshotting (HVM_REGISTER_SAVE_RESTORE() and
> >   friends);
> > - No MMIO-based UART emulation.
> >
> > Series
> > =3D=3D=3D=3D=3D=3D
> >
> >   Patch 1 introduces the new vUART framework, that is the code original=
ly
> >   posted here:
> >     https://lore.kernel.org/xen-devel/20250624035443.344099-16-dmukhin@=
ford.com/
> >   Required for emulator.
> >
> >   Patch 2 adds missing NS16550 definitions, required for emulator.
> >
> >   Patch 3 introduces the basic emulator skeleton - state machine
> >   initialization stubs, I/O port handler stub, logging, etc.
> >
> >   Patches 4-11 incrementally populate the minimal NS16550 register emul=
ation.
> >
> >   Patch 12 hooks vUART state debugging (disabled by default).
> >
> >   Pathes 13-15 introduce necessary changes to enable NS16550 on dom0 (a=
nd PVH).
> >
> > Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelin=
es/2024756493
> > Link to branch: https://gitlab.com/xen-project/people/dmukhin/xen/-/tre=
e/vuart-ns8250-v6?ref_type=3Dheads
> >
> > Testing
> > =3D=3D=3D=3D=3D=3D=3D
> >
> >   ```shell
> >   echo CONFIG_EXPERT=3Dy >> .config
> >   echo CONFIG_VUART_NS16X50=3Dy >> .config
> >   make olddefconfig
> >   ```
> >   COM2 (0x2f8) resources are used by default.
> >
> >   To test w/ virtual COM2, the guest kernel parameters should contain
> >   something like the following:
> >     earlycon=3Duart,io,0x2f8,115200n8 console=3Duart,io,0x2f8,115200n8
> >
> >   HVM
> >   ---
> >   Tested only boot of HVM linux guest with OVMF as the virtual firmware=
.
> >   SeaBIOS as a virtual firmware is not tested.
> >
> >   PVH (dom0)
> >   ----------
> >   Xen is able to forward physical console input to the domain with virt=
ual
> >   NS16550. To switch the console focus press Ctrl+aaa.
> >   Console switch is limited on x86 to dom0 and Xen (fixes pending).
> >
> > Changes since v5:
> > - Split THR/RBR into two separate patches.
> > - Addressed feedback from v5.
> > - Link to v5: https://lore.kernel.org/xen-devel/20250828235409.2835815-=
1-dmukhin@ford.com/
> >
> > Changes since v4:
> > - Split the series to make it simpler to review.
> > - Addressed feedback from v4.
> > - Dropped xl changes, which I will submit separately.
> > - Link to v4: https://lore.kernel.org/xen-devel/20250731192130.3948419-=
1-dmukhin@ford.com/
> >
> > Changes since v3:
> > - Reduced the blast radius of the series, thanks to reviews, individual
> >   aspects (like console focus) touched in v3 moved to separate threads.
> > - Kept the UART emulator framework since I need to redo some of emulato=
r code
> >   and there's more-or-less agreement on it (where to place, naming, sco=
pe).
> > - Applied the feedback from
> >     https://lore.kernel.org/xen-devel/20250624035443.344099-1-dmukhin@f=
ord.com/
> > - Link to v3: https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v=
3-v1-0-c5d36b31d66c@ford.com/
> >
> > Changes since v2:
> > - renamed emulator s/NS8250/NS16550/g
> > - reduced the patch series after addressing v2 feedback
> > - introduced driver framework for UART emulators
> > - unified guest OS printouts across all available UART emulators
> > - Link to v2: https://lore.kernel.org/xen-devel/20241205-vuart-ns8250-v=
1-0-e9aa923127eb@ford.com/
> >
> > Changes since v1:
> > - dropped kmalloc/kfree aliases
> > - fixed ECLAIR jobs (thanks Andrew Cooper)
> > - addressed console forwarding on arm32 and arm64 (thanks to Luca Fance=
llu)
> > - moved NS8250 debugging stubs into its own patch
> > - added fix for https://gitlab.com/xen-project/xen/-/issues/184
> > - Link to v1: https://lore.kernel.org/r/20241126-vuart-ns8250-v1-v1-0-8=
7b9a8375b7a@ford.com
> >
> > Denis Mukhin (15):
> >   emul/vuart: introduce framework for UART emulators
> >   xen/8250-uart: update definitions
> >   emul/ns16x50: implement emulator stub
> >   emul/ns16x50: implement DLL/DLM registers
> >   emul/ns16x50: implement SCR register
> >   emul/ns16x50: implement IER/IIR registers
> >   emul/ns16x50: implement LCR/LSR registers
> >   emul/ns16x50: implement MCR/MSR registers
> >   emul/ns16x50: implement RBR register
> >   emul/ns16x50: implement THR register
> >   emul/ns16x50: implement FCR register (write-only)
> >   emul/ns16550: implement dump_state() hook
> >   x86/domain: enable per-domain I/O port bitmaps
> >   xen/domain: allocate d->irq_caps before arch-specific initialization
> >   emul/ns16x50: implement IRQ emulation via vIOAPIC
> >
> >  xen/arch/arm/xen.lds.S                   |   1 +
> >  xen/arch/ppc/xen.lds.S                   |   1 +
> >  xen/arch/riscv/xen.lds.S                 |   1 +
> >  xen/arch/x86/Makefile                    |   1 +
> >  xen/arch/x86/dom0_build.c                | 112 +--
> >  xen/arch/x86/hvm/dom0_build.c            |   7 +
> >  xen/arch/x86/hvm/hvm.c                   |  56 +-
> >  xen/arch/x86/hvm/nestedhvm.c             |   8 +-
> >  xen/arch/x86/hvm/quirks.c                |   3 -
> >  xen/arch/x86/hvm/svm/nestedsvm.c         |   2 +-
> >  xen/arch/x86/hvm/vioapic.c               |  10 +
> >  xen/arch/x86/hvm/vmx/vvmx.c              |   4 +-
> >  xen/arch/x86/include/asm/hvm/nestedhvm.h |   3 +-
> >  xen/arch/x86/include/asm/hvm/support.h   |   2 -
> >  xen/arch/x86/include/asm/iocap.h         |   2 +
> >  xen/arch/x86/include/asm/irq.h           |   8 +
> >  xen/arch/x86/ioport.c                    | 163 ++++
> >  xen/arch/x86/irq.c                       |   8 +
> >  xen/arch/x86/pv/dom0_build.c             |   7 +
> >  xen/arch/x86/xen.lds.S                   |   1 +
> >  xen/common/Kconfig                       |   2 +
> >  xen/common/Makefile                      |   1 +
> >  xen/common/domain.c                      |   8 +-
> >  xen/common/emul/Kconfig                  |   6 +
> >  xen/common/emul/Makefile                 |   1 +
> >  xen/common/emul/vuart/Kconfig            |  25 +
> >  xen/common/emul/vuart/Makefile           |   2 +
> >  xen/common/emul/vuart/ns16x50.c          | 984 +++++++++++++++++++++++
> >  xen/common/emul/vuart/vuart.c            | 157 ++++
> >  xen/common/keyhandler.c                  |   3 +
> >  xen/drivers/char/console.c               |   6 +-
> >  xen/drivers/char/ns16550.c               |  16 +-
> >  xen/drivers/passthrough/x86/hvm.c        |  11 +-
> >  xen/include/xen/8250-uart.h              |  50 +-
> >  xen/include/xen/sched.h                  |   4 +
> >  xen/include/xen/serial.h                 |   3 +
> >  xen/include/xen/vuart.h                  | 116 +++
> >  xen/include/xen/xen.lds.h                |  10 +
> >  38 files changed, 1634 insertions(+), 171 deletions(-)
> >  create mode 100644 xen/arch/x86/ioport.c
> >  create mode 100644 xen/common/emul/Kconfig
> >  create mode 100644 xen/common/emul/Makefile
> >  create mode 100644 xen/common/emul/vuart/Kconfig
> >  create mode 100644 xen/common/emul/vuart/Makefile
> >  create mode 100644 xen/common/emul/vuart/ns16x50.c
> >  create mode 100644 xen/common/emul/vuart/vuart.c
> >  create mode 100644 xen/include/xen/vuart.h
> >
> > --
> > 2.51.0
> >
>

Best regards,
Mykola

