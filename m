Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C53B362BB04
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 12:10:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444258.699271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovGIg-0000vR-Nl; Wed, 16 Nov 2022 11:09:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444258.699271; Wed, 16 Nov 2022 11:09:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovGIg-0000tD-KZ; Wed, 16 Nov 2022 11:09:50 +0000
Received: by outflank-mailman (input) for mailman id 444258;
 Wed, 16 Nov 2022 11:09:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+lcl=3Q=arm.com=andre.przywara@srs-se1.protection.inumbo.net>)
 id 1ovGIf-0000t7-W6
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 11:09:49 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 2e75d619-659f-11ed-8fd2-01056ac49cbb;
 Wed, 16 Nov 2022 12:09:47 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 008D81477;
 Wed, 16 Nov 2022 03:09:53 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A9EE93F663;
 Wed, 16 Nov 2022 03:09:45 -0800 (PST)
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
X-Inumbo-ID: 2e75d619-659f-11ed-8fd2-01056ac49cbb
Date: Wed, 16 Nov 2022 11:09:42 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Michal Orzel <michal.orzel@amd.com>, Jiamei Xie <Jiamei.Xie@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Chen
 <Wei.Chen@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "julien@xen.org" <julien@xen.org>
Subject: Re: Xen Arm vpl011 UART will cause segmentation fault in Linux
 guest
Message-ID: <20221116110942.3faf952f@donnerap.cambridge.arm.com>
In-Reply-To: <alpine.DEB.2.22.394.2211101231210.50442@ubuntu-linux-20-04-desktop>
References: <AS8PR08MB76960AFEAA767A12368E83D9923E9@AS8PR08MB7696.eurprd08.prod.outlook.com>
	<00764fe2-f78a-e5db-cb16-903ad1a5ec03@amd.com>
	<AS8PR08MB7696950216E688E67644CBDB923E9@AS8PR08MB7696.eurprd08.prod.outlook.com>
	<f650683a-c2e6-e282-b32c-52151341ecfb@amd.com>
	<alpine.DEB.2.22.394.2211101231210.50442@ubuntu-linux-20-04-desktop>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 10 Nov 2022 12:32:49 -0800 (PST)
Stefano Stabellini <sstabellini@kernel.org> wrote:

Hi,

> On Wed, 9 Nov 2022, Michal Orzel wrote:
> > Hi Jiamei,
> >=20
> > On 09/11/2022 09:25, Jiamei Xie wrote: =20
> > >=20
> > >=20
> > > Hi Michal=EF=BC=8C
> > >=20
> > > Below log can be got when stating the linux guest. It says 9c09 is sb=
sa. And 9c09 is also output
> > >  in bootlogd error message:
> > > Serial: AMBA PL011 UART driver
> > > 9c0b0000.uart: ttyAMA0 at MMIO 0x9c0b0000 (irq =3D 12, base_baud =3D =
0) is a PL011 rev2
> > > printk: console [ttyAMA0] enabled
> > > 9c090000.sbsa-uart: ttyAMA1 at MMIO 0x9c090000 (irq =3D 15, base_baud=
 =3D 0) is a SBSA
> > >  =20
> >=20
> > Xen behavior is correct and this would be Linux fault to try to write t=
o DMACR for SBSA UART device.
> > DMACR is just an example. If you try to program e.g. the baudrate (thro=
ugh LCR) for VPL011 it will
> > also result in injecting abort into the guest. Should Xen support it? N=
o. The reason why is that
> > it is not spec compliant operation. SBSA specification directly specifi=
es what registers are exposed.
> > If Linux tries to write to some of the none-spec compliant registers - =
it is its fault. =20
>=20
> Yeah, we need to fix Linux.

Yes, it's a bug in Linux, and nobody noticed because most SBSA UARTs are
actual PL011s, just not with everything wired up and the clocks fixed.

But while you can take pride all day in Xen having a perfect
spec-compliant implementation - and you would be right - you have to face
the reality that existing Linux kernels will crash.
So we will add the one-liner in Linux that fixes that issue, and this will
probably be backported to stable kernels, but you will still encounter
kernels without the fix in the wild.
So I wonder if you should consider to just implement the other PL011
registers as RAZ/WI? That would be spec compliant as well (since an actual
PL011 is also a spec-compliant SBSA-UART), but would work either way. Of
course you don't need to implement the DMA or baudrate functionality, but
at least not be nasty and trap on those register accesses.

Cheers,
Andre

