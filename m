Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FDBABA45C
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 21:51:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987485.1372712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG156-00083c-D4; Fri, 16 May 2025 19:50:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987485.1372712; Fri, 16 May 2025 19:50:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG156-000826-9F; Fri, 16 May 2025 19:50:56 +0000
Received: by outflank-mailman (input) for mailman id 987485;
 Fri, 16 May 2025 19:50:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=07xk=YA=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uG153-000820-DY
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 19:50:54 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 112595f2-328f-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 21:50:49 +0200 (CEST)
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
X-Inumbo-ID: 112595f2-328f-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747425048; x=1747684248;
	bh=2CptSXvpa0L4X2bSBq3RP0goG7pZpxKrY0u0Dt/qDBE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=NjexxW0YKMF8ybrPS992PFs2yBZy0FynVtF7bOMPROTrbDxfgSoX4eqKu+I+f51aK
	 ZjPTLtnsUuGh3I1b+uUz9tnarRwPUeodsctnuPEPQNRTwtDigRIlCdUAptF72njP0j
	 E8DNeLhkRYsQRvGAlW6Ye2IjauGxivugML8pr/yJBO68pCgzgGUD2alIsYSUY55O60
	 +yWJjeRijdqaUyCpjNZ4wtd7xe5Ez0JFgVscIxdhSX7iAO4nP5mGUv0Ge0d+Uve1jD
	 O3zuztMaQPsrgBrH5uTHMbqE/DEOGKl+lpGPU9Jo1Emq5bi6rmX2SR7tJXEysvn311
	 +FU+3vvNm42jA==
Date: Fri, 16 May 2025 19:50:40 +0000
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1] xen/riscv: add initialization support for virtual SBI UART (vSBI UART)
Message-ID: <aCeXCV9680kKFqg/@kraken>
In-Reply-To: <1f380b7061496f999d4d60a60b58f494dae886e1.1747064551.git.oleksii.kurochko@gmail.com>
References: <1f380b7061496f999d4d60a60b58f494dae886e1.1747064551.git.oleksii.kurochko@gmail.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 44db3bb0ebae9a042f0187035b54721fe1a76e47
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Oleksii,

On Mon, May 12, 2025 at 05:55:21PM +0200, Oleksii Kurochko wrote:
> This is the first step toward supporting a vSBI UART.
>=20
> The implementation checks for the presence of the "vsbi_uart" property
> in the device tree. If present, the vSBI UART is initialized by:
> - Allocating a structure that holds Xen console rings and character
>   buffers.
> - Initializing the vSBI UART spinlock.
>=20
> This commit introduces the following:
> - domain_vsbi_uart_init() and domain_vsbi_uart_deinit() functions.
> - A new arch_kernel_info structure with a vsbi_uart member.
> - A vsbi_uart structure to hold information related to the vSBI
>   driver, including:
>   - Whether the vSBI UART backend is in the domain or in Xen.
>   - If the backend is in Xen: details such as ring buffer, ring page,
>     Xen console ring indexes, and character buffers.
>   - A spinlock for synchronization.
>=20
> Also, introduce init_vuart() which is going to be called by dom0less
> generic code during guest domain construction.
>=20
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

JFYI, I started to move all virtual UARTs under drivers/vuart directory
and introducing a framework for hooking vUARTs into console driver.

pl011 emulator cleanup
  https://gitlab.com/xen-project/people/dmukhin/xen/-/commit/3c635962a349af=
ed75f47cd2559a4160ffa41106

original 'vuart' for hwdom cleanup
  https://gitlab.com/xen-project/people/dmukhin/xen/-/commit/405c86cbd6d55f=
5737dc9ccf9b8a8f370767e3f0

move pl011 to drivers/vuart
  https://gitlab.com/xen-project/people/dmukhin/xen/-/commit/4b5cdff118a279=
5278dfcc2c1b60423b46e85f27

move 'vuart' for hwdom cleanup to drivers/vuart
  https://gitlab.com/xen-project/people/dmukhin/xen/-/commit/d76c17b8056c1d=
500afd854a513403fc3774da51

which is followed by vUART driver framework introduction (not posted):
  https://gitlab.com/xen-project/people/dmukhin/xen/-/commit/ebc7e83650e5e3=
f68e5d734e5c475c6bcde626fa

