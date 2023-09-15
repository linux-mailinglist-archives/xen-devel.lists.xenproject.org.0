Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 930C17A1B75
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 11:57:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602979.939834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh5ZE-0000Ci-El; Fri, 15 Sep 2023 09:56:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602979.939834; Fri, 15 Sep 2023 09:56:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh5ZE-00009o-Bo; Fri, 15 Sep 2023 09:56:52 +0000
Received: by outflank-mailman (input) for mailman id 602979;
 Fri, 15 Sep 2023 09:56:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fBSG=E7=redhat.com=aesteve@srs-se1.protection.inumbo.net>)
 id 1qh5ZC-00009h-TU
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 09:56:51 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e27dca6-53ae-11ee-9b0d-b553b5be7939;
 Fri, 15 Sep 2023 11:56:46 +0200 (CEST)
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-159-91wgk6tnP7KlUjB_IxAYsQ-1; Fri, 15 Sep 2023 05:56:43 -0400
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-26d43d10ce5so1741738a91.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Sep 2023 02:56:43 -0700 (PDT)
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
X-Inumbo-ID: 2e27dca6-53ae-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694771805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BkKKS6tSB+26FQ9BzwmsrnIMDYjN2TJ+MfbPbKPVSpI=;
	b=XYs9qv5xM3kMUTE161gEGlZcPaWIszQ3R8mtttYZR0JdJDcUKqDwfKQ7bGkFSy4jwo2rT/
	UKwWzvtebRudtOnH/1YEAwrO+pAXJNyS3xen8JaiqKp/+UusX6R/VL42bN1VaTycTKkC0l
	5D+/JSNTQl4jE9MKeS4gM3sFyzfHcm0=
X-MC-Unique: 91wgk6tnP7KlUjB_IxAYsQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694771803; x=1695376603;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BkKKS6tSB+26FQ9BzwmsrnIMDYjN2TJ+MfbPbKPVSpI=;
        b=Yd65QiUyYbOmwd7wwlpoHft7y2N2l95JOJSFwIavx6KinqWaG5zXeRkcIczCDyFTzA
         gzUYuaF0UwvovkqIgOBjyCS2Yj7tMF+7gsGnmgDEy5uDAFINePYnskdzkdyseFvdI12L
         sbKA637fF8nkM6Oaz5x59YsX1BFoCYQT0AaY3JJ8zhvecsY0Ar02jsmbr7myxq0H0CUS
         LIjqjfvpVOp/I/Zk3nHTneSUmvlDiKexKJ+nTUyB4MVy5M0FeYs2ACx0KSWf03FQIB9o
         +4lAttIYqXASN5bYqp7ALb8qmdImRqc9vtt7QzQdIzKU+zmhYgMIjySkPQRXPUuo9NIn
         XzgA==
X-Gm-Message-State: AOJu0Yyp0RCJyL30VvDgYlEiR4LiNCzaLOR4agUwxH/KlqfHWAAIwuwm
	xWbqqcZEr6+1Lea5+RcyTUy9YXj2FgEchMGfjOlgxQVegM0pvlTYvOoqxPAXUdPle4YIZn0NX94
	0zMCK9sjtpJBPlHAudlx5leIGWNPsp0PCjno8cTkQEkk=
X-Received: by 2002:a17:90a:fc8a:b0:268:ac3:b1f6 with SMTP id ci10-20020a17090afc8a00b002680ac3b1f6mr920397pjb.24.1694771802744;
        Fri, 15 Sep 2023 02:56:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEK4dpZu0G+oM9juAeEj5vPzg590LF150ygT+s4QJb92uJBXaK0GIJhAxzCXSXBb03Huwrt5NdX+OZNXsY0uAs=
X-Received: by 2002:a17:90a:fc8a:b0:268:ac3:b1f6 with SMTP id
 ci10-20020a17090afc8a00b002680ac3b1f6mr920386pjb.24.1694771802376; Fri, 15
 Sep 2023 02:56:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230831093252.2461282-1-ray.huang@amd.com> <20230831093252.2461282-11-ray.huang@amd.com>
 <58a4e81f-b0ce-49db-8a6a-f6b5bdc3d2d6@daynix.com> <ZPw2UjxogIULU722@amd.com>
 <11c227e8-a464-41ce-a435-82c570746388@daynix.com> <CADSE00Kc1Jza7sbERRndWbXgoF1s2V-FNxEOWJ6WgvomzgvMPA@mail.gmail.com>
 <cf99ac00-6f48-4778-b319-6079a931ba5d@daynix.com> <CADSE00+6zcT7iKR0JW1Bk8es6HtBpzAKa9JW6u5yyjDoLPw2KQ@mail.gmail.com>
 <5e88f5d5-5aa2-4052-b250-69c2a443344f@daynix.com> <CADSE00+BUq-6jKH3v2PYNThn+9Z4UCFcr3Cv9Z48eUX0b=6ymA@mail.gmail.com>
 <3918c96c-f106-494d-8e97-6d86cef8df27@daynix.com> <CADSE00LNYm+vKaYwnTAdECGUXPCfiJ7aLqszDuqSzCLLhVOHhQ@mail.gmail.com>
 <0adaf816-e050-43c3-8284-fc41627543ef@daynix.com> <CADSE00Kyid+=FkkopSGDAyeJ_MY2exDdxoPf18pzthKy70kkKg@mail.gmail.com>
 <391f745f-d00f-4289-be68-7590bceb902d@daynix.com>
