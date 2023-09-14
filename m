Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9982379FE6D
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 10:31:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602132.938515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qghjp-00034Y-8A; Thu, 14 Sep 2023 08:30:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602132.938515; Thu, 14 Sep 2023 08:30:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qghjp-00032s-4a; Thu, 14 Sep 2023 08:30:13 +0000
Received: by outflank-mailman (input) for mailman id 602132;
 Thu, 14 Sep 2023 08:30:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ae2/=E6=redhat.com=aesteve@srs-se1.protection.inumbo.net>)
 id 1qghjn-00032m-C1
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 08:30:11 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9e65521-52d8-11ee-8787-cb3800f73035;
 Thu, 14 Sep 2023 10:30:09 +0200 (CEST)
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-8P0gNERCP1mQLLWoEi6OOA-1; Thu, 14 Sep 2023 04:30:04 -0400
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-26d43d10ce5so643198a91.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 01:30:04 -0700 (PDT)
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
X-Inumbo-ID: e9e65521-52d8-11ee-8787-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694680208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yA6YEmooBezgU/7PUR3h+x7ndZimwJxchJ/tlSKweSU=;
	b=ccTps/+17rAWDrUSrLnyk6xob8fUN/dfNSHM5786VreNsqy3leRMBPs02T6ffIP3Usa93U
	FIRvvqBg3jR8SP34ztj/xsqfcY3JKDXWPis8UAg0kfNfNqj7j+OMU5wYEqIrsuT+oCpc72
	rLaI+dR0Zbo+rvo1W7OI359easILMj8=
X-MC-Unique: 8P0gNERCP1mQLLWoEi6OOA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694680203; x=1695285003;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yA6YEmooBezgU/7PUR3h+x7ndZimwJxchJ/tlSKweSU=;
        b=IPAewgj1aQAHUQVwHhCkGoiAY0FuVUVgGn2NvsAbuRtvkeA8E08ohX5mKvV7sktlQi
         BYBOatn/oFGj4LPYcmC8VbofhHMJTpW2MgbhHU8kwltIgif9rdRcG4NQyJ+Am1h9gCH2
         W6fBHTeTWkzmWzcqzf0lK9aoKnXXe8uSLh3kqhjEN3OlHdXZLcNm9lsUMheiIH2rqyE4
         i00hdOF88i6pDJViLrDQInXKHklaTe1giFbm9vdtj2jr4BKsvTRs/Xh1yAn8mmdOjjXe
         8xoKO9H15Xtd1Ohuxr7ICM/zr4RMAe0H1O7T0GqJixhp6rjMZw+YxcFMjYUBht2Hpyn9
         KvSg==
X-Gm-Message-State: AOJu0YzboHekvjyTi868rygFXYLBiGxeQH8FBRf2Dbs9tzuDVwDkS/ao
	7r1gFbEdRseC8gDTyetOk+EMcSk2NnAHXND48BMlOQFzUoILfQYHcKpN+8QXy4Ok+FEL1Fpqaao
	g5DM0IcXVDwlEJ1gq5qEBTjQgYcdhJeHjLaM1QGKCxMw=
X-Received: by 2002:a17:90a:8c88:b0:269:18f5:683e with SMTP id b8-20020a17090a8c8800b0026918f5683emr4549204pjo.3.1694680203467;
        Thu, 14 Sep 2023 01:30:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvpnIrI0fs8uswe/o8Tr9VmbnQC1HIMGfwSGp6+i8vBzb9EeSU1mTm5ednofrRjwOe2msFRh39ayPz1qPNx1c=
