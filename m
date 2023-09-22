Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4257AA723
	for <lists+xen-devel@lfdr.de>; Fri, 22 Sep 2023 04:54:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606687.944685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjWIf-0004LO-JL; Fri, 22 Sep 2023 02:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606687.944685; Fri, 22 Sep 2023 02:53:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjWIf-0004Iu-GT; Fri, 22 Sep 2023 02:53:49 +0000
Received: by outflank-mailman (input) for mailman id 606687;
 Fri, 22 Sep 2023 02:53:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WcZa=FG=gmail.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1qjWIe-0004Io-8l
 for xen-devel@lists.xenproject.org; Fri, 22 Sep 2023 02:53:48 +0000
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [2607:f8b0:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d788db2-58f3-11ee-9b0d-b553b5be7939;
 Fri, 22 Sep 2023 04:53:43 +0200 (CEST)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-69101022969so1545850b3a.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Sep 2023 19:53:43 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a17090ac90700b00268188ea4b9sm2146318pjt.19.2023.09.21.19.53.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 19:53:41 -0700 (PDT)
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
X-Inumbo-ID: 3d788db2-58f3-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695351222; x=1695956022; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=onRr8hdq4v5JQc7LkGYpFCCv8yWfml33JMDRjcM3me0=;
        b=MHAFdkBDhPe15AQc8o5ZSCdknsgb+fXdziy8WKwlJM1AjyOOTrEwIC5RjzYg3JXu+f
         M9yvdbdWYB9lHeR6qNwD0Jl3kde1Nq0+cuytL49dgTSG1B4VecYYKs7mtr7XEUFZ7pIN
         z2zJWmx/DLdA9mJrFpPnvzC7gzmYKd/sAX586t+PBXHrP5sT0ysHOPqRbDeK78rN7U5O
         UTvk31QzfaMT2eFQXmjHgmwGYPs/EpOKMTu70mhHk7MTuvo6YReB3f8IOuGvniIe6slF
         JZUL0eLcU34RHP/4vWfplJF7ten5SNktiRbprWrhVNcbG/Lg/+PxSQnVce1St9AXjSja
         l4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695351222; x=1695956022;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=onRr8hdq4v5JQc7LkGYpFCCv8yWfml33JMDRjcM3me0=;
        b=WNf/kVYeq1TpJDpR0/49bkaxhqMPmysZOry/tzWiRK7zVqjou4+FgX/2GYyFXAlCly
         PrNlE+AdeEnIrC6YMzmeB3c/VFQk3efZ3wRhs3AZMcKrypp699OFgShvZEG6YRg6W302
         akmG/8U3+9Smg5NWL74xNikTjh2k2M9JYVfxygFAzOpBGGz+8qPje4tdMLH+9/c1U+wu
         3jdeaOQlaULgPQGJHt1znzX2vGaCgtm+YxarAnQh1j2JpGonwrMJa/jHFn+4c6RRNNT7
         GDc6KhP9BiS9ykpm47XZo5H/LVptzWR7QxfdCLLRrHsKhDd6CkI6Z3nO5hvay5VUsaTv
         yJPw==
X-Gm-Message-State: AOJu0YwsKoZG86S5Oc0S1aCOl4q1RIi/ucu1y/1Xyb8S329A/i9ixOIz
	fsdKDEfxu077xm+eB50cSYY=
X-Google-Smtp-Source: AGHT+IF9RscWeQg1KyeWa+o+j3AZci3gYfUVQUpVOEgsPlZleA/aJ2XKWFI0EprjkBPuDvh/Gx+neg==
X-Received: by 2002:a05:6a20:160d:b0:15a:3b83:24d1 with SMTP id l13-20020a056a20160d00b0015a3b8324d1mr9006559pzj.18.1695351221879;
        Thu, 21 Sep 2023 19:53:41 -0700 (PDT)
Message-ID: <6256f069-ee39-495e-a8c3-ea2328f085a2@gmail.com>
Date: Fri, 22 Sep 2023 11:53:34 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 6/9] gfxstream + rutabaga: add initial support for
 gfxstream
Content-Language: en-US
To: Gurchetan Singh <gurchetansingh@chromium.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: qemu-devel@nongnu.org, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 marcandre.lureau@redhat.com, ray.huang@amd.com, alex.bennee@linaro.org,
 shentey@gmail.com, hi@alyssa.is, ernunes@redhat.com,
 manos.pitsidianakis@linaro.org, philmd@linaro.org,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Antonio Caggiano <quic_acaggian@quicinc.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Robert Beckett <bob.beckett@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 xen-devel@lists.xenproject.org, Albert Esteve <aesteve@redhat.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>
References: <20230829003629.410-1-gurchetansingh@chromium.org>
 <20230829003629.410-7-gurchetansingh@chromium.org>
 <2620fca0-a5b4-49d0-bf91-fd359ee4999b@gmail.com>
 <3830bf8d-8c25-950c-f901-8d70dbfc06a6@ilande.co.uk>
 <CAAfnVBknhG=QYn=OFjNW9h=KbDtQ=xq3AEs5Pg=AG3LTO=LZ6w@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <CAAfnVBknhG=QYn=OFjNW9h=KbDtQ=xq3AEs5Pg=AG3LTO=LZ6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2023/09/22 9:03, Gurchetan Singh wrote:
> 
> 
> On Wed, Sep 20, 2023 at 5:05 AM Mark Cave-Ayland 
> <mark.cave-ayland@ilande.co.uk <mailto:mark.cave-ayland@ilande.co.uk>> 
> wrote:
> 
>     On 20/09/2023 12:42, Akihiko Odaki wrote:
> 
>      > On 2023/08/29 9:36, Gurchetan Singh wrote:
>      >> This adds initial support for gfxstream and cross-domain.  Both
>      >> features rely on virtio-gpu blob resources and context types, which
>      >> are also implemented in this patch.
>      >>
>      >> gfxstream has a long and illustrious history in Android graphics
>      >> paravirtualization.  It has been powering graphics in the Android
>      >> Studio Emulator for more than a decade, which is the main developer
>      >> platform.
>      >>
>      >> Originally conceived by Jesse Hall, it was first known as
>     "EmuGL" [a].
>      >> The key design characteristic was a 1:1 threading model and
>      >> auto-generation, which fit nicely with the OpenGLES spec.  It also
>      >> allowed easy layering with ANGLE on the host, which provides the
>     GLES
>      >> implementations on Windows or MacOS enviroments.
>      >>
>      >> gfxstream has traditionally been maintained by a single
>     engineer, and
>      >> between 2015 to 2021, the goldfish throne passed to Frank Yang.
>      >> Historians often remark this glorious reign ("pax gfxstreama" is the
>      >> academic term) was comparable to that of Augustus and both Queen
>      >> Elizabeths.  Just to name a few accomplishments in a resplendent
>      >> panoply: higher versions of GLES, address space graphics, snapshot
>      >> support and CTS compliant Vulkan [b].
>      >>
>      >> One major drawback was the use of out-of-tree goldfish drivers.
>      >> Android engineers didn't know much about DRM/KMS and especially
>     TTM so
>      >> a simple guest to host pipe was conceived.
>      >>
>      >> Luckily, virtio-gpu 3D started to emerge in 2016 due to the work of
>      >> the Mesa/virglrenderer communities.  In 2018, the initial virtio-gpu
>      >> port of gfxstream was done by Cuttlefish enthusiast Alistair Delva.
>      >> It was a symbol compatible replacement of virglrenderer [c] and
>     named
>      >> "AVDVirglrenderer".  This implementation forms the basis of the
>      >> current gfxstream host implementation still in use today.
>      >>
>      >> cross-domain support follows a similar arc.  Originally conceived by
>      >> Wayland aficionado David Reveman and crosvm enjoyer Zach Reizner in
>      >> 2018, it initially relied on the downstream "virtio-wl" device.
>      >>
>      >> In 2020 and 2021, virtio-gpu was extended to include blob resources
>      >> and multiple timelines by yours truly, features
>     gfxstream/cross-domain
>      >> both require to function correctly.
>      >>
>      >> Right now, we stand at the precipice of a truly fantastic
>     possibility:
>      >> the Android Emulator powered by upstream QEMU and upstream Linux
>      >> kernel.  gfxstream will then be packaged properfully, and app
>      >> developers can even fix gfxstream bugs on their own if they
>     encounter
>      >> them.
>      >>
>      >> It's been quite the ride, my friends.  Where will gfxstream head
>     next,
>      >> nobody really knows.  I wouldn't be surprised if it's around for
>      >> another decade, maintained by a new generation of Android graphics
>      >> enthusiasts.
>      >>
>      >> Technical details:
>      >>    - Very simple initial display integration: just used Pixman
>      >>    - Largely, 1:1 mapping of virtio-gpu hypercalls to rutabaga
>     function
>      >>      calls
>      >>
>      >> Next steps for Android VMs:
>      >>    - The next step would be improving display integration and UI
>     interfaces
>      >>      with the goal of the QEMU upstream graphics being in an
>     emulator
>      >>      release [d].
>      >>
>      >> Next steps for Linux VMs for display virtualization:
>      >>    - For widespread distribution, someone needs to package
>     Sommelier or the
>      >>      wayland-proxy-virtwl [e] ideally into Debian main. In
>     addition, newer
>      >>      versions of the Linux kernel come with DRM_VIRTIO_GPU_KMS
>     option,
>      >>      which allows disabling KMS hypercalls.  If anyone cares
>     enough, it'll
>      >>      probably be possible to build a custom VM variant that uses
>     this display
>      >>      virtualization strategy.
>      >>
>      >> [a]
>     https://android-review.googlesource.com/c/platform/development/+/34470 <https://android-review.googlesource.com/c/platform/development/+/34470>
>      >> [b]
>     https://android-review.googlesource.com/q/topic:%22vulkan-hostconnection-start%22 <https://android-review.googlesource.com/q/topic:%22vulkan-hostconnection-start%22>
>      >> [c]
>     https://android-review.googlesource.com/c/device/generic/goldfish-opengl/+/761927 <https://android-review.googlesource.com/c/device/generic/goldfish-opengl/+/761927>
>      >> [d] https://developer.android.com/studio/releases/emulator
>     <https://developer.android.com/studio/releases/emulator>
>      >> [e] https://github.com/talex5/wayland-proxy-virtwl
>     <https://github.com/talex5/wayland-proxy-virtwl>
>      >>
>      >> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org
>     <mailto:gurchetansingh@chromium.org>>
>      >> Tested-by: Alyssa Ross <hi@alyssa.is <mailto:hi@alyssa.is>>
>      >> Tested-by: Emmanouil Pitsidianakis
>     <manos.pitsidianakis@linaro.org <mailto:manos.pitsidianakis@linaro.org>>
>      >> Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com
>     <mailto:akihiko.odaki@daynix.com>>
>      >> Reviewed-by: Emmanouil Pitsidianakis
>     <manos.pitsidianakis@linaro.org <mailto:manos.pitsidianakis@linaro.org>>
>      >> Reviewed-by: Antonio Caggiano <quic_acaggian@quicinc.com
>     <mailto:quic_acaggian@quicinc.com>>
>      >> Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com
>     <mailto:akihiko.odaki@daynix.com>>
>      >> ---
>      >>   hw/display/virtio-gpu-pci-rutabaga.c |   47 ++
>      >>   hw/display/virtio-gpu-rutabaga.c     | 1119
>     ++++++++++++++++++++++++++
>      >>   hw/display/virtio-vga-rutabaga.c     |   50 ++
>      >>   3 files changed, 1216 insertions(+)
>      >>   create mode 100644 hw/display/virtio-gpu-pci-rutabaga.c
>      >>   create mode 100644 hw/display/virtio-gpu-rutabaga.c
>      >>   create mode 100644 hw/display/virtio-vga-rutabaga.c
>      >>
>      >> diff --git a/hw/display/virtio-gpu-pci-rutabaga.c
>      >> b/hw/display/virtio-gpu-pci-rutabaga.c
>      >> new file mode 100644
>      >> index 0000000000..c96729e198
>      >> --- /dev/null
>      >> +++ b/hw/display/virtio-gpu-pci-rutabaga.c
>      >> @@ -0,0 +1,47 @@
>      >> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>      >> +
>      >> +#include "qemu/osdep.h"
>      >> +#include "qapi/error.h"
>      >> +#include "qemu/module.h"
>      >> +#include "hw/pci/pci.h"
>      >> +#include "hw/qdev-properties.h"
>      >> +#include "hw/virtio/virtio.h"
>      >> +#include "hw/virtio/virtio-bus.h"
>      >> +#include "hw/virtio/virtio-gpu-pci.h"
>      >> +#include "qom/object.h"
>      >> +
>      >> +#define TYPE_VIRTIO_GPU_RUTABAGA_PCI "virtio-gpu-rutabaga-pci"
>      >> +OBJECT_DECLARE_SIMPLE_TYPE(VirtIOGPURutabagaPCI,
>     VIRTIO_GPU_RUTABAGA_PCI)
>      >> +
>      >> +struct VirtIOGPURutabagaPCI {
>      >> +    VirtIOGPUPCIBase parent_obj;
>      >> +
>      >> +    VirtIOGPURutabaga vdev;
>      >> +};
>      >> +
>      >> +static void virtio_gpu_rutabaga_initfn(Object *obj)
>      >> +{
>      >> +    VirtIOGPURutabagaPCI *dev = VIRTIO_GPU_RUTABAGA_PCI(obj);
>      >> +
>      >> +    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
>      >> +                                TYPE_VIRTIO_GPU_RUTABAGA);
>      >> +    VIRTIO_GPU_PCI_BASE(obj)->vgpu = VIRTIO_GPU_BASE(&dev->vdev);
>      >> +}
>      >> +
>      >> +static const TypeInfo virtio_gpu_rutabaga_pci_info[] = {
>      >> +    {
>      >> +        .name = TYPE_VIRTIO_GPU_RUTABAGA_PCI,
>      >> +        .parent = TYPE_VIRTIO_GPU_PCI_BASE,
>      >> +        .instance_size = sizeof(VirtIOGPURutabagaPCI),
>      >> +        .instance_init = virtio_gpu_rutabaga_initfn,
>      >> +        .interfaces = (InterfaceInfo[]) {
>      >> +            { INTERFACE_CONVENTIONAL_PCI_DEVICE },
>      >> +        }
>      >> +    },
>      >> +};
>      >> +
>      >> +DEFINE_TYPES(virtio_gpu_rutabaga_pci_info)
>      >> +
>      >> +module_obj(TYPE_VIRTIO_GPU_RUTABAGA_PCI);
>      >> +module_kconfig(VIRTIO_PCI);
>      >> +module_dep("hw-display-virtio-gpu-pci");
>      >> diff --git a/hw/display/virtio-gpu-rutabaga.c
>     b/hw/display/virtio-gpu-rutabaga.c
>      >> new file mode 100644
>      >> index 0000000000..a105e06214
>      >> --- /dev/null
>      >> +++ b/hw/display/virtio-gpu-rutabaga.c
>      >> @@ -0,0 +1,1119 @@
>      >> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>      >> +
>      >> +#include "qemu/osdep.h"
>      >> +#include "qapi/error.h"
>      >> +#include "qemu/error-report.h"
>      >> +#include "qemu/iov.h"
>      >> +#include "trace.h"
>      >> +#include "hw/virtio/virtio.h"
>      >> +#include "hw/virtio/virtio-gpu.h"
>      >> +#include "hw/virtio/virtio-gpu-pixman.h"
>      >> +#include "hw/virtio/virtio-iommu.h"
>      >> +
>      >> +#include <glib/gmem.h>
>      >> +#include <rutabaga_gfx/rutabaga_gfx_ffi.h>
>      >> +
>      >> +#define CHECK(condition,
>     cmd)                                                 \
>      >> +    do
>     {                                                                      \
>      >> +        if (!(condition))
>     {                                                   \
>      >> +            error_report("CHECK failed in %s() %s:" "%d",
>     __func__,           \
>      >> +                         __FILE__,
>     __LINE__);                                 \
>      >> +            (cmd)->error =
>     VIRTIO_GPU_RESP_ERR_UNSPEC;                        \
>      >> +           
>     return;                                                           \
>      >> +      
>     }                                                                      \
>      >> +    } while (0)
>      >> +
>      >> +/*
>      >> + * This is the size of the char array in struct sock_addr_un.
>     No Wayland socket
>      >> + * can be created with a path longer than this, including the
>     null terminator.
>      >> + */
>      >> +#define UNIX_PATH_MAX sizeof((struct sockaddr_un) {} .sun_path)
>      >> +
>      >> +struct rutabaga_aio_data {
>      >> +    struct VirtIOGPURutabaga *vr;
>      >> +    struct rutabaga_fence fence;
>      >> +};
>      >> +
>      >> +static void
>      >> +virtio_gpu_rutabaga_update_cursor(VirtIOGPU *g, struct
>     virtio_gpu_scanout *s,
>      >> +                                  uint32_t resource_id)
>      >> +{
>      >> +    struct virtio_gpu_simple_resource *res;
>      >> +    struct rutabaga_transfer transfer = { 0 };
>      >> +    struct iovec transfer_iovec;
>      >> +
>      >> +    VirtIOGPURutabaga *vr = VIRTIO_GPU_RUTABAGA(g);
>      >> +
>      >> +    res = virtio_gpu_find_resource(g, resource_id);
>      >> +    if (!res) {
>      >> +        return;
>      >> +    }
>      >> +
>      >> +    if (res->width != s->current_cursor->width ||
>      >> +        res->height != s->current_cursor->height) {
>      >> +        return;
>      >> +    }
>      >> +
>      >> +    transfer.x = 0;
>      >> +    transfer.y = 0;
>      >> +    transfer.z = 0;
>      >> +    transfer.w = res->width;
>      >> +    transfer.h = res->height;
>      >> +    transfer.d = 1;
>      >> +
>      >> +    transfer_iovec.iov_base = s->current_cursor->data;
>      >> +    transfer_iovec.iov_len = res->width * res->height * 4;
>      >> +
>      >> +    rutabaga_resource_transfer_read(vr->rutabaga, 0,
>      >> +                                    resource_id, &transfer,
>      >> +                                    &transfer_iovec);
>      >> +}
>      >> +
>      >> +static void
>      >> +virtio_gpu_rutabaga_gl_flushed(VirtIOGPUBase *b)
>      >> +{
>      >> +    VirtIOGPU *g = VIRTIO_GPU(b);
>      >> +    virtio_gpu_process_cmdq(g);
>      >> +}
>      >> +
>      >> +static void
>      >> +rutabaga_cmd_create_resource_2d(VirtIOGPU *g,
>      >> +                                struct virtio_gpu_ctrl_command
>     *cmd)
>      >> +{
>      >> +    int32_t result;
>      >> +    struct rutabaga_create_3d rc_3d = { 0 };
>      >> +    struct virtio_gpu_simple_resource *res;
>      >> +    struct virtio_gpu_resource_create_2d c2d;
>      >> +
>      >> +    VirtIOGPURutabaga *vr = VIRTIO_GPU_RUTABAGA(g);
>      >> +
>      >> +    VIRTIO_GPU_FILL_CMD(c2d);
>      >> +    trace_virtio_gpu_cmd_res_create_2d(c2d.resource_id, c2d.format,
>      >> +                                       c2d.width, c2d.height);
>      >> +
>      >> +    rc_3d.target = 2;
>      >> +    rc_3d.format = c2d.format;
>      >> +    rc_3d.bind = (1 << 1);
>      >> +    rc_3d.width = c2d.width;
>      >> +    rc_3d.height = c2d.height;
>      >> +    rc_3d.depth = 1;
>      >> +    rc_3d.array_size = 1;
>      >> +    rc_3d.last_level = 0;
>      >> +    rc_3d.nr_samples = 0;
>      >> +    rc_3d.flags = VIRTIO_GPU_RESOURCE_FLAG_Y_0_TOP;
>      >> +
>      >> +    result = rutabaga_resource_create_3d(vr->rutabaga,
>     c2d.resource_id, &rc_3d);
>      >> +    CHECK(!result, cmd);
>      >> +
>      >> +    res = g_new0(struct virtio_gpu_simple_resource, 1);
>      >> +    res->width = c2d.width;
>      >> +    res->height = c2d.height;
>      >> +    res->format = c2d.format;
>      >> +    res->resource_id = c2d.resource_id;
>      >> +
>      >> +    QTAILQ_INSERT_HEAD(&g->reslist, res, next);
>      >> +}
>      >> +
>      >> +static void
>      >> +rutabaga_cmd_create_resource_3d(VirtIOGPU *g,
>      >> +                                struct virtio_gpu_ctrl_command
>     *cmd)
>      >> +{
>      >> +    int32_t result;
>      >> +    struct rutabaga_create_3d rc_3d = { 0 };
>      >> +    struct virtio_gpu_simple_resource *res;
>      >> +    struct virtio_gpu_resource_create_3d c3d;
>      >> +
>      >> +    VirtIOGPURutabaga *vr = VIRTIO_GPU_RUTABAGA(g);
>      >> +
>      >> +    VIRTIO_GPU_FILL_CMD(c3d);
>      >> +
>      >> +    trace_virtio_gpu_cmd_res_create_3d(c3d.resource_id, c3d.format,
>      >> +                                       c3d.width, c3d.height,
>     c3d.depth);
>      >> +
>      >> +    rc_3d.target = c3d.target;
>      >> +    rc_3d.format = c3d.format;
>      >> +    rc_3d.bind = c3d.bind;
>      >> +    rc_3d.width = c3d.width;
>      >> +    rc_3d.height = c3d.height;
>      >> +    rc_3d.depth = c3d.depth;
>      >> +    rc_3d.array_size = c3d.array_size;
>      >> +    rc_3d.last_level = c3d.last_level;
>      >> +    rc_3d.nr_samples = c3d.nr_samples;
>      >> +    rc_3d.flags = c3d.flags;
>      >> +
>      >> +    result = rutabaga_resource_create_3d(vr->rutabaga,
>     c3d.resource_id, &rc_3d);
>      >> +    CHECK(!result, cmd);
>      >> +
>      >> +    res = g_new0(struct virtio_gpu_simple_resource, 1);
>      >> +    res->width = c3d.width;
>      >> +    res->height = c3d.height;
>      >> +    res->format = c3d.format;
>      >> +    res->resource_id = c3d.resource_id;
>      >> +
>      >> +    QTAILQ_INSERT_HEAD(&g->reslist, res, next);
>      >> +}
>      >> +
>      >> +static void
>      >> +rutabaga_cmd_resource_unref(VirtIOGPU *g,
>      >> +                            struct virtio_gpu_ctrl_command *cmd)
>      >> +{
>      >> +    int32_t result;
>      >> +    struct virtio_gpu_simple_resource *res;
>      >> +    struct virtio_gpu_resource_unref unref;
>      >> +
>      >> +    VirtIOGPURutabaga *vr = VIRTIO_GPU_RUTABAGA(g);
>      >> +
>      >> +    VIRTIO_GPU_FILL_CMD(unref);
>      >> +
>      >> +    trace_virtio_gpu_cmd_res_unref(unref.resource_id);
>      >> +
>      >> +    res = virtio_gpu_find_resource(g, unref.resource_id);
>      >> +    CHECK(res, cmd);
>      >> +
>      >> +    result = rutabaga_resource_unref(vr->rutabaga,
>     unref.resource_id);
>      >> +    CHECK(!result, cmd);
>      >> +
>      >> +    if (res->image) {
>      >> +        pixman_image_unref(res->image);
>      >> +    }
>      >> +
>      >> +    QTAILQ_REMOVE(&g->reslist, res, next);
>      >> +    g_free(res);
>      >> +}
>      >> +
>      >> +static void
>      >> +rutabaga_cmd_context_create(VirtIOGPU *g,
>      >> +                            struct virtio_gpu_ctrl_command *cmd)
>      >> +{
>      >> +    int32_t result;
>      >> +    struct virtio_gpu_ctx_create cc;
>      >> +
>      >> +    VirtIOGPURutabaga *vr = VIRTIO_GPU_RUTABAGA(g);
>      >> +
>      >> +    VIRTIO_GPU_FILL_CMD(cc);
>      >> +    trace_virtio_gpu_cmd_ctx_create(cc.hdr.ctx_id,
>      >> +                                    cc.debug_name);
>      >> +
>      >> +    result = rutabaga_context_create(vr->rutabaga, cc.hdr.ctx_id,
>      >> +                                     cc.context_init,
>     cc.debug_name, cc.nlen);
>      >> +    CHECK(!result, cmd);
>      >> +}
>      >> +
>      >> +static void
>      >> +rutabaga_cmd_context_destroy(VirtIOGPU *g,
>      >> +                             struct virtio_gpu_ctrl_command *cmd)
>      >> +{
>      >> +    int32_t result;
>      >> +    struct virtio_gpu_ctx_destroy cd;
>      >> +
>      >> +    VirtIOGPURutabaga *vr = VIRTIO_GPU_RUTABAGA(g);
>      >> +
>      >> +    VIRTIO_GPU_FILL_CMD(cd);
>      >> +    trace_virtio_gpu_cmd_ctx_destroy(cd.hdr.ctx_id);
>      >> +
>      >> +    result = rutabaga_context_destroy(vr->rutabaga, cd.hdr.ctx_id);
>      >> +    CHECK(!result, cmd);
>      >> +}
>      >> +
>      >> +static void
>      >> +rutabaga_cmd_resource_flush(VirtIOGPU *g, struct
>     virtio_gpu_ctrl_command *cmd)
>      >> +{
>      >> +    int32_t result, i;
>      >> +    struct virtio_gpu_scanout *scanout = NULL;
>      >> +    struct virtio_gpu_simple_resource *res;
>      >> +    struct rutabaga_transfer transfer = { 0 };
>      >> +    struct iovec transfer_iovec;
>      >> +    struct virtio_gpu_resource_flush rf;
>      >> +    bool found = false;
>      >> +
>      >> +    VirtIOGPUBase *vb = VIRTIO_GPU_BASE(g);
>      >> +    VirtIOGPURutabaga *vr = VIRTIO_GPU_RUTABAGA(g);
>      >> +    if (vr->headless) {
>      >> +        return;
>      >> +    }
>      >> +
>      >> +    VIRTIO_GPU_FILL_CMD(rf);
>      >> +    trace_virtio_gpu_cmd_res_flush(rf.resource_id,
>      >> +                                   rf.r.width, rf.r.height,
>     rf.r.x, rf.r.y);
>      >> +
>      >> +    res = virtio_gpu_find_resource(g, rf.resource_id);
>      >> +    CHECK(res, cmd);
>      >> +
>      >> +    for (i = 0; i < vb->conf.max_outputs; i++) {
>      >> +        scanout = &vb->scanout[i];
>      >> +        if (i == res->scanout_bitmask) {
>      >> +            found = true;
>      >> +            break;
>      >> +        }
>      >> +    }
>      >> +
>      >> +    if (!found) {
>      >> +        return;
>      >> +    }
>      >> +
>      >> +    transfer.x = 0;
>      >> +    transfer.y = 0;
>      >> +    transfer.z = 0;
>      >> +    transfer.w = res->width;
>      >> +    transfer.h = res->height;
>      >> +    transfer.d = 1;
>      >> +
>      >> +    transfer_iovec.iov_base = pixman_image_get_data(res->image);
>      >> +    transfer_iovec.iov_len = res->width * res->height * 4;
>      >> +
>      >> +    result = rutabaga_resource_transfer_read(vr->rutabaga, 0,
>      >> +                                             rf.resource_id,
>     &transfer,
>      >> +                                             &transfer_iovec);
>      >> +    CHECK(!result, cmd);
>      >> +    dpy_gfx_update_full(scanout->con);
>      >> +}
>      >> +
>      >> +static void
>      >> +rutabaga_cmd_set_scanout(VirtIOGPU *g, struct
>     virtio_gpu_ctrl_command *cmd)
>      >> +{
>      >> +    struct virtio_gpu_simple_resource *res;
>      >> +    struct virtio_gpu_scanout *scanout = NULL;
>      >> +    struct virtio_gpu_set_scanout ss;
>      >> +
>      >> +    VirtIOGPUBase *vb = VIRTIO_GPU_BASE(g);
>      >> +    VirtIOGPURutabaga *vr = VIRTIO_GPU_RUTABAGA(g);
>      >> +    if (vr->headless) {
>      >> +        return;
>      >> +    }
>      >> +
>      >> +    VIRTIO_GPU_FILL_CMD(ss);
>      >> +    trace_virtio_gpu_cmd_set_scanout(ss.scanout_id, ss.resource_id,
>      >> +                                     ss.r.width, ss.r.height,
>     ss.r.x, ss.r.y);
>      >> +
>      >> +    CHECK(ss.scanout_id < VIRTIO_GPU_MAX_SCANOUTS, cmd);
>      >> +    scanout = &vb->scanout[ss.scanout_id];
>      >> +
>      >> +    if (ss.resource_id == 0) {
>      >> +        dpy_gfx_replace_surface(scanout->con, NULL);
>      >> +        dpy_gl_scanout_disable(scanout->con);
>      >> +        return;
>      >> +    }
>      >> +
>      >> +    res = virtio_gpu_find_resource(g, ss.resource_id);
>      >> +    CHECK(res, cmd);
>      >> +
>      >> +    if (!res->image) {
>      >> +        pixman_format_code_t pformat;
>      >> +        pformat = virtio_gpu_get_pixman_format(res->format);
>      >> +        CHECK(pformat, cmd);
>      >> +
>      >> +        res->image = pixman_image_create_bits(pformat,
>      >> +                                              res->width,
>      >> +                                              res->height,
>      >> +                                              NULL, 0);
>      >> +        CHECK(res->image, cmd);
>      >> +        pixman_image_ref(res->image);
>      >> +    }
>      >> +
>      >> +    vb->enable = 1;
>      >> +
>      >> +    /* realloc the surface ptr */
>      >> +    scanout->ds = qemu_create_displaysurface_pixman(res->image);
>      >> +    dpy_gfx_replace_surface(scanout->con, NULL);
>      >> +    dpy_gfx_replace_surface(scanout->con, scanout->ds);
>      >> +    res->scanout_bitmask = ss.scanout_id;
>      >> +}
>      >> +
>      >> +static void
>      >> +rutabaga_cmd_submit_3d(VirtIOGPU *g,
>      >> +                       struct virtio_gpu_ctrl_command *cmd)
>      >> +{
>      >> +    int32_t result;
>      >> +    struct virtio_gpu_cmd_submit cs;
>      >> +    struct rutabaga_command rutabaga_cmd = { 0 };
>      >> +    g_autofree uint8_t *buf = NULL;
>      >> +    size_t s;
>      >> +
>      >> +    VirtIOGPURutabaga *vr = VIRTIO_GPU_RUTABAGA(g);
>      >> +
>      >> +    VIRTIO_GPU_FILL_CMD(cs);
>      >> +    trace_virtio_gpu_cmd_ctx_submit(cs.hdr.ctx_id, cs.size);
>      >> +
>      >> +    buf = g_new0(uint8_t, cs.size);
>      >> +    s = iov_to_buf(cmd->elem.out_sg, cmd->elem.out_num,
>      >> +                   sizeof(cs), buf, cs.size);
>      >> +    CHECK(s == cs.size, cmd);
>      >> +
>      >> +    rutabaga_cmd.ctx_id = cs.hdr.ctx_id;
>      >> +    rutabaga_cmd.cmd = buf;
>      >> +    rutabaga_cmd.cmd_size = cs.size;
>      >> +
>      >> +    result = rutabaga_submit_command(vr->rutabaga, &rutabaga_cmd);
>      >> +    CHECK(!result, cmd);
>      >> +}
>      >> +
>      >> +static void
>      >> +rutabaga_cmd_transfer_to_host_2d(VirtIOGPU *g,
>      >> +                                 struct virtio_gpu_ctrl_command
>     *cmd)
>      >> +{
>      >> +    int32_t result;
>      >> +    struct rutabaga_transfer transfer = { 0 };
>      >> +    struct virtio_gpu_transfer_to_host_2d t2d;
>      >> +
>      >> +    VirtIOGPURutabaga *vr = VIRTIO_GPU_RUTABAGA(g);
>      >> +
>      >> +    VIRTIO_GPU_FILL_CMD(t2d);
>      >> +    trace_virtio_gpu_cmd_res_xfer_toh_2d(t2d.resource_id);
>      >> +
>      >> +    transfer.x = t2d.r.x;
>      >> +    transfer.y = t2d.r.y;
>      >> +    transfer.z = 0;
>      >> +    transfer.w = t2d.r.width;
>      >> +    transfer.h = t2d.r.height;
>      >> +    transfer.d = 1;
>      >> +
>      >> +    result = rutabaga_resource_transfer_write(vr->rutabaga, 0,
>     t2d.resource_id,
>      >> +                                              &transfer);
>      >> +    CHECK(!result, cmd);
>      >> +}
>      >> +
>      >> +static void
>      >> +rutabaga_cmd_transfer_to_host_3d(VirtIOGPU *g,
>      >> +                                 struct virtio_gpu_ctrl_command
>     *cmd)
>      >> +{
>      >> +    int32_t result;
>      >> +    struct rutabaga_transfer transfer = { 0 };
>      >> +    struct virtio_gpu_transfer_host_3d t3d;
>      >> +
>      >> +    VirtIOGPURutabaga *vr = VIRTIO_GPU_RUTABAGA(g);
>      >> +
>      >> +    VIRTIO_GPU_FILL_CMD(t3d);
>      >> +    trace_virtio_gpu_cmd_res_xfer_toh_3d(t3d.resource_id);
>      >> +
>      >> +    transfer.x = t3d.box.x;
>      >> +    transfer.y = t3d.box.y;
>      >> +    transfer.z = t3d.box.z;
>      >> +    transfer.w = t3d.box.w;
>      >> +    transfer.h = t3d.box.h;
>      >> +    transfer.d = t3d.box.d;
>      >> +    transfer.level = t3d.level;
>      >> +    transfer.stride = t3d.stride;
>      >> +    transfer.layer_stride = t3d.layer_stride;
>      >> +    transfer.offset = t3d.offset;
>      >> +
>      >> +    result = rutabaga_resource_transfer_write(vr->rutabaga,
>     t3d.hdr.ctx_id,
>      >> +                                              t3d.resource_id,
>     &transfer);
>      >> +    CHECK(!result, cmd);
>      >> +}
>      >> +
>      >> +static void
>      >> +rutabaga_cmd_transfer_from_host_3d(VirtIOGPU *g,
>      >> +                                   struct
>     virtio_gpu_ctrl_command *cmd)
>      >> +{
>      >> +    int32_t result;
>      >> +    struct rutabaga_transfer transfer = { 0 };
>      >> +    struct virtio_gpu_transfer_host_3d t3d;
>      >> +
>      >> +    VirtIOGPURutabaga *vr = VIRTIO_GPU_RUTABAGA(g);
>      >> +
>      >> +    VIRTIO_GPU_FILL_CMD(t3d);
>      >> +    trace_virtio_gpu_cmd_res_xfer_fromh_3d(t3d.resource_id);
>      >> +
>      >> +    transfer.x = t3d.box.x;
>      >> +    transfer.y = t3d.box.y;
>      >> +    transfer.z = t3d.box.z;
>      >> +    transfer.w = t3d.box.w;
>      >> +    transfer.h = t3d.box.h;
>      >> +    transfer.d = t3d.box.d;
>      >> +    transfer.level = t3d.level;
>      >> +    transfer.stride = t3d.stride;
>      >> +    transfer.layer_stride = t3d.layer_stride;
>      >> +    transfer.offset = t3d.offset;
>      >> +
>      >> +    result = rutabaga_resource_transfer_read(vr->rutabaga,
>     t3d.hdr.ctx_id,
>      >> +                                             t3d.resource_id,
>     &transfer, NULL);
>      >> +    CHECK(!result, cmd);
>      >> +}
>      >> +
>      >> +static void
>      >> +rutabaga_cmd_attach_backing(VirtIOGPU *g, struct
>     virtio_gpu_ctrl_command *cmd)
>      >> +{
>      >> +    struct rutabaga_iovecs vecs = { 0 };
>      >> +    struct virtio_gpu_simple_resource *res;
>      >> +    struct virtio_gpu_resource_attach_backing att_rb;
>      >> +    int ret;
>      >> +
>      >> +    VirtIOGPURutabaga *vr = VIRTIO_GPU_RUTABAGA(g);
>      >> +
>      >> +    VIRTIO_GPU_FILL_CMD(att_rb);
>      >> +    trace_virtio_gpu_cmd_res_back_attach(att_rb.resource_id);
>      >> +
>      >> +    res = virtio_gpu_find_resource(g, att_rb.resource_id);
>      >> +    CHECK(res, cmd);
>      >> +    CHECK(!res->iov, cmd);
>      >> +
>      >> +    ret = virtio_gpu_create_mapping_iov(g, att_rb.nr_entries,
>     sizeof(att_rb),
>      >> +                                        cmd, NULL, &res->iov,
>     &res->iov_cnt);
>      >> +    CHECK(!ret, cmd);
>      >> +
>      >> +    vecs.iovecs = res->iov;
>      >> +    vecs.num_iovecs = res->iov_cnt;
>      >> +
>      >> +    ret = rutabaga_resource_attach_backing(vr->rutabaga,
>     att_rb.resource_id,
>      >> +                                           &vecs);
>      >> +    if (ret != 0) {
>      >> +        virtio_gpu_cleanup_mapping(g, res);
>      >> +    }
>      >> +
>      >> +    CHECK(!ret, cmd);
>      >> +}
>      >> +
>      >> +static void
>      >> +rutabaga_cmd_detach_backing(VirtIOGPU *g, struct
>     virtio_gpu_ctrl_command *cmd)
>      >> +{
>      >> +    struct virtio_gpu_simple_resource *res;
>      >> +    struct virtio_gpu_resource_detach_backing detach_rb;
>      >> +
>      >> +    VirtIOGPURutabaga *vr = VIRTIO_GPU_RUTABAGA(g);
>      >> +
>      >> +    VIRTIO_GPU_FILL_CMD(detach_rb);
>      >> +    trace_virtio_gpu_cmd_res_back_detach(detach_rb.resource_id);
>      >> +
>      >> +    res = virtio_gpu_find_resource(g, detach_rb.resource_id);
>      >> +    CHECK(res, cmd);
>      >> +
>      >> +    rutabaga_resource_detach_backing(vr->rutabaga,
>      >> +                                     detach_rb.resource_id);
>      >> +
>      >> +    virtio_gpu_cleanup_mapping(g, res);
>      >> +}
>      >> +
>      >> +static void
>      >> +rutabaga_cmd_ctx_attach_resource(VirtIOGPU *g,
>      >> +                                 struct virtio_gpu_ctrl_command
>     *cmd)
>      >> +{
>      >> +    int32_t result;
>      >> +    struct virtio_gpu_ctx_resource att_res;
>      >> +
>      >> +    VirtIOGPURutabaga *vr = VIRTIO_GPU_RUTABAGA(g);
>      >> +
>      >> +    VIRTIO_GPU_FILL_CMD(att_res);
>      >> +    trace_virtio_gpu_cmd_ctx_res_attach(att_res.hdr.ctx_id,
>      >> +                                        att_res.resource_id);
>      >> +
>      >> +    result = rutabaga_context_attach_resource(vr->rutabaga,
>     att_res.hdr.ctx_id,
>      >> +                                              att_res.resource_id);
>      >> +    CHECK(!result, cmd);
>      >> +}
>      >> +
>      >> +static void
>      >> +rutabaga_cmd_ctx_detach_resource(VirtIOGPU *g,
>      >> +                                 struct virtio_gpu_ctrl_command
>     *cmd)
>      >> +{
>      >> +    int32_t result;
>      >> +    struct virtio_gpu_ctx_resource det_res;
>      >> +
>      >> +    VirtIOGPURutabaga *vr = VIRTIO_GPU_RUTABAGA(g);
>      >> +
>      >> +    VIRTIO_GPU_FILL_CMD(det_res);
>      >> +    trace_virtio_gpu_cmd_ctx_res_detach(det_res.hdr.ctx_id,
>      >> +                                        det_res.resource_id);
>      >> +
>      >> +    result = rutabaga_context_detach_resource(vr->rutabaga,
>     det_res.hdr.ctx_id,
>      >> +                                              det_res.resource_id);
>      >> +    CHECK(!result, cmd);
>      >> +}
>      >> +
>      >> +static void
>      >> +rutabaga_cmd_get_capset_info(VirtIOGPU *g, struct
>     virtio_gpu_ctrl_command *cmd)
>      >> +{
>      >> +    int32_t result;
>      >> +    struct virtio_gpu_get_capset_info info;
>      >> +    struct virtio_gpu_resp_capset_info resp;
>      >> +
>      >> +    VirtIOGPURutabaga *vr = VIRTIO_GPU_RUTABAGA(g);
>      >> +
>      >> +    VIRTIO_GPU_FILL_CMD(info);
>      >> +
>      >> +    result = rutabaga_get_capset_info(vr->rutabaga,
>     info.capset_index,
>      >> +                                      &resp.capset_id,
>     &resp.capset_max_version,
>      >> +                                      &resp.capset_max_size);
>      >> +    CHECK(!result, cmd);
>      >> +
>      >> +    resp.hdr.type = VIRTIO_GPU_RESP_OK_CAPSET_INFO;
>      >> +    virtio_gpu_ctrl_response(g, cmd, &resp.hdr, sizeof(resp));
>      >> +}
>      >> +
>      >> +static void
>      >> +rutabaga_cmd_get_capset(VirtIOGPU *g, struct
>     virtio_gpu_ctrl_command *cmd)
>      >> +{
>      >> +    int32_t result;
>      >> +    struct virtio_gpu_get_capset gc;
>      >> +    struct virtio_gpu_resp_capset *resp;
>      >> +    uint32_t capset_size, capset_version;
>      >> +    uint32_t current_id, i;
>      >> +
>      >> +    VirtIOGPURutabaga *vr = VIRTIO_GPU_RUTABAGA(g);
>      >> +
>      >> +    VIRTIO_GPU_FILL_CMD(gc);
>      >> +    for (i = 0; i < vr->num_capsets; i++) {
>      >> +        result = rutabaga_get_capset_info(vr->rutabaga, i,
>      >> +                                          &current_id,
>     &capset_version,
>      >> +                                          &capset_size);
>      >> +        CHECK(!result, cmd);
>      >> +
>      >> +        if (current_id == gc.capset_id) {
>      >> +            break;
>      >> +        }
>      >> +    }
>      >> +
>      >> +    CHECK(i < vr->num_capsets, cmd);
>      >> +
>      >> +    resp = g_malloc0(sizeof(*resp) + capset_size);
>      >> +    resp->hdr.type = VIRTIO_GPU_RESP_OK_CAPSET;
>      >> +    rutabaga_get_capset(vr->rutabaga, gc.capset_id,
>     gc.capset_version,
>      >> +                        resp->capset_data, capset_size);
>      >> +
>      >> +    virtio_gpu_ctrl_response(g, cmd, &resp->hdr, sizeof(*resp)
>     + capset_size);
>      >> +    g_free(resp);
>      >> +}
>      >> +
>      >> +static void
>      >> +rutabaga_cmd_resource_create_blob(VirtIOGPU *g,
>      >> +                                  struct
>     virtio_gpu_ctrl_command *cmd)
>      >> +{
>      >> +    int result;
>      >> +    struct rutabaga_iovecs vecs = { 0 };
>      >> +    g_autofree struct virtio_gpu_simple_resource *res = NULL;
>      >> +    struct virtio_gpu_resource_create_blob cblob;
>      >> +    struct rutabaga_create_blob rc_blob = { 0 };
>      >> +
>      >> +    VirtIOGPURutabaga *vr = VIRTIO_GPU_RUTABAGA(g);
>      >> +
>      >> +    VIRTIO_GPU_FILL_CMD(cblob);
>      >> +    trace_virtio_gpu_cmd_res_create_blob(cblob.resource_id,
>     cblob.size);
>      >> +
>      >> +    CHECK(cblob.resource_id != 0, cmd);
>      >> +
>      >> +    res = g_new0(struct virtio_gpu_simple_resource, 1);
>      >> +
>      >> +    res->resource_id = cblob.resource_id;
>      >> +    res->blob_size = cblob.size;
>      >> +
>      >> +    if (cblob.blob_mem != VIRTIO_GPU_BLOB_MEM_HOST3D) {
>      >> +        result = virtio_gpu_create_mapping_iov(g, cblob.nr_entries,
>      >> +                                               sizeof(cblob),
>     cmd, &res->addrs,
>      >> +                                               &res->iov,
>     &res->iov_cnt);
>      >> +        CHECK(!result, cmd);
>      >> +    }
>      >> +
>      >> +    rc_blob.blob_id = cblob.blob_id;
>      >> +    rc_blob.blob_mem = cblob.blob_mem;
>      >> +    rc_blob.blob_flags = cblob.blob_flags;
>      >> +    rc_blob.size = cblob.size;
>      >> +
>      >> +    vecs.iovecs = res->iov;
>      >> +    vecs.num_iovecs = res->iov_cnt;
>      >> +
>      >> +    result = rutabaga_resource_create_blob(vr->rutabaga,
>     cblob.hdr.ctx_id,
>      >> +                                           cblob.resource_id,
>     &rc_blob, &vecs,
>      >> +                                           NULL);
>      >> +
>      >> +    if (result && cblob.blob_mem != VIRTIO_GPU_BLOB_MEM_HOST3D) {
>      >> +        virtio_gpu_cleanup_mapping(g, res);
>      >> +    }
>      >> +
>      >> +    CHECK(!result, cmd);
>      >> +
>      >> +    QTAILQ_INSERT_HEAD(&g->reslist, res, next);
>      >> +    res = NULL;
>      >> +}
>      >> +
>      >> +static void
>      >> +rutabaga_cmd_resource_map_blob(VirtIOGPU *g,
>      >> +                               struct virtio_gpu_ctrl_command *cmd)
>      >> +{
>      >> +    int32_t result;
>      >> +    uint32_t map_info = 0;
>      >> +    uint32_t slot = 0;
>      >> +    struct virtio_gpu_simple_resource *res;
>      >> +    struct rutabaga_mapping mapping = { 0 };
>      >> +    struct virtio_gpu_resource_map_blob mblob;
>      >> +    struct virtio_gpu_resp_map_info resp = { 0 };
>      >> +
>      >> +    VirtIOGPUBase *vb = VIRTIO_GPU_BASE(g);
>      >> +    VirtIOGPURutabaga *vr = VIRTIO_GPU_RUTABAGA(g);
>      >> +
>      >> +    VIRTIO_GPU_FILL_CMD(mblob);
>      >> +
>      >> +    CHECK(mblob.resource_id != 0, cmd);
>      >> +
>      >> +    res = virtio_gpu_find_resource(g, mblob.resource_id);
>      >> +    CHECK(res, cmd);
>      >> +
>      >> +    result = rutabaga_resource_map_info(vr->rutabaga,
>     mblob.resource_id,
>      >> +                                        &map_info);
>      >> +    CHECK(!result, cmd);
>      >> +
>      >> +    /*
>      >> +     * RUTABAGA_MAP_ACCESS_* flags are not part of the
>     virtio-gpu spec, but do
>      >> +     * exist to potentially allow the hypervisor to restrict
>     write access to
>      >> +     * memory. QEMU does not need to use this functionality at
>     the moment.
>      >> +     */
>      >> +    resp.map_info = map_info & RUTABAGA_MAP_CACHE_MASK;
>      >> +
>      >> +    result = rutabaga_resource_map(vr->rutabaga,
>     mblob.resource_id, &mapping);
>      >> +    CHECK(!result, cmd);
>      >> +
>      >> +    for (slot = 0; slot < MAX_SLOTS; slot++) {
>      >> +        if (vr->memory_regions[slot].used) {
>      >> +            continue;
>      >> +        }
>      >> +
>      >> +        MemoryRegion *mr = &(vr->memory_regions[slot].mr);
>      >> +        memory_region_init_ram_ptr(mr, OBJECT(vr), "blob",
>     mapping.size,
>      >> +                                   mapping.ptr);
>      >> +        memory_region_add_subregion(&vb->hostmem, mblob.offset,
>     mr);
>      >> +        vr->memory_regions[slot].resource_id = mblob.resource_id;
>      >> +        vr->memory_regions[slot].used = 1;
>      >> +        break;
>      >> +    }
>      >> +
>      >> +    if (slot >= MAX_SLOTS) {
>      >> +        result = rutabaga_resource_unmap(vr->rutabaga,
>     mblob.resource_id);
>      >> +        CHECK(!result, cmd);
>      >> +    }
>      >> +
>      >> +    CHECK(slot < MAX_SLOTS, cmd);
>      >> +
>      >> +    resp.hdr.type = VIRTIO_GPU_RESP_OK_MAP_INFO;
>      >> +    virtio_gpu_ctrl_response(g, cmd, &resp.hdr, sizeof(resp));
>      >> +}
>      >> +
>      >> +static void
>      >> +rutabaga_cmd_resource_unmap_blob(VirtIOGPU *g,
>      >> +                                 struct virtio_gpu_ctrl_command
>     *cmd)
>      >> +{
>      >> +    int32_t result;
>      >> +    uint32_t slot = 0;
>      >> +    struct virtio_gpu_simple_resource *res;
>      >> +    struct virtio_gpu_resource_unmap_blob ublob;
>      >> +
>      >> +    VirtIOGPUBase *vb = VIRTIO_GPU_BASE(g);
>      >> +    VirtIOGPURutabaga *vr = VIRTIO_GPU_RUTABAGA(g);
>      >> +
>      >> +    VIRTIO_GPU_FILL_CMD(ublob);
>      >> +
>      >> +    CHECK(ublob.resource_id != 0, cmd);
>      >> +
>      >> +    res = virtio_gpu_find_resource(g, ublob.resource_id);
>      >> +    CHECK(res, cmd);
>      >> +
>      >> +    for (slot = 0; slot < MAX_SLOTS; slot++) {
>      >> +        if (vr->memory_regions[slot].resource_id !=
>     ublob.resource_id) {
>      >> +            continue;
>      >> +        }
>      >> +
>      >> +        MemoryRegion *mr = &(vr->memory_regions[slot].mr);
>      >> +        memory_region_del_subregion(&vb->hostmem, mr);
>      >> +
>      >> +        vr->memory_regions[slot].resource_id = 0;
>      >> +        vr->memory_regions[slot].used = 0;
>      >> +        break;
>      >> +    }
>      >> +
>      >> +    CHECK(slot < MAX_SLOTS, cmd);
>      >> +    result = rutabaga_resource_unmap(vr->rutabaga,
>     res->resource_id);
>      >
>      > Hi,
>      >
>      > After the discussion with Xenia Ragiadakou regarding their patch
>     for Venus, I found a
>      > bug present in the Venus implementation also affects Rutabaga.
>      >
>      > The problem is that the memory region may not immediately go away
>     with
>      > memory_region_del_subregion(), but it may be kept a bit after
>     that. The memory region
>      > has a pointer to the mapped memory so the unmapping call that
>     immediately follows
>      > will make it dangling.
>      >
>      > Xenia raised a question whether the dangling pointer can be
>     actually dereferenced and
>      > result in use-after-free, but the answer is unfortunately yes.
>     For example, consider
>      > the following call chain:
>      > kvm_cpu_exec -> address_space_rw -> address_space_write ->
>     flatview_write ->
>      > flatview_write_continue
>      >
>      > address_space_write() holds a RCU read lock so that the flatview
>     it refers to will
>      > not go away during the operation even if it becomes obsolete and
>     will be used for
>      > writes. It is possible that the obsolete flatview contains the
>     memory region for the
>      > memory that is concurrently unmapped by
>     virtio-gpu-rutabaga/virgl.  Note that the
>      > function can be called without holding BQL, and KVM actually does so.
>      >
>      > Another case is address_space_map(). It acquires the reference to
>     the memory with
>      > memory_region_ref() and expects it will be available until
>     memory_region_unref() gets
>      > called with address_space_unmap().
> 
> 
> Yeah, I did notice weird behavior around map/unmap when initially 
> testing the series:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg03378.html 
> <https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg03378.html>
> 
> The solution I did was just do what the Android Emulator (which uses 
> QEMU2.12) has been doing for years.  Not call "obj_unparent(g)" and keep 
> a table of memory regions for initialization.  It does pass all 
> ./deqp-vk memory tests and is sufficient to run Android on a Vulkan-only 
> stack.  I think the way blob resources are handled in the guest some of 
> the cases you've cited may not be hit practice.  The biggest bug on 
> Linux we do hit is a KVM bug but hopefully that should be fixed soon:
> 
> https://lore.kernel.org/kvmarm/20230911021637.1941096-1-stevensd@google.com/T/#m7c23c97b56378e3e865057140be54fa3dd87154e <https://lore.kernel.org/kvmarm/20230911021637.1941096-1-stevensd@google.com/T/#m7c23c97b56378e3e865057140be54fa3dd87154e>
> 
> We hit interesting issues on MacOS on the gitlab issue and I do think a 
> follow-up memory-only series may be warranted in the future.
> 
> https://gitlab.com/qemu-project/qemu/-/issues/1611 
> <https://gitlab.com/qemu-project/qemu/-/issues/1611>
> 
> Since the Android Emulator has been running the solution in the 
> rutabaga/gfxstream series for years, it should be good for our purposes 
> on Linux for now.  WDYT?

Practically there is very low chance to hit the bug. I think only 
fuzzers and malicious actors will trigger it, and probably no one will 
dare using virtio-gpu-rutabaga or virtio-gpu-gl in a security-sensitive 
context.

That said, we know there is a bug so why don't you fix it? Otherwise you 
may document the bug, but getting it fixed is better.

Regards,
Akihiko Odaki

