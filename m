Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6F479EAD7
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 16:19:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601441.937429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgQhc-0003i8-Vs; Wed, 13 Sep 2023 14:18:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601441.937429; Wed, 13 Sep 2023 14:18:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgQhc-0003fQ-Rq; Wed, 13 Sep 2023 14:18:48 +0000
Received: by outflank-mailman (input) for mailman id 601441;
 Wed, 13 Sep 2023 14:18:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gBHS=E5=redhat.com=aesteve@srs-se1.protection.inumbo.net>)
 id 1qgQhc-0003fK-1N
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 14:18:48 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7236ea28-5240-11ee-9b0d-b553b5be7939;
 Wed, 13 Sep 2023 16:18:45 +0200 (CEST)
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-c0mo4_AfO8u9Ncgs-nNLZQ-1; Wed, 13 Sep 2023 10:18:40 -0400
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-573d44762e4so7394075a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Sep 2023 07:18:40 -0700 (PDT)
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
X-Inumbo-ID: 7236ea28-5240-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694614724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4cjOPKJK8kJbNrrfaNwOPldfkz5IYXw7eT/fQo2YKNU=;
	b=QsGw2LKcq+sLCZT3xRMqXg2roWcFHvvzNBmDYvNnRw6RK2GvLnAliAIIzZVfy1mSbkDxyj
	gZzWOv2LEQp6A6yI/8lR5gy1OtXYGgGK/0Ja9YO99H2UL72IXB+utUDhLbJ+u1+sJoJ+ly
	F8KT0h0Qnm/mGUCiABmzC722BmbvocU=
X-MC-Unique: c0mo4_AfO8u9Ncgs-nNLZQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694614719; x=1695219519;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4cjOPKJK8kJbNrrfaNwOPldfkz5IYXw7eT/fQo2YKNU=;
        b=VPlhItALpynFhV4usLJGW7EPTFvn9/f5IomqAm9VG1e6ynh0dSAGGTlFg0Fzn+5lB/
         03HpZN33olgByfql4DP3gi3UKrUDyFo7UHYdMVkMsce5hmZLNcYYzfr+G81LdnYNISRR
         kT+bbYjdM1/qaAvnTM7pAVzl3L4l+ZTvL4ZGzcy0/kvTwGV7WMlaWDwbVTAFyEaDvpzQ
         ASm/SYJXyPPSwv8WsSfhjdx0bm3egUE1wY5WVYc9I7EsSGLlzObTGELbzHKE9LNcnp2E
         xSuQHJTadPySFX4b4rEExT50LeF5kl4xTSAd9bfeRTn3qIdXxBh5fIAuZksGxKa5WEPU
         BSMQ==
X-Gm-Message-State: AOJu0Yz1Tv4murISAJnlnBNTczJ6lHlWgdh1imkYnGCM8XggYZEk7QKs
	z/Tt97Xe+vCF3gaceVt+W27JGPqTGc+aLmBBvoXFGrn1BHMJmAPAZpukUPHcgki0YrhMIY6VNl/
	b+2ufY42QG6V0G3e1bXuvCiLuGf+RHbSseig/K/d5NLo=
X-Received: by 2002:a17:90b:38d2:b0:26d:43f9:11dd with SMTP id nn18-20020a17090b38d200b0026d43f911ddmr2391937pjb.0.1694614719034;
        Wed, 13 Sep 2023 07:18:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmx/ocnxpiY4B9P8H02WpotJCJrvPg1BigAUA4M9k0RHWOtkiiN2a2ztOf5TEYtrqChYplvibI+pVgKM2Zwds=
X-Received: by 2002:a17:90b:38d2:b0:26d:43f9:11dd with SMTP id
 nn18-20020a17090b38d200b0026d43f911ddmr2391901pjb.0.1694614718671; Wed, 13
 Sep 2023 07:18:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230831093252.2461282-1-ray.huang@amd.com> <20230831093252.2461282-11-ray.huang@amd.com>
 <58a4e81f-b0ce-49db-8a6a-f6b5bdc3d2d6@daynix.com> <ZPw2UjxogIULU722@amd.com>
 <11c227e8-a464-41ce-a435-82c570746388@daynix.com> <CADSE00Kc1Jza7sbERRndWbXgoF1s2V-FNxEOWJ6WgvomzgvMPA@mail.gmail.com>
 <cf99ac00-6f48-4778-b319-6079a931ba5d@daynix.com> <CADSE00+6zcT7iKR0JW1Bk8es6HtBpzAKa9JW6u5yyjDoLPw2KQ@mail.gmail.com>
 <5e88f5d5-5aa2-4052-b250-69c2a443344f@daynix.com> <CADSE00+BUq-6jKH3v2PYNThn+9Z4UCFcr3Cv9Z48eUX0b=6ymA@mail.gmail.com>
 <3918c96c-f106-494d-8e97-6d86cef8df27@daynix.com>