In-Reply-To: <391f745f-d00f-4289-be68-7590bceb902d@daynix.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 15 Sep 2023 11:56:31 +0200
Message-ID: <CADSE00K+fva9TXZOnet3bYWkU_kiFpW3oEjxJX-mXL_gFhvXkQ@mail.gmail.com>
Subject: Re: [QEMU PATCH v4 10/13] virtio-gpu: Resource UUID
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	"Michael S . Tsirkin" <mst@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, 
	Antonio Caggiano <antonio.caggiano@collabora.com>, 
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>, Robert Beckett <bob.beckett@collabora.com>, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Gurchetan Singh <gurchetansingh@chromium.org>, "ernunes@redhat.com" <ernunes@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Alyssa Ross <hi@alyssa.is>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	"Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>, 
	"Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>, 
	"Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>, 
	"Huang, Honglei1" <Honglei1.Huang@amd.com>, "Zhang, Julia" <Julia.Zhang@amd.com>, 
	"Chen, Jiqian" <Jiqian.Chen@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000041a695060562cf91"

--00000000000041a695060562cf91
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 14, 2023 at 6:56=E2=80=AFPM Akihiko Odaki <akihiko.odaki@daynix=
.com>
wrote:

> On 2023/09/14 17:29, Albert Esteve wrote:
> >
> >
> > On Thu, Sep 14, 2023 at 9:17=E2=80=AFAM Akihiko Odaki <akihiko.odaki@da=
ynix.com
> > <mailto:akihiko.odaki@daynix.com>> wrote:
> >
> >     On 2023/09/13 23:18, Albert Esteve wrote:
> >      >
> >      >
> >      > On Wed, Sep 13, 2023 at 3:43=E2=80=AFPM Akihiko Odaki
> >     <akihiko.odaki@daynix.com <mailto:akihiko.odaki@daynix.com>
> >      > <mailto:akihiko.odaki@daynix.com
> >     <mailto:akihiko.odaki@daynix.com>>> wrote:
> >      >
> >      >     On 2023/09/13 21:58, Albert Esteve wrote:
> >      >      >
> >      >      >
> >      >      > On Wed, Sep 13, 2023 at 2:22=E2=80=AFPM Akihiko Odaki
> >      >     <akihiko.odaki@daynix.com <mailto:akihiko.odaki@daynix.com>
> >     <mailto:akihiko.odaki@daynix.com <mailto:akihiko.odaki@daynix.com>>
> >      >      > <mailto:akihiko.odaki@daynix.com
> >     <mailto:akihiko.odaki@daynix.com>
> >      >     <mailto:akihiko.odaki@daynix.com
> >     <mailto:akihiko.odaki@daynix.com>>>> wrote:
> >      >      >
> >      >      >     On 2023/09/13 20:34, Albert Esteve wrote:
> >      >      >      >
> >      >      >      >
> >      >      >      > On Wed, Sep 13, 2023 at 12:34=E2=80=AFPM Akihiko O=
daki
> >      >      >     <akihiko.odaki@daynix.com
> >     <mailto:akihiko.odaki@daynix.com> <mailto:akihiko.odaki@daynix.com
> >     <mailto:akihiko.odaki@daynix.com>>
> >      >     <mailto:akihiko.odaki@daynix.com
> >     <mailto:akihiko.odaki@daynix.com> <mailto:akihiko.odaki@daynix.com
> >     <mailto:akihiko.odaki@daynix.com>>>
> >      >      >      > <mailto:akihiko.odaki@daynix.com
> >     <mailto:akihiko.odaki@daynix.com>
> >      >     <mailto:akihiko.odaki@daynix.com
> >     <mailto:akihiko.odaki@daynix.com>>
> >      >      >     <mailto:akihiko.odaki@daynix.com
> >     <mailto:akihiko.odaki@daynix.com>
> >      >     <mailto:akihiko.odaki@daynix.com
> >     <mailto:akihiko.odaki@daynix.com>>>>> wrote:
> >      >      >      >
> >      >      >      >     On 2023/09/13 16:55, Albert Esteve wrote:
> >      >      >      >      > Hi Antonio,
> >      >      >      >      >
> >      >      >      >      > If I'm not mistaken, this patch is related
> with:
> >      >      >      >      >
> >      >      >      >
> >      >      >
> >      >
> >     https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html
> >     <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.htm=
l
> >
> >      >
> >       <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html>>
> >      >      >
> >      >
> >       <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html> <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html>>>
> >      >      >      >
> >      >      >
> >      >
> >       <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html> <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html>> <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html> <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html>>>>
> >      >      >      >      >
> >      >      >      >
> >      >      >
> >      >
> >       <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html> <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html>> <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html> <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html>>>
> >      >      >      >
> >      >      >
> >      >
> >       <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html> <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html>> <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html> <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html>>>>>
> >      >      >      >      > IMHO, ideally, virtio-gpu and vhost-user-gp=
u
> >     both,
> >      >     would
> >      >      >     use the
> >      >      >      >      > infrastructure from the patch I linked to
> >     store the
> >      >      >      >      > virtio objects, so that they can be later
> >     shared with
> >      >      >     other devices.
> >      >      >      >
> >      >      >      >     I don't think such sharing is possible because
> the
> >      >     resources are
> >      >      >      >     identified by IDs that are local to the device=
.
> >     That also
> >      >      >     complicates
> >      >      >      >     migration.
> >      >      >      >
> >      >      >      >     Regards,
> >      >      >      >     Akihiko Odaki
> >      >      >      >
> >      >      >      > Hi Akihiko,
> >      >      >      >
> >      >      >      > As far as I understand, the feature to export
> >      >     dma-bufs from the
> >      >      >      > virtgpu was introduced as part of the virtio
> >     cross-device
> >      >     sharing
> >      >      >      > proposal [1]. Thus, it shall be posible. When
> >      >     virtgpu ASSING_UUID,
> >      >      >      > it exports and identifies the dmabuf resource, so
> that
> >      >     when the
> >      >      >     dmabuf gets
> >      >      >      > shared inside the guest (e.g., with virtio-video),
> >     we can
> >      >     use the
> >      >      >     assigned
> >      >      >      > UUID to find the dmabuf in the host (using the
> >     patch that I
> >      >      >     linked above),
> >      >      >      > and import it.
> >      >      >      >
> >      >      >      > [1] - https://lwn.net/Articles/828988/
> >     <https://lwn.net/Articles/828988/>
> >      >     <https://lwn.net/Articles/828988/
> >     <https://lwn.net/Articles/828988/>>
> >      >      >     <https://lwn.net/Articles/828988/
> >     <https://lwn.net/Articles/828988/>
> >      >     <https://lwn.net/Articles/828988/
> >     <https://lwn.net/Articles/828988/>>>
> >      >     <https://lwn.net/Articles/828988/
> >     <https://lwn.net/Articles/828988/> <https://lwn.net/Articles/828988=
/
> >     <https://lwn.net/Articles/828988/>>
> >      >      >     <https://lwn.net/Articles/828988/
> >     <https://lwn.net/Articles/828988/>
> >      >     <https://lwn.net/Articles/828988/
> >     <https://lwn.net/Articles/828988/>>>>
> >      >      >
> >      >      >     The problem is that virtio-gpu can have other kind of
> >      >     resources like
> >      >      >     pixman and OpenGL textures and manage them and
> >     DMA-BUFs with
> >      >     unified
> >      >      >     resource ID.
> >      >      >
> >      >      >
> >      >      > I see.
> >      >      >
> >      >      >
> >      >      >     So you cannot change:
> >      >      >     g_hash_table_insert(g->resource_uuids,
> >      >      >     GUINT_TO_POINTER(assign.resource_id), uuid);
> >      >      >     by:
> >      >      >     virtio_add_dmabuf(uuid, assign.resource_id);
> >      >      >
> >      >      >     assign.resource_id is not DMA-BUF file descriptor, an=
d
> the
> >      >     underlying
> >      >      >     resource my not be DMA-BUF at first place.
> >      >      >
> >      >      >
> >      >      > I didn't really look into the patch in-depth, so the code
> was
> >      >     intended
> >      >      > to give an idea of how the implementation would look like
> with
> >      >      > the cross-device patch API. Indeed, it is not the
> resource_id,
> >      >      > (I just took a brief look at the virtio
> >     specificacion 1.2), but the
> >      >      > underlying
> >      >      > resource what we want to use here.
> >      >      >
> >      >      >
> >      >      >     Also, since this lives in the common code that is not
> used
> >      >     only by
> >      >      >     virtio-gpu-gl but also virtio-gpu, which supports
> >     migration,
> >      >     we also
> >      >      >     need to take care of that. It is not a problem for
> >     DMA-BUF as
> >      >      >     DMA-BUF is
> >      >      >     not migratable anyway, but the situation is different
> >     in this
> >      >     case.
> >      >      >
> >      >      >     Implementing cross-device sharing is certainly a
> >     possibility,
> >      >     but that
> >      >      >     requires more than dealing with DMA-BUFs.
> >      >      >
> >      >      >
> >      >      > So, if I understood correctly, dmabufs are just a subset
> >     of the
> >      >     resources
> >      >      > that the gpu manages, or can assign UUIDs to. I am not
> >     sure why
> >      >      > the virt gpu driver would want to send a ASSIGN_UUID for
> >     anything
> >      >      > that is not a dmabuf (are we sure it does?), but I am not
> >     super
> >      >     familiarized
> >      >      > with virtgpu to begin with.
> >      >
> >      >     In my understanding, an resource will be first created as
> >     OpenGL or
> >      >     Vulkan textures and then exported as a DMA-BUF file
> >     descriptor. For
> >      >     these resource types exporting/importing code is mandatory.
> >      >
> >      >     For pixman buffers (i.e., non-virgl device), I don't see a
> >     compelling
> >      >     reason to have cross-device sharing. It is possible to omit
> >     resource
> >      >     UUID feature from non-virgl device to avoid implementing
> >     complicated
> >      >     migration.
> >      >
> >      >
> >      > I see, thanks for the clarification.
> >      > I would assume you could avoid the UUID feature for those
> >     resources, but
> >      > I will need to check the driver implementation. It is worth
> checking
> >      > though, if
> >      > that would simplify the implementation.
> >      >
> >      >
> >      >      > But I see that internally, the GPU specs relate a UUID
> with a
> >      >     resource_id,
> >      >      > so we still need both tables:
> >      >      > - one to relate UUID with resource_id to be able to locat=
e
> the
> >      >      > underlying resource
> >      >      > - the table that holds the dmabuf with the UUID for
> >     cross-device
> >      >     sharing
> >      >      >
> >      >      > With that in mind, sounds to me that the support for
> >     cross-device
> >      >      > sharing could
> >      >      > be added on top of this patch, once
> >      >      >
> >      >
> >     https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01850.html
> >     <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01850.htm=
l
> >
> >      >
> >       <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01850.html <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01850.html>>
> >      >      >
> >      >
> >       <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01850.html <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01850.html>
> >      >
> >       <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01850.html <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01850.html>>>
> >      >      > lands.
> >      >
> >      >     That is possible, but I think it's better to implement
> >     cross-device
> >      >     sharing at the same time introducing virtio-dmabuf.
> >      >
> >      >     The current design of virtio-dmabuf looks somewhat
> >     inconsistent; it's
> >      >     named "dmabuf", but internally the UUIDs are stored into
> >     something
> >      >     named
> >      >     "resource_uuids" and it has SharedObjectType so it's more
> like a
> >      >     generic
> >      >     resource sharing mechanism. If you actually have an
> >     implementation of
> >      >     cross-device sharing using virtio-dmabuf, it will be clear
> >     what kind of
> >      >     feature is truly necessary.
> >      >
> >      >
> >      > Yeah, the file was named as virtio-dmabuf following the kernel
> >      > implementation. Also, because for the moment it only aims to sha=
re
> >      > dmabufs. However, virtio specs leave the virtio object
> >     defintion vague [1]
> >      > (I guess purposely). It is up to the specific devices to define
> >     what an
> >      > object
> >      > means for them. So the implementation tries to follow that, and
> >      > leave the contents of the table generic. The table can hold any
> >     kind of
> >      > object,
> >      > and the API exposes type-specific functions (for dmabufs, or
> others).
> >     In the guest kernel, the name "virtio_dma_buf" represents the
> interface
> >     between the *guest* kernel and *guest* user-space. It makes sense
> since
> >     the cross-device resource sharing is managed by the userspace and
> >     DMA-BUF is the only interface between them for this purpose.
> >
> >     The situation is different for QEMU; QEMU interacts with backends
> using
> >     backend-specific interfaces (OpenGL/pixman) and virgl is capable to
> >     export textures as DMA-BUF. DMA-BUF is not universal in this sense.
> As
> >     such, we cannot just borrow the kernel-side naming but invent one.
> >
> > It is not a gpu-specific feature. It is a generic cross-device sharing
> > mechanism for virtio objects. In this case, virtio objects happen to be
> > dmabufs in this first iteration. Hence, the name.
> >
> > virtio-gpu (and vhost-user-gpu) will use this feature only with virgl,
> > that is
> > fine, and transversal to the object-sharing mechanism. It allows
> > to share dmabufs in the host following how they are shared in the guest=
.
> > The virtgpu driver may call ASSIGN_UUID for other types of resources
> > (not sure,
> > but could be), but they will never be shared with other virtio devices.
> > So they are not too relevant. Also, the shared objects table could
> > potentially
> > be accessed from any virtio device, not only virtio-gpu or virtio-video=
.
>
> The virtgpu driver will call ASSIGN_UUID for resources that are backed
> with pixman buffer. What is used as the backing store for resources is
> an implementation detail of VMM and the guest cannot know it. For the
> guest, they are same kind of resources (2D images).
>
> Ok, got it. In any case, those resources that are actually backed by a
dmabuf
ought to be shared using virtio_dmabuf. I think that is the key point of
this discussion.

