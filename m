Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2007A5CCF
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 10:44:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604472.941870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiWLC-0005E2-2c; Tue, 19 Sep 2023 08:44:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604472.941870; Tue, 19 Sep 2023 08:44:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiWLB-000593-TG; Tue, 19 Sep 2023 08:44:17 +0000
Received: by outflank-mailman (input) for mailman id 604472;
 Tue, 19 Sep 2023 08:44:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vJAK=FD=gmail.com=marcandre.lureau@srs-se1.protection.inumbo.net>)
 id 1qiWLA-00055u-Pn
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 08:44:16 +0000
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [2607:f8b0:4864:20::82a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5c60e7d-56c8-11ee-9b0d-b553b5be7939;
 Tue, 19 Sep 2023 10:44:14 +0200 (CEST)
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-414b0bdea1cso33409261cf.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 Sep 2023 01:44:14 -0700 (PDT)
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
X-Inumbo-ID: b5c60e7d-56c8-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695113053; x=1695717853; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tSPqPDf8nsvFZaFxwg/g+Umz+SUc9WqZu3/LEnpNQzw=;
        b=nJNnBRjY9qcc5/RmaLKe/q3pVq1aya6liUepZVfxOPHmAudUNziMPd2ME5A9HM9qAQ
         +E1KjiYf3zAkQ3FzZSPThC3nbKUMpSFU32bh6I/5R5/ml/03z9Q5SHFt91p6X2l1xS0g
         0a8qatIeZYHtB33wNJOGG2/4SJHVxbQDkhUZ2DaJs4znTaGm/21gagHHlcMEeaJHZH9H
         4oM13lyl4+vXKSPzB61o+Bv19HjRWPH2xDXHRyk7IssfaYOmcUGXwZDW5AKL82mxq6Hz
         u7LhpAPTccQMALOGNndyTZ9y2ZYyyiYyiqsctcOvtWmenUwMXsKDhgaTWkxkBHY8k08E
         nYZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695113053; x=1695717853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tSPqPDf8nsvFZaFxwg/g+Umz+SUc9WqZu3/LEnpNQzw=;
        b=aQjoS8MFaoXZRvo4md/E3ek5912p1+PjDAmGHR4R1zldoNImUXrs+LU/yGx6XkQ98D
         E9VI1Sp8CU/wP9FIZ42a4AdYRZdEFIGZppOSp4Vo9elnH9lNEHo6M9xGRc1wdn+dvGSH
         mQcjV5eN4I7W2xJNtoeHMk54ElwK4PBxpPJXV6JuWsgpMsirn2gknuNxaqw1JFVsDfcM
         sRZWP+mh6kF3GC5y9F8sxHosVL8ruQSr9ZZU+Q1x/bydT7hWu2FfLZ5fT43yakCtaLtn
         77EOWM1QvBQNR5rgd4UIKbsXVXDA7pUU+SF49ajuDPNfmie7RcS/4VnJcSHM8libOKBw
         lLIw==
X-Gm-Message-State: AOJu0YxgvTsnBxlvOtJJ4ALi/pE95XYKALaYuQYqUVsSIRv9gq/DTc7Q
	qRkZlt0HBHcX8NoEvaZB6BwPwNAjAkxWE7I8uHw=
X-Google-Smtp-Source: AGHT+IG7CfrCudSu55UtNC9g0tpCqpgQhdg07s8gwIFfvPUeEzvt0Y7Lwhg4dccpLwkAzRrKxR+WFwnXO3exR5P8+Ho=
X-Received: by 2002:a05:622a:1208:b0:417:cca3:d0ed with SMTP id
 y8-20020a05622a120800b00417cca3d0edmr1730002qtx.48.1695113053241; Tue, 19 Sep
 2023 01:44:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230915111130.24064-1-ray.huang@amd.com> <20230915111130.24064-10-ray.huang@amd.com>
In-Reply-To: <20230915111130.24064-10-ray.huang@amd.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 19 Sep 2023 12:44:01 +0400
Message-ID: <CAJ+F1CLXqxGKOoOvmXKZWJYENmH6Z3CJhoftvjQBRFO=fhtQuA@mail.gmail.com>
Subject: Re: [QEMU PATCH v5 09/13] virtio-gpu: Handle resource blob commands
To: Huang Rui <ray.huang@amd.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, 
	Akihiko Odaki <akihiko.odaki@daynix.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Antonio Caggiano <quic_acaggian@quicinc.com>, 
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>, Robert Beckett <bob.beckett@collabora.com>, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
	Gurchetan Singh <gurchetansingh@chromium.org>, Albert Esteve <aesteve@redhat.com>, ernunes@redhat.com, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Alyssa Ross <hi@alyssa.is>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>, 
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, Honglei Huang <honglei1.huang@amd.com>, 
	Julia Zhang <julia.zhang@amd.com>, Chen Jiqian <Jiqian.Chen@amd.com>, 
	Antonio Caggiano <antonio.caggiano@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Sep 15, 2023 at 3:14=E2=80=AFPM Huang Rui <ray.huang@amd.com> wrote=
:
>
> From: Antonio Caggiano <antonio.caggiano@collabora.com>
>
> Support BLOB resources creation, mapping and unmapping by calling the
> new stable virglrenderer 0.10 interface. Only enabled when available and
> via the blob config. E.g. -device virtio-vga-gl,blob=3Dtrue
>
> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> ---
>
> V4 -> V5:
>     - Use memory_region_init_ram_ptr() instead of
>       memory_region_init_ram_device_ptr() (Akihiko)
>
>  hw/display/virtio-gpu-virgl.c  | 213 +++++++++++++++++++++++++++++++++
>  hw/display/virtio-gpu.c        |   4 +-
>  include/hw/virtio/virtio-gpu.h |   5 +
>  meson.build                    |   4 +
>  4 files changed, 225 insertions(+), 1 deletion(-)
>
> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.=
c
> index 312953ec16..563a6f2f58 100644
> --- a/hw/display/virtio-gpu-virgl.c
> +++ b/hw/display/virtio-gpu-virgl.c
> @@ -17,6 +17,7 @@
>  #include "trace.h"
>  #include "hw/virtio/virtio.h"
>  #include "hw/virtio/virtio-gpu.h"
> +#include "hw/virtio/virtio-gpu-bswap.h"
>
>  #include "ui/egl-helpers.h"
>
> @@ -78,9 +79,24 @@ static void virgl_cmd_create_resource_3d(VirtIOGPU *g,
>      virgl_renderer_resource_create(&args, NULL, 0);
>  }
>
> +static void virgl_resource_destroy(VirtIOGPU *g,
> +                                   struct virtio_gpu_simple_resource *re=
s)
> +{
> +    if (!res)
> +        return;
> +

QEMU coding style imposes braces

> +    QTAILQ_REMOVE(&g->reslist, res, next);
> +
> +    virtio_gpu_cleanup_mapping_iov(g, res->iov, res->iov_cnt);
> +    g_free(res->addrs);
> +
> +    g_free(res);

If you embed virtio_gpu_simple_resource in a new struct, we should
instead call the existing virtio_gpu_resource_destroy() I guess.

> +}
> +
>  static void virgl_cmd_resource_unref(VirtIOGPU *g,
>                                       struct virtio_gpu_ctrl_command *cmd=
)
>  {
> +    struct virtio_gpu_simple_resource *res;
>      struct virtio_gpu_resource_unref unref;
>      struct iovec *res_iovs =3D NULL;
>      int num_iovs =3D 0;
> @@ -88,13 +104,22 @@ static void virgl_cmd_resource_unref(VirtIOGPU *g,
>      VIRTIO_GPU_FILL_CMD(unref);
>      trace_virtio_gpu_cmd_res_unref(unref.resource_id);
>
> +    res =3D virtio_gpu_find_resource(g, unref.resource_id);
> +
>      virgl_renderer_resource_detach_iov(unref.resource_id,
>                                         &res_iovs,
>                                         &num_iovs);
>      if (res_iovs !=3D NULL && num_iovs !=3D 0) {
>          virtio_gpu_cleanup_mapping_iov(g, res_iovs, num_iovs);
> +        if (res) {
> +            res->iov =3D NULL;
> +            res->iov_cnt =3D 0;
> +        }
>      }
> +
>      virgl_renderer_resource_unref(unref.resource_id);
> +
> +    virgl_resource_destroy(g, res);
>  }
>
>  static void virgl_cmd_context_create(VirtIOGPU *g,
> @@ -426,6 +451,183 @@ static void virgl_cmd_get_capset(VirtIOGPU *g,
>      g_free(resp);
>  }
>
> +#ifdef HAVE_VIRGL_RESOURCE_BLOB
> +
> +static void virgl_cmd_resource_create_blob(VirtIOGPU *g,
> +                                           struct virtio_gpu_ctrl_comman=
d *cmd)
> +{
> +    struct virtio_gpu_simple_resource *res;
> +    struct virtio_gpu_resource_create_blob cblob;
> +    struct virgl_renderer_resource_create_blob_args virgl_args =3D { 0 }=
;
> +    int ret;
> +
> +    VIRTIO_GPU_FILL_CMD(cblob);
> +    virtio_gpu_create_blob_bswap(&cblob);
> +    trace_virtio_gpu_cmd_res_create_blob(cblob.resource_id, cblob.size);
> +
> +    if (cblob.resource_id =3D=3D 0) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource id 0 is not allowed=
\n",
> +                      __func__);
> +        cmd->error =3D VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +        return;
> +    }
> +
> +    res =3D virtio_gpu_find_resource(g, cblob.resource_id);
> +    if (res) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already exists %d\n=
",
> +                      __func__, cblob.resource_id);
> +        cmd->error =3D VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +        return;
> +    }
> +
> +    res =3D g_new0(struct virtio_gpu_simple_resource, 1);
> +    if (!res) {
> +        cmd->error =3D VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
> +        return;

needless error handling, glib will abort() on OOM.

> +    }
> +
> +    res->resource_id =3D cblob.resource_id;
> +    res->blob_size =3D cblob.size;
> +
> +    if (cblob.blob_mem !=3D VIRTIO_GPU_BLOB_MEM_HOST3D) {
> +        ret =3D virtio_gpu_create_mapping_iov(g, cblob.nr_entries, sizeo=
f(cblob),
> +                                            cmd, &res->addrs, &res->iov,
> +                                            &res->iov_cnt);
> +        if (!ret) {
> +            g_free(res);
> +            cmd->error =3D VIRTIO_GPU_RESP_ERR_UNSPEC;
> +            return;
> +        }
> +    }
> +
> +    QTAILQ_INSERT_HEAD(&g->reslist, res, next);
> +
> +    virgl_args.res_handle =3D cblob.resource_id;
> +    virgl_args.ctx_id =3D cblob.hdr.ctx_id;
> +    virgl_args.blob_mem =3D cblob.blob_mem;
> +    virgl_args.blob_id =3D cblob.blob_id;
> +    virgl_args.blob_flags =3D cblob.blob_flags;
> +    virgl_args.size =3D cblob.size;
> +    virgl_args.iovecs =3D res->iov;
> +    virgl_args.num_iovs =3D res->iov_cnt;
> +
> +    ret =3D virgl_renderer_resource_create_blob(&virgl_args);
> +    if (ret) {
> +        virgl_resource_destroy(g, res);
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: virgl blob create error: %s\=
n",
> +                      __func__, strerror(-ret));
> +        cmd->error =3D VIRTIO_GPU_RESP_ERR_UNSPEC;
> +    }
> +}
> +
> +static void virgl_cmd_resource_map_blob(VirtIOGPU *g,
> +                                        struct virtio_gpu_ctrl_command *=
cmd)
> +{
> +    struct virtio_gpu_simple_resource *res;
> +    struct virtio_gpu_resource_map_blob mblob;
> +    int ret;
> +    void *data;
> +    uint64_t size;
> +    struct virtio_gpu_resp_map_info resp;
> +    VirtIOGPUBase *b =3D VIRTIO_GPU_BASE(g);
> +
> +    VIRTIO_GPU_FILL_CMD(mblob);
> +    virtio_gpu_map_blob_bswap(&mblob);
> +
> +    if (mblob.resource_id =3D=3D 0) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource id 0 is not allowed=
\n",
> +                      __func__);
> +        cmd->error =3D VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +        return;
> +    }
> +
> +    res =3D virtio_gpu_find_resource(g, mblob.resource_id);
> +    if (!res) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource does not exist %d\n=
",
> +                      __func__, mblob.resource_id);
> +        cmd->error =3D VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +        return;
> +    }
> +    if (res->region) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already mapped %d\n=
",
> +                     __func__, mblob.resource_id);
> +        cmd->error =3D VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +        return;
> +    }
> +
> +    ret =3D virgl_renderer_resource_map(res->resource_id, &data, &size);
> +    if (ret) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource map error: %s\n",
> +                      __func__, strerror(-ret));
> +        cmd->error =3D VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +        return;
> +    }
> +
> +    res->region =3D g_new0(MemoryRegion, 1);
> +    if (!res->region) {

no need for OOM handling here too

> +        virgl_renderer_resource_unmap(res->resource_id);
> +        cmd->error =3D VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
> +        return;
> +    }
> +    memory_region_init_ram_ptr(res->region, OBJECT(g), NULL, size, data)=
;
> +    OBJECT(res->region)->free =3D g_free;
> +    memory_region_add_subregion(&b->hostmem, mblob.offset, res->region);
> +    memory_region_set_enabled(res->region, true);
> +
> +    memset(&resp, 0, sizeof(resp));
> +    resp.hdr.type =3D VIRTIO_GPU_RESP_OK_MAP_INFO;
> +    virgl_renderer_resource_get_map_info(mblob.resource_id, &resp.map_in=
fo);
> +    virtio_gpu_ctrl_response(g, cmd, &resp.hdr, sizeof(resp));
> +}
> +
> +static int virtio_gpu_virgl_resource_unmap(VirtIOGPU *g,
> +                                           struct virtio_gpu_simple_reso=
urce
> +                                           *res)
> +{
> +    VirtIOGPUBase *b =3D VIRTIO_GPU_BASE(g);
> +
> +    if (!res) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already unmapped %d=
\n",
> +                      __func__, res->resource_id);
> +        return VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +    }
> +
> +    memory_region_set_enabled(res->region, false);
> +    memory_region_del_subregion(&b->hostmem, res->region);
> +    object_unparent(OBJECT(res->region));
> +    res->region =3D NULL;
> +
> +    return virgl_renderer_resource_unmap(res->resource_id);
> +}
> +
> +static void virgl_cmd_resource_unmap_blob(VirtIOGPU *g,
> +                                          struct virtio_gpu_ctrl_command=
 *cmd)