In-Reply-To: <3918c96c-f106-494d-8e97-6d86cef8df27@daynix.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 13 Sep 2023 16:18:27 +0200
Message-ID: <CADSE00LNYm+vKaYwnTAdECGUXPCfiJ7aLqszDuqSzCLLhVOHhQ@mail.gmail.com>
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
Content-Type: multipart/alternative; boundary="00000000000056833706053e3c54"

--00000000000056833706053e3c54
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 13, 2023 at 3:43=E2=80=AFPM Akihiko Odaki <akihiko.odaki@daynix=
.com>
wrote:

> On 2023/09/13 21:58, Albert Esteve wrote:
> >
> >
> > On Wed, Sep 13, 2023 at 2:22=E2=80=AFPM Akihiko Odaki <akihiko.odaki@da=
ynix.com
> > <mailto:akihiko.odaki@daynix.com>> wrote:
> >
> >     On 2023/09/13 20:34, Albert Esteve wrote:
> >      >
> >      >
> >      > On Wed, Sep 13, 2023 at 12:34=E2=80=AFPM Akihiko Odaki
> >     <akihiko.odaki@daynix.com <mailto:akihiko.odaki@daynix.com>
> >      > <mailto:akihiko.odaki@daynix.com
> >     <mailto:akihiko.odaki@daynix.com>>> wrote:
> >      >
> >      >     On 2023/09/13 16:55, Albert Esteve wrote:
> >      >      > Hi Antonio,
> >      >      >
> >      >      > If I'm not mistaken, this patch is related with:
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
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html>
> >      >
> >       <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html <
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html>>>
> >      >      > IMHO, ideally, virtio-gpu and vhost-user-gpu both, would
> >     use the
> >      >      > infrastructure from the patch I linked to store the
> >      >      > virtio objects, so that they can be later shared with
> >     other devices.
> >      >
> >      >     I don't think such sharing is possible because the resources
> are
> >      >     identified by IDs that are local to the device. That also
> >     complicates
> >      >     migration.
> >      >
> >      >     Regards,
> >      >     Akihiko Odaki
> >      >
> >      > Hi Akihiko,
> >      >
> >      > As far as I understand, the feature to export dma-bufs from the
> >      > virtgpu was introduced as part of the virtio cross-device sharin=
g
> >      > proposal [1]. Thus, it shall be posible. When virtgpu ASSING_UUI=
D,
> >      > it exports and identifies the dmabuf resource, so that when the
> >     dmabuf gets
> >      > shared inside the guest (e.g., with virtio-video), we can use th=
e
> >     assigned
> >      > UUID to find the dmabuf in the host (using the patch that I
> >     linked above),
> >      > and import it.
> >      >
> >      > [1] - https://lwn.net/Articles/828988/
> >     <https://lwn.net/Articles/828988/> <https://lwn.net/Articles/828988=
/
> >     <https://lwn.net/Articles/828988/>>
> >
> >     The problem is that virtio-gpu can have other kind of resources lik=
e
> >     pixman and OpenGL textures and manage them and DMA-BUFs with unifie=
d
> >     resource ID.
> >
> >
> > I see.
> >
> >
> >     So you cannot change:
> >     g_hash_table_insert(g->resource_uuids,
> >     GUINT_TO_POINTER(assign.resource_id), uuid);
> >     by:
> >     virtio_add_dmabuf(uuid, assign.resource_id);
> >
> >     assign.resource_id is not DMA-BUF file descriptor, and the underlyi=
ng
> >     resource my not be DMA-BUF at first place.
> >
> >
> > I didn't really look into the patch in-depth, so the code was intended
> > to give an idea of how the implementation would look like with
> > the cross-device patch API. Indeed, it is not the resource_id,
> > (I just took a brief look at the virtio specificacion 1.2), but the
> > underlying
> > resource what we want to use here.
> >
> >
> >     Also, since this lives in the common code that is not used only by
> >     virtio-gpu-gl but also virtio-gpu, which supports migration, we als=
o
> >     need to take care of that. It is not a problem for DMA-BUF as
> >     DMA-BUF is
> >     not migratable anyway, but the situation is different in this case.
> >
> >     Implementing cross-device sharing is certainly a possibility, but
> that
> >     requires more than dealing with DMA-BUFs.
> >
> >
> > So, if I understood correctly, dmabufs are just a subset of the resourc=
es
> > that the gpu manages, or can assign UUIDs to. I am not sure why
> > the virt gpu driver would want to send a ASSIGN_UUID for anything
> > that is not a dmabuf (are we sure it does?), but I am not super
> familiarized
> > with virtgpu to begin with.
>
> In my understanding, an resource will be first created as OpenGL or
> Vulkan textures and then exported as a DMA-BUF file descriptor. For
> these resource types exporting/importing code is mandatory.
>
> For pixman buffers (i.e., non-virgl device), I don't see a compelling
> reason to have cross-device sharing. It is possible to omit resource
> UUID feature from non-virgl device to avoid implementing complicated
> migration.
>

