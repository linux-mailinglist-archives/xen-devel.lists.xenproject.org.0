Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57793828A70
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 17:50:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664798.1034916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNFIs-0004OP-9Z; Tue, 09 Jan 2024 16:50:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664798.1034916; Tue, 09 Jan 2024 16:50:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNFIs-0004Ld-6H; Tue, 09 Jan 2024 16:50:14 +0000
Received: by outflank-mailman (input) for mailman id 664798;
 Tue, 09 Jan 2024 16:50:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7UFC=IT=damsy.net=pierre-eric@srs-se1.protection.inumbo.net>)
 id 1rNFIq-0004I1-DO
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 16:50:13 +0000
Received: from mail.damsy.net (mail.damsy.net [85.90.245.9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25b5bf21-af0f-11ee-9b0f-b553b5be7939;
 Tue, 09 Jan 2024 17:50:09 +0100 (CET)
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
X-Inumbo-ID: 25b5bf21-af0f-11ee-9b0f-b553b5be7939
Message-ID: <ccc34ce0-44af-425e-8634-6f7a0583ee12@damsy.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=damsy.net; s=201803;
	t=1704819007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cmTqXjQE9oi8D1S4ju4PPUhrFm+c3g32Xgd7HRMxqhc=;
	b=tiN/sfBdf4M7vCNJgv2G6++I/3fx7ZWcDOdGKbRaf7v52r68W290yUL78WKbMBjhEToFcc
	yG0ZIIKtbhu/YT0cfX2qBS+nbJ7YllFTXYXoZnyJ90zd0n+a14fUNtM+lAnutBQ7gsvSeg
	fOrtVBQrNs+vAdZ5OnG1dS6aBIxQi9xqV6Qut1xhme6bRYQW6B3f1ONBzxcVrqcJ30LxVY
	Y9BPXL4/gHaq8UuPK1rY7bpAR1Cc9b7VynBP2leczArWykzoxuC+k3nMAfMiaBfUptxIFJ
	0B2H7MmmXpHGioS13IuNz4vqb+nFUZPfmtl6PCGOwHw9el6eJ/+14jiTYVaXCw==
Date: Tue, 9 Jan 2024 17:50:06 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v6 07/11] virtio-gpu: Handle resource blob commands
Content-Language: fr
To: Huang Rui <ray.huang@amd.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Antonio Caggiano <quic_acaggian@quicinc.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Robert Beckett <bob.beckett@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
 Gurchetan Singh <gurchetansingh@chromium.org>, ernunes@redhat.com,
 Alyssa Ross <hi@alyssa.is>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Alex Deucher <alexander.deucher@amd.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>,
 Antonio Caggiano <antonio.caggiano@collabora.com>
References: <20231219075320.165227-1-ray.huang@amd.com>
 <20231219075320.165227-8-ray.huang@amd.com>
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <20231219075320.165227-8-ray.huang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 19/12/2023 à 08:53, Huang Rui a écrit :
> From: Antonio Caggiano <antonio.caggiano@collabora.com>
> 
> Support BLOB resources creation, mapping and unmapping by calling the
> new stable virglrenderer 0.10 interface. Only enabled when available and
> via the blob config. E.g. -device virtio-vga-gl,blob=true
> 
> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> ---
> 
> Changes in v6:
> - Use new struct virgl_gpu_resource.
> - Unmap, unref and destroy the resource only after the memory region
>    has been completely removed.
> - In unref check whether the resource is still mapped.
> - In unmap_blob check whether the resource has been already unmapped.
> - Fix coding style
> 
>   hw/display/virtio-gpu-virgl.c | 274 +++++++++++++++++++++++++++++++++-
>   hw/display/virtio-gpu.c       |   4 +-
>   meson.build                   |   4 +
>   3 files changed, 276 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> index faab374336..5a3a292f79 100644
> --- a/hw/display/virtio-gpu-virgl.c
> +++ b/hw/display/virtio-gpu-virgl.c
> @@ -17,6 +17,7 @@
>   #include "trace.h"
>   #include "hw/virtio/virtio.h"
>   #include "hw/virtio/virtio-gpu.h"
> +#include "hw/virtio/virtio-gpu-bswap.h"
>   
>   #include "ui/egl-helpers.h"
>   
> @@ -24,8 +25,62 @@
>   
>   struct virgl_gpu_resource {
>       struct virtio_gpu_simple_resource res;
> +    uint32_t ref;
> +    VirtIOGPU *g;
> +
> +#ifdef HAVE_VIRGL_RESOURCE_BLOB
> +    /* only blob resource needs this region to be mapped as guest mmio */
> +    MemoryRegion *region;
> +#endif
>   };
>   
> +static void vres_get_ref(struct virgl_gpu_resource *vres)
> +{
> +    uint32_t ref;
> +
> +    ref = qatomic_fetch_inc(&vres->ref);
> +    g_assert(ref < INT_MAX);
> +}
> +
> +static void virgl_resource_destroy(struct virgl_gpu_resource *vres)
> +{
> +    struct virtio_gpu_simple_resource *res;
> +    VirtIOGPU *g;
> +
> +    if (!vres) {
> +        return;
> +    }
> +
> +    g = vres->g;
> +    res = &vres->res;
> +    QTAILQ_REMOVE(&g->reslist, res, next);
> +    virtio_gpu_cleanup_mapping(g, res);
> +    g_free(vres);
> +}
> +
> +static void virgl_resource_unref(struct virgl_gpu_resource *vres)
> +{
> +    struct virtio_gpu_simple_resource *res;
> +
> +    if (!vres) {
> +        return;
> +    }
> +
> +    res = &vres->res;
> +    virgl_renderer_resource_detach_iov(res->resource_id, NULL, NULL);
> +    virgl_renderer_resource_unref(res->resource_id);
> +}
> +
> +static void vres_put_ref(struct virgl_gpu_resource *vres)
> +{
> +    g_assert(vres->ref > 0);
> +
> +    if (qatomic_fetch_dec(&vres->ref) == 1) {
> +        virgl_resource_unref(vres);
> +        virgl_resource_destroy(vres);
> +    }
> +}
> +
>   static struct virgl_gpu_resource *
>   virgl_gpu_find_resource(VirtIOGPU *g, uint32_t resource_id)
>   {
> @@ -59,6 +114,8 @@ static void virgl_cmd_create_resource_2d(VirtIOGPU *g,
>                                          c2d.width, c2d.height);
>   
>       vres = g_new0(struct virgl_gpu_resource, 1);
> +    vres_get_ref(vres);
> +    vres->g = g;
>       vres->res.width = c2d.width;
>       vres->res.height = c2d.height;
>       vres->res.format = c2d.format;
> @@ -91,6 +148,8 @@ static void virgl_cmd_create_resource_3d(VirtIOGPU *g,
>                                          c3d.width, c3d.height, c3d.depth);
>   
>       vres = g_new0(struct virgl_gpu_resource, 1);
> +    vres_get_ref(vres);
> +    vres->g = g;
>       vres->res.width = c3d.width;
>       vres->res.height = c3d.height;
>       vres->res.format = c3d.format;
> @@ -126,12 +185,21 @@ static void virgl_cmd_resource_unref(VirtIOGPU *g,
>           return;
>       }
>   
> -    virgl_renderer_resource_detach_iov(unref.resource_id, NULL, NULL);
> -    virgl_renderer_resource_unref(unref.resource_id);
> +#ifdef HAVE_VIRGL_RESOURCE_BLOB
> +    if (vres->region) {
> +        VirtIOGPUBase *b = VIRTIO_GPU_BASE(g);
> +        MemoryRegion *mr = vres->region;
> +
> +        warn_report("%s: blob resource %d not unmapped",
> +                    __func__, unref.resource_id);
> +        vres->region = NULL;

Shouldn't there be a call to memory_region_unref(mr)?

> +        memory_region_set_enabled(mr, false);
> +        memory_region_del_subregion(&b->hostmem, mr);
> +        object_unparent(OBJECT(mr));
> +    }
> +#endif /* HAVE_VIRGL_RESOURCE_BLOB */
>   
> -    QTAILQ_REMOVE(&g->reslist, &vres->res, next);
> -    virtio_gpu_cleanup_mapping(g, &vres->res);
> -    g_free(vres);
> +    vres_put_ref(vres);
>   }
>   
>   static void virgl_cmd_context_create(VirtIOGPU *g,
> @@ -470,6 +538,191 @@ static void virgl_cmd_get_capset(VirtIOGPU *g,
>       g_free(resp);
>   }
>   
> +#ifdef HAVE_VIRGL_RESOURCE_BLOB
> +
> +static void virgl_resource_unmap(struct virgl_gpu_resource *vres)
> +{
> +    if (!vres) {
> +        return;
> +    }
> +
> +    virgl_renderer_resource_unmap(vres->res.resource_id);
> +
> +    vres_put_ref(vres);
> +}
> +
> +static void virgl_resource_blob_async_unmap(void *obj)
> +{
> +    MemoryRegion *mr = MEMORY_REGION(obj);
> +    struct virgl_gpu_resource *vres = mr->opaque;
> +
> +    virgl_resource_unmap(vres);
> +
> +    g_free(obj);
> +}
> +
> +static void virgl_cmd_resource_create_blob(VirtIOGPU *g,
> +                                           struct virtio_gpu_ctrl_command *cmd)
> +{
> +    struct virgl_gpu_resource *vres;
> +    struct virtio_gpu_resource_create_blob cblob;
> +    struct virgl_renderer_resource_create_blob_args virgl_args = { 0 };
> +    int ret;
> +
> +    VIRTIO_GPU_FILL_CMD(cblob);
> +    virtio_gpu_create_blob_bswap(&cblob);
> +    trace_virtio_gpu_cmd_res_create_blob(cblob.resource_id, cblob.size);
> +
> +    if (cblob.resource_id == 0) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource id 0 is not allowed\n",
> +                      __func__);
> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +        return;
> +    }
> +
> +    vres = virgl_gpu_find_resource(g, cblob.resource_id);
> +    if (vres) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already exists %d\n",
> +                      __func__, cblob.resource_id);
> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +        return;
> +    }
> +
> +    vres = g_new0(struct virgl_gpu_resource, 1);
> +    vres_get_ref(vres);
> +    vres->g = g;
> +    vres->res.resource_id = cblob.resource_id;
> +    vres->res.blob_size = cblob.size;
> +
> +    if (cblob.blob_mem != VIRTIO_GPU_BLOB_MEM_HOST3D) {
> +        ret = virtio_gpu_create_mapping_iov(g, cblob.nr_entries, sizeof(cblob),
> +                                            cmd, &vres->res.addrs,
> +                                            &vres->res.iov, &vres->res.iov_cnt);
> +        if (!ret) {
> +            g_free(vres);
> +            cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
> +            return;
> +        }
> +    }
> +
> +    QTAILQ_INSERT_HEAD(&g->reslist, &vres->res, next);
> +
> +    virgl_args.res_handle = cblob.resource_id;
> +    virgl_args.ctx_id = cblob.hdr.ctx_id;
> +    virgl_args.blob_mem = cblob.blob_mem;
> +    virgl_args.blob_id = cblob.blob_id;
> +    virgl_args.blob_flags = cblob.blob_flags;
> +    virgl_args.size = cblob.size;
> +    virgl_args.iovecs = vres->res.iov;
> +    virgl_args.num_iovs = vres->res.iov_cnt;
> +
> +    ret = virgl_renderer_resource_create_blob(&virgl_args);
> +    if (ret) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: virgl blob create error: %s\n",
> +                      __func__, strerror(-ret));
> +        cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
> +    }
> +}
> +
> +static void virgl_cmd_resource_map_blob(VirtIOGPU *g,
> +                                        struct virtio_gpu_ctrl_command *cmd)
> +{
> +    struct virgl_gpu_resource *vres;
> +    struct virtio_gpu_resource_map_blob mblob;
> +    int ret;
> +    void *data;
> +    uint64_t size;
> +    struct virtio_gpu_resp_map_info resp;
> +    VirtIOGPUBase *b = VIRTIO_GPU_BASE(g);
> +
> +    VIRTIO_GPU_FILL_CMD(mblob);
> +    virtio_gpu_map_blob_bswap(&mblob);
> +
> +    if (mblob.resource_id == 0) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource id 0 is not allowed\n",
> +                      __func__);
> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +        return;
> +    }
> +
> +    vres = virgl_gpu_find_resource(g, mblob.resource_id);
> +    if (!vres) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource does not exist %d\n",
> +                      __func__, mblob.resource_id);
> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +        return;
> +    }
> +    if (vres->region) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already mapped %d\n",
> +                      __func__, mblob.resource_id);
> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +        return;
> +    }
> +
> +    ret = virgl_renderer_resource_map(vres->res.resource_id, &data, &size);
> +    if (ret) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource map error: %s\n",
> +                      __func__, strerror(-ret));
> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +        return;
> +    }
> +
> +    vres_get_ref(vres);

