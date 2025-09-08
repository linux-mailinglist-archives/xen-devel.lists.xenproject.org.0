Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37062B49119
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 16:19:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115324.1461995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvciD-0004ym-CW; Mon, 08 Sep 2025 14:19:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115324.1461995; Mon, 08 Sep 2025 14:19:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvciD-0004wN-9o; Mon, 08 Sep 2025 14:19:17 +0000
Received: by outflank-mailman (input) for mailman id 1115324;
 Mon, 08 Sep 2025 14:19:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PLPY=3T=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uvciC-0004wH-G4
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 14:19:16 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc9384c7-8cbe-11f0-9d13-b5c5bf9af7f9;
 Mon, 08 Sep 2025 16:19:15 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6263d0e4b94so3851078a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Sep 2025 07:19:15 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aff0681aefdsm2507185466b.8.2025.09.08.07.19.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 07:19:14 -0700 (PDT)
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
X-Inumbo-ID: cc9384c7-8cbe-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757341155; x=1757945955; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lbe8QKSIU3o79OXS///q+DjnP7EZq18ayU20B7dhrM0=;
        b=R+vNnddtPPu+RIDBBrLicu4js1v93yxyx19S+xmxzljyEtk+Y8Cw+yLgS4Lzi7/xSa
         UONbNBvRyn30oB5p1WMc2c7Rd2EozhDB4aBSbQHAudc6tVUTKDtfcSsHt6hBc4+JLBzu
         O7z7iHM6/9zwhpIH1z5iToh+qZ+DoiFWypFRCzVHi1k56D3g2MiVwSn5fNqVMMC+/tuB
         DhImmG/UarvM+WZS5BK3aQihhdjtZrUzgAQyPRrWIJPusPELeiXE5TjH9ac+Ta9uCBeF
         /51stHXcUK9u1BX63g24McPDje51WB/hhtUa7o5YP8srkY8nBdPXKQxG2P7V7Hz0Af3p
         SPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757341155; x=1757945955;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lbe8QKSIU3o79OXS///q+DjnP7EZq18ayU20B7dhrM0=;
        b=i/cmL84/tZu+ZYOdgHPJjIdUl5mziOsygeKPR8UlcoJaxLJKfcGy0qJBtHbHohVPJN
         sDL5xs8+Mb4pa+MJ9O7lJvRpFif5K2aaXTYRgmLwmmHcKisFD6D6vl94SZx3ZjzqmZs/
         VCeGFH/wbLyK/wZ/VpDepk5uUXLEF5OV8XJn6cEWqu7FT9FywAng7FLMDF99Z82uLwCd
         LJJd2dft6asVCO5/5A+v5ve+Tg9sB4rZ2p36OLlRgJOJdCeCnY+tqkPPhnwApNL0PwFd
         YCg9aSfTgV8ax1fL0r4xUCp6odHosXbJGRgNzG9pg6U2DEUzQDfMmTlAWMGGlNqXDurR
         wigg==
X-Gm-Message-State: AOJu0Yxty0MarVMy0CAPUETDM4ofW92QnkFTpcrhL12XA9uBoJ0knSpP
	JMpS/d7v/H7uLh0l0dOEfprXsSzGvvqqA/j5phwNPJYctdPzQKZFZV6X
X-Gm-Gg: ASbGncv1IAH/gYCjKaaRXr4Jna+wfoPvRIjsUSjxG1UI3FazHZh7s/adE1MnQuJORhR
	xmVMkS2de7DUguJBCTnsKTKeQykboJv9WdmtyYxLvslF/0PKink/GIg6DJh9x2rrz6gEQ5/pZAJ
	22OaY75+nOuGihdMC0nv32CBkX4TkOST8NncSRkhNjxWIfv/tTE9zdVpEyx+01ZgBbLp6p7P4H/
	zY6+kzTBoPoYwsvH2/l5UCwTYuTALYQ9tnAPp5/BcM6U+2xb+gJPvwE8FhfrVLNhQM+YMBo4DMP
	kIXKGSCaM1cs/WXDPqJ0XEefwdGVMP0PhVtfVycfbWC4du7TGLsC/tL/YUhkevabvRdxG/Yfmyc
	OAao1iAOKTgeZvSO87kHO9DOHKwgV3vZ3dZWECntHLdWAKnRmyKlt+O/UFV1qlBTUHLm3cKg+67
	bT6ilbiJE=
