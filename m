Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5F07A2336
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 18:05:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603295.940246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhBIz-0005GA-PM; Fri, 15 Sep 2023 16:04:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603295.940246; Fri, 15 Sep 2023 16:04:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhBIz-0005Cm-L4; Fri, 15 Sep 2023 16:04:29 +0000
Received: by outflank-mailman (input) for mailman id 603295;
 Fri, 15 Sep 2023 16:04:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cweo=E7=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1qhBIy-0005Cg-B5
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 16:04:28 +0000
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [2607:f8b0:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a2bfbb4-53e1-11ee-9b0d-b553b5be7939;
 Fri, 15 Sep 2023 18:04:25 +0200 (CEST)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-68fe39555a0so2082540b3a.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Sep 2023 09:04:25 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 a26-20020aa780da000000b0068ff267f094sm3150033pfn.158.2023.09.15.09.04.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Sep 2023 09:04:23 -0700 (PDT)
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
X-Inumbo-ID: 8a2bfbb4-53e1-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1694793864; x=1695398664; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7xjJ3MhLzFB/78TdP6TmU291XQqb5tjT3DKBrgO8H54=;
        b=Cdq6/e1ax/hxSjd1FCe/ao9YJvKhErrmc6AMwWgF0a5TBAN2JQScXRcb1UBTMh/8OU
         E3e1YmZoPGTXYf/hC0OMxi2r1vyoALUHME/VjJ7XHXJLN6B4J4SPCPTmd6l/ZHJMcY5f
         kMWv3qB870WJV+9YN1N4/oJGQimhYJVGQNetTyzQ/fHK9N6kqPBE2oepFt3mVeLIXsXj
         KO9Izo0jPUBXhC4tQk1LRNMcO/81aNlXVd95QQ0CVk/FqePSv9/I4Jf8E1RAcLkRbxVg
         K9uUHlXNSsq7bpC/rBGKOsMoC76hDtGun4yMdThIrxce7X6b8ZbqXnJG8FbolnTfn1hP
         Q68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694793864; x=1695398664;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7xjJ3MhLzFB/78TdP6TmU291XQqb5tjT3DKBrgO8H54=;
        b=kneoeOi4AxxtZgTcoAZgLStWrKPE8werhr7u9vMBtXgbGiAPaRKDz8QcTSPnImEiX7
         8sdIWt6YXpzJG7tcAeQRKxezf5mZytJwhREzNULHG+ReWdVimGLh7ghh6Z9LDyeiFOAE
         8q9SUbTs3QfIQFb7uMUsAiI2CrQzuqjrnXGXu54+k/DicPA4ijOelediNQI5BbwLLuAJ
         z4NTnIrhihmG3XZfJACh6nlvR//yc9c3xbBUpbELs1XkeKpbPJZ+yYSEkYoq11E8wZA3
         04NeZYFccMVXGNDu38x6xo5cAQR8MiSD909K+1Hs3GkwZuvRxNXXDgrhhMG6VZHLurxR
         QIOA==
X-Gm-Message-State: AOJu0YwNhDNqIFeTLu2SSIJaHOJpT7SUQ6wI9oPm9/qbHnRL042QVELy
	hGXzCyKj2hnUDXm+wAUax2g0iQ==
X-Google-Smtp-Source: AGHT+IHLH1is+UJko0Vbh8oF95stkGXSzkqKgn7kiaS3g+QftQn3FWhjkA2JmUSB343OR7NtN9GNrA==
X-Received: by 2002:a05:6a00:1884:b0:68f:c078:b0b6 with SMTP id x4-20020a056a00188400b0068fc078b0b6mr2439986pfh.10.1694793863749;
        Fri, 15 Sep 2023 09:04:23 -0700 (PDT)
Message-ID: <a14b26dc-c804-4be8-83d5-088e71d37a7b@daynix.com>
Date: Sat, 16 Sep 2023 01:04:17 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [QEMU PATCH v5 09/13] virtio-gpu: Handle resource blob commands
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Antonio Caggiano <quic_acaggian@quicinc.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Robert Beckett <bob.beckett@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Albert Esteve <aesteve@redhat.com>, ernunes@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alyssa Ross <hi@alyssa.is>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>,
 Antonio Caggiano <antonio.caggiano@collabora.com>
References: <20230915111130.24064-1-ray.huang@amd.com>
 <20230915111130.24064-10-ray.huang@amd.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20230915111130.24064-10-ray.huang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/09/15 20:11, Huang Rui wrote:
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
> V4 -> V5:
>      - Use memory_region_init_ram_ptr() instead of
>        memory_region_init_ram_device_ptr() (Akihiko)
> 
>   hw/display/virtio-gpu-virgl.c  | 213 +++++++++++++++++++++++++++++++++
>   hw/display/virtio-gpu.c        |   4 +-
>   include/hw/virtio/virtio-gpu.h |   5 +
>   meson.build                    |   4 +
>   4 files changed, 225 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> index 312953ec16..563a6f2f58 100644
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
> @@ -78,9 +79,24 @@ static void virgl_cmd_create_resource_3d(VirtIOGPU *g,
>       virgl_renderer_resource_create(&args, NULL, 0);
>   }
>   
> +static void virgl_resource_destroy(VirtIOGPU *g,
> +                                   struct virtio_gpu_simple_resource *res)
> +{
> +    if (!res)
> +        return;
> +
> +    QTAILQ_REMOVE(&g->reslist, res, next);
> +
> +    virtio_gpu_cleanup_mapping_iov(g, res->iov, res->iov_cnt);
> +    g_free(res->addrs);
> +
> +    g_free(res);
> +}
> +
>   static void virgl_cmd_resource_unref(VirtIOGPU *g,
>                                        struct virtio_gpu_ctrl_command *cmd)
>   {
> +    struct virtio_gpu_simple_resource *res;
>       struct virtio_gpu_resource_unref unref;
>       struct iovec *res_iovs = NULL;
>       int num_iovs = 0;
> @@ -88,13 +104,22 @@ static void virgl_cmd_resource_unref(VirtIOGPU *g,
>       VIRTIO_GPU_FILL_CMD(unref);
>       trace_virtio_gpu_cmd_res_unref(unref.resource_id);
>   
> +    res = virtio_gpu_find_resource(g, unref.resource_id);
> +
>       virgl_renderer_resource_detach_iov(unref.resource_id,
>                                          &res_iovs,
>                                          &num_iovs);
>       if (res_iovs != NULL && num_iovs != 0) {
>           virtio_gpu_cleanup_mapping_iov(g, res_iovs, num_iovs);
> +        if (res) {
> +            res->iov = NULL;
> +            res->iov_cnt = 0;
> +        }
>       }
> +
>       virgl_renderer_resource_unref(unref.resource_id);
> +
> +    virgl_resource_destroy(g, res);
>   }
>   
>   static void virgl_cmd_context_create(VirtIOGPU *g,
> @@ -426,6 +451,183 @@ static void virgl_cmd_get_capset(VirtIOGPU *g,
>       g_free(resp);
>   }
>   
> +#ifdef HAVE_VIRGL_RESOURCE_BLOB
> +
> +static void virgl_cmd_resource_create_blob(VirtIOGPU *g,
> +                                           struct virtio_gpu_ctrl_command *cmd)
> +{
> +    struct virtio_gpu_simple_resource *res;
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
> +    res = virtio_gpu_find_resource(g, cblob.resource_id);
> +    if (res) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already exists %d\n",
> +                      __func__, cblob.resource_id);
> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +        return;
> +    }
> +
> +    res = g_new0(struct virtio_gpu_simple_resource, 1);
> +    if (!res) {
> +        cmd->error = VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
> +        return;
> +    }
> +
> +    res->resource_id = cblob.resource_id;
> +    res->blob_size = cblob.size;
> +
> +    if (cblob.blob_mem != VIRTIO_GPU_BLOB_MEM_HOST3D) {
> +        ret = virtio_gpu_create_mapping_iov(g, cblob.nr_entries, sizeof(cblob),
> +                                            cmd, &res->addrs, &res->iov,
> +                                            &res->iov_cnt);
> +        if (!ret) {
> +            g_free(res);
> +            cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
> +            return;
> +        }
> +    }
> +
> +    QTAILQ_INSERT_HEAD(&g->reslist, res, next);
> +
> +    virgl_args.res_handle = cblob.resource_id;
> +    virgl_args.ctx_id = cblob.hdr.ctx_id;
> +    virgl_args.blob_mem = cblob.blob_mem;
> +    virgl_args.blob_id = cblob.blob_id;
> +    virgl_args.blob_flags = cblob.blob_flags;
> +    virgl_args.size = cblob.size;
> +    virgl_args.iovecs = res->iov;
> +    virgl_args.num_iovs = res->iov_cnt;
> +
> +    ret = virgl_renderer_resource_create_blob(&virgl_args);
> +    if (ret) {
> +        virgl_resource_destroy(g, res);
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: virgl blob create error: %s\n",
> +                      __func__, strerror(-ret));
> +        cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
> +    }
> +}
> +
> +static void virgl_cmd_resource_map_blob(VirtIOGPU *g,
> +                                        struct virtio_gpu_ctrl_command *cmd)
> +{
> +    struct virtio_gpu_simple_resource *res;
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
> +    res = virtio_gpu_find_resource(g, mblob.resource_id);
> +    if (!res) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource does not exist %d\n",
> +                      __func__, mblob.resource_id);
> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +        return;
> +    }
> +    if (res->region) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already mapped %d\n",
> +		      __func__, mblob.resource_id);
> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +        return;
> +    }
> +
> +    ret = virgl_renderer_resource_map(res->resource_id, &data, &size);
> +    if (ret) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource map error: %s\n",
> +                      __func__, strerror(-ret));
> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +        return;
> +    }
> +
> +    res->region = g_new0(MemoryRegion, 1);
> +    if (!res->region) {
> +        virgl_renderer_resource_unmap(res->resource_id);
> +        cmd->error = VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
> +        return;
> +    }
> +    memory_region_init_ram_ptr(res->region, OBJECT(g), NULL, size, data);
> +    OBJECT(res->region)->free = g_free;
> +    memory_region_add_subregion(&b->hostmem, mblob.offset, res->region);
> +    memory_region_set_enabled(res->region, true);
> +
> +    memset(&resp, 0, sizeof(resp));
> +    resp.hdr.type = VIRTIO_GPU_RESP_OK_MAP_INFO;
> +    virgl_renderer_resource_get_map_info(mblob.resource_id, &resp.map_info);
> +    virtio_gpu_ctrl_response(g, cmd, &resp.hdr, sizeof(resp));
> +}
> +
> +static int virtio_gpu_virgl_resource_unmap(VirtIOGPU *g,
> +                                           struct virtio_gpu_simple_resource
> +                                           *res)
> +{
> +    VirtIOGPUBase *b = VIRTIO_GPU_BASE(g);
> +
> +    if (!res) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already unmapped %d\n",
> +                      __func__, res->resource_id);
> +        return VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;

