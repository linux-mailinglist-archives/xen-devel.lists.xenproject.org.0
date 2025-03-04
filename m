Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65834A4DD8D
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 13:10:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901029.1309009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpR5u-0004hy-3h; Tue, 04 Mar 2025 12:09:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901029.1309009; Tue, 04 Mar 2025 12:09:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpR5u-0004eq-0m; Tue, 04 Mar 2025 12:09:54 +0000
Received: by outflank-mailman (input) for mailman id 901029;
 Tue, 04 Mar 2025 12:09:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7o8j=VX=gmail.com=milandjokic1995@srs-se1.protection.inumbo.net>)
 id 1tpR5s-0004ei-07
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 12:09:52 +0000
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [2607:f8b0:4864:20::f36])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91a16ec9-f8f1-11ef-9898-31a8f345e629;
 Tue, 04 Mar 2025 13:09:49 +0100 (CET)
Received: by mail-qv1-xf36.google.com with SMTP id
 6a1803df08f44-6e89959f631so43456876d6.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Mar 2025 04:09:49 -0800 (PST)
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
X-Inumbo-ID: 91a16ec9-f8f1-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741090188; x=1741694988; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rCyL6XC6uATC8Ni3C6ouha8bmSdOMrPoTX4ZETOq0E8=;
        b=SOFPuZ3gXj8/XS7NMK15rJjAWzSRmKZuQ9umw/Ztki9/RC5f7QSUbkMRC3LHGtgfj0
         8q68XfAEztNsT1C4r7h87krj5d1SECbLXRvAhEJ8EoARsd/gZY03K2q2hwg4IiH0Ho3f
         LlCpTZu7oCdj/hkl2Pe8Zwhqv1kAszvcVVwccg76lVT+c1n2jGjTMuiHhT5rGvXmXFEB
         5rF4p0QggB0iig3BDxkH01qzDlBD1kvC1VTC1/o9tTHdpcLsfe5QA61var8rpoomdc3J
         D3iU2SS8uFZGmUrhk892A8z+KkUSZDBPzgg5cRwoZ1BL/g9RlqNz0I9cwhiaEizJ8h3B
         0mkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741090188; x=1741694988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rCyL6XC6uATC8Ni3C6ouha8bmSdOMrPoTX4ZETOq0E8=;
        b=p6DkE1Ptgx4CWGKEmZAgfdzz1JvUH3EHN/e0iYRkSdWonC4mbAHANj4kjK7GceJtX/
         5X91z26CjeeZdonLdpxlKeHw5lABRxWSm6KF2EQMwhEan6nbo7sSQXFXSjMFMC1tte2l
         FqIMzgEsXuM6bZUH5FimUpaAxexUnSxOUeoXoSXe9cVwSYcpuGCRqpz6aYi/lO+hsEO1
         33vqBnUaFadwGhwS5GMKBzkHYswfK/RCXS22YtwPUqXa6Rsx7IZtMcPycg4Jh5r+pXg5
         f8C7OgFgc1mERIbCvLVl6VpbNPvqRy4O16ps/4i5V9U8CxcHSjlR/6THkC0Ssv5UAIjY
         mu6Q==
X-Gm-Message-State: AOJu0Yw/f1Pr0uwcHgalrWaAZxOFDCEZL7m0/RKC1tE9Qu55IgPtRlnN
	ZT9TZ9KLlRmFtsWaMX3aFZ0floZx/2jQDNDN6NJ4/J50jmFL3XWf28dtuyRBOc6kH7dzdExjRhf
	g5F/b86/AGhQHpAKscVqBcnR3ZUc=
X-Gm-Gg: ASbGncsHS26uzUlakpj0Ux3wfdilBFgTWLzhSwJmj4WVwY54JLkIf9pQs4VL/8Dbmip
	vAmlp950hJVTNW62PhGaDZSwkoMf3TORj5gTC5ELK05ZZLDb/WpOQNxEnOmYIvaUUMwTSS9/JVx
	3Q9rgR+yFggaFYFSMoN6895uVwwQ==
X-Google-Smtp-Source: AGHT+IH8elg+gCT25xDtdAm+zz0MQTZGMsffD7e/jdtlCUiZQr3DCt2WStyX95YSFiNVfnYa8/jqAgqBYo7OnhXgWl8=
X-Received: by 2002:a05:6214:2462:b0:6e2:43d1:5fec with SMTP id
 6a1803df08f44-6e8a0d6d85dmr242942396d6.33.1741090188185; Tue, 04 Mar 2025
 04:09:48 -0800 (PST)
