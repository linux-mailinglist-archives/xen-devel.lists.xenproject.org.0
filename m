Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7223D79E6E8
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 13:35:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601220.937177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgO90-0001dK-OZ; Wed, 13 Sep 2023 11:34:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601220.937177; Wed, 13 Sep 2023 11:34:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgO90-0001aC-Li; Wed, 13 Sep 2023 11:34:54 +0000
Received: by outflank-mailman (input) for mailman id 601220;
 Wed, 13 Sep 2023 11:34:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gBHS=E5=redhat.com=aesteve@srs-se1.protection.inumbo.net>)
 id 1qgO8z-0001a6-7P
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 11:34:53 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8cdd7fb7-5229-11ee-8786-cb3800f73035;
 Wed, 13 Sep 2023 13:34:51 +0200 (CEST)
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-lXvvlqzJPV2qN_oeh8wiYA-1; Wed, 13 Sep 2023 07:34:46 -0400
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-27372e336b2so810509a91.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Sep 2023 04:34:46 -0700 (PDT)
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
X-Inumbo-ID: 8cdd7fb7-5229-11ee-8786-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694604890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zMskR6cu9i22y34XL44NEQPqeIL9khl3qtNSgvRoqCA=;
	b=XzeZqGJV0h6ly2gHAEw4VOvWXWWi6u0016XZ83w35st0SP0UZaG90Hl+3bNp8Drh6TpcWd
	epl0seBj9ZPluX3mUzhY6uchLv2TxI7PhOIebJt4jOUMahGFjNJX3aqAa9DAH0tJnesnNh
	2nGClfGUlcAsWz7AOlUvslONPEW2J+I=
X-MC-Unique: lXvvlqzJPV2qN_oeh8wiYA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694604885; x=1695209685;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zMskR6cu9i22y34XL44NEQPqeIL9khl3qtNSgvRoqCA=;
        b=t1HhZQDiLs9g1Mg3u+NTb4vl2L1sYiplblHnbOxv2SX4JoLoIDvN5gLTFLCR1C7DbT
         lC0jIgBTEkgxdYqx55JqMF2aO4A3s8dTlCYXI3Tp5jk3pQ7lvHFF4j5N3hIG1uCFTKya
         LS13dExlc1XyO4hlE+f8Zo4lgL5FBjTx7iEH9r1keoz45luxupcwpz+aCjh0mXMQ4mPB
         83N4QTVylK5Q+WnuNNKzMKoex4P+VbUkJaEruPTTeb3UW4/3uYcSZRfAH2M2Duo/5uDK
         GRwOsTjhiPct281IXITghviBZnqfPBASl4Zf7NzZrmzA3ttBwXvm/dKICux6b4NPCRtk
         epJQ==
X-Gm-Message-State: AOJu0YwruJfen8L4xZ+Pe86h76EhPHrRZdS3Lx7vjPBttuSKmuCuhONq
	8Jq0yLg18yxhDxzCw/tCOhFEtqwqNDwLHrv3/tanTt+cfW9gyt32Dz1q2gDwcFVPeAcBVB+9LL9
	y6afOfNbCpQOoAsZE17uFEApWqnWNnmv1u0YQYq2y/e0=
X-Received: by 2002:a17:90b:4b82:b0:26d:689f:4253 with SMTP id lr2-20020a17090b4b8200b0026d689f4253mr7447233pjb.6.1694604885610;
        Wed, 13 Sep 2023 04:34:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJWBwNCbFL7Jyu5Boq2Q8xMqbev4t/zbOs3GqV/MXKXOUFx1M1LMxGo4WIMdWApSj5iZlPgc9WjXu2ERG7xSA=
X-Received: by 2002:a17:90b:4b82:b0:26d:689f:4253 with SMTP id
 lr2-20020a17090b4b8200b0026d689f4253mr7447190pjb.6.1694604885258; Wed, 13 Sep
 2023 04:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230831093252.2461282-1-ray.huang@amd.com> <20230831093252.2461282-11-ray.huang@amd.com>
 <58a4e81f-b0ce-49db-8a6a-f6b5bdc3d2d6@daynix.com> <ZPw2UjxogIULU722@amd.com>
 <11c227e8-a464-41ce-a435-82c570746388@daynix.com> <CADSE00Kc1Jza7sbERRndWbXgoF1s2V-FNxEOWJ6WgvomzgvMPA@mail.gmail.com>
 <cf99ac00-6f48-4778-b319-6079a931ba5d@daynix.com>
