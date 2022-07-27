Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4192582082
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 08:54:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375921.608406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGav8-00056B-2T; Wed, 27 Jul 2022 06:53:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375921.608406; Wed, 27 Jul 2022 06:53:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGav7-000532-VL; Wed, 27 Jul 2022 06:53:25 +0000
Received: by outflank-mailman (input) for mailman id 375921;
 Wed, 27 Jul 2022 06:53:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DBP9=YA=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1oGav5-00052w-PT
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 06:53:24 +0000
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [2607:f8b0:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc02e944-0d78-11ed-bd2d-47488cf2e6aa;
 Wed, 27 Jul 2022 08:53:19 +0200 (CEST)
Received: by mail-pg1-x52b.google.com with SMTP id h132so15149909pgc.10
 for <xen-devel@lists.xenproject.org>; Tue, 26 Jul 2022 23:53:19 -0700 (PDT)
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
X-Inumbo-ID: cc02e944-0d78-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=txeBvpRYndVIAGQRHJPi4zzoJCMmBPS2I42xMV3xNg4=;
        b=J2OrxZGh5TlAeN/3R9+sKkG4PoYZOEXCRa8dZui0QbDoFyNFfuNM9HPwo4vwPcFN8O
         Ynd6kGKFqHItAKgNPxkQMRQa+i/0bn5ycwUQ78STNc1VpuqP28d7+y5167BuV35H/FHv
         thZ6Mawlxbj11Q19GpEspcgcUnXsHXsE3lWeDzO+eiq2DYR82ubh2hp5HExJAdQIIwaC
         hd8epCIF+CkESvgITuWVwVeXCm4ap+xGddug5BLDml1o1XGACkk8YjkgJtoyPT4CFG/a
         km3+1YqMG1b+KZCF9ME00TqM/CNs0PPJBOV0Lku/CapPSgaXVgeF7lMSnuty75dYCStu
         k21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=txeBvpRYndVIAGQRHJPi4zzoJCMmBPS2I42xMV3xNg4=;
        b=Nw0028SOr8nUqplts784KVKTZzzxGvCxbYCf1YaGnZeMEjyuuJYmfSKsgPZat261MR
         E5+sWnjg/90TNPQq1SZj0wJcy8qwqn3l7viURSutze2mW7MVNToC0Fkyt8k4AXbLTbTq
         ScZgcWBS/7g40Y36WxxJcHJSxsz/jwX5GuBwFiGMNjHI3q1sbhzN1P87fogmMfY3y7k+
         qGZIU4fLu5WnrY967jRBP44YBJmzUP5biBmPDi+rZ6TkkyZZXaB1aOMJBPwoS9z3JkqH
         WauEgH/5rWFLUUxEqU7F5M9EpMx0gRaUl4b6FSlICfkSQtLI9qQOycM8uV4DFsP7IUZv
         Ua3A==
X-Gm-Message-State: AJIora+SYS8Bt+A3yjPLOwC9kGyGn7W/Ma6cz/Uts0Lk34by/QVjtLMt
	bw0rbXTT4wHpZJurD82mepNu35bJaepbJNPxshEBdg==
X-Google-Smtp-Source: AGRyM1sZaxgMvQCoJ745oTSUqAITjfq5yQ9JhRJrE06lLJIhWu2TV6h6Vypslfa15U8d+tmvSFMSVucQX5SfBzqI0tI=
X-Received: by 2002:a63:e102:0:b0:41b:3901:990e with SMTP id
 z2-20020a63e102000000b0041b3901990emr3389084pgh.107.1658904797840; Tue, 26
 Jul 2022 23:53:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220622134219.1596613-1-jens.wiklander@linaro.org>
 <20220622134219.1596613-3-jens.wiklander@linaro.org> <2E5B1159-9569-40D9-9BA1-92022378B9C6@arm.com>
In-Reply-To: <2E5B1159-9569-40D9-9BA1-92022378B9C6@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 27 Jul 2022 08:53:06 +0200
Message-ID: <CAHUa44GpP+UbunaAN62GFFt3HQdHK=_B1zqt1=fXkftGnyGs4A@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] xen/arm: add FF-A mediator
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"

Hi Bertrand,

On Thu, Jul 14, 2022 at 11:51 AM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 22 Jun 2022, at 14:42, Jens Wiklander <jens.wiklander@linaro.org> wrote:
> >
> > Adds a FF-A version 1.1 [1] mediator to communicate with a Secure
> > Partition in secure world.
> >
> > The implementation is the bare minimum to be able to communicate with
> > OP-TEE running as an SPMC at S-EL1.
> >
> > This is loosely based on the TEE mediator framework and the OP-TEE
> > mediator.
> >
> > [1] https://developer.arm.com/documentation/den0077/latest
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
>
> I spent quite some time on this patch and on the spec and there are far to
> much code and concepts introduced here to be able to do a review in one go.
>
> Could you try to split the patch to introduce each concept in a specific patch ?
> I would suggest something like introducing each call in its own patch, having
> a specific patch for the tool support, etc.
>
> At this stage I am not convinced that there is no issue here where a guest could
> access information from an other guest and reviewing smaller patches will help
> me following the spec for each subject and ask questions along the way.

OK, I'll try to split it up a bit in the next version.

Cheers,
Jens

