Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12709821CD9
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jan 2024 14:40:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660691.1030260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKezb-00064J-B6; Tue, 02 Jan 2024 13:39:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660691.1030260; Tue, 02 Jan 2024 13:39:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKezb-000610-81; Tue, 02 Jan 2024 13:39:39 +0000
Received: by outflank-mailman (input) for mailman id 660691;
 Tue, 02 Jan 2024 13:39:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nGpE=IM=gmail.com=marcandre.lureau@srs-se1.protection.inumbo.net>)
 id 1rKeza-0005zl-As
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2024 13:39:38 +0000
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [2607:f8b0:4864:20::b33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ec8d242-a974-11ee-98ef-6d05b1d4d9a1;
 Tue, 02 Jan 2024 14:39:37 +0100 (CET)
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-db4364ecd6aso4189458276.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jan 2024 05:39:37 -0800 (PST)
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
X-Inumbo-ID: 5ec8d242-a974-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704202776; x=1704807576; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HV86xnmwiB7VDINqEd3kWQpMQ8gj64ZmQMvMJnPxJHw=;
        b=UaOt3vTRHw3TUppav1RsqkyeDv5DEKacOzb/LY2VqzbKs6+S7ylff+Bt84LxmGrg6+
         zWPKRuFUsDHcqMxCTSMX3+HiiSzvX3omMYDkc6Nqa1RmDxxAYRO7FZoIC4bqebxLoi5f
         HabS1WpltIG3VlCavrg42So1A4+rl1rV9n8B/TOXXEACB3KNZL1EIhRJt8mp4lAMnREW
         rjy4rayQ4/xdBHKe9Kh4iGB2utUqoOSQjqLUABbpoOO5UItkKjOOLBfMVLvMBCFikCBK
         fOq7+PyxpegA3ep9xD1CWpRZPnNDbh+oyVMFIpFHtl3MR1MFiId/6W4OpYPb+CsynIh9
         va2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704202776; x=1704807576;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HV86xnmwiB7VDINqEd3kWQpMQ8gj64ZmQMvMJnPxJHw=;
        b=ij5j3ItVt5btOM/lqNbjYC4MNK0x0VlB+cVUPXxJ7eYUxw/bGMVceSZbUUvOFL2sG8
         501wh18OTeD71oM+wIsQjWwZyujh1AeQMrAhCkv2Mg+kakF2GxpNEWl/eDDnRc693GEf
         eFYfQOW1d5ejrNX2YBCQ2U0u3UU1PJHCImhI4KYIZaN0g+y9pjw9+D7ZZPbCDiitSreZ
         4WrnIU2cx3OnVt792xHiaiM4RgejlLk5PyPbQOADBwIdlK52Ogq0PfAgJ5UUZfacZzHT
         RDUxBe2yQj6DayrjZKU3AcS5x6QNdRYCReSrvSQb6q6f52CpM2KzQHe1q6JVkeGVvqJb
         GYXQ==
X-Gm-Message-State: AOJu0YyYEIdM4/Bit9pNCDT90U44kQXNy56ZA7a+CtzIHEyqXNw5ZYqk
	A098UB/DR/ulRrZDRads4fFjkqFf1A9VwWP+ZWk=
X-Google-Smtp-Source: AGHT+IG+OQYIob6RBPwlMR5/Is7PbLOVZQdhhuLkKJ8r9LQnsDgBQJMOskfpkohbDgZyhVoTqqDc1z++SdXMfyS9huI=
X-Received: by 2002:a05:6902:1207:b0:dbe:346b:b9d with SMTP id
 s7-20020a056902120700b00dbe346b0b9dmr3885495ybu.125.1704202776077; Tue, 02
 Jan 2024 05:39:36 -0800 (PST)
MIME-Version: 1.0
References: <20231221102342.4022630-1-julia.zhang@amd.com> <20231221102342.4022630-2-julia.zhang@amd.com>
In-Reply-To: <20231221102342.4022630-2-julia.zhang@amd.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 2 Jan 2024 17:39:24 +0400
Message-ID: <CAJ+F1CLEG1+JVrjqe2-+kngMSA7xOZ3xL=1kh3fswRJHkLk2ZA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] virgl: Implement resource_query_layout
To: Julia Zhang <julia.zhang@amd.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>, 
	Antonio Caggiano <antonio.caggiano@collabora.com>, 
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>, Robert Beckett <bob.beckett@collabora.com>, qemu-devel@nongnu.org, 
	xen-devel@lists.xenproject.org, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Xenia Ragiadakou <burzalodowa@gmail.com>, Honglei Huang <honglei1.huang@amd.com>, 
	Chen Jiqian <Jiqian.Chen@amd.com>, Daniel Stone <daniels@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Dec 21, 2023 at 3:36=E2=80=AFPM Julia Zhang <julia.zhang@amd.com> w=
