Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4559821B25
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jan 2024 12:44:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660643.1030191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKdBL-0000v1-87; Tue, 02 Jan 2024 11:43:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660643.1030191; Tue, 02 Jan 2024 11:43:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKdBL-0000sg-53; Tue, 02 Jan 2024 11:43:39 +0000
Received: by outflank-mailman (input) for mailman id 660643;
 Tue, 02 Jan 2024 11:43:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nGpE=IM=gmail.com=marcandre.lureau@srs-se1.protection.inumbo.net>)
 id 1rKdBK-0000sQ-7F
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2024 11:43:38 +0000
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [2607:f8b0:4864:20::82c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 280f65bd-a964-11ee-9b0f-b553b5be7939;
 Tue, 02 Jan 2024 12:43:33 +0100 (CET)
Received: by mail-qt1-x82c.google.com with SMTP id
 d75a77b69052e-4283271739fso919971cf.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jan 2024 03:43:33 -0800 (PST)
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
X-Inumbo-ID: 280f65bd-a964-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704195812; x=1704800612; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRWEY18VciRq+byvwMCRJuF5oX/xWtKPpJhz2/bbeoM=;
        b=mC8qT7D5EXgBH8wrru/UrPy/ovVdfrfXOaVdGfN/9uejZPuGLlK7QiHRYTHO/nkpxI
         1hXF4tPYucBL9HKB/qeLE2ocdyXZVuBY0kX/EYeOlfcs/Lt7H4ftKw66omrntxscN1k0
         jst5l8cpopc3udkMt/a5jsPLHhU1r2XoIFmS4vh4ro89v+biulsyW9BlUY31+bZwUHMX
         VU+1QB21OuU/57YdbMDqkD+9Kx/VVkFfViJwrihQyiSa7q+2zbreAQCbtUShjyXbvSck
         TKtu1L4COiDOwETZynvP634c77ZwhLo92Kmx617XEvXerymUT2HZUiW0wouKNjDXrh7W
         3DZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704195812; x=1704800612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uRWEY18VciRq+byvwMCRJuF5oX/xWtKPpJhz2/bbeoM=;
        b=Jq8Eoi8rrnjqWwSoGc0UAs7cW6zxeF8idVk834JrS88zcMFN0cVLrmlJQm+1s8XVmY
         sTK45X+KvhS5Q6MKQCGRD56ZHku3wVeKSdZd5rwBgdECr1sPV1PAK41nRXI0w+bJqsAd
         GJkR8NiEigssgaGJh9HjjUxlOaM1YxPopGSt5Jg9avi4DWQ9B28q7SKpTpDPxt1M9uvd
         vI8qd6nQQAoxyyaa48EOKWMQMbPTcX5Bo5dWuU85/rvEm50dk8bXHgzCpNazZ+xWcula
         yIfKRr+YEC6jXdw9tCizqAdQodreEWoIHUGJwKO/T9IJOu73rz1hUmHVgmrnHhIO+dNn
         JlMQ==
X-Gm-Message-State: AOJu0YzCsUelFheKEU+mw/5cL/uEMpOKV1y42imaLScbOmbxXj6dFklB
	wBVmKSFMv9oJ3umKk/ZnCzlr1Ik1tN/3ezLQp6c=
X-Google-Smtp-Source: AGHT+IElUCV1tBN7z3T8PqF76mDlw2yI+JJQJrvkY3fbF7Kd8h10J0xQcAoWiSbWqyJXU4H5PkT7ziqveKo2VLi0OMk=
X-Received: by 2002:ac8:5844:0:b0:428:3018:7ee7 with SMTP id
 h4-20020ac85844000000b0042830187ee7mr918581qth.77.1704195812322; Tue, 02 Jan
 2024 03:43:32 -0800 (PST)
MIME-Version: 1.0
References: <20231219075320.165227-1-ray.huang@amd.com> <20231219075320.165227-4-ray.huang@amd.com>
In-Reply-To: <20231219075320.165227-4-ray.huang@amd.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 2 Jan 2024 15:43:20 +0400
Message-ID: <CAJ+F1CJ7cH3v9vXy+g-2ANZ1MowprW451dhzSDdsSn=P+c7LFg@mail.gmail.com>
Subject: Re: [PATCH v6 03/11] virtio-gpu: Support context init feature with virglrenderer
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
	Julia Zhang <julia.zhang@amd.com>, Chen Jiqian <Jiqian.Chen@amd.com>, 
	Antonio Caggiano <antonio.caggiano@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Dec 19, 2023 at 11:54=E2=80=AFAM Huang Rui <ray.huang@amd.com> wrot=
e:
>
> Patch "virtio-gpu: CONTEXT_INIT feature" has added the context_init
> feature flags.
> We would like to enable the feature with virglrenderer, so add to create
> virgl renderer context with flags using context_id when valid.
>
> Originally-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> ---
>
> Changes in v6:
> - Handle the case while context_init is disabled.
> - Enable context_init by default.
>
>  hw/display/virtio-gpu-virgl.c | 13 +++++++++++--
>  hw/display/virtio-gpu.c       |  4 ++++
>  2 files changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.=
c
> index 8bb7a2c21f..5bbc8071b2 100644
> --- a/hw/display/virtio-gpu-virgl.c
> +++ b/hw/display/virtio-gpu-virgl.c
> @@ -106,8 +106,17 @@ static void virgl_cmd_context_create(VirtIOGPU *g,
>      trace_virtio_gpu_cmd_ctx_create(cc.hdr.ctx_id,
>                                      cc.debug_name);
>
> -    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen,
> -                                  cc.debug_name);
> +#ifdef HAVE_VIRGL_CONTEXT_CREATE_WITH_FLAGS
> +    if (cc.context_init && virtio_gpu_context_init_enabled(g->parent_obj=
.conf)) {
> +        virgl_renderer_context_create_with_flags(cc.hdr.ctx_id,
> +                                                 cc.context_init,
> +                                                 cc.nlen,
> +                                                 cc.debug_name);
> +        return;
> +    }
> +#endif
> +
> +    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen, cc.debug_name)=
;
>  }
>
>  static void virgl_cmd_context_destroy(VirtIOGPU *g,
> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> index b016d3bac8..8b2f4c6be3 100644
> --- a/hw/display/virtio-gpu.c
> +++ b/hw/display/virtio-gpu.c
> @@ -1619,6 +1619,10 @@ static Property virtio_gpu_properties[] =3D {
>      DEFINE_PROP_BIT("blob", VirtIOGPU, parent_obj.conf.flags,
>                      VIRTIO_GPU_FLAG_BLOB_ENABLED, false),
>      DEFINE_PROP_SIZE("hostmem", VirtIOGPU, parent_obj.conf.hostmem, 0),
> +#ifdef HAVE_VIRGL_CONTEXT_CREATE_WITH_FLAGS
> +    DEFINE_PROP_BIT("context_init", VirtIOGPU, parent_obj.conf.flags,
> +                    VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED, true),
> +#endif

Does it make sense to make this configurable? If the context to be
created asked for a capset id but the one created doesn't respect it,
what's the outcome?

It looks like it should instead set cmd->error.

--=20
Marc-Andr=C3=A9 Lureau