>
> Cheers
> Bertrand
>
> > ---
> > SUPPORT.md                        |    7 +
> > tools/libs/light/libxl_arm.c      |    3 +
> > tools/libs/light/libxl_types.idl  |    1 +
> > tools/xl/xl_parse.c               |    3 +
> > xen/arch/arm/Kconfig              |   11 +
> > xen/arch/arm/Makefile             |    1 +
> > xen/arch/arm/domain.c             |   10 +
> > xen/arch/arm/domain_build.c       |    1 +
> > xen/arch/arm/ffa.c                | 1683 +++++++++++++++++++++++++++++
> > xen/arch/arm/include/asm/domain.h |    4 +
> > xen/arch/arm/include/asm/ffa.h    |   71 ++
> > xen/arch/arm/vsmc.c               |   17 +-
> > xen/include/public/arch-arm.h     |    2 +
> > 13 files changed, 1811 insertions(+), 3 deletions(-)
> > create mode 100644 xen/arch/arm/ffa.c
> > create mode 100644 xen/arch/arm/include/asm/ffa.h
> >
> > diff --git a/SUPPORT.md b/SUPPORT.md
> > index 70e98964cbc0..215bb3c9043b 100644
> > --- a/SUPPORT.md
> > +++ b/SUPPORT.md
> > @@ -785,6 +785,13 @@ that covers the DMA of the device to be passed through.
> >
> > No support for QEMU backends in a 16K or 64K domain.
> >
> > +### ARM: Firmware Framework for Arm A-profile (FF-A) Mediator
> > +
> > +    Status, Arm64: Tech Preview
> > +
> > +There are still some code paths where a vCPU may hog a pCPU longer than
> > +necessary. The FF-A mediator is not yet implemented for Arm32.
> > +
> > ### ARM: Guest Device Tree support
> >
> >     Status: Supported
> > diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> > index eef1de093914..a985609861c7 100644
> > --- a/tools/libs/light/libxl_arm.c
> > +++ b/tools/libs/light/libxl_arm.c
> > @@ -101,6 +101,9 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
> >         return ERROR_FAIL;
> >     }
> >
> > +    config->arch.ffa_enabled =
> > +        libxl_defbool_val(d_config->b_info.arch_arm.ffa_enabled);
> > +
> >     return 0;
> > }
> >
> > diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> > index 2a42da2f7d78..bf4544bef399 100644
> > --- a/tools/libs/light/libxl_types.idl
> > +++ b/tools/libs/light/libxl_types.idl
> > @@ -646,6 +646,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
> >
> >     ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
> >                                ("vuart", libxl_vuart_type),
> > +                               ("ffa_enabled", libxl_defbool),
> >                               ])),
> >     ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
> >                               ])),
> > diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> > index b98c0de378b6..e0e99ed8d2b1 100644
> > --- a/tools/xl/xl_parse.c
> > +++ b/tools/xl/xl_parse.c
> > @@ -2746,6 +2746,9 @@ skip_usbdev:
> >             exit(-ERROR_FAIL);
> >         }
> >     }
> > +    libxl_defbool_setdefault(&b_info->arch_arm.ffa_enabled, false);
> > +    xlu_cfg_get_defbool(config, "ffa_enabled",
> > +                        &b_info->arch_arm.ffa_enabled, 0);
> >
> >     parse_vkb_list(config, d_config);
> >
> > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> > index be9eff014120..e57e1d3757e2 100644
> > --- a/xen/arch/arm/Kconfig
> > +++ b/xen/arch/arm/Kconfig
> > @@ -139,6 +139,17 @@ config TEE
> >
> > source "arch/arm/tee/Kconfig"
> >
> > +config FFA
> > +     bool "Enable FF-A mediator support" if EXPERT
> > +     default n
> > +     depends on ARM_64
> > +     help
> > +       This option enables a minimal FF-A mediator. The mediator is
> > +       generic as it follows the FF-A specification [1], but it only
> > +       implements a small subset of the specification.
> > +
> > +       [1] https://developer.arm.com/documentation/den0077/latest
> > +
> > endmenu
> >
> > menu "ARM errata workaround via the alternative framework"
> > diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> > index bb7a6151c13c..af0c69f793d4 100644
> > --- a/xen/arch/arm/Makefile
> > +++ b/xen/arch/arm/Makefile
> > @@ -20,6 +20,7 @@ obj-y += domain_build.init.o
> > obj-y += domctl.o
> > obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
> > obj-y += efi/
> > +obj-$(CONFIG_FFA) += ffa.o
> > obj-y += gic.o
> > obj-y += gic-v2.o
> > obj-$(CONFIG_GICV3) += gic-v3.o
> > diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> > index 8110c1df8638..a3f00e7e234d 100644
> > --- a/xen/arch/arm/domain.c
> > +++ b/xen/arch/arm/domain.c
> > @@ -27,6 +27,7 @@
> > #include <asm/cpufeature.h>
> > #include <asm/current.h>
> > #include <asm/event.h>
> > +#include <asm/ffa.h>
> > #include <asm/gic.h>
> > #include <asm/guest_atomics.h>
> > #include <asm/irq.h>
> > @@ -756,6 +757,9 @@ int arch_domain_create(struct domain *d,
> >     if ( (rc = tee_domain_init(d, config->arch.tee_type)) != 0 )
> >         goto fail;
> >
> > +    if ( (rc = ffa_domain_init(d, config->arch.ffa_enabled)) != 0 )
> > +        goto fail;
> > +
> >     update_domain_wallclock_time(d);
> >
> >     /*
> > @@ -998,6 +1002,7 @@ static int relinquish_memory(struct domain *d, struct page_list_head *list)
> > enum {
> >     PROG_pci = 1,
> >     PROG_tee,
> > +    PROG_ffa,
> >     PROG_xen,
> >     PROG_page,
> >     PROG_mapping,
> > @@ -1043,6 +1048,11 @@ int domain_relinquish_resources(struct domain *d)
> >
> >     PROGRESS(tee):
> >         ret = tee_relinquish_resources(d);
> > +        if ( ret )
> > +            return ret;
> > +
> > +    PROGRESS(ffa):
> > +        ret = ffa_relinquish_resources(d);
> >         if (ret )
> >             return ret;
> >
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index 7ddd16c26da5..d708f76356f7 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -3450,6 +3450,7 @@ void __init create_dom0(void)
> >     if ( gic_number_lines() > 992 )
> >         printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\n");
> >     dom0_cfg.arch.tee_type = tee_get_type();
> > +    dom0_cfg.arch.ffa_enabled = true;
> >     dom0_cfg.max_vcpus = dom0_max_vcpus();
> >
> >     if ( iommu_enabled )
> > diff --git a/xen/arch/arm/ffa.c b/xen/arch/arm/ffa.c
> > new file mode 100644
> > index 000000000000..3117ce5cec4d
> > --- /dev/null
> > +++ b/xen/arch/arm/ffa.c
> > @@ -0,0 +1,1683 @@
> > +/*
> > + * xen/arch/arm/ffa.c
> > + *
> > + * Arm Firmware Framework for ARMv8-A (FF-A) mediator
> > + *
> > + * Copyright (C) 2022  Linaro Limited
> > + *
> > + * Permission is hereby granted, free of charge, to any person
> > + * obtaining a copy of this software and associated documentation
> > + * files (the "Software"), to deal in the Software without restriction,
> > + * including without limitation the rights to use, copy, modify, merge,
> > + * publish, distribute, sublicense, and/or sell copies of the Software,
> > + * and to permit persons to whom the Software is furnished to do so,
> > + * subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice shall be
> > + * included in all copies or substantial portions of the Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > + * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> > + * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
> > + * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
> > + * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
> > + * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
> > + * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> > + */
> > +
> > +#include <xen/domain_page.h>
> > +#include <xen/errno.h>
> > +#include <xen/init.h>
> > +#include <xen/lib.h>
> > +#include <xen/sched.h>
> > +#include <xen/types.h>
> > +#include <xen/sizes.h>
> > +#include <xen/bitops.h>
> > +
> > +#include <asm/smccc.h>
> > +#include <asm/event.h>
> > +#include <asm/ffa.h>
> > +#include <asm/regs.h>
> > +
> > +/* Error codes */
> > +#define FFA_RET_OK                   0
> > +#define FFA_RET_NOT_SUPPORTED                -1
> > +#define FFA_RET_INVALID_PARAMETERS   -2
> > +#define FFA_RET_NO_MEMORY            -3
> > +#define FFA_RET_BUSY                 -4
> > +#define FFA_RET_INTERRUPTED          -5
> > +#define FFA_RET_DENIED                       -6
> > +#define FFA_RET_RETRY                        -7
> > +#define FFA_RET_ABORTED                      -8
> > +
> > +/* FFA_VERSION helpers */
> > +#define FFA_VERSION_MAJOR            _AC(1,U)
> > +#define FFA_VERSION_MAJOR_SHIFT              _AC(16,U)
> > +#define FFA_VERSION_MAJOR_MASK               _AC(0x7FFF,U)
> > +#define FFA_VERSION_MINOR            _AC(1,U)
> > +#define FFA_VERSION_MINOR_SHIFT              _AC(0,U)
> > +#define FFA_VERSION_MINOR_MASK               _AC(0xFFFF,U)
> > +#define MAKE_FFA_VERSION(major, minor)       \
> > +     ((((major) & FFA_VERSION_MAJOR_MASK) << FFA_VERSION_MAJOR_SHIFT) | \
> > +      ((minor) & FFA_VERSION_MINOR_MASK))
> > +
> > +#define FFA_MIN_VERSION              MAKE_FFA_VERSION(1, 0)
> > +#define FFA_VERSION_1_0              MAKE_FFA_VERSION(1, 0)
> > +#define FFA_VERSION_1_1              MAKE_FFA_VERSION(1, 1)
> > +#define FFA_MY_VERSION               MAKE_FFA_VERSION(FFA_VERSION_MAJOR, \
> > +                                              FFA_VERSION_MINOR)
> > +
> > +
> > +#define FFA_HANDLE_HYP_FLAG             BIT(63,ULL)
> > +
> > +/* Memory attributes: Normal memory, Write-Back cacheable, Inner shareable */
> > +#define FFA_NORMAL_MEM_REG_ATTR              _AC(0x2f,U)
> > +
> > +/* Memory access permissions: Read-write */
> > +#define FFA_MEM_ACC_RW                       _AC(0x2,U)
> > +
> > +/* Clear memory before mapping in receiver */
> > +#define FFA_MEMORY_REGION_FLAG_CLEAR         BIT(0, U)
> > +/* Relayer may time slice this operation */
> > +#define FFA_MEMORY_REGION_FLAG_TIME_SLICE    BIT(1, U)
> > +/* Clear memory after receiver relinquishes it */
> > +#define FFA_MEMORY_REGION_FLAG_CLEAR_RELINQUISH      BIT(2, U)
> > +
> > +/* Share memory transaction */
> > +#define FFA_MEMORY_REGION_TRANSACTION_TYPE_SHARE (_AC(1,U) << 3)
> > +
> > +#define FFA_HANDLE_INVALID           _AC(0xffffffffffffffff,ULL)
> > +
> > +/* Framework direct request/response */
> > +#define FFA_MSG_FLAG_FRAMEWORK               BIT(31, U)
> > +#define FFA_MSG_TYPE_MASK            _AC(0xFF,U);
> > +#define FFA_MSG_PSCI                 _AC(0x0,U)
> > +#define FFA_MSG_SEND_VM_CREATED              _AC(0x4,U)
> > +#define FFA_MSG_RESP_VM_CREATED              _AC(0x5,U)
> > +#define FFA_MSG_SEND_VM_DESTROYED    _AC(0x6,U)
> > +#define FFA_MSG_RESP_VM_DESTROYED    _AC(0x7,U)
> > +
> > +/*
> > + * Flags used for the FFA_PARTITION_INFO_GET return message:
> > + * BIT(0): Supports receipt of direct requests
> > + * BIT(1): Can send direct requests
> > + * BIT(2): Can send and receive indirect messages
> > + * BIT(3): Supports receipt of notifications
> > + * BIT(4-5): Partition ID is a PE endpoint ID
> > + */
> > +#define FFA_PART_PROP_DIRECT_REQ_RECV   BIT(0,U)
> > +#define FFA_PART_PROP_DIRECT_REQ_SEND   BIT(1,U)
> > +#define FFA_PART_PROP_INDIRECT_MSGS     BIT(2,U)
> > +#define FFA_PART_PROP_RECV_NOTIF        BIT(3,U)
> > +#define FFA_PART_PROP_IS_PE_ID          (_AC(0,U) << 4)
> > +#define FFA_PART_PROP_IS_SEPID_INDEP    (_AC(1,U) << 4)
> > +#define FFA_PART_PROP_IS_SEPID_DEP      (_AC(2,U) << 4)
> > +#define FFA_PART_PROP_IS_AUX_ID         (_AC(3,U) << 4)
> > +#define FFA_PART_PROP_NOTIF_CREATED     BIT(6,U)
> > +#define FFA_PART_PROP_NOTIF_DESTROYED   BIT(7,U)
> > +#define FFA_PART_PROP_AARCH64_STATE     BIT(8,U)
> > +
> > +/* Function IDs */
> > +#define FFA_ERROR                    _AC(0x84000060,U)
> > +#define FFA_SUCCESS_32                       _AC(0x84000061,U)
> > +#define FFA_SUCCESS_64                       _AC(0xC4000061,U)
> > +#define FFA_INTERRUPT                        _AC(0x84000062,U)
> > +#define FFA_VERSION                  _AC(0x84000063,U)
> > +#define FFA_FEATURES                 _AC(0x84000064,U)
> > +#define FFA_RX_ACQUIRE                       _AC(0x84000084,U)
> > +#define FFA_RX_RELEASE                       _AC(0x84000065,U)
> > +#define FFA_RXTX_MAP_32                      _AC(0x84000066,U)
> > +#define FFA_RXTX_MAP_64                      _AC(0xC4000066,U)
> > +#define FFA_RXTX_UNMAP                       _AC(0x84000067,U)
> > +#define FFA_PARTITION_INFO_GET               _AC(0x84000068,U)
> > +#define FFA_ID_GET                   _AC(0x84000069,U)
> > +#define FFA_SPM_ID_GET                       _AC(0x84000085,U)
> > +#define FFA_MSG_WAIT                 _AC(0x8400006B,U)
> > +#define FFA_MSG_YIELD                        _AC(0x8400006C,U)
> > +#define FFA_MSG_RUN                  _AC(0x8400006D,U)
> > +#define FFA_MSG_SEND2                        _AC(0x84000086,U)
> > +#define FFA_MSG_SEND_DIRECT_REQ_32   _AC(0x8400006F,U)
> > +#define FFA_MSG_SEND_DIRECT_REQ_64   _AC(0xC400006F,U)
> > +#define FFA_MSG_SEND_DIRECT_RESP_32  _AC(0x84000070,U)
> > +#define FFA_MSG_SEND_DIRECT_RESP_64  _AC(0xC4000070,U)
> > +#define FFA_MEM_DONATE_32            _AC(0x84000071,U)
> > +#define FFA_MEM_DONATE_64            _AC(0xC4000071,U)
> > +#define FFA_MEM_LEND_32                      _AC(0x84000072,U)
> > +#define FFA_MEM_LEND_64                      _AC(0xC4000072,U)
> > +#define FFA_MEM_SHARE_32             _AC(0x84000073,U)
> > +#define FFA_MEM_SHARE_64             _AC(0xC4000073,U)
> > +#define FFA_MEM_RETRIEVE_REQ_32              _AC(0x84000074,U)
> > +#define FFA_MEM_RETRIEVE_REQ_64              _AC(0xC4000074,U)
> > +#define FFA_MEM_RETRIEVE_RESP                _AC(0x84000075,U)
> > +#define FFA_MEM_RELINQUISH           _AC(0x84000076,U)
> > +#define FFA_MEM_RECLAIM                      _AC(0x84000077,U)
> > +#define FFA_MEM_FRAG_RX                      _AC(0x8400007A,U)
> > +#define FFA_MEM_FRAG_TX                      _AC(0x8400007B,U)
> > +#define FFA_MSG_SEND                 _AC(0x8400006E,U)
> > +#define FFA_MSG_POLL                 _AC(0x8400006A,U)
> > +
> > +/* Partition information descriptor */
> > +struct ffa_partition_info_1_0 {
> > +    uint16_t id;
> > +    uint16_t execution_context;
> > +    uint32_t partition_properties;
> > +};
> > +
> > +struct ffa_partition_info_1_1 {
> > +    uint16_t id;
> > +    uint16_t execution_context;
> > +    uint32_t partition_properties;
> > +    uint8_t uuid[16];
> > +};
> > +
> > +/* Constituent memory region descriptor */
> > +struct ffa_address_range {
> > +    uint64_t address;
> > +    uint32_t page_count;
> > +    uint32_t reserved;
> > +};
> > +
> > +/* Composite memory region descriptor */
> > +struct ffa_mem_region {
> > +    uint32_t total_page_count;
> > +    uint32_t address_range_count;
> > +    uint64_t reserved;
> > +    struct ffa_address_range address_range_array[];
> > +};
> > +
> > +/* Memory access permissions descriptor */
> > +struct ffa_mem_access_perm {
> > +    uint16_t endpoint_id;
> > +    uint8_t perm;
> > +    uint8_t flags;
> > +};
> > +
> > +/* Endpoint memory access descriptor */
> > +struct ffa_mem_access {
> > +    struct ffa_mem_access_perm access_perm;
> > +    uint32_t region_offs;
> > +    uint64_t reserved;
> > +};
> > +
> > +/* Lend, donate or share memory transaction descriptor */
> > +struct ffa_mem_transaction_1_0 {
> > +    uint16_t sender_id;
> > +    uint8_t mem_reg_attr;
> > +    uint8_t reserved0;
> > +    uint32_t flags;
> > +    uint64_t global_handle;
> > +    uint64_t tag;
> > +    uint32_t reserved1;
> > +    uint32_t mem_access_count;
> > +    struct ffa_mem_access mem_access_array[];
> > +};
> > +
> > +struct ffa_mem_transaction_1_1 {
> > +    uint16_t sender_id;
> > +    uint16_t mem_reg_attr;
> > +    uint32_t flags;
> > +    uint64_t global_handle;
> > +    uint64_t tag;
> > +    uint32_t mem_access_size;
> > +    uint32_t mem_access_count;
> > +    uint32_t mem_access_offs;
> > +    uint8_t reserved[12];
> > +};
> > +
> > +/*
> > + * The parts needed from struct ffa_mem_transaction_1_0 or struct
> > + * ffa_mem_transaction_1_1, used to provide an abstraction of difference in
> > + * data structures between version 1.0 and 1.1. This is just an internal
> > + * interface and can be changed without changing any ABI.
> > + */
> > +struct ffa_mem_transaction_x {
> > +    uint16_t sender_id;
> > +    uint8_t mem_reg_attr;
> > +    uint8_t flags;
> > +    uint8_t mem_access_size;
> > +    uint8_t mem_access_count;
> > +    uint16_t mem_access_offs;
> > +    uint64_t global_handle;
> > +    uint64_t tag;
> > +};
> > +
> > +/* Endpoint RX/TX descriptor */
> > +struct ffa_endpoint_rxtx_descriptor_1_0 {
> > +    uint16_t sender_id;
> > +    uint16_t reserved;
> > +    uint32_t rx_range_count;
> > +    uint32_t tx_range_count;
> > +};
> > +
> > +struct ffa_endpoint_rxtx_descriptor_1_1 {
> > +    uint16_t sender_id;
> > +    uint16_t reserved;
> > +    uint32_t rx_region_offs;
> > +    uint32_t tx_region_offs;
> > +};
> > +
> > +struct ffa_ctx {
> > +    void *rx;
> > +    void *tx;
> > +    struct page_info *rx_pg;
> > +    struct page_info *tx_pg;
> > +    unsigned int page_count;
> > +    uint32_t guest_vers;
> > +    bool tx_is_mine;
> > +    bool interrupted;
> > +    struct list_head frag_list;
> > +    spinlock_t lock;
> > +};
> > +
> > +struct ffa_shm_mem {
> > +    struct list_head list;
> > +    uint16_t sender_id;
> > +    uint16_t ep_id;     /* endpoint, the one lending */
> > +    uint64_t handle;    /* FFA_HANDLE_INVALID if not set yet */
> > +    unsigned int page_count;
> > +    struct page_info *pages[];
> > +};
> > +
> > +struct mem_frag_state {
> > +    struct list_head list;
> > +    struct ffa_shm_mem *shm;
> > +    uint32_t range_count;
> > +    unsigned int current_page_idx;
> > +    unsigned int frag_offset;
> > +    unsigned int range_offset;
> > +    uint8_t *buf;
> > +    unsigned int buf_size;
> > +    struct ffa_address_range range;
> > +};
> > +
> > +/*
> > + * Our rx/rx buffer shared with the SPMC
> > + */
> > +static uint32_t ffa_version;
> > +static uint16_t *subsr_vm_created;
> > +static unsigned int subsr_vm_created_count;
> > +static uint16_t *subsr_vm_destroyed;
> > +static unsigned int subsr_vm_destroyed_count;
> > +static void *ffa_rx;
> > +static void *ffa_tx;
> > +static unsigned int ffa_page_count;
> > +static DEFINE_SPINLOCK(ffa_buffer_lock);
> > +
> > +static LIST_HEAD(ffa_mem_list);
> > +static DEFINE_SPINLOCK(ffa_mem_list_lock);
> > +
> > +static uint64_t next_handle = FFA_HANDLE_HYP_FLAG;
> > +
> > +static inline uint64_t reg_pair_to_64(uint32_t reg0, uint32_t reg1)
> > +{
> > +    return (uint64_t)reg0 << 32 | reg1;
> > +}
> > +
> > +static void inline reg_pair_from_64(uint32_t *reg0, uint32_t *reg1,
> > +                                    uint64_t val)
> > +{
> > +    *reg0 = val >> 32;
> > +    *reg1 = val;
> > +}
> > +
> > +static bool ffa_get_version(uint32_t *vers)
> > +{
> > +    const struct arm_smccc_1_2_regs arg = {
> > +        .a0 = FFA_VERSION, .a1 = FFA_MY_VERSION,
> > +    };
> > +    struct arm_smccc_1_2_regs resp;
> > +
> > +    arm_smccc_1_2_smc(&arg, &resp);
> > +    if ( resp.a0 == FFA_RET_NOT_SUPPORTED )
> > +    {
> > +        printk(XENLOG_ERR "ffa: FFA_VERSION returned not supported\n");
> > +        return false;
> > +    }
> > +
> > +    *vers = resp.a0;
> > +    return true;
> > +}
> > +
> > +static uint32_t get_ffa_ret_code(const struct arm_smccc_1_2_regs *resp)
> > +{
> > +    switch ( resp->a0 )
> > +    {
> > +    case FFA_ERROR:
> > +        if ( resp->a2 )
> > +            return resp->a2;
> > +        else
> > +            return FFA_RET_NOT_SUPPORTED;
> > +    case FFA_SUCCESS_32:
> > +    case FFA_SUCCESS_64:
> > +        return FFA_RET_OK;
> > +    default:
> > +        return FFA_RET_NOT_SUPPORTED;
> > +    }
> > +}
> > +
> > +static uint32_t ffa_features(uint32_t id)
> > +{
> > +    const struct arm_smccc_1_2_regs arg = { .a0 = FFA_FEATURES, .a1 = id, };
> > +    struct arm_smccc_1_2_regs resp;
> > +
> > +    arm_smccc_1_2_smc(&arg, &resp);
> > +    return get_ffa_ret_code(&resp);
> > +}
> > +
> > +static bool check_mandatory_feature(uint32_t id)
> > +{
> > +    uint32_t ret = ffa_features(id);
> > +
> > +    if (ret)
> > +        printk(XENLOG_ERR "ffa: mandatory feature id %#x missing\n", id);
> > +    return !ret;
> > +}
> > +
> > +static uint32_t ffa_rxtx_map(register_t tx_addr, register_t rx_addr,
> > +                             uint32_t page_count)
> > +{
> > +    const struct arm_smccc_1_2_regs arg = {
> > +#ifdef CONFIG_ARM_64
> > +        .a0 = FFA_RXTX_MAP_64,
> > +#endif
> > +#ifdef CONFIG_ARM_32
> > +        .a0 = FFA_RXTX_MAP_32,
> > +#endif
> > +     .a1 = tx_addr, .a2 = rx_addr,
> > +        .a3 = page_count,
> > +    };
> > +    struct arm_smccc_1_2_regs resp;
> > +
> > +    arm_smccc_1_2_smc(&arg, &resp);
> > +
> > +    return get_ffa_ret_code(&resp);
> > +}
> > +
> > +static uint32_t ffa_rxtx_unmap(uint16_t vm_id)
> > +{
> > +    const struct arm_smccc_1_2_regs arg = {
> > +        .a0 = FFA_RXTX_UNMAP, .a1 = vm_id,
> > +    };
> > +    struct arm_smccc_1_2_regs resp;
> > +
> > +    arm_smccc_1_2_smc(&arg, &resp);
> > +
> > +    return get_ffa_ret_code(&resp);
> > +}
> > +
> > +static uint32_t ffa_partition_info_get(uint32_t w1, uint32_t w2, uint32_t w3,
> > +                                       uint32_t w4, uint32_t w5,
> > +                                       uint32_t *count)
> > +{
> > +    const struct arm_smccc_1_2_regs arg = {
> > +        .a0 = FFA_PARTITION_INFO_GET, .a1 = w1, .a2 = w2, .a3 = w3, .a4 = w4,
> > +        .a5 = w5,
> > +    };
> > +    struct arm_smccc_1_2_regs resp;
> > +    uint32_t ret;
> > +
> > +    arm_smccc_1_2_smc(&arg, &resp);
> > +
> > +    ret = get_ffa_ret_code(&resp);
> > +    if ( !ret )
> > +        *count = resp.a2;
> > +
> > +    return ret;
> > +}
> > +
> > +static uint32_t ffa_rx_release(void)
> > +{
> > +    const struct arm_smccc_1_2_regs arg = { .a0 = FFA_RX_RELEASE, };
> > +    struct arm_smccc_1_2_regs resp;
> > +
> > +    arm_smccc_1_2_smc(&arg, &resp);
> > +
> > +    return get_ffa_ret_code(&resp);
> > +}
> > +
> > +static int32_t ffa_mem_share(uint32_t tot_len, uint32_t frag_len,
> > +                             register_t addr, uint32_t pg_count,
> > +                             uint64_t *handle)
> > +{
> > +    struct arm_smccc_1_2_regs arg = {
> > +        .a0 = FFA_MEM_SHARE_32, .a1 = tot_len, .a2 = frag_len, .a3 = addr,
> > +        .a4 = pg_count,
> > +    };
> > +    struct arm_smccc_1_2_regs resp;
> > +
> > +    /*
> > +     * For arm64 we must use 64-bit calling convention if the buffer isn't
> > +     * passed in our tx buffer.
> > +     */
> > +    if (sizeof(addr) > 4 && addr)
> > +        arg.a0 = FFA_MEM_SHARE_64;
> > +
> > +    arm_smccc_1_2_smc(&arg, &resp);
> > +
> > +    switch ( resp.a0 )
> > +    {
> > +    case FFA_ERROR:
> > +        if ( resp.a2 )
> > +            return resp.a2;
> > +        else
> > +            return FFA_RET_NOT_SUPPORTED;
> > +    case FFA_SUCCESS_32:
> > +        *handle = reg_pair_to_64(resp.a3, resp.a2);
> > +        return FFA_RET_OK;
> > +    case FFA_MEM_FRAG_RX:
> > +        *handle = reg_pair_to_64(resp.a2, resp.a1);
> > +        return resp.a3;
> > +    default:
> > +        return FFA_RET_NOT_SUPPORTED;
> > +    }
> > +}
> > +
> > +static int32_t ffa_mem_frag_tx(uint64_t handle, uint32_t frag_len,
> > +                               uint16_t sender_id)
> > +{
> > +    struct arm_smccc_1_2_regs arg = {
> > +        .a0 = FFA_MEM_FRAG_TX, .a1 = handle & UINT32_MAX, .a2 = handle >> 32,
> > +        .a3 = frag_len, .a4 = (uint32_t)sender_id << 16,
> > +    };
> > +    struct arm_smccc_1_2_regs resp;
> > +
> > +    arm_smccc_1_2_smc(&arg, &resp);
> > +
> > +    switch ( resp.a0 )
> > +    {
> > +    case FFA_ERROR:
> > +        if ( resp.a2 )
> > +            return resp.a2;
> > +        else
> > +            return FFA_RET_NOT_SUPPORTED;
> > +    case FFA_SUCCESS_32:
> > +        return FFA_RET_OK;
> > +    case FFA_MEM_FRAG_RX:
> > +        return resp.a3;
> > +    default:
> > +            return FFA_RET_NOT_SUPPORTED;
> > +    }
> > +}
> > +
> > +static uint32_t ffa_mem_reclaim(uint32_t handle_lo, uint32_t handle_hi,
> > +                                uint32_t flags)
> > +{
> > +    const struct arm_smccc_1_2_regs arg = {
> > +        .a0 = FFA_MEM_RECLAIM, .a1 = handle_lo, .a2 = handle_hi, .a3 = flags,
> > +    };
> > +    struct arm_smccc_1_2_regs resp;
> > +
> > +    arm_smccc_1_2_smc(&arg, &resp);
> > +
> > +    return get_ffa_ret_code(&resp);
> > +}
> > +
> > +static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
> > +                                      uint8_t msg)
> > +{
> > +    uint32_t exp_resp = FFA_MSG_FLAG_FRAMEWORK;
> > +    int32_t res;
> > +
> > +    if ( msg != FFA_MSG_SEND_VM_CREATED && msg !=FFA_MSG_SEND_VM_DESTROYED )
> > +        return FFA_RET_INVALID_PARAMETERS;
> > +
> > +    if ( msg == FFA_MSG_SEND_VM_CREATED )
> > +        exp_resp |= FFA_MSG_RESP_VM_CREATED;
> > +    else
> > +        exp_resp |= FFA_MSG_RESP_VM_DESTROYED;
> > +
> > +    do {
> > +        const struct arm_smccc_1_2_regs arg = {
> > +            .a0 = FFA_MSG_SEND_DIRECT_REQ_32,
> > +            .a1 = sp_id,
> > +            .a2 = FFA_MSG_FLAG_FRAMEWORK | msg,
> > +            .a5 = vm_id,
> > +        };
> > +        struct arm_smccc_1_2_regs resp;
> > +
> > +        arm_smccc_1_2_smc(&arg, &resp);
> > +        if ( resp.a0 != FFA_MSG_SEND_DIRECT_RESP_32 || resp.a2 != exp_resp )
> > +        {
> > +            /*
> > +             * This is an invalid response, likely due to some error in the
> > +             * implementation of the ABI.
> > +             */
> > +            return FFA_RET_INVALID_PARAMETERS;
> > +        }
> > +        res = resp.a3;
> > +    } while ( res == FFA_RET_INTERRUPTED || res == FFA_RET_RETRY );
> > +
> > +    return res;
> > +}
> > +
> > +static u16 get_vm_id(struct domain *d)
> > +{
> > +    /* +1 since 0 is reserved for the hypervisor in FF-A */
> > +    return d->domain_id + 1;
> > +}
> > +
> > +static void set_regs(struct cpu_user_regs *regs, register_t v0, register_t v1,
> > +                     register_t v2, register_t v3, register_t v4, register_t v5,
> > +                     register_t v6, register_t v7)
> > +{
> > +        set_user_reg(regs, 0, v0);
> > +        set_user_reg(regs, 1, v1);
> > +        set_user_reg(regs, 2, v2);
> > +        set_user_reg(regs, 3, v3);
> > +        set_user_reg(regs, 4, v4);
> > +        set_user_reg(regs, 5, v5);
> > +        set_user_reg(regs, 6, v6);
> > +        set_user_reg(regs, 7, v7);
> > +}
> > +
> > +static void set_regs_error(struct cpu_user_regs *regs, uint32_t error_code)
> > +{
> > +    set_regs(regs, FFA_ERROR, 0, error_code, 0, 0, 0, 0, 0);
> > +}
> > +
> > +static void set_regs_success(struct cpu_user_regs *regs, uint32_t w2,
> > +                             uint32_t w3)
> > +{
> > +    set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, 0, 0, 0, 0);
> > +}
> > +
> > +static void set_regs_frag_rx(struct cpu_user_regs *regs, uint32_t handle_lo,
> > +                             uint32_t handle_hi, uint32_t frag_offset,
> > +                             uint16_t sender_id)
> > +{
> > +    set_regs(regs, FFA_MEM_FRAG_RX, handle_lo, handle_hi, frag_offset,
> > +             (uint32_t)sender_id << 16, 0, 0, 0);
> > +}
> > +
> > +static void handle_version(struct cpu_user_regs *regs)
> > +{
> > +    struct domain *d = current->domain;
> > +    struct ffa_ctx *ctx = d->arch.ffa;
> > +    uint32_t vers = get_user_reg(regs, 1);
> > +
> > +    if ( vers < FFA_VERSION_1_1 )
> > +        vers = FFA_VERSION_1_0;
> > +    else
> > +        vers = FFA_VERSION_1_1;
> > +
> > +    ctx->guest_vers = vers;
> > +    set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
> > +}
> > +
> > +static uint32_t handle_rxtx_map(uint32_t fid, register_t tx_addr,
> > +                                register_t rx_addr, uint32_t page_count)
> > +{
> > +    uint32_t ret = FFA_RET_INVALID_PARAMETERS;
> > +    struct domain *d = current->domain;
> > +    struct ffa_ctx *ctx = d->arch.ffa;
> > +    struct page_info *tx_pg;
> > +    struct page_info *rx_pg;
> > +    p2m_type_t t;
> > +    void *rx;
> > +    void *tx;
> > +
> > +    if ( !smccc_is_conv_64(fid) )
> > +    {
> > +        tx_addr &= UINT32_MAX;
> > +        rx_addr &= UINT32_MAX;
> > +    }
> > +
> > +    /* For now to keep things simple, only deal with a single page */
> > +    if ( page_count != 1 )
> > +        return FFA_RET_NOT_SUPPORTED;
> > +
> > +    /* Already mapped */
> > +    if ( ctx->rx )
> > +        return FFA_RET_DENIED;
> > +
> > +    tx_pg = get_page_from_gfn(d, gaddr_to_gfn(tx_addr), &t, P2M_ALLOC);
> > +    if ( !tx_pg )
> > +        return FFA_RET_INVALID_PARAMETERS;
> > +    /* Only normal RAM for now */
> > +    if (t != p2m_ram_rw)
> > +        goto err_put_tx_pg;
> > +
> > +    rx_pg = get_page_from_gfn(d, gaddr_to_gfn(rx_addr), &t, P2M_ALLOC);
> > +    if ( !tx_pg )
> > +        goto err_put_tx_pg;
> > +    /* Only normal RAM for now */
> > +    if ( t != p2m_ram_rw )
> > +        goto err_put_rx_pg;
> > +
> > +    tx = __map_domain_page_global(tx_pg);
> > +    if ( !tx )
> > +        goto err_put_rx_pg;
> > +
> > +    rx = __map_domain_page_global(rx_pg);
> > +    if ( !rx )
> > +        goto err_unmap_tx;
> > +
> > +    ctx->rx = rx;
> > +    ctx->tx = tx;
> > +    ctx->rx_pg = rx_pg;
> > +    ctx->tx_pg = tx_pg;
> > +    ctx->page_count = 1;
> > +    ctx->tx_is_mine = true;
> > +    return FFA_RET_OK;
> > +
> > +err_unmap_tx:
> > +    unmap_domain_page_global(tx);
> > +err_put_rx_pg:
> > +    put_page(rx_pg);
> > +err_put_tx_pg:
> > +    put_page(tx_pg);
> > +    return ret;
> > +}
> > +
> > +static uint32_t handle_rxtx_unmap(void)
> > +{
> > +    struct domain *d = current->domain;
> > +    struct ffa_ctx *ctx = d->arch.ffa;
> > +    uint32_t ret;
> > +
> > +    if ( !ctx->rx )
> > +        return FFA_RET_INVALID_PARAMETERS;
> > +
> > +    ret = ffa_rxtx_unmap(get_vm_id(d));
> > +    if ( ret )
> > +        return ret;
> > +
> > +    unmap_domain_page_global(ctx->rx);
> > +    unmap_domain_page_global(ctx->tx);
> > +    put_page(ctx->rx_pg);
> > +    put_page(ctx->tx_pg);
> > +    ctx->rx = NULL;
> > +    ctx->tx = NULL;
> > +    ctx->rx_pg = NULL;
> > +    ctx->tx_pg = NULL;
> > +    ctx->page_count = 0;
> > +    ctx->tx_is_mine = false;
> > +
> > +    return FFA_RET_OK;
> > +}
> > +
> > +static uint32_t handle_partition_info_get(uint32_t w1, uint32_t w2, uint32_t w3,
> > +                                          uint32_t w4, uint32_t w5,
> > +                                          uint32_t *count)
> > +{
> > +    uint32_t ret = FFA_RET_DENIED;
> > +    struct domain *d = current->domain;
> > +    struct ffa_ctx *ctx = d->arch.ffa;
> > +
> > +    if ( !ffa_page_count )
> > +        return FFA_RET_DENIED;
> > +
> > +    spin_lock(&ctx->lock);
> > +    if ( !ctx->page_count || !ctx->tx_is_mine )
> > +        goto out;
> > +    ret = ffa_partition_info_get(w1, w2, w3, w4, w5, count);
> > +    if ( ret )
> > +        goto out;
> > +    if ( ctx->guest_vers == FFA_VERSION_1_0 )
> > +    {
> > +        size_t n;
> > +        struct ffa_partition_info_1_1 *src = ffa_rx;
> > +        struct ffa_partition_info_1_0 *dst = ctx->rx;
> > +
> > +        for ( n = 0; n < *count; n++ )
> > +        {
> > +            dst[n].id = src[n].id;
> > +            dst[n].execution_context = src[n].execution_context;
> > +            dst[n].partition_properties = src[n].partition_properties;
> > +        }
> > +    }
> > +    else
> > +    {
> > +        size_t sz = *count * sizeof(struct ffa_partition_info_1_1);
> > +
> > +        memcpy(ctx->rx, ffa_rx, sz);
> > +    }
> > +    ffa_rx_release();
> > +    ctx->tx_is_mine = false;
> > +out:
> > +    spin_unlock(&ctx->lock);
> > +
> > +    return ret;
> > +}
> > +
> > +static uint32_t handle_rx_release(void)
> > +{
> > +    uint32_t ret = FFA_RET_DENIED;
> > +    struct domain *d = current->domain;
> > +    struct ffa_ctx *ctx = d->arch.ffa;
> > +
> > +    spin_lock(&ctx->lock);
> > +    if ( !ctx->page_count || ctx->tx_is_mine )
> > +        goto out;
> > +    ret = FFA_RET_OK;
> > +    ctx->tx_is_mine = true;
> > +out:
> > +    spin_unlock(&ctx->lock);
> > +
> > +    return ret;
> > +}
> > +
> > +static void handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t fid)
> > +{
> > +    struct arm_smccc_1_2_regs arg = { .a0 = fid, };
> > +    struct arm_smccc_1_2_regs resp = { };
> > +    struct domain *d = current->domain;
> > +    struct ffa_ctx *ctx = d->arch.ffa;
> > +    uint32_t src_dst;
> > +    uint64_t mask;
> > +
> > +    if ( smccc_is_conv_64(fid) )
> > +        mask = 0xffffffffffffffff;
> > +    else
> > +        mask = 0xffffffff;
> > +
> > +    src_dst = get_user_reg(regs, 1);
> > +    if ( (src_dst >> 16) != get_vm_id(d) )
> > +    {
> > +        resp.a0 = FFA_ERROR;
> > +        resp.a2 = FFA_RET_INVALID_PARAMETERS;
> > +        goto out;
> > +    }
> > +
> > +    arg.a1 = src_dst;
> > +    arg.a2 = get_user_reg(regs, 2) & mask;
> > +    arg.a3 = get_user_reg(regs, 3) & mask;
> > +    arg.a4 = get_user_reg(regs, 4) & mask;
> > +    arg.a5 = get_user_reg(regs, 5) & mask;
> > +    arg.a6 = get_user_reg(regs, 6) & mask;
> > +    arg.a7 = get_user_reg(regs, 7) & mask;
> > +
> > +    while ( true )
> > +    {
> > +        arm_smccc_1_2_smc(&arg, &resp);
> > +
> > +        switch ( resp.a0 )
> > +        {
> > +        case FFA_INTERRUPT:
> > +            ctx->interrupted = true;
> > +            goto out;
> > +        case FFA_ERROR:
> > +        case FFA_SUCCESS_32:
> > +        case FFA_SUCCESS_64:
> > +        case FFA_MSG_SEND_DIRECT_RESP_32:
> > +        case FFA_MSG_SEND_DIRECT_RESP_64:
> > +            goto out;
> > +        default:
> > +            /* Bad fid, report back. */
> > +            memset(&arg, 0, sizeof(arg));
> > +            arg.a0 = FFA_ERROR;
> > +            arg.a1 = src_dst;
> > +            arg.a2 = FFA_RET_NOT_SUPPORTED;
> > +            continue;
> > +        }
> > +    }
> > +
> > +out:
> > +    set_user_reg(regs, 0, resp.a0);
> > +    set_user_reg(regs, 1, resp.a1 & mask);
> > +    set_user_reg(regs, 2, resp.a2 & mask);
> > +    set_user_reg(regs, 3, resp.a3 & mask);
> > +    set_user_reg(regs, 4, resp.a4 & mask);
> > +    set_user_reg(regs, 5, resp.a5 & mask);
> > +    set_user_reg(regs, 6, resp.a6 & mask);
> > +    set_user_reg(regs, 7, resp.a7 & mask);
> > +}
> > +
> > +static int get_shm_pages(struct domain *d, struct ffa_shm_mem *shm,
> > +                         struct ffa_address_range *range, uint32_t range_count,
> > +                         unsigned int start_page_idx,
> > +                         unsigned int *last_page_idx)
> > +{
> > +    unsigned int pg_idx = start_page_idx;
> > +    unsigned long gfn;
> > +    unsigned int n;
> > +    unsigned int m;
> > +    p2m_type_t t;
> > +    uint64_t addr;
> > +
> > +    for ( n = 0; n < range_count; n++ )
> > +    {
> > +        for ( m = 0; m < range[n].page_count; m++ )
> > +        {
> > +            if ( pg_idx >= shm->page_count )
> > +                return FFA_RET_INVALID_PARAMETERS;
> > +
> > +            addr = read_atomic(&range[n].address);
> > +            gfn = gaddr_to_gfn(addr + m * PAGE_SIZE);
> > +            shm->pages[pg_idx] = get_page_from_gfn(d, gfn, &t, P2M_ALLOC);
> > +            if ( !shm->pages[pg_idx] )
> > +                return FFA_RET_DENIED;
> > +            pg_idx++;
> > +            /* Only normal RAM for now */
> > +            if ( t != p2m_ram_rw )
> > +                return FFA_RET_DENIED;
> > +        }
> > +    }
> > +
> > +    *last_page_idx = pg_idx;
> > +
> > +    return FFA_RET_OK;
> > +}
> > +
> > +static void put_shm_pages(struct ffa_shm_mem *shm)
> > +{
> > +    unsigned int n;
> > +
> > +    for ( n = 0; n < shm->page_count && shm->pages[n]; n++ )
> > +    {
> > +        put_page(shm->pages[n]);
> > +        shm->pages[n] = NULL;
> > +    }
> > +}
> > +
> > +static void init_range(struct ffa_address_range *addr_range,
> > +                       paddr_t pa)
> > +{
> > +    memset(addr_range, 0, sizeof(*addr_range));
> > +    addr_range->address = pa;
> > +    addr_range->page_count = 1;
> > +}
> > +
> > +static int share_shm(struct ffa_shm_mem *shm)
> > +{
> > +    uint32_t max_frag_len = ffa_page_count * PAGE_SIZE;
> > +    struct ffa_mem_transaction_1_1 *descr = ffa_tx;
> > +    struct ffa_mem_access *mem_access_array;
> > +    struct ffa_mem_region *region_descr;
> > +    struct ffa_address_range *addr_range;
> > +    paddr_t pa;
> > +    paddr_t last_pa;
> > +    unsigned int n;
> > +    uint32_t frag_len;
> > +    uint32_t tot_len;
> > +    int ret;
> > +    unsigned int range_count;
> > +    unsigned int range_base;
> > +    bool first;
> > +
> > +    memset(descr, 0, sizeof(*descr));
> > +    descr->sender_id = shm->sender_id;
> > +    descr->global_handle = shm->handle;
> > +    descr->mem_reg_attr = FFA_NORMAL_MEM_REG_ATTR;
> > +    descr->mem_access_count = 1;
> > +    descr->mem_access_size = sizeof(*mem_access_array);
> > +    descr->mem_access_offs = sizeof(*descr);
> > +    mem_access_array = (void *)(descr + 1);
> > +    region_descr = (void *)(mem_access_array + 1);
> > +
> > +    memset(mem_access_array, 0, sizeof(*mem_access_array));
> > +    mem_access_array[0].access_perm.endpoint_id = shm->ep_id;
> > +    mem_access_array[0].access_perm.perm = FFA_MEM_ACC_RW;
> > +    mem_access_array[0].region_offs = (vaddr_t)region_descr - (vaddr_t)ffa_tx;
> > +
> > +    memset(region_descr, 0, sizeof(*region_descr));
> > +    region_descr->total_page_count = shm->page_count;
> > +
> > +    region_descr->address_range_count = 1;
> > +    last_pa = page_to_maddr(shm->pages[0]);
> > +    for ( n = 1; n < shm->page_count; last_pa = pa, n++ )
> > +    {
> > +        pa = page_to_maddr(shm->pages[n]);
> > +        if ( last_pa + PAGE_SIZE == pa )
> > +        {
> > +            continue;
> > +        }
> > +        region_descr->address_range_count++;
> > +    }
> > +
> > +    tot_len = sizeof(*descr) + sizeof(*mem_access_array) +
> > +              sizeof(*region_descr) +
> > +              region_descr->address_range_count * sizeof(*addr_range);
> > +
> > +    addr_range = region_descr->address_range_array;
> > +    frag_len = (vaddr_t)(addr_range + 1) - (vaddr_t)ffa_tx;
> > +    last_pa = page_to_maddr(shm->pages[0]);
> > +    init_range(addr_range, last_pa);
> > +    first = true;
> > +    range_count = 1;
> > +    range_base = 0;
> > +    for ( n = 1; n < shm->page_count; last_pa = pa, n++ )
> > +    {
> > +        pa = page_to_maddr(shm->pages[n]);
> > +        if ( last_pa + PAGE_SIZE == pa )
> > +        {
> > +            addr_range->page_count++;
> > +            continue;
> > +        }
> > +
> > +        if ( frag_len == max_frag_len )
> > +        {
> > +            if ( first )
> > +            {
> > +                ret = ffa_mem_share(tot_len, frag_len, 0, 0, &shm->handle);
> > +                first = false;
> > +            }
> > +            else
> > +            {
> > +                ret = ffa_mem_frag_tx(shm->handle, frag_len, shm->sender_id);
> > +            }
> > +            if ( ret <= 0)
> > +                return ret;
> > +            range_base = range_count;
> > +            range_count = 0;
> > +            frag_len = sizeof(*addr_range);
> > +            addr_range = ffa_tx;
> > +        }
> > +        else
> > +        {
> > +            frag_len += sizeof(*addr_range);
> > +            addr_range++;
> > +        }
> > +        init_range(addr_range, pa);
> > +        range_count++;
> > +    }
> > +
> > +    if ( first )
> > +        return ffa_mem_share(tot_len, frag_len, 0, 0, &shm->handle);
> > +    else
> > +        return ffa_mem_frag_tx(shm->handle, frag_len, shm->sender_id);
> > +}
> > +
> > +static int read_mem_transaction(uint32_t ffa_vers, void *buf, size_t blen,
> > +                                struct ffa_mem_transaction_x *trans)
> > +{
> > +    uint16_t mem_reg_attr;
> > +    uint32_t flags;
> > +    uint32_t count;
> > +    uint32_t offs;
> > +    uint32_t size;
> > +
> > +    if ( ffa_vers >= FFA_VERSION_1_1 )
> > +    {
> > +        struct ffa_mem_transaction_1_1 *descr;
> > +
> > +        if ( blen < sizeof(*descr) )
> > +            return FFA_RET_INVALID_PARAMETERS;
> > +
> > +        descr = buf;
> > +        trans->sender_id = read_atomic(&descr->sender_id);
> > +        mem_reg_attr = read_atomic(&descr->mem_reg_attr);
> > +        flags = read_atomic(&descr->flags);
> > +        trans->global_handle = read_atomic(&descr->global_handle);
> > +        trans->tag = read_atomic(&descr->tag);
> > +
> > +        count = read_atomic(&descr->mem_access_count);
> > +        size = read_atomic(&descr->mem_access_size);
> > +        offs = read_atomic(&descr->mem_access_offs);
> > +    }
> > +    else
> > +    {
> > +        struct ffa_mem_transaction_1_0 *descr;
> > +
> > +        if ( blen < sizeof(*descr) )
> > +            return FFA_RET_INVALID_PARAMETERS;
> > +
> > +        descr = buf;
> > +        trans->sender_id = read_atomic(&descr->sender_id);
> > +        mem_reg_attr = read_atomic(&descr->mem_reg_attr);
> > +        flags = read_atomic(&descr->flags);
> > +        trans->global_handle = read_atomic(&descr->global_handle);
> > +        trans->tag = read_atomic(&descr->tag);
> > +
> > +        count = read_atomic(&descr->mem_access_count);
> > +        size = sizeof(struct ffa_mem_access);
> > +        offs = offsetof(struct ffa_mem_transaction_1_0, mem_access_array);
> > +    }
> > +
> > +    if ( mem_reg_attr > UINT8_MAX || flags > UINT8_MAX || size > UINT8_MAX ||
> > +        count > UINT8_MAX || offs > UINT16_MAX )
> > +        return FFA_RET_INVALID_PARAMETERS;
> > +
> > +    /* Check that the endpoint memory access descriptor array fits */
> > +    if ( size * count + offs > blen )
> > +        return FFA_RET_INVALID_PARAMETERS;
> > +
> > +    trans->mem_reg_attr = mem_reg_attr;
> > +    trans->flags = flags;
> > +    trans->mem_access_size = size;
> > +    trans->mem_access_count = count;
> > +    trans->mem_access_offs = offs;
> > +    return 0;
> > +}
> > +
> > +static int add_mem_share_frag(struct mem_frag_state *s, unsigned int offs,
> > +                              unsigned int frag_len)
> > +{
> > +    struct domain *d = current->domain;
> > +    unsigned int o = offs;
> > +    unsigned int l;
> > +    int ret;
> > +
> > +    if ( frag_len < o )
> > +        return FFA_RET_INVALID_PARAMETERS;
> > +
> > +    /* Fill up the first struct ffa_address_range */
> > +    l = min_t(unsigned int, frag_len - o, sizeof(s->range) - s->range_offset);
> > +    memcpy((uint8_t *)&s->range + s->range_offset, s->buf + o, l);
> > +    s->range_offset += l;
> > +    o += l;
> > +    if ( s->range_offset != sizeof(s->range) )
> > +        goto out;
> > +    s->range_offset = 0;
> > +
> > +    while ( true )
> > +    {
> > +        ret = get_shm_pages(d, s->shm, &s->range, 1, s->current_page_idx,
> > +                            &s->current_page_idx);
> > +        if ( ret )
> > +            return ret;
> > +        if ( s->range_count == 1 )
> > +            return 0;
> > +        s->range_count--;
> > +        if ( frag_len - o < sizeof(s->range) )
> > +            break;
> > +        memcpy(&s->range, s->buf + o, sizeof(s->range));
> > +        o += sizeof(s->range);
> > +    }
> > +
> > +    /* Collect any remaining bytes for the next struct ffa_address_range */
> > +    s->range_offset = frag_len - o;
> > +    memcpy(&s->range, s->buf + o, frag_len - o);
> > +out:
> > +    s->frag_offset += frag_len;
> > +    return s->frag_offset;
> > +}
> > +
> > +static void handle_mem_share(struct cpu_user_regs *regs)
> > +{
> > +    uint32_t tot_len = get_user_reg(regs, 1);
> > +    uint32_t frag_len = get_user_reg(regs, 2);
> > +    uint64_t addr = get_user_reg(regs, 3);
> > +    uint32_t page_count = get_user_reg(regs, 4);
> > +    struct ffa_mem_transaction_x trans;
> > +    struct ffa_mem_access *mem_access;
> > +    struct ffa_mem_region *region_descr;
> > +    struct domain *d = current->domain;
> > +    struct ffa_ctx *ctx = d->arch.ffa;
> > +    struct ffa_shm_mem *shm = NULL;
> > +    unsigned int last_page_idx = 0;
> > +    uint32_t range_count;
> > +    uint32_t region_offs;
> > +    int ret = FFA_RET_DENIED;
> > +    uint32_t handle_hi = 0;
> > +    uint32_t handle_lo = 0;
> > +
> > +    /*
> > +     * We're only accepting memory transaction descriptors via the rx/tx
> > +     * buffer.
> > +     */
> > +    if ( addr )
> > +    {
> > +        ret = FFA_RET_NOT_SUPPORTED;
> > +        goto out_unlock;
> > +    }
> > +
> > +    /* Check that fragment legnth doesn't exceed total length */
> > +    if ( frag_len > tot_len )
> > +    {
> > +        ret = FFA_RET_INVALID_PARAMETERS;
> > +        goto out_unlock;
> > +    }
> > +
> > +    spin_lock(&ctx->lock);
> > +
> > +    if ( frag_len > ctx->page_count * PAGE_SIZE )
> > +        goto out_unlock;
> > +
> > +    if ( !ffa_page_count )
> > +    {
> > +        ret = FFA_RET_NO_MEMORY;
> > +        goto out_unlock;
> > +    }
> > +
> > +    ret = read_mem_transaction(ctx->guest_vers, ctx->tx, frag_len, &trans);
> > +    if ( ret )
> > +        goto out_unlock;
> > +
> > +    if ( trans.mem_reg_attr != FFA_NORMAL_MEM_REG_ATTR )
> > +    {
> > +        ret = FFA_RET_NOT_SUPPORTED;
> > +        goto out;
> > +    }
> > +
> > +    /* Only supports sharing it with one SP for now */
> > +    if ( trans.mem_access_count != 1 )
> > +    {
> > +        ret = FFA_RET_NOT_SUPPORTED;
> > +        goto out_unlock;
> > +    }
> > +
> > +    if ( trans.sender_id != get_vm_id(d) )
> > +    {
> > +        ret = FFA_RET_INVALID_PARAMETERS;
> > +        goto out_unlock;
> > +    }
> > +
> > +    /* Check that it fits in the supplied data */
> > +    if ( trans.mem_access_offs + trans.mem_access_size > frag_len )
> > +        goto out_unlock;
> > +
> > +    mem_access = (void *)((vaddr_t)ctx->tx + trans.mem_access_offs);
> > +    if ( read_atomic(&mem_access->access_perm.perm) != FFA_MEM_ACC_RW )
> > +    {
> > +        ret = FFA_RET_NOT_SUPPORTED;
> > +        goto out_unlock;
> > +    }
> > +
> > +    region_offs = read_atomic(&mem_access->region_offs);
> > +    if ( sizeof(*region_descr) + region_offs > frag_len )
> > +    {
> > +        ret = FFA_RET_NOT_SUPPORTED;
> > +        goto out_unlock;
> > +    }
> > +
> > +    region_descr = (void *)((vaddr_t)ctx->tx + region_offs);
> > +    range_count = read_atomic(&region_descr->address_range_count);
> > +    page_count = read_atomic(&region_descr->total_page_count);
> > +
> > +    shm = xzalloc_flex_struct(struct ffa_shm_mem, pages, page_count);
> > +    if ( !shm )
> > +    {
> > +        ret = FFA_RET_NO_MEMORY;
> > +        goto out;
> > +    }
> > +    shm->sender_id = trans.sender_id;
> > +    shm->ep_id = read_atomic(&mem_access->access_perm.endpoint_id);
> > +    shm->page_count = page_count;
> > +
> > +    if ( frag_len != tot_len )
> > +    {
> > +        struct mem_frag_state *s = xzalloc(struct mem_frag_state);
> > +
> > +        if ( !s )
> > +        {
> > +            ret = FFA_RET_NO_MEMORY;
> > +            goto out;
> > +        }
> > +        s->shm = shm;
> > +        s->range_count = range_count;
> > +        s->buf = ctx->tx;
> > +        s->buf_size = ffa_page_count * PAGE_SIZE;
> > +        ret = add_mem_share_frag(s, sizeof(*region_descr)  + region_offs,
> > +                                 frag_len);
> > +        if ( ret <= 0 )
> > +        {
> > +            xfree(s);
> > +            if ( ret < 0 )
> > +                goto out;
> > +        }
> > +        else
> > +        {
> > +            shm->handle = next_handle++;
> > +            reg_pair_from_64(&handle_hi, &handle_lo, shm->handle);
> > +            list_add_tail(&s->list, &ctx->frag_list);
> > +        }
> > +        goto out_unlock;
> > +    }
> > +
> > +    /*
> > +     * Check that the Composite memory region descriptor fits.
> > +     */
> > +    if ( sizeof(*region_descr) + region_offs +
> > +         range_count * sizeof(struct ffa_address_range) > frag_len )
> > +    {
> > +        ret = FFA_RET_INVALID_PARAMETERS;
> > +        goto out;
> > +    }
> > +
> > +    ret = get_shm_pages(d, shm, region_descr->address_range_array, range_count,
> > +                        0, &last_page_idx);
> > +    if ( ret )
> > +        goto out;
> > +    if ( last_page_idx != shm->page_count )
> > +    {
> > +        ret = FFA_RET_INVALID_PARAMETERS;
> > +        goto out;
> > +    }
> > +
> > +    /* Note that share_shm() uses our tx buffer */
> > +    spin_lock(&ffa_buffer_lock);
> > +    ret = share_shm(shm);
> > +    spin_unlock(&ffa_buffer_lock);
> > +    if ( ret )
> > +        goto out;
> > +
> > +    spin_lock(&ffa_mem_list_lock);
> > +    list_add_tail(&shm->list, &ffa_mem_list);
> > +    spin_unlock(&ffa_mem_list_lock);
> > +
> > +    reg_pair_from_64(&handle_hi, &handle_lo, shm->handle);
> > +
> > +out:
> > +    if ( ret && shm )
> > +    {
> > +        put_shm_pages(shm);
> > +        xfree(shm);
> > +    }
> > +out_unlock:
> > +    spin_unlock(&ctx->lock);
> > +
> > +    if ( ret > 0 )
> > +            set_regs_frag_rx(regs, handle_lo, handle_hi, ret, trans.sender_id);
> > +    else if ( ret == 0)
> > +            set_regs_success(regs, handle_lo, handle_hi);
> > +    else
> > +            set_regs_error(regs, ret);
> > +}
> > +
> > +static struct mem_frag_state *find_frag_state(struct ffa_ctx *ctx,
> > +                                              uint64_t handle)
> > +{
> > +    struct mem_frag_state *s;
> > +
> > +    list_for_each_entry(s, &ctx->frag_list, list)
> > +        if ( s->shm->handle == handle )
> > +            return s;
> > +
> > +    return NULL;
> > +}
> > +
> > +static void handle_mem_frag_tx(struct cpu_user_regs *regs)
> > +{
> > +    struct domain *d = current->domain;
> > +    struct ffa_ctx *ctx = d->arch.ffa;
> > +    uint32_t frag_len = get_user_reg(regs, 3);
> > +    uint32_t handle_lo = get_user_reg(regs, 1);
> > +    uint32_t handle_hi = get_user_reg(regs, 2);
> > +    uint64_t handle = reg_pair_to_64(handle_hi, handle_lo);
> > +    struct mem_frag_state *s;
> > +    uint16_t sender_id = 0;
> > +    int ret;
> > +
> > +    spin_lock(&ctx->lock);
> > +    s = find_frag_state(ctx, handle);
> > +    if ( !s )
> > +    {
> > +        ret = FFA_RET_INVALID_PARAMETERS;
> > +        goto out;
> > +    }
> > +    sender_id = s->shm->sender_id;
> > +
> > +    if ( frag_len > s->buf_size )
> > +    {
> > +        ret = FFA_RET_INVALID_PARAMETERS;
> > +        goto out;
> > +    }
> > +
> > +    ret = add_mem_share_frag(s, 0, frag_len);
> > +    if ( ret == 0 )
> > +    {
> > +        /* Note that share_shm() uses our tx buffer */
> > +        spin_lock(&ffa_buffer_lock);
> > +        ret = share_shm(s->shm);
> > +        spin_unlock(&ffa_buffer_lock);
> > +        if ( ret == 0 )
> > +        {
> > +            spin_lock(&ffa_mem_list_lock);
> > +            list_add_tail(&s->shm->list, &ffa_mem_list);
> > +            spin_unlock(&ffa_mem_list_lock);
> > +        }
> > +        else
> > +        {
> > +            put_shm_pages(s->shm);
> > +            xfree(s->shm);
> > +        }
> > +        list_del(&s->list);
> > +        xfree(s);
> > +    }
> > +    else if ( ret < 0 )
> > +    {
> > +        put_shm_pages(s->shm);
> > +        xfree(s->shm);
> > +        list_del(&s->list);
> > +        xfree(s);
> > +    }
> > +out:
> > +    spin_unlock(&ctx->lock);
> > +
> > +    if ( ret > 0 )
> > +            set_regs_frag_rx(regs, handle_lo, handle_hi, ret, sender_id);
> > +    else if ( ret == 0)
> > +            set_regs_success(regs, handle_lo, handle_hi);
> > +    else
> > +            set_regs_error(regs, ret);
> > +}
> > +
> > +static int handle_mem_reclaim(uint64_t handle, uint32_t flags)
> > +{
> > +    struct ffa_shm_mem *shm;
> > +    uint32_t handle_hi;
> > +    uint32_t handle_lo;
> > +    int ret;
> > +
> > +    spin_lock(&ffa_mem_list_lock);
> > +    list_for_each_entry(shm, &ffa_mem_list, list)
> > +    {
> > +        if ( shm->handle == handle )
> > +            goto found_it;
> > +    }
> > +    shm = NULL;
> > +found_it:
> > +    spin_unlock(&ffa_mem_list_lock);
> > +
> > +    if ( !shm )
> > +        return FFA_RET_INVALID_PARAMETERS;
> > +
> > +    reg_pair_from_64(&handle_hi, &handle_lo, handle);
> > +    ret = ffa_mem_reclaim(handle_lo, handle_hi, flags);
> > +    if ( ret )
> > +        return ret;
> > +
> > +    spin_lock(&ffa_mem_list_lock);
> > +    list_del(&shm->list);
> > +    spin_unlock(&ffa_mem_list_lock);
> > +
> > +    put_shm_pages(shm);
> > +    xfree(shm);
> > +
> > +    return ret;
> > +}
> > +
> > +bool ffa_handle_call(struct cpu_user_regs *regs, uint32_t fid)
> > +{
> > +    struct domain *d = current->domain;
> > +    struct ffa_ctx *ctx = d->arch.ffa;
> > +    uint32_t count;
> > +    uint32_t e;
> > +
> > +    if ( !ctx )
> > +        return false;
> > +
> > +    switch ( fid )
> > +    {
> > +    case FFA_VERSION:
> > +        handle_version(regs);
> > +        return true;
> > +    case FFA_ID_GET:
> > +        set_regs_success(regs, get_vm_id(d), 0);
> > +        return true;
> > +    case FFA_RXTX_MAP_32:
> > +#ifdef CONFIG_ARM_64
> > +    case FFA_RXTX_MAP_64:
> > +#endif
> > +        e = handle_rxtx_map(fid, get_user_reg(regs, 1), get_user_reg(regs, 2),
> > +                            get_user_reg(regs, 3));
> > +        if ( e )
> > +            set_regs_error(regs, e);
> > +        else
> > +            set_regs_success(regs, 0, 0);
> > +        return true;
> > +    case FFA_RXTX_UNMAP:
> > +        e = handle_rxtx_unmap();
> > +        if ( e )
> > +            set_regs_error(regs, e);
> > +        else
> > +            set_regs_success(regs, 0, 0);
> > +        return true;
> > +    case FFA_PARTITION_INFO_GET:
> > +        e = handle_partition_info_get(get_user_reg(regs, 1),
> > +                                      get_user_reg(regs, 2),
> > +                                      get_user_reg(regs, 3),
> > +                                      get_user_reg(regs, 4),
> > +                                      get_user_reg(regs, 5), &count);
> > +        if ( e )
> > +            set_regs_error(regs, e);
> > +        else
> > +            set_regs_success(regs, count, 0);
> > +        return true;
> > +    case FFA_RX_RELEASE:
> > +        e = handle_rx_release();
> > +        if ( e )
> > +            set_regs_error(regs, e);
> > +        else
> > +            set_regs_success(regs, 0, 0);
> > +        return true;
> > +    case FFA_MSG_SEND_DIRECT_REQ_32:
> > +#ifdef CONFIG_ARM_64
> > +    case FFA_MSG_SEND_DIRECT_REQ_64:
> > +#endif
> > +        handle_msg_send_direct_req(regs, fid);
> > +        return true;
> > +    case FFA_MEM_SHARE_32:
> > +#ifdef CONFIG_ARM_64
> > +    case FFA_MEM_SHARE_64:
> > +#endif
> > +        handle_mem_share(regs);
> > +        return true;
> > +    case FFA_MEM_RECLAIM:
> > +        e = handle_mem_reclaim(reg_pair_to_64(get_user_reg(regs, 2),
> > +                                              get_user_reg(regs, 1)),
> > +                               get_user_reg(regs, 3));
> > +        if ( e )
> > +            set_regs_error(regs, e);
> > +        else
> > +            set_regs_success(regs, 0, 0);
> > +        return true;
> > +    case FFA_MEM_FRAG_TX:
> > +        handle_mem_frag_tx(regs);
> > +        return true;
> > +
> > +    default:
> > +        printk(XENLOG_ERR "ffa: unhandled fid 0x%x\n", fid);
> > +        return false;
> > +    }
> > +}
> > +
> > +int ffa_domain_init(struct domain *d, bool ffa_enabled)
> > +{
> > +    struct ffa_ctx *ctx;
> > +    unsigned int n;
> > +    unsigned int m;
> > +    unsigned int c_pos;
> > +    int32_t res;
> > +
> > +    if ( !ffa_version || !ffa_enabled )
> > +        return 0;
> > +
> > +    ctx = xzalloc(struct ffa_ctx);
> > +    if ( !ctx )
> > +        return -ENOMEM;
> > +
> > +    for ( n = 0; n < subsr_vm_created_count; n++ )
> > +    {
> > +        res = ffa_direct_req_send_vm(subsr_vm_created[n], get_vm_id(d),
> > +                                     FFA_MSG_SEND_VM_CREATED);
> > +        if ( res )
> > +        {
> > +            printk(XENLOG_ERR "ffa: Failed to report creation of vm_id %u to  %u: res %d\n",
> > +                   get_vm_id(d), subsr_vm_created[n], res);
> > +            c_pos = n;
> > +            goto err;
> > +        }
> > +    }
> > +
> > +    INIT_LIST_HEAD(&ctx->frag_list);
> > +
> > +    d->arch.ffa = ctx;
> > +
> > +    return 0;
> > +
> > +err:
> > +    /* Undo any already sent vm created messaged */
> > +    for ( n = 0; n < c_pos; n++ )
> > +        for ( m = 0; m < subsr_vm_destroyed_count; m++ )
> > +            if ( subsr_vm_destroyed[m] == subsr_vm_created[n] )
> > +                ffa_direct_req_send_vm(subsr_vm_destroyed[n], get_vm_id(d),
> > +                                       FFA_MSG_SEND_VM_DESTROYED);
> > +    return -ENOMEM;
> > +}
> > +
> > +int ffa_relinquish_resources(struct domain *d)
> > +{
> > +    struct ffa_ctx *ctx = d->arch.ffa;
> > +    unsigned int n;
> > +    int32_t res;
> > +
> > +    if ( !ctx )
> > +        return 0;
> > +
> > +    for ( n = 0; n < subsr_vm_destroyed_count; n++ )
> > +    {
> > +        res = ffa_direct_req_send_vm(subsr_vm_destroyed[n], get_vm_id(d),
> > +                                     FFA_MSG_SEND_VM_DESTROYED);
> > +
> > +        if ( res )
> > +            printk(XENLOG_ERR "ffa: Failed to report destruction of vm_id %u to  %u: res %d\n",
> > +                   get_vm_id(d), subsr_vm_destroyed[n], res);
> > +    }
> > +
> > +    XFREE(d->arch.ffa);
> > +
> > +    return 0;
> > +}
> > +
> > +static bool __init init_subscribers(void)
> > +{
> > +    struct ffa_partition_info_1_1 *fpi;
> > +    bool ret = false;
> > +    uint32_t count;
> > +    uint32_t e;
> > +    uint32_t n;
> > +    uint32_t c_pos;
> > +    uint32_t d_pos;
> > +
> > +    if ( ffa_version < FFA_VERSION_1_1 )
> > +        return true;
> > +
> > +    e = ffa_partition_info_get(0, 0, 0, 0, 1, &count);
> > +    ffa_rx_release();
> > +    if ( e )
> > +    {
> > +        printk(XENLOG_ERR "ffa: Failed to get list of SPs: %d\n", (int)e);
> > +        goto out;
> > +    }
> > +
> > +    fpi = ffa_rx;
> > +    subsr_vm_created_count = 0;
> > +    subsr_vm_destroyed_count = 0;
> > +    for ( n = 0; n < count; n++ )
> > +    {
> > +        if (fpi[n].partition_properties & FFA_PART_PROP_NOTIF_CREATED)
> > +            subsr_vm_created_count++;
> > +        if (fpi[n].partition_properties & FFA_PART_PROP_NOTIF_DESTROYED)
> > +            subsr_vm_destroyed_count++;
> > +    }
> > +
> > +    if ( subsr_vm_created_count )
> > +        subsr_vm_created = xzalloc_array(uint16_t, subsr_vm_created_count);
> > +    if ( subsr_vm_destroyed_count )
> > +        subsr_vm_destroyed = xzalloc_array(uint16_t, subsr_vm_destroyed_count);
> > +    if ( (subsr_vm_created_count && !subsr_vm_created) ||
> > +        (subsr_vm_destroyed_count && !subsr_vm_destroyed) )
> > +    {
> > +        printk(XENLOG_ERR "ffa: Failed to allocate subscription lists\n");
> > +        subsr_vm_created_count = 0;
> > +        subsr_vm_destroyed_count = 0;
> > +        XFREE(subsr_vm_created);
> > +        XFREE(subsr_vm_destroyed);
> > +        goto out;
> > +    }
> > +
> > +    for ( c_pos = 0, d_pos = 0, n = 0; n < count; n++ )
> > +    {
> > +        if ( fpi[n].partition_properties & FFA_PART_PROP_NOTIF_CREATED )
> > +            subsr_vm_created[c_pos++] = fpi[n].id;
> > +        if ( fpi[n].partition_properties & FFA_PART_PROP_NOTIF_DESTROYED )
> > +            subsr_vm_destroyed[d_pos++] = fpi[n].id;
> > +    }
> > +
> > +    ret = true;
> > +out:
> > +    ffa_rx_release();
> > +    return ret;
> > +}
> > +
> > +static int __init ffa_init(void)
> > +{
> > +    uint32_t vers;
> > +    uint32_t e;
> > +    unsigned int major_vers;
> > +    unsigned int minor_vers;
> > +
> > +    /*
> > +     * psci_init_smccc() updates this value with what's reported by EL-3
> > +     * or secure world.
> > +     */
> > +    if ( smccc_ver < ARM_SMCCC_VERSION_1_2 )
> > +    {
> > +        printk(XENLOG_ERR
> > +               "ffa: unsupported SMCCC version %#x (need at least %#x)\n",
> > +               smccc_ver, ARM_SMCCC_VERSION_1_2);
> > +        return 0;
> > +    }
> > +
> > +    if ( !ffa_get_version(&vers) )
> > +        return 0;
> > +
> > +    if ( vers < FFA_MIN_VERSION || vers > FFA_MY_VERSION )
> > +    {
> > +        printk(XENLOG_ERR "ffa: Incompatible version %#x found\n", vers);
> > +        return 0;
> > +    }
> > +
> > +    major_vers = (vers >> FFA_VERSION_MAJOR_SHIFT) & FFA_VERSION_MAJOR_MASK;
> > +    minor_vers = vers & FFA_VERSION_MINOR_MASK;
> > +    printk(XENLOG_INFO "ARM FF-A Mediator version %u.%u\n",
> > +           FFA_VERSION_MAJOR, FFA_VERSION_MINOR);
> > +    printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
> > +           major_vers, minor_vers);
> > +
> > +    if ( !check_mandatory_feature(FFA_PARTITION_INFO_GET) ||
> > +         !check_mandatory_feature(FFA_RX_RELEASE) ||
> > +#ifdef CONFIG_ARM_64
> > +         !check_mandatory_feature(FFA_RXTX_MAP_64) ||
> > +         !check_mandatory_feature(FFA_MEM_SHARE_64) ||
> > +#endif
> > +#ifdef CONFIG_ARM_32
> > +         !check_mandatory_feature(FFA_RXTX_MAP_32) ||
> > +#endif
> > +         !check_mandatory_feature(FFA_RXTX_UNMAP) ||
> > +         !check_mandatory_feature(FFA_MEM_SHARE_32) ||
> > +         !check_mandatory_feature(FFA_MEM_FRAG_TX) ||
> > +         !check_mandatory_feature(FFA_MEM_RECLAIM) ||
> > +         !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
> > +        return 0;
> > +
> > +    ffa_rx = alloc_xenheap_pages(0, 0);
> > +    if ( !ffa_rx )
> > +        return 0;
> > +
> > +    ffa_tx = alloc_xenheap_pages(0, 0);
> > +    if ( !ffa_tx )
> > +        goto err_free_ffa_rx;
> > +
> > +    e = ffa_rxtx_map(__pa(ffa_tx), __pa(ffa_rx), 1);
> > +    if ( e )
> > +    {
> > +        printk(XENLOG_ERR "ffa: Failed to map rxtx: error %d\n", (int)e);
> > +        goto err_free_ffa_tx;
> > +    }
> > +    ffa_page_count = 1;
> > +    ffa_version = vers;
> > +
> > +    if ( !init_subscribers() )
> > +        goto err_free_ffa_tx;
> > +
> > +    return 0;
> > +
> > +err_free_ffa_tx:
> > +    free_xenheap_pages(ffa_tx, 0);
> > +    ffa_tx = NULL;
> > +err_free_ffa_rx:
> > +    free_xenheap_pages(ffa_rx, 0);
> > +    ffa_rx = NULL;
> > +    ffa_page_count = 0;
> > +    ffa_version = 0;
> > +    XFREE(subsr_vm_created);
> > +    subsr_vm_created_count = 0;
> > +    XFREE(subsr_vm_destroyed);
> > +    subsr_vm_destroyed_count = 0;
> > +    return 0;
> > +}
> > +
> > +__initcall(ffa_init);
> > diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> > index ed63c2b6f91f..b3dee269bced 100644
> > --- a/xen/arch/arm/include/asm/domain.h
> > +++ b/xen/arch/arm/include/asm/domain.h
> > @@ -103,6 +103,10 @@ struct arch_domain
> >     void *tee;
> > #endif
> >
> > +#ifdef CONFIG_FFA
> > +    void *ffa;
> > +#endif
> > +
> >     bool directmap;
> > }  __cacheline_aligned;
> >
> > diff --git a/xen/arch/arm/include/asm/ffa.h b/xen/arch/arm/include/asm/ffa.h
> > new file mode 100644
> > index 000000000000..4f4a739345bd
> > --- /dev/null
> > +++ b/xen/arch/arm/include/asm/ffa.h
> > @@ -0,0 +1,71 @@
> > +/*
> > + * xen/arch/arm/ffa.c
> > + *
> > + * Arm Firmware Framework for ARMv8-A(FFA) mediator
> > + *
> > + * Copyright (C) 2021  Linaro Limited
> > + *
> > + * Permission is hereby granted, free of charge, to any person
> > + * obtaining a copy of this software and associated documentation
> > + * files (the "Software"), to deal in the Software without restriction,
> > + * including without limitation the rights to use, copy, modify, merge,
> > + * publish, distribute, sublicense, and/or sell copies of the Software,
> > + * and to permit persons to whom the Software is furnished to do so,
> > + * subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice shall be
> > + * included in all copies or substantial portions of the Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > + * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> > + * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
> > + * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
> > + * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
> > + * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
> > + * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> > + */
> > +
> > +#ifndef __ASM_ARM_FFA_H__
> > +#define __ASM_ARM_FFA_H__
> > +
> > +#include <xen/const.h>
> > +
> > +#include <asm/smccc.h>
> > +#include <asm/types.h>
> > +
> > +#define FFA_FNUM_MIN_VALUE              _AC(0x60,U)
> > +#define FFA_FNUM_MAX_VALUE              _AC(0x86,U)
> > +
> > +static inline bool is_ffa_fid(uint32_t fid)
> > +{
> > +    uint32_t fn = fid & ARM_SMCCC_FUNC_MASK;
> > +
> > +    return fn >= FFA_FNUM_MIN_VALUE && fn <= FFA_FNUM_MAX_VALUE;
> > +}
> > +
> > +#ifdef CONFIG_FFA
> > +#define FFA_NR_FUNCS    11
> > +
> > +bool ffa_handle_call(struct cpu_user_regs *regs, uint32_t fid);
> > +int ffa_domain_init(struct domain *d, bool ffa_enabled);
> > +int ffa_relinquish_resources(struct domain *d);
> > +#else
> > +#define FFA_NR_FUNCS    0
> > +
> > +static inline bool ffa_handle_call(struct cpu_user_regs *regs, uint32_t fid)
> > +{
> > +    return false;
> > +}
> > +
> > +static inline int ffa_domain_init(struct domain *d, bool ffa_enabled)
> > +{
> > +    return 0;
> > +}
> > +
> > +static inline int ffa_relinquish_resources(struct domain *d)
> > +{
> > +    return 0;
> > +}
> > +#endif
> > +
> > +#endif /*__ASM_ARM_FFA_H__*/
> > diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
> > index 6f90c08a6304..34586025eff8 100644
> > --- a/xen/arch/arm/vsmc.c
> > +++ b/xen/arch/arm/vsmc.c
> > @@ -20,6 +20,7 @@
> > #include <public/arch-arm/smccc.h>
> > #include <asm/cpuerrata.h>
> > #include <asm/cpufeature.h>
> > +#include <asm/ffa.h>
> > #include <asm/monitor.h>
> > #include <asm/regs.h>
> > #include <asm/smccc.h>
> > @@ -32,7 +33,7 @@
> > #define XEN_SMCCC_FUNCTION_COUNT 3
> >
> > /* Number of functions currently supported by Standard Service Service Calls. */
> > -#define SSSC_SMCCC_FUNCTION_COUNT (3 + VPSCI_NR_FUNCS)
> > +#define SSSC_SMCCC_FUNCTION_COUNT (3 + VPSCI_NR_FUNCS + FFA_NR_FUNCS)
> >
> > static bool fill_uid(struct cpu_user_regs *regs, xen_uuid_t uuid)
> > {
> > @@ -196,13 +197,23 @@ static bool handle_existing_apis(struct cpu_user_regs *regs)
> >     return do_vpsci_0_1_call(regs, fid);
> > }
> >
> > +static bool is_psci_fid(uint32_t fid)
> > +{
> > +    uint32_t fn = fid & ARM_SMCCC_FUNC_MASK;
> > +
> > +    return fn >= 0 && fn <= 0x1fU;
> > +}
> > +
> > /* PSCI 0.2 interface and other Standard Secure Calls */
> > static bool handle_sssc(struct cpu_user_regs *regs)
> > {
> >     uint32_t fid = (uint32_t)get_user_reg(regs, 0);
> >
> > -    if ( do_vpsci_0_2_call(regs, fid) )
> > -        return true;
> > +    if ( is_psci_fid(fid) )
> > +        return do_vpsci_0_2_call(regs, fid);
> > +
> > +    if ( is_ffa_fid(fid) )
> > +        return ffa_handle_call(regs, fid);
> >
> >     switch ( fid )
> >     {
> > diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> > index ab05fe12b0de..53f8d44a6a8e 100644
> > --- a/xen/include/public/arch-arm.h
> > +++ b/xen/include/public/arch-arm.h
> > @@ -318,6 +318,8 @@ struct xen_arch_domainconfig {
> >     /* IN/OUT */
> >     uint8_t gic_version;
> >     /* IN */
> > +    uint8_t ffa_enabled;
> > +    /* IN */
> >     uint16_t tee_type;
> >     /* IN */
> >     uint32_t nr_spis;
> > --
> > 2.31.1
> >
>