That support can be added once both this patch and the virtio_dmabuf land.

--00000000000041a695060562cf91
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr" class=3D"gmail_sign=
ature"><div dir=3D"ltr"><br></div></div></div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 14, 2023 at 6:56=
=E2=80=AFPM Akihiko Odaki &lt;<a href=3D"mailto:akihiko.odaki@daynix.com">a=
kihiko.odaki@daynix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On 2023/09/14 17:29, Albert Esteve wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Thu, Sep 14, 2023 at 9:17=E2=80=AFAM Akihiko Odaki &lt;<a href=3D"m=
ailto:akihiko.odaki@daynix.com" target=3D"_blank">akihiko.odaki@daynix.com<=
/a> <br>
&gt; &lt;mailto:<a href=3D"mailto:akihiko.odaki@daynix.com" target=3D"_blan=
k">akihiko.odaki@daynix.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 2023/09/13 23:18, Albert Esteve wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; On Wed, Sep 13, 2023 at 3:43=E2=80=AFPM Akihi=
ko Odaki<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:akihiko.odaki@daynix.com" tar=
get=3D"_blank">akihiko.odaki@daynix.com</a> &lt;mailto:<a href=3D"mailto:ak=
ihiko.odaki@daynix.com" target=3D"_blank">akihiko.odaki@daynix.com</a>&gt;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &lt;mailto:<a href=3D"mailto:akihiko.odaki@da=
ynix.com" target=3D"_blank">akihiko.odaki@daynix.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:akihiko.odaki@daynix.c=
om" target=3D"_blank">akihiko.odaki@daynix.com</a>&gt;&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0On 2023/09/13 21:58, Alber=
t Esteve wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; On Wed, Sep 13, 2023=
 at 2:22=E2=80=AFPM Akihiko Odaki<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:akih=
