Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C96F9602A01
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 13:17:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424866.672613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okkb7-0002qE-IX; Tue, 18 Oct 2022 11:17:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424866.672613; Tue, 18 Oct 2022 11:17:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okkb7-0002ni-Fc; Tue, 18 Oct 2022 11:17:25 +0000
Received: by outflank-mailman (input) for mailman id 424866;
 Tue, 18 Oct 2022 11:17:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xNhK=2T=arm.com=andre.przywara@srs-se1.protection.inumbo.net>)
 id 1okkb6-0002nb-58
 for xen-devel@lists.xenproject.org; Tue, 18 Oct 2022 11:17:24 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 6f4a4ab0-4ed6-11ed-8fd0-01056ac49cbb;
 Tue, 18 Oct 2022 13:17:22 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54DFA113E;
 Tue, 18 Oct 2022 04:17:27 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D5633F7D8;
 Tue, 18 Oct 2022 04:17:19 -0700 (PDT)
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
X-Inumbo-ID: 6f4a4ab0-4ed6-11ed-8fd0-01056ac49cbb
Date: Tue, 18 Oct 2022 12:17:06 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
Cc: marc.zyngier@arm.com, eric.auger@redhat.com, james.morse@arm.com,
 alexandru.elisei@arm.com, suzuki.poulose@arm.com, catalin.marinas@arm.com,
 will@kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.cs.columbia.ed, Julien Grall <julien@xen.org>,
 "stefanos@xilinx.com" <stefanos@xilinx.com>, Bertrand Marquis
 <Bertrand.Marquis@arm.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Subject: Re: Need guidance regarding emulation of GICR_PENDBASER and
 GICR_PROPBASER registers on Aarch32
Message-ID: <20221018121706.6bd88dd1@donnerap.cambridge.arm.com>
In-Reply-To: <b4d413eb-2956-b167-323f-31d82da737dd@amd.com>
References: <b4d413eb-2956-b167-323f-31d82da737dd@amd.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 18 Oct 2022 11:38:00 +0100
Ayan Kumar Halder <ayankuma@amd.com> wrote:

Hi Ayan,

> Greetings. I am trying to port Xen on Cortex-R52.

Oh dear, my condolences.

> I am trying to understand whether GICR_PENDBASER and GICR_PROPBASER=20
> exist on Aarch32 platform.

Those are GIC MMIO registers, so they exist regardless of which instruction
set the CPU is using. There is really nothing architecture wise that would
restrict access.

> Looking at the definition of the registers in "Arm IHI ID020922", (from=20
> my understanding) it seems the registers can be accessed in 64bit mode on=
ly.

Not really, the GIC spec says that those registers are 64-bit registers.
What that means is explained in section "12.1.3 GIC memory-mapped
register access", of particular interest is the paragraph starting with:
"In addition, in system where one or more PE supports AArch32: ...."

> Please confirm if my understanding is correct or not.
>=20
> This seems unlike GICR_TYPER which might be accessed as two 32 bit=20
> registers. The reason being the upper 32bits represent affinity and the=20
> lower 32 bits represent everything else.

There is really not much difference access-wise between TYPER and BASER.
You can always access them as two words, and this is the recommended way
to do so on AArch32, or actually in both ISAs. Check out Jean-Philippe's
comment here:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arc=
h/arm/include/asm/arch_gicv3.h#n135

In particular the BASE registers don't require atomic accesses, since they
only become effective later on, as it's not allowed to write to them when
LPIs are enabled. So there is no problem in updating the upper and lower
half in separate steps.

> If GICR_PENDBASER and GICR_PROPBASER are accessible in 64 bit mode only,=
=20
> then we Xen can't emulate them on Aarch32 as ISS is invalid (for ldrd,=20
> strd instructions).

If the guest is accessing them using ldrd/strd (which is architecturally
valid, but not easily virtualisable), then you cannot do anything about
it, and would need to change the guest to not do so. See above what Linux
does: always access them in two chunks, so it works everywhere.

Cheers,
Andre

> However, looking at the following commit in kernel, I am a bit confused.
>=20
> commit 0aa1de57319c4e023187aca0d59dd593a96459a8
> Author: Andre Przywara <andre.przywara@arm.com>
> Date:=C2=A0=C2=A0 Fri Jul 15 12:43:29 2016 +0100
>=20
>  =C2=A0=C2=A0=C2=A0 KVM: arm64: vgic: Handle ITS related GICv3 redistribu=
tor registers
>=20
>  =C2=A0=C2=A0=C2=A0 In the GICv3 redistributor there are the PENDBASER an=
d PROPBASER
>  =C2=A0=C2=A0=C2=A0 registers which we did not emulate so far, as they on=
ly make sense
>  =C2=A0=C2=A0=C2=A0 when having an ITS. In preparation for that emulate t=
hose MMIO
>  =C2=A0=C2=A0=C2=A0 accesses by storing the 64-bit data written into it i=
nto a variable
>  =C2=A0=C2=A0=C2=A0 which we later read in the ITS emulation.
>  =C2=A0=C2=A0=C2=A0 We also sanitise the registers, making sure RES0 regi=
ons are respected
>  =C2=A0=C2=A0=C2=A0 and checking for valid memory attributes.
>=20
> <<<<< code >>>
> REGISTER_DESC_WITH_LENGTH(GICR_PROPBASER,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 vgic_mmio_read_raz, vgic_mmio_write_wi, 8,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 vgic_mmio_read_propbase, vgic_mmio_write_propbase, 8,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REGISTER_DESC_WITH_LENGTH(GIC=
R_PENDBASER,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 vgic_mmio_read_raz, vgic_mmio_write_wi, 8,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 vgic_mmio_read_pendbase, vgic_mmio_write_pendbase, 8,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
> <<<< code >>>>
>=20
> The register regions are defined in arch/arm64/kvm/vgic/vgic-mmio-v3.c=20
> and the registers seem accessible in both 64 bit and 32 bit modes.
> Please let me know if GICR_PENDBASER and GICR_PROPBASER are accessible=20
> in 32 bit mode.
>=20
> Kind regards,
> Ayan


