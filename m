Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C23A865B1
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 20:44:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947739.1345344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3JMV-0001RF-NL; Fri, 11 Apr 2025 18:44:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947739.1345344; Fri, 11 Apr 2025 18:44:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3JMV-0001PS-K7; Fri, 11 Apr 2025 18:44:23 +0000
Received: by outflank-mailman (input) for mailman id 947739;
 Fri, 11 Apr 2025 18:44:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vbRy=W5=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u3JMU-0001PM-H2
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 18:44:22 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8c8cfd1-1704-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 20:44:17 +0200 (CEST)
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
X-Inumbo-ID: f8c8cfd1-1704-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744397056; x=1744656256;
	bh=BThW7+7w6wnulnEZgubFcNoIIwKngiuOjWTbpvOMv8M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=LhpKCmTrK+BIFFCFXSw5/Hh1vFWkCpRMgeDavBsXfGkg6nrLWZuyzzLXiWK+ma2ui
	 JDzMDNiMY5yI2pY86k1wKJyMullhE/xWHCIMTx1Dx1hjpkZZOYRK9KlxnT/Hy46cPl
	 lASXSH+HQQ24AbPMJWnE/XC2jgfLa240i0HN1Mc8m4YLPXXXeKOziTUCg7YnCzip2X
	 xIrhRmgrq/qEqf4OsV9jbZtjO3ul9+bzdOcQYsEMH8anXuOgFVlKSGZEcTFMYUbkG6
	 Zo3mC5FO2qbTHKEWzQoJV5YZ+vTFxfs6VKQQkA56fedIrmRFvAdJ+I1+kl7/yVNozJ
	 KVB94844CKuHw==
Date: Fri, 11 Apr 2025 18:44:08 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/5] xen/io: provide helpers for multi size MMIO accesses
Message-ID: <5d2RS-duKVbdI2Bs1NEpc1A7L_qT2oDjIZ87wADa9qFuA92LOWTr4qheoTcnLVJjIJAzVvYexIQSp9XoFeoZJYz6gUFDbmEuFPoI0KUIM70=@proton.me>
In-Reply-To: <20250411105411.22334-3-roger.pau@citrix.com>
References: <20250411105411.22334-1-roger.pau@citrix.com> <20250411105411.22334-3-roger.pau@citrix.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: bc8e466475b5ec130cbabe69e72551b5140fac2f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Friday, April 11th, 2025 at 3:54 AM, Roger Pau Monne <roger.pau@citrix.c=
om> wrote:

>=20
>=20
> Several handlers have the same necessity of reading from an MMIO region
> using 1, 2, 4 or 8 bytes accesses. So far this has been open-coded in the
> function itself. Instead provide a new handler that encapsulates the
> accesses.
>=20
> Since the added helpers are not architecture specific, introduce a new
> generic io.h header.
>=20
> No functional change intended.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 roger.pau@citrix.com
>=20
> ---
> xen/arch/x86/hvm/vmsi.c | 47 ++----------------------------
> xen/arch/x86/mm.c | 32 +++++----------------
> xen/drivers/vpci/msix.c | 47 ++----------------------------
> xen/include/xen/io.h | 63 +++++++++++++++++++++++++++++++++++++++++
> 4 files changed, 76 insertions(+), 113 deletions(-)
> create mode 100644 xen/include/xen/io.h
>=20
> diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
> index fd83abb929ec..61b89834d97d 100644
> --- a/xen/arch/x86/hvm/vmsi.c
> +++ b/xen/arch/x86/hvm/vmsi.c
> @@ -24,6 +24,7 @@
> * Will be merged it with virtual IOAPIC logic, since most is the same
> */
>=20
> +#include <xen/io.h>
>=20
> #include <xen/types.h>
>=20
> #include <xen/mm.h>
>=20
> #include <xen/xmalloc.h>
>=20
> @@ -304,28 +305,7 @@ static void adjacent_read(
>=20
> hwaddr =3D fix_to_virt(fixmap_idx) + PAGE_OFFSET(address);
>=20
> - switch ( len )
> - {
> - case 1:
> - *pval =3D readb(hwaddr);
> - break;
> -
> - case 2:
> - *pval =3D readw(hwaddr);
> - break;
> -
> - case 4:
> - *pval =3D readl(hwaddr);
> - break;
> -
> - case 8:
> - *pval =3D readq(hwaddr);
> - break;
> -
> - default:
> - ASSERT_UNREACHABLE();
> - break;
> - }
> + *pval =3D read_mmio(hwaddr, len);
> }
>=20
> static void adjacent_write(
> @@ -344,28 +324,7 @@ static void adjacent_write(
>=20
> hwaddr =3D fix_to_virt(fixmap_idx) + PAGE_OFFSET(address);
>=20
> - switch ( len )
> - {
> - case 1:
> - writeb(val, hwaddr);
> - break;
> -
> - case 2:
> - writew(val, hwaddr);
> - break;
> -
> - case 4:
> - writel(val, hwaddr);
> - break;
> -
> - case 8:
> - writeq(val, hwaddr);
> - break;
> -
> - default:
> - ASSERT_UNREACHABLE();
> - break;
> - }
> + write_mmio(hwaddr, val, len);
> }
>=20
> static int cf_check msixtbl_read(
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index 1cf236516789..989e62e7ce6f 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -95,6 +95,7 @@
> #include <xen/guest_access.h>
>=20
> #include <xen/hypercall.h>
>=20
> #include <xen/init.h>
>=20
> +#include <xen/io.h>
>=20
> #include <xen/iocap.h>
>=20
> #include <xen/ioreq.h>
>=20
> #include <xen/irq.h>
>=20
> @@ -116,7 +117,6 @@
> #include <asm/flushtlb.h>
>=20
> #include <asm/guest.h>
>=20
> #include <asm/idt.h>
>=20
> -#include <asm/io.h>
>=20
> #include <asm/io_apic.h>
>=20
> #include <asm/ldt.h>
>=20
> #include <asm/mem_sharing.h>
>=20
> @@ -5102,7 +5102,7 @@ static void __iomem *subpage_mmio_map_page(
> static void subpage_mmio_write_emulate(
> mfn_t mfn,
> unsigned int offset,
> - const void *data,
> + unsigned long data,
> unsigned int len)
> {
> struct subpage_ro_range *entry;
> @@ -5115,7 +5115,6 @@ static void subpage_mmio_write_emulate(
>=20
> if ( test_bit(offset / MMIO_RO_SUBPAGE_GRAN, entry->ro_elems) )
>=20
> {
> - write_ignored:
> gprintk(XENLOG_WARNING,
> "ignoring write to R/O MMIO 0x%"PRI_mfn"%03x len %u\n",
> mfn_x(mfn), offset, len);
> @@ -5131,26 +5130,7 @@ static void subpage_mmio_write_emulate(
> return;
> }
>=20
> - addr +=3D offset;
> - switch ( len )
> - {
> - case 1:
> - writeb((const uint8_t)data, addr);
> - break;
> - case 2:
> - writew((const uint16_t)data, addr);
> - break;
> - case 4:
> - writel((const uint32_t)data, addr);
> - break;
> - case 8:
> - writeq((const uint64_t)data, addr);
> - break;
> - default:
> - /* mmio_ro_emulated_write() already validated the size */
> - ASSERT_UNREACHABLE();
> - goto write_ignored;
> - }
> + write_mmio(addr + offset, data, len);
> }
>=20
> #ifdef CONFIG_HVM
> @@ -5185,18 +5165,20 @@ int cf_check mmio_ro_emulated_write(
> struct x86_emulate_ctxt *ctxt)
> {
> struct mmio_ro_emulate_ctxt *mmio_ro_ctxt =3D ctxt->data;
>=20
> + unsigned long data =3D 0;
>=20
> /* Only allow naturally-aligned stores at the original %cr2 address. */
> if ( ((bytes | offset) & (bytes - 1)) || !bytes ||
> - offset !=3D mmio_ro_ctxt->cr2 )
>=20
> + offset !=3D mmio_ro_ctxt->cr2 || bytes > sizeof(data) )
>=20
> {
> gdprintk(XENLOG_WARNING, "bad access (cr2=3D%lx, addr=3D%lx, bytes=3D%u)\=
n",
> mmio_ro_ctxt->cr2, offset, bytes);
>=20
> return X86EMUL_UNHANDLEABLE;
> }
>=20
> + memcpy(&data, p_data, bytes);
> subpage_mmio_write_emulate(mmio_ro_ctxt->mfn, PAGE_OFFSET(offset),
>=20
> - p_data, bytes);
> + data, bytes);
>=20
> return X86EMUL_OKAY;
> }
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index 6bd8c55bb48e..6455f2a03a01 100644
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -17,6 +17,7 @@
> * License along with this program; If not, see http://www.gnu.org/license=
s/.
>=20
> */
>=20
> +#include <xen/io.h>
>=20
> #include <xen/sched.h>
>=20
> #include <xen/vpci.h>
>=20
>=20
> @@ -344,28 +345,7 @@ static int adjacent_read(const struct domain *d, con=
st struct vpci_msix *msix,
> return X86EMUL_OKAY;
> }
>=20
> - switch ( len )
> - {
> - case 1:
> - *data =3D readb(mem + PAGE_OFFSET(addr));
> - break;
> -
> - case 2:
> - *data =3D readw(mem + PAGE_OFFSET(addr));
> - break;
> -
> - case 4:
> - *data =3D readl(mem + PAGE_OFFSET(addr));
> - break;
> -
> - case 8:
> - *data =3D readq(mem + PAGE_OFFSET(addr));
> - break;
> -
> - default:
> - ASSERT_UNREACHABLE();
> - break;
> - }
> + *data =3D read_mmio(mem + PAGE_OFFSET(addr), len);
> spin_unlock(&vpci->lock);
>=20
>=20
> return X86EMUL_OKAY;
> @@ -493,28 +473,7 @@ static int adjacent_write(const struct domain *d, co=
nst struct vpci_msix *msix,
> return X86EMUL_OKAY;
> }
>=20
> - switch ( len )
> - {
> - case 1:
> - writeb(data, mem + PAGE_OFFSET(addr));
> - break;
> -
> - case 2:
> - writew(data, mem + PAGE_OFFSET(addr));
> - break;
> -
> - case 4:
> - writel(data, mem + PAGE_OFFSET(addr));
> - break;
> -
> - case 8:
> - writeq(data, mem + PAGE_OFFSET(addr));
> - break;
> -
> - default:
> - ASSERT_UNREACHABLE();
> - break;
> - }
> + write_mmio(mem + PAGE_OFFSET(addr), data, len);
> spin_unlock(&vpci->lock);
>=20
>=20
> return X86EMUL_OKAY;
> diff --git a/xen/include/xen/io.h b/xen/include/xen/io.h
> new file mode 100644
> index 000000000000..5c360ce9dee2
> --- /dev/null
> +++ b/xen/include/xen/io.h
> @@ -0,0 +1,63 @@
> +/* SPDX-License-Identifier: GPL-2.0-only /
> +/
> + * Generic helpers for doing MMIO accesses.
> + *
> + * Copyright (c) 2025 Cloud Software Group
> + */
> +#ifndef XEN_IO_H
> +#define XEN_IO_H
> +
> +#include <xen/bug.h>
>=20
> +
> +#include <asm/io.h>
>=20
> +
> +static inline uint64_t read_mmio(const volatile void __iomem *mem,
> + unsigned int size)
> +{
> + switch ( size )
> + {
> + case 1:
> + return readb(mem);
> +
> + case 2:
> + return readw(mem);
> +
> + case 4:
> + return readl(mem);
> +
> + case 8:
> + return readq(mem);

Suggest adding `default` case for MISRA compliance.=20

> + }
> +
> + ASSERT_UNREACHABLE();
> + return ~0UL;
> +}
> +
> +static inline void write_mmio(volatile void __iomem mem, uint64_t data,
> + unsigned int size)
> +{
> + switch ( size )
> + {
> + case 1:
> + writeb(data, mem);
> + break;
> +
> + case 2:
> + writew(data, mem);
> + break;
> +
> + case 4:
> + writel(data, mem);
> + break;
> +
> + case 8:
> + writeq(data, mem);
> + break;
> +
> + default:
> + ASSERT_UNREACHABLE();
> + break;
> + }
> +}
> +
> +#endif / XEN_IO_H */
> --
> 2.48.1