> +{
> +    struct virtio_gpu_simple_resource *res;
> +    struct virtio_gpu_resource_unmap_blob ublob;
> +    VIRTIO_GPU_FILL_CMD(ublob);
> +    virtio_gpu_unmap_blob_bswap(&ublob);
> +
> +    if (ublob.resource_id =3D=3D 0) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource id 0 is not allowed=
\n",
> +                      __func__);
> +        cmd->error =3D VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +        return;
> +    }
> +
> +    res =3D virtio_gpu_find_resource(g, ublob.resource_id);
> +    if (!res) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource does not exist %d\n=
",
> +                      __func__, ublob.resource_id);
> +        cmd->error =3D VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +        return;
> +    }
> +
> +    virtio_gpu_virgl_resource_unmap(g, res);
> +}
> +
> +#endif /* HAVE_VIRGL_RESOURCE_BLOB */
> +
>  void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
>                                        struct virtio_gpu_ctrl_command *cm=
d)
>  {
> @@ -492,6 +694,17 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
>      case VIRTIO_GPU_CMD_GET_EDID:
>          virtio_gpu_get_edid(g, cmd);
>          break;
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
>      default:
>          cmd->error =3D VIRTIO_GPU_RESP_ERR_UNSPEC;
>          break;
> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> index 5b7a7eab4f..cc4c1f81bb 100644
> --- a/hw/display/virtio-gpu.c
> +++ b/hw/display/virtio-gpu.c
> @@ -1367,10 +1367,12 @@ void virtio_gpu_device_realize(DeviceState *qdev,=
 Error **errp)
>              return;
>          }
>
> +#ifndef HAVE_VIRGL_RESOURCE_BLOB
>          if (virtio_gpu_virgl_enabled(g->parent_obj.conf)) {
> -            error_setg(errp, "blobs and virgl are not compatible (yet)")=
;
> +            error_setg(errp, "Linked virglrenderer does not support blob=
 resources");
>              return;
>          }
> +#endif
>      }
>
>      if (!virtio_gpu_base_device_realize(qdev,
> diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gp=
u.h
> index 55973e112f..b9adc28071 100644
> --- a/include/hw/virtio/virtio-gpu.h
> +++ b/include/hw/virtio/virtio-gpu.h
> @@ -58,6 +58,11 @@ struct virtio_gpu_simple_resource {
>      int dmabuf_fd;
>      uint8_t *remapped;
>
> +#ifdef HAVE_VIRGL_RESOURCE_BLOB
> +    /* only blob resource needs this region to be mapped as guest mmio *=
/
> +    MemoryRegion *region;
> +#endif
> +
>      QTAILQ_ENTRY(virtio_gpu_simple_resource) next;
>  };
>
> diff --git a/meson.build b/meson.build
> index ff20d3c249..f7b744ab82 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1072,6 +1072,10 @@ if not get_option('virglrenderer').auto() or have_=
system or have_vhost_user_gpu
>                         cc.has_function('virgl_renderer_context_create_wi=
th_flags',
>                                         prefix: '#include <virglrenderer.=
h>',
>                                         dependencies: virgl))
> +  config_host_data.set('HAVE_VIRGL_RESOURCE_BLOB',
> +                       cc.has_function('virgl_renderer_resource_create_b=
lob',
> +                                       prefix: '#include <virglrenderer.=
h>',
> +                                       dependencies: virgl))

better moved under the if virgl.found() block

>  endif
>  blkio =3D not_found
>  if not get_option('blkio').auto() or have_block
> --
> 2.34.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