X-Received: by 2002:a17:90a:8c88:b0:269:18f5:683e with SMTP id
 b8-20020a17090a8c8800b0026918f5683emr4549172pjo.3.1694680203144; Thu, 14 Sep
 2023 01:30:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230831093252.2461282-1-ray.huang@amd.com> <20230831093252.2461282-11-ray.huang@amd.com>
 <58a4e81f-b0ce-49db-8a6a-f6b5bdc3d2d6@daynix.com> <ZPw2UjxogIULU722@amd.com>
 <11c227e8-a464-41ce-a435-82c570746388@daynix.com> <CADSE00Kc1Jza7sbERRndWbXgoF1s2V-FNxEOWJ6WgvomzgvMPA@mail.gmail.com>
 <cf99ac00-6f48-4778-b319-6079a931ba5d@daynix.com> <CADSE00+6zcT7iKR0JW1Bk8es6HtBpzAKa9JW6u5yyjDoLPw2KQ@mail.gmail.com>
 <5e88f5d5-5aa2-4052-b250-69c2a443344f@daynix.com> <CADSE00+BUq-6jKH3v2PYNThn+9Z4UCFcr3Cv9Z48eUX0b=6ymA@mail.gmail.com>
 <3918c96c-f106-494d-8e97-6d86cef8df27@daynix.com> <CADSE00LNYm+vKaYwnTAdECGUXPCfiJ7aLqszDuqSzCLLhVOHhQ@mail.gmail.com>
 <0adaf816-e050-43c3-8284-fc41627543ef@daynix.com>
In-Reply-To: <0adaf816-e050-43c3-8284-fc41627543ef@daynix.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 14 Sep 2023 10:29:51 +0200
Message-ID: <CADSE00Kyid+=FkkopSGDAyeJ_MY2exDdxoPf18pzthKy70kkKg@mail.gmail.com>
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
Content-Type: multipart/alternative; boundary="00000000000084498506054d7be3"

--00000000000084498506054d7be3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 14, 2023 at 9:17=E2=80=AFAM Akihiko Odaki <akihiko.odaki@daynix=
.com>
wrote:

> On 2023/09/13 23:18, Albert Esteve wrote:
> >
> >
> > On Wed, Sep 13, 2023 at 3:43=E2=80=AFPM Akihiko Odaki <akihiko.odaki@da=
ynix.com
> > <mailto:akihiko.odaki@daynix.com>> wrote:
> >
> >     On 2023/09/13 21:58, Albert Esteve wrote:
> >      >
> >      >
> >      > On Wed, Sep 13, 2023 at 2:22=E2=80=AFPM Akihiko Odaki
> >     <akihiko.odaki@daynix.com <mailto:akihiko.odaki@daynix.com>
> >      > <mailto:akihiko.odaki@daynix.com
> >     <mailto:akihiko.odaki@daynix.com>>> wrote:
> >      >
> >      >     On 2023/09/13 20:34, Albert Esteve wrote:
> >      >      >
> >      >      >
> >      >      > On Wed, Sep 13, 2023 at 12:34=E2=80=AFPM Akihiko Odaki
> >      >     <akihiko.odaki@daynix.com <mailto:akihiko.odaki@daynix.com>
> >     <mailto:akihiko.odaki@daynix.com <mailto:akihiko.odaki@daynix.com>>
> >      >      > <mailto:akihiko.odaki@daynix.com
> >     <mailto:akihiko.odaki@daynix.com>
> >      >     <mailto:akihiko.odaki@daynix.com
> >     <mailto:akihiko.odaki@daynix.com>>>> wrote:
> >      >      >
> >      >      >     On 2023/09/13 16:55, Albert Esteve wrote:
> >      >      >      > Hi Antonio,
> >      >      >      >
> >      >      >      > If I'm not mistaken, this patch is related with:
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
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html>>
> >      >      >
> >      >
> >       <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html> <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html>>>>
> >      >      >      > IMHO, ideally, virtio-gpu and vhost-user-gpu both,
> >     would
> >      >     use the
> >      >      >      > infrastructure from the patch I linked to store th=
e
> >      >      >      > virtio objects, so that they can be later shared
> with
> >      >     other devices.
> >      >      >
> >      >      >     I don't think such sharing is possible because the
> >     resources are
> >      >      >     identified by IDs that are local to the device. That
> also
> >      >     complicates
> >      >      >     migration.
> >      >      >
> >      >      >     Regards,
> >      >      >     Akihiko Odaki
> >      >      >
> >      >      > Hi Akihiko,
> >      >      >
> >      >      > As far as I understand, the feature to export
> >     dma-bufs from the
> >      >      > virtgpu was introduced as part of the virtio cross-device
> >     sharing
> >      >      > proposal [1]. Thus, it shall be posible. When
> >     virtgpu ASSING_UUID,
> >      >      > it exports and identifies the dmabuf resource, so that
> >     when the
> >      >     dmabuf gets
> >      >      > shared inside the guest (e.g., with virtio-video), we can
> >     use the
> >      >     assigned
> >      >      > UUID to find the dmabuf in the host (using the patch that=
 I
> >      >     linked above),
> >      >      > and import it.
> >      >      >
> >      >      > [1] - https://lwn.net/Articles/828988/
> >     <https://lwn.net/Articles/828988/>
> >      >     <https://lwn.net/Articles/828988/
> >     <https://lwn.net/Articles/828988/>>
> >     <https://lwn.net/Articles/828988/ <https://lwn.net/Articles/828988/=
>
> >      >     <https://lwn.net/Articles/828988/
> >     <https://lwn.net/Articles/828988/>>>
> >      >
> >      >     The problem is that virtio-gpu can have other kind of
> >     resources like
> >      >     pixman and OpenGL textures and manage them and DMA-BUFs with
> >     unified
> >      >     resource ID.
> >      >
> >      >
> >      > I see.
> >      >
> >      >
> >      >     So you cannot change:
> >      >     g_hash_table_insert(g->resource_uuids,
> >      >     GUINT_TO_POINTER(assign.resource_id), uuid);
> >      >     by:
> >      >     virtio_add_dmabuf(uuid, assign.resource_id);
> >      >
> >      >     assign.resource_id is not DMA-BUF file descriptor, and the
> >     underlying
> >      >     resource my not be DMA-BUF at first place.
> >      >
> >      >
> >      > I didn't really look into the patch in-depth, so the code was
> >     intended
> >      > to give an idea of how the implementation would look like with
> >      > the cross-device patch API. Indeed, it is not the resource_id,
> >      > (I just took a brief look at the virtio specificacion 1.2), but
> the
> >      > underlying
> >      > resource what we want to use here.
> >      >
> >      >
> >      >     Also, since this lives in the common code that is not used
> >     only by
> >      >     virtio-gpu-gl but also virtio-gpu, which supports migration,
> >     we also
> >      >     need to take care of that. It is not a problem for DMA-BUF a=
s
> >      >     DMA-BUF is
> >      >     not migratable anyway, but the situation is different in thi=
s
> >     case.
> >      >
> >      >     Implementing cross-device sharing is certainly a possibility=
,
> >     but that
> >      >     requires more than dealing with DMA-BUFs.
> >      >
> >      >
> >      > So, if I understood correctly, dmabufs are just a subset of the
> >     resources
> >      > that the gpu manages, or can assign UUIDs to. I am not sure why
> >      > the virt gpu driver would want to send a ASSIGN_UUID for anythin=
g
> >      > that is not a dmabuf (are we sure it does?), but I am not super
> >     familiarized
> >      > with virtgpu to begin with.
> >
> >     In my understanding, an resource will be first created as OpenGL or
> >     Vulkan textures and then exported as a DMA-BUF file descriptor. For
> >     these resource types exporting/importing code is mandatory.
> >
> >     For pixman buffers (i.e., non-virgl device), I don't see a compelli=
ng
> >     reason to have cross-device sharing. It is possible to omit resourc=
e
> >     UUID feature from non-virgl device to avoid implementing complicate=
d
> >     migration.
> >
> >
> > I see, thanks for the clarification.
> > I would assume you could avoid the UUID feature for those resources, bu=
t
> > I will need to check the driver implementation. It is worth checking
> > though, if
> > that would simplify the implementation.
> >
> >
> >      > But I see that internally, the GPU specs relate a UUID with a
> >     resource_id,
> >      > so we still need both tables:
> >      > - one to relate UUID with resource_id to be able to locate the
> >      > underlying resource
> >      > - the table that holds the dmabuf with the UUID for cross-device
> >     sharing
> >      >
> >      > With that in mind, sounds to me that the support for cross-devic=
e
> >      > sharing could
> >      > be added on top of this patch, once
> >      >
> >     https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01850.html
> >     <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01850.htm=
l
> >
> >      >
> >     <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01850.htm=
l
> >     <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01850.htm=
l
> >>
> >      > lands.
> >
> >     That is possible, but I think it's better to implement cross-device
> >     sharing at the same time introducing virtio-dmabuf.
> >
> >     The current design of virtio-dmabuf looks somewhat inconsistent; it=
's
> >     named "dmabuf", but internally the UUIDs are stored into something
> >     named
> >     "resource_uuids" and it has SharedObjectType so it's more like a
> >     generic
> >     resource sharing mechanism. If you actually have an implementation =
of
> >     cross-device sharing using virtio-dmabuf, it will be clear what kin=
d
> of
> >     feature is truly necessary.
> >
> >
> > Yeah, the file was named as virtio-dmabuf following the kernel
> > implementation. Also, because for the moment it only aims to share
> > dmabufs. However, virtio specs leave the virtio object defintion vague
> [1]
> > (I guess purposely). It is up to the specific devices to define what an
> > object
> > means for them. So the implementation tries to follow that, and
> > leave the contents of the table generic. The table can hold any kind of
> > object,
> > and the API exposes type-specific functions (for dmabufs, or others).
> In the guest kernel, the name "virtio_dma_buf" represents the interface
> between the *guest* kernel and *guest* user-space. It makes sense since
> the cross-device resource sharing is managed by the userspace and
> DMA-BUF is the only interface between them for this purpose.
>
> The situation is different for QEMU; QEMU interacts with backends using
> backend-specific interfaces (OpenGL/pixman) and virgl is capable to
> export textures as DMA-BUF. DMA-BUF is not universal in this sense. As
> such, we cannot just borrow the kernel-side naming but invent one.
>
> It is not a gpu-specific feature. It is a generic cross-device sharing
mechanism for virtio objects. In this case, virtio objects happen to be
dmabufs in this first iteration. Hence, the name.