X-Google-Smtp-Source: AGHT+IE1wBXI9qyXo7M9D553RjuOpUoEmW292MJ/8y0g3scG9Yipgcfvqa1hkpPClg/csBTiJ1i8aA==
X-Received: by 2002:a17:907:1ca7:b0:af9:6bfb:58b7 with SMTP id a640c23a62f3a-b04b13cd4f7mr672350066b.5.1757341154729;
        Mon, 08 Sep 2025 07:19:14 -0700 (PDT)
Message-ID: <8dd6a815-0987-40f4-8afe-d4955fe5394d@gmail.com>
Date: Mon, 8 Sep 2025 16:19:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/15] x86: introduce NS16550-compatible UART emulator
To: Mykola Kvach <xakep.amatop@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, dmukhin@ford.com, dmukhin@xen.org
References: <20250905232715.440758-1-dmukhin@ford.com>
 <alpine.DEB.2.22.394.2509051900200.1405870@ubuntu-linux-20-04-desktop>
 <CAGeoDV87bTaDiG=5xAvSGZXKTJ0zSRUz7Nq2JSenBqu8DnLe2A@mail.gmail.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <CAGeoDV87bTaDiG=5xAvSGZXKTJ0zSRUz7Nq2JSenBqu8DnLe2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/8/25 11:04 AM, Mykola Kvach wrote:
> Hi Denis and Stefano
>
> I’d like to acknowledge the significant effort that went into this patch
> series -- it’s clear that a lot of work has been invested.
>
> On Sat, Sep 6, 2025 at 5:02 AM Stefano Stabellini
> <sstabellini@kernel.org> wrote:
>> Oleksii and all,
>>
>> I would like to consider patches 1-12 of this patch series for 4.21,
>> pending the few minor comments I made addressed.
> Although I am neither a maintainer nor an official reviewer for this
> project, I have looked over some of the first patches in the series. In my
> opinion, the series is not yet ready for merging.
>
> Even if my review is set aside, the changes are largely x86-specific and
> produce the most impact on this architecture. I believe that before
> merging, one of the x86 maintainers (or at least a trusted reviewer for
> x86, if available) should carefully review these patches.
>
>>
>> On Fri, 5 Sep 2025, dmukhin@xen.org wrote:
>>> x86 port of Xen lacks vUART facility similar to Arm's vpl011 to support x86
>>> guest OS bring up in the embedded setups.
>>>
>>> This patch series introduces initial in-hypervisor emulator for
>>> NS8250/NS16x50-compatible UARTs under CONFIG_VUART_NS16X50.
>>>
>>> In parallel domain creation scenario (hyperlaunch), NS16550 emulator helps
>>> early guest firmware and OS bringup debugging, because it eliminates
>>> dependency on the external emulator (qemu) being operational by the time
>>> domains are created.
>>>
>>> The emulator also allows to forward the physical console input to the x86
>>> domain which is useful when a system has only one physical UART for early
>>> debugging and this UART is owned by Xen.
>>>
>>> By default, CONFIG_VUART_NS16X50 enables emulation of NS16550 at I/O port
>>> 0x2f8, IRQ#3 in guest OS (legacy COM2). Legacy COM resources cannot be
>>> selected at built-time or via per-domain xl configuration in this initial
>>> submission.
>>>
>>> CONFIG_VUART_NS16X50_DEBUG enables some extra debugging facilities useful
>>> for NS16550 emulator development/debugging (disabled by default).
>>>
>>> The NS16550 emulator is disabled in default x86 configuration and goes under
>>> CONFIG_EXPERT in Kconfig.
>>>
>>> Limitations
>>> ===========
>>> - Only x86;
>>> - Only legacy COM2 resources, custom I/O ports/IRQs are not supported;
>>> - Only Xen console as a backend, no inter-domain communication (similar to
>>>    vpl011 on Arm);
>>> - Only 8n1 emulation (8-bit data, no parity, 1 stop bit);
>>> - No toolstack integration;
>>> - No baud rate emulation (reports 115200 baud to the guest OS);
>>> - No FIFO-less mode emulation;
>>> - No RX FIFO interrupt moderation (FCR) emulation;
>>> - No integration w/ VM snapshotting (HVM_REGISTER_SAVE_RESTORE() and
>>>    friends);
>>> - No MMIO-based UART emulation.
>>>
>>> Series
>>> ======
>>>
>>>    Patch 1 introduces the new vUART framework, that is the code originally
>>>    posted here:
>>>      https://lore.kernel.org/xen-devel/20250624035443.344099-16-dmukhin@ford.com/
>>>    Required for emulator.
>>>
>>>    Patch 2 adds missing NS16550 definitions, required for emulator.
>>>
>>>    Patch 3 introduces the basic emulator skeleton - state machine
>>>    initialization stubs, I/O port handler stub, logging, etc.
>>>
>>>    Patches 4-11 incrementally populate the minimal NS16550 register emulation.
>>>
>>>    Patch 12 hooks vUART state debugging (disabled by default).
>>>
>>>    Pathes 13-15 introduce necessary changes to enable NS16550 on dom0 (and PVH).
>>>
>>> Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2024756493
>>> Link to branch: https://gitlab.com/xen-project/people/dmukhin/xen/-/tree/vuart-ns8250-v6?ref_type=heads
>>>
>>> Testing
>>> =======
>>>
>>>    ```shell
>>>    echo CONFIG_EXPERT=y >> .config
>>>    echo CONFIG_VUART_NS16X50=y >> .config
>>>    make olddefconfig
>>>    ```
>>>    COM2 (0x2f8) resources are used by default.
>>>
>>>    To test w/ virtual COM2, the guest kernel parameters should contain
>>>    something like the following:
>>>      earlycon=uart,io,0x2f8,115200n8 console=uart,io,0x2f8,115200n8
>>>
>>>    HVM
>>>    ---
>>>    Tested only boot of HVM linux guest with OVMF as the virtual firmware.
>>>    SeaBIOS as a virtual firmware is not tested.
>>>
>>>    PVH (dom0)
>>>    ----------
>>>    Xen is able to forward physical console input to the domain with virtual
>>>    NS16550. To switch the console focus press Ctrl+aaa.
>>>    Console switch is limited on x86 to dom0 and Xen (fixes pending).
>>>
>>> Changes since v5:
>>> - Split THR/RBR into two separate patches.
>>> - Addressed feedback from v5.
>>> - Link to v5: https://lore.kernel.org/xen-devel/20250828235409.2835815-1-dmukhin@ford.com/
>>>
>>> Changes since v4:
>>> - Split the series to make it simpler to review.
>>> - Addressed feedback from v4.
>>> - Dropped xl changes, which I will submit separately.
>>> - Link to v4: https://lore.kernel.org/xen-devel/20250731192130.3948419-1-dmukhin@ford.com/
>>>
>>> Changes since v3:
>>> - Reduced the blast radius of the series, thanks to reviews, individual
>>>    aspects (like console focus) touched in v3 moved to separate threads.
>>> - Kept the UART emulator framework since I need to redo some of emulator code
>>>    and there's more-or-less agreement on it (where to place, naming, scope).
>>> - Applied the feedback from
>>>      https://lore.kernel.org/xen-devel/20250624035443.344099-1-dmukhin@ford.com/
>>> - Link to v3: https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com/
>>>
>>> Changes since v2:
>>> - renamed emulator s/NS8250/NS16550/g
>>> - reduced the patch series after addressing v2 feedback
>>> - introduced driver framework for UART emulators
>>> - unified guest OS printouts across all available UART emulators
>>> - Link to v2: https://lore.kernel.org/xen-devel/20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com/
>>>
>>> Changes since v1:
>>> - dropped kmalloc/kfree aliases
>>> - fixed ECLAIR jobs (thanks Andrew Cooper)
>>> - addressed console forwarding on arm32 and arm64 (thanks to Luca Fancellu)
>>> - moved NS8250 debugging stubs into its own patch
>>> - added fix for https://gitlab.com/xen-project/xen/-/issues/184
>>> - Link to v1: https://lore.kernel.org/r/20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com
>>>
>>> Denis Mukhin (15):
>>>    emul/vuart: introduce framework for UART emulators
>>>    xen/8250-uart: update definitions
>>>    emul/ns16x50: implement emulator stub
>>>    emul/ns16x50: implement DLL/DLM registers
>>>    emul/ns16x50: implement SCR register
>>>    emul/ns16x50: implement IER/IIR registers
>>>    emul/ns16x50: implement LCR/LSR registers
>>>    emul/ns16x50: implement MCR/MSR registers
>>>    emul/ns16x50: implement RBR register
>>>    emul/ns16x50: implement THR register
>>>    emul/ns16x50: implement FCR register (write-only)
>>>    emul/ns16550: implement dump_state() hook
>>>    x86/domain: enable per-domain I/O port bitmaps
>>>    xen/domain: allocate d->irq_caps before arch-specific initialization
>>>    emul/ns16x50: implement IRQ emulation via vIOAPIC
>>>
>>>   xen/arch/arm/xen.lds.S                   |   1 +
>>>   xen/arch/ppc/xen.lds.S                   |   1 +
>>>   xen/arch/riscv/xen.lds.S                 |   1 +
>>>   xen/arch/x86/Makefile                    |   1 +
>>>   xen/arch/x86/dom0_build.c                | 112 +--
>>>   xen/arch/x86/hvm/dom0_build.c            |   7 +
>>>   xen/arch/x86/hvm/hvm.c                   |  56 +-
>>>   xen/arch/x86/hvm/nestedhvm.c             |   8 +-
>>>   xen/arch/x86/hvm/quirks.c                |   3 -
>>>   xen/arch/x86/hvm/svm/nestedsvm.c         |   2 +-
>>>   xen/arch/x86/hvm/vioapic.c               |  10 +
>>>   xen/arch/x86/hvm/vmx/vvmx.c              |   4 +-
>>>   xen/arch/x86/include/asm/hvm/nestedhvm.h |   3 +-
>>>   xen/arch/x86/include/asm/hvm/support.h   |   2 -
>>>   xen/arch/x86/include/asm/iocap.h         |   2 +
>>>   xen/arch/x86/include/asm/irq.h           |   8 +
>>>   xen/arch/x86/ioport.c                    | 163 ++++
>>>   xen/arch/x86/irq.c                       |   8 +
>>>   xen/arch/x86/pv/dom0_build.c             |   7 +
>>>   xen/arch/x86/xen.lds.S                   |   1 +
>>>   xen/common/Kconfig                       |   2 +
>>>   xen/common/Makefile                      |   1 +
>>>   xen/common/domain.c                      |   8 +-
>>>   xen/common/emul/Kconfig                  |   6 +
>>>   xen/common/emul/Makefile                 |   1 +
>>>   xen/common/emul/vuart/Kconfig            |  25 +
>>>   xen/common/emul/vuart/Makefile           |   2 +
>>>   xen/common/emul/vuart/ns16x50.c          | 984 +++++++++++++++++++++++
>>>   xen/common/emul/vuart/vuart.c            | 157 ++++
>>>   xen/common/keyhandler.c                  |   3 +
>>>   xen/drivers/char/console.c               |   6 +-
>>>   xen/drivers/char/ns16550.c               |  16 +-
>>>   xen/drivers/passthrough/x86/hvm.c        |  11 +-
>>>   xen/include/xen/8250-uart.h              |  50 +-
>>>   xen/include/xen/sched.h                  |   4 +
>>>   xen/include/xen/serial.h                 |   3 +
>>>   xen/include/xen/vuart.h                  | 116 +++
>>>   xen/include/xen/xen.lds.h                |  10 +
>>>   38 files changed, 1634 insertions(+), 171 deletions(-)
>>>   create mode 100644 xen/arch/x86/ioport.c
>>>   create mode 100644 xen/common/emul/Kconfig
>>>   create mode 100644 xen/common/emul/Makefile
>>>   create mode 100644 xen/common/emul/vuart/Kconfig
>>>   create mode 100644 xen/common/emul/vuart/Makefile
>>>   create mode 100644 xen/common/emul/vuart/ns16x50.c
>>>   create mode 100644 xen/common/emul/vuart/vuart.c
>>>   create mode 100644 xen/include/xen/vuart.h
>>>
>>> --
>>> 2.51.0
>>>
> Best regards,
> Mykola

