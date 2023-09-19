Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C16497A5C4B
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 10:18:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604446.941818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiVvh-0006oR-T9; Tue, 19 Sep 2023 08:17:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604446.941818; Tue, 19 Sep 2023 08:17:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiVvh-0006lt-QA; Tue, 19 Sep 2023 08:17:57 +0000
Received: by outflank-mailman (input) for mailman id 604446;
 Tue, 19 Sep 2023 08:17:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vJAK=FD=gmail.com=marcandre.lureau@srs-se1.protection.inumbo.net>)
 id 1qiVvg-0006ll-Hd
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 08:17:56 +0000
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [2607:f8b0:4864:20::729])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08be296b-56c5-11ee-8789-cb3800f73035;
 Tue, 19 Sep 2023 10:17:55 +0200 (CEST)
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-76dbe263c68so240552285a.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Sep 2023 01:17:55 -0700 (PDT)
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
X-Inumbo-ID: 08be296b-56c5-11ee-8789-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695111474; x=1695716274; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6XmqpxXe+pFJEvymDTF8JR4Ea1fwE1Z3SOQg5pG66Q=;
        b=LOE+4Jxxi9Z9a3Fm+wO6efLVjPscqnvqAM1xF8Udx/jfaO8OuoE7hC4Y4J9cVcy5Go
         5xBitqvIB1nd41yYMxvH1gywC6/w18IY5oA6SWg8yTTdalOn1hzyiyZyzMplDcLKXRn+
         eCqHoLJrQZPFqFs4wvlWM9dBvEPxwJMVZ/mRoTKjPJI4poffeqm5032a+3jj6XhXCxsK
         IMQontsTP0FF+TbYBJ4BBWwrHNw6d8B1dJ6XNU8ZZePHr+ab85kxjQIG1cY3jvzXkfO6
         nAP7KiodVeyhxL+cdHIt9CuJSMUXBhssNXFeldTpsib7EKzt6qpvvCZs2Sf/Yz62ztA/
         WMiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695111474; x=1695716274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6XmqpxXe+pFJEvymDTF8JR4Ea1fwE1Z3SOQg5pG66Q=;
        b=TiolRxfayje54fui+P8kOfor9R0+c3PD5HftcTDQFlgoSBQrdc1RIiDq6expvDYdc7
         KMRij34EQDUft85X9DmjMoLLnlUBMoEOBDgStaGyEV3FGUKBBnqhj2AuoVQsCf1Pzfq2
         hkSwNJLPjW+ovgmgh2L4PLIaijpwqPkL/0I1Do2bFl61fRaUJyogSG4jhacW2BVNBw3K
         AYiPhvcRkulQHEe4TSvMjAi6olD58TRtdfjGM9zFkl1PAVvm++Td02N4jXpWEVo/HCck
         0KgwCYrBW6Z7OboUW4rpDcG+IX2Nn00GxEIfRDycUsiRyTV2rLM1zSvs+tJlAXqFQbl3
         DZuw==
X-Gm-Message-State: AOJu0YwOvx9EhAy+vqZC50ew/lF2Veitbsh71RCqcCsFjxJdo0euMrpM
	A9/uamca677wfIUjYimS9YWLnVZu6mo/75PVaog=
X-Google-Smtp-Source: AGHT+IFrojAXgVVGst6JFQ0C2v6XMWIlWUwMMsKEePdzd+QZppOC/bSo9UUG0gwct+RD/tgsIxswtt+y5ED36ahcmWw=
X-Received: by 2002:a05:620a:2a15:b0:767:c30:517 with SMTP id
 o21-20020a05620a2a1500b007670c300517mr2947653qkp.3.1695111474434; Tue, 19 Sep
 2023 01:17:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230915111130.24064-1-ray.huang@amd.com> <20230915111130.24064-6-ray.huang@amd.com>
In-Reply-To: <20230915111130.24064-6-ray.huang@amd.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 19 Sep 2023 12:17:43 +0400
Message-ID: <CAJ+F1CK6_vDhh_=2kvHXkba8HYTvTuCP9ov-xW9EJ76SB4toWQ@mail.gmail.com>
Subject: Re: [QEMU PATCH v5 05/13] virtio-gpu: Configure context init for virglrenderer
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

On Fri, Sep 15, 2023 at 6:16=E2=80=AFPM Huang Rui <ray.huang@amd.com> wrote=
:
>
> Configure context init feature flag for virglrenderer.
>
> Originally-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> ---
>
> V4 -> V5:
>     - Inverted patch 5 and 6 because we should configure
>       HAVE_VIRGL_CONTEXT_INIT firstly. (Philippe)
>
>  meson.build | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meson.build b/meson.build
> index 98e68ef0b1..ff20d3c249 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1068,6 +1068,10 @@ if not get_option('virglrenderer').auto() or have_=
system or have_vhost_user_gpu
>                                         prefix: '#include <virglrenderer.=
h>',
>                                         dependencies: virgl))
>    endif
> +  config_host_data.set('HAVE_VIRGL_CONTEXT_INIT',
> +                       cc.has_function('virgl_renderer_context_create_wi=
th_flags',
> +                                       prefix: '#include <virglrenderer.=
h>',
> +                                       dependencies: virgl))

Move it under the "if virgl.found()" block above.

I suggest to name it after what is actually checked:
HAVE_VIRGL_CONTEXT_CREATE_WITH_FLAGS for ex

>  endif
>  blkio =3D not_found
>  if not get_option('blkio').auto() or have_block
> --
> 2.34.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