I see, thanks for the clarification.
I would assume you could avoid the UUID feature for those resources, but
I will need to check the driver implementation. It is worth checking
though, if
that would simplify the implementation.


>
> > But I see that internally, the GPU specs relate a UUID with a
> resource_id,
> > so we still need both tables:
> > - one to relate UUID with resource_id to be able to locate the
> > underlying resource
> > - the table that holds the dmabuf with the UUID for cross-device sharin=
g
> >
> > With that in mind, sounds to me that the support for cross-device
> > sharing could
> > be added on top of this patch, once
> > https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01850.html
> > <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01850.html>
> > lands.
>
> That is possible, but I think it's better to implement cross-device
> sharing at the same time introducing virtio-dmabuf.
>
> The current design of virtio-dmabuf looks somewhat inconsistent; it's
> named "dmabuf", but internally the UUIDs are stored into something named
> "resource_uuids" and it has SharedObjectType so it's more like a generic
> resource sharing mechanism. If you actually have an implementation of
> cross-device sharing using virtio-dmabuf, it will be clear what kind of
> feature is truly necessary.
>
>
Yeah, the file was named as virtio-dmabuf following the kernel
implementation. Also, because for the moment it only aims to share
dmabufs. However, virtio specs leave the virtio object defintion vague [1]
(I guess purposely). It is up to the specific devices to define what an
object
means for them. So the implementation tries to follow that, and
leave the contents of the table generic. The table can hold any kind of
object,
and the API exposes type-specific functions (for dmabufs, or others).

[1] -
https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01.html=
#x1-10500011


> Regards,
> Akihiko Odaki
>
>

--00000000000056833706053e3c54
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr" class=3D"gmail_sign=
ature"><div dir=3D"ltr"><br></div></div></div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 13, 2023 at 3:43=
=E2=80=AFPM Akihiko Odaki &lt;<a href=3D"mailto:akihiko.odaki@daynix.com">a=
kihiko.odaki@daynix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On 2023/09/13 21:58, Albert Esteve wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Wed, Sep 13, 2023 at 2:22=E2=80=AFPM Akihiko Odaki &lt;<a href=3D"m=
ailto:akihiko.odaki@daynix.com" target=3D"_blank">akihiko.odaki@daynix.com<=
/a> <br>
&gt; &lt;mailto:<a href=3D"mailto:akihiko.odaki@daynix.com" target=3D"_blan=
k">akihiko.odaki@daynix.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 2023/09/13 20:34, Albert Esteve wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; On Wed, Sep 13, 2023 at 12:34=E2=80=AFPM Akih=
iko Odaki<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:akihiko.odaki@daynix.com" tar=
get=3D"_blank">akihiko.odaki@daynix.com</a> &lt;mailto:<a href=3D"mailto:ak=
ihiko.odaki@daynix.com" target=3D"_blank">akihiko.odaki@daynix.com</a>&gt;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &lt;mailto:<a href=3D"mailto:akihiko.odaki@da=
ynix.com" target=3D"_blank">akihiko.odaki@daynix.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:akihiko.odaki@daynix.c=
om" target=3D"_blank">akihiko.odaki@daynix.com</a>&gt;&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0On 2023/09/13 16:55, Alber=
t Esteve wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Hi Antonio,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; If I&#39;m not mista=
ken, this patch is related with:<br>
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
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.gnu.org/archive=
/html/qemu-devel/2023-09/msg01853.html" rel=3D"noreferrer" target=3D"_blank=
">https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html</a> &=
lt;<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg0185=
3.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/archive/=
html/qemu-devel/2023-09/msg01853.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.gnu.org/archive=
/html/qemu-devel/2023-09/msg01853.html" rel=3D"noreferrer" target=3D"_blank=
">https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html</a> &=
lt;<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg0185=
3.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/archive/=
html/qemu-devel/2023-09/msg01853.html</a>&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; IMHO, ideally, virti=
o-gpu and vhost-user-gpu both, would<br>
&gt;=C2=A0 =C2=A0 =C2=A0use the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; infrastructure from =
the patch I linked to store the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; virtio objects, so t=
hat they can be later shared with<br>
&gt;=C2=A0 =C2=A0 =C2=A0other devices.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0I don&#39;t think such sha=
ring is possible because the resources are<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0identified by IDs that are=
 local to the device. That also<br>