In-Reply-To: <cf99ac00-6f48-4778-b319-6079a931ba5d@daynix.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 13 Sep 2023 13:34:34 +0200
Message-ID: <CADSE00+6zcT7iKR0JW1Bk8es6HtBpzAKa9JW6u5yyjDoLPw2KQ@mail.gmail.com>
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
Content-Type: multipart/alternative; boundary="000000000000388aee06053bf2d0"

--000000000000388aee06053bf2d0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 13, 2023 at 12:34=E2=80=AFPM Akihiko Odaki <akihiko.odaki@dayni=
x.com>
wrote:

> On 2023/09/13 16:55, Albert Esteve wrote:
> > Hi Antonio,
> >
> > If I'm not mistaken, this patch is related with:
> > https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html
> > <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html>
> > IMHO, ideally, virtio-gpu and vhost-user-gpu both, would use the
> > infrastructure from the patch I linked to store the
> > virtio objects, so that they can be later shared with other devices.
>
> I don't think such sharing is possible because the resources are
> identified by IDs that are local to the device. That also complicates
> migration.
>
> Regards,
> Akihiko Odaki
>
> Hi Akihiko,

As far as I understand, the feature to export dma-bufs from the
virtgpu was introduced as part of the virtio cross-device sharing
proposal [1]. Thus, it shall be posible. When virtgpu ASSING_UUID,
it exports and identifies the dmabuf resource, so that when the dmabuf gets
shared inside the guest (e.g., with virtio-video), we can use the assigned
UUID to find the dmabuf in the host (using the patch that I linked above),
and import it.

[1] - https://lwn.net/Articles/828988/

--000000000000388aee06053bf2d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 13, 2023 at 12:34=E2=80=
=AFPM Akihiko Odaki &lt;<a href=3D"mailto:akihiko.odaki@daynix.com" target=
=3D"_blank">akihiko.odaki@daynix.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On 2023/09/13 16:55, Albert Esteve wrot=
e:<br>
&gt; Hi Antonio,<br>
&gt; <br>
&gt; If I&#39;m not mistaken, this patch is related with: <br>
&gt; <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01=
853.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/archiv=
e/html/qemu-devel/2023-09/msg01853.html</a> <br>
&gt; &lt;<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2023-09/m=
sg01853.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/ar=
chive/html/qemu-devel/2023-09/msg01853.html</a>&gt;<br>
&gt; IMHO, ideally, virtio-gpu and vhost-user-gpu both, would use the <br>
&gt; infrastructure from the patch I linked to store the<br>
&gt; virtio objects, so that they can be later shared with other devices.<b=
r>
<br>
I don&#39;t think such sharing is possible because the resources are <br>
identified by IDs that are local to the device. That also complicates <br>
migration.<br>
<br>
Regards,<br>
Akihiko Odaki<br>
<br></blockquote><div>Hi Akihiko,</div><div><br></div><div>As far as I unde=
rstand, the feature to export dma-bufs=C2=A0from the</div><div>virtgpu was =
introduced as part of the virtio cross-device sharing</div><div>proposal [1=
]. Thus, it shall be posible. When virtgpu=C2=A0ASSING_UUID,</div><div>it e=
xports and identifies the dmabuf resource, so that when the dmabuf gets</di=
v><div>shared inside the guest (e.g., with virtio-video), we can use the as=
signed</div><div>UUID to find the dmabuf in the host (using the patch that =
I linked above),</div><div>and import it.</div><div><br></div><div>[1] -=C2=
=A0<a href=3D"https://lwn.net/Articles/828988/" target=3D"_blank">https://l=
wn.net/Articles/828988/</a></div></div></div>

--000000000000388aee06053bf2d0--


