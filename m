Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E475B1F5D3
	for <lists+xen-devel@lfdr.de>; Sat,  9 Aug 2025 20:38:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1076205.1437893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukoRV-0004wt-Vl; Sat, 09 Aug 2025 18:37:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1076205.1437893; Sat, 09 Aug 2025 18:37:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukoRV-0004uL-ST; Sat, 09 Aug 2025 18:37:21 +0000
Received: by outflank-mailman (input) for mailman id 1076205;
 Sat, 09 Aug 2025 18:37:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gHj1=2V=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ukoRS-0004uF-T8
 for xen-devel@lists.xenproject.org; Sat, 09 Aug 2025 18:37:20 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df6acb60-754f-11f0-a325-13f23c93f187;
 Sat, 09 Aug 2025 20:37:16 +0200 (CEST)
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
X-Inumbo-ID: df6acb60-754f-11f0-a325-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1754764634; x=1755023834;
	bh=n5Ehv5KB0OtjRGUxggTUAaUhi43nCx1jRRE/9S54hLk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=JPEBJqxwBKDH0YItkp6RrTEg+BsIcHiI5tK0XYqQoC+i5Enm9blVJHANpfMGfChTY
	 qSGm18Y4OoE2nMfuJ4LtkjG6kPNmvAfcSDPC4pAO/AKVv8pkR8gDLYBy2ToV/CsAG4
	 TD25gDJ/L7OHw3HuiKSnz5TIuRFkk9ILxJvTL83vvartqbN4t1sF0fXdbrIlby/YKD
	 fDhK40IvrNW3bJjZhcRBPX0PCh4C/nNPUm72yqHBddabsGehqnFQHkLHnETx9sDr+z
	 CQst12OaMsq62K9uXYl76wMtjlMid5KceczEnJDwYEyIj7nc391HU1trQhPwpVQvfG
	 XAm0/CRg6+whQ==
Date: Sat, 09 Aug 2025 18:37:07 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 5/8] emul/vuart-ns16550: introduce NS16550-compatible UART emulator (x86)
Message-ID: <aJeVTIG2nU3bqGwO@starscream>
In-Reply-To: <5c0589a2-91fe-484d-bded-5a68a1626355@suse.com>
References: <20250731192130.3948419-1-dmukhin@ford.com> <20250731192130.3948419-6-dmukhin@ford.com> <5c0589a2-91fe-484d-bded-5a68a1626355@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: c627fc21628400d7789407cd5d43beba529c74dd
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 04, 2025 at 12:53:36PM +0200, Jan Beulich wrote:
> On 31.07.2025 21:22, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Add initial in-hypervisor emulator for NS8250/NS16x50-compatible UARTs =
under
> > CONFIG_VUART_NS16550 for x86 port of Xen.
> >
> > x86 port of Xen lacks vUART facility similar to Arm's SBSA emulator to =
support
> > x86 guest OS bring up in the embedded setups.
> >
> > In parallel domain creation scenario (hyperlaunch), NS16550 emulator he=
lps
> > early guest firmware and/or OS bringup debugging, because it eliminates
> > dependency on the external emulator (qemu) being operational by the tim=
e
> > domains are created.
> >
> > The emulator also allows to forward the physical console input to the x=
86
> > domain which is useful when a system has only one physical UART for ear=
ly
> > debugging and this UART is owned by Xen. Such functionality is limited =
to dom0
> > use currently.
> >
> > By default, CONFIG_VUART_NS16550 enables emulation of NS16550 at I/O po=
rt
> > 0x3f8, IRQ#4 in guest OS (legacy COM1).
> >
> > Legacy COM resources can be selected at built-time and cannot be config=
ured
> > per-domain via .cfg or DT yet.
> >
> > Introduce new emulation flag for virtual UART on x86 and plumb it throu=
gh
> > domain creation code so NS16550 emulator can be instantiated properly.
> >
> > Please refer to the NS16550 emulator code for full list of limitations.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v3:
> > - feedback addressed
> > - adjusted to new vUART framework APIs
> > - Link to v3: https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v=
3-v1-21-c5d36b31d66c@ford.com/
> > ---
> >  xen/arch/x86/hvm/hvm.c                |    9 +
> >  xen/arch/x86/include/asm/domain.h     |    4 +-
> >  xen/arch/x86/include/asm/hvm/domain.h |    4 +
> >  xen/common/emul/vuart/Kconfig         |   48 ++
> >  xen/common/emul/vuart/Makefile        |    1 +
> >  xen/common/emul/vuart/vuart-ns16550.c | 1009 +++++++++++++++++++++++++
> >  xen/common/emul/vuart/vuart.c         |    4 +
> >  xen/include/public/arch-x86/xen.h     |    4 +-
> >  xen/include/xen/resource.h            |    3 +
> >  9 files changed, 1084 insertions(+), 2 deletions(-)
> >  create mode 100644 xen/common/emul/vuart/vuart-ns16550.c
>=20
> Overall I think this patch is too large to sensibly review. Surely base s=
tructure
> and then (incrementally) fleshing out of the hooks can be separated from =
one
> another?