virtio-gpu (and vhost-user-gpu) will use this feature only with virgl, that
is
fine, and transversal to the object-sharing mechanism. It allows
to share dmabufs in the host following how they are shared in the guest.
The virtgpu driver may call ASSIGN_UUID for other types of resources (not
sure,
but could be), but they will never be shared with other virtio devices.
So they are not too relevant. Also, the shared objects table could
potentially
be accessed from any virtio device, not only virtio-gpu or virtio-video.

What I am trying to say, is that the name focuses solely in its current
usage,
i.e., sharing dmabufs between virtio-gpu (as exporter), and virtio-video
(as importer).
If it grows to something more, imo it can be renamed later.

Regards,
Albert

--00000000000084498506054d7be3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr" class=3D"gmail_sign=
ature"><div dir=3D"ltr"><br></div></div></div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 14, 2023 at 9:17=
=E2=80=AFAM Akihiko Odaki &lt;<a href=3D"mailto:akihiko.odaki@daynix.com">a=
kihiko.odaki@daynix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On 2023/09/13 23:18, Albert Esteve wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Wed, Sep 13, 2023 at 3:43=E2=80=AFPM Akihiko Odaki &lt;<a href=3D"m=
ailto:akihiko.odaki@daynix.com" target=3D"_blank">akihiko.odaki@daynix.com<=
/a> <br>
&gt; &lt;mailto:<a href=3D"mailto:akihiko.odaki@daynix.com" target=3D"_blan=
k">akihiko.odaki@daynix.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 2023/09/13 21:58, Albert Esteve wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; On Wed, Sep 13, 2023 at 2:22=E2=80=AFPM Akihi=
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
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0On 2023/09/13 20:34, Alber=
t Esteve wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; On Wed, Sep 13, 2023=
 at 12:34=E2=80=AFPM Akihiko Odaki<br>
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
n 2023/09/13 16:55, Albert Esteve wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt; Hi Antonio,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt; If I&#39;m not mistaken, this patch is related with:<br>
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
nu.org/archive/html/qemu-devel/2023-09/msg01853.html</a>&gt;&gt;<br>
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
nu.org/archive/html/qemu-devel/2023-09/msg01853.html</a>&gt;&gt;&gt;&gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt; IMHO, ideally, virtio-gpu and vhost-user-gpu both,<br>
&gt;=C2=A0 =C2=A0 =C2=A0would<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0use the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt; infrastructure from the patch I linked to store the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt; virtio objects, so that they can be later shared with<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0other devices.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0I=
 don&#39;t think such sharing is possible because the<br>