&gt;=C2=A0 =C2=A0 =C2=A0complicates<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0migration.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Akihiko Odaki<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Hi Akihiko,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; As far as I understand, the feature to export=
 dma-bufs=C2=A0from the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; virtgpu was introduced as part of the virtio =
cross-device sharing<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; proposal [1]. Thus, it shall be posible. When=
 virtgpu=C2=A0ASSING_UUID,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; it exports and identifies the dmabuf resource=
, so that when the<br>
&gt;=C2=A0 =C2=A0 =C2=A0dmabuf gets<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; shared inside the guest (e.g., with virtio-vi=
deo), we can use the<br>
&gt;=C2=A0 =C2=A0 =C2=A0assigned<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; UUID to find the dmabuf in the host (using th=
e patch that I<br>
&gt;=C2=A0 =C2=A0 =C2=A0linked above),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; and import it.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; [1] - <a href=3D"https://lwn.net/Articles/828=
988/" rel=3D"noreferrer" target=3D"_blank">https://lwn.net/Articles/828988/=
</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lwn.net/Articles/828988/" re=
l=3D"noreferrer" target=3D"_blank">https://lwn.net/Articles/828988/</a>&gt;=
 &lt;<a href=3D"https://lwn.net/Articles/828988/" rel=3D"noreferrer" target=
=3D"_blank">https://lwn.net/Articles/828988/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lwn.net/Articles/828988/" re=
l=3D"noreferrer" target=3D"_blank">https://lwn.net/Articles/828988/</a>&gt;=
&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The problem is that virtio-gpu can have other kind =
of resources like<br>
&gt;=C2=A0 =C2=A0 =C2=A0pixman and OpenGL textures and manage them and DMA-=
BUFs with unified<br>
&gt;=C2=A0 =C2=A0 =C2=A0resource ID.<br>
&gt; <br>
&gt; <br>
&gt; I see.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0So you cannot change:<br>
&gt;=C2=A0 =C2=A0 =C2=A0g_hash_table_insert(g-&gt;resource_uuids,<br>
&gt;=C2=A0 =C2=A0 =C2=A0GUINT_TO_POINTER(assign.resource_id), uuid);<br>
&gt;=C2=A0 =C2=A0 =C2=A0by:<br>
&gt;=C2=A0 =C2=A0 =C2=A0virtio_add_dmabuf(uuid, assign.resource_id);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0assign.resource_id is not DMA-BUF file descriptor, =
and the underlying<br>
&gt;=C2=A0 =C2=A0 =C2=A0resource my not be DMA-BUF at first place.<br>
&gt; <br>
&gt; <br>
&gt; I didn&#39;t really look into the patch in-depth, so the=C2=A0code was=
 intended<br>