rote:
>
> From: Daniel Stone <daniels@collabora.com>
>
> A new ioctl to shuttle information between host and guest about the
> actual buffer allocation, which can be used for interop between GL and
> Vulkan when supporting standard window systems.
>

The command hasn't been added to the kernel yet. The function is not
in the virgl library either.

> Signed-off-by: Daniel Stone <daniels@collabora.com>
> Co-developed-by: Julia Zhang <julia.zhang@amd.com>
> Signed-off-by: Julia Zhang <julia.zhang@amd.com>
> ---
>  hw/display/virtio-gpu-base.c                |  4 +++
>  hw/display/virtio-gpu-virgl.c               | 40 +++++++++++++++++++++
>  include/hw/virtio/virtio-gpu-bswap.h        |  7 ++++
>  include/standard-headers/linux/virtio_gpu.h | 30 ++++++++++++++++
>  meson.build                                 |  4 +++
>  5 files changed, 85 insertions(+)
>
> diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
> index 6bcee3882f..09b37f015d 100644
> --- a/hw/display/virtio-gpu-base.c
> +++ b/hw/display/virtio-gpu-base.c
> @@ -240,6 +240,10 @@ virtio_gpu_base_get_features(VirtIODevice *vdev, uin=
t64_t features,
>          features |=3D (1 << VIRTIO_GPU_F_RESOURCE_UUID);
>      }
>
> +#ifdef HAVE_VIRGL_RESOURCE_QUERY_LAYOUT
> +    features |=3D (1 << VIRTIO_GPU_F_RESOURCE_QUERY_LAYOUT);
> +#endif /* HAVE_VIRGL_RESOURCE_QUERY_LAYOUT */
> +
>      return features;
>  }
>
> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.=
c
> index c1e7c6d0c6..b331232fee 100644
> --- a/hw/display/virtio-gpu-virgl.c
> +++ b/hw/display/virtio-gpu-virgl.c
> @@ -813,6 +813,40 @@ static void virgl_cmd_set_scanout_blob(VirtIOGPU *g,
>
>  #endif /* HAVE_VIRGL_RESOURCE_BLOB */
>
> +#ifdef HAVE_VIRGL_RESOURCE_QUERY_LAYOUT
> +static void virgl_cmd_resource_query_layout(VirtIOGPU *g,
> +                                           struct virtio_gpu_ctrl_comman=
d *cmd)
> +{
> +    struct virtio_gpu_resource_query_layout qlayout;
> +    struct virtio_gpu_resp_resource_layout resp;
> +    struct virgl_renderer_resource_layout rlayout;
> +    int ret;
> +    int i;
> +    VIRTIO_GPU_FILL_CMD(qlayout);
> +    virtio_gpu_resource_query_layout_bswap(&qlayout);
> +
> +    ret =3D virgl_renderer_resource_query_layout(qlayout.resource_id, &r=
layout,
> +                                              qlayout.width, qlayout.hei=
ght,
> +                                              qlayout.format, qlayout.bi=
nd);
> +    if (ret !=3D 0) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource %d is not externall=
y-allocated\n",
> +                      __func__, qlayout.resource_id);
> +        cmd->error =3D VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +        return;
> +    }
> +
> +    memset(&resp, 0, sizeof(resp));
> +    resp.hdr.type =3D VIRTIO_GPU_RESP_OK_RESOURCE_LAYOUT;
> +    resp.num_planes =3D rlayout.num_planes;
> +    resp.modifier =3D rlayout.modifier;
> +    for (i =3D 0; i < resp.num_planes; i++) {
> +        resp.planes[i].offset =3D rlayout.planes[i].offset;
> +        resp.planes[i].stride =3D rlayout.planes[i].stride;
> +    }
> +    virtio_gpu_ctrl_response(g, cmd, &resp.hdr, sizeof(resp));
> +}
> +#endif /* HAVE_VIRGL_RESOURCE_QUERY_LAYOUT */
> +
>  void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
>                                        struct virtio_gpu_ctrl_command *cm=
d)
>  {
> @@ -896,6 +930,12 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
>          virgl_cmd_set_scanout_blob(g, cmd);
>          break;
>  #endif /* HAVE_VIRGL_RESOURCE_BLOB */
> +
> +#ifdef HAVE_VIRGL_RESOURCE_QUERY_LAYOUT
> +    case VIRTIO_GPU_CMD_RESOURCE_QUERY_LAYOUT:
> +       virgl_cmd_resource_query_layout(g, cmd);
> +       break;
> +#endif /* HAVE_VIRGL_RESOURCE_QUERY_LAYOUT*/
>      default:
>          cmd->error =3D VIRTIO_GPU_RESP_ERR_UNSPEC;
>          break;
> diff --git a/include/hw/virtio/virtio-gpu-bswap.h b/include/hw/virtio/vir=
tio-gpu-bswap.h
> index dd1975e2d4..dea8cf6fd3 100644
> --- a/include/hw/virtio/virtio-gpu-bswap.h
> +++ b/include/hw/virtio/virtio-gpu-bswap.h
> @@ -92,4 +92,11 @@ virtio_gpu_scanout_blob_bswap(struct virtio_gpu_set_sc=
anout_blob *ssb)
>      le32_to_cpus(&ssb->offsets[3]);
>  }
>
> +static inline void
> +virtio_gpu_resource_query_layout_bswap(struct virtio_gpu_resource_query_=
layout *rql)
> +{
> +    virtio_gpu_ctrl_hdr_bswap(&rql->hdr);
> +    le32_to_cpus(&rql->resource_id);
> +}
> +
>  #endif
> diff --git a/include/standard-headers/linux/virtio_gpu.h b/include/standa=
rd-headers/linux/virtio_gpu.h
> index c621389f3d..c9a2f58237 100644
> --- a/include/standard-headers/linux/virtio_gpu.h
> +++ b/include/standard-headers/linux/virtio_gpu.h
> @@ -65,6 +65,11 @@
>   */
>  #define VIRTIO_GPU_F_CONTEXT_INIT        4
>
> +/*
> + * VIRTIO_GPU_CMD_RESOURCE_QUERY_LAYOUT
> + */
> +#define VIRTIO_GPU_F_RESOURCE_QUERY_LAYOUT 5
> +
>  enum virtio_gpu_ctrl_type {
>         VIRTIO_GPU_UNDEFINED =3D 0,
>
> @@ -95,6 +100,7 @@ enum virtio_gpu_ctrl_type {
>         VIRTIO_GPU_CMD_SUBMIT_3D,
>         VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB,
>         VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB,
> +       VIRTIO_GPU_CMD_RESOURCE_QUERY_LAYOUT,
>
>         /* cursor commands */
>         VIRTIO_GPU_CMD_UPDATE_CURSOR =3D 0x0300,
> @@ -108,6 +114,7 @@ enum virtio_gpu_ctrl_type {
>         VIRTIO_GPU_RESP_OK_EDID,
>         VIRTIO_GPU_RESP_OK_RESOURCE_UUID,
>         VIRTIO_GPU_RESP_OK_MAP_INFO,
> +       VIRTIO_GPU_RESP_OK_RESOURCE_LAYOUT,
>
>         /* error responses */
>         VIRTIO_GPU_RESP_ERR_UNSPEC =3D 0x1200,
> @@ -455,4 +462,27 @@ struct virtio_gpu_resource_unmap_blob {
>         uint32_t padding;
>  };
>
> +
> +/* VIRTIO_GPU_CMD_RESOURCE_QUERY_LAYOUT */
> +struct virtio_gpu_resource_query_layout {
> +       struct virtio_gpu_ctrl_hdr hdr;
> +       uint32_t resource_id;
> +       uint32_t width;
> +       uint32_t height;
> +       uint32_t format;
> +       uint32_t bind;
> +};
> +
> +/* VIRTIO_GPU_RESP_OK_RESOURCE_LAYOUT */
> +#define VIRTIO_GPU_RES_MAX_PLANES 4
> +struct virtio_gpu_resp_resource_layout {
> +       struct virtio_gpu_ctrl_hdr hdr;
> +       uint64_t modifier;
> +       uint32_t num_planes;
> +       struct virtio_gpu_resource_plane {
> +               uint64_t offset;
> +               uint32_t stride;
> +       } planes[VIRTIO_GPU_RES_MAX_PLANES];
> +};
> +
>  #endif
> diff --git a/meson.build b/meson.build
> index a739a62f2c..72024f5f01 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1058,6 +1058,10 @@ if not get_option('virglrenderer').auto() or have_=
system or have_vhost_user_gpu
>                           cc.has_function('virgl_renderer_resource_create=
_blob',
>                                           prefix: '#include <virglrendere=
r.h>',
>                                           dependencies: virgl))
> +    config_host_data.set('HAVE_VIRGL_RESOURCE_QUERY_LAYOUT',
> +                         cc.has_function('virgl_renderer_resource_query_=
layout',
> +                                         prefix: '#include <virglrendere=
r.h>',
> +                                         dependencies: virgl))
>    endif
>  endif
>  rutabaga =3D not_found
> --
> 2.34.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