&gt;=C2=A0 =C2=A0 =C2=A0resources are<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0i=
dentified by IDs that are local to the device. That also<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0complicates<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0m=
igration.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0R=
egards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0A=
kihiko Odaki<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Hi Akihiko,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; As far as I understa=
nd, the feature to export<br>
&gt;=C2=A0 =C2=A0 =C2=A0dma-bufs=C2=A0from the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; virtgpu was introduc=
ed as part of the virtio cross-device<br>
&gt;=C2=A0 =C2=A0 =C2=A0sharing<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; proposal [1]. Thus, =
it shall be posible. When<br>
&gt;=C2=A0 =C2=A0 =C2=A0virtgpu=C2=A0ASSING_UUID,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; it exports and ident=
ifies the dmabuf resource, so that<br>
&gt;=C2=A0 =C2=A0 =C2=A0when the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0dmabuf gets<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; shared inside the gu=
est (e.g., with virtio-video), we can<br>
&gt;=C2=A0 =C2=A0 =C2=A0use the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0assigned<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; UUID to find the dma=
buf in the host (using the patch that I<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0linked above),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; and import it.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; [1] - <a href=3D"htt=
ps://lwn.net/Articles/828988/" rel=3D"noreferrer" target=3D"_blank">https:/=
/lwn.net/Articles/828988/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lwn.net/Articles/828988/" re=
l=3D"noreferrer" target=3D"_blank">https://lwn.net/Articles/828988/</a>&gt;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lwn=
.net/Articles/828988/" rel=3D"noreferrer" target=3D"_blank">https://lwn.net=
/Articles/828988/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lwn.net/Articles/828988/" re=
l=3D"noreferrer" target=3D"_blank">https://lwn.net/Articles/828988/</a>&gt;=
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lwn.net/Articles/828988/" re=
l=3D"noreferrer" target=3D"_blank">https://lwn.net/Articles/828988/</a> &lt=
;<a href=3D"https://lwn.net/Articles/828988/" rel=3D"noreferrer" target=3D"=
_blank">https://lwn.net/Articles/828988/</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lwn=
.net/Articles/828988/" rel=3D"noreferrer" target=3D"_blank">https://lwn.net=
/Articles/828988/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lwn.net/Articles/828988/" re=
l=3D"noreferrer" target=3D"_blank">https://lwn.net/Articles/828988/</a>&gt;=
&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0The problem is that virtio=
-gpu can have other kind of<br>
&gt;=C2=A0 =C2=A0 =C2=A0resources like<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0pixman and OpenGL textures=
 and manage them and DMA-BUFs with<br>