iko.odaki@daynix.com" target=3D"_blank">akihiko.odaki@daynix.com</a> &lt;ma=
ilto:<a href=3D"mailto:akihiko.odaki@daynix.com" target=3D"_blank">akihiko.=
odaki@daynix.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:akihiko.odaki@daynix.c=
om" target=3D"_blank">akihiko.odaki@daynix.com</a> &lt;mailto:<a href=3D"ma=
ilto:akihiko.odaki@daynix.com" target=3D"_blank">akihiko.odaki@daynix.com</=
a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; &lt;mailto:<a href=
=3D"mailto:akihiko.odaki@daynix.com" target=3D"_blank">akihiko.odaki@daynix=
.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:akihiko.odaki@daynix.c=
om" target=3D"_blank">akihiko.odaki@daynix.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mail=
to:akihiko.odaki@daynix.com" target=3D"_blank">akihiko.odaki@daynix.com</a>=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:akihiko.odaki@daynix.c=
om" target=3D"_blank">akihiko.odaki@daynix.com</a>&gt;&gt;&gt;&gt; wrote:<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0O=
n 2023/09/13 20:34, Albert Esteve wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt; On Wed, Sep 13, 2023 at 12:34=E2=80=AFPM Akihiko Odaki<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&=
lt;<a href=3D"mailto:akihiko.odaki@daynix.com" target=3D"_blank">akihiko.od=
aki@daynix.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:akihiko.odaki@daynix.c=
om" target=3D"_blank">akihiko.odaki@daynix.com</a>&gt; &lt;mailto:<a href=
=3D"mailto:akihiko.odaki@daynix.com" target=3D"_blank">akihiko.odaki@daynix=
.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:akihiko.odaki@daynix.c=
om" target=3D"_blank">akihiko.odaki@daynix.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mail=
to:akihiko.odaki@daynix.com" target=3D"_blank">akihiko.odaki@daynix.com</a>=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:akihiko.odaki@daynix.c=
om" target=3D"_blank">akihiko.odaki@daynix.com</a>&gt; &lt;mailto:<a href=
=3D"mailto:akihiko.odaki@daynix.com" target=3D"_blank">akihiko.odaki@daynix=
.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:akihiko.odaki@daynix.c=
om" target=3D"_blank">akihiko.odaki@daynix.com</a>&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt; &lt;mailto:<a href=3D"mailto:akihiko.odaki@daynix.com" target=3D"_blan=
k">akihiko.odaki@daynix.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:akihiko.odaki@daynix.c=
om" target=3D"_blank">akihiko.odaki@daynix.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mail=
to:akihiko.odaki@daynix.com" target=3D"_blank">akihiko.odaki@daynix.com</a>=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:akihiko.odaki@daynix.c=
om" target=3D"_blank">akihiko.odaki@daynix.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&=
lt;mailto:<a href=3D"mailto:akihiko.odaki@daynix.com" target=3D"_blank">aki=
hiko.odaki@daynix.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:akihiko.odaki@daynix.c=
om" target=3D"_blank">akihiko.odaki@daynix.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mail=
to:akihiko.odaki@daynix.com" target=3D"_blank">akihiko.odaki@daynix.com</a>=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:akihiko.odaki@daynix.c=
om" target=3D"_blank">akihiko.odaki@daynix.com</a>&gt;&gt;&gt;&gt;&gt; wrot=
e:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;=C2=A0 =C2=A0 =C2=A0On 2023/09/13 16:55, Albert Esteve wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Hi Antonio,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; If I&#39;m not mistaken, this patch is relate=
d with:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.gnu.org/archive/html/qemu-=
devel/2023-09/msg01853.html" rel=3D"noreferrer" target=3D"_blank">https://l=
ists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.gnu.org/archive/html/q=
emu-devel/2023-09/msg01853.html" rel=3D"noreferrer" target=3D"_blank">https=
://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.gnu.org/archive=
/html/qemu-devel/2023-09/msg01853.html" rel=3D"noreferrer" target=3D"_blank=
">https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html</a> &=
lt;<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg0185=
3.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/archive/=
html/qemu-devel/2023-09/msg01853.html</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.gnu.org/archive=
/html/qemu-devel/2023-09/msg01853.html" rel=3D"noreferrer" target=3D"_blank=
">https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html</a> &=
lt;<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg0185=
3.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/archive/=
html/qemu-devel/2023-09/msg01853.html</a>&gt; &lt;<a href=3D"https://lists.=
gnu.org/archive/html/qemu-devel/2023-09/msg01853.html" rel=3D"noreferrer" t=
arget=3D"_blank">https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg0=
1853.html</a> &lt;<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/=
2023-09/msg01853.html" rel=3D"noreferrer" target=3D"_blank">https://lists.g=
nu.org/archive/html/qemu-devel/2023-09/msg01853.html</a>&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.gnu.org/archive=
/html/qemu-devel/2023-09/msg01853.html" rel=3D"noreferrer" target=3D"_blank=
">https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html</a> &=
lt;<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg0185=
3.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/archive/=
html/qemu-devel/2023-09/msg01853.html</a>&gt; &lt;<a href=3D"https://lists.=
gnu.org/archive/html/qemu-devel/2023-09/msg01853.html" rel=3D"noreferrer" t=
arget=3D"_blank">https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg0=
1853.html</a> &lt;<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/=
2023-09/msg01853.html" rel=3D"noreferrer" target=3D"_blank">https://lists.g=
nu.org/archive/html/qemu-devel/2023-09/msg01853.html</a>&gt;&gt; &lt;<a hre=
f=3D"https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html" r=
el=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/archive/html/qemu=
-devel/2023-09/msg01853.html</a> &lt;<a href=3D"https://lists.gnu.org/archi=
ve/html/qemu-devel/2023-09/msg01853.html" rel=3D"noreferrer" target=3D"_bla=
nk">https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html</a>=
&gt; &lt;<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2023-09/m=
sg01853.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/ar=
chive/html/qemu-devel/2023-09/msg01853.html</a> &lt;<a href=3D"https://list=
s.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html" rel=3D"noreferrer"=
 target=3D"_blank">https://lists.gnu.org/archive/html/qemu-devel/2023-09/ms=
