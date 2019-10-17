Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BB3DB052
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2019 16:44:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iL6xF-0005od-RX; Thu, 17 Oct 2019 14:40:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ihif=YK=gmail.com=aleksandar.m.mail@srs-us1.protection.inumbo.net>)
 id 1iL6xE-0005oU-3a
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2019 14:40:40 +0000
X-Inumbo-ID: 15fbc196-f0ec-11e9-8aca-bc764e2007e4
Received: from mail-oi1-x241.google.com (unknown [2607:f8b0:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 15fbc196-f0ec-11e9-8aca-bc764e2007e4;
 Thu, 17 Oct 2019 14:40:38 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id w144so2354453oia.6
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2019 07:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=VYPoO4lbG3w9123BzjywTooFiwratbQnQMk1YHCAfFg=;
 b=L4P9MbXXPZlhCVd2ShUi3KdqyqOiINQFPVPrs9pQQHao8TjQ0k2NLA0QNqy+XCqdax
 GWotbzYsn6DpTczgGt5BAJrH+NDpaxNo8bj6IdcZpV/G4mBSg9qW8Vh5BluzpYFaykgP
 RdL7QzjYVRcbfErGSDkilbxtbJ2gSYzK7vs9hLSygPSki8skgYa988QFgvJ3udxHSh0A
 +eGc128m9F1nOTysaTY+beqBf89F87F0JB6BPYMlx2GFHW2DwpUwZBD6LCpxpST4kc5X
 xTg646HwwA4WTlYXRbC5CnTz5jyGv+Vzqn0g4tKvLZ5zjRp6/5mAe/oN6phTy96CLcez
 uEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=VYPoO4lbG3w9123BzjywTooFiwratbQnQMk1YHCAfFg=;
 b=pLuKmhjnxIzN0hk5SeRupPcfj0OmvmMi41OhsKAEu2bBmk+MHtae1HCiTdWdopGFZF
 a9wkrDBWpLKc5Akxw3a+gymoCGSbd9wAhvIwccCFtEeN4zSMhoDD42DJ9E9uB3MhfYoK
 XdxNOC6Y1kMdLKP9lofTcs+PIrfRFZMbTaRa7T2yPOqrKxn/TzrzVHuLpOMZdu5pyt8G
 hFcVDHLIyuZDBjPlrTbAd3YAruLrOBkxBxojVaQEAFl1W8cBggUL7INY7u0vt/FCAkNM
 7i9WWH4kr8+0Zf+vM132FTbavKJ0yE6VryAUleZiRDC/RuZw+T2q+0iK1zG1uFMSmFQz
 YNyQ==
X-Gm-Message-State: APjAAAX/e65UkplbJlvoY4MOAZEGrP0sRNmUbRewkqVao7yeoX+RjCnk
 1B0kt18XDSkAFD7wB8ZZwy36GrPcx8RoSrMr0BQ=
X-Google-Smtp-Source: APXvYqya7jpeioPRUMfUfXO90agCqNqUea1QleFQ8y+GhvYfsqvGu3iame1a6tGKQEablQwzOYg3HlCUynuiMnqcgyM=
X-Received: by 2002:aca:62d5:: with SMTP id w204mr3533524oib.136.1571323238033; 
 Thu, 17 Oct 2019 07:40:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Thu, 17 Oct 2019 07:40:37
 -0700 (PDT)
In-Reply-To: <20191015162705.28087-2-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
 <20191015162705.28087-2-philmd@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Thu, 17 Oct 2019 16:40:37 +0200
Message-ID: <CAL1e-=gSGV2RJUG9gcAVduxrZ53cxS58YujyHgYhJOt39Y_ZeQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Xen-devel] [PATCH 01/32] hw/i386: Remove obsolete
 LoadStateHandler::load_state_old handlers
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Type: multipart/mixed; boundary="===============6010323917613745079=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6010323917613745079==
Content-Type: multipart/alternative; boundary="0000000000006e378905951c33e3"

--0000000000006e378905951c33e3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m>
wrote:

> These devices implemented their load_state_old() handler 10 years
> ago, previous to QEMU v0.12.
> Since commit cc425b5ddf removed the pc-0.10 and pc-0.11 machines,
> we can drop this code.
>
> Note: the mips_r4k machine started to use the i8254 device just
> after QEMU v0.5.0, but the MIPS machine types are not versioned,
> so there is no migration compatibility issue removing this handler.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/acpi/piix4.c         | 40 ---------------------------------
>  hw/intc/apic_common.c   | 49 -----------------------------------------
>  hw/pci-host/piix.c      | 25 ---------------------
>  hw/timer/i8254_common.c | 40 ---------------------------------
>  4 files changed, 154 deletions(-)
>
>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>



> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index 5742c3df87..1d29d438c7 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -42,7 +42,6 @@
>  #include "hw/acpi/memory_hotplug.h"
>  #include "hw/acpi/acpi_dev_interface.h"
>  #include "hw/xen/xen.h"
> -#include "migration/qemu-file-types.h"
>  #include "migration/vmstate.h"
>  #include "hw/core/cpu.h"
>  #include "trace.h"
> @@ -205,43 +204,6 @@ static const VMStateDescription vmstate_pci_status =
=3D {
>      }
>  };
>
> -static int acpi_load_old(QEMUFile *f, void *opaque, int version_id)
> -{
> -    PIIX4PMState *s =3D opaque;
> -    int ret, i;
> -    uint16_t temp;
> -
> -    ret =3D pci_device_load(PCI_DEVICE(s), f);
> -    if (ret < 0) {
> -        return ret;
> -    }
> -    qemu_get_be16s(f, &s->ar.pm1.evt.sts);
> -    qemu_get_be16s(f, &s->ar.pm1.evt.en);
> -    qemu_get_be16s(f, &s->ar.pm1.cnt.cnt);
> -
> -    ret =3D vmstate_load_state(f, &vmstate_apm, &s->apm, 1);
> -    if (ret) {
> -        return ret;
> -    }
> -
> -    timer_get(f, s->ar.tmr.timer);
> -    qemu_get_sbe64s(f, &s->ar.tmr.overflow_time);
> -
> -    qemu_get_be16s(f, (uint16_t *)s->ar.gpe.sts);
> -    for (i =3D 0; i < 3; i++) {
> -        qemu_get_be16s(f, &temp);
> -    }
> -
> -    qemu_get_be16s(f, (uint16_t *)s->ar.gpe.en);
> -    for (i =3D 0; i < 3; i++) {
> -        qemu_get_be16s(f, &temp);
> -    }
> -
> -    ret =3D vmstate_load_state(f, &vmstate_pci_status,
> -        &s->acpi_pci_hotplug.acpi_pcihp_pci_status[ACPI_PCIHP_BSEL_DEFAU=
LT],
> 1);
> -    return ret;
> -}
> -
>  static bool vmstate_test_use_acpi_pci_hotplug(void *opaque, int
> version_id)
>  {
>      PIIX4PMState *s =3D opaque;
> @@ -313,8 +275,6 @@ static const VMStateDescription vmstate_acpi =3D {
>      .name =3D "piix4_pm",
>      .version_id =3D 3,
>      .minimum_version_id =3D 3,
> -    .minimum_version_id_old =3D 1,
> -    .load_state_old =3D acpi_load_old,
>      .post_load =3D vmstate_acpi_post_load,
>      .fields =3D (VMStateField[]) {
>          VMSTATE_PCI_DEVICE(parent_obj, PIIX4PMState),
> diff --git a/hw/intc/apic_common.c b/hw/intc/apic_common.c
> index aafd8e0e33..375cb6abe9 100644
> --- a/hw/intc/apic_common.c
> +++ b/hw/intc/apic_common.c
> @@ -31,7 +31,6 @@
>  #include "sysemu/kvm.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/sysbus.h"
> -#include "migration/qemu-file-types.h"
>  #include "migration/vmstate.h"
>
>  static int apic_irq_delivered;
> @@ -262,52 +261,6 @@ static void apic_reset_common(DeviceState *dev)
>      apic_init_reset(dev);
>  }
>
> -/* This function is only used for old state version 1 and 2 */
> -static int apic_load_old(QEMUFile *f, void *opaque, int version_id)
> -{
> -    APICCommonState *s =3D opaque;
> -    APICCommonClass *info =3D APIC_COMMON_GET_CLASS(s);
> -    int i;
> -
> -    if (version_id > 2) {
> -        return -EINVAL;
> -    }
> -
> -    /* XXX: what if the base changes? (registered memory regions) */
> -    qemu_get_be32s(f, &s->apicbase);
> -    qemu_get_8s(f, &s->id);
> -    qemu_get_8s(f, &s->arb_id);
> -    qemu_get_8s(f, &s->tpr);
> -    qemu_get_be32s(f, &s->spurious_vec);
> -    qemu_get_8s(f, &s->log_dest);
> -    qemu_get_8s(f, &s->dest_mode);
> -    for (i =3D 0; i < 8; i++) {
> -        qemu_get_be32s(f, &s->isr[i]);
> -        qemu_get_be32s(f, &s->tmr[i]);
> -        qemu_get_be32s(f, &s->irr[i]);
> -    }
> -    for (i =3D 0; i < APIC_LVT_NB; i++) {
> -        qemu_get_be32s(f, &s->lvt[i]);
> -    }
> -    qemu_get_be32s(f, &s->esr);
> -    qemu_get_be32s(f, &s->icr[0]);
> -    qemu_get_be32s(f, &s->icr[1]);
> -    qemu_get_be32s(f, &s->divide_conf);
> -    s->count_shift =3D qemu_get_be32(f);
> -    qemu_get_be32s(f, &s->initial_count);
> -    s->initial_count_load_time =3D qemu_get_be64(f);
> -    s->next_time =3D qemu_get_be64(f);
> -
> -    if (version_id >=3D 2) {
> -        s->timer_expiry =3D qemu_get_be64(f);
> -    }
> -
> -    if (info->post_load) {
> -        info->post_load(s);
> -    }
> -    return 0;
> -}
> -
>  static const VMStateDescription vmstate_apic_common;
>
>  static void apic_common_realize(DeviceState *dev, Error **errp)
> @@ -408,8 +361,6 @@ static const VMStateDescription vmstate_apic_common =
=3D {
>      .name =3D "apic",
>      .version_id =3D 3,
>      .minimum_version_id =3D 3,
> -    .minimum_version_id_old =3D 1,
> -    .load_state_old =3D apic_load_old,
>      .pre_load =3D apic_pre_load,
>      .pre_save =3D apic_dispatch_pre_save,
>      .post_load =3D apic_dispatch_post_load,
> diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c
> index 135c645535..2f4cbcbfe9 100644
> --- a/hw/pci-host/piix.c
> +++ b/hw/pci-host/piix.c
> @@ -33,7 +33,6 @@
>  #include "qapi/error.h"
>  #include "qemu/range.h"
>  #include "hw/xen/xen.h"
> -#include "migration/qemu-file-types.h"
>  #include "migration/vmstate.h"
>  #include "hw/pci-host/pam.h"
>  #include "sysemu/reset.h"
> @@ -174,28 +173,6 @@ static void i440fx_write_config(PCIDevice *dev,
>      }
>  }
>
> -static int i440fx_load_old(QEMUFile* f, void *opaque, int version_id)
> -{
> -    PCII440FXState *d =3D opaque;
> -    PCIDevice *pd =3D PCI_DEVICE(d);
> -    int ret, i;
> -    uint8_t smm_enabled;
> -
> -    ret =3D pci_device_load(pd, f);
> -    if (ret < 0)
> -        return ret;
> -    i440fx_update_memory_mappings(d);
> -    qemu_get_8s(f, &smm_enabled);
> -
> -    if (version_id =3D=3D 2) {
> -        for (i =3D 0; i < PIIX_NUM_PIRQS; i++) {
> -            qemu_get_be32(f); /* dummy load for compatibility */
> -        }
> -    }
> -
> -    return 0;
> -}
> -
>  static int i440fx_post_load(void *opaque, int version_id)
>  {
>      PCII440FXState *d =3D opaque;
> @@ -208,8 +185,6 @@ static const VMStateDescription vmstate_i440fx =3D {
>      .name =3D "I440FX",
>      .version_id =3D 3,
>      .minimum_version_id =3D 3,
> -    .minimum_version_id_old =3D 1,
> -    .load_state_old =3D i440fx_load_old,
>      .post_load =3D i440fx_post_load,
>      .fields =3D (VMStateField[]) {
>          VMSTATE_PCI_DEVICE(parent_obj, PCII440FXState),
> diff --git a/hw/timer/i8254_common.c b/hw/timer/i8254_common.c
> index 57bf10cc94..050875b497 100644
> --- a/hw/timer/i8254_common.c
> +++ b/hw/timer/i8254_common.c
> @@ -29,7 +29,6 @@
>  #include "qemu/timer.h"
>  #include "hw/timer/i8254.h"
>  #include "hw/timer/i8254_internal.h"
> -#include "migration/qemu-file-types.h"
>  #include "migration/vmstate.h"
>
>  /* val must be 0 or 1 */
> @@ -202,43 +201,6 @@ static const VMStateDescription vmstate_pit_channel =
=3D
> {
>      }
>  };
>
> -static int pit_load_old(QEMUFile *f, void *opaque, int version_id)
> -{
> -    PITCommonState *pit =3D opaque;
> -    PITCommonClass *c =3D PIT_COMMON_GET_CLASS(pit);
> -    PITChannelState *s;
> -    int i;
> -
> -    if (version_id !=3D 1) {
> -        return -EINVAL;
> -    }
> -
> -    for (i =3D 0; i < 3; i++) {
> -        s =3D &pit->channels[i];
> -        s->count =3D qemu_get_be32(f);
> -        qemu_get_be16s(f, &s->latched_count);
> -        qemu_get_8s(f, &s->count_latched);
> -        qemu_get_8s(f, &s->status_latched);
> -        qemu_get_8s(f, &s->status);
> -        qemu_get_8s(f, &s->read_state);
> -        qemu_get_8s(f, &s->write_state);
> -        qemu_get_8s(f, &s->write_latch);
> -        qemu_get_8s(f, &s->rw_mode);
> -        qemu_get_8s(f, &s->mode);
> -        qemu_get_8s(f, &s->bcd);
> -        qemu_get_8s(f, &s->gate);
> -        s->count_load_time =3D qemu_get_be64(f);
> -        s->irq_disabled =3D 0;
> -        if (i =3D=3D 0) {
> -            s->next_transition_time =3D qemu_get_be64(f);
> -        }
> -    }
> -    if (c->post_load) {
> -        c->post_load(pit);
> -    }
> -    return 0;
> -}
> -
>  static int pit_dispatch_pre_save(void *opaque)
>  {
>      PITCommonState *s =3D opaque;
> @@ -266,8 +228,6 @@ static const VMStateDescription vmstate_pit_common =
=3D {
>      .name =3D "i8254",
>      .version_id =3D 3,
>      .minimum_version_id =3D 2,
> -    .minimum_version_id_old =3D 1,
> -    .load_state_old =3D pit_load_old,
>      .pre_save =3D pit_dispatch_pre_save,
>      .post_load =3D pit_dispatch_post_load,
>      .fields =3D (VMStateField[]) {
> --
> 2.21.0
>
>
>

--0000000000006e378905951c33e3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">These devices implemented their load_state_old() ha=
ndler 10 years<br>
ago, previous to QEMU v0.12.<br>
Since commit cc425b5ddf removed the pc-0.10 and pc-0.11 machines,<br>
we can drop this code.<br>
<br>
Note: the mips_r4k machine started to use the i8254 device just<br>
after QEMU v0.5.0, but the MIPS machine types are not versioned,<br>
so there is no migration compatibility issue removing this handler.<br>
<br>
Suggested-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org"=
>peter.maydell@linaro.org</a>&gt;<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/acpi/piix4.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 40 ---------------=
---------------<wbr>---<br>
=C2=A0hw/intc/apic_common.c=C2=A0 =C2=A0| 49 ------------------------------=
<wbr>-----------<br>
=C2=A0hw/pci-host/piix.c=C2=A0 =C2=A0 =C2=A0 | 25 ---------------------<br>
=C2=A0hw/timer/i8254_common.c | 40 ------------------------------<wbr>---<b=
r>
=C2=A04 files changed, 154 deletions(-)<br>
<br></blockquote><div><br></div><div><div id=3D"cvcmsg_16dbfeb33c93ed97" cl=
ass=3D"yh  " style=3D"border-top-left-radius:0px;border-top-right-radius:0p=
x;margin-bottom:11px;overflow:visible"><div class=3D"Vh" id=3D"cvcfullmsg_1=
6dbfeb33c93ed97"><div id=3D"cvcmsgbod_16dbfeb33c93ed97" class=3D"aj"><div c=
lass=3D"Ni"><div class=3D"ni pi " dir=3D"ltr"><p dir=3D"ltr">Reviewed-by: A=
leksandar Markovic &lt;<a href=3D"mailto:amarkovic@wavecomp.com" target=3D"=
_blank">amarkovic@wavecomp.com</a>&gt;</p><div style=3D"clear:both"></div><=
/div><div style=3D"clear:both"></div><div><div class=3D"M j T b hc Aj S" ta=
bindex=3D"0"><div class=3D"V j hf"></div></div></div><div style=3D"clear:bo=
th"></div></div></div></div></div><div id=3D"cvcmsg_16dbfecd588da1f7" class=
=3D"yh" style=3D"margin-bottom:11px"><div class=3D"Vh" id=3D"cvcfullmsg_16d=
bfecd588da1f7"><div class=3D"M j Zi Mi  " tabindex=3D"0"><div id=3D"cvcrepl=
y_16dbfecd588da1f7" class=3D"M j T b hc xh S  " tabindex=3D"0"><div class=
=3D"V j td"></div></div></div></div></div></div><div><br></div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c<br>
index 5742c3df87..1d29d438c7 100644<br>
--- a/hw/acpi/piix4.c<br>
+++ b/hw/acpi/piix4.c<br>
@@ -42,7 +42,6 @@<br>
=C2=A0#include &quot;hw/acpi/memory_hotplug.h&quot;<br>
=C2=A0#include &quot;hw/acpi/acpi_dev_interface.h&quot;<br>
=C2=A0#include &quot;hw/xen/xen.h&quot;<br>
-#include &quot;migration/qemu-file-types.h&quot;<br>
=C2=A0#include &quot;migration/vmstate.h&quot;<br>
=C2=A0#include &quot;hw/core/cpu.h&quot;<br>
=C2=A0#include &quot;trace.h&quot;<br>
@@ -205,43 +204,6 @@ static const VMStateDescription vmstate_pci_status =3D=
 {<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0};<br>
<br>
-static int acpi_load_old(QEMUFile *f, void *opaque, int version_id)<br>
-{<br>
-=C2=A0 =C2=A0 PIIX4PMState *s =3D opaque;<br>
-=C2=A0 =C2=A0 int ret, i;<br>
-=C2=A0 =C2=A0 uint16_t temp;<br>
-<br>
-=C2=A0 =C2=A0 ret =3D pci_device_load(PCI_DEVICE(s), f);<br>
-=C2=A0 =C2=A0 if (ret &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 qemu_get_be16s(f, &amp;s-&gt;ar.pm1.evt.sts);<br>
-=C2=A0 =C2=A0 qemu_get_be16s(f, &amp;s-&gt;ar.pm1.evt.en);<br>
-=C2=A0 =C2=A0 qemu_get_be16s(f, &amp;s-&gt;ar.pm1.cnt.cnt);<br>
-<br>
-=C2=A0 =C2=A0 ret =3D vmstate_load_state(f, &amp;vmstate_apm, &amp;s-&gt;a=
pm, 1);<br>
-=C2=A0 =C2=A0 if (ret) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 timer_get(f, s-&gt;ar.tmr.timer);<br>
-=C2=A0 =C2=A0 qemu_get_sbe64s(f, &amp;s-&gt;ar.tmr.overflow_time);<br>
-<br>
-=C2=A0 =C2=A0 qemu_get_be16s(f, (uint16_t *)s-&gt;ar.gpe.sts);<br>
-=C2=A0 =C2=A0 for (i =3D 0; i &lt; 3; i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_get_be16s(f, &amp;temp);<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 qemu_get_be16s(f, (uint16_t *)s-&gt;ar.gpe.en);<br>
-=C2=A0 =C2=A0 for (i =3D 0; i &lt; 3; i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_get_be16s(f, &amp;temp);<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 ret =3D vmstate_load_state(f, &amp;vmstate_pci_status,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;s-&gt;acpi_pci_hotplug.acpi_<wbr>pcihp_pc=
i_status[ACPI_PCIHP_<wbr>BSEL_DEFAULT], 1);<br>
-=C2=A0 =C2=A0 return ret;<br>
-}<br>
-<br>
=C2=A0static bool vmstate_test_use_acpi_pci_<wbr>hotplug(void *opaque, int =
version_id)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0PIIX4PMState *s =3D opaque;<br>
@@ -313,8 +275,6 @@ static const VMStateDescription vmstate_acpi =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name =3D &quot;piix4_pm&quot;,<br>
=C2=A0 =C2=A0 =C2=A0.version_id =3D 3,<br>
=C2=A0 =C2=A0 =C2=A0.minimum_version_id =3D 3,<br>
-=C2=A0 =C2=A0 .minimum_version_id_old =3D 1,<br>
-=C2=A0 =C2=A0 .load_state_old =3D acpi_load_old,<br>
=C2=A0 =C2=A0 =C2=A0.post_load =3D vmstate_acpi_post_load,<br>
=C2=A0 =C2=A0 =C2=A0.fields =3D (VMStateField[]) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_PCI_DEVICE(parent_obj, PIIX4PMSta=
te),<br>
diff --git a/hw/intc/apic_common.c b/hw/intc/apic_common.c<br>
index aafd8e0e33..375cb6abe9 100644<br>
--- a/hw/intc/apic_common.c<br>
+++ b/hw/intc/apic_common.c<br>
@@ -31,7 +31,6 @@<br>
=C2=A0#include &quot;sysemu/kvm.h&quot;<br>
=C2=A0#include &quot;hw/qdev-properties.h&quot;<br>
=C2=A0#include &quot;hw/sysbus.h&quot;<br>
-#include &quot;migration/qemu-file-types.h&quot;<br>
=C2=A0#include &quot;migration/vmstate.h&quot;<br>
<br>
=C2=A0static int apic_irq_delivered;<br>
@@ -262,52 +261,6 @@ static void apic_reset_common(DeviceState *dev)<br>
=C2=A0 =C2=A0 =C2=A0apic_init_reset(dev);<br>
=C2=A0}<br>
<br>
-/* This function is only used for old state version 1 and 2 */<br>
-static int apic_load_old(QEMUFile *f, void *opaque, int version_id)<br>
-{<br>
-=C2=A0 =C2=A0 APICCommonState *s =3D opaque;<br>
-=C2=A0 =C2=A0 APICCommonClass *info =3D APIC_COMMON_GET_CLASS(s);<br>
-=C2=A0 =C2=A0 int i;<br>
-<br>
-=C2=A0 =C2=A0 if (version_id &gt; 2) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 /* XXX: what if the base changes? (registered memory regions=
) */<br>
-=C2=A0 =C2=A0 qemu_get_be32s(f, &amp;s-&gt;apicbase);<br>
-=C2=A0 =C2=A0 qemu_get_8s(f, &amp;s-&gt;id);<br>
-=C2=A0 =C2=A0 qemu_get_8s(f, &amp;s-&gt;arb_id);<br>
-=C2=A0 =C2=A0 qemu_get_8s(f, &amp;s-&gt;tpr);<br>
-=C2=A0 =C2=A0 qemu_get_be32s(f, &amp;s-&gt;spurious_vec);<br>
-=C2=A0 =C2=A0 qemu_get_8s(f, &amp;s-&gt;log_dest);<br>
-=C2=A0 =C2=A0 qemu_get_8s(f, &amp;s-&gt;dest_mode);<br>
-=C2=A0 =C2=A0 for (i =3D 0; i &lt; 8; i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_get_be32s(f, &amp;s-&gt;isr[i]);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_get_be32s(f, &amp;s-&gt;tmr[i]);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_get_be32s(f, &amp;s-&gt;irr[i]);<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 for (i =3D 0; i &lt; APIC_LVT_NB; i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_get_be32s(f, &amp;s-&gt;lvt[i]);<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 qemu_get_be32s(f, &amp;s-&gt;esr);<br>
-=C2=A0 =C2=A0 qemu_get_be32s(f, &amp;s-&gt;icr[0]);<br>
-=C2=A0 =C2=A0 qemu_get_be32s(f, &amp;s-&gt;icr[1]);<br>
-=C2=A0 =C2=A0 qemu_get_be32s(f, &amp;s-&gt;divide_conf);<br>
-=C2=A0 =C2=A0 s-&gt;count_shift =3D qemu_get_be32(f);<br>
-=C2=A0 =C2=A0 qemu_get_be32s(f, &amp;s-&gt;initial_count);<br>
-=C2=A0 =C2=A0 s-&gt;initial_count_load_time =3D qemu_get_be64(f);<br>
-=C2=A0 =C2=A0 s-&gt;next_time =3D qemu_get_be64(f);<br>
-<br>
-=C2=A0 =C2=A0 if (version_id &gt;=3D 2) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;timer_expiry =3D qemu_get_be64(f);<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 if (info-&gt;post_load) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 info-&gt;post_load(s);<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 return 0;<br>
-}<br>
-<br>
=C2=A0static const VMStateDescription vmstate_apic_common;<br>
<br>
=C2=A0static void apic_common_realize(<wbr>DeviceState *dev, Error **errp)<=
br>
@@ -408,8 +361,6 @@ static const VMStateDescription vmstate_apic_common =3D=
 {<br>
=C2=A0 =C2=A0 =C2=A0.name =3D &quot;apic&quot;,<br>
=C2=A0 =C2=A0 =C2=A0.version_id =3D 3,<br>
=C2=A0 =C2=A0 =C2=A0.minimum_version_id =3D 3,<br>
-=C2=A0 =C2=A0 .minimum_version_id_old =3D 1,<br>
-=C2=A0 =C2=A0 .load_state_old =3D apic_load_old,<br>
=C2=A0 =C2=A0 =C2=A0.pre_load =3D apic_pre_load,<br>
=C2=A0 =C2=A0 =C2=A0.pre_save =3D apic_dispatch_pre_save,<br>
=C2=A0 =C2=A0 =C2=A0.post_load =3D apic_dispatch_post_load,<br>
diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c<br>
index 135c645535..2f4cbcbfe9 100644<br>
--- a/hw/pci-host/piix.c<br>
+++ b/hw/pci-host/piix.c<br>
@@ -33,7 +33,6 @@<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;qemu/range.h&quot;<br>
=C2=A0#include &quot;hw/xen/xen.h&quot;<br>
-#include &quot;migration/qemu-file-types.h&quot;<br>
=C2=A0#include &quot;migration/vmstate.h&quot;<br>
=C2=A0#include &quot;hw/pci-host/pam.h&quot;<br>
=C2=A0#include &quot;sysemu/reset.h&quot;<br>
@@ -174,28 +173,6 @@ static void i440fx_write_config(PCIDevice *dev,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-static int i440fx_load_old(QEMUFile* f, void *opaque, int version_id)<br>
-{<br>
-=C2=A0 =C2=A0 PCII440FXState *d =3D opaque;<br>
-=C2=A0 =C2=A0 PCIDevice *pd =3D PCI_DEVICE(d);<br>
-=C2=A0 =C2=A0 int ret, i;<br>
-=C2=A0 =C2=A0 uint8_t smm_enabled;<br>
-<br>
-=C2=A0 =C2=A0 ret =3D pci_device_load(pd, f);<br>
-=C2=A0 =C2=A0 if (ret &lt; 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
-=C2=A0 =C2=A0 i440fx_update_memory_mappings(<wbr>d);<br>
-=C2=A0 =C2=A0 qemu_get_8s(f, &amp;smm_enabled);<br>
-<br>
-=C2=A0 =C2=A0 if (version_id =3D=3D 2) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; PIIX_NUM_PIRQS; i++) {<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_get_be32(f); /* dummy load =
for compatibility */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 return 0;<br>
-}<br>
-<br>
=C2=A0static int i440fx_post_load(void *opaque, int version_id)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0PCII440FXState *d =3D opaque;<br>
@@ -208,8 +185,6 @@ static const VMStateDescription vmstate_i440fx =3D {<br=
>
=C2=A0 =C2=A0 =C2=A0.name =3D &quot;I440FX&quot;,<br>
=C2=A0 =C2=A0 =C2=A0.version_id =3D 3,<br>
=C2=A0 =C2=A0 =C2=A0.minimum_version_id =3D 3,<br>
-=C2=A0 =C2=A0 .minimum_version_id_old =3D 1,<br>
-=C2=A0 =C2=A0 .load_state_old =3D i440fx_load_old,<br>
=C2=A0 =C2=A0 =C2=A0.post_load =3D i440fx_post_load,<br>
=C2=A0 =C2=A0 =C2=A0.fields =3D (VMStateField[]) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_PCI_DEVICE(parent_obj, PCII440FXS=
tate),<br>
diff --git a/hw/timer/i8254_common.c b/hw/timer/i8254_common.c<br>
index 57bf10cc94..050875b497 100644<br>
--- a/hw/timer/i8254_common.c<br>
+++ b/hw/timer/i8254_common.c<br>
@@ -29,7 +29,6 @@<br>
=C2=A0#include &quot;qemu/timer.h&quot;<br>
=C2=A0#include &quot;hw/timer/i8254.h&quot;<br>
=C2=A0#include &quot;hw/timer/i8254_internal.h&quot;<br>
-#include &quot;migration/qemu-file-types.h&quot;<br>
=C2=A0#include &quot;migration/vmstate.h&quot;<br>
<br>
=C2=A0/* val must be 0 or 1 */<br>
@@ -202,43 +201,6 @@ static const VMStateDescription vmstate_pit_channel =
=3D {<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0};<br>
<br>
-static int pit_load_old(QEMUFile *f, void *opaque, int version_id)<br>
-{<br>
-=C2=A0 =C2=A0 PITCommonState *pit =3D opaque;<br>
-=C2=A0 =C2=A0 PITCommonClass *c =3D PIT_COMMON_GET_CLASS(pit);<br>
-=C2=A0 =C2=A0 PITChannelState *s;<br>
-=C2=A0 =C2=A0 int i;<br>
-<br>
-=C2=A0 =C2=A0 if (version_id !=3D 1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 for (i =3D 0; i &lt; 3; i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 s =3D &amp;pit-&gt;channels[i];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;count =3D qemu_get_be32(f);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_get_be16s(f, &amp;s-&gt;latched_count);<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_get_8s(f, &amp;s-&gt;count_latched);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_get_8s(f, &amp;s-&gt;status_latched);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_get_8s(f, &amp;s-&gt;status);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_get_8s(f, &amp;s-&gt;read_state);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_get_8s(f, &amp;s-&gt;write_state);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_get_8s(f, &amp;s-&gt;write_latch);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_get_8s(f, &amp;s-&gt;rw_mode);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_get_8s(f, &amp;s-&gt;mode);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_get_8s(f, &amp;s-&gt;bcd);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_get_8s(f, &amp;s-&gt;gate);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;count_load_time =3D qemu_get_be64(f);<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;irq_disabled =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;next_transition_time =3D q=
emu_get_be64(f);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 if (c-&gt;post_load) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 c-&gt;post_load(pit);<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 return 0;<br>
-}<br>
-<br>
=C2=A0static int pit_dispatch_pre_save(void *opaque)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0PITCommonState *s =3D opaque;<br>
@@ -266,8 +228,6 @@ static const VMStateDescription vmstate_pit_common =3D =
{<br>
=C2=A0 =C2=A0 =C2=A0.name =3D &quot;i8254&quot;,<br>
=C2=A0 =C2=A0 =C2=A0.version_id =3D 3,<br>
=C2=A0 =C2=A0 =C2=A0.minimum_version_id =3D 2,<br>
-=C2=A0 =C2=A0 .minimum_version_id_old =3D 1,<br>
-=C2=A0 =C2=A0 .load_state_old =3D pit_load_old,<br>
=C2=A0 =C2=A0 =C2=A0.pre_save =3D pit_dispatch_pre_save,<br>
=C2=A0 =C2=A0 =C2=A0.post_load =3D pit_dispatch_post_load,<br>
=C2=A0 =C2=A0 =C2=A0.fields =3D (VMStateField[]) {<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote>

--0000000000006e378905951c33e3--


--===============6010323917613745079==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6010323917613745079==--