&gt;=C2=A0 =C2=A0 =C2=A0unified<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0resource ID.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I see.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0So you cannot change:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0g_hash_table_insert(g-&gt;=
resource_uuids,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0GUINT_TO_POINTER(assign.re=
source_id), uuid);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0by:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0virtio_add_dmabuf(uuid, as=
sign.resource_id);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0assign.resource_id is not =
DMA-BUF file descriptor, and the<br>
&gt;=C2=A0 =C2=A0 =C2=A0underlying<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0resource my not be DMA-BUF=
 at first place.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I didn&#39;t really look into the patch in-de=
pth, so the=C2=A0code was<br>
&gt;=C2=A0 =C2=A0 =C2=A0intended<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; to give an idea of how the implementation wou=
ld look like with<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; the cross-device patch API. Indeed, it is not=
 the resource_id,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; (I just took a brief look at the virtio speci=
ficacion=C2=A01.2), but the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; underlying<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; resource what we want to use here.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Also, since this lives in =
the common code that is not used<br>
&gt;=C2=A0 =C2=A0 =C2=A0only by<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0virtio-gpu-gl but also vir=
tio-gpu, which supports migration,<br>
&gt;=C2=A0 =C2=A0 =C2=A0we also<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0need to take care of that.=
 It is not a problem for DMA-BUF as<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0DMA-BUF is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0not migratable anyway, but=
 the situation is different in this<br>
&gt;=C2=A0 =C2=A0 =C2=A0case.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Implementing cross-device =
sharing is certainly a possibility,<br>
&gt;=C2=A0 =C2=A0 =C2=A0but that<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0requires more than dealing=
 with DMA-BUFs.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; So, if I understood correctly, dmabufs=C2=A0a=
re just a subset of the<br>
&gt;=C2=A0 =C2=A0 =C2=A0resources<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; that the gpu manages, or can assign UUIDs to.=
 I am not sure why<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; the virt gpu driver would want to send a ASSI=
GN_UUID for anything<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; that is not a dmabuf (are we sure it does?), =
but I am not super<br>
&gt;=C2=A0 =C2=A0 =C2=A0familiarized<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; with virtgpu=C2=A0to begin with.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0In my understanding, an resource will be first crea=
ted as OpenGL or<br>
&gt;=C2=A0 =C2=A0 =C2=A0Vulkan textures and then exported as a DMA-BUF file=
 descriptor. For<br>
&gt;=C2=A0 =C2=A0 =C2=A0these resource types exporting/importing code is ma=
ndatory.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0For pixman buffers (i.e., non-virgl device), I don&=
#39;t see a compelling<br>
&gt;=C2=A0 =C2=A0 =C2=A0reason to have cross-device sharing. It is possible=
 to omit resource<br>
&gt;=C2=A0 =C2=A0 =C2=A0UUID feature from non-virgl device to avoid impleme=
nting complicated<br>
&gt;=C2=A0 =C2=A0 =C2=A0migration.<br>
&gt; <br>
&gt; <br>
&gt; I see, thanks for the clarification.<br>
&gt; I would assume you could avoid the UUID feature for those resources, b=
ut<br>
&gt; I will need to check the driver implementation. It is worth checking <=
br>
&gt; though, if<br>
&gt; that would simplify the implementation.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; But I see that internally, the GPU specs rela=
te a UUID with a<br>
&gt;=C2=A0 =C2=A0 =C2=A0resource_id,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; so we still need both tables:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - one to relate UUID with resource_id to be a=
ble to locate the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; underlying resource<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - the table that holds the dmabuf with the UU=
ID for cross-device<br>
&gt;=C2=A0 =C2=A0 =C2=A0sharing<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; With that in mind, sounds to me that the supp=
ort for cross-device<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; sharing could<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; be added on top of this patch, once<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.gnu.org/archive/html/qemu-=
devel/2023-09/msg01850.html" rel=3D"noreferrer" target=3D"_blank">https://l=
ists.gnu.org/archive/html/qemu-devel/2023-09/msg01850.html</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.gnu.org/archive/html/q=
emu-devel/2023-09/msg01850.html" rel=3D"noreferrer" target=3D"_blank">https=
://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01850.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.gnu.org/archive/html/q=
emu-devel/2023-09/msg01850.html" rel=3D"noreferrer" target=3D"_blank">https=
://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01850.html</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.gnu.org/archive/html/q=
emu-devel/2023-09/msg01850.html" rel=3D"noreferrer" target=3D"_blank">https=
://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01850.html</a>&gt;&gt;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; lands.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0That is possible, but I think it&#39;s better to im=
plement cross-device<br>
&gt;=C2=A0 =C2=A0 =C2=A0sharing at the same time introducing virtio-dmabuf.=
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The current design of virtio-dmabuf looks somewhat =
inconsistent; it&#39;s<br>
&gt;=C2=A0 =C2=A0 =C2=A0named &quot;dmabuf&quot;, but internally the UUIDs =
are stored into something<br>
&gt;=C2=A0 =C2=A0 =C2=A0named<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;resource_uuids&quot; and it has SharedObjectT=
ype so it&#39;s more like a<br>
&gt;=C2=A0 =C2=A0 =C2=A0generic<br>
&gt;=C2=A0 =C2=A0 =C2=A0resource sharing mechanism. If you actually have an=
 implementation of<br>