This returns enum virtio_gpu_ctrl_type while 
virgl_renderer_resource_unmap() returns -errno and the returned error 
code is ignored.

I think you can just inline this function into 
virgl_cmd_resource_unmap_blob(). It will be more concise and consistent 
with virgl_cmd_resource_map_blob().

> +    }
> +
> +    memory_region_set_enabled(res->region, false);
> +    memory_region_del_subregion(&b->hostmem, res->region);
> +    object_unparent(OBJECT(res->region));
> +    res->region = NULL;
> +
> +    return virgl_renderer_resource_unmap(res->resource_id);
> +}
> +
> +static void virgl_cmd_resource_unmap_blob(VirtIOGPU *g,
> +                                          struct virtio_gpu_ctrl_command *cmd)
> +{
> +    struct virtio_gpu_simple_resource *res;
> +    struct virtio_gpu_resource_unmap_blob ublob;
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
> +    res = virtio_gpu_find_resource(g, ublob.resource_id);
> +    if (!res) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource does not exist %d\n",
> +                      __func__, ublob.resource_id);
> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +        return;
> +    }
> +
> +    virtio_gpu_virgl_resource_unmap(g, res);
> +}
> +
> +#endif /* HAVE_VIRGL_RESOURCE_BLOB */
> +
>   void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
>                                         struct virtio_gpu_ctrl_command *cmd)
>   {
> @@ -492,6 +694,17 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
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
> index 5b7a7eab4f..cc4c1f81bb 100644
> --- a/hw/display/virtio-gpu.c
> +++ b/hw/display/virtio-gpu.c
> @@ -1367,10 +1367,12 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
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
> diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
> index 55973e112f..b9adc28071 100644
> --- a/include/hw/virtio/virtio-gpu.h
> +++ b/include/hw/virtio/virtio-gpu.h
> @@ -58,6 +58,11 @@ struct virtio_gpu_simple_resource {
>       int dmabuf_fd;
>       uint8_t *remapped;
>   
> +#ifdef HAVE_VIRGL_RESOURCE_BLOB
> +    /* only blob resource needs this region to be mapped as guest mmio */
> +    MemoryRegion *region;
> +#endif
> +

Since this is specific to virgl, let's create a struct that embeds 
virtio_gpu_simple_resource and use it to avoid modifying virtio-gpu 
common code.