Why is this needed? And if it is, shouldn't virgl_cmd_resource_unmap_blob
call "vres_put_ref(vres)" ?

> +    vres->region = g_new0(MemoryRegion, 1);
> +    memory_region_init_ram_ptr(vres->region, OBJECT(g), NULL, size, data);
> +    vres->region->opaque = vres;
> +    OBJECT(vres->region)->free = virgl_resource_blob_async_unmap;
> +    memory_region_add_subregion(&b->hostmem, mblob.offset, vres->region);
> +    memory_region_set_enabled(vres->region, true);
> +
> +    memset(&resp, 0, sizeof(resp));
> +    resp.hdr.type = VIRTIO_GPU_RESP_OK_MAP_INFO;
> +    virgl_renderer_resource_get_map_info(mblob.resource_id, &resp.map_info);
> +    virtio_gpu_ctrl_response(g, cmd, &resp.hdr, sizeof(resp));
> +}
> +
> +static void virgl_cmd_resource_unmap_blob(VirtIOGPU *g,
> +                                          struct virtio_gpu_ctrl_command *cmd)
> +{
> +    struct virgl_gpu_resource *vres;
> +    struct virtio_gpu_resource_unmap_blob ublob;
> +    VirtIOGPUBase *b = VIRTIO_GPU_BASE(g);
> +    MemoryRegion *mr;
> +
> +    VIRTIO_GPU_FILL_CMD(ublob);
> +    virtio_gpu_unmap_blob_bswap(&ublob);
> +
> +    if (ublob.resource_id == 0) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource id 0 is not allowed\n",
> +                      __func__);
> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +        return;
> +    }
> +
> +    vres = virgl_gpu_find_resource(g, ublob.resource_id);
> +    if (!vres) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource does not exist %d\n",
> +                      __func__, ublob.resource_id);
> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +        return;
> +    }
> +
> +    if (!vres->region) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already unmapped %d\n",
> +                      __func__, ublob.resource_id);
> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +        return;
> +    }
> +
> +    mr = vres->region;
> +    vres->region = NULL;

