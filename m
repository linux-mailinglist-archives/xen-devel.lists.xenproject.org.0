Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A55E821B31
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jan 2024 12:50:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660647.1030200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKdHy-0002lg-TY; Tue, 02 Jan 2024 11:50:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660647.1030200; Tue, 02 Jan 2024 11:50:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKdHy-0002kM-Qu; Tue, 02 Jan 2024 11:50:30 +0000
Received: by outflank-mailman (input) for mailman id 660647;
 Tue, 02 Jan 2024 11:50:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nGpE=IM=gmail.com=marcandre.lureau@srs-se1.protection.inumbo.net>)
 id 1rKdHx-0002kG-Mp
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2024 11:50:29 +0000
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [2607:f8b0:4864:20::82c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f8d5984-a965-11ee-98ef-6d05b1d4d9a1;
 Tue, 02 Jan 2024 12:50:28 +0100 (CET)
Received: by mail-qt1-x82c.google.com with SMTP id
 d75a77b69052e-42782601608so45244651cf.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jan 2024 03:50:28 -0800 (PST)
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
X-Inumbo-ID: 1f8d5984-a965-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704196227; x=1704801027; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwbypJ73LcLsDwIupB/a+pv5MQVKwJbdWWDIfRz9jok=;
        b=b4HkCB0Mm1yFtbbN8kEtXQywMUm330qONPWqLU9XHVgtH6dZQJ0z5RQT2JpIM4NE2L
         ByYjmuPONlocB3/2DztJTP7OOXdQGa4GTVXbgKhIVSRQ4uhSV08UuhX1XD9v1njycAf6
         lEkTRRtPxinjemBSiMSiJvnvIOSCfn6jDLRzpcYKPFqUEI2SKdpM6EYZh+VazZYFqDpi
         dAgc2kzI+cVy8ioxRBbJoo8DtxQN3mtJ/Xjp1KA97g/boUSL1Cqb/YP61xhkBv4RO6EP
         NzXUnPEDYiZgEFziC03Pp6TYFju37oTFYW4Ux4MIL0NolX7JrXdc/pXwI8RBj6Iie5Kl
         7wAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704196227; x=1704801027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QwbypJ73LcLsDwIupB/a+pv5MQVKwJbdWWDIfRz9jok=;
        b=VOZBMNqQQqNksDDnSFxIr6f19tVVNEAXSaNZZnkMDqT8xo11pC0dzeAIA98FtavWrx
         S43+918RbANPvOkJsaEHxU9s8R+MFMPiTI+LWYX103yQZZCF2pRWT9arZ11a7Y5STD7a
         TEa1ga0I3zMNhYICyRquO8RIiv8d7RzmBH/y9Wta3tgY+Mtsu5nLj+GbjDhU0ctrFYRT
         IITVCl+ge5tsxzAR9VgUL4bUtHVmSNfW1w7Gq062QESUejEVe1E6hzj6zkPeMRj68QBA
         n4rKSCFStUm+EUUvl190wRQ2lCMYQuJQpio6kV/uqAI5i3ebUTrYTkP347k3R+yrwuEF
         atow==
X-Gm-Message-State: AOJu0YwmydwVoDDkK3W8UmPjHYHZgPkC7zkPZUTak3GsBs5ed0wT3W7e
	AXwMTyNAdkq7I30y4M3BCUKBHyLyDqIjOv1Tu34=
X-Google-Smtp-Source: AGHT+IGotzR+IbHSvLyCTquJ++TDP/oxY3q2zmw1Iu0n3CSYZAH8Gw3eD1Fr7WRXBgiyURwS/8vn0RIOkL1U8tBC/70=
X-Received: by 2002:ac8:5788:0:b0:427:f474:89c3 with SMTP id
 v8-20020ac85788000000b00427f47489c3mr8227656qta.121.1704196227540; Tue, 02
 Jan 2024 03:50:27 -0800 (PST)
MIME-Version: 1.0
References: <20231219075320.165227-1-ray.huang@amd.com> <20231219075320.165227-5-ray.huang@amd.com>
In-Reply-To: <20231219075320.165227-5-ray.huang@amd.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 2 Jan 2024 15:50:16 +0400
Message-ID: <CAJ+F1C+gu0Jh9KSJK5jgUx0xOq7Da0wkN+U0zOBLffC3wDgVpA@mail.gmail.com>
Subject: Re: [PATCH v6 04/11] virtio-gpu: Don't require udmabuf when blobs and
 virgl are enabled
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

On Tue, Dec 19, 2023 at 11:54=E2=80=AFAM Huang Rui <ray.huang@amd.com> wrot=
e:
>
> From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>
> The udmabuf usage is mandatory when virgl is disabled and blobs feature
> enabled in the Qemu machine configuration. If virgl and blobs are enabled=
,
> then udmabuf requirement is optional. Since udmabuf isn't widely supporte=
d
> by a popular Linux distros today, let's relax the udmabuf requirement for
> blobs=3Don,virgl=3Don. Now, a full-featured virtio-gpu acceleration is
> available to Qemu users without a need to have udmabuf available in the
> system.
>
> Reviewed-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>
> No change in v6.
>
>  hw/display/virtio-gpu.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> index 8b2f4c6be3..4c3ec9d0ea 100644
> --- a/hw/display/virtio-gpu.c
> +++ b/hw/display/virtio-gpu.c
> @@ -1443,6 +1443,7 @@ void virtio_gpu_device_realize(DeviceState *qdev, E=
rror **errp)
>
>      if (virtio_gpu_blob_enabled(g->parent_obj.conf)) {
>          if (!virtio_gpu_rutabaga_enabled(g->parent_obj.conf) &&
> +            !virtio_gpu_virgl_enabled(g->parent_obj.conf) &&
>              !virtio_gpu_have_udmabuf()) {
>              error_setg(errp, "need rutabaga or udmabuf for blob resource=
s");
>              return;
> --
> 2.25.1
>


--=20
Marc-Andr=C3=A9 Lureau