g01853.html</a>&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.gnu.org/archive=
/html/qemu-devel/2023-09/msg01853.html" rel=3D"noreferrer" target=3D"_blank=
">https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html</a> &=
lt;<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg0185=
3.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/archive/=
html/qemu-devel/2023-09/msg01853.html</a>&gt; &lt;<a href=3D"https://lists.=
gnu.org/archive/html/qemu-devel/2023-09/msg01853.html" rel=3D"noreferrer" t=
arget=3D"_blank">https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg0=
1853.html</a> &lt;<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/=
2023-09/msg01853.html" rel=3D"noreferrer" target=3D"_blank">https://lists.g=
nu.org/archive/html/qemu-devel/2023-09/msg01853.html</a>&gt;&gt; &lt;<a hre=
f=3D"https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html" r=
el=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/archive/html/qemu=
-devel/2023-09/msg01853.html</a> &lt;<a href=3D"https://lists.gnu.org/archi=
ve/html/qemu-devel/2023-09/msg01853.html" rel=3D"noreferrer" target=3D"_bla=
nk">https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html</a>=
&gt; &lt;<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2023-09/m=
sg01853.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/ar=
chive/html/qemu-devel/2023-09/msg01853.html</a> &lt;<a href=3D"https://list=
s.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html" rel=3D"noreferrer"=
 target=3D"_blank">https://lists.gnu.org/archive/html/qemu-devel/2023-09/ms=