memory_region_unref(mr)?

Note that AFAICT without the added memory_region_unref() calls virgl_resource_unmap()
was never called.

Regards,
Pierre-Eric

> +    memory_region_set_enabled(mr, false);
> +    memory_region_del_subregion(&b->hostmem, mr);
> +    object_unparent(OBJECT(mr));
> +}
> +
> +#endif /* HAVE_VIRGL_RESOURCE_BLOB */
> +
>   void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
>                                         struct virtio_gpu_ctrl_command *cmd)
>   {
> @@ -536,6 +789,17 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
>       case VIRTIO_GPU_CMD_GET_EDID:
>           virtio_gpu_get_edid(g, cmd);
>           break;
> +#ifdef HAVE_VIRGL_RESOURCE_BLOB
> +    case VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB:
> +        virgl_cmd_resource_create_blob(g, cmd);
> +        break;
> +    case VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB:
> +        virgl_cmd_resource_map_blob(g, cmd);
> +        break;
> +    case VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB:
> +        virgl_cmd_resource_unmap_blob(g, cmd);
> +        break;
> +#endif /* HAVE_VIRGL_RESOURCE_BLOB */
>       default:
>           cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
>           break;
> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> index 4c3ec9d0ea..8189c392dc 100644
> --- a/hw/display/virtio-gpu.c
> +++ b/hw/display/virtio-gpu.c
> @@ -1449,10 +1449,12 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
>               return;
>           }
>   
> +#ifndef HAVE_VIRGL_RESOURCE_BLOB
>           if (virtio_gpu_virgl_enabled(g->parent_obj.conf)) {
> -            error_setg(errp, "blobs and virgl are not compatible (yet)");
> +            error_setg(errp, "Linked virglrenderer does not support blob resources");
>               return;
>           }
> +#endif
>       }
>   
>       if (!virtio_gpu_base_device_realize(qdev,
> diff --git a/meson.build b/meson.build
> index ea52ef1b9c..629407128e 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1054,6 +1054,10 @@ if not get_option('virglrenderer').auto() or have_system or have_vhost_user_gpu
>                            cc.has_function('virgl_renderer_context_create_with_flags',
>                                            prefix: '#include <virglrenderer.h>',
>                                            dependencies: virgl))
> +    config_host_data.set('HAVE_VIRGL_RESOURCE_BLOB',
> +                         cc.has_function('virgl_renderer_resource_create_blob',
> +                                         prefix: '#include <virglrenderer.h>',
> +                                         dependencies: virgl))
>     endif
>   endif
>   rutabaga = not_found

