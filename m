Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B48EF821C9D
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jan 2024 14:34:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660686.1030251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKeta-0005E7-NM; Tue, 02 Jan 2024 13:33:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660686.1030251; Tue, 02 Jan 2024 13:33:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKeta-0005Bc-KN; Tue, 02 Jan 2024 13:33:26 +0000
Received: by outflank-mailman (input) for mailman id 660686;
 Tue, 02 Jan 2024 13:33:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nGpE=IM=gmail.com=marcandre.lureau@srs-se1.protection.inumbo.net>)
 id 1rKetY-0005AA-Od
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2024 13:33:24 +0000
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [2607:f8b0:4864:20::82f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 801d3a2e-a973-11ee-98ef-6d05b1d4d9a1;
 Tue, 02 Jan 2024 14:33:23 +0100 (CET)
Received: by mail-qt1-x82f.google.com with SMTP id
 d75a77b69052e-427d5bfe24cso55653611cf.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jan 2024 05:33:23 -0800 (PST)
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
X-Inumbo-ID: 801d3a2e-a973-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704202402; x=1704807202; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EEwnovX2NIh6Wxa8+hZ77jwuvVFwPUA/9RKw8czw9Dc=;
        b=RsERoNfjf5ON88V9yL29sA2wRBWbAB+PFNio3q1TP/2r7r5B22HhfVm/I2rGYNYYL7
         JhhWRkZofoCo9VTnCNetaleuW859EEm0p3JbO8tT2eF91jMXfWG/joRoxxBz+pbL3+u6
         iqgJta8p71a5GRTIkuil/K+PunfcH5Mdi0A+a8LwBPdvX7rhMrrV0a47fELr3+CKABtx
         o67dbDaGOEKfGWP8pAXVxbGWbco1G4LdWpNSujFa2mZza/pOAFROt7jUQAYMPcqAicCy
         cZ73Lxk7M2exotGpn0AvXAwQ9FdWTbp2v4f8ZX/o2M/KeKCCYAoCzFn+tvWRZ6syrZ2I
         t1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704202402; x=1704807202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EEwnovX2NIh6Wxa8+hZ77jwuvVFwPUA/9RKw8czw9Dc=;
        b=i/XPtnCkU5TTcQuaFGt5I5yp2gpVkxTZkK1sEvnwwpd4WyxXUP1y5FihDaZbaNixY7
         tBb88PXbKWeJq2qvOphIYu4ygU0Tj5fD4PUvSIM4BvwaxBB/gxdItcvEWvtW3C9iuGlh
         1Krly1ryVztKwlhmmwH1UJuIqbn6Aoul61gqXF4VQhCkjAgJ5ITSdsRl8Vj161ClkdyB
         MfMJtCBFfQSTps9HIvkxe2BCKMkwcvBK2LHdy3f+PKEzdih0hehp1H1XpH7wgCe7zOR4
         WrjYhNzTiO2rziHcXyA7htVg3ssjoa/ILjqqUW/A9LpLeqj+H3xpC5IEBvoRwEdFECe6
         XkKA==
X-Gm-Message-State: AOJu0Yyj/xYdJmvYCngTEAxAE6o536yE+EXq86pG0llkfv7zRwx+e73o
	9ObWaynEnMAAoi7kx/kkw9jfs/2oUuXiI2lxr/s=
X-Google-Smtp-Source: AGHT+IG0KAjA8lZc5pB7ytIHUlKTzRKAF2WkhpKmMjlwxjZAZ3KCwdr3O3fCHbhBkW143mphlYO3eRUjo88cG0q5eDM=
X-Received: by 2002:a05:622a:6107:b0:428:1915:60de with SMTP id
 hg7-20020a05622a610700b00428191560demr6063368qtb.18.1704202402558; Tue, 02
 Jan 2024 05:33:22 -0800 (PST)
MIME-Version: 1.0
References: <20231219075320.165227-1-ray.huang@amd.com> <20231219075320.165227-11-ray.huang@amd.com>
In-Reply-To: <20231219075320.165227-11-ray.huang@amd.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 2 Jan 2024 17:33:11 +0400
Message-ID: <CAJ+F1C+gQ7kwAD=Tv7uAgKtgA57wPkZcE_zadAogtMUEFUmFnQ@mail.gmail.com>
Subject: Re: [PATCH v6 10/11] virtio-gpu: Initialize Venus
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

On Tue, Dec 19, 2023 at 11:55=E2=80=AFAM Huang Rui <ray.huang@amd.com> wrot=
e:
>
> From: Antonio Caggiano <antonio.caggiano@collabora.com>
>
> Request Venus when initializing VirGL.
>
> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> ---
>
> Changes in v6:
> - Remove the unstable API flags check because virglrenderer is already 1.=
0.
> - Squash the render server flag support into "Initialize Venus".
>
>  hw/display/virtio-gpu-virgl.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.=
c
> index f35a751824..c523a6717a 100644
> --- a/hw/display/virtio-gpu-virgl.c
> +++ b/hw/display/virtio-gpu-virgl.c
> @@ -964,6 +964,10 @@ int virtio_gpu_virgl_init(VirtIOGPU *g)
>      }
>  #endif
>
> +#ifdef VIRGL_RENDERER_VENUS
> +    flags |=3D VIRGL_RENDERER_VENUS | VIRGL_RENDERER_RENDER_SERVER;
> +#endif
> +

I wonder if it's a good idea to initialize venus by default. It
doesn't seem to require vulkan during initialization, but this may
evolve. Make it optional?

>      ret =3D virgl_renderer_init(g, flags, &virtio_gpu_3d_cbs);
>      if (ret !=3D 0) {
>          error_report("virgl could not be initialized: %d", ret);
> --
> 2.25.1
>


--=20
Marc-Andr=C3=A9 Lureau