g01853.html</a>&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.gnu.org/archive=
/html/qemu-devel/2023-09/msg01853.html" rel=3D"noreferrer" target=3D"_blank=
">https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html</a> &=
lt;<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg0185=
3.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/archive/=
html/qemu-devel/2023-09/msg01853.html</a>&gt; &lt;<a href=3D"https://lists.=
gnu.org/archive/html/qemu-devel/2023-09/msg01853.html" rel=3D"noreferrer" t=
arget=3D"_blank">https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg0=
1853.html</a> &lt;<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/=
2023-09/msg01853.html" rel=3D"noreferrer" target=3D"_blank">https://lists.g=
nu.org/archive/html/qemu-devel/2023-09/msg01853.html</a>&gt;&gt; &lt;<a hre=
f=3D"https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html" r=
el=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/archive/html/qemu=
-devel/2023-09/msg01853.html</a> &lt;<a href=3D"https://lists.gnu.org/archi=
ve/html/qemu-devel/2023-09/msg01853.html" rel=3D"noreferrer" target=3D"_bla=
nk">https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html</a>=
&gt; &lt;<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2023-09/m=
sg01853.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/ar=
chive/html/qemu-devel/2023-09/msg01853.html</a> &lt;<a href=3D"https://list=
s.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html" rel=3D"noreferrer"=
 target=3D"_blank">https://lists.gnu.org/archive/html/qemu-devel/2023-09/ms=
g01853.html</a>&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; IMHO, ideally, virtio-gpu and vhost-user-gpu<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0both,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0would<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0u=
se the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; infrastructure from the patch I linked to<br>
&gt;=C2=A0 =C2=A0 =C2=A0store the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; virtio objects, so that they can be later<br>
&gt;=C2=A0 =C2=A0 =C2=A0shared with<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0o=
ther devices.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;=C2=A0 =C2=A0 =C2=A0I don&#39;t think such sharing is possible because =
the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0resources are<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;=C2=A0 =C2=A0 =C2=A0identified by IDs that are local to the device.<br>
&gt;=C2=A0 =C2=A0 =C2=A0That also<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0c=
omplicates<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;=C2=A0 =C2=A0 =C2=A0migration.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;=C2=A0 =C2=A0 =C2=A0Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;=C2=A0 =C2=A0 =C2=A0Akihiko Odaki<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt; Hi Akihiko,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt; As far as I understand, the feature to export<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0dma-bufs=C2=A0from the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt; virtgpu was introduced as part of the virtio<br>
&gt;=C2=A0 =C2=A0 =C2=A0cross-device<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0sharing<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt; proposal [1]. Thus, it shall be posible. When<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0virtgpu=C2=A0ASSING_UUID,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt; it exports and identifies the dmabuf resource, so that<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0when the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0d=
mabuf gets<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt; shared inside the guest (e.g., with virtio-video),<br>
&gt;=C2=A0 =C2=A0 =C2=A0we can<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0use the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0a=
ssigned<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt; UUID to find the dmabuf in the host (using the<br>
&gt;=C2=A0 =C2=A0 =C2=A0patch that I<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0l=
inked above),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt; and import it.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt; [1] - <a href=3D"https://lwn.net/Articles/828988/" rel=3D"noreferrer" =
target=3D"_blank">https://lwn.net/Articles/828988/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lwn.net/Articles/828988/" re=
l=3D"noreferrer" target=3D"_blank">https://lwn.net/Articles/828988/</a>&gt;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lwn=
.net/Articles/828988/" rel=3D"noreferrer" target=3D"_blank">https://lwn.net=
/Articles/828988/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lwn.net/Articles/828988/" re=
l=3D"noreferrer" target=3D"_blank">https://lwn.net/Articles/828988/</a>&gt;=
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&=
lt;<a href=3D"https://lwn.net/Articles/828988/" rel=3D"noreferrer" target=
=3D"_blank">https://lwn.net/Articles/828988/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lwn.net/Articles/828988/" re=
l=3D"noreferrer" target=3D"_blank">https://lwn.net/Articles/828988/</a>&gt;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lwn=
.net/Articles/828988/" rel=3D"noreferrer" target=3D"_blank">https://lwn.net=
/Articles/828988/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lwn.net/Articles/828988/" re=
l=3D"noreferrer" target=3D"_blank">https://lwn.net/Articles/828988/</a>&gt;=
&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lwn=
.net/Articles/828988/" rel=3D"noreferrer" target=3D"_blank">https://lwn.net=
/Articles/828988/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lwn.net/Articles/828988/" re=
l=3D"noreferrer" target=3D"_blank">https://lwn.net/Articles/828988/</a>&gt;=
 &lt;<a href=3D"https://lwn.net/Articles/828988/" rel=3D"noreferrer" target=
