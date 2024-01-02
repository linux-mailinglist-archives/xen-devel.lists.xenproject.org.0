Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 676DE821B39
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jan 2024 12:52:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660652.1030212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKdJk-0003kD-Cf; Tue, 02 Jan 2024 11:52:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660652.1030212; Tue, 02 Jan 2024 11:52:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKdJk-0003gs-7c; Tue, 02 Jan 2024 11:52:20 +0000
Received: by outflank-mailman (input) for mailman id 660652;
 Tue, 02 Jan 2024 11:52:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nGpE=IM=gmail.com=marcandre.lureau@srs-se1.protection.inumbo.net>)
 id 1rKdJi-0003fY-8I
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2024 11:52:18 +0000
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [2607:f8b0:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60134d43-a965-11ee-98ef-6d05b1d4d9a1;
 Tue, 02 Jan 2024 12:52:17 +0100 (CET)
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-3bbc755167fso4136440b6e.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jan 2024 03:52:17 -0800 (PST)
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
X-Inumbo-ID: 60134d43-a965-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704196336; x=1704801136; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hFmcKa0V1SXEd2KZZXGrlYbPhOuudVLjDBKA5R7e/lM=;
        b=VB9sWVAyBmV4bZ71VAFd+pdX/caTJTRl6xspgbwE45fN7AB+O6i/YVIknTJs+nl7Ks
         Y2xAMZNI/7uSTYUsr1QLyNzJbpyMZK1WpFmL5fWFZ0ML4nBVPZIomxFvlRgqDkUWeauL
         lj/Ap2R85JWW1TekHBleHT10REEPhCGy38d1pS/zA4ug9uBNCneZXOW/4N/gDfDdEujM
         0xj6Ra34stA4y5ZH8pkFysE92DUEN2FTtKkYORE1nkWmhWIiIdrFvyRnreQV1f5jina9
         WowinuxlklfnKmBMRLUB42TnIbXe2VOsNDaaIrKvB3DfshaA96U77HBqAD8CD5K1faSY
         /4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704196336; x=1704801136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hFmcKa0V1SXEd2KZZXGrlYbPhOuudVLjDBKA5R7e/lM=;
        b=STav0qJjFyswenrCo0CIUin+kmQLlNaTaTOspG70+khf6Fzbz31NLWgO2EEb/LHcRb
         svza+kKgQ5RgvIBUCWcHe99aYkCXJNcyyQ9wwkLGyUEJg8FfcW9LJKpP+RTJx4ApIL4s
         nQLbRFzSsm3cmV3bHmfhk2j44LZ5+jb0Lds5TsiyEs5tOWXrmdzE9pzFGBHmnxCErPZY
         /a+DxsyOAft5EMxBQS90c3R8Z0/W5ZKFaeRJyWZwMWt6J41UmBmMdvPAISgJbGv2qtqp
         90PNF2Pm9fPMGs5hLxO5jGjlUwVROzqoOnHAcSKSC7sHtZNo7gZAv6VDW52zOKTBiv5u
         wAnw==
X-Gm-Message-State: AOJu0Yw6zGPFPaZQcgzEBxx/yUxyMktd38K/PYREZ0ACLQLP0kUCOqXD
	6wGEfPwFKbhXL3KBQL6pST751crTLaffJTk8VDU=
X-Google-Smtp-Source: AGHT+IHudrFSrTiSo9q3MtaVIl5rejRXuPWYRNchd/Kok95sEO10YWSEraRSZCSSP/MkRfsU8pKG3dNaLS2KbqKkPDk=
X-Received: by 2002:a05:6808:2f1a:b0:3bc:804:580e with SMTP id
 gu26-20020a0568082f1a00b003bc0804580emr4550071oib.99.1704196335863; Tue, 02
 Jan 2024 03:52:15 -0800 (PST)
MIME-Version: 1.0
References: <20231219075320.165227-1-ray.huang@amd.com> <20231219075320.165227-6-ray.huang@amd.com>
In-Reply-To: <20231219075320.165227-6-ray.huang@amd.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 2 Jan 2024 15:52:04 +0400
Message-ID: <CAJ+F1CKOsDk835H8j56mfS7e=8BusYjo3mJYwuPbdRPq1MmNzw@mail.gmail.com>
Subject: Re: [PATCH v6 05/11] virtio-gpu: Introduce virgl_gpu_resource structure
To: Huang Rui <ray.huang@amd.com>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>, 
	Antonio Caggiano <quic_acaggian@quicinc.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>, 
	Robert Beckett <bob.beckett@collabora.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Gert Wollny <gert.wollny@collabora.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
	Gurchetan Singh <gurchetansingh@chromium.org>, ernunes@redhat.com, 
	Alyssa Ross <hi@alyssa.is>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Stefano Stabellini <stefano.stabellini@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>, 
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, Honglei Huang <honglei1.huang@amd.com>, 
	Julia Zhang <julia.zhang@amd.com>, Chen Jiqian <Jiqian.Chen@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Dec 19, 2023 at 11:55=E2=80=AFAM Huang Rui <ray.huang@amd.com> wrot=
e:
>
> Introduce a new virgl_gpu_resource data structure and helper functions
> for virgl. It's used to add new member which is specific for virgl in
> following patches of blob memory support.
>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> ---
>
> New patch:
> - Introduce new struct virgl_gpu_resource to store virgl specific members=
.
> - Move resource initialization from path "virtio-gpu: Resource UUID" here=
.
> - Remove error handling of g_new0, because glib will abort() on OOM.
> - Set iov and iov_cnt in struct virtio_gpu_simple_resource for all types
>   of resources.
>
>  hw/display/virtio-gpu-virgl.c | 84 ++++++++++++++++++++++++++---------
>  1 file changed, 64 insertions(+), 20 deletions(-)
>
> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.=
c
> index 5bbc8071b2..faab374336 100644
> --- a/hw/display/virtio-gpu-virgl.c
> +++ b/hw/display/virtio-gpu-virgl.c
> @@ -22,6 +22,23 @@
>
>  #include <virglrenderer.h>
>
> +struct virgl_gpu_resource {
> +    struct virtio_gpu_simple_resource res;
> +};
> +
> +static struct virgl_gpu_resource *
> +virgl_gpu_find_resource(VirtIOGPU *g, uint32_t resource_id)
> +{
> +    struct virtio_gpu_simple_resource *res;
> +
> +    res =3D virtio_gpu_find_resource(g, resource_id);
> +    if (!res) {
> +        return NULL;
> +    }
> +
> +    return container_of(res, struct virgl_gpu_resource, res);
> +}
> +
>  #if VIRGL_RENDERER_CALLBACKS_VERSION >=3D 4
>  static void *
>  virgl_get_egl_display(G_GNUC_UNUSED void *cookie)
> @@ -35,11 +52,19 @@ static void virgl_cmd_create_resource_2d(VirtIOGPU *g=
,
>  {
>      struct virtio_gpu_resource_create_2d c2d;
>      struct virgl_renderer_resource_create_args args;
> +    struct virgl_gpu_resource *vres;
>
>      VIRTIO_GPU_FILL_CMD(c2d);
>      trace_virtio_gpu_cmd_res_create_2d(c2d.resource_id, c2d.format,
>                                         c2d.width, c2d.height);
>

It should check the resource doesn't already exist (similar to 2d code)

> +    vres =3D g_new0(struct virgl_gpu_resource, 1);
> +    vres->res.width =3D c2d.width;
> +    vres->res.height =3D c2d.height;
> +    vres->res.format =3D c2d.format;
> +    vres->res.resource_id =3D c2d.resource_id;
> +    QTAILQ_INSERT_HEAD(&g->reslist, &vres->res, next);
> +
>      args.handle =3D c2d.resource_id;
>      args.target =3D 2;
>      args.format =3D c2d.format;
> @@ -59,11 +84,19 @@ static void virgl_cmd_create_resource_3d(VirtIOGPU *g=
,
>  {
>      struct virtio_gpu_resource_create_3d c3d;
>      struct virgl_renderer_resource_create_args args;
> +    struct virgl_gpu_resource *vres;
>
>      VIRTIO_GPU_FILL_CMD(c3d);
>      trace_virtio_gpu_cmd_res_create_3d(c3d.resource_id, c3d.format,
>                                         c3d.width, c3d.height, c3d.depth)=
;
>

same

> +    vres =3D g_new0(struct virgl_gpu_resource, 1);
> +    vres->res.width =3D c3d.width;
> +    vres->res.height =3D c3d.height;
> +    vres->res.format =3D c3d.format;
> +    vres->res.resource_id =3D c3d.resource_id;
> +    QTAILQ_INSERT_HEAD(&g->reslist, &vres->res, next);
> +
>      args.handle =3D c3d.resource_id;
>      args.target =3D c3d.target;
>      args.format =3D c3d.format;
> @@ -82,19 +115,23 @@ static void virgl_cmd_resource_unref(VirtIOGPU *g,
>                                       struct virtio_gpu_ctrl_command *cmd=
)
>  {
>      struct virtio_gpu_resource_unref unref;
> -    struct iovec *res_iovs =3D NULL;
> -    int num_iovs =3D 0;
> +    struct virgl_gpu_resource *vres;
>
>      VIRTIO_GPU_FILL_CMD(unref);
>      trace_virtio_gpu_cmd_res_unref(unref.resource_id);
>
> -    virgl_renderer_resource_detach_iov(unref.resource_id,
> -                                       &res_iovs,
> -                                       &num_iovs);
> -    if (res_iovs !=3D NULL && num_iovs !=3D 0) {
> -        virtio_gpu_cleanup_mapping_iov(g, res_iovs, num_iovs);
> +    vres =3D virgl_gpu_find_resource(g, unref.resource_id);
> +    if (!vres) {
> +        cmd->error =3D VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +        return;
>      }
> +
> +    virgl_renderer_resource_detach_iov(unref.resource_id, NULL, NULL);
>      virgl_renderer_resource_unref(unref.resource_id);
> +
> +    QTAILQ_REMOVE(&g->reslist, &vres->res, next);
> +    virtio_gpu_cleanup_mapping(g, &vres->res);
> +    g_free(vres);
>  }
>
>  static void virgl_cmd_context_create(VirtIOGPU *g,
> @@ -310,44 +347,51 @@ static void virgl_resource_attach_backing(VirtIOGPU=
 *g,
>                                            struct virtio_gpu_ctrl_command=
 *cmd)
>  {
>      struct virtio_gpu_resource_attach_backing att_rb;
> -    struct iovec *res_iovs;
> -    uint32_t res_niov;
> +    struct virgl_gpu_resource *vres;
>      int ret;
>
>      VIRTIO_GPU_FILL_CMD(att_rb);
>      trace_virtio_gpu_cmd_res_back_attach(att_rb.resource_id);
>
> +    vres =3D virgl_gpu_find_resource(g, att_rb.resource_id);
> +    if (!vres) {
> +        cmd->error =3D VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +        return;
> +    }
> +
>      ret =3D virtio_gpu_create_mapping_iov(g, att_rb.nr_entries, sizeof(a=
tt_rb),
> -                                        cmd, NULL, &res_iovs, &res_niov)=
;
> +                                        cmd, NULL, &vres->res.iov,
> +                                        &vres->res.iov_cnt);
>      if (ret !=3D 0) {
>          cmd->error =3D VIRTIO_GPU_RESP_ERR_UNSPEC;
>          return;
>      }
>
>      ret =3D virgl_renderer_resource_attach_iov(att_rb.resource_id,
> -                                             res_iovs, res_niov);
> +                                             vres->res.iov, vres->res.io=
v_cnt);
>
> -    if (ret !=3D 0)
> -        virtio_gpu_cleanup_mapping_iov(g, res_iovs, res_niov);
> +    if (ret !=3D 0) {
> +        virtio_gpu_cleanup_mapping(g, &vres->res);
> +    }
>  }
>
>  static void virgl_resource_detach_backing(VirtIOGPU *g,
>                                            struct virtio_gpu_ctrl_command=
 *cmd)
>  {
>      struct virtio_gpu_resource_detach_backing detach_rb;
> -    struct iovec *res_iovs =3D NULL;
> -    int num_iovs =3D 0;
> +    struct virgl_gpu_resource *vres;
>
>      VIRTIO_GPU_FILL_CMD(detach_rb);
>      trace_virtio_gpu_cmd_res_back_detach(detach_rb.resource_id);
>
> -    virgl_renderer_resource_detach_iov(detach_rb.resource_id,
> -                                       &res_iovs,
> -                                       &num_iovs);
> -    if (res_iovs =3D=3D NULL || num_iovs =3D=3D 0) {
> +    vres =3D virgl_gpu_find_resource(g, detach_rb.resource_id);
> +    if (!vres) {
> +        cmd->error =3D VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
>          return;
>      }
> -    virtio_gpu_cleanup_mapping_iov(g, res_iovs, num_iovs);
> +
> +    virgl_renderer_resource_detach_iov(detach_rb.resource_id, NULL, NULL=
);
> +    virtio_gpu_cleanup_mapping(g, &vres->res);
>  }
>
>
> --
> 2.25.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