&gt; to give an idea of how the implementation would look like with<br>
&gt; the cross-device patch API. Indeed, it is not the resource_id,<br>
&gt; (I just took a brief look at the virtio specificacion=C2=A01.2), but t=
he <br>
&gt; underlying<br>
&gt; resource what we want to use here.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Also, since this lives in the common code that is n=
ot used only by<br>
&gt;=C2=A0 =C2=A0 =C2=A0virtio-gpu-gl but also virtio-gpu, which supports m=
igration, we also<br>
&gt;=C2=A0 =C2=A0 =C2=A0need to take care of that. It is not a problem for =
DMA-BUF as<br>
&gt;=C2=A0 =C2=A0 =C2=A0DMA-BUF is<br>
&gt;=C2=A0 =C2=A0 =C2=A0not migratable anyway, but the situation is differe=
nt in this case.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Implementing cross-device sharing is certainly a po=
ssibility, but that<br>
&gt;=C2=A0 =C2=A0 =C2=A0requires more than dealing with DMA-BUFs.<br>
&gt; <br>
&gt; <br>
&gt; So, if I understood correctly, dmabufs=C2=A0are just a subset of the r=
esources<br>
&gt; that the gpu manages, or can assign UUIDs to. I am not sure why<br>
&gt; the virt gpu driver would want to send a ASSIGN_UUID for anything<br>
&gt; that is not a dmabuf (are we sure it does?), but I am not super famili=
arized<br>
&gt; with virtgpu=C2=A0to begin with.<br>
<br>
In my understanding, an resource will be first created as OpenGL or <br>
Vulkan textures and then exported as a DMA-BUF file descriptor. For <br>
these resource types exporting/importing code is mandatory.<br>
<br>
For pixman buffers (i.e., non-virgl device), I don&#39;t see a compelling <=
br>
reason to have cross-device sharing. It is possible to omit resource <br>
UUID feature from non-virgl device to avoid implementing complicated <br>
migration.<br></blockquote><div><br></div><div>I see, thanks for the clarif=
ication.</div><div>I would assume you could avoid the UUID feature for thos=
e resources, but</div><div>I will need to check the driver implementation. =
It is worth checking though, if</div><div>that would simplify the implement=
ation.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
&gt; But I see that internally, the GPU specs relate a UUID with a resource=
_id,<br>
&gt; so we still need both tables:<br>
&gt; - one to relate UUID with resource_id to be able to locate the <br>
&gt; underlying resource<br>
&gt; - the table that holds the dmabuf with the UUID for cross-device shari=
ng<br>
&gt; <br>
&gt; With that in mind, sounds to me that the support for cross-device <br>
&gt; sharing could<br>
&gt; be added on top of this patch, once <br>
&gt; <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01=
850.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/archiv=
e/html/qemu-devel/2023-09/msg01850.html</a> <br>
&gt; &lt;<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2023-09/m=
sg01850.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/ar=
chive/html/qemu-devel/2023-09/msg01850.html</a>&gt;<br>
&gt; lands.<br>
<br>
That is possible, but I think it&#39;s better to implement cross-device <br=
>
sharing at the same time introducing virtio-dmabuf.<br>
<br>
The current design of virtio-dmabuf looks somewhat inconsistent; it&#39;s <=
br>
named &quot;dmabuf&quot;, but internally the UUIDs are stored into somethin=
g named <br>
&quot;resource_uuids&quot; and it has SharedObjectType so it&#39;s more lik=
e a generic <br>
resource sharing mechanism. If you actually have an implementation of <br>
cross-device sharing using virtio-dmabuf, it will be clear what kind of <br=
>
feature is truly necessary.<br>
<br></blockquote><div><br></div><div>Yeah, the file was named as virtio-dma=
buf following the kernel</div><div>implementation. Also, because for the mo=
ment it only aims to share</div><div>dmabufs. However, virtio specs leave t=
he virtio object defintion=C2=A0vague [1]</div><div>(I guess purposely). It=
 is up to the specific devices to define what an object</div><div>means for=
 them. So the implementation tries to follow that, and</div><div>leave the =
contents of the table generic. The table can hold any kind of object,</div>=
<div>and the API exposes type-specific functions (for dmabufs,=C2=A0or othe=
rs).</div><div><br></div><div>[1] -=C2=A0<a href=3D"https://docs.oasis-open=
.org/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01.html#x1-10500011">https://d=
ocs.oasis-open.org/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01.html#x1-10500=
011</a></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
Regards,<br>
Akihiko Odaki<br>
<br>
</blockquote></div></div>

--00000000000056833706053e3c54--