> FYI this is not the first bug in Linux affecting the sbsa-uart driver:
> the issue is that the pl011 driver and the sbsa-uart driver share the
> same code in Linux so it happens sometimes that a pl011-only feature
> creeps into the sbsa-uart driver by mistake.
>=20
>=20
> > >> -----Original Message-----
> > >> From: Michal Orzel <michal.orzel@amd.com>
> > >> Sent: Wednesday, November 9, 2022 3:40 PM
> > >> To: Jiamei Xie <Jiamei.Xie@arm.com>; xen-devel@lists.xenproject.org
> > >> Cc: Wei Chen <Wei.Chen@arm.com>; Bertrand Marquis
> > >> <Bertrand.Marquis@arm.com>; julien@xen.org; sstabellini@kernel.org
> > >> Subject: Re: Xen Arm vpl011 UART will cause segmentation fault in Li=
nux
> > >> guest
> > >>
> > >> Hi Jiamei,
> > >>
> > >> On 09/11/2022 08:20, Jiamei Xie wrote: =20
> > >>>
> > >>>
> > >>> Hi all,
> > >>>
> > >>> When the guest kernel enables DMA engine with =20
> > >> "CONFIG_DMA_ENGINE=3Dy", Linux AMBA PL011 driver will access PL011
> > >> DMACR register. But this register have not been supported by vpl011 =
of Xen.
> > >> Xen will inject a data abort into guest, this will cause segmentatio=
n fault of
> > >> guest with the below message:
> > >> I am quite confused.
> > >> VPL011 implements SBSA UART which only implements some subset of PL0=
11
> > >> operations (SBSA UART is not PL011).
> > >> According to spec (SBSA ver. 6.0), the SBSA_UART does not support DMA
> > >> features so Xen code is fine.
> > >> When Xen exposes vpl011 device to a guest, this device has "arm,sbsa=
-uart"
> > >> compatible and not "uart-pl011".
> > >> Linux driver "amba-pl011.c" should see this compatible and assign pr=
oper
> > >> operations (sbsa_uart_pops instead of amba_pl011_pops) that do not e=
nable
> > >> DMA.
> > >> Maybe the issue is with your configuration?
> > >>
> > >> ~Michal
> > >> =20
> > >>> Unhandled fault at 0xffffffc00944d048
> > >>> Mem abort info:
> > >>> ESR =3D 0x96000000
> > >>> EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> > >>> SET =3D 0, FnV =3D 0
> > >>> EA =3D 0, S1PTW =3D 0
> > >>> FSC =3D 0x00: ttbr address size fault
> > >>> Data abort info:
> > >>> ISV =3D 0, ISS =3D 0x00000000
> > >>> CM =3D 0, WnR =3D 0
> > >>> swapper pgtable: 4k pages, 39-bit VAs, pgdp=3D0000000020e2e000
> > >>> [ffffffc00944d048] pgd=3D100000003ffff803, p4d=3D100000003ffff803, =
=20
> > >> pud=3D100000003ffff803, pmd=3D100000003fffa803, pte=3D006800009c090f=
13 =20
> > >>> Internal error: ttbr address size fault: 96000000 [#1] PREEMPT SMP
> > >>> Modules linked in:
> > >>> CPU: 0 PID: 132 Comm: bootlogd Not tainted 5.15.44-yocto-standard #1
> > >>> pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> > >>> pc : pl011_stop_rx+0x70/0x80
> > >>> lr : uart_tty_port_shutdown+0x44/0x110
> > >>> sp : ffffffc00999bba0
> > >>> x29: ffffffc00999bba0 x28: ffffff80234ac380 x27: ffffff8022f5d000
> > >>> x26: 0000000000000000 x25: 0000000045585401 x24: 0000000000000000
> > >>> x23: ffffff8021ba4660 x22: 0000000000000001 x21: ffffff8021a0e2a0
> > >>> x20: ffffff802198f880 x19: ffffff8021a0e1a0 x18: 0000000000000000
> > >>> x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
> > >>> x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
> > >>> x11: 0000000000000000 x10: 0000000000000000 x9 : ffffffc00871ba14
> > >>> x8 : ffffffc0099de260 x7 : ffffff8021a0e318 x6 : 0000000000000003
> > >>> x5 : ffffffc009315f20 x4 : ffffffc00944d038 x3 : 0000000000000000
> > >>> x2 : ffffffc00944d048 x1 : 0000000000000000 x0 : 0000000000000048
> > >>> Call trace:
> > >>> pl011_stop_rx+0x70/0x80
> > >>> tty_port_shutdown+0x7c/0xb4
> > >>> tty_port_close+0x60/0xcc
> > >>> uart_close+0x34/0x8c
> > >>> tty_release+0x144/0x4c0
> > >>> __fput+0x78/0x220
> > >>> ____fput+0x1c/0x30
> > >>> task_work_run+0x88/0xc0
> > >>> do_notify_resume+0x8d0/0x123c
> > >>> el0_svc+0xa8/0xc0
> > >>> el0t_64_sync_handler+0xa4/0x130
> > >>> el0t_64_sync+0x1a0/0x1a4
> > >>> Code: b9000083 b901f001 794038a0 8b000042 (b9000041)
> > >>> ---[ end trace 83dd93df15c3216f ]---
> > >>> note: bootlogd[132] exited with preempt_count 1
> > >>> /etc/rcS.d/S07bootlogd: line 47: 132 Segmentation fault start-stop-=
 =20
> > >> daemon =20
> > >>> In Xen, vpl011_mmio_write doesn't handle DMACR . And kernel doesn't=
 =20
> > >> check if pl011_write executes sucessfully in pl011_dma_rx_stop . So =
such
> > >> segmentation fault occurs. =20
> > >>> static inline void pl011_dma_rx_stop(struct uart_amba_port *uap)
> > >>> {
> > >>>         /* FIXME.  Just disable the DMA enable */
> > >>>         uap->dmacr &=3D ~UART011_RXDMAE;
> > >>>         pl011_write(uap->dmacr, uap, REG_DMACR);
> > >>> }
> > >>>
> > >>> I think we should prevent such segmentation fault. We have checked =
the =20
> > >> PL011 spec, it seems there is not any register bit can indicate DMA =
support
> > >> status of PL011. We might have two options: =20
> > >>> 1. Option#1 is to add DMA support for vpl011, but this is not trivi=
al.
> > >>> 2. Option#2 is to ignore the write to DMACR, and return 0 for DMACR=
 read =20
> > >> in vpl011. But this option need co-work with kernel, because current=
 Linux
> > >> PL011 driver assume the write operation will never be failed, and wi=
ll not
> > >> fallback to no-DMA mode, when Xen return 0 for DMA enabled bit in DM=
ACR. =20
> > >>>
> > >>> How do you think about it?  Any suggestion about it is welcome. Tha=
nks.
> > >>>
> > >>> Best wishes
> > >>> Jiamei Xie
> > >>> =20
> >  =20