=3D"_blank">https://lwn.net/Articles/828988/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lwn.net/Articles/828988/" re=
l=3D"noreferrer" target=3D"_blank">https://lwn.net/Articles/828988/</a>&gt;=
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&=
lt;<a href=3D"https://lwn.net/Articles/828988/" rel=3D"noreferrer" target=
=3D"_blank">https://lwn.net/Articles/828988/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lwn.net/Articles/828988/" re=
l=3D"noreferrer" target=3D"_blank">https://lwn.net/Articles/828988/</a>&gt;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lwn=
.net/Articles/828988/" rel=3D"noreferrer" target=3D"_blank">https://lwn.net=
/Articles/828988/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lwn.net/Articles/828988/" re=
l=3D"noreferrer" target=3D"_blank">https://lwn.net/Articles/828988/</a>&gt;=
&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0T=
he problem is that virtio-gpu can have other kind of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0resources like<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0p=
ixman and OpenGL textures and manage them and<br>
&gt;=C2=A0 =C2=A0 =C2=A0DMA-BUFs with<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0unified<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0r=
esource ID.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; I see.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0S=
o you cannot change:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0g=
_hash_table_insert(g-&gt;resource_uuids,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0G=
UINT_TO_POINTER(assign.resource_id), uuid);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0b=
y:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0v=
irtio_add_dmabuf(uuid, assign.resource_id);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0a=
ssign.resource_id is not DMA-BUF file descriptor, and the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0underlying<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0r=
esource my not be DMA-BUF at first place.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; I didn&#39;t really =
look into the patch in-depth, so the=C2=A0code was<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0intended<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; to give an idea of h=
ow the implementation would look like with<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; the cross-device pat=
ch API. Indeed, it is not the resource_id,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; (I just took a brief=
 look at the virtio<br>
&gt;=C2=A0 =C2=A0 =C2=A0specificacion=C2=A01.2), but the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; underlying<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; resource what we wan=
t to use here.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0A=
lso, since this lives in the common code that is not used<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0only by<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0v=
irtio-gpu-gl but also virtio-gpu, which supports<br>
&gt;=C2=A0 =C2=A0 =C2=A0migration,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0we also<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0n=
eed to take care of that. It is not a problem for<br>
&gt;=C2=A0 =C2=A0 =C2=A0DMA-BUF as<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0D=
MA-BUF is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0n=
ot migratable anyway, but the situation is different<br>
&gt;=C2=A0 =C2=A0 =C2=A0in this<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0case.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0I=
mplementing cross-device sharing is certainly a<br>
&gt;=C2=A0 =C2=A0 =C2=A0possibility,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0but that<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0r=
equires more than dealing with DMA-BUFs.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; So, if I understood =
correctly, dmabufs=C2=A0are just a subset<br>
&gt;=C2=A0 =C2=A0 =C2=A0of the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0resources<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; that the gpu manages=
, or can assign UUIDs to. I am not<br>
&gt;=C2=A0 =C2=A0 =C2=A0sure why<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; the virt gpu driver =
would want to send a ASSIGN_UUID for<br>
&gt;=C2=A0 =C2=A0 =C2=A0anything<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; that is not a dmabuf=
 (are we sure it does?), but I am not<br>
&gt;=C2=A0 =C2=A0 =C2=A0super<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0familiarized<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; with virtgpu=C2=A0to=
 begin with.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0In my understanding, an re=
source will be first created as<br>
&gt;=C2=A0 =C2=A0 =C2=A0OpenGL or<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Vulkan textures and then e=
xported as a DMA-BUF file<br>
&gt;=C2=A0 =C2=A0 =C2=A0descriptor. For<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0these resource types expor=
ting/importing code is mandatory.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0For pixman buffers (i.e., =
non-virgl device), I don&#39;t see a<br>
&gt;=C2=A0 =C2=A0 =C2=A0compelling<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0reason to have cross-devic=
e sharing. It is possible to omit<br>
&gt;=C2=A0 =C2=A0 =C2=A0resource<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0UUID feature from non-virg=
l device to avoid implementing<br>
&gt;=C2=A0 =C2=A0 =C2=A0complicated<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0migration.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I see, thanks for the clarification.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I would assume you could avoid the UUID featu=
re for those<br>
&gt;=C2=A0 =C2=A0 =C2=A0resources, but<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I will need to check the driver implementatio=
n. It is worth checking<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; though, if<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; that would simplify the implementation.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; But I see that inter=
nally, the GPU specs relate a UUID with a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0resource_id,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; so we still need bot=
h tables:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - one to relate UUID=
 with resource_id to be able to locate the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; underlying resource<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - the table that hol=
