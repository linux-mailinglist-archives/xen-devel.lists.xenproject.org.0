Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 945EB7A5D42
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 11:02:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604494.941900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiWd7-0002XX-Uh; Tue, 19 Sep 2023 09:02:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604494.941900; Tue, 19 Sep 2023 09:02:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiWd7-0002Uk-S6; Tue, 19 Sep 2023 09:02:49 +0000
Received: by outflank-mailman (input) for mailman id 604494;
 Tue, 19 Sep 2023 09:02:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vJAK=FD=gmail.com=marcandre.lureau@srs-se1.protection.inumbo.net>)
 id 1qiWd7-0002Uc-31
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 09:02:49 +0000
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [2607:f8b0:4864:20::82a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4dc055ef-56cb-11ee-8789-cb3800f73035;
 Tue, 19 Sep 2023 11:02:48 +0200 (CEST)
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-414b3da2494so33734491cf.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Sep 2023 02:02:48 -0700 (PDT)
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
X-Inumbo-ID: 4dc055ef-56cb-11ee-8789-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695114167; x=1695718967; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ND+2Cd2f8q8DTCVTY8iiypxhEp8aFLppxW2F9VQBRQ4=;
        b=BhkC7IZsi3+2Gka35z3iEQW4J7m36goreyDFyWOGV9kuHRDh1/W4cftqQhPSKAdQI+
         b8jGZoL1F0ZE5mjxjNGSsEee6cfruR7kdlQc4mqTeTGAk2GUU7sYNSjB3RG87xb9L1vo
         s8UTFAlQT094IxCGESLWAgThrCRYAaRb7Fzv+LZmZyzcqLpkGDpX1G/VIRnTJWdaGtMD
         reeEHlNIj/gfhvfeMFjQMjAXjlPGFinickUm7Emp7Ij6ytTmtYezMjJufJY3KP2oEVt6
         A141tmnUqPCdInpWCzU6gdOphaVQJj3DUIh9D70S/7/xzMi2OpH8hg2nxCfIRduwHPww
         8sKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695114167; x=1695718967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ND+2Cd2f8q8DTCVTY8iiypxhEp8aFLppxW2F9VQBRQ4=;
        b=CefBqoNmTbiCaVOd9llTNvEhMQzrcV07t5qvw3YxOCfkDMyZcYz7kJUNsXvDibybbT
         cAsoJL2otlCx2HMG/5jV6lGgQ0Qn5Aw6STRpH3luY9VTXoEzi6WRWa/ydB70K86A/cU0
         OpdemZW4M6IYaMRdYAM4Uoeh3qeXbWDzPeAE3m6QRa2y9+hOk/zSPmgRhR0R8Ik4p6U2
         FkDsuCbkXps1qHFI9ltBsQaGsrZyC9IJsGwVYA3WRdRRYKQLv59LMZbJBsNo1oOztRzn
         6na9OWy6tdGkmFi75L8PoqcPWAersQ6jMu0Dad2RVa4jQRygQqALRoHZSqRM122W/m0E
         TUHQ==
X-Gm-Message-State: AOJu0YwIdBglnqzIBew6XCsK75Mc1ELi7VbBB2MfTVouzoAChwniHe02
	GGPmMY01P3Uympy4AmbfBKOxjIDWv5Xpf+SQUb1Sg3CW74aMJw==
X-Google-Smtp-Source: AGHT+IGChCz4TECfH811U/m/F4mFC9MdWzVWs4DMJgpjYjtS/oH22r6seHdiRpej/iz1PIscZ6RnbPplDdc39F2tjEA=
X-Received: by 2002:a05:622a:1ba4:b0:412:6f:9ead with SMTP id
 bp36-20020a05622a1ba400b00412006f9eadmr12961809qtb.14.1695114167189; Tue, 19
 Sep 2023 02:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230915111130.24064-1-ray.huang@amd.com> <20230915111130.24064-12-ray.huang@amd.com>
In-Reply-To: <20230915111130.24064-12-ray.huang@amd.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 19 Sep 2023 13:02:36 +0400
Message-ID: <CAJ+F1CJ8R7j_1k3yC2GsdN_v8CsOQ7R+=n_0CCzFW98tWrSLhA@mail.gmail.com>
Subject: Re: [QEMU PATCH v5 11/13] virtio-gpu: Support Venus capset
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
> Add support for the Venus capset, which enables Vulkan support through
> the Venus Vulkan driver for virtio-gpu.
>
> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> ---
>
> V4 -> V5:
>     - Send kernel patch to define VIRTIO_GPU_CAPSET_VENUS and will use
>       another patch to sync up linux headers. (Akihiko)
>     - https://lore.kernel.org/lkml/20230915105918.3763061-1-ray.huang@amd=
.com/

Ok but in the meantime, you should have that header update patch in
the series too, otherwise we can't compile it :)

thanks

>
>  hw/display/virtio-gpu-virgl.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.=
c
> index 8a017dbeb4..7f95490e90 100644
> --- a/hw/display/virtio-gpu-virgl.c
> +++ b/hw/display/virtio-gpu-virgl.c
> @@ -437,6 +437,11 @@ static void virgl_cmd_get_capset_info(VirtIOGPU *g,
>          virgl_renderer_get_cap_set(resp.capset_id,
>                                     &resp.capset_max_version,
>                                     &resp.capset_max_size);
> +    } else if (info.capset_index =3D=3D 2) {
> +        resp.capset_id =3D VIRTIO_GPU_CAPSET_VENUS;
> +        virgl_renderer_get_cap_set(resp.capset_id,
> +                                   &resp.capset_max_version,
> +                                   &resp.capset_max_size);
>      } else {
>          resp.capset_max_version =3D 0;
>          resp.capset_max_size =3D 0;
> @@ -901,10 +906,18 @@ int virtio_gpu_virgl_init(VirtIOGPU *g)
>
>  int virtio_gpu_virgl_get_num_capsets(VirtIOGPU *g)
>  {
> -    uint32_t capset2_max_ver, capset2_max_size;
> +    uint32_t capset2_max_ver, capset2_max_size, num_capsets;
> +    num_capsets =3D 1;
> +
>      virgl_renderer_get_cap_set(VIRTIO_GPU_CAPSET_VIRGL2,
> -                              &capset2_max_ver,
> -                              &capset2_max_size);
> +                               &capset2_max_ver,
> +                               &capset2_max_size);
> +    num_capsets +=3D capset2_max_ver ? 1 : 0;
> +
> +    virgl_renderer_get_cap_set(VIRTIO_GPU_CAPSET_VENUS,
> +                               &capset2_max_ver,
> +                               &capset2_max_size);
> +    num_capsets +=3D capset2_max_size ? 1 : 0;
>
> -    return capset2_max_ver ? 2 : 1;
> +    return num_capsets;
>  }
> --
> 2.34.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

