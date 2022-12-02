Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7933A6408C2
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 15:50:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.452063.709889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p17Mo-0006oa-GZ; Fri, 02 Dec 2022 14:50:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 452063.709889; Fri, 02 Dec 2022 14:50:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p17Mo-0006m3-DR; Fri, 02 Dec 2022 14:50:18 +0000
Received: by outflank-mailman (input) for mailman id 452063;
 Fri, 02 Dec 2022 14:50:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ddoq=4A=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1p17Mm-0005nw-Mn
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 14:50:16 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a17b19bd-7250-11ed-91b6-6bf2151ebd3b;
 Fri, 02 Dec 2022 15:50:15 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id f18so8138067wrj.5
 for <xen-devel@lists.xenproject.org>; Fri, 02 Dec 2022 06:50:15 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a05600c1c8f00b003c6c3fb3cf6sm9661920wms.18.2022.12.02.06.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Dec 2022 06:50:12 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C0BBC1FFB7;
 Fri,  2 Dec 2022 14:50:10 +0000 (GMT)
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
X-Inumbo-ID: a17b19bd-7250-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtOsOMHxl2uAhuuvJS1mpbtcZpv73B0kQPPuLimxlXE=;
        b=HFh0oL+wct9ZGd5uyOW/xzeOw8AHts1wEXWjryuZguo2anf3jBDF4E06449sun8ACX
         gkUWNn4onCC+1wCcECY7vq3X1VC9WpED+dit/Yd1uHG1jKuFPGYS5bpNjGcjmp4JJMBo
         O2DndXBeiMgVBk516BF3BJKkXAxhcqiljBdfQ3olWjc5fqtSZjxkui9hKsWJu4B4riJx
         nY7mdewgpW+PkADcAmE5pUsR4LEnLp2bTq7FqPZOcSC7l1cNQ2kHnzSwKiPOCbPpLMiB
         JYQ87OB6i7WQhejqQR771jmmdChGIwEvDN29hY69xFMNxWCNPk/cZ3CYmpSuHwc8TIOX
         BOlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rtOsOMHxl2uAhuuvJS1mpbtcZpv73B0kQPPuLimxlXE=;
        b=BKMniDyn9Z1wYxqsXxvxezIyC72iLJo3owPCJpS27xwVRH2BFkXylg95RdLtnRtjMg
         cApt3Nf9cIoZmGbAwDmQtI81uXkX50U8hFc9pX2IQCOS4ST3a4wEgHeOBPzOVaHnZYWT
         sd7wJgctJQRxN0qnu+cwrE1xgeiOwH48G1tPRPX6PQXEQSBsJ6Uz4QRHcjrqz5jfp4bR
         TuvSuVQGi1Q2gBlUjM6zeY2neRGstK+iT38bbENN2TcrBTuEFsPF536lIfur+k/IlWXW
         zPyHArrLmoK9h8u6kkrpNT9OHaILce1O5oXLb7L78Uj0dkuG5nFM1Dx9GesBc52vSrs3
         zGFw==
X-Gm-Message-State: ANoB5pnGKqYWHHBQzdMIZ+85+8U+yHGf3XtehN8JBlYCP7+xn3iAN7RV
	9w0V6YgBRazfCZHbmOA1I0CF6A==
X-Google-Smtp-Source: AA0mqf5FC5bEswqJYp+0/k8oVuqz5wzMi8Iqe9GPKDNivNIwwaLiMTy1ip6TQaQjaJdJCCJrdZP7lw==
X-Received: by 2002:a05:6000:8f:b0:22e:35e3:4427 with SMTP id m15-20020a056000008f00b0022e35e34427mr42744144wrx.44.1669992614656;
        Fri, 02 Dec 2022 06:50:14 -0800 (PST)
References: <20221202030003.11441-1-vikram.garhwal@amd.com>
 <20221202030003.11441-11-vikram.garhwal@amd.com>
User-agent: mu4e 1.9.3; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: qemu-dev@xilinx.com, stefano.stabellini@amd.com,
 xen-devel@lists.xenproject.org, Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard
 <anthony.perard@citrix.com>, Paul  Durrant <paul@xen.org>, "open list:ARM
 TCG CPUs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: Re: [QEMU][PATCH v2 10/11] hw/arm: introduce xenpv machine
Date: Fri, 02 Dec 2022 14:45:58 +0000
In-reply-to: <20221202030003.11441-11-vikram.garhwal@amd.com>
Message-ID: <875yetc125.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Vikram Garhwal <vikram.garhwal@amd.com> writes:

> Add a new machine xenpv which creates a IOREQ server to register/connect =
with
> Xen Hypervisor.
>
> Optional: When CONFIG_TPM is enabled, it also creates a tpm-tis-device, a=
dds a
> TPM emulator and connects to swtpm running on host machine via chardev so=
cket
> and support TPM functionalities for a guest domain.
>
> Extra command line for aarch64 xenpv QEMU to connect to swtpm:
>     -chardev socket,id=3Dchrtpm,path=3D/tmp/myvtpm2/swtpm-sock \
>     -tpmdev emulator,id=3Dtpm0,chardev=3Dchrtpm \
>
> swtpm implements a TPM software emulator(TPM 1.2 & TPM 2) built on libtpm=
s and
> provides access to TPM functionality over socket, chardev and CUSE interf=
ace.
> Github repo: https://github.com/stefanberger/swtpm
> Example for starting swtpm on host machine:
>     mkdir /tmp/vtpm2
>     swtpm socket --tpmstate dir=3D/tmp/vtpm2 \
>     --ctrl type=3Dunixio,path=3D/tmp/vtpm2/swtpm-sock &
>
> /* Comment about machine name. Will be removed in next version*/
> Please reply with the machine name you agree. Below are two possible name=
s:
> 1. xenpv
> 2. xenpvh
>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>  hw/arm/meson.build            |   2 +
>  hw/arm/xen_arm.c              | 175 ++++++++++++++++++++++++++++++++++
>  include/hw/arm/xen_arch_hvm.h |   9 ++
>  include/hw/xen/arch_hvm.h     |   2 +
>  4 files changed, 188 insertions(+)
>  create mode 100644 hw/arm/xen_arm.c
>  create mode 100644 include/hw/arm/xen_arch_hvm.h
>
> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
> index 92f9f6e000..0cae024374 100644
> --- a/hw/arm/meson.build
> +++ b/hw/arm/meson.build
> @@ -62,5 +62,7 @@ arm_ss.add(when: 'CONFIG_FSL_IMX7', if_true: files('fsl=
-imx7.c', 'mcimx7d-sabre.
>  arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c', 's=
mmuv3.c'))
>  arm_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mc=
imx6ul-evk.c'))
>  arm_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
> +arm_ss.add(when: 'CONFIG_XEN', if_true: files('xen_arm.c'))
> +arm_ss.add_all(xen_ss)
>=20=20
>  hw_arch +=3D {'arm': arm_ss}
> diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
> new file mode 100644
> index 0000000000..bcb8e95f2c
> --- /dev/null
> +++ b/hw/arm/xen_arm.c
> @@ -0,0 +1,175 @@
> +/*
> + * QEMU ARM Xen PV Machine
> + *
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
> + * of this software and associated documentation files (the "Software"),=
 to deal
> + * in the Software without restriction, including without limitation the=
 rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or =
sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
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
LL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/error-report.h"
> +#include "qapi/qapi-commands-migration.h"
> +#include "hw/boards.h"
> +#include "hw/sysbus.h"
> +#include "sysemu/block-backend.h"
> +#include "sysemu/tpm_backend.h"
> +#include "sysemu/sysemu.h"
> +#include "hw/xen/xen-legacy-backend.h"
> +#include "hw/xen/xen-hvm-common.h"
> +#include "sysemu/tpm.h"
> +#include "hw/xen/arch_hvm.h"
> +
> +#define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpv")
> +OBJECT_DECLARE_SIMPLE_TYPE(XenArmState, XEN_ARM)
> +
> +static MemoryListener xen_memory_listener =3D {
> +    .region_add =3D xen_region_add,
> +    .region_del =3D xen_region_del,
> +    .log_start =3D NULL,
> +    .log_stop =3D NULL,
> +    .log_sync =3D NULL,
> +    .log_global_start =3D NULL,
> +    .log_global_stop =3D NULL,
> +    .priority =3D 10,
> +};
> +
> +struct XenArmState {
> +    /*< private >*/
> +    MachineState parent;
> +
> +    XenIOState *state;
> +};
> +
> +void arch_handle_ioreq(XenIOState *state, ioreq_t *req)
> +{
> +    hw_error("Invalid ioreq type 0x%x\n", req->type);
> +
> +    return;
> +}
> +
> +void arch_xen_set_memory(XenIOState *state, MemoryRegionSection *section,
> +                         bool add)
> +{
> +}
> +
> +void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
> +{
> +}
> +
> +void qmp_xen_set_global_dirty_log(bool enable, Error **errp)
> +{
> +}
> +

This function is only used under CONFIG_TPM so without it you get:

  ../../hw/arm/xen_arm.c:78:12: error: =E2=80=98xen_init_ioreq=E2=80=99 def=
ined but not used [-Werror=3Dunused-function]
     78 | static int xen_init_ioreq(XenIOState *state, unsigned int max_cpu=
s)
        |            ^~~~~~~~~~~~~~
  cc1: all warnings being treated as errors

I think I reported this on v1 as well.

> +static int xen_init_ioreq(XenIOState *state, unsigned int max_cpus)
> +{
> +    xen_dmod =3D xendevicemodel_open(0, 0);
> +    if (xen_dmod =3D=3D NULL) {
> +        perror("xen: can't open xen device model interface\n");
> +        return -1;
> +    }
> +
> +    xen_xc =3D xc_interface_open(0, 0, 0);
> +    if (xen_xc =3D=3D NULL) {
> +        perror("xen: can't open xen interface\n");
> +        return -1;
> +    }
> +
> +    xen_fmem =3D xenforeignmemory_open(0, 0);
> +    if (xen_fmem =3D=3D NULL) {
> +        perror("xen: can't open xen fmem interface\n");
> +        xc_interface_close(xen_xc);
> +        return -1;
> +    }
> +
> +    xen_register_ioreq(state, max_cpus, xen_memory_listener);
> +
> +    xen_register_backend(state);
> +
> +    xenstore_record_dm_state(state->xenstore, "running");
> +
> +    return 0;
> +}
> +
> +static void xen_enable_tpm(void)
> +{
> +/* qemu_find_tpm_be is only available when CONFIG_TPM is enabled. */
> +#ifdef CONFIG_TPM
> +    Error *errp =3D NULL;
> +    DeviceState *dev;
> +    SysBusDevice *busdev;
> +
> +    TPMBackend *be =3D qemu_find_tpm_be("tpm0");
> +    if (be =3D=3D NULL) {
> +        DPRINTF("Couldn't fine the backend for tpm0\n");
> +        return;
> +    }
> +    dev =3D qdev_new(TYPE_TPM_TIS_SYSBUS);
> +    object_property_set_link(OBJECT(dev), "tpmdev", OBJECT(be), &errp);
> +    object_property_set_str(OBJECT(dev), "tpmdev", be->id, &errp);
> +    busdev =3D SYS_BUS_DEVICE(dev);
> +    sysbus_realize_and_unref(busdev, &error_fatal);
> +    sysbus_mmio_map(busdev, 0, GUEST_TPM_BASE);
> +
> +    DPRINTF("Connected tpmdev at address 0x%lx\n", GUEST_TPM_BASE);
> +#endif
> +}
> +
> +static void xen_arm_init(MachineState *machine)
> +{
> +    XenArmState *xam =3D XEN_ARM(machine);
> +
> +    xam->state =3D  g_new0(XenIOState, 1);
> +
> +    /* For now enable IOREQ only for CONFIG_TPM. */
> +#ifdef CONFIG_TPM
> +    if (xen_init_ioreq(xam->state, machine->smp.cpus)) {
> +        return;
> +    }
> +#endif
> +
> +    xen_enable_tpm();

In fact this just looks weird - you guard the call to init_ioreq with
ifdefs guarding it but nest those ifdefs in xen_enable_tpm. Surely you
want the IOREQ server support even if you don't have TPM. Otherwise it
should be a hard configure requirement.

> +
> +    return;
> +}
> +
> +static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
> +{
> +
> +    MachineClass *mc =3D MACHINE_CLASS(oc);
> +    mc->desc =3D "Xen Para-virtualized PC";
> +    mc->init =3D xen_arm_init;
> +    mc->max_cpus =3D 1;
> +
> +#ifdef CONFIG_TPM
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
> +#endif
> +}
> +
> +static const TypeInfo xen_arm_machine_type =3D {
> +    .name =3D TYPE_XEN_ARM,
> +    .parent =3D TYPE_MACHINE,
> +    .class_init =3D xen_arm_machine_class_init,
> +    .instance_size =3D sizeof(XenArmState),
> +};
> +
> +static void xen_arm_machine_register_types(void)
> +{
> +    type_register_static(&xen_arm_machine_type);
> +}
> +
> +type_init(xen_arm_machine_register_types)
> diff --git a/include/hw/arm/xen_arch_hvm.h b/include/hw/arm/xen_arch_hvm.h
> new file mode 100644
> index 0000000000..8fd645e723
> --- /dev/null
> +++ b/include/hw/arm/xen_arch_hvm.h
> @@ -0,0 +1,9 @@
> +#ifndef HW_XEN_ARCH_ARM_HVM_H
> +#define HW_XEN_ARCH_ARM_HVM_H
> +
> +#include <xen/hvm/ioreq.h>
> +void arch_handle_ioreq(XenIOState *state, ioreq_t *req);
> +void arch_xen_set_memory(XenIOState *state,
> +                         MemoryRegionSection *section,
> +                         bool add);
> +#endif
> diff --git a/include/hw/xen/arch_hvm.h b/include/hw/xen/arch_hvm.h
> index 26674648d8..c7c515220d 100644
> --- a/include/hw/xen/arch_hvm.h
> +++ b/include/hw/xen/arch_hvm.h
> @@ -1,3 +1,5 @@
>  #if defined(TARGET_I386) || defined(TARGET_X86_64)
>  #include "hw/i386/xen_arch_hvm.h"
> +#elif defined(TARGET_ARM) || defined(TARGET_ARM_64)
> +#include "hw/arm/xen_arch_hvm.h"
>  #endif


--=20
Alex Benn=C3=A9e