MIME-Version: 1.0
References: <dae753618491b2a6e42f7ed3f24190d0dc13fe3f.1740754166.git.Slavisa.Petrovic@rt-rk.com>
 <1b71b063-1f1d-4cd0-be06-0ba3908027e6@gmail.com>
In-Reply-To: <1b71b063-1f1d-4cd0-be06-0ba3908027e6@gmail.com>
From: =?UTF-8?B?TWlsYW4gxJBva2nEhw==?= <milandjokic1995@gmail.com>
Date: Tue, 4 Mar 2025 13:09:35 +0100
X-Gm-Features: AQ5f1JpZZ3u9RX4J-0RPGCqux1ImsT4JmEd2q-QYVdnF8Ic9b5pe9A0xvF9oyCo
Message-ID: <CAKp59VHngx=DaHYdb8nYNNbmd5_s5FejShX2xwFFz1KVmPB_vw@mail.gmail.com>
Subject: Re: [PATCH] xen/riscv: copy_to_guest/copy_from_guest functionality.
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
	Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Milan Djokic <Milan.Djokic@rt-rk.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Oleksii,
On Fri, Feb 28, 2025 at 5:03=E2=80=AFPM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
>
> On 2/28/25 3:59 PM, Milan Djokic wrote:
>
> From: Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>
>
> This patch implements copy_to_guest/copy_from_guest functions for RISC-V.
> These functions are designed to facilitate data exchange between guest an=
d hypervisor.
>
> Signed-off-by: Milan Djokic <Milan.Djokic@rt-rk.com>
> Signed-off-by: Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>
> ---
> Tested on qemu with xcp-ng latest branch https://gitlab.com/xen-project/p=
eople/olkur/xen/-/merge_requests/6
> Full description on how to setup test environment can be found in attache=
d PR link (Linux kernel patching to support copy_from_guest/copy_to_guest f=
or RISC-V).
> Linux kernel patch shall be upstreamed after these changes are merged.
> ---
>  xen/arch/riscv/Makefile                   |  1 +
>  xen/arch/riscv/addr_translation.S         | 63 +++++++++++++++++++++++
>  xen/arch/riscv/arch.mk                    |  6 ++-
>  xen/arch/riscv/guestcopy.c                | 43 ++++++++++++++++
>  xen/arch/riscv/include/asm/guest_access.h |  5 ++
>  5 files changed, 117 insertions(+), 1 deletion(-)
>  create mode 100644 xen/arch/riscv/addr_translation.S
>  create mode 100644 xen/arch/riscv/guestcopy.c
>
> diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> index a5eb2aed4b..1bd61cc993 100644
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -10,6 +10,7 @@ obj-y +=3D smp.o
>  obj-y +=3D stubs.o
>  obj-y +=3D traps.o
>  obj-y +=3D vm_event.o
> +obj-y +=3D addr_translation.o
>
> It should be sorted in alphabetical order.
>
Will be updated in next version

>
>  $(TARGET): $(TARGET)-syms
>   $(OBJCOPY) -O binary -S $< $@
> diff --git a/xen/arch/riscv/addr_translation.S b/xen/arch/riscv/addr_tran=
slation.S
> new file mode 100644
> index 0000000000..7e94774b47
> --- /dev/null
> +++ b/xen/arch/riscv/addr_translation.S
> @@ -0,0 +1,63 @@
> +#include <asm/riscv_encoding.h>
> +#include <asm/asm.h>
> +
> +.macro add_extable lbl
> +.pushsection .extable, "a"     /* Start .extable section */
> +.balign      8                 /* Align to 8 bytes */
> +.quad        \lbl              /* Add label address to extable */
> +.popsection                    /* End section */
> +.endm
> +
> +.section .text
> +
> +/*
> + * size_t _copy_to(uint64_t dest, const void *src, size_t len)
> + *
> + * a0 - dest
> + * a1 - src
> + * a2 - len
> + *
> + */
> +
> +.global _copy_to
> +_copy_to:
> +    la    t0, copy_done             /* Load address of return label */
> +    mv    t2, zero                  /* Initialize counter to zero */
> +loop_check:
> +    beq   t2, a2, copy_done         /* Check if all bytes are copied */
> +    lb    t3, (a1)                  /* Load byte from source (guest addr=
ess) */
> +store_byte:
> +    hsv.b t3, (a0)                  /* Store byte to destination (host a=
ddress) */
> +    add_extable store_byte          /* Add exception table for this loca=
tion */
> +    addi  a0, a0, 1                 /* Increment destination pointer */
> +    addi  a1, a1, 1                 /* Increment source pointer */
> +    addi  t2, t2, 1                 /* Increment byte counter */
> +    j     loop_check                /* Loop back if not done */
> +
> +/*
> + * size_t _copy_from(void *dest, uint64_t src, size_t len)
> + *
> + * a0 - dest
> + * a1 - src
> + * a2 - len
> + *
> + */
> +
> +.global _copy_from
> +_copy_from:
> +    la    t0, copy_done
> +    mv    t2, zero
> +loop_check_from:
> +    beq   t2, a2, copy_done
> +load_byte:
> +    hlv.b t3, (a1)                  /* Load byte from guest address */
> +    add_extable load_byte
> +    sb    t3, (a0)
> +    addi  a0, a0, 1
> +    addi  a1, a1, 1
> +    addi  t2, t2, 1
> +    j     loop_check_from
> +
> +copy_done:
> +    mv    a0, t2                    /* Return number of bytes copied */
> +    ret
>
> Can't we done this functions fully in C? (it doesn't something mandatory)
>
Yes, we have changed this part to be completely handled in C

> diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
> index 17827c302c..f4098f5b5e 100644
> --- a/xen/arch/riscv/arch.mk
> +++ b/xen/arch/riscv/arch.mk
> @@ -23,13 +23,17 @@ $(eval $(1) :=3D \
>   $(call as-insn,$(CC) $(riscv-generic-flags)_$(1),$(value $(1)-insn),_$(=
1)))
>  endef
>
> +h-extension-name :=3D $(call cc-ifversion,-lt,1301, hh, h)
> +$(h-extension-name)-insn :=3D "hfence.gvma"
> +$(call check-extension,$(h-extension-name))
> +
>  zbb-insn :=3D "andn t0$(comma)t0$(comma)t0"
>  $(call check-extension,zbb)
>
>  zihintpause-insn :=3D "pause"
>  $(call check-extension,zihintpause)
>
> -extensions :=3D $(zbb) $(zihintpause)
> +extensions :=3D $(value $(h-extension-name)) $(zbb) $(zihintpause)
>
>  extensions :=3D $(subst $(space),,$(extensions))
>
> This patch should take into account another one patch series ( https://lo=
re.kernel.org/xen-devel/cover.1740071755.git.oleksii.kurochko@gmail.com/T/#=
t)
> update for which I am going to sent today.
>
> Also, these changes would be better to move into separate commit with exp=
lanation why what is so specific with 1301 and why it is needed to introduc=
e
> 'hh'.
> I believe that these changes were taken based on my patch: https://gitlab=
.com/xen-project/people/olkur/xen/-/commit/154f75e943f1668dbf2c7be0f0fdff5b=
30132e89
> Probably it will make sense just to get it and rebase on top of mentioned=
 above patch series.
>
Yes, it is based on your patch. Sorry, I was not aware that you
already have an active patch series which contains this part.
In that case we'll wait for your patch series to be merged first. And
we'll split it into 2 commits where first one will only introduce h
extension handling in arch.mk and the second one with
copy_from/to_guest functionallity

>
> diff --git a/xen/arch/riscv/guestcopy.c b/xen/arch/riscv/guestcopy.c
> new file mode 100644
> index 0000000000..0325956845
> --- /dev/null
> +++ b/xen/arch/riscv/guestcopy.c
> @@ -0,0 +1,43 @@
> +#include <xen/bug.h>
> +#include <xen/domain_page.h>
> +#include <xen/errno.h>
> +#include <xen/sched.h>
> +
> +#include <asm/csr.h>
> +#include <asm/guest_access.h>
> +#include <asm/system.h>
> +#include <asm/traps.h>
> +
> +unsigned long copy_to(uint64_t dest, void* src, size_t len)
> +{
> +    size_t bytes;
> +
> +    bytes =3D _copy_to(dest, src, len);
> +
> +    if (bytes =3D=3D len)
> +        return 0;
> +    else
> +        return -ENOSYS;
> +}
>
> Why do we have a different prototypes with copy_from() below? If we will =
have
> void *dest then ...
>
> +
> +unsigned long copy_from(void *dest, uint64_t src, size_t len)
> +{
> +    size_t bytes;
> +
> +    bytes =3D _copy_from(dest, src, len);
> +
> +    if (bytes =3D=3D len)
> +        return 0;
> +    else
> +        return -ENOSYS;
> +}
> +
> +unsigned long raw_copy_to_guest(void *to, const void *from, unsigned len=
)
> +{
> +    return copy_to((vaddr_t)to, (void *)from, len);
>
> ... we won't need cast for `to` and wo we really need cast for copy_to()?=
 Why `const` is
> dropped when passed to copy_to()?
>
These are just mismatches (prototype and const drop), fixed for the
next version.

BR,
Milan

