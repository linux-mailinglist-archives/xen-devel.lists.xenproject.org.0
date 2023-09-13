Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5BC79E14E
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 09:58:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601014.936906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgKlb-00063g-TL; Wed, 13 Sep 2023 07:58:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601014.936906; Wed, 13 Sep 2023 07:58:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgKlb-00061d-Qh; Wed, 13 Sep 2023 07:58:31 +0000
Received: by outflank-mailman (input) for mailman id 601014;
 Wed, 13 Sep 2023 07:55:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gBHS=E5=redhat.com=aesteve@srs-se1.protection.inumbo.net>)
 id 1qgKj6-0005LX-4m
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 07:55:56 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6d36fbd-520a-11ee-8786-cb3800f73035;
 Wed, 13 Sep 2023 09:55:55 +0200 (CEST)
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648--2TYClfzPHGuVobdVyI3Sw-1; Wed, 13 Sep 2023 03:55:52 -0400
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-573f6f0fe9aso8323047a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Sep 2023 00:55:52 -0700 (PDT)
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
X-Inumbo-ID: f6d36fbd-520a-11ee-8786-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694591753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e+T78EfLbD3W1gVbFVQtm2/Wf6HsuIT6BGfT58aZwZw=;
	b=ICjNcfy9dybFZGcDaRR/VBJaOb78RakefmuOX3LpTBZhAJl+xqol3QbjfG2dqAVdI4K9mX
	/0kIHfu48cAYvexy4NxDyKiEP80XZF3Gykk32IfiLLPsjSwSwXADbvUB1AIYpA0O5pSScx
	/72EaeFIUrbU+VSE2Bqi4aMgqaSRX5A=
X-MC-Unique: -2TYClfzPHGuVobdVyI3Sw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694591751; x=1695196551;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e+T78EfLbD3W1gVbFVQtm2/Wf6HsuIT6BGfT58aZwZw=;
        b=CoHStknAKlzH6SsnBArV3Hs1Mm868bCvJr1BSPVmq709lrV174Dqt+lLcCK9f8fkGN
         hrR28lT9ylBXEve6ELp6M9gRrNR+6IDVMbyErniNrlUR1j37Vs4LjgOzSx+xh8OzaNuD
         7bKaQ6euvHGxABKr56VXf6O68Rwovu2l2MWvkKJyn+08bJWpLLZERDA8gE2gryGThYRW
         eV2nmhOcoh7lqGU5841p/M8tqmT4DPdpGo5dRYBgEy1ODb5LS6K+3bzEUTN40YDxXM1o
         jXBadLBrAgUANWw+UYFfpurmuOhaSAwjr1LkPasEsjqW7olSzbhd2Fvw9E0Pf9KRMpzo
         JMPw==
X-Gm-Message-State: AOJu0Yxiq0opq+k642a2xBnoNdxK75x+JJHPHj6+P7wL0laFVzDPogST
	D3N21dqXsDKQTNZw7fT/Nf9+pbFcwOWYL/98xu7K9z+SvHp2xLyR6yzG0WCUQ7jhzR8UnOZYffb
	T1WSWqXBE/tYLpFtLFJwCVYDS0qpL97owjkgKwLilTa8=
X-Received: by 2002:a17:90a:8b08:b0:26d:19bb:8638 with SMTP id y8-20020a17090a8b0800b0026d19bb8638mr1496797pjn.10.1694591751108;
        Wed, 13 Sep 2023 00:55:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQDoMVGHdXgv2xWZ7r2lD7d0hK7dARmCmw/01FsyS8gPxJf+i2yGrB7deHiK5PDvY06n/0dOktVZqMDRxiiEs=
X-Received: by 2002:a17:90a:8b08:b0:26d:19bb:8638 with SMTP id
 y8-20020a17090a8b0800b0026d19bb8638mr1496776pjn.10.1694591750673; Wed, 13 Sep
 2023 00:55:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230831093252.2461282-1-ray.huang@amd.com> <20230831093252.2461282-11-ray.huang@amd.com>
 <58a4e81f-b0ce-49db-8a6a-f6b5bdc3d2d6@daynix.com> <ZPw2UjxogIULU722@amd.com> <11c227e8-a464-41ce-a435-82c570746388@daynix.com>
In-Reply-To: <11c227e8-a464-41ce-a435-82c570746388@daynix.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 13 Sep 2023 09:55:39 +0200
Message-ID: <CADSE00Kc1Jza7sbERRndWbXgoF1s2V-FNxEOWJ6WgvomzgvMPA@mail.gmail.com>
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
Content-Type: multipart/alternative; boundary="00000000000056af01060538e319"

--00000000000056af01060538e319
Content-Type: text/plain; charset="UTF-8"

Hi Antonio,

If I'm not mistaken, this patch is related with:
https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html
IMHO, ideally, virtio-gpu and vhost-user-gpu both, would use the
infrastructure from the patch I linked to store the
virtio objects, so that they can be later shared with other devices.

Which, in terms of code, would mean changing:
g_hash_table_insert(g->resource_uuids,
GUINT_TO_POINTER(assign.resource_id), uuid);
by:
virtio_add_dmabuf(uuid, assign.resource_id);

...and simplify part of the infrastructure.

Let me know what you think.

Regard,
Albert

--00000000000056af01060538e319
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div>Hi Antonio,</div><div><br>=
</div><div>If I&#39;m not mistaken, this patch is related with:=C2=A0<a hre=
f=3D"https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html">h=
ttps://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html</a></div=
><div>IMHO, ideally, virtio-gpu and vhost-user-gpu both, would use the infr=
astructure from the patch I linked to store the<br></div><div>virtio object=
s, so that they can be later shared with other devices.</div><div><br></div=
><div>Which, in terms of code, would mean changing:</div><div>g_hash_table_=
insert(g-&gt;resource_uuids, GUINT_TO_POINTER(assign.resource_id), uuid);<b=
r></div><div>by:</div><div>virtio_add_dmabuf(uuid, assign.resource_id);</di=
v><div><br></div><div>...and simplify part of the infrastructure.</div><div=
><br></div><div>Let me know what you think.</div><div><br></div><div>Regard=
,</div><div>Albert</div></div></div>

--00000000000056af01060538e319--


