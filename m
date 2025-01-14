Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB74A10CE2
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 18:00:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871569.1282582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXkGx-0001Vk-Sl; Tue, 14 Jan 2025 17:00:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871569.1282582; Tue, 14 Jan 2025 17:00:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXkGx-0001Te-Q8; Tue, 14 Jan 2025 17:00:11 +0000
Received: by outflank-mailman (input) for mailman id 871569;
 Tue, 14 Jan 2025 16:41:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LTc1=UG=brainfault.org=anup@srs-se1.protection.inumbo.net>)
 id 1tXjyW-0005us-NB
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 16:41:09 +0000
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [2607:f8b0:4864:20::d31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58ef6946-d296-11ef-a0e1-8be0dac302b0;
 Tue, 14 Jan 2025 17:41:05 +0100 (CET)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-84a012f7232so213192939f.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 08:41:05 -0800 (PST)
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
X-Inumbo-ID: 58ef6946-d296-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1736872864; x=1737477664; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYYy9/uR4iy35ySnvh+St9PKv34OGy3mNjqnkv7qxQw=;
        b=y2w9l2X4/ptMvCqUpIoW2kjkdG6ma/fweFNizjQrAoWUR1av7h7K6lD4ExODMx9XgE
         VesyPzAnZfOYbV5q0WvvxovYoD8sugHSJQ9yyWuuREdr7tg/3tscZtj8Gg5qH4x/HCQW
         8OMPlk0S+keRNMl1uichVDFXey0GyVREKJE/i+6SaBhd30LuItvQziLYq/sIbPBb28PM
         xMATAW/8g2a88w6JqHn0SL80kgiI3Fr3qSd+LZ4jKjI4ENtWJUQYglHPbywg5JnFZaXq
         dQKhP73ch8hSF8d3x3JHVnqfHMFFh/KJMI6fLWqsiBVkRXuJWcCbiCr4U+PKPJqU7J77
         U0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736872864; x=1737477664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYYy9/uR4iy35ySnvh+St9PKv34OGy3mNjqnkv7qxQw=;
        b=OQIklB+pRjwwtrN95ge8kmjtlcr8YVrw0YF5ARCAMDpwMFnEFi3/Y6mfxurWaKDzjU
         2xBXuNeG1qDRUPZT+umSGYvcXLIm8VIkBWvzPBRsHH1bGA4mNpGk6l851iot74/r7thQ
         ZF3l3DLc524r6i1BGrlhI1DbdgByTrgN9zayLQCmr4VooKxhfJpUtnh69ZAOw2VGAf6M
         VLzTtKiKj3mtELHsfBk08wxDdpqIj2oMFaiUq36dNpl8qqiQLiw2gqvoFNF2/q0DjlEZ
         VxMi7HjCuayUjubmN5k9254ziFFOyb1kgUElCvILTgIRf5RKoD9PP114W1dopVMFuS4D
         eDwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ3JKNZNFZSjMSkmrjTkFtBktL+VsDa8ElvLnaYArNwuxZAs+G2No79vm7Bq9RvtTy3G3VK+zW/Gc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywc1fCTMSmpabpYsUDTAnroM0jLcxfaHzj9jrmIBDUT+qG1J0vq
	boADlDBIQtrY97WNmJ0t4sDokr5PCIWhjjebfTYUuZ3PZGizfb6T2pS57uZP+UyqZOV2ox0+5fa
	PF9vHDwOKvkl60jHscGjTobW1q3yUoddPK0CjWQ==
X-Gm-Gg: ASbGncvdd4UqnVE0nMXc8SITqvUOM4F9Un3cvTw0an9zil63PeEIj4qdbq9IW8WZ5QC
	h/6OWcsnELBJsxPhXzQmpc9JTN3nWTttoW6YDsow=
X-Google-Smtp-Source: AGHT+IGayyMTLiwTPodEFqs3shB7Qhb2StAITjyDm4y5doOqNDLF2JdCpPToaFxsLfQt91MNsMWXze1BX4KyGJIjLMQ=
X-Received: by 2002:a05:6e02:1f05:b0:3ce:7b33:8c3b with SMTP id
 e9e14a558f8ab-3ce7b339029mr26680325ab.5.1736872864228; Tue, 14 Jan 2025
 08:41:04 -0800 (PST)
MIME-Version: 1.0
References: <e4a649a7fdfc8fcf5f48a0bc4e76e5d546078083.1736868605.git.Slavisa.Petrovic@rt-rk.com>
In-Reply-To: <e4a649a7fdfc8fcf5f48a0bc4e76e5d546078083.1736868605.git.Slavisa.Petrovic@rt-rk.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 14 Jan 2025 22:10:52 +0530
X-Gm-Features: AbW1kvZAYWhkxIlWxJiEL0gBDLMmDf6ZNuh0dZnQTSt_rnq6EtQLVaI7jznNB7M
Message-ID: <CAAhSdy2rfbNT6tTK7i7rV6M1kNs2bFOQtN5QZpJ2xPrJx6WXjw@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add initial Xen guest support for RISC-V
To: Milan Djokic <milandjokic1995@gmail.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, jgross@suse.com, 
	sstabellini@kernel.org, oleksandr_tyshchenko@epam.com, 
	Slavisa.Petrovic@rt-rk.com, Milan.Djokic@rt-rk.com, 
	rafael.j.wysocki@intel.com, sunilvl@ventanamicro.com, takakura@valinux.co.jp, 
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, 
	iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 9:41=E2=80=AFPM Milan Djokic <milandjokic1995@gmail=
.com> wrote:
>
> From: Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>
>
> This patch introduces initial support for running RISC-V as a Xen guest.
> It provides the necessary infrastructure and stubs for Xen-specific
> operations. Key changes include:
>
> - Modifications to the RISC-V kernel to integrate Xen-specific hypercalls
>   and interfaces, with function implementations stubbed for future work.
> - Introduction of Xen-specific headers for RISC-V, including event
>   handling, hypervisor interaction, and page management. Functions are
>   defined but not yet implemented.
> - Stub implementations for memory management, grant tables, and context
>   switching in the Xen environment, allowing further development and
>   integration.
>
> Signed-off-by: Milan Djokic <Milan.Djokic@rt-rk.com>
> Signed-off-by: Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>

A single patch with many changes is hard to review.

Please convert this patch into a series with smaller patches.
Also, include a cover letter in the series explaining how to
test Xen on RISC-V.

Regards,
Anup

> ---
>  arch/riscv/Kbuild                        |   1 +
>  arch/riscv/Kconfig                       |  19 +++
>  arch/riscv/include/asm/cpu.h             |   1 +
>  arch/riscv/include/asm/hypervisor.h      |   9 ++
>  arch/riscv/include/asm/irq.h             |   5 +
>  arch/riscv/include/asm/sync_bitops.h     |  27 ++++
>  arch/riscv/include/asm/xen/events.h      |  28 ++++
>  arch/riscv/include/asm/xen/hypercall.h   |   2 +
>  arch/riscv/include/asm/xen/hypervisor.h  |   2 +
>  arch/riscv/include/asm/xen/interface.h   |   2 +
>  arch/riscv/include/asm/xen/page.h        |   3 +
>  arch/riscv/include/asm/xen/swiotlb-xen.h |   2 +
>  arch/riscv/xen/Makefile                  |   2 +
>  arch/riscv/xen/enlighten.c               | 164 +++++++++++++++++++++++
>  arch/riscv/xen/grant-table.c             |  57 ++++++++
>  arch/riscv/xen/hypercall.S               |  71 ++++++++++
>  arch/riscv/xen/p2m.c                     |  76 +++++++++++
>  include/xen/interface/io/protocols.h     |   3 +
>  include/xen/riscv/hypercall.h            |  71 ++++++++++
>  include/xen/riscv/hypervisor.h           |  26 ++++
>  include/xen/riscv/interface.h            |  85 ++++++++++++
>  include/xen/riscv/page.h                 | 106 +++++++++++++++
>  include/xen/riscv/swiotlb-xen.h          |  13 ++
>  test.txt                                 |  21 +++
>  24 files changed, 796 insertions(+)
>  create mode 100644 arch/riscv/include/asm/hypervisor.h
>  create mode 100644 arch/riscv/include/asm/sync_bitops.h
>  create mode 100644 arch/riscv/include/asm/xen/events.h
>  create mode 100644 arch/riscv/include/asm/xen/hypercall.h
>  create mode 100644 arch/riscv/include/asm/xen/hypervisor.h
>  create mode 100644 arch/riscv/include/asm/xen/interface.h
>  create mode 100644 arch/riscv/include/asm/xen/page.h
>  create mode 100644 arch/riscv/include/asm/xen/swiotlb-xen.h
>  create mode 100644 arch/riscv/xen/Makefile
>  create mode 100644 arch/riscv/xen/enlighten.c
>  create mode 100644 arch/riscv/xen/grant-table.c
>  create mode 100644 arch/riscv/xen/hypercall.S
>  create mode 100644 arch/riscv/xen/p2m.c
>  create mode 100644 include/xen/riscv/hypercall.h
>  create mode 100644 include/xen/riscv/hypervisor.h
>  create mode 100644 include/xen/riscv/interface.h
>  create mode 100644 include/xen/riscv/page.h
>  create mode 100644 include/xen/riscv/swiotlb-xen.h
>  create mode 100644 test.txt
>
> diff --git a/arch/riscv/Kbuild b/arch/riscv/Kbuild
> index 2c585f7a0b6e..d9b71deed2cd 100644
> --- a/arch/riscv/Kbuild
> +++ b/arch/riscv/Kbuild
> @@ -5,6 +5,7 @@ obj-$(CONFIG_BUILTIN_DTB) +=3D boot/dts/
>  obj-$(CONFIG_CRYPTO) +=3D crypto/
>  obj-y +=3D errata/
>  obj-$(CONFIG_KVM) +=3D kvm/
> +obj-$(CONFIG_XEN) +=3D xen/
>
>  obj-$(CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY) +=3D purgatory/
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index d4a7ca0388c0..13ea75221524 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -1071,6 +1071,25 @@ config PARAVIRT_TIME_ACCOUNTING
>
>           If in doubt, say N here.
>
> +config XEN_DOM0
> +       def_bool y
> +       depends on XEN
> +
> +config XEN
> +       bool "Xen guest support on RISCV"
> +       depends on RISCV && OF
> +       select PARAVIRT
> +       help
> +         Enables support for running Linux as a Xen guest on RISC-V.
> +
> +         Xen is a type-1 hypervisor that allows multiple operating syste=
ms
> +         to run on the same hardware. Enabling this option allows the ke=
rnel
> +         to function as a guest under the Xen hypervisor on RISC-V platf=
orms.
> +
> +         Say Y if you want to run this kernel as a guest under Xen on RI=
SC-V.
> +
> +         If unsure, say N.
> +
>  config RELOCATABLE
>         bool "Build a relocatable kernel"
>         depends on MMU && 64BIT && !XIP_KERNEL
> diff --git a/arch/riscv/include/asm/cpu.h b/arch/riscv/include/asm/cpu.h
> index 28d45a6678ce..fb2aac6a068e 100644
> --- a/arch/riscv/include/asm/cpu.h
> +++ b/arch/riscv/include/asm/cpu.h
> @@ -4,5 +4,6 @@
>  #define _ASM_CPU_H
>
>  /* This header is required unconditionally by the ACPI core */
> +#include <linux/cpu.h>
>
>  #endif /* _ASM_CPU_H */
> diff --git a/arch/riscv/include/asm/hypervisor.h b/arch/riscv/include/asm=
/hypervisor.h
> new file mode 100644
> index 000000000000..3a117afe57f0
> --- /dev/null
> +++ b/arch/riscv/include/asm/hypervisor.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_RISCV_HYPERVISOR_H
> +#define _ASM_RISCV_HYPERVISOR_H
> +
> +#include <asm/xen/hypervisor.h>
> +
> +void kvm_init_hyp_services(void);
> +
> +#endif
> diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
> index 7b038f3b7cb0..b14621848eae 100644
> --- a/arch/riscv/include/asm/irq.h
> +++ b/arch/riscv/include/asm/irq.h
> @@ -23,6 +23,11 @@ void riscv_set_intc_hwnode_fn(struct fwnode_handle *(*=
fn)(void));
>
>  struct fwnode_handle *riscv_get_intc_hwnode(void);
>
> +static inline int nr_legacy_irqs(void)
> +{
> +       return 0;
> +}
> +
>  #ifdef CONFIG_ACPI
>
>  enum riscv_irqchip_type {
> diff --git a/arch/riscv/include/asm/sync_bitops.h b/arch/riscv/include/as=
m/sync_bitops.h
> new file mode 100644
> index 000000000000..28e3c64ba852
> --- /dev/null
> +++ b/arch/riscv/include/asm/sync_bitops.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_SYNC_BITOPS_H__
> +#define __ASM_SYNC_BITOPS_H__
> +
> +#include <asm/bitops.h>
> +#include <asm/cmpxchg.h>
> +
> +/* sync_bitops functions are equivalent to the SMP implementation of the
> + * original functions, independently from CONFIG_SMP being defined.
> + *
> + * We need them because _set_bit etc are not SMP safe if !CONFIG_SMP. Bu=
t
> + * under Xen you might be communicating with a completely external entit=
y
> + * who might be on another CPU (e.g. two uniprocessor guests communicati=
ng
> + * via event channels and grant tables). So we need a variant of the bit
> + * ops which are SMP safe even on a UP kernel.
> + */
> +
> +#define sync_set_bit(nr, p)             set_bit(nr, p)
> +#define sync_clear_bit(nr, p)           clear_bit(nr, p)
> +#define sync_change_bit(nr, p)          change_bit(nr, p)
> +#define sync_test_and_set_bit(nr, p)    test_and_set_bit(nr, p)
> +#define sync_test_and_clear_bit(nr, p)  test_and_clear_bit(nr, p)
> +#define sync_test_and_change_bit(nr, p) test_and_change_bit(nr, p)
> +#define sync_test_bit(nr, addr)         test_bit(nr, addr)
> +#define arch_sync_cmpxchg               arch_cmpxchg
> +
> +#endif
> diff --git a/arch/riscv/include/asm/xen/events.h b/arch/riscv/include/asm=
/xen/events.h
> new file mode 100644
> index 000000000000..a3d0332ca46c
> --- /dev/null
> +++ b/arch/riscv/include/asm/xen/events.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_RISCV_XEN_EVENTS_H
> +#define _ASM_RISCV_XEN_EVENTS_H
> +
> +#include <asm/ptrace.h>
> +#include <asm/atomic.h>
> +
> +enum ipi_vector {
> +       XEN_PLACEHOLDER_VECTOR,
> +
> +       /* Xen IPIs go here */
> +       XEN_NR_IPIS,
> +};
> +
> +static inline int xen_irqs_disabled(struct pt_regs *regs)
> +{
> +       return 0;
> +}
> +
> +#define xchg_xen_ulong(ptr, val) xchg((ptr), (val))
> +
> +/* Rebind event channel is supported by default */
> +static inline bool xen_support_evtchn_rebind(void)
> +{
> +       return true;
> +}
> +
> +#endif /* _ASM_RISCV_XEN_EVENTS_H */
> diff --git a/arch/riscv/include/asm/xen/hypercall.h b/arch/riscv/include/=
asm/xen/hypercall.h
> new file mode 100644
> index 000000000000..0841ba1f0835
> --- /dev/null
> +++ b/arch/riscv/include/asm/xen/hypercall.h
> @@ -0,0 +1,2 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#include <xen/riscv/hypercall.h>
> diff --git a/arch/riscv/include/asm/xen/hypervisor.h b/arch/riscv/include=
/asm/xen/hypervisor.h
> new file mode 100644
> index 000000000000..05b7c834d0a9
> --- /dev/null
> +++ b/arch/riscv/include/asm/xen/hypervisor.h
> @@ -0,0 +1,2 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#include <xen/riscv/hypervisor.h>
> diff --git a/arch/riscv/include/asm/xen/interface.h b/arch/riscv/include/=
asm/xen/interface.h
> new file mode 100644
> index 000000000000..9f30b1d7e77c
> --- /dev/null
> +++ b/arch/riscv/include/asm/xen/interface.h
> @@ -0,0 +1,2 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#include <xen/riscv/interface.h>
> diff --git a/arch/riscv/include/asm/xen/page.h b/arch/riscv/include/asm/x=
en/page.h
> new file mode 100644
> index 000000000000..c8f5b873445b
> --- /dev/null
> +++ b/arch/riscv/include/asm/xen/page.h
> @@ -0,0 +1,3 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#include <xen/riscv/page.h>
> +#include <asm/mmu.h>
> diff --git a/arch/riscv/include/asm/xen/swiotlb-xen.h b/arch/riscv/includ=
e/asm/xen/swiotlb-xen.h
> new file mode 100644
> index 000000000000..aa3bc339df03
> --- /dev/null
> +++ b/arch/riscv/include/asm/xen/swiotlb-xen.h
> @@ -0,0 +1,2 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#include <xen/riscv/swiotlb-xen.h>
> diff --git a/arch/riscv/xen/Makefile b/arch/riscv/xen/Makefile
> new file mode 100644
> index 000000000000..f6d3a357e4c7
> --- /dev/null
> +++ b/arch/riscv/xen/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-y :=3D enlighten.o p2m.o grant-table.o hypercall.o
> diff --git a/arch/riscv/xen/enlighten.c b/arch/riscv/xen/enlighten.c
> new file mode 100644
> index 000000000000..28bd66c288f9
> --- /dev/null
> +++ b/arch/riscv/xen/enlighten.c
> @@ -0,0 +1,164 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <xen/xen.h>
> +#include <xen/events.h>
> +#include <xen/grant_table.h>
> +#include <xen/hvm.h>
> +#include <xen/interface/vcpu.h>
> +#include <xen/interface/xen.h>
> +#include <xen/interface/memory.h>
> +#include <xen/interface/hvm/params.h>
> +#include <xen/features.h>
> +#include <xen/platform_pci.h>
> +#include <xen/xenbus.h>
> +#include <xen/page.h>
> +#include <xen/interface/sched.h>
> +#include <xen/xen-ops.h>
> +#include <asm/xen/hypervisor.h>
> +#include <asm/xen/hypercall.h>
> +#include <asm/efi.h>
> +#include <linux/interrupt.h>
> +#include <linux/irqreturn.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_fdt.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_address.h>
> +#include <linux/cpuidle.h>
> +#include <linux/cpufreq.h>
> +#include <linux/cpu.h>
> +#include <linux/console.h>
> +#include <linux/pvclock_gtod.h>
> +#include <linux/reboot.h>
> +#include <linux/time64.h>
> +#include <linux/timekeeping.h>
> +#include <linux/timekeeper_internal.h>
> +#include <linux/acpi.h>
> +#include <linux/virtio_anchor.h>
> +
> +#include <linux/mm.h>
> +
> +static struct start_info _xen_start_info;
> +struct start_info *xen_start_info =3D &_xen_start_info;
> +EXPORT_SYMBOL(xen_start_info);
> +
> +enum xen_domain_type xen_domain_type =3D XEN_NATIVE;
> +EXPORT_SYMBOL(xen_domain_type);
> +
> +struct shared_info xen_dummy_shared_info;
> +struct shared_info *HYPERVISOR_shared_info =3D (void *)&xen_dummy_shared=
_info;
> +
> +DEFINE_PER_CPU(struct vcpu_info *, xen_vcpu);
> +static struct vcpu_info __percpu *xen_vcpu_info;
> +
> +/* Linux <-> Xen vCPU id mapping */
> +DEFINE_PER_CPU(uint32_t, xen_vcpu_id);
> +EXPORT_PER_CPU_SYMBOL(xen_vcpu_id);
> +
> +/* These are unused until we support booting "pre-ballooned" */
> +unsigned long xen_released_pages;
> +struct xen_memory_region xen_extra_mem[XEN_EXTRA_MEM_MAX_REGIONS] __init=
data;
> +
> +static __read_mostly unsigned int xen_events_irq;
> +static __read_mostly phys_addr_t xen_grant_frames;
> +
> +#define GRANT_TABLE_INDEX   0
> +#define EXT_REGION_INDEX    1
> +
> +uint32_t xen_start_flags;
> +EXPORT_SYMBOL(xen_start_flags);
> +
> +int xen_unmap_domain_gfn_range(struct vm_area_struct *vma,
> +                                       int nr, struct page **pages)
> +{
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(xen_unmap_domain_gfn_range);
> +
> +static void xen_read_wallclock(struct timespec64 *ts)
> +{
> +}
> +
> +static int xen_pvclock_gtod_notify(struct notifier_block *nb,
> +                                       unsigned long was_set, void *priv=
)
> +{
> +       return 0;
> +}
> +
> +static struct notifier_block xen_pvclock_gtod_notifier =3D {
> +       .notifier_call =3D xen_pvclock_gtod_notify,
> +};
> +
> +static int xen_starting_cpu(unsigned int cpu)
> +{
> +       return 0;
> +}
> +
> +static int xen_dying_cpu(unsigned int cpu)
> +{
> +       return 0;
> +}
> +
> +void xen_reboot(int reason)
> +{
> +}
> +
> +static int xen_restart(struct notifier_block *nb, unsigned long action,
> +                                       void *data)
> +{
> +       return 0;
> +}
> +
> +static struct notifier_block xen_restart_nb =3D {
> +       .notifier_call =3D xen_restart,
> +       .priority =3D 192,
> +};
> +
> +static void xen_power_off(void)
> +{
> +}
> +
> +static __initdata struct {
> +       const char *compat;
> +       const char *prefix;
> +       const char *version;
> +       bool found;
> +} hyper_node =3D {"xen,xen", "xen,xen-", NULL, false};
> +
> +static int __init fdt_find_hyper_node(unsigned long node, const char *un=
ame,
> +                                       int depth, void *data)
> +{
> +       return 0;
> +}
> +
> +void __init xen_early_init(void)
> +{
> +}
> +
> +static void __init xen_dt_guest_init(void)
> +{
> +}
> +
> +static int __init xen_guest_init(void)
> +{
> +       return 0;
> +}
> +early_initcall(xen_guest_init);
> +
> +static int xen_starting_runstate_cpu(unsigned int cpu)
> +{
> +       return 0;
> +}
> +
> +static int __init xen_late_init(void)
> +{
> +       return 0;
> +}
> +late_initcall(xen_late_init);
> +
> +
> +/* empty stubs */
> +void xen_arch_pre_suspend(void) { }
> +void xen_arch_post_suspend(int suspend_cancelled) { }
> +void xen_timer_resume(void) { }
> +void xen_arch_resume(void) { }
> +void xen_arch_suspend(void) { }
> diff --git a/arch/riscv/xen/grant-table.c b/arch/riscv/xen/grant-table.c
> new file mode 100644
> index 000000000000..9dd0cea74360
> --- /dev/null
> +++ b/arch/riscv/xen/grant-table.c
> @@ -0,0 +1,57 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/***********************************************************************=
*******
> + * grant_table.c
> + *
> + * Granting foreign access to our memory reservation.
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License version 2
> + * as published by the Free Software Foundation; or, when distributed
> + * separately from the Linux kernel or incorporated into other
> + * software packages, subject to the following license:
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
> + * of this source file (the "Software"), to deal in the Software without
> + * restriction, including without limitation the rights to use, copy, mo=
dify,
> + * merge, publish, distribute, sublicense, and/or sell copies of the Sof=
tware,
> + * and to permit persons to whom the Software is furnished to do so, sub=
ject to
> + * the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be includ=
ed in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL THE
> + * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHE=
R
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER D=
EALINGS
> + * IN THE SOFTWARE.
> + */
> +
> +#include <xen/interface/xen.h>
> +#include <xen/page.h>
> +#include <xen/grant_table.h>
> +
> +int arch_gnttab_map_shared(xen_pfn_t *frames, unsigned long nr_gframes,
> +                                       unsigned long max_nr_gframes,
> +                                       void **__shared)
> +{
> +       return 0;
> +}
> +
> +void arch_gnttab_unmap(void *shared, unsigned long nr_gframes)
> +{
> +}
> +
> +int arch_gnttab_map_status(uint64_t *frames, unsigned long nr_gframes,
> +                                       unsigned long max_nr_gframes,
> +                                       grant_status_t **__shared)
> +{
> +       return 0;
> +}
> +
> +int arch_gnttab_init(unsigned long nr_shared, unsigned long nr_status)
> +{
> +       return 0;
> +}
> diff --git a/arch/riscv/xen/hypercall.S b/arch/riscv/xen/hypercall.S
> new file mode 100644
> index 000000000000..a81afd2a11c4
> --- /dev/null
> +++ b/arch/riscv/xen/hypercall.S
> @@ -0,0 +1,71 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#include <linux/linkage.h>
> +#include <asm/assembler.h>
> +#include <xen/interface/xen.h>
> +EXPORT_SYMBOL_GPL(HYPERVISOR_event_channel_op);
> +EXPORT_SYMBOL_GPL(HYPERVISOR_grant_table_op);
> +EXPORT_SYMBOL_GPL(HYPERVISOR_xen_version);
> +EXPORT_SYMBOL_GPL(HYPERVISOR_console_io);
> +EXPORT_SYMBOL_GPL(HYPERVISOR_sched_op);
> +EXPORT_SYMBOL_GPL(HYPERVISOR_hvm_op);
> +EXPORT_SYMBOL_GPL(HYPERVISOR_memory_op);
> +EXPORT_SYMBOL_GPL(HYPERVISOR_physdev_op);
> +EXPORT_SYMBOL_GPL(HYPERVISOR_vcpu_op);
> +EXPORT_SYMBOL_GPL(HYPERVISOR_platform_op_raw);
> +EXPORT_SYMBOL_GPL(HYPERVISOR_multicall);
> +EXPORT_SYMBOL_GPL(HYPERVISOR_vm_assist);
> +EXPORT_SYMBOL_GPL(HYPERVISOR_dm_op);
> +EXPORT_SYMBOL_GPL(privcmd_call);
> +#define SBI_ECALL 0xE
> +
> +    .data
> +
> +#define HYPERCALL_SIMPLE(hypercall) \
> +SYM_FUNC_START(HYPERVISOR_##hypercall) \
> +    li a6, __HYPERVISOR_##hypercall; \
> +    li a7, SBI_ECALL; \
> +    mv a5, a4; \
> +    mv a4, a3; \
> +    mv a3, a2; \
> +    mv a2, a1; \
> +    mv a1, a0; \
> +    li a0, 0; \
> +    ecall; \
> +    ret; \
> +SYM_FUNC_END(HYPERVISOR_##hypercall)
> +
> +#define HYPERCALL0 HYPERCALL_SIMPLE
> +#define HYPERCALL1 HYPERCALL_SIMPLE
> +#define HYPERCALL2 HYPERCALL_SIMPLE
> +#define HYPERCALL3 HYPERCALL_SIMPLE
> +#define HYPERCALL4 HYPERCALL_SIMPLE
> +#define HYPERCALL5 HYPERCALL_SIMPLE
> +
> +    .text
> +
> +HYPERCALL2(xen_version);
> +HYPERCALL3(console_io);
> +HYPERCALL3(grant_table_op);
> +HYPERCALL2(sched_op);
> +HYPERCALL2(event_channel_op);
> +HYPERCALL2(hvm_op);
> +HYPERCALL2(memory_op);
> +HYPERCALL2(physdev_op);
> +HYPERCALL3(vcpu_op);
> +HYPERCALL1(platform_op_raw);
> +HYPERCALL2(multicall);
> +HYPERCALL2(vm_assist);
> +HYPERCALL3(dm_op);
> +
> +SYM_FUNC_START(privcmd_call)
> +    mv a6, a0
> +    li a7, SBI_ECALL
> +    mv a5, a4;
> +    mv a4, a3;
> +    mv a3, a2;
> +    mv a2, a1;
> +    mv a1, a0;
> +    li a0, 0;
> +    ecall
> +    ret
> +SYM_FUNC_END(privcmd_call);
> diff --git a/arch/riscv/xen/p2m.c b/arch/riscv/xen/p2m.c
> new file mode 100644
> index 000000000000..7ce75e52d7c4
> --- /dev/null
> +++ b/arch/riscv/xen/p2m.c
> @@ -0,0 +1,76 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <linux/memblock.h>
> +#include <linux/gfp.h>
> +#include <linux/export.h>
> +#include <linux/spinlock.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/vmalloc.h>
> +#include <linux/swiotlb.h>
> +
> +#include <xen/xen.h>
> +#include <xen/interface/memory.h>
> +#include <xen/grant_table.h>
> +#include <xen/page.h>
> +#include <xen/swiotlb-xen.h>
> +
> +#include <asm/cacheflush.h>
> +#include <asm/xen/hypercall.h>
> +#include <asm/xen/interface.h>
> +
> +struct xen_p2m_entry {
> +       unsigned long pfn;
> +       unsigned long mfn;
> +       unsigned long nr_pages;
> +       struct rb_node rbnode_phys;
> +};
> +
> +static rwlock_t p2m_lock;
> +struct rb_root phys_to_mach =3D RB_ROOT;
> +EXPORT_SYMBOL_GPL(phys_to_mach);
> +
> +static int xen_add_phys_to_mach_entry(struct xen_p2m_entry *new)
> +{
> +
> +       return 0;
> +}
> +
> +unsigned long __pfn_to_mfn(unsigned long pfn)
> +{
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(__pfn_to_mfn);
> +
> +int set_foreign_p2m_mapping(struct gnttab_map_grant_ref *map_ops,
> +                                       struct gnttab_map_grant_ref *kmap=
_ops,
> +                                       struct page **pages, unsigned int=
 count)
> +{
> +       return 0;
> +}
> +
> +int clear_foreign_p2m_mapping(struct gnttab_unmap_grant_ref *unmap_ops,
> +                                       struct gnttab_unmap_grant_ref *ku=
nmap_ops,
> +                                       struct page **pages, unsigned int=
 count)
> +{
> +       return 0;
> +}
> +
> +bool __set_phys_to_machine_multi(unsigned long pfn,
> +                                       unsigned long mfn, unsigned long =
nr_pages)
> +{
> +       return true;
> +}
> +EXPORT_SYMBOL_GPL(__set_phys_to_machine_multi);
> +
> +bool __set_phys_to_machine(unsigned long pfn, unsigned long mfn)
> +{
> +       return true;
> +}
> +EXPORT_SYMBOL_GPL(__set_phys_to_machine);
> +
> +static int p2m_init(void)
> +{
> +       return 0;
> +}
> +arch_initcall(p2m_init);
> diff --git a/include/xen/interface/io/protocols.h b/include/xen/interface=
/io/protocols.h
> index 22099bb4079f..6c6317462be0 100644
> --- a/include/xen/interface/io/protocols.h
> +++ b/include/xen/interface/io/protocols.h
> @@ -6,6 +6,7 @@
>  #define XEN_IO_PROTO_ABI_X86_64     "x86_64-abi"
>  #define XEN_IO_PROTO_ABI_POWERPC64  "powerpc64-abi"
>  #define XEN_IO_PROTO_ABI_ARM        "arm-abi"
> +#define XEN_IO_PROTO_ABI_RISCV      "riscv-abi"
>
>  #if defined(__i386__)
>  # define XEN_IO_PROTO_ABI_NATIVE XEN_IO_PROTO_ABI_X86_32
> @@ -15,6 +16,8 @@
>  # define XEN_IO_PROTO_ABI_NATIVE XEN_IO_PROTO_ABI_POWERPC64
>  #elif defined(__arm__) || defined(__aarch64__)
>  # define XEN_IO_PROTO_ABI_NATIVE XEN_IO_PROTO_ABI_ARM
> +#elif defined(__riscv)
> +# define XEN_IO_PROTO_ABI_NATIVE XEN_IO_PROTO_ABI_RISCV
>  #else
>  # error arch fixup needed here
>  #endif
> diff --git a/include/xen/riscv/hypercall.h b/include/xen/riscv/hypercall.=
h
> new file mode 100644
> index 000000000000..f76d8a018f26
> --- /dev/null
> +++ b/include/xen/riscv/hypercall.h
> @@ -0,0 +1,71 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/***********************************************************************=
*******
> + * hypercall.h
> + *
> + * Linux-specific hypervisor handling.
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License version 2
> + * as published by the Free Software Foundation; or, when distributed
> + * separately from the Linux kernel or incorporated into other
> + * software packages, subject to the following license:
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
> + * of this source file (the "Software"), to deal in the Software without
> + * restriction, including without limitation the rights to use, copy, mo=
dify,
> + * merge, publish, distribute, sublicense, and/or sell copies of the Sof=
tware,
> + * and to permit persons to whom the Software is furnished to do so, sub=
ject to
> + * the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be includ=
ed in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL THE
> + * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHE=
R
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER D=
EALINGS
> + * IN THE SOFTWARE.
> + */
> +
> +#ifndef _ASM_RISCV_XEN_HYPERCALL_H
> +#define _ASM_RISCV_XEN_HYPERCALL_H
> +
> +#include <linux/bug.h>
> +
> +#include <xen/interface/xen.h>
> +#include <xen/interface/sched.h>
> +#include <xen/interface/platform.h>
> +
> +struct xen_dm_op_buf;
> +
> +long privcmd_call(unsigned int call, unsigned long a1,
> +               unsigned long a2, unsigned long a3,
> +               unsigned long a4, unsigned long a5);
> +int HYPERVISOR_xen_version(int cmd, void *arg);
> +int HYPERVISOR_console_io(int cmd, int count, char *str);
> +int HYPERVISOR_grant_table_op(unsigned int cmd, void *uop, unsigned int =
count);
> +int HYPERVISOR_sched_op(int cmd, void *arg);
> +int HYPERVISOR_event_channel_op(int cmd, void *arg);
> +unsigned long HYPERVISOR_hvm_op(int op, void *arg);
> +int HYPERVISOR_memory_op(unsigned int cmd, void *arg);
> +int HYPERVISOR_physdev_op(int cmd, void *arg);
> +int HYPERVISOR_vcpu_op(int cmd, int vcpuid, void *extra_args);
> +int HYPERVISOR_vm_assist(unsigned int cmd, unsigned int type);
> +int HYPERVISOR_dm_op(domid_t domid, unsigned int nr_bufs,
> +                        struct xen_dm_op_buf *bufs);
> +int HYPERVISOR_platform_op_raw(void *arg);
> +static inline int HYPERVISOR_platform_op(struct xen_platform_op *op)
> +{
> +       return 0;
> +}
> +int HYPERVISOR_multicall(struct multicall_entry *calls, uint32_t nr);
> +
> +static inline int
> +HYPERVISOR_suspend(unsigned long start_info_mfn)
> +{
> +       return 0;
> +}
> +
> +#endif /* _ASM_RISCV_XEN_HYPERCALL_H */
> diff --git a/include/xen/riscv/hypervisor.h b/include/xen/riscv/hyperviso=
r.h
> new file mode 100644
> index 000000000000..2c1f9625be80
> --- /dev/null
> +++ b/include/xen/riscv/hypervisor.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_RISCV_XEN_HYPERVISOR_H
> +#define _ASM_RISCV_XEN_HYPERVISOR_H
> +
> +#include <linux/init.h>
> +
> +extern struct shared_info *HYPERVISOR_shared_info;
> +extern struct start_info *xen_start_info;
> +
> +#ifdef CONFIG_XEN
> +void __init xen_early_init(void);
> +#else
> +static inline void xen_early_init(void) { return; }
> +#endif
> +
> +#ifdef CONFIG_HOTPLUG_CPU
> +static inline void xen_arch_register_cpu(int num)
> +{
> +}
> +
> +static inline void xen_arch_unregister_cpu(int num)
> +{
> +}
> +#endif
> +
> +#endif /* _ASM_RISCV_XEN_HYPERVISOR_H */
> diff --git a/include/xen/riscv/interface.h b/include/xen/riscv/interface.=
h
> new file mode 100644
> index 000000000000..6769b5b39cba
> --- /dev/null
> +++ b/include/xen/riscv/interface.h
> @@ -0,0 +1,85 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/***********************************************************************=
*******
> + * Guest OS interface to RISCV Xen.
> + *
> + */
> +
> +#ifndef _ASM_RISCV_XEN_INTERFACE_H
> +#define _ASM_RISCV_XEN_INTERFACE_H
> +
> +#include <linux/types.h>
> +
> +#define uint64_aligned_t uint64_t __aligned(8)
> +
> +#define __DEFINE_GUEST_HANDLE(name, type) \
> +       typedef struct { union { type * p; uint64_aligned_t q; }; }  \
> +               __guest_handle_ ## name
> +
> +#define DEFINE_GUEST_HANDLE_STRUCT(name) \
> +       __DEFINE_GUEST_HANDLE(name, struct name)
> +#define DEFINE_GUEST_HANDLE(name) __DEFINE_GUEST_HANDLE(name, name)
> +#define GUEST_HANDLE(name)        __guest_handle_ ## name
> +
> +#define set_xen_guest_handle(hnd, val)                 \
> +       do {                                            \
> +               if (sizeof(hnd) =3D=3D 8)                   \
> +                       *(uint64_t *)&(hnd) =3D 0;        \
> +               (hnd).p =3D val;                          \
> +       } while (0)
> +
> +#define __HYPERVISOR_platform_op_raw __HYPERVISOR_platform_op
> +
> +#ifndef __ASSEMBLY__
> +/* Explicitly size integers that represent pfns in the interface with
> + * Xen so that we can have one ABI that works for 32 and 64 bit guests.
> + * Note that this means that the xen_pfn_t type may be capable of
> + * representing pfn's which the guest cannot represent in its own pfn
> + * type. However since pfn space is controlled by the guest this is
> + * fine since it simply wouldn't be able to create any sure pfns in
> + * the first place.
> + */
> +typedef uint64_t xen_pfn_t;
> +#define PRI_xen_pfn "llx"
> +typedef uint64_t xen_ulong_t;
> +#define PRI_xen_ulong "llx"
> +typedef int64_t xen_long_t;
> +#define PRI_xen_long "llx"
> +/* Guest handles for primitive C types. */
> +__DEFINE_GUEST_HANDLE(uchar, unsigned char);
> +__DEFINE_GUEST_HANDLE(uint,  unsigned int);
> +DEFINE_GUEST_HANDLE(char);
> +DEFINE_GUEST_HANDLE(int);
> +DEFINE_GUEST_HANDLE(void);
> +DEFINE_GUEST_HANDLE(uint64_t);
> +DEFINE_GUEST_HANDLE(uint32_t);
> +DEFINE_GUEST_HANDLE(xen_pfn_t);
> +DEFINE_GUEST_HANDLE(xen_ulong_t);
> +
> +/* Maximum number of virtual CPUs in multi-processor guests. */
> +#define MAX_VIRT_CPUS 1
> +
> +struct arch_vcpu_info { };
> +struct arch_shared_info { };
> +
> +/* TODO: Move pvclock definitions some place arch independent */
> +struct pvclock_vcpu_time_info {
> +       u32   version;
> +       u32   pad0;
> +       u64   tsc_timestamp;
> +       u64   system_time;
> +       u32   tsc_to_system_mul;
> +       s8    tsc_shift;
> +       u8    flags;
> +       u8    pad[2];
> +} __packed; /* 32 bytes */
> +
> +/* It is OK to have a 12 bytes struct with no padding because it is pack=
ed */
> +struct pvclock_wall_clock {
> +       u32   version;
> +       u32   sec;
> +       u32   nsec;
> +       u32   sec_hi;
> +} __packed;
> +#endif
> +
> +#endif /* _ASM_RISCV_XEN_INTERFACE_H */
> diff --git a/include/xen/riscv/page.h b/include/xen/riscv/page.h
> new file mode 100644
> index 000000000000..fe07a9bffa7e
> --- /dev/null
> +++ b/include/xen/riscv/page.h
> @@ -0,0 +1,106 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_RISCV_XEN_PAGE_H
> +#define _ASM_RISCV_XEN_PAGE_H
> +
> +#include <asm/page.h>
> +
> +#include <linux/pfn.h>
> +#include <linux/types.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/pgtable.h>
> +
> +#include <xen/xen.h>
> +#include <xen/interface/grant_table.h>
> +
> +/* Xen machine address */
> +struct xmaddr {
> +       phys_addr_t maddr;
> +};
> +
> +/* Xen pseudo-physical address */
> +struct xpaddr {
> +       phys_addr_t paddr;
> +};
> +
> +#define XMADDR(x)      ((struct xmaddr) { .maddr =3D (x) })
> +#define XPADDR(x)      ((struct xpaddr) { .paddr =3D (x) })
> +
> +#define INVALID_P2M_ENTRY      (~0UL)
> +
> +/*
> + * The pseudo-physical frame (pfn) used in all the helpers is always bas=
ed
> + * on Xen page granularity (i.e 4KB).
> + *
> + * A Linux page may be split across multiple non-contiguous Xen page so =
we
> + * have to keep track with frame based on 4KB page granularity.
> + *
> + * PV drivers should never make a direct usage of those helpers (particu=
larly
> + * pfn_to_gfn and gfn_to_pfn).
> + */
> +
> +unsigned long __pfn_to_mfn(unsigned long pfn);
> +extern struct rb_root phys_to_mach;
> +
> +/* Pseudo-physical <-> Guest conversion */
> +static inline unsigned long pfn_to_gfn(unsigned long pfn)
> +{
> +       return 0;
> +}
> +
> +static inline unsigned long gfn_to_pfn(unsigned long gfn)
> +{
> +       return 0;
> +}
> +
> +/* Pseudo-physical <-> BUS conversion */
> +static inline unsigned long pfn_to_bfn(unsigned long pfn)
> +{
> +       return 0;
> +}
> +
> +static inline unsigned long bfn_to_pfn(unsigned long bfn)
> +{
> +       return 0;
> +}
> +
> +#define bfn_to_local_pfn(bfn)  bfn_to_pfn(bfn)
> +
> +/* VIRT <-> GUEST conversion */
> +#define virt_to_gfn(v)                                                  =
       \
> +       ({                                                               =
      \
> +               WARN_ON_ONCE(!virt_addr_valid(v));                       =
       \
> +               pfn_to_gfn(virt_to_phys(v) >> XEN_PAGE_SHIFT);           =
      \
> +       })
> +#define gfn_to_virt(m)         (__va(gfn_to_pfn(m) << XEN_PAGE_SHIFT))
> +
> +#define percpu_to_gfn(v)       \
> +       (pfn_to_gfn(per_cpu_ptr_to_phys(v) >> XEN_PAGE_SHIFT))
> +
> +static inline struct xmaddr arbitrary_virt_to_machine(void *vaddr)
> +{
> +       WARN_ON_ONCE(1);
> +       return (struct xmaddr){0};
> +}
> +
> +extern int set_foreign_p2m_mapping(struct gnttab_map_grant_ref *map_ops,
> +                                  struct gnttab_map_grant_ref *kmap_ops,
> +                                  struct page **pages, unsigned int coun=
t);
> +
> +extern int clear_foreign_p2m_mapping(struct gnttab_unmap_grant_ref *unma=
p_ops,
> +                                        struct gnttab_unmap_grant_ref *k=
unmap_ops,
> +                                        struct page **pages, unsigned in=
t count);
> +
> +bool __set_phys_to_machine(unsigned long pfn, unsigned long mfn);
> +bool __set_phys_to_machine_multi(unsigned long pfn, unsigned long mfn,
> +               unsigned long nr_pages);
> +
> +static inline bool set_phys_to_machine(unsigned long pfn, unsigned long =
mfn)
> +{
> +       return 0;
> +}
> +
> +bool xen_arch_need_swiotlb(struct device *dev,
> +                          phys_addr_t phys,
> +                          dma_addr_t dev_addr);
> +
> +#endif /* _ASM_RISCV_XEN_PAGE_H */
> diff --git a/include/xen/riscv/swiotlb-xen.h b/include/xen/riscv/swiotlb-=
xen.h
> new file mode 100644
> index 000000000000..97ecd8cbbc2d
> --- /dev/null
> +++ b/include/xen/riscv/swiotlb-xen.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_RISCV_SWIOTLB_XEN_H
> +#define _ASM_RISCV_SWIOTLB_XEN_H
> +
> +#include <xen/features.h>
> +#include <xen/xen.h>
> +
> +static inline int xen_swiotlb_detect(void)
> +{
> +       return 0;
> +}
> +
> +#endif /* _ASM_RISCV_SWIOTLB_XEN_H */
> diff --git a/test.txt b/test.txt
> new file mode 100644
> index 000000000000..e54267998982
> --- /dev/null
> +++ b/test.txt
> @@ -0,0 +1,21 @@
> +WARNING: added, moved or deleted file(s), does MAINTAINERS need updating=
?
> +#120:
> +new file mode 100644
> +
> +WARNING: do not add new typedefs
> +#808: FILE: include/xen/riscv/interface.h:15:
> ++      typedef struct { union { type * p; uint64_aligned_t q; }; }  \
> +
> +WARNING: please, no spaces at the start of a line
> +#1006: FILE: include/xen/riscv/swiotlb-xen.h:10:
> ++    return 0;$
> +
> +total: 0 errors, 3 warnings, 810 lines checked
> +
> +NOTE: For some of the reported defects, checkpatch may be able to
> +      mechanically convert to the typical style using --fix or --fix-inp=
lace.
> +
> +0001-riscv-Add-initial-Xen-guest-support-for-RISC-V.patch has style prob=
lems, please review.
> +
> +NOTE: If any of the errors are false positives, please report
> +      them to the maintainer, see CHECKPATCH in MAINTAINERS.
> --
> 2.43.0
>
>

