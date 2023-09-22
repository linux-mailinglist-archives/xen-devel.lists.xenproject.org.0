Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EB47AA82F
	for <lists+xen-devel@lfdr.de>; Fri, 22 Sep 2023 07:12:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606647.944715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjYT1-0008Hg-1P; Fri, 22 Sep 2023 05:12:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606647.944715; Fri, 22 Sep 2023 05:12:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjYT0-0008Ex-U6; Fri, 22 Sep 2023 05:12:38 +0000
Received: by outflank-mailman (input) for mailman id 606647;
 Fri, 22 Sep 2023 00:03:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZDyD=FG=chromium.org=gurchetansingh@srs-se1.protection.inumbo.net>)
 id 1qjTeE-0007Hc-UW
 for xen-devel@lists.xenproject.org; Fri, 22 Sep 2023 00:03:55 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81d0a989-58db-11ee-9b0d-b553b5be7939;
 Fri, 22 Sep 2023 02:03:49 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-501eec0a373so2715669e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Sep 2023 17:03:49 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53]) by smtp.gmail.com with ESMTPSA id
 e9-20020a50ec89000000b0052c9f1d3cfasm1462777edr.84.2023.09.21.17.03.48
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 17:03:48 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4009fdc224dso22875e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Sep 2023 17:03:48 -0700 (PDT)
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
X-Inumbo-ID: 81d0a989-58db-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695341029; x=1695945829; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jmKZz2FvPA01ghBlYnODEn9JYXU1spd6fTLoNKsOww8=;
        b=Wk4Esagh7OvFMlxGTIQavag0V7uH2+tXCxM1O4hBArOTRlvK6ubMejsolF99B3g1j2
         fUeavJCig/NFkzTKnJz8uN6JJPXc0gK8/pCmj24LAvbGFLWsEKbNnx5OPar9dchhvE/W
         P0q1UlTatVrxWZMJ1vgRUh2DD2Mo7bZORjkZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695341029; x=1695945829;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jmKZz2FvPA01ghBlYnODEn9JYXU1spd6fTLoNKsOww8=;
        b=XKUPoJtANgib7eWkvvGGTPKVbYbtgOufsuFIl9Tg+o3ZFZBoB14G1cu15xJo+Vmax2
         RqfBl0pScXKdzU2/BCv+Du9x3lmftW/XvoG7mmTT9avSPuTNXl3z5LfkxsQ0YCYFtxvV
         mDp7aSW4uAg6rCHERQVUp9Nmd0AJgJCW/jBhV3eWgf12BU8TrCIFOJhbH8IhANOkvhUk
         Iok9h5PJ0NllqRtOMq2SeuSAs01A0T2fgJd8DMZ025a7Rc3RgZAWohMiVyEYiXER9lty
         bJgghdMDDfIWpgyVETnSAi+WBElt3l9iXBIIewQ9SCQVa2aarywTOpi97nNULGy7PgJ8
         mh6g==
X-Gm-Message-State: AOJu0YyRCm4B8w6cp19vERRpZlQj6uzgCHcadTjc/LUrkUlpWnOjBQLV
	fO8psDryPbUL8JJ7M0lHtGvBwfx7g3kI397lsHWnKtkQ1YA=
X-Google-Smtp-Source: AGHT+IFLdA/i13OBqP1/NBQEUsKl424LqUYzHhwcKSaWatQfGtp11F4BgM5S6yywYeTqnvO4TMdL5A==
X-Received: by 2002:a19:504b:0:b0:500:ac71:f26a with SMTP id z11-20020a19504b000000b00500ac71f26amr5639097lfj.57.1695341028464;
        Thu, 21 Sep 2023 17:03:48 -0700 (PDT)
X-Received: by 2002:a50:9fa5:0:b0:523:bdc9:48a9 with SMTP id
 c34-20020a509fa5000000b00523bdc948a9mr28472edf.0.1695341006849; Thu, 21 Sep
 2023 17:03:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230829003629.410-1-gurchetansingh@chromium.org>
 <20230829003629.410-7-gurchetansingh@chromium.org> <2620fca0-a5b4-49d0-bf91-fd359ee4999b@gmail.com>
 <3830bf8d-8c25-950c-f901-8d70dbfc06a6@ilande.co.uk>
In-Reply-To: <3830bf8d-8c25-950c-f901-8d70dbfc06a6@ilande.co.uk>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Thu, 21 Sep 2023 17:03:13 -0700
X-Gmail-Original-Message-ID: <CAAfnVBknhG=QYn=OFjNW9h=KbDtQ=xq3AEs5Pg=AG3LTO=LZ6w@mail.gmail.com>
Message-ID: <CAAfnVBknhG=QYn=OFjNW9h=KbDtQ=xq3AEs5Pg=AG3LTO=LZ6w@mail.gmail.com>
Subject: Re: [PATCH v13 6/9] gfxstream + rutabaga: add initial support for gfxstream
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-devel@nongnu.org, 
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>, marcandre.lureau@redhat.com, ray.huang@amd.com, 
	alex.bennee@linaro.org, shentey@gmail.com, hi@alyssa.is, ernunes@redhat.com, 
	manos.pitsidianakis@linaro.org, philmd@linaro.org, 
	Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>, 
	Antonio Caggiano <quic_acaggian@quicinc.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>, 
	Robert Beckett <bob.beckett@collabora.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	xen-devel@lists.xenproject.org, Albert Esteve <aesteve@redhat.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, Honglei Huang <honglei1.huang@amd.com>, 
	Julia Zhang <julia.zhang@amd.com>, Chen Jiqian <Jiqian.Chen@amd.com>
Content-Type: multipart/alternative; boundary="0000000000007ce63c0605e75644"

--0000000000007ce63c0605e75644
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 20, 2023 at 5:05=E2=80=AFAM Mark Cave-Ayland <
mark.cave-ayland@ilande.co.uk> wrote:

> On 20/09/2023 12:42, Akihiko Odaki wrote:
>
> > On 2023/08/29 9:36, Gurchetan Singh wrote:
> >> This adds initial support for gfxstream and cross-domain.  Both
> >> features rely on virtio-gpu blob resources and context types, which
> >> are also implemented in this patch.
> >>
> >> gfxstream has a long and illustrious history in Android graphics
> >> paravirtualization.  It has been powering graphics in the Android
> >> Studio Emulator for more than a decade, which is the main developer
> >> platform.
> >>
> >> Originally conceived by Jesse Hall, it was first known as "EmuGL" [a].
> >> The key design characteristic was a 1:1 threading model and
> >> auto-generation, which fit nicely with the OpenGLES spec.  It also
> >> allowed easy layering with ANGLE on the host, which provides the GLES
> >> implementations on Windows or MacOS enviroments.
> >>
> >> gfxstream has traditionally been maintained by a single engineer, and
> >> between 2015 to 2021, the goldfish throne passed to Frank Yang.
> >> Historians often remark this glorious reign ("pax gfxstreama" is the
> >> academic term) was comparable to that of Augustus and both Queen
> >> Elizabeths.  Just to name a few accomplishments in a resplendent
> >> panoply: higher versions of GLES, address space graphics, snapshot
> >> support and CTS compliant Vulkan [b].
> >>
> >> One major drawback was the use of out-of-tree goldfish drivers.
> >> Android engineers didn't know much about DRM/KMS and especially TTM so
> >> a simple guest to host pipe was conceived.
> >>
> >> Luckily, virtio-gpu 3D started to emerge in 2016 due to the work of
> >> the Mesa/virglrenderer communities.  In 2018, the initial virtio-gpu
> >> port of gfxstream was done by Cuttlefish enthusiast Alistair Delva.
> >> It was a symbol compatible replacement of virglrenderer [c] and named
> >> "AVDVirglrenderer".  This implementation forms the basis of the
> >> current gfxstream host implementation still in use today.
> >>
> >> cross-domain support follows a similar arc.  Originally conceived by
> >> Wayland aficionado David Reveman and crosvm enjoyer Zach Reizner in
> >> 2018, it initially relied on the downstream "virtio-wl" device.
> >>
> >> In 2020 and 2021, virtio-gpu was extended to include blob resources
> >> and multiple timelines by yours truly, features gfxstream/cross-domain
> >> both require to function correctly.
> >>
> >> Right now, we stand at the precipice of a truly fantastic possibility:
> >> the Android Emulator powered by upstream QEMU and upstream Linux
> >> kernel.  gfxstream will then be packaged properfully, and app
> >> developers can even fix gfxstream bugs on their own if they encounter
> >> them.
> >>
> >> It's been quite the ride, my friends.  Where will gfxstream head next,
> >> nobody really knows.  I wouldn't be surprised if it's around for
> >> another decade, maintained by a new generation of Android graphics
> >> enthusiasts.
> >>
> >> Technical details:
> >>    - Very simple initial display integration: just used Pixman
> >>    - Largely, 1:1 mapping of virtio-gpu hypercalls to rutabaga functio=
n
> >>      calls
> >>
> >> Next steps for Android VMs:
> >>    - The next step would be improving display integration and UI
> interfaces
> >>      with the goal of the QEMU upstream graphics being in an emulator
> >>      release [d].
> >>
> >> Next steps for Linux VMs for display virtualization:
> >>    - For widespread distribution, someone needs to package Sommelier o=
r
> the
> >>      wayland-proxy-virtwl [e] ideally into Debian main. In addition,
> newer
> >>      versions of the Linux kernel come with DRM_VIRTIO_GPU_KMS option,
> >>      which allows disabling KMS hypercalls.  If anyone cares enough,
> it'll
> >>      probably be possible to build a custom VM variant that uses this
> display
> >>      virtualization strategy.
> >>
> >> [a]
> https://android-review.googlesource.com/c/platform/development/+/34470
> >> [b]
> https://android-review.googlesource.com/q/topic:%22vulkan-hostconnection-=
start%22
> >> [c]
> https://android-review.googlesource.com/c/device/generic/goldfish-opengl/=
+/761927
> >> [d] https://developer.android.com/studio/releases/emulator
> >> [e] https://github.com/talex5/wayland-proxy-virtwl
> >>
> >> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> >> Tested-by: Alyssa Ross <hi@alyssa.is>
> >> Tested-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
> >> Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> >> Reviewed-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
> >> Reviewed-by: Antonio Caggiano <quic_acaggian@quicinc.com>
> >> Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> >> ---
> >>   hw/display/virtio-gpu-pci-rutabaga.c |   47 ++
> >>   hw/display/virtio-gpu-rutabaga.c     | 1119 ++++++++++++++++++++++++=
++
> >>   hw/display/virtio-vga-rutabaga.c     |   50 ++
> >>   3 files changed, 1216 insertions(+)
> >>   create mode 100644 hw/display/virtio-gpu-pci-rutabaga.c
> >>   create mode 100644 hw/display/virtio-gpu-rutabaga.c
> >>   create mode 100644 hw/display/virtio-vga-rutabaga.c
> >>
> >> diff --git a/hw/display/virtio-gpu-pci-rutabaga.c
> >> b/hw/display/virtio-gpu-pci-rutabaga.c
> >> new file mode 100644
> >> index 0000000000..c96729e198
> >> --- /dev/null
> >> +++ b/hw/display/virtio-gpu-pci-rutabaga.c
> >> @@ -0,0 +1,47 @@
> >> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> >> +
> >> +#include "qemu/osdep.h"
> >> +#include "qapi/error.h"
> >> +#include "qemu/module.h"
> >> +#include "hw/pci/pci.h"
> >> +#include "hw/qdev-properties.h"
> >> +#include "hw/virtio/virtio.h"
> >> +#include "hw/virtio/virtio-bus.h"
> >> +#include "hw/virtio/virtio-gpu-pci.h"
> >> +#include "qom/object.h"
> >> +
> >> +#define TYPE_VIRTIO_GPU_RUTABAGA_PCI "virtio-gpu-rutabaga-pci"
> >> +OBJECT_DECLARE_SIMPLE_TYPE(VirtIOGPURutabagaPCI,
> VIRTIO_GPU_RUTABAGA_PCI)
> >> +
> >> +struct VirtIOGPURutabagaPCI {
> >> +    VirtIOGPUPCIBase parent_obj;
> >> +
> >> +    VirtIOGPURutabaga vdev;
> >> +};
> >> +
> >> +static void virtio_gpu_rutabaga_initfn(Object *obj)
> >> +{
> >> +    VirtIOGPURutabagaPCI *dev =3D VIRTIO_GPU_RUTABAGA_PCI(obj);
> >> +
> >> +    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
> >> +                                TYPE_VIRTIO_GPU_RUTABAGA);
> >> +    VIRTIO_GPU_PCI_BASE(obj)->vgpu =3D VIRTIO_GPU_BASE(&dev->vdev);
> >> +}
> >> +
> >> +static const TypeInfo virtio_gpu_rutabaga_pci_info[] =3D {
> >> +    {
> >> +        .name =3D TYPE_VIRTIO_GPU_RUTABAGA_PCI,
> >> +        .parent =3D TYPE_VIRTIO_GPU_PCI_BASE,
> >> +        .instance_size =3D sizeof(VirtIOGPURutabagaPCI),
> >> +        .instance_init =3D virtio_gpu_rutabaga_initfn,
> >> +        .interfaces =3D (InterfaceInfo[]) {
> >> +            { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> >> +        }
> >> +    },
> >> +};
> >> +
> >> +DEFINE_TYPES(virtio_gpu_rutabaga_pci_info)
> >> +
> >> +module_obj(TYPE_VIRTIO_GPU_RUTABAGA_PCI);
> >> +module_kconfig(VIRTIO_PCI);
> >> +module_dep("hw-display-virtio-gpu-pci");
> >> diff --git a/hw/display/virtio-gpu-rutabaga.c
> b/hw/display/virtio-gpu-rutabaga.c
> >> new file mode 100644
> >> index 0000000000..a105e06214
> >> --- /dev/null
> >> +++ b/hw/display/virtio-gpu-rutabaga.c
> >> @@ -0,0 +1,1119 @@
> >> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> >> +
> >> +#include "qemu/osdep.h"
> >> +#include "qapi/error.h"
> >> +#include "qemu/error-report.h"
> >> +#include "qemu/iov.h"
> >> +#include "trace.h"
> >> +#include "hw/virtio/virtio.h"
> >> +#include "hw/virtio/virtio-gpu.h"
> >> +#include "hw/virtio/virtio-gpu-pixman.h"
> >> +#include "hw/virtio/virtio-iommu.h"
> >> +
> >> +#include <glib/gmem.h>
> >> +#include <rutabaga_gfx/rutabaga_gfx_ffi.h>
> >> +
> >> +#define CHECK(condition,
> cmd)                                                 \
> >> +    do
> {                                                                      \
> >> +        if (!(condition))
> {                                                   \
> >> +            error_report("CHECK failed in %s() %s:" "%d",
> __func__,           \
> >> +                         __FILE__,
> __LINE__);                                 \
> >> +            (cmd)->error =3D
> VIRTIO_GPU_RESP_ERR_UNSPEC;                        \
> >> +
> return;                                                           \
> >> +
> }                                                                      \
> >> +    } while (0)
> >> +
> >> +/*
> >> + * This is the size of the char array in struct sock_addr_un. No
> Wayland socket
> >> + * can be created with a path longer than this, including the null
> terminator.
> >> + */
> >> +#define UNIX_PATH_MAX sizeof((struct sockaddr_un) {} .sun_path)
> >> +
> >> +struct rutabaga_aio_data {
> >> +    struct VirtIOGPURutabaga *vr;
> >> +    struct rutabaga_fence fence;
> >> +};
> >> +
> >> +static void
> >> +virtio_gpu_rutabaga_update_cursor(VirtIOGPU *g, struct
> virtio_gpu_scanout *s,
> >> +                                  uint32_t resource_id)
> >> +{
> >> +    struct virtio_gpu_simple_resource *res;
> >> +    struct rutabaga_transfer transfer =3D { 0 };
> >> +    struct iovec transfer_iovec;
> >> +
> >> +    VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(g);
> >> +
> >> +    res =3D virtio_gpu_find_resource(g, resource_id);
> >> +    if (!res) {
> >> +        return;
> >> +    }
> >> +
> >> +    if (res->width !=3D s->current_cursor->width ||
> >> +        res->height !=3D s->current_cursor->height) {
> >> +        return;
> >> +    }
> >> +
> >> +    transfer.x =3D 0;
> >> +    transfer.y =3D 0;
> >> +    transfer.z =3D 0;
> >> +    transfer.w =3D res->width;
> >> +    transfer.h =3D res->height;
> >> +    transfer.d =3D 1;
> >> +
> >> +    transfer_iovec.iov_base =3D s->current_cursor->data;
> >> +    transfer_iovec.iov_len =3D res->width * res->height * 4;
> >> +
> >> +    rutabaga_resource_transfer_read(vr->rutabaga, 0,
> >> +                                    resource_id, &transfer,
> >> +                                    &transfer_iovec);
> >> +}
> >> +
> >> +static void
> >> +virtio_gpu_rutabaga_gl_flushed(VirtIOGPUBase *b)
> >> +{
> >> +    VirtIOGPU *g =3D VIRTIO_GPU(b);
> >> +    virtio_gpu_process_cmdq(g);
> >> +}
> >> +
> >> +static void
> >> +rutabaga_cmd_create_resource_2d(VirtIOGPU *g,
> >> +                                struct virtio_gpu_ctrl_command *cmd)
> >> +{
> >> +    int32_t result;
> >> +    struct rutabaga_create_3d rc_3d =3D { 0 };
> >> +    struct virtio_gpu_simple_resource *res;
> >> +    struct virtio_gpu_resource_create_2d c2d;
> >> +
> >> +    VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(g);
> >> +
> >> +    VIRTIO_GPU_FILL_CMD(c2d);
> >> +    trace_virtio_gpu_cmd_res_create_2d(c2d.resource_id, c2d.format,
> >> +                                       c2d.width, c2d.height);
> >> +
> >> +    rc_3d.target =3D 2;
> >> +    rc_3d.format =3D c2d.format;
> >> +    rc_3d.bind =3D (1 << 1);
> >> +    rc_3d.width =3D c2d.width;
> >> +    rc_3d.height =3D c2d.height;
> >> +    rc_3d.depth =3D 1;
> >> +    rc_3d.array_size =3D 1;
> >> +    rc_3d.last_level =3D 0;
> >> +    rc_3d.nr_samples =3D 0;
> >> +    rc_3d.flags =3D VIRTIO_GPU_RESOURCE_FLAG_Y_0_TOP;
> >> +
> >> +    result =3D rutabaga_resource_create_3d(vr->rutabaga,
> c2d.resource_id, &rc_3d);
> >> +    CHECK(!result, cmd);
> >> +
> >> +    res =3D g_new0(struct virtio_gpu_simple_resource, 1);
> >> +    res->width =3D c2d.width;
> >> +    res->height =3D c2d.height;
> >> +    res->format =3D c2d.format;
> >> +    res->resource_id =3D c2d.resource_id;
> >> +
> >> +    QTAILQ_INSERT_HEAD(&g->reslist, res, next);
> >> +}
> >> +
> >> +static void
> >> +rutabaga_cmd_create_resource_3d(VirtIOGPU *g,
> >> +                                struct virtio_gpu_ctrl_command *cmd)
> >> +{
> >> +    int32_t result;
> >> +    struct rutabaga_create_3d rc_3d =3D { 0 };
> >> +    struct virtio_gpu_simple_resource *res;
> >> +    struct virtio_gpu_resource_create_3d c3d;
> >> +
> >> +    VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(g);
> >> +
> >> +    VIRTIO_GPU_FILL_CMD(c3d);
> >> +
> >> +    trace_virtio_gpu_cmd_res_create_3d(c3d.resource_id, c3d.format,
> >> +                                       c3d.width, c3d.height,
> c3d.depth);
> >> +
> >> +    rc_3d.target =3D c3d.target;
> >> +    rc_3d.format =3D c3d.format;
> >> +    rc_3d.bind =3D c3d.bind;
> >> +    rc_3d.width =3D c3d.width;
> >> +    rc_3d.height =3D c3d.height;
> >> +    rc_3d.depth =3D c3d.depth;
> >> +    rc_3d.array_size =3D c3d.array_size;
> >> +    rc_3d.last_level =3D c3d.last_level;
> >> +    rc_3d.nr_samples =3D c3d.nr_samples;
> >> +    rc_3d.flags =3D c3d.flags;
> >> +
> >> +    result =3D rutabaga_resource_create_3d(vr->rutabaga,
> c3d.resource_id, &rc_3d);
> >> +    CHECK(!result, cmd);
> >> +
> >> +    res =3D g_new0(struct virtio_gpu_simple_resource, 1);
> >> +    res->width =3D c3d.width;
> >> +    res->height =3D c3d.height;
> >> +    res->format =3D c3d.format;
> >> +    res->resource_id =3D c3d.resource_id;
> >> +
> >> +    QTAILQ_INSERT_HEAD(&g->reslist, res, next);
> >> +}
> >> +
> >> +static void
> >> +rutabaga_cmd_resource_unref(VirtIOGPU *g,
> >> +                            struct virtio_gpu_ctrl_command *cmd)
> >> +{
> >> +    int32_t result;
> >> +    struct virtio_gpu_simple_resource *res;
> >> +    struct virtio_gpu_resource_unref unref;
> >> +
> >> +    VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(g);
> >> +
> >> +    VIRTIO_GPU_FILL_CMD(unref);
> >> +
> >> +    trace_virtio_gpu_cmd_res_unref(unref.resource_id);
> >> +
> >> +    res =3D virtio_gpu_find_resource(g, unref.resource_id);
> >> +    CHECK(res, cmd);
> >> +
> >> +    result =3D rutabaga_resource_unref(vr->rutabaga, unref.resource_i=
d);
> >> +    CHECK(!result, cmd);
> >> +
> >> +    if (res->image) {
> >> +        pixman_image_unref(res->image);
> >> +    }
> >> +
> >> +    QTAILQ_REMOVE(&g->reslist, res, next);
> >> +    g_free(res);
> >> +}
> >> +
> >> +static void
> >> +rutabaga_cmd_context_create(VirtIOGPU *g,
> >> +                            struct virtio_gpu_ctrl_command *cmd)
> >> +{
> >> +    int32_t result;
> >> +    struct virtio_gpu_ctx_create cc;
> >> +
> >> +    VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(g);
> >> +
> >> +    VIRTIO_GPU_FILL_CMD(cc);
> >> +    trace_virtio_gpu_cmd_ctx_create(cc.hdr.ctx_id,
> >> +                                    cc.debug_name);
> >> +
> >> +    result =3D rutabaga_context_create(vr->rutabaga, cc.hdr.ctx_id,
> >> +                                     cc.context_init, cc.debug_name,
> cc.nlen);
> >> +    CHECK(!result, cmd);
> >> +}
> >> +
> >> +static void
> >> +rutabaga_cmd_context_destroy(VirtIOGPU *g,
> >> +                             struct virtio_gpu_ctrl_command *cmd)
> >> +{
> >> +    int32_t result;
> >> +    struct virtio_gpu_ctx_destroy cd;
> >> +
> >> +    VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(g);
> >> +
> >> +    VIRTIO_GPU_FILL_CMD(cd);
> >> +    trace_virtio_gpu_cmd_ctx_destroy(cd.hdr.ctx_id);
> >> +
> >> +    result =3D rutabaga_context_destroy(vr->rutabaga, cd.hdr.ctx_id);
> >> +    CHECK(!result, cmd);
> >> +}
> >> +
> >> +static void
> >> +rutabaga_cmd_resource_flush(VirtIOGPU *g, struct
> virtio_gpu_ctrl_command *cmd)
> >> +{
> >> +    int32_t result, i;
> >> +    struct virtio_gpu_scanout *scanout =3D NULL;
> >> +    struct virtio_gpu_simple_resource *res;
> >> +    struct rutabaga_transfer transfer =3D { 0 };
> >> +    struct iovec transfer_iovec;
> >> +    struct virtio_gpu_resource_flush rf;
> >> +    bool found =3D false;
> >> +
> >> +    VirtIOGPUBase *vb =3D VIRTIO_GPU_BASE(g);
> >> +    VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(g);
> >> +    if (vr->headless) {
> >> +        return;
> >> +    }
> >> +
> >> +    VIRTIO_GPU_FILL_CMD(rf);
> >> +    trace_virtio_gpu_cmd_res_flush(rf.resource_id,
> >> +                                   rf.r.width, rf.r.height, rf.r.x,
> rf.r.y);
> >> +
> >> +    res =3D virtio_gpu_find_resource(g, rf.resource_id);
> >> +    CHECK(res, cmd);
> >> +
> >> +    for (i =3D 0; i < vb->conf.max_outputs; i++) {
> >> +        scanout =3D &vb->scanout[i];
> >> +        if (i =3D=3D res->scanout_bitmask) {
> >> +            found =3D true;
> >> +            break;
> >> +        }
> >> +    }
> >> +
> >> +    if (!found) {
> >> +        return;
> >> +    }
> >> +
> >> +    transfer.x =3D 0;
> >> +    transfer.y =3D 0;
> >> +    transfer.z =3D 0;
> >> +    transfer.w =3D res->width;
> >> +    transfer.h =3D res->height;
> >> +    transfer.d =3D 1;
> >> +
> >> +    transfer_iovec.iov_base =3D pixman_image_get_data(res->image);
> >> +    transfer_iovec.iov_len =3D res->width * res->height * 4;
> >> +
> >> +    result =3D rutabaga_resource_transfer_read(vr->rutabaga, 0,
> >> +                                             rf.resource_id, &transfe=
r,
> >> +                                             &transfer_iovec);
> >> +    CHECK(!result, cmd);
> >> +    dpy_gfx_update_full(scanout->con);
> >> +}
> >> +
> >> +static void
> >> +rutabaga_cmd_set_scanout(VirtIOGPU *g, struct virtio_gpu_ctrl_command
> *cmd)
> >> +{
> >> +    struct virtio_gpu_simple_resource *res;
> >> +    struct virtio_gpu_scanout *scanout =3D NULL;
> >> +    struct virtio_gpu_set_scanout ss;
> >> +
> >> +    VirtIOGPUBase *vb =3D VIRTIO_GPU_BASE(g);
> >> +    VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(g);
> >> +    if (vr->headless) {
> >> +        return;
> >> +    }
> >> +
> >> +    VIRTIO_GPU_FILL_CMD(ss);
> >> +    trace_virtio_gpu_cmd_set_scanout(ss.scanout_id, ss.resource_id,
> >> +                                     ss.r.width, ss.r.height, ss.r.x,
> ss.r.y);
> >> +
> >> +    CHECK(ss.scanout_id < VIRTIO_GPU_MAX_SCANOUTS, cmd);
> >> +    scanout =3D &vb->scanout[ss.scanout_id];
> >> +
> >> +    if (ss.resource_id =3D=3D 0) {
> >> +        dpy_gfx_replace_surface(scanout->con, NULL);
> >> +        dpy_gl_scanout_disable(scanout->con);
> >> +        return;
> >> +    }
> >> +
> >> +    res =3D virtio_gpu_find_resource(g, ss.resource_id);
> >> +    CHECK(res, cmd);
> >> +
> >> +    if (!res->image) {
> >> +        pixman_format_code_t pformat;
> >> +        pformat =3D virtio_gpu_get_pixman_format(res->format);
> >> +        CHECK(pformat, cmd);
> >> +
> >> +        res->image =3D pixman_image_create_bits(pformat,
> >> +                                              res->width,
> >> +                                              res->height,
> >> +                                              NULL, 0);
> >> +        CHECK(res->image, cmd);
> >> +        pixman_image_ref(res->image);
> >> +    }
> >> +
> >> +    vb->enable =3D 1;
> >> +
> >> +    /* realloc the surface ptr */
> >> +    scanout->ds =3D qemu_create_displaysurface_pixman(res->image);
> >> +    dpy_gfx_replace_surface(scanout->con, NULL);
> >> +    dpy_gfx_replace_surface(scanout->con, scanout->ds);
> >> +    res->scanout_bitmask =3D ss.scanout_id;
> >> +}
> >> +
> >> +static void
> >> +rutabaga_cmd_submit_3d(VirtIOGPU *g,
> >> +                       struct virtio_gpu_ctrl_command *cmd)
> >> +{
> >> +    int32_t result;
> >> +    struct virtio_gpu_cmd_submit cs;
> >> +    struct rutabaga_command rutabaga_cmd =3D { 0 };
> >> +    g_autofree uint8_t *buf =3D NULL;
> >> +    size_t s;
> >> +
> >> +    VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(g);
> >> +
> >> +    VIRTIO_GPU_FILL_CMD(cs);
> >> +    trace_virtio_gpu_cmd_ctx_submit(cs.hdr.ctx_id, cs.size);
> >> +
> >> +    buf =3D g_new0(uint8_t, cs.size);
> >> +    s =3D iov_to_buf(cmd->elem.out_sg, cmd->elem.out_num,
> >> +                   sizeof(cs), buf, cs.size);
> >> +    CHECK(s =3D=3D cs.size, cmd);
> >> +
> >> +    rutabaga_cmd.ctx_id =3D cs.hdr.ctx_id;
> >> +    rutabaga_cmd.cmd =3D buf;
> >> +    rutabaga_cmd.cmd_size =3D cs.size;
> >> +
> >> +    result =3D rutabaga_submit_command(vr->rutabaga, &rutabaga_cmd);
> >> +    CHECK(!result, cmd);
> >> +}
> >> +
> >> +static void
> >> +rutabaga_cmd_transfer_to_host_2d(VirtIOGPU *g,
> >> +                                 struct virtio_gpu_ctrl_command *cmd)
> >> +{
> >> +    int32_t result;
> >> +    struct rutabaga_transfer transfer =3D { 0 };
> >> +    struct virtio_gpu_transfer_to_host_2d t2d;
> >> +
> >> +    VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(g);
> >> +
> >> +    VIRTIO_GPU_FILL_CMD(t2d);
> >> +    trace_virtio_gpu_cmd_res_xfer_toh_2d(t2d.resource_id);
> >> +
> >> +    transfer.x =3D t2d.r.x;
> >> +    transfer.y =3D t2d.r.y;
> >> +    transfer.z =3D 0;
> >> +    transfer.w =3D t2d.r.width;
> >> +    transfer.h =3D t2d.r.height;
> >> +    transfer.d =3D 1;
> >> +
> >> +    result =3D rutabaga_resource_transfer_write(vr->rutabaga, 0,
> t2d.resource_id,
> >> +                                              &transfer);
> >> +    CHECK(!result, cmd);
> >> +}
> >> +
> >> +static void
> >> +rutabaga_cmd_transfer_to_host_3d(VirtIOGPU *g,
> >> +                                 struct virtio_gpu_ctrl_command *cmd)
> >> +{
> >> +    int32_t result;
> >> +    struct rutabaga_transfer transfer =3D { 0 };
> >> +    struct virtio_gpu_transfer_host_3d t3d;
> >> +
> >> +    VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(g);
> >> +
> >> +    VIRTIO_GPU_FILL_CMD(t3d);
> >> +    trace_virtio_gpu_cmd_res_xfer_toh_3d(t3d.resource_id);
> >> +
> >> +    transfer.x =3D t3d.box.x;
> >> +    transfer.y =3D t3d.box.y;
> >> +    transfer.z =3D t3d.box.z;
> >> +    transfer.w =3D t3d.box.w;
> >> +    transfer.h =3D t3d.box.h;
> >> +    transfer.d =3D t3d.box.d;
> >> +    transfer.level =3D t3d.level;
> >> +    transfer.stride =3D t3d.stride;
> >> +    transfer.layer_stride =3D t3d.layer_stride;
> >> +    transfer.offset =3D t3d.offset;
> >> +
> >> +    result =3D rutabaga_resource_transfer_write(vr->rutabaga,
> t3d.hdr.ctx_id,
> >> +                                              t3d.resource_id,
> &transfer);
> >> +    CHECK(!result, cmd);
> >> +}
> >> +
> >> +static void
> >> +rutabaga_cmd_transfer_from_host_3d(VirtIOGPU *g,
> >> +                                   struct virtio_gpu_ctrl_command *cm=
d)
> >> +{
> >> +    int32_t result;
> >> +    struct rutabaga_transfer transfer =3D { 0 };
> >> +    struct virtio_gpu_transfer_host_3d t3d;
> >> +
> >> +    VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(g);
> >> +
> >> +    VIRTIO_GPU_FILL_CMD(t3d);
> >> +    trace_virtio_gpu_cmd_res_xfer_fromh_3d(t3d.resource_id);
> >> +
> >> +    transfer.x =3D t3d.box.x;
> >> +    transfer.y =3D t3d.box.y;
> >> +    transfer.z =3D t3d.box.z;
> >> +    transfer.w =3D t3d.box.w;
> >> +    transfer.h =3D t3d.box.h;
> >> +    transfer.d =3D t3d.box.d;
> >> +    transfer.level =3D t3d.level;
> >> +    transfer.stride =3D t3d.stride;
> >> +    transfer.layer_stride =3D t3d.layer_stride;
> >> +    transfer.offset =3D t3d.offset;
> >> +
> >> +    result =3D rutabaga_resource_transfer_read(vr->rutabaga,
> t3d.hdr.ctx_id,
> >> +                                             t3d.resource_id,
> &transfer, NULL);
> >> +    CHECK(!result, cmd);
> >> +}
> >> +
> >> +static void
> >> +rutabaga_cmd_attach_backing(VirtIOGPU *g, struct
> virtio_gpu_ctrl_command *cmd)
> >> +{
> >> +    struct rutabaga_iovecs vecs =3D { 0 };
> >> +    struct virtio_gpu_simple_resource *res;
> >> +    struct virtio_gpu_resource_attach_backing att_rb;
> >> +    int ret;
> >> +
> >> +    VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(g);
> >> +
> >> +    VIRTIO_GPU_FILL_CMD(att_rb);
> >> +    trace_virtio_gpu_cmd_res_back_attach(att_rb.resource_id);
> >> +
> >> +    res =3D virtio_gpu_find_resource(g, att_rb.resource_id);
> >> +    CHECK(res, cmd);
> >> +    CHECK(!res->iov, cmd);
> >> +
> >> +    ret =3D virtio_gpu_create_mapping_iov(g, att_rb.nr_entries,
> sizeof(att_rb),
> >> +                                        cmd, NULL, &res->iov,
> &res->iov_cnt);
> >> +    CHECK(!ret, cmd);
> >> +
> >> +    vecs.iovecs =3D res->iov;
> >> +    vecs.num_iovecs =3D res->iov_cnt;
> >> +
> >> +    ret =3D rutabaga_resource_attach_backing(vr->rutabaga,
> att_rb.resource_id,
> >> +                                           &vecs);
> >> +    if (ret !=3D 0) {
> >> +        virtio_gpu_cleanup_mapping(g, res);
> >> +    }
> >> +
> >> +    CHECK(!ret, cmd);
> >> +}
> >> +
> >> +static void
> >> +rutabaga_cmd_detach_backing(VirtIOGPU *g, struct
> virtio_gpu_ctrl_command *cmd)
> >> +{
> >> +    struct virtio_gpu_simple_resource *res;
> >> +    struct virtio_gpu_resource_detach_backing detach_rb;
> >> +
> >> +    VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(g);
> >> +
> >> +    VIRTIO_GPU_FILL_CMD(detach_rb);
> >> +    trace_virtio_gpu_cmd_res_back_detach(detach_rb.resource_id);
> >> +
> >> +    res =3D virtio_gpu_find_resource(g, detach_rb.resource_id);
> >> +    CHECK(res, cmd);
> >> +
> >> +    rutabaga_resource_detach_backing(vr->rutabaga,
> >> +                                     detach_rb.resource_id);
> >> +
> >> +    virtio_gpu_cleanup_mapping(g, res);
> >> +}
> >> +
> >> +static void
> >> +rutabaga_cmd_ctx_attach_resource(VirtIOGPU *g,
> >> +                                 struct virtio_gpu_ctrl_command *cmd)
> >> +{
> >> +    int32_t result;
> >> +    struct virtio_gpu_ctx_resource att_res;
> >> +
> >> +    VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(g);
> >> +
> >> +    VIRTIO_GPU_FILL_CMD(att_res);
> >> +    trace_virtio_gpu_cmd_ctx_res_attach(att_res.hdr.ctx_id,
> >> +                                        att_res.resource_id);
> >> +
> >> +    result =3D rutabaga_context_attach_resource(vr->rutabaga,
> att_res.hdr.ctx_id,
> >> +                                              att_res.resource_id);
> >> +    CHECK(!result, cmd);
> >> +}
> >> +
> >> +static void
> >> +rutabaga_cmd_ctx_detach_resource(VirtIOGPU *g,
> >> +                                 struct virtio_gpu_ctrl_command *cmd)
> >> +{
> >> +    int32_t result;
> >> +    struct virtio_gpu_ctx_resource det_res;
> >> +
> >> +    VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(g);
> >> +
> >> +    VIRTIO_GPU_FILL_CMD(det_res);
> >> +    trace_virtio_gpu_cmd_ctx_res_detach(det_res.hdr.ctx_id,
> >> +                                        det_res.resource_id);
> >> +
> >> +    result =3D rutabaga_context_detach_resource(vr->rutabaga,
> det_res.hdr.ctx_id,
> >> +                                              det_res.resource_id);
> >> +    CHECK(!result, cmd);
> >> +}
> >> +
> >> +static void
> >> +rutabaga_cmd_get_capset_info(VirtIOGPU *g, struct
> virtio_gpu_ctrl_command *cmd)
> >> +{
> >> +    int32_t result;
> >> +    struct virtio_gpu_get_capset_info info;
> >> +    struct virtio_gpu_resp_capset_info resp;
> >> +
> >> +    VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(g);
> >> +
> >> +    VIRTIO_GPU_FILL_CMD(info);
> >> +
> >> +    result =3D rutabaga_get_capset_info(vr->rutabaga, info.capset_ind=
ex,
> >> +                                      &resp.capset_id,
> &resp.capset_max_version,
> >> +                                      &resp.capset_max_size);
> >> +    CHECK(!result, cmd);
> >> +
> >> +    resp.hdr.type =3D VIRTIO_GPU_RESP_OK_CAPSET_INFO;
> >> +    virtio_gpu_ctrl_response(g, cmd, &resp.hdr, sizeof(resp));
> >> +}
> >> +
> >> +static void
> >> +rutabaga_cmd_get_capset(VirtIOGPU *g, struct virtio_gpu_ctrl_command
> *cmd)
> >> +{
> >> +    int32_t result;
> >> +    struct virtio_gpu_get_capset gc;
> >> +    struct virtio_gpu_resp_capset *resp;
> >> +    uint32_t capset_size, capset_version;
> >> +    uint32_t current_id, i;
> >> +
> >> +    VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(g);
> >> +
> >> +    VIRTIO_GPU_FILL_CMD(gc);
> >> +    for (i =3D 0; i < vr->num_capsets; i++) {
> >> +        result =3D rutabaga_get_capset_info(vr->rutabaga, i,
> >> +                                          &current_id, &capset_versio=
n,
> >> +                                          &capset_size);
> >> +        CHECK(!result, cmd);
> >> +
> >> +        if (current_id =3D=3D gc.capset_id) {
> >> +            break;
> >> +        }
> >> +    }
> >> +
> >> +    CHECK(i < vr->num_capsets, cmd);
> >> +
> >> +    resp =3D g_malloc0(sizeof(*resp) + capset_size);
> >> +    resp->hdr.type =3D VIRTIO_GPU_RESP_OK_CAPSET;
> >> +    rutabaga_get_capset(vr->rutabaga, gc.capset_id, gc.capset_version=
,
> >> +                        resp->capset_data, capset_size);
> >> +
> >> +    virtio_gpu_ctrl_response(g, cmd, &resp->hdr, sizeof(*resp) +
> capset_size);
> >> +    g_free(resp);
> >> +}
> >> +
> >> +static void
> >> +rutabaga_cmd_resource_create_blob(VirtIOGPU *g,
> >> +                                  struct virtio_gpu_ctrl_command *cmd=
)
> >> +{
> >> +    int result;
> >> +    struct rutabaga_iovecs vecs =3D { 0 };
> >> +    g_autofree struct virtio_gpu_simple_resource *res =3D NULL;
> >> +    struct virtio_gpu_resource_create_blob cblob;
> >> +    struct rutabaga_create_blob rc_blob =3D { 0 };
> >> +
> >> +    VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(g);
> >> +
> >> +    VIRTIO_GPU_FILL_CMD(cblob);
> >> +    trace_virtio_gpu_cmd_res_create_blob(cblob.resource_id,
> cblob.size);
> >> +
> >> +    CHECK(cblob.resource_id !=3D 0, cmd);
> >> +
> >> +    res =3D g_new0(struct virtio_gpu_simple_resource, 1);
> >> +
> >> +    res->resource_id =3D cblob.resource_id;
> >> +    res->blob_size =3D cblob.size;
> >> +
> >> +    if (cblob.blob_mem !=3D VIRTIO_GPU_BLOB_MEM_HOST3D) {
> >> +        result =3D virtio_gpu_create_mapping_iov(g, cblob.nr_entries,
> >> +                                               sizeof(cblob), cmd,
> &res->addrs,
> >> +                                               &res->iov,
> &res->iov_cnt);
> >> +        CHECK(!result, cmd);
> >> +    }
> >> +
> >> +    rc_blob.blob_id =3D cblob.blob_id;
> >> +    rc_blob.blob_mem =3D cblob.blob_mem;
> >> +    rc_blob.blob_flags =3D cblob.blob_flags;
> >> +    rc_blob.size =3D cblob.size;
> >> +
> >> +    vecs.iovecs =3D res->iov;
> >> +    vecs.num_iovecs =3D res->iov_cnt;
> >> +
> >> +    result =3D rutabaga_resource_create_blob(vr->rutabaga,
> cblob.hdr.ctx_id,
> >> +                                           cblob.resource_id,
> &rc_blob, &vecs,
> >> +                                           NULL);
> >> +
> >> +    if (result && cblob.blob_mem !=3D VIRTIO_GPU_BLOB_MEM_HOST3D) {
> >> +        virtio_gpu_cleanup_mapping(g, res);
> >> +    }
> >> +
> >> +    CHECK(!result, cmd);
> >> +
> >> +    QTAILQ_INSERT_HEAD(&g->reslist, res, next);
> >> +    res =3D NULL;
> >> +}
> >> +
> >> +static void
> >> +rutabaga_cmd_resource_map_blob(VirtIOGPU *g,
> >> +                               struct virtio_gpu_ctrl_command *cmd)
> >> +{
> >> +    int32_t result;
> >> +    uint32_t map_info =3D 0;
> >> +    uint32_t slot =3D 0;
> >> +    struct virtio_gpu_simple_resource *res;
> >> +    struct rutabaga_mapping mapping =3D { 0 };
> >> +    struct virtio_gpu_resource_map_blob mblob;
> >> +    struct virtio_gpu_resp_map_info resp =3D { 0 };
> >> +
> >> +    VirtIOGPUBase *vb =3D VIRTIO_GPU_BASE(g);
> >> +    VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(g);
> >> +
> >> +    VIRTIO_GPU_FILL_CMD(mblob);
> >> +
> >> +    CHECK(mblob.resource_id !=3D 0, cmd);
> >> +
> >> +    res =3D virtio_gpu_find_resource(g, mblob.resource_id);
> >> +    CHECK(res, cmd);
> >> +
> >> +    result =3D rutabaga_resource_map_info(vr->rutabaga,
> mblob.resource_id,
> >> +                                        &map_info);
> >> +    CHECK(!result, cmd);
> >> +
> >> +    /*
> >> +     * RUTABAGA_MAP_ACCESS_* flags are not part of the virtio-gpu
> spec, but do
> >> +     * exist to potentially allow the hypervisor to restrict write
> access to
> >> +     * memory. QEMU does not need to use this functionality at the
> moment.
> >> +     */
> >> +    resp.map_info =3D map_info & RUTABAGA_MAP_CACHE_MASK;
> >> +
> >> +    result =3D rutabaga_resource_map(vr->rutabaga, mblob.resource_id,
> &mapping);
> >> +    CHECK(!result, cmd);
> >> +
> >> +    for (slot =3D 0; slot < MAX_SLOTS; slot++) {
> >> +        if (vr->memory_regions[slot].used) {
> >> +            continue;
> >> +        }
> >> +
> >> +        MemoryRegion *mr =3D &(vr->memory_regions[slot].mr);
> >> +        memory_region_init_ram_ptr(mr, OBJECT(vr), "blob",
> mapping.size,
> >> +                                   mapping.ptr);
> >> +        memory_region_add_subregion(&vb->hostmem, mblob.offset, mr);
> >> +        vr->memory_regions[slot].resource_id =3D mblob.resource_id;
> >> +        vr->memory_regions[slot].used =3D 1;
> >> +        break;
> >> +    }
> >> +
> >> +    if (slot >=3D MAX_SLOTS) {
> >> +        result =3D rutabaga_resource_unmap(vr->rutabaga,
> mblob.resource_id);
> >> +        CHECK(!result, cmd);
> >> +    }
> >> +
> >> +    CHECK(slot < MAX_SLOTS, cmd);
> >> +
> >> +    resp.hdr.type =3D VIRTIO_GPU_RESP_OK_MAP_INFO;
> >> +    virtio_gpu_ctrl_response(g, cmd, &resp.hdr, sizeof(resp));
> >> +}
> >> +
> >> +static void
> >> +rutabaga_cmd_resource_unmap_blob(VirtIOGPU *g,
> >> +                                 struct virtio_gpu_ctrl_command *cmd)
> >> +{
> >> +    int32_t result;
> >> +    uint32_t slot =3D 0;
> >> +    struct virtio_gpu_simple_resource *res;
> >> +    struct virtio_gpu_resource_unmap_blob ublob;
> >> +
> >> +    VirtIOGPUBase *vb =3D VIRTIO_GPU_BASE(g);
> >> +    VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(g);
> >> +
> >> +    VIRTIO_GPU_FILL_CMD(ublob);
> >> +
> >> +    CHECK(ublob.resource_id !=3D 0, cmd);
> >> +
> >> +    res =3D virtio_gpu_find_resource(g, ublob.resource_id);
> >> +    CHECK(res, cmd);
> >> +
> >> +    for (slot =3D 0; slot < MAX_SLOTS; slot++) {
> >> +        if (vr->memory_regions[slot].resource_id !=3D ublob.resource_=
id)
> {
> >> +            continue;
> >> +        }
> >> +
> >> +        MemoryRegion *mr =3D &(vr->memory_regions[slot].mr);
> >> +        memory_region_del_subregion(&vb->hostmem, mr);
> >> +
> >> +        vr->memory_regions[slot].resource_id =3D 0;
> >> +        vr->memory_regions[slot].used =3D 0;
> >> +        break;
> >> +    }
> >> +
> >> +    CHECK(slot < MAX_SLOTS, cmd);
> >> +    result =3D rutabaga_resource_unmap(vr->rutabaga, res->resource_id=
);
> >
> > Hi,
> >
> > After the discussion with Xenia Ragiadakou regarding their patch for
> Venus, I found a
> > bug present in the Venus implementation also affects Rutabaga.
> >
> > The problem is that the memory region may not immediately go away with
> > memory_region_del_subregion(), but it may be kept a bit after that. The
> memory region
> > has a pointer to the mapped memory so the unmapping call that
> immediately follows
> > will make it dangling.
> >
> > Xenia raised a question whether the dangling pointer can be actually
> dereferenced and
> > result in use-after-free, but the answer is unfortunately yes. For
> example, consider
> > the following call chain:
> > kvm_cpu_exec -> address_space_rw -> address_space_write ->
> flatview_write ->
> > flatview_write_continue
> >
> > address_space_write() holds a RCU read lock so that the flatview it
> refers to will
> > not go away during the operation even if it becomes obsolete and will b=
e
> used for
> > writes. It is possible that the obsolete flatview contains the memory
> region for the
> > memory that is concurrently unmapped by virtio-gpu-rutabaga/virgl.  Not=
e
> that the
> > function can be called without holding BQL, and KVM actually does so.
> >
> > Another case is address_space_map(). It acquires the reference to the
> memory with
> > memory_region_ref() and expects it will be available until
> memory_region_unref() gets
> > called with address_space_unmap().
>

Yeah, I did notice weird behavior around map/unmap when initially testing
the series:

https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg03378.html

The solution I did was just do what the Android Emulator (which uses
QEMU2.12) has been doing for years.  Not call "obj_unparent(g)" and keep a
table of memory regions for initialization.  It does pass all ./deqp-vk
memory tests and is sufficient to run Android on a Vulkan-only stack.  I
think the way blob resources are handled in the guest some of the cases
you've cited may not be hit practice.  The biggest bug on Linux we do hit
is a KVM bug but hopefully that should be fixed soon:

https://lore.kernel.org/kvmarm/20230911021637.1941096-1-stevensd@google.com=
/T/#m7c23c97b56378e3e865057140be54fa3dd87154e

We hit interesting issues on MacOS on the gitlab issue and I do think a
follow-up memory-only series may be warranted in the future.

https://gitlab.com/qemu-project/qemu/-/issues/1611

Since the Android Emulator has been running the solution in the
rutabaga/gfxstream series for years, it should be good for our purposes on
Linux for now.  WDYT?


> >
> > In conclusion, both of Rutabaga and Virgl need to ensure to wait until
> all refrences
> > to memory region will be gone before unmapping the underlying memory.
> The patch
> > "[QEMU PATCH v5 07/13] softmmu/memory: enable automatic deallocation of
> memory
> > regions" in the venus patch series is useful to know when that happens.
>
> FWIW this sounds exactly the same as the issue I had with unmapping
> ioports in commit
> 690705ca0b ("softmmu/ioport.c: make MemoryRegionPortioList owner of
> portio_list
> MemoryRegions").
>
> The solution in that commit is to assign the MemoryRegion reference to a
> new QOM
> object using memory_region_init(), but then re-parent the MR back onto it=
s
> original
> device owner (so the QOM tree in "info qom-tree" remains unchanged). This
> means that
> the new QOM object receives the unref notification from the flatview
> instead of the
> MemoryRegion, which then manually unmaps the MemoryRegion from the device
> when it is
> safe.
>
>
> ATB,
>
> Mark.
>
>

--0000000000007ce63c0605e75644
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 20, 2023 at 5:05=E2=80=AF=
AM Mark Cave-Ayland &lt;<a href=3D"mailto:mark.cave-ayland@ilande.co.uk">ma=
rk.cave-ayland@ilande.co.uk</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">On 20/09/2023 12:42, Akihiko Odaki wrote:<br>
<br>
&gt; On 2023/08/29 9:36, Gurchetan Singh wrote:<br>
&gt;&gt; This adds initial support for gfxstream and cross-domain.=C2=A0 Bo=
th<br>
&gt;&gt; features rely on virtio-gpu blob resources and context types, whic=
h<br>
&gt;&gt; are also implemented in this patch.<br>
&gt;&gt;<br>
&gt;&gt; gfxstream has a long and illustrious history in Android graphics<b=
r>
&gt;&gt; paravirtualization.=C2=A0 It has been powering graphics in the And=
roid<br>
&gt;&gt; Studio Emulator for more than a decade, which is the main develope=
r<br>
&gt;&gt; platform.<br>
&gt;&gt;<br>
&gt;&gt; Originally conceived by Jesse Hall, it was first known as &quot;Em=
uGL&quot; [a].<br>
&gt;&gt; The key design characteristic was a 1:1 threading model and<br>
&gt;&gt; auto-generation, which fit nicely with the OpenGLES spec.=C2=A0 It=
 also<br>
&gt;&gt; allowed easy layering with ANGLE on the host, which provides the G=
LES<br>
&gt;&gt; implementations on Windows or MacOS enviroments.<br>
&gt;&gt;<br>
&gt;&gt; gfxstream has traditionally been maintained by a single engineer, =
and<br>
&gt;&gt; between 2015 to 2021, the goldfish throne passed to Frank Yang.<br=
>
&gt;&gt; Historians often remark this glorious reign (&quot;pax gfxstreama&=
quot; is the<br>
&gt;&gt; academic term) was comparable to that of Augustus and both Queen<b=
r>
&gt;&gt; Elizabeths.=C2=A0 Just to name a few accomplishments in a resplend=
ent<br>
&gt;&gt; panoply: higher versions of GLES, address space graphics, snapshot=
<br>
&gt;&gt; support and CTS compliant Vulkan [b].<br>
&gt;&gt;<br>
&gt;&gt; One major drawback was the use of out-of-tree goldfish drivers.<br=
>
&gt;&gt; Android engineers didn&#39;t know much about DRM/KMS and especiall=
y TTM so<br>
&gt;&gt; a simple guest to host pipe was conceived.<br>
&gt;&gt;<br>
&gt;&gt; Luckily, virtio-gpu 3D started to emerge in 2016 due to the work o=
f<br>
&gt;&gt; the Mesa/virglrenderer communities.=C2=A0 In 2018, the initial vir=
tio-gpu<br>
&gt;&gt; port of gfxstream was done by Cuttlefish enthusiast Alistair Delva=
.<br>
&gt;&gt; It was a symbol compatible replacement of virglrenderer [c] and na=
med<br>
&gt;&gt; &quot;AVDVirglrenderer&quot;.=C2=A0 This implementation forms the =
basis of the<br>
&gt;&gt; current gfxstream host implementation still in use today.<br>
&gt;&gt;<br>
&gt;&gt; cross-domain support follows a similar arc.=C2=A0 Originally conce=
ived by<br>
&gt;&gt; Wayland aficionado David Reveman and crosvm enjoyer Zach Reizner i=
n<br>
&gt;&gt; 2018, it initially relied on the downstream &quot;virtio-wl&quot; =
device.<br>
&gt;&gt;<br>
&gt;&gt; In 2020 and 2021, virtio-gpu was extended to include blob resource=
s<br>
&gt;&gt; and multiple timelines by yours truly, features gfxstream/cross-do=
main<br>
&gt;&gt; both require to function correctly.<br>
&gt;&gt;<br>
&gt;&gt; Right now, we stand at the precipice of a truly fantastic possibil=
ity:<br>
&gt;&gt; the Android Emulator powered by upstream QEMU and upstream Linux<b=
r>
&gt;&gt; kernel.=C2=A0 gfxstream will then be packaged properfully, and app=
<br>
&gt;&gt; developers can even fix gfxstream bugs on their own if they encoun=
ter<br>
&gt;&gt; them.<br>
&gt;&gt;<br>
&gt;&gt; It&#39;s been quite the ride, my friends.=C2=A0 Where will gfxstre=
am head next,<br>
&gt;&gt; nobody really knows.=C2=A0 I wouldn&#39;t be surprised if it&#39;s=
 around for<br>
&gt;&gt; another decade, maintained by a new generation of Android graphics=
<br>
&gt;&gt; enthusiasts.<br>
&gt;&gt;<br>
&gt;&gt; Technical details:<br>
&gt;&gt; =C2=A0=C2=A0 - Very simple initial display integration: just used =
Pixman<br>
&gt;&gt; =C2=A0=C2=A0 - Largely, 1:1 mapping of virtio-gpu hypercalls to ru=
tabaga function<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 calls<br>
&gt;&gt;<br>
&gt;&gt; Next steps for Android VMs:<br>
&gt;&gt; =C2=A0=C2=A0 - The next step would be improving display integratio=
n and UI interfaces<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 with the goal of the QEMU upstream graphi=
cs being in an emulator<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 release [d].<br>
&gt;&gt;<br>
&gt;&gt; Next steps for Linux VMs for display virtualization:<br>
&gt;&gt; =C2=A0=C2=A0 - For widespread distribution, someone needs to packa=
ge Sommelier or the<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 wayland-proxy-virtwl [e] ideally into Deb=
ian main. In addition, newer<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 versions of the Linux kernel come with DR=
M_VIRTIO_GPU_KMS option,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 which allows disabling KMS hypercalls.=C2=
=A0 If anyone cares enough, it&#39;ll<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 probably be possible to build a custom VM=
 variant that uses this display<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 virtualization strategy.<br>
&gt;&gt;<br>
&gt;&gt; [a] <a href=3D"https://android-review.googlesource.com/c/platform/=
development/+/34470" rel=3D"noreferrer" target=3D"_blank">https://android-r=
eview.googlesource.com/c/platform/development/+/34470</a><br>
&gt;&gt; [b] <a href=3D"https://android-review.googlesource.com/q/topic:%22=
vulkan-hostconnection-start%22" rel=3D"noreferrer" target=3D"_blank">https:=
//android-review.googlesource.com/q/topic:%22vulkan-hostconnection-start%22=
</a><br>
&gt;&gt; [c] <a href=3D"https://android-review.googlesource.com/c/device/ge=
neric/goldfish-opengl/+/761927" rel=3D"noreferrer" target=3D"_blank">https:=
//android-review.googlesource.com/c/device/generic/goldfish-opengl/+/761927=
</a><br>
&gt;&gt; [d] <a href=3D"https://developer.android.com/studio/releases/emula=
tor" rel=3D"noreferrer" target=3D"_blank">https://developer.android.com/stu=
dio/releases/emulator</a><br>
&gt;&gt; [e] <a href=3D"https://github.com/talex5/wayland-proxy-virtwl" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/talex5/wayland-proxy-v=
irtwl</a><br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Gurchetan Singh &lt;<a href=3D"mailto:gurchetansing=
h@chromium.org" target=3D"_blank">gurchetansingh@chromium.org</a>&gt;<br>
&gt;&gt; Tested-by: Alyssa Ross &lt;<a href=3D"mailto:hi@alyssa.is" target=
=3D"_blank">hi@alyssa.is</a>&gt;<br>
&gt;&gt; Tested-by: Emmanouil Pitsidianakis &lt;<a href=3D"mailto:manos.pit=
sidianakis@linaro.org" target=3D"_blank">manos.pitsidianakis@linaro.org</a>=
&gt;<br>
&gt;&gt; Tested-by: Akihiko Odaki &lt;<a href=3D"mailto:akihiko.odaki@dayni=
x.com" target=3D"_blank">akihiko.odaki@daynix.com</a>&gt;<br>
&gt;&gt; Reviewed-by: Emmanouil Pitsidianakis &lt;<a href=3D"mailto:manos.p=
itsidianakis@linaro.org" target=3D"_blank">manos.pitsidianakis@linaro.org</=
a>&gt;<br>
&gt;&gt; Reviewed-by: Antonio Caggiano &lt;<a href=3D"mailto:quic_acaggian@=
quicinc.com" target=3D"_blank">quic_acaggian@quicinc.com</a>&gt;<br>
&gt;&gt; Reviewed-by: Akihiko Odaki &lt;<a href=3D"mailto:akihiko.odaki@day=
nix.com" target=3D"_blank">akihiko.odaki@daynix.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; =C2=A0 hw/display/virtio-gpu-pci-rutabaga.c |=C2=A0=C2=A0 47 ++<br=
>
&gt;&gt; =C2=A0 hw/display/virtio-gpu-rutabaga.c=C2=A0=C2=A0=C2=A0=C2=A0 | =
1119 ++++++++++++++++++++++++++<br>
&gt;&gt; =C2=A0 hw/display/virtio-vga-rutabaga.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 50 ++<br>
&gt;&gt; =C2=A0 3 files changed, 1216 insertions(+)<br>
&gt;&gt; =C2=A0 create mode 100644 hw/display/virtio-gpu-pci-rutabaga.c<br>
&gt;&gt; =C2=A0 create mode 100644 hw/display/virtio-gpu-rutabaga.c<br>
&gt;&gt; =C2=A0 create mode 100644 hw/display/virtio-vga-rutabaga.c<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/hw/display/virtio-gpu-pci-rutabaga.c <br>
&gt;&gt; b/hw/display/virtio-gpu-pci-rutabaga.c<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..c96729e198<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/hw/display/virtio-gpu-pci-rutabaga.c<br>
&gt;&gt; @@ -0,0 +1,47 @@<br>
&gt;&gt; +/* SPDX-License-Identifier: GPL-2.0-or-later */<br>
&gt;&gt; +<br>
&gt;&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt;&gt; +#include &quot;qapi/error.h&quot;<br>
&gt;&gt; +#include &quot;qemu/module.h&quot;<br>
&gt;&gt; +#include &quot;hw/pci/pci.h&quot;<br>
&gt;&gt; +#include &quot;hw/qdev-properties.h&quot;<br>
&gt;&gt; +#include &quot;hw/virtio/virtio.h&quot;<br>
&gt;&gt; +#include &quot;hw/virtio/virtio-bus.h&quot;<br>
&gt;&gt; +#include &quot;hw/virtio/virtio-gpu-pci.h&quot;<br>
&gt;&gt; +#include &quot;qom/object.h&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +#define TYPE_VIRTIO_GPU_RUTABAGA_PCI &quot;virtio-gpu-rutabaga-pc=
i&quot;<br>
&gt;&gt; +OBJECT_DECLARE_SIMPLE_TYPE(VirtIOGPURutabagaPCI, VIRTIO_GPU_RUTAB=
AGA_PCI)<br>
&gt;&gt; +<br>
&gt;&gt; +struct VirtIOGPURutabagaPCI {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VirtIOGPUPCIBase parent_obj;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VirtIOGPURutabaga vdev;<br>
&gt;&gt; +};<br>
&gt;&gt; +<br>
&gt;&gt; +static void virtio_gpu_rutabaga_initfn(Object *obj)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VirtIOGPURutabagaPCI *dev =3D VIRTIO_GPU_RUTAB=
AGA_PCI(obj);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 virtio_instance_init_common(obj, &amp;dev-&gt;=
vdev, sizeof(dev-&gt;vdev),<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TYPE_VIRTIO_GPU_RUTABAGA);=
<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VIRTIO_GPU_PCI_BASE(obj)-&gt;vgpu =3D VIRTIO_G=
PU_BASE(&amp;dev-&gt;vdev);<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static const TypeInfo virtio_gpu_rutabaga_pci_info[] =3D {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D TYPE_VIRTIO_=
GPU_RUTABAGA_PCI,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .parent =3D TYPE_VIRTI=
O_GPU_PCI_BASE,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .instance_size =3D siz=
eof(VirtIOGPURutabagaPCI),<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .instance_init =3D vir=
tio_gpu_rutabaga_initfn,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .interfaces =3D (Inter=
faceInfo[]) {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 { INTERFACE_CONVENTIONAL_PCI_DEVICE },<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 },<br>
&gt;&gt; +};<br>
&gt;&gt; +<br>
&gt;&gt; +DEFINE_TYPES(virtio_gpu_rutabaga_pci_info)<br>
&gt;&gt; +<br>
&gt;&gt; +module_obj(TYPE_VIRTIO_GPU_RUTABAGA_PCI);<br>
&gt;&gt; +module_kconfig(VIRTIO_PCI);<br>
&gt;&gt; +module_dep(&quot;hw-display-virtio-gpu-pci&quot;);<br>
&gt;&gt; diff --git a/hw/display/virtio-gpu-rutabaga.c b/hw/display/virtio-=
gpu-rutabaga.c<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..a105e06214<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/hw/display/virtio-gpu-rutabaga.c<br>
&gt;&gt; @@ -0,0 +1,1119 @@<br>
&gt;&gt; +/* SPDX-License-Identifier: GPL-2.0-or-later */<br>
&gt;&gt; +<br>
&gt;&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt;&gt; +#include &quot;qapi/error.h&quot;<br>
&gt;&gt; +#include &quot;qemu/error-report.h&quot;<br>
&gt;&gt; +#include &quot;qemu/iov.h&quot;<br>
&gt;&gt; +#include &quot;trace.h&quot;<br>
&gt;&gt; +#include &quot;hw/virtio/virtio.h&quot;<br>
&gt;&gt; +#include &quot;hw/virtio/virtio-gpu.h&quot;<br>
&gt;&gt; +#include &quot;hw/virtio/virtio-gpu-pixman.h&quot;<br>
&gt;&gt; +#include &quot;hw/virtio/virtio-iommu.h&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +#include &lt;glib/gmem.h&gt;<br>
&gt;&gt; +#include &lt;rutabaga_gfx/rutabaga_gfx_ffi.h&gt;<br>
&gt;&gt; +<br>
&gt;&gt; +#define CHECK(condition, cmd)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 \<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 do {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \<=
br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!(condition)) {=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \<=
br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 error_report(&quot;CHECK failed in %s() %s:&quot; &quot;%d&quot;, __fun=
c__,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __FILE__, __LINE__);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (cmd)-&gt;error =3D VIRTIO_GPU_RESP_ERR_UNSPEC;=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 \<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 } while (0)<br>
&gt;&gt; +<br>
&gt;&gt; +/*<br>
&gt;&gt; + * This is the size of the char array in struct sock_addr_un. No =
Wayland socket<br>
&gt;&gt; + * can be created with a path longer than this, including the nul=
l terminator.<br>
&gt;&gt; + */<br>
&gt;&gt; +#define UNIX_PATH_MAX sizeof((struct sockaddr_un) {} .sun_path)<b=
r>
&gt;&gt; +<br>
&gt;&gt; +struct rutabaga_aio_data {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct VirtIOGPURutabaga *vr;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct rutabaga_fence fence;<br>
&gt;&gt; +};<br>
&gt;&gt; +<br>
&gt;&gt; +static void<br>
&gt;&gt; +virtio_gpu_rutabaga_update_cursor(VirtIOGPU *g, struct virtio_gpu=
_scanout *s,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t resou=
rce_id)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct virtio_gpu_simple_resource *res;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct rutabaga_transfer transfer =3D { 0 };<b=
r>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct iovec transfer_iovec;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(=
g);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 res =3D virtio_gpu_find_resource(g, resource_i=
d);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 if (!res) {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 if (res-&gt;width !=3D s-&gt;current_cursor-&g=
t;width ||<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 res-&gt;height !=3D s-=
&gt;current_cursor-&gt;height) {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer.x =3D 0;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer.y =3D 0;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer.z =3D 0;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer.w =3D res-&gt;width;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer.h =3D res-&gt;height;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer.d =3D 1;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer_iovec.iov_base =3D s-&gt;current_curs=
or-&gt;data;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer_iovec.iov_len =3D res-&gt;width * res=
-&gt;height * 4;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 rutabaga_resource_transfer_read(vr-&gt;rutabag=
a, 0,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
source_id, &amp;transfer,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &a=
mp;transfer_iovec);<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static void<br>
&gt;&gt; +virtio_gpu_rutabaga_gl_flushed(VirtIOGPUBase *b)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VirtIOGPU *g =3D VIRTIO_GPU(b);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 virtio_gpu_process_cmdq(g);<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static void<br>
&gt;&gt; +rutabaga_cmd_create_resource_2d(VirtIOGPU *g,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct virtio_gpu_ctrl_com=
mand *cmd)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 int32_t result;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct rutabaga_create_3d rc_3d =3D { 0 };<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct virtio_gpu_simple_resource *res;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct virtio_gpu_resource_create_2d c2d;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(=
g);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VIRTIO_GPU_FILL_CMD(c2d);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 trace_virtio_gpu_cmd_res_create_2d(c2d.resourc=
e_id, c2d.format,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 c2d.width, c2d.height);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 rc_3d.target =3D 2;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 rc_3d.format =3D c2d.format;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 rc_3d.bind =3D (1 &lt;&lt; 1);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 rc_3d.width =3D c2d.width;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 rc_3d.height =3D c2d.height;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 rc_3d.depth =3D 1;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 rc_3d.array_size =3D 1;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 rc_3d.last_level =3D 0;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 rc_3d.nr_samples =3D 0;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 rc_3d.flags =3D VIRTIO_GPU_RESOURCE_FLAG_Y_0_T=
OP;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 result =3D rutabaga_resource_create_3d(vr-&gt;=
rutabaga, c2d.resource_id, &amp;rc_3d);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 CHECK(!result, cmd);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 res =3D g_new0(struct virtio_gpu_simple_resour=
ce, 1);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 res-&gt;width =3D c2d.width;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 res-&gt;height =3D c2d.height;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 res-&gt;format =3D c2d.format;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 res-&gt;resource_id =3D c2d.resource_id;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 QTAILQ_INSERT_HEAD(&amp;g-&gt;reslist, res, ne=
xt);<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static void<br>
&gt;&gt; +rutabaga_cmd_create_resource_3d(VirtIOGPU *g,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct virtio_gpu_ctrl_com=
mand *cmd)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 int32_t result;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct rutabaga_create_3d rc_3d =3D { 0 };<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct virtio_gpu_simple_resource *res;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct virtio_gpu_resource_create_3d c3d;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(=
g);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VIRTIO_GPU_FILL_CMD(c3d);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 trace_virtio_gpu_cmd_res_create_3d(c3d.resourc=
e_id, c3d.format,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 c3d.width, c3d.height, c3d.depth);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 rc_3d.target =3D c3d.target;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 rc_3d.format =3D c3d.format;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 rc_3d.bind =3D c3d.bind;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 rc_3d.width =3D c3d.width;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 rc_3d.height =3D c3d.height;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 rc_3d.depth =3D c3d.depth;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 rc_3d.array_size =3D c3d.array_size;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 rc_3d.last_level =3D c3d.last_level;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 rc_3d.nr_samples =3D c3d.nr_samples;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 rc_3d.flags =3D c3d.flags;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 result =3D rutabaga_resource_create_3d(vr-&gt;=
rutabaga, c3d.resource_id, &amp;rc_3d);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 CHECK(!result, cmd);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 res =3D g_new0(struct virtio_gpu_simple_resour=
ce, 1);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 res-&gt;width =3D c3d.width;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 res-&gt;height =3D c3d.height;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 res-&gt;format =3D c3d.format;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 res-&gt;resource_id =3D c3d.resource_id;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 QTAILQ_INSERT_HEAD(&amp;g-&gt;reslist, res, ne=
xt);<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static void<br>
&gt;&gt; +rutabaga_cmd_resource_unref(VirtIOGPU *g,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 struct virtio_gpu_ctrl_command *cmd)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 int32_t result;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct virtio_gpu_simple_resource *res;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct virtio_gpu_resource_unref unref;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(=
g);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VIRTIO_GPU_FILL_CMD(unref);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 trace_virtio_gpu_cmd_res_unref(unref.resource_=
id);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 res =3D virtio_gpu_find_resource(g, unref.reso=
urce_id);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 CHECK(res, cmd);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 result =3D rutabaga_resource_unref(vr-&gt;ruta=
baga, unref.resource_id);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 CHECK(!result, cmd);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 if (res-&gt;image) {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pixman_image_unref(res=
-&gt;image);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 QTAILQ_REMOVE(&amp;g-&gt;reslist, res, next);<=
br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 g_free(res);<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static void<br>
&gt;&gt; +rutabaga_cmd_context_create(VirtIOGPU *g,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 struct virtio_gpu_ctrl_command *cmd)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 int32_t result;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct virtio_gpu_ctx_create cc;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(=
g);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VIRTIO_GPU_FILL_CMD(cc);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 trace_virtio_gpu_cmd_ctx_create(cc.hdr.ctx_id,=
<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cc=
.debug_name);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 result =3D rutabaga_context_create(vr-&gt;ruta=
baga, cc.hdr.ctx_id,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 cc.context_init, cc.debug_name, cc.nlen);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 CHECK(!result, cmd);<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static void<br>
&gt;&gt; +rutabaga_cmd_context_destroy(VirtIOGPU *g,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct virtio_gpu_ctrl_command *cmd)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 int32_t result;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct virtio_gpu_ctx_destroy cd;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(=
g);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VIRTIO_GPU_FILL_CMD(cd);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 trace_virtio_gpu_cmd_ctx_destroy(cd.hdr.ctx_id=
);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 result =3D rutabaga_context_destroy(vr-&gt;rut=
abaga, cd.hdr.ctx_id);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 CHECK(!result, cmd);<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static void<br>
&gt;&gt; +rutabaga_cmd_resource_flush(VirtIOGPU *g, struct virtio_gpu_ctrl_=
command *cmd)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 int32_t result, i;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct virtio_gpu_scanout *scanout =3D NULL;<b=
r>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct virtio_gpu_simple_resource *res;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct rutabaga_transfer transfer =3D { 0 };<b=
r>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct iovec transfer_iovec;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct virtio_gpu_resource_flush rf;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 bool found =3D false;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VirtIOGPUBase *vb =3D VIRTIO_GPU_BASE(g);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(=
g);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 if (vr-&gt;headless) {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VIRTIO_GPU_FILL_CMD(rf);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 trace_virtio_gpu_cmd_res_flush(rf.resource_id,=
<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rf.r.wid=
th, rf.r.height, rf.r.x, rf.r.y);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 res =3D virtio_gpu_find_resource(g, rf.resourc=
e_id);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 CHECK(res, cmd);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i &lt; vb-&gt;conf.max_outputs; =
i++) {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 scanout =3D &amp;vb-&g=
t;scanout[i];<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (i =3D=3D res-&gt;s=
canout_bitmask) {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 found =3D true;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 break;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 if (!found) {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer.x =3D 0;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer.y =3D 0;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer.z =3D 0;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer.w =3D res-&gt;width;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer.h =3D res-&gt;height;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer.d =3D 1;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer_iovec.iov_base =3D pixman_image_get_d=
ata(res-&gt;image);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer_iovec.iov_len =3D res-&gt;width * res=
-&gt;height * 4;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 result =3D rutabaga_resource_transfer_read(vr-=
&gt;rutabaga, 0,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rf.resource_id, &amp;tr=
ansfer,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &amp;transfer_iovec);<b=
r>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 CHECK(!result, cmd);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 dpy_gfx_update_full(scanout-&gt;con);<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static void<br>
&gt;&gt; +rutabaga_cmd_set_scanout(VirtIOGPU *g, struct virtio_gpu_ctrl_com=
mand *cmd)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct virtio_gpu_simple_resource *res;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct virtio_gpu_scanout *scanout =3D NULL;<b=
r>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct virtio_gpu_set_scanout ss;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VirtIOGPUBase *vb =3D VIRTIO_GPU_BASE(g);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(=
g);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 if (vr-&gt;headless) {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VIRTIO_GPU_FILL_CMD(ss);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 trace_virtio_gpu_cmd_set_scanout(ss.scanout_id=
, ss.resource_id,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ss.r.width, ss.r.height, ss.r.x, ss.r.y);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 CHECK(ss.scanout_id &lt; VIRTIO_GPU_MAX_SCANOU=
TS, cmd);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 scanout =3D &amp;vb-&gt;scanout[ss.scanout_id]=
;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 if (ss.resource_id =3D=3D 0) {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dpy_gfx_replace_surfac=
e(scanout-&gt;con, NULL);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dpy_gl_scanout_disable=
(scanout-&gt;con);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 res =3D virtio_gpu_find_resource(g, ss.resourc=
e_id);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 CHECK(res, cmd);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 if (!res-&gt;image) {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pixman_format_code_t p=
format;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pformat =3D virtio_gpu=
_get_pixman_format(res-&gt;format);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CHECK(pformat, cmd);<b=
r>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 res-&gt;image =3D pixm=
an_image_create_bits(pformat,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 res-&gt;width,<br=
>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 res-&gt;height,<b=
r>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL, 0);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CHECK(res-&gt;image, c=
md);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pixman_image_ref(res-&=
gt;image);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 vb-&gt;enable =3D 1;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 /* realloc the surface ptr */<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 scanout-&gt;ds =3D qemu_create_displaysurface_=
pixman(res-&gt;image);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 dpy_gfx_replace_surface(scanout-&gt;con, NULL)=
;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 dpy_gfx_replace_surface(scanout-&gt;con, scano=
ut-&gt;ds);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 res-&gt;scanout_bitmask =3D ss.scanout_id;<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static void<br>
&gt;&gt; +rutabaga_cmd_submit_3d(VirtIOGPU *g,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struc=
t virtio_gpu_ctrl_command *cmd)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 int32_t result;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct virtio_gpu_cmd_submit cs;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct rutabaga_command rutabaga_cmd =3D { 0 }=
;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 g_autofree uint8_t *buf =3D NULL;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 size_t s;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(=
g);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VIRTIO_GPU_FILL_CMD(cs);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 trace_virtio_gpu_cmd_ctx_submit(cs.hdr.ctx_id,=
 cs.size);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 buf =3D g_new0(uint8_t, cs.size);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 s =3D iov_to_buf(cmd-&gt;elem.out_sg, cmd-&gt;=
elem.out_num,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(cs), buf, cs.size);<br=
>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 CHECK(s =3D=3D cs.size, cmd);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 rutabaga_cmd.ctx_id =3D cs.hdr.ctx_id;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 rutabaga_cmd.cmd =3D buf;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 rutabaga_cmd.cmd_size =3D cs.size;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 result =3D rutabaga_submit_command(vr-&gt;ruta=
baga, &amp;rutabaga_cmd);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 CHECK(!result, cmd);<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static void<br>
&gt;&gt; +rutabaga_cmd_transfer_to_host_2d(VirtIOGPU *g,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct virtio_gpu_ct=
rl_command *cmd)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 int32_t result;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct rutabaga_transfer transfer =3D { 0 };<b=
r>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct virtio_gpu_transfer_to_host_2d t2d;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(=
g);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VIRTIO_GPU_FILL_CMD(t2d);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 trace_virtio_gpu_cmd_res_xfer_toh_2d(t2d.resou=
rce_id);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer.x =3D t2d.r.x;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer.y =3D t2d.r.y;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer.z =3D 0;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer.w =3D t2d.r.width;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer.h =3D t2d.r.height;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer.d =3D 1;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 result =3D rutabaga_resource_transfer_write(vr=
-&gt;rutabaga, 0, t2d.resource_id,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &amp;transfer);<b=
r>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 CHECK(!result, cmd);<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static void<br>
&gt;&gt; +rutabaga_cmd_transfer_to_host_3d(VirtIOGPU *g,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct virtio_gpu_ct=
rl_command *cmd)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 int32_t result;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct rutabaga_transfer transfer =3D { 0 };<b=
r>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct virtio_gpu_transfer_host_3d t3d;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(=
g);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VIRTIO_GPU_FILL_CMD(t3d);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 trace_virtio_gpu_cmd_res_xfer_toh_3d(t3d.resou=
rce_id);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer.x =3D t3d.box.x;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer.y =3D t3d.box.y;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer.z =3D t3d.box.z;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer.w =3D t3d.box.w;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer.h =3D t3d.box.h;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer.d =3D t3d.box.d;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer.level =3D t3d.level;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer.stride =3D t3d.stride;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer.layer_stride =3D t3d.layer_stride;<br=
>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer.offset =3D t3d.offset;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 result =3D rutabaga_resource_transfer_write(vr=
-&gt;rutabaga, t3d.hdr.ctx_id,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 t3d.resource_id, =
&amp;transfer);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 CHECK(!result, cmd);<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static void<br>
&gt;&gt; +rutabaga_cmd_transfer_from_host_3d(VirtIOGPU *g,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v=
irtio_gpu_ctrl_command *cmd)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 int32_t result;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct rutabaga_transfer transfer =3D { 0 };<b=
r>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct virtio_gpu_transfer_host_3d t3d;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(=
g);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VIRTIO_GPU_FILL_CMD(t3d);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 trace_virtio_gpu_cmd_res_xfer_fromh_3d(t3d.res=
ource_id);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer.x =3D t3d.box.x;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer.y =3D t3d.box.y;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer.z =3D t3d.box.z;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer.w =3D t3d.box.w;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer.h =3D t3d.box.h;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer.d =3D t3d.box.d;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer.level =3D t3d.level;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer.stride =3D t3d.stride;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer.layer_stride =3D t3d.layer_stride;<br=
>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 transfer.offset =3D t3d.offset;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 result =3D rutabaga_resource_transfer_read(vr-=
&gt;rutabaga, t3d.hdr.ctx_id,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 t3d.resource_id, &amp;t=
ransfer, NULL);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 CHECK(!result, cmd);<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static void<br>
&gt;&gt; +rutabaga_cmd_attach_backing(VirtIOGPU *g, struct virtio_gpu_ctrl_=
command *cmd)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct rutabaga_iovecs vecs =3D { 0 };<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct virtio_gpu_simple_resource *res;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct virtio_gpu_resource_attach_backing att_=
rb;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 int ret;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(=
g);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VIRTIO_GPU_FILL_CMD(att_rb);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 trace_virtio_gpu_cmd_res_back_attach(att_rb.re=
source_id);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 res =3D virtio_gpu_find_resource(g, att_rb.res=
ource_id);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 CHECK(res, cmd);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 CHECK(!res-&gt;iov, cmd);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 ret =3D virtio_gpu_create_mapping_iov(g, att_r=
b.nr_entries, sizeof(att_rb),<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 cmd, NULL, &amp;res-&gt;iov, &amp;res-&gt;iov_cnt);<b=
r>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 CHECK(!ret, cmd);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 vecs.iovecs =3D res-&gt;iov;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 vecs.num_iovecs =3D res-&gt;iov_cnt;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 ret =3D rutabaga_resource_attach_backing(vr-&g=
t;rutabaga, att_rb.resource_id,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &amp;vecs);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 if (ret !=3D 0) {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 virtio_gpu_cleanup_map=
ping(g, res);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 CHECK(!ret, cmd);<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static void<br>
&gt;&gt; +rutabaga_cmd_detach_backing(VirtIOGPU *g, struct virtio_gpu_ctrl_=
command *cmd)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct virtio_gpu_simple_resource *res;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct virtio_gpu_resource_detach_backing deta=
ch_rb;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(=
g);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VIRTIO_GPU_FILL_CMD(detach_rb);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 trace_virtio_gpu_cmd_res_back_detach(detach_rb=
.resource_id);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 res =3D virtio_gpu_find_resource(g, detach_rb.=
resource_id);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 CHECK(res, cmd);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 rutabaga_resource_detach_backing(vr-&gt;rutaba=
ga,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 detach_rb.resource_id);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 virtio_gpu_cleanup_mapping(g, res);<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static void<br>
&gt;&gt; +rutabaga_cmd_ctx_attach_resource(VirtIOGPU *g,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct virtio_gpu_ct=
rl_command *cmd)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 int32_t result;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct virtio_gpu_ctx_resource att_res;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(=
g);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VIRTIO_GPU_FILL_CMD(att_res);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 trace_virtio_gpu_cmd_ctx_res_attach(att_res.hd=
r.ctx_id,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 att_res.resource_id);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 result =3D rutabaga_context_attach_resource(vr=
-&gt;rutabaga, att_res.hdr.ctx_id,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 att_res.resource_=
id);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 CHECK(!result, cmd);<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static void<br>
&gt;&gt; +rutabaga_cmd_ctx_detach_resource(VirtIOGPU *g,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct virtio_gpu_ct=
rl_command *cmd)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 int32_t result;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct virtio_gpu_ctx_resource det_res;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(=
g);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VIRTIO_GPU_FILL_CMD(det_res);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 trace_virtio_gpu_cmd_ctx_res_detach(det_res.hd=
r.ctx_id,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 det_res.resource_id);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 result =3D rutabaga_context_detach_resource(vr=
-&gt;rutabaga, det_res.hdr.ctx_id,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 det_res.resource_=
id);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 CHECK(!result, cmd);<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static void<br>
&gt;&gt; +rutabaga_cmd_get_capset_info(VirtIOGPU *g, struct virtio_gpu_ctrl=
_command *cmd)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 int32_t result;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct virtio_gpu_get_capset_info info;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct virtio_gpu_resp_capset_info resp;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(=
g);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VIRTIO_GPU_FILL_CMD(info);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 result =3D rutabaga_get_capset_info(vr-&gt;rut=
abaga, info.capset_index,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 &amp;resp.capset_id, &amp;resp.capset_max_version,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 &amp;resp.capset_max_size);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 CHECK(!result, cmd);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 resp.hdr.type =3D VIRTIO_GPU_RESP_OK_CAPSET_IN=
FO;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 virtio_gpu_ctrl_response(g, cmd, &amp;resp.hdr=
, sizeof(resp));<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static void<br>
&gt;&gt; +rutabaga_cmd_get_capset(VirtIOGPU *g, struct virtio_gpu_ctrl_comm=
and *cmd)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 int32_t result;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct virtio_gpu_get_capset gc;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct virtio_gpu_resp_capset *resp;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 uint32_t capset_size, capset_version;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 uint32_t current_id, i;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(=
g);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VIRTIO_GPU_FILL_CMD(gc);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i &lt; vr-&gt;num_capsets; i++) =
{<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 result =3D rutabaga_ge=
t_capset_info(vr-&gt;rutabaga, i,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &amp;current_id, &amp;capset_version,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &amp;capset_size);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CHECK(!result, cmd);<b=
r>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (current_id =3D=3D =
gc.capset_id) {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 break;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 CHECK(i &lt; vr-&gt;num_capsets, cmd);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 resp =3D g_malloc0(sizeof(*resp) + capset_size=
);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 resp-&gt;hdr.type =3D VIRTIO_GPU_RESP_OK_CAPSE=
T;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 rutabaga_get_capset(vr-&gt;rutabaga, gc.capset=
_id, gc.capset_version,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 resp-&gt;capset_data, capset_size);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 virtio_gpu_ctrl_response(g, cmd, &amp;resp-&gt=
;hdr, sizeof(*resp) + capset_size);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 g_free(resp);<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static void<br>
&gt;&gt; +rutabaga_cmd_resource_create_blob(VirtIOGPU *g,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct virtio_=
gpu_ctrl_command *cmd)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 int result;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct rutabaga_iovecs vecs =3D { 0 };<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 g_autofree struct virtio_gpu_simple_resource *=
res =3D NULL;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct virtio_gpu_resource_create_blob cblob;<=
br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct rutabaga_create_blob rc_blob =3D { 0 };=
<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(=
g);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VIRTIO_GPU_FILL_CMD(cblob);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 trace_virtio_gpu_cmd_res_create_blob(cblob.res=
ource_id, cblob.size);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 CHECK(cblob.resource_id !=3D 0, cmd);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 res =3D g_new0(struct virtio_gpu_simple_resour=
ce, 1);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 res-&gt;resource_id =3D cblob.resource_id;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 res-&gt;blob_size =3D cblob.size;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 if (cblob.blob_mem !=3D VIRTIO_GPU_BLOB_MEM_HO=
ST3D) {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 result =3D virtio_gpu_=
create_mapping_iov(g, cblob.nr_entries,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(cblo=
b), cmd, &amp;res-&gt;addrs,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &amp;res-&g=
t;iov, &amp;res-&gt;iov_cnt);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CHECK(!result, cmd);<b=
r>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 rc_blob.blob_id =3D cblob.blob_id;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 rc_blob.blob_mem =3D cblob.blob_mem;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 rc_blob.blob_flags =3D cblob.blob_flags;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 rc_blob.size =3D cblob.size;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 vecs.iovecs =3D res-&gt;iov;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 vecs.num_iovecs =3D res-&gt;iov_cnt;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 result =3D rutabaga_resource_create_blob(vr-&g=
t;rutabaga, cblob.hdr.ctx_id,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cblob.resource_id, &amp;rc_blob, &a=
mp;vecs,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 if (result &amp;&amp; cblob.blob_mem !=3D VIRT=
IO_GPU_BLOB_MEM_HOST3D) {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 virtio_gpu_cleanup_map=
ping(g, res);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 CHECK(!result, cmd);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 QTAILQ_INSERT_HEAD(&amp;g-&gt;reslist, res, ne=
xt);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 res =3D NULL;<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static void<br>
&gt;&gt; +rutabaga_cmd_resource_map_blob(VirtIOGPU *g,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct virtio_gpu_ctrl_command *=
cmd)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 int32_t result;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 uint32_t map_info =3D 0;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 uint32_t slot =3D 0;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct virtio_gpu_simple_resource *res;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct rutabaga_mapping mapping =3D { 0 };<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct virtio_gpu_resource_map_blob mblob;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct virtio_gpu_resp_map_info resp =3D { 0 }=
;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VirtIOGPUBase *vb =3D VIRTIO_GPU_BASE(g);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(=
g);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VIRTIO_GPU_FILL_CMD(mblob);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 CHECK(mblob.resource_id !=3D 0, cmd);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 res =3D virtio_gpu_find_resource(g, mblob.reso=
urce_id);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 CHECK(res, cmd);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 result =3D rutabaga_resource_map_info(vr-&gt;r=
utabaga, mblob.resource_id,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 &amp;map_info);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 CHECK(!result, cmd);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 /*<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 * RUTABAGA_MAP_ACCESS_* flags are not pa=
rt of the virtio-gpu spec, but do<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 * exist to potentially allow the hypervi=
sor to restrict write access to<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 * memory. QEMU does not need to use this=
 functionality at the moment.<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 */<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 resp.map_info =3D map_info &amp; RUTABAGA_MAP_=
CACHE_MASK;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 result =3D rutabaga_resource_map(vr-&gt;rutaba=
ga, mblob.resource_id, &amp;mapping);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 CHECK(!result, cmd);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 for (slot =3D 0; slot &lt; MAX_SLOTS; slot++) =
{<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (vr-&gt;memory_regi=
ons[slot].used) {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 continue;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MemoryRegion *mr =3D &=
amp;(vr-&gt;memory_regions[slot].mr);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memory_region_init_ram=
_ptr(mr, OBJECT(vr), &quot;blob&quot;, mapping.size,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mapping.=
ptr);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memory_region_add_subr=
egion(&amp;vb-&gt;hostmem, mblob.offset, mr);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vr-&gt;memory_regions[=
slot].resource_id =3D mblob.resource_id;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vr-&gt;memory_regions[=
slot].used =3D 1;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 if (slot &gt;=3D MAX_SLOTS) {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 result =3D rutabaga_re=
source_unmap(vr-&gt;rutabaga, mblob.resource_id);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CHECK(!result, cmd);<b=
r>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 CHECK(slot &lt; MAX_SLOTS, cmd);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 resp.hdr.type =3D VIRTIO_GPU_RESP_OK_MAP_INFO;=
<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 virtio_gpu_ctrl_response(g, cmd, &amp;resp.hdr=
, sizeof(resp));<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static void<br>
&gt;&gt; +rutabaga_cmd_resource_unmap_blob(VirtIOGPU *g,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct virtio_gpu_ct=
rl_command *cmd)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 int32_t result;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 uint32_t slot =3D 0;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct virtio_gpu_simple_resource *res;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct virtio_gpu_resource_unmap_blob ublob;<b=
r>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VirtIOGPUBase *vb =3D VIRTIO_GPU_BASE(g);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VirtIOGPURutabaga *vr =3D VIRTIO_GPU_RUTABAGA(=
g);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 VIRTIO_GPU_FILL_CMD(ublob);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 CHECK(ublob.resource_id !=3D 0, cmd);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 res =3D virtio_gpu_find_resource(g, ublob.reso=
urce_id);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 CHECK(res, cmd);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 for (slot =3D 0; slot &lt; MAX_SLOTS; slot++) =
{<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (vr-&gt;memory_regi=
ons[slot].resource_id !=3D ublob.resource_id) {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 continue;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MemoryRegion *mr =3D &=
amp;(vr-&gt;memory_regions[slot].mr);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memory_region_del_subr=
egion(&amp;vb-&gt;hostmem, mr);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vr-&gt;memory_regions[=
slot].resource_id =3D 0;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vr-&gt;memory_regions[=
slot].used =3D 0;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 CHECK(slot &lt; MAX_SLOTS, cmd);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 result =3D rutabaga_resource_unmap(vr-&gt;ruta=
baga, res-&gt;resource_id);<br>
&gt; <br>
&gt; Hi,<br>
&gt; <br>
&gt; After the discussion with Xenia Ragiadakou regarding their patch for V=
enus, I found a <br>
&gt; bug present in the Venus implementation also affects Rutabaga.<br>
&gt; <br>
&gt; The problem is that the memory region may not immediately go away with=
 <br>
&gt; memory_region_del_subregion(), but it may be kept a bit after that. Th=
e memory region <br>
&gt; has a pointer to the mapped memory so the unmapping call that immediat=
ely follows <br>
&gt; will make it dangling.<br>
&gt; <br>
&gt; Xenia raised a question whether the dangling pointer can be actually d=
ereferenced and <br>
&gt; result in use-after-free, but the answer is unfortunately yes. For exa=
mple, consider <br>
&gt; the following call chain:<br>
&gt; kvm_cpu_exec -&gt; address_space_rw -&gt; address_space_write -&gt; fl=
atview_write -&gt; <br>
&gt; flatview_write_continue<br>
&gt; <br>
&gt; address_space_write() holds a RCU read lock so that the flatview it re=
fers to will <br>
&gt; not go away during the operation even if it becomes obsolete and will =
be used for <br>
&gt; writes. It is possible that the obsolete flatview contains the memory =
region for the <br>
&gt; memory that is concurrently unmapped by virtio-gpu-rutabaga/virgl.=C2=
=A0 Note that the <br>
&gt; function can be called without holding BQL, and KVM actually does so.<=
br>
&gt; <br>
&gt; Another case is address_space_map(). It acquires the reference to the =
memory with <br>
&gt; memory_region_ref() and expects it will be available until memory_regi=
on_unref() gets <br>
&gt; called with address_space_unmap().<br></blockquote><div><br></div><div=
>Yeah, I did notice weird behavior around map/unmap when initially testing =
the series:</div><div><br></div><div><a href=3D"https://lists.gnu.org/archi=
ve/html/qemu-devel/2023-04/msg03378.html">https://lists.gnu.org/archive/htm=
l/qemu-devel/2023-04/msg03378.html</a><br></div><div><br></div><div>The sol=
ution I did was just do what the Android Emulator (which uses QEMU2.12) has=
 been doing for years.=C2=A0 Not call &quot;obj_unparent(g)&quot; and keep =
a table of memory regions for initialization.=C2=A0 It does pass all ./deqp=
-vk memory tests and is sufficient to run Android on a Vulkan-only stack.=
=C2=A0 I think the way blob resources are handled in the guest some of the =
cases you&#39;ve cited may not be hit practice.=C2=A0 The biggest bug on Li=
nux we do hit is a KVM bug but hopefully that should be fixed soon:</div><d=
iv><br></div><div><a href=3D"https://lore.kernel.org/kvmarm/20230911021637.=
1941096-1-stevensd@google.com/T/#m7c23c97b56378e3e865057140be54fa3dd87154e"=
>https://lore.kernel.org/kvmarm/20230911021637.1941096-1-stevensd@google.co=
m/T/#m7c23c97b56378e3e865057140be54fa3dd87154e</a><br></div><div><br></div>=
<div>We hit interesting issues on MacOS on the gitlab issue and I do think =
a follow-up memory-only series may be warranted in the future.</div><div><b=
r></div><div><a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/1611"=
>https://gitlab.com/qemu-project/qemu/-/issues/1611</a><br></div><div><br><=
/div><div>Since the Android Emulator has been running the solution in the r=
utabaga/gfxstream series for years, it should be good for our purposes on L=
inux for now.=C2=A0 WDYT?<br></div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
&gt; <br>
&gt; In conclusion, both of Rutabaga and Virgl need to ensure to wait until=
 all refrences <br>
&gt; to memory region will be gone before unmapping the underlying memory. =
The patch <br>
&gt; &quot;[QEMU PATCH v5 07/13] softmmu/memory: enable automatic deallocat=
ion of memory <br>
&gt; regions&quot; in the venus patch series is useful to know when that ha=
ppens.<br>
<br>
FWIW this sounds exactly the same as the issue I had with unmapping ioports=
 in commit <br>
690705ca0b (&quot;softmmu/ioport.c: make MemoryRegionPortioList owner of po=
rtio_list <br>
MemoryRegions&quot;).<br>
<br>
The solution in that commit is to assign the MemoryRegion reference to a ne=
w QOM <br>
object using memory_region_init(), but then re-parent the MR back onto its =
original <br>
device owner (so the QOM tree in &quot;info qom-tree&quot; remains unchange=
d). This means that <br>
the new QOM object receives the unref notification from the flatview instea=
d of the <br>
MemoryRegion, which then manually unmaps the MemoryRegion from the device w=
hen it is <br>
safe.<br>
<br>
<br>
ATB,<br>
<br>
Mark.<br>
<br>
</blockquote></div></div>

--0000000000007ce63c0605e75644--