I'll do a split.

>=20
> > --- a/xen/arch/x86/hvm/hvm.c
> > +++ b/xen/arch/x86/hvm/hvm.c
> > @@ -31,6 +31,7 @@
> >  #include <xen/nospec.h>
> >  #include <xen/vm_event.h>
> >  #include <xen/console.h>
> > +#include <xen/vuart.h>
> >  #include <asm/shadow.h>
> >  #include <asm/hap.h>
> >  #include <asm/current.h>
> > @@ -702,6 +703,10 @@ int hvm_domain_initialise(struct domain *d,
> >      if ( rc !=3D 0 )
> >          goto fail1;
> >
> > +    rc =3D vuart_init(d, NULL);
> > +    if ( rc !=3D 0 )
> > +        goto out_vioapic_deinit;
> > +
> >      stdvga_init(d);
> >
> >      rtc_init(d);
> > @@ -725,6 +730,8 @@ int hvm_domain_initialise(struct domain *d,
> >      return 0;
> >
> >   fail2:
> > +    vuart_deinit(d);
> > + out_vioapic_deinit:
> >      vioapic_deinit(d);
> >   fail1:
> >      if ( is_hardware_domain(d) )
>=20
> Would be better if vuart_deinit() was idempotent, and hence could be call=
ed
> unconditionally here.

Agree, vuart_deinit() is idempotent even in this submisson.
Will update.

>=20
> > @@ -787,6 +794,8 @@ void hvm_domain_destroy(struct domain *d)
> >      if ( hvm_funcs.domain_destroy )
> >          alternative_vcall(hvm_funcs.domain_destroy, d);
> >
> > +    vuart_deinit(d);
>=20
> You require a fair level of idempotency already anyway, as a domain may n=
ot
> have any vUART, so this call already needs to be "capabale" of doing noth=
ing.
>=20
> > --- a/xen/arch/x86/include/asm/hvm/domain.h
> > +++ b/xen/arch/x86/include/asm/hvm/domain.h
> > @@ -149,6 +149,10 @@ struct hvm_domain {
> >  #ifdef CONFIG_MEM_SHARING
> >      struct mem_sharing_domain mem_sharing;
> >  #endif
> > +
> > +#ifdef CONFIG_VUART_NS16550
> > +    void *vuart; /* Virtual UART handle. */
> > +#endif
> >  };
>=20
> With your framework you allow for multiple vUART drivers. Either the fiel=
d
> looks misnamed or the CONFIG_* option checked is the wrong one.

Agree; will update.

>=20
> Also, why's this x86-specific? NS16550s can exist anywhere, can't they?
> (The present, but presumably temporary tying to x86 looks to be the use o=
f
> I/O ports.)

struct hvm_domain is arch-specific.

I do not think I need to add NS16550 to, say RISC-V's, hvm_domain without
implementing MMIO part and guest DT-binding generation.

>=20
> > --- a/xen/common/emul/vuart/Kconfig
> > +++ b/xen/common/emul/vuart/Kconfig
> > @@ -3,4 +3,52 @@ config HAS_VUART
> >
> >  menu "UART Emulation"
> >
> > +config VUART_NS16550
> > +=09bool "NS16550-compatible UART Emulation" if EXPERT
> > +=09depends on X86 && HVM
> > +=09select HAS_VUART
> > +=09help
> > +=09  In-hypervisor NS16550/NS16x50 UART emulation.
> > +
> > +=09  Only legacy PC I/O ports are emulated.
> > +
> > +=09  This is strictly for testing purposes (such as early HVM guest co=
nsole),
> > +=09  and not appropriate for use in production.
> > +
> > +choice VUART_NS16550_PC
> > +=09prompt "IBM PC COM resources"
> > +=09depends on VUART_NS16550
> > +=09default VUART_NS16550_PC_COM1
> > +=09help
> > +=09  Default emulated NS16550 resources.
> > +
> > +config VUART_NS16550_PC_COM1
> > +=09bool "COM1 (I/O port 0x3f8, IRQ#4)"
> > +
> > +config VUART_NS16550_PC_COM2
> > +=09bool "COM2 (I/O port 0x2f8, IRQ#3)"
> > +
> > +config VUART_NS16550_PC_COM3
> > +=09bool "COM3 (I/O port 0x3e8, IRQ#4)"
> > +
> > +config VUART_NS16550_PC_COM4
> > +=09bool "COM4 (I/O port 0x2e8, IRQ#3)"
> > +
> > +endchoice
> > +
> > +config VUART_NS16550_LOG_LEVEL
> > +=09int "UART emulator verbosity level"
> > +=09range 0 3
> > +=09default "1"
> > +=09depends on VUART_NS16550
> > +=09help
> > +=09  Set the default log level of UART emulator.
> > +=09  See include/xen/config.h for more details.
>=20
> For someone merely running kconfig but not otherwise knowing the sources,
> this isn't an overly helful pointer. But I question the need for such a
> control anyway, and I think I did say so already before.

I'll drop that Kconfig setting.

>=20
> > +config VUART_NS16550_DEBUG
> > +=09bool "UART emulator development debugging"
> > +=09depends on VUART_NS16550
>=20
> && DEBUG ?

I will drop that Kconfig.

>=20
> > --- a/xen/common/emul/vuart/Makefile
> > +++ b/xen/common/emul/vuart/Makefile
> > @@ -1 +1,2 @@
> >  obj-$(CONFIG_HAS_VUART) +=3D vuart.o
> > +obj-$(CONFIG_VUART_NS16550) +=3D vuart-ns16550.o
>=20
> I don't think files in this directory need a vuart- name prefix.

Ack.

Hmm, there's already ns16550.c which is UART driver, so it may be confusing=
 to
have two ns16550s (although in different directories).

I do not have a strong preference on the naming here.

>=20
> > --- /dev/null
> > +++ b/xen/common/emul/vuart/vuart-ns16550.c
> > @@ -0,0 +1,1009 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * NS16550-compatible UART Emulator.
> > + *
> > + * See:
> > + * - Serial and UART Tutorial:
> > + *     https://download.freebsd.org/doc/en/articles/serial-uart/serial=
-uart_en.pdf
> > + * - UART w/ 16 byte FIFO:
> > + *     https://www.ti.com/lit/ds/symlink/tl16c550c.pdf
> > + * - UART w/ 64 byte FIFO:
> > + *     https://www.ti.com/lit/ds/symlink/tl16c750.pdf
> > + *
> > + * Limitations:
> > + * - Only x86;
> > + * - Only HVM domains support (build-time), PVH domains are not suppor=
ted yet;
> > + * - Only legacy COM{1,2,3,4} resources via Kconfig, custom I/O ports/=
IRQs
> > + *   are not supported;
> > + * - Only Xen console as a backend, no inter-domain communication (sim=
ilar to
> > + *   vpl011 on Arm);
> > + * - Only 8n1 emulation (8-bit data, no parity, 1 stop bit);
> > + * - No toolstack integration;
> > + * - No baud rate emulation (reports 115200 baud to the guest OS);
> > + * - No FIFO-less mode emulation;
> > + * - No RX FIFO interrupt moderation (FCR) emulation;
> > + * - No integration w/ VM snapshotting (HVM_REGISTER_SAVE_RESTORE() an=
d
> > + *   friends);
> > + * - No ISA IRQ sharing allowed;
> > + * - No MMIO-based UART emulation.
> > + */
> > +
> > +#define pr_prefix               "ns16550"
> > +#define pr_fmt(fmt)             pr_prefix ": " fmt
> > +#define pr_log_level            CONFIG_VUART_NS16550_LOG_LEVEL
> > +
> > +#include <xen/8250-uart.h>
> > +#include <xen/console.h>
> > +#include <xen/iocap.h>
> > +#include <xen/ioreq.h>
> > +#include <xen/resource.h>
> > +#include <xen/vuart.h>
> > +#include <xen/xvmalloc.h>
> > +
> > +#include <public/io/console.h>
>=20
> Except for cases where Xen itself runs as a guest, I don't think any of t=
hese
> headers should be used in Xen sources. If I'm not mistaken, ...

I'll double check, thanks.

>=20
> > +/*
> > + * Virtual NS16550 device state.
> > + */
> > +struct vuart_ns16550 {
> > +    struct xencons_interface cons;      /* Emulated RX/TX FIFOs */
>=20
> ... this also isn't to communicate with some remote, but merely to use so=
me
> of the fields conveniently.

The plan is to add peer-to-peer connection over vUART similarly to existing
vpl011.

>=20
> > +    uint8_t regs[NS16550_EMU_REGS_NUM]; /* Emulated registers */
> > +    unsigned int irq;                   /* Emulated IRQ# */
> > +    uint64_t io_addr;                   /* Emulated I/O region base ad=
dress */
> > +    uint64_t io_size;                   /* Emulated I/O region size */
>=20
> These are huge; for the size that's true even if considering future MMIO-
> based emulation.

Ack.

>=20
> > +    const char *name;                   /* Device name */
> > +    struct domain *owner;               /* Owner domain */
> > +    spinlock_t lock;                    /* Protection */
> > +};
> > +
> > +/*
> > + * Virtual device description.
> > + */
> > +struct virtdev_desc {
> > +    const char *name;
> > +    const struct resource *res;
> > +};
> > +
> > +/*
> > + * Legacy IBM PC NS16550 resources.
> > + * There are only 4 I/O port ranges, hardcoding all of them here.
> > + */
> > +static const struct virtdev_desc x86_pc_uarts[4] =3D {
> > +    [0] =3D {
> > +        .name =3D "COM1",
> > +        .res =3D (const struct resource[]){
> > +            { .type =3D IORESOURCE_IO,  .addr =3D 0x3f8, .size =3D NS1=
6550_REGS_NUM },
> > +            { .type =3D IORESOURCE_IRQ, .addr =3D 4,     .size =3D 1 }=
,
> > +            { .type =3D IORESOURCE_UNKNOWN },
> > +        },
> > +    },
> > +    [1] =3D {
> > +        .name =3D "COM2",
> > +        .res =3D (const struct resource[]){
> > +            { .type =3D IORESOURCE_IO,  .addr =3D 0x2f8, .size =3D NS1=
6550_REGS_NUM },
> > +            { .type =3D IORESOURCE_IRQ, .addr =3D 3,     .size =3D 1 }=
,
> > +            { .type =3D IORESOURCE_UNKNOWN },
> > +        },
> > +    },
> > +    [2] =3D {
> > +        .name =3D "COM3",
> > +        .res =3D (const struct resource[]){
> > +            { .type =3D IORESOURCE_IO,  .addr =3D 0x3e8, .size =3D NS1=
6550_REGS_NUM },
> > +            { .type =3D IORESOURCE_IRQ, .addr =3D 4,     .size =3D 1 }=
,
> > +            { .type =3D IORESOURCE_UNKNOWN },
> > +        },
> > +    },
> > +    [3] =3D {
> > +        .name =3D "COM4",
> > +        .res =3D (const struct resource[]){
> > +            { .type =3D IORESOURCE_IO,  .addr =3D 0x2e8, .size =3D NS1=
6550_REGS_NUM },
> > +            { .type =3D IORESOURCE_IRQ, .addr =3D 3,     .size =3D 1 }=
,
> > +            { .type =3D IORESOURCE_UNKNOWN },
> > +        },
> > +    },
> > +};
>=20
> The choice of COMn is at build time. Why do we need all four configuratio=
ns
> resident not only in the binary, but even at (post-init) runtime? Also, t=
he
> way you do initialization of .res, I think adding __initconst to the main
> array wouldn't have the effect of pulling all those inti .init.* as well.
> For the time being I simply don't see the need for the extra level of
> indirection: All instances have two entries (plus the then likely not
> necessary sentinel).

Will rework that.

>=20
> > +static bool cf_check ns16550_iir_check_lsi(const struct vuart_ns16550 =
*vdev)
> > +{
> > +    return !!(vdev->regs[UART_LSR] & UART_LSR_MASK);
>=20
> No need for !! (also elsewhere).

Ack.

>=20
> > --- a/xen/include/xen/resource.h
> > +++ b/xen/include/xen/resource.h
> > @@ -31,4 +31,7 @@ struct resource {
> >
> >  #define resource_size(res)      ((res)->size)
> >
> > +#define for_each_resource(res) \
> > +    for ( ; (res) && (res)->type !=3D IORESOURCE_UNKNOWN; (res)++ )
>=20
> I'm not sure this is a good generic #define; imo it wants keeping local t=
o
> the one file that uses it.

Ack.

>=20
> Jan
>=20