&gt;=C2=A0 =C2=A0 =C2=A0cross-device sharing using virtio-dmabuf, it will b=
e clear what kind of<br>
&gt;=C2=A0 =C2=A0 =C2=A0feature is truly necessary.<br>
&gt; <br>
&gt; <br>
&gt; Yeah, the file was named as virtio-dmabuf following the kernel<br>
&gt; implementation. Also, because for the moment it only aims to share<br>
&gt; dmabufs. However, virtio specs leave the virtio object defintion=C2=A0=
vague [1]<br>
&gt; (I guess purposely). It is up to the specific devices to define what a=
n <br>
&gt; object<br>
&gt; means for them. So the implementation tries to follow that, and<br>
&gt; leave the contents of the table generic. The table can hold any kind o=
f <br>
&gt; object,<br>
&gt; and the API exposes type-specific functions (for dmabufs,=C2=A0or othe=
rs).<br>
In the guest kernel, the name &quot;virtio_dma_buf&quot; represents the int=
erface <br>
between the *guest* kernel and *guest* user-space. It makes sense since <br=
>
the cross-device resource sharing is managed by the userspace and <br>
DMA-BUF is the only interface between them for this purpose.<br>
<br>
The situation is different for QEMU; QEMU interacts with backends using <br=
>
backend-specific interfaces (OpenGL/pixman) and virgl is capable to <br>
export textures as DMA-BUF. DMA-BUF is not universal in this sense. As <br>
such, we cannot just borrow the kernel-side naming but invent one.<br>
<br></blockquote><div>It is not a gpu-specific feature. It is a generic cro=
ss-device sharing</div><div>mechanism for virtio objects. In this case, vir=
tio objects happen to be</div><div>dmabufs in this first iteration. Hence, =
the name.</div><div><br></div><div>virtio-gpu (and vhost-user-gpu) will use=
 this feature only with virgl, that is</div><div>fine, and transversal to t=
he object-sharing mechanism. It allows</div><div>to share dmabufs in the ho=
st following how they are shared in the guest.</div><div>The virtgpu=C2=A0d=
river may call ASSIGN_UUID for other types of resources (not sure,</div><di=
v>but could be), but they will never be shared with other virtio devices.</=
div><div>So they are not too relevant. Also, the shared objects table could=
 potentially</div><div>be accessed from any virtio device, not only virtio-=
gpu or virtio-video.</div><div><br></div><div>What I am trying to say, is t=
hat the name focuses solely in its current usage,</div><div>i.e., sharing d=
mabufs between virtio-gpu (as exporter), and virtio-video (as importer).</d=
iv><div>If it grows to something more, imo it can=C2=A0be renamed later.</d=
iv><div><br></div><div>Regards,</div><div>Albert</div></div></div>

--00000000000084498506054d7be3--