These patches ^^ are not posted, since I do already have enough patches on
the mailing list which are in progress.

I did this work along w/ NS16550 emulator on x86.

IMO, it is worth delivering those patches first and then integrate SBI UART=
.

> ---
> This patch is independent from other RISC-V connected patch series, but i=
t could
> be a merge conflict with some patches of other patch series.
> ---
>  xen/arch/riscv/Makefile                |  2 +
>  xen/arch/riscv/dom0less-build.c        | 30 +++++++++++++
>  xen/arch/riscv/include/asm/domain.h    |  4 ++
>  xen/arch/riscv/include/asm/kernel.h    | 21 +++++++++
>  xen/arch/riscv/include/asm/vsbi-uart.h | 58 ++++++++++++++++++++++++
>  xen/arch/riscv/vsbi-uart.c             | 62 ++++++++++++++++++++++++++
>  6 files changed, 177 insertions(+)
>  create mode 100644 xen/arch/riscv/dom0less-build.c
>  create mode 100644 xen/arch/riscv/include/asm/kernel.h
>  create mode 100644 xen/arch/riscv/include/asm/vsbi-uart.h
>  create mode 100644 xen/arch/riscv/vsbi-uart.c
>=20
> diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> index d882c57528..89a1897228 100644
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -1,5 +1,6 @@
>  obj-y +=3D aplic.o
>  obj-y +=3D cpufeature.o
> +obj-y +=3D dom0less-build.o
>  obj-$(CONFIG_EARLY_PRINTK) +=3D early_printk.o
>  obj-y +=3D entry.o
>  obj-y +=3D intc.o
> @@ -14,6 +15,7 @@ obj-y +=3D stubs.o
>  obj-y +=3D time.o
>  obj-y +=3D traps.o
>  obj-y +=3D vm_event.o
> +obj-y +=3D vsbi-uart.o
>=20
>  $(TARGET): $(TARGET)-syms
>  =09$(OBJCOPY) -O binary -S $< $@
> diff --git a/xen/arch/riscv/dom0less-build.c b/xen/arch/riscv/dom0less-bu=
ild.c
> new file mode 100644
> index 0000000000..afce2f606d
> --- /dev/null
> +++ b/xen/arch/riscv/dom0less-build.c
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/bug.h>
> +#include <xen/device_tree.h>
> +#include <xen/errno.h>
> +#include <xen/fdt-kernel.h>
> +#include <xen/init.h>
> +#include <xen/sched.h>
> +
> +#include <asm/vsbi-uart.h>
> +
> +int __init init_vuart(struct domain *d, struct kernel_info *kinfo,
> +                      const struct dt_device_node *node)
> +{
> +    int rc =3D -EINVAL;
> +
> +    kinfo->arch.vsbi_uart =3D dt_property_read_bool(node, "vsbi_uart");
> +
> +    if ( kinfo->arch.vsbi_uart )
> +    {
> +        rc =3D domain_vsbi_uart_init(d, NULL);
> +        if ( rc < 0 )
> +            return rc;
> +    }
> +
> +    if ( rc )
> +        panic("%s: what a domain should use as an UART?\n", __func__);
> +
> +    return rc;
> +}
> diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include=
/asm/domain.h
> index c3d965a559..c312827d18 100644
> --- a/xen/arch/riscv/include/asm/domain.h
> +++ b/xen/arch/riscv/include/asm/domain.h
> @@ -5,6 +5,8 @@
>  #include <xen/xmalloc.h>
>  #include <public/hvm/params.h>
>=20
> +#include <asm/vsbi-uart.h>
> +
>  struct hvm_domain
>  {
>      uint64_t              params[HVM_NR_PARAMS];
> @@ -18,6 +20,8 @@ struct arch_vcpu {
>=20
>  struct arch_domain {
>      struct hvm_domain hvm;
> +
> +    struct vsbi_uart vsbi_uart;
>  };
>=20
>  #include <xen/sched.h>
> diff --git a/xen/arch/riscv/include/asm/kernel.h b/xen/arch/riscv/include=
/asm/kernel.h
> new file mode 100644
> index 0000000000..15c13da158
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/kernel.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef ASM__RISCV__KERNEL_H
> +#define ASM__RISCV__KERNEL_H
> +
> +struct arch_kernel_info
> +{
> +    /* Enable vsbi_uart emulation */
> +    bool vsbi_uart;
> +};
> +
> +#endif /* #ifdef ASM__RISCV__KERNEL_H */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/riscv/include/asm/vsbi-uart.h b/xen/arch/riscv/incl=
ude/asm/vsbi-uart.h
> new file mode 100644
> index 0000000000..144e3191ff
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/vsbi-uart.h
> @@ -0,0 +1,58 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef ASM__RISCV__VSBI_UART_H
> +#define ASM__RISCV__VSBI_UART_H
> +
> +#include <xen/spinlock.h>
> +#include <xen/stdbool.h>
> +
> +#include <public/io/console.h>
> +
> +struct domain;
> +struct page_info;
> +
> +#define VSBI_UART_FIFO_SIZE 32
> +#define VSBI_UART_OUT_BUF_SIZE 128
> +
> +struct vsbi_uart_xen_backend {
> +    char in[VSBI_UART_FIFO_SIZE];
> +    char out[VSBI_UART_OUT_BUF_SIZE];
> +    XENCONS_RING_IDX in_cons, in_prod;
> +    XENCONS_RING_IDX out_prod;
> +};
> +
> +struct vsbi_uart {
> +    bool backend_in_domain;
> +    union {
> +        struct {
> +            void *ring_buf;
> +            struct page_info *ring_page;
> +        } dom;
> +        struct vsbi_uart_xen_backend *xen;
> +    } backend;
> +
> +    spinlock_t lock;
> +};
> +
> +/*
> + * TODO: we don't support an option that backend is in a domain.
> + *       At the moment, backend is ib Xen.
> + *       This structure should be implemented in the case if backend
> + *       is in a domain.
> + */
> +struct vsbi_uart_init_info {
> +};
> +
> +int domain_vsbi_uart_init(struct domain *d , struct vsbi_uart_init_info =
*info);
> +void domain_vsbi_uart_deinit(struct domain *d);
> +
> +#endif /* ASM__RISCV__VSBI_UART_H */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/riscv/vsbi-uart.c b/xen/arch/riscv/vsbi-uart.c
> new file mode 100644
> index 0000000000..5fe617ae30
> --- /dev/null
> +++ b/xen/arch/riscv/vsbi-uart.c
> @@ -0,0 +1,62 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/errno.h>
> +#include <xen/lib.h>
> +#include <xen/mm.h>
> +#include <xen/sched.h>
> +#include <xen/xmalloc.h>
> +
> +#include <asm/vsbi-uart.h>
> +
> +int domain_vsbi_uart_init(struct domain *d, struct vsbi_uart_init_info *=
info)
> +{
> +    int rc;
> +    struct vsbi_uart *vsbi_uart =3D &d->arch.vsbi_uart;
> +
> +    if ( vsbi_uart->backend.dom.ring_buf )
> +    {
> +        printk("%s: ring_buf !=3D 0\n", __func__);
> +        return -EINVAL;
> +    }
> +
> +    /*
> +     * info is NULL when the backend is in Xen.
> +     * info is !=3D NULL when the backend is in a domain.
> +     */
> +    if ( info !=3D NULL )
> +    {
> +        printk("%s: vsbi_uart backend in a domain isn't supported\n", __=
func__);
> +        rc =3D -EOPNOTSUPP;
> +        goto out;
> +    }
> +    else
> +    {
> +        vsbi_uart->backend_in_domain =3D false;
> +
> +        vsbi_uart->backend.xen =3D xzalloc(struct vsbi_uart_xen_backend)=
;
> +        if ( vsbi_uart->backend.xen =3D=3D NULL )
> +        {
> +            rc =3D -ENOMEM;
> +            goto out;
> +        }
> +    }
> +
> +    spin_lock_init(&vsbi_uart->lock);
> +
> +    return 0;
> +
> +out:
> +    domain_vsbi_uart_deinit(d);
> +
> +    return rc;
> +}
> +
> +void domain_vsbi_uart_deinit(struct domain *d)
> +{
> +    struct vsbi_uart *vsbi_uart =3D &d->arch.vsbi_uart;
> +
> +    if ( vsbi_uart->backend_in_domain )
> +        printk("%s: backed in a domain isn't supported\n", __func__);
> +    else
> +        XFREE(vsbi_uart->backend.xen);
> +}
> --
> 2.49.0
>=20
>=20

Thanks,
Denis