ds the dmabuf with the UUID for<br>
&gt;=C2=A0 =C2=A0 =C2=A0cross-device<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0sharing<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; With that in mind, s=
ounds to me that the support for<br>
&gt;=C2=A0 =C2=A0 =C2=A0cross-device<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; sharing could<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; be added on top of t=
his patch, once<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.gnu.org/archive/html/qemu-=
devel/2023-09/msg01850.html" rel=3D"noreferrer" target=3D"_blank">https://l=
ists.gnu.org/archive/html/qemu-devel/2023-09/msg01850.html</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.gnu.org/archive/html/q=
emu-devel/2023-09/msg01850.html" rel=3D"noreferrer" target=3D"_blank">https=
://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01850.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.gnu.org/archive=
/html/qemu-devel/2023-09/msg01850.html" rel=3D"noreferrer" target=3D"_blank=
">https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01850.html</a> &=
lt;<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg0185=
0.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/archive/=
html/qemu-devel/2023-09/msg01850.html</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.gnu.org/archive=
/html/qemu-devel/2023-09/msg01850.html" rel=3D"noreferrer" target=3D"_blank=
">https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01850.html</a> &=
lt;<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg0185=
0.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/archive/=
html/qemu-devel/2023-09/msg01850.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.gnu.org/archive=
/html/qemu-devel/2023-09/msg01850.html" rel=3D"noreferrer" target=3D"_blank=
">https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01850.html</a> &=
lt;<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg0185=
0.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/archive/=
html/qemu-devel/2023-09/msg01850.html</a>&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; lands.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0That is possible, but I th=
ink it&#39;s better to implement<br>
&gt;=C2=A0 =C2=A0 =C2=A0cross-device<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0sharing at the same time i=
ntroducing virtio-dmabuf.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0The current design of virt=
io-dmabuf looks somewhat<br>
&gt;=C2=A0 =C2=A0 =C2=A0inconsistent; it&#39;s<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0named &quot;dmabuf&quot;, =
but internally the UUIDs are stored into<br>
&gt;=C2=A0 =C2=A0 =C2=A0something<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0named<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&quot;resource_uuids&quot;=
 and it has SharedObjectType so it&#39;s more like a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0generic<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0resource sharing mechanism=
. If you actually have an<br>
&gt;=C2=A0 =C2=A0 =C2=A0implementation of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0cross-device sharing using=
 virtio-dmabuf, it will be clear<br>
&gt;=C2=A0 =C2=A0 =C2=A0what kind of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0feature is truly necessary=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Yeah, the file was named as virtio-dmabuf fol=
lowing the kernel<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; implementation. Also, because for the moment =
it only aims to share<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; dmabufs. However, virtio specs leave the virt=
io object<br>
&gt;=C2=A0 =C2=A0 =C2=A0defintion=C2=A0vague [1]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; (I guess purposely). It is up to the specific=
 devices to define<br>
&gt;=C2=A0 =C2=A0 =C2=A0what an<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; object<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; means for them. So the implementation tries t=
o follow that, and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; leave the contents of the table generic. The =
table can hold any<br>
&gt;=C2=A0 =C2=A0 =C2=A0kind of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; object,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; and the API exposes type-specific functions (=
for dmabufs,=C2=A0or others).<br>
&gt;=C2=A0 =C2=A0 =C2=A0In the guest kernel, the name &quot;virtio_dma_buf&=
quot; represents the interface<br>
&gt;=C2=A0 =C2=A0 =C2=A0between the *guest* kernel and *guest* user-space. =
It makes sense since<br>
&gt;=C2=A0 =C2=A0 =C2=A0the cross-device resource sharing is managed by the=
 userspace and<br>
&gt;=C2=A0 =C2=A0 =C2=A0DMA-BUF is the only interface between them for this=
 purpose.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The situation is different for QEMU; QEMU interacts=
 with backends using<br>
&gt;=C2=A0 =C2=A0 =C2=A0backend-specific interfaces (OpenGL/pixman) and vir=
gl is capable to<br>
&gt;=C2=A0 =C2=A0 =C2=A0export textures as DMA-BUF. DMA-BUF is not universa=
l in this sense. As<br>
&gt;=C2=A0 =C2=A0 =C2=A0such, we cannot just borrow the kernel-side naming =
but invent one.<br>
&gt; <br>
&gt; It is not a gpu-specific feature. It is a generic cross-device sharing=
<br>
&gt; mechanism for virtio objects. In this case, virtio objects happen to b=
e<br>
&gt; dmabufs in this first iteration. Hence, the name.<br>
&gt; <br>
&gt; virtio-gpu (and vhost-user-gpu) will use this feature only with virgl,=
 <br>
&gt; that is<br>
&gt; fine, and transversal to the object-sharing mechanism. It allows<br>
&gt; to share dmabufs in the host following how they are shared in the gues=
t.<br>
&gt; The virtgpu=C2=A0driver may call ASSIGN_UUID for other types of resour=
ces <br>
&gt; (not sure,<br>
&gt; but could be), but they will never be shared with other virtio devices=
.<br>
&gt; So they are not too relevant. Also, the shared objects table could <br=
>
&gt; potentially<br>
&gt; be accessed from any virtio device, not only virtio-gpu or virtio-vide=
o.<br>
<br>
The virtgpu driver will call ASSIGN_UUID for resources that are backed <br>
with pixman buffer. What is used as the backing store for resources is <br>
an implementation detail of VMM and the guest cannot know it. For the <br>
guest, they are same kind of resources (2D images).<br>
<br></blockquote><div>Ok, got it. In any case, those resources that are act=
ually backed by a dmabuf</div><div>ought to be shared using virtio_dmabuf. =
I think that is the key point of this discussion.</div><div><br></div><div>=
That support can be added once both this patch and the virtio_dmabuf land.<=
/div></div></div>

--00000000000041a695060562cf91--


