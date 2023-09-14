Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A71FD7A0B14
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 18:57:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602598.939257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgpdL-0002Kp-3K; Thu, 14 Sep 2023 16:56:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602598.939257; Thu, 14 Sep 2023 16:56:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgpdL-0002IO-0W; Thu, 14 Sep 2023 16:56:03 +0000
Received: by outflank-mailman (input) for mailman id 602598;
 Thu, 14 Sep 2023 16:56:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=19c3=E6=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1qgpdJ-0002Gv-8Z
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 16:56:01 +0000
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [2607:f8b0:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9217ee60-531f-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 18:55:58 +0200 (CEST)
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-577fb90bb76so524068a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 09:55:56 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 ie18-20020a17090b401200b0026971450601sm1589586pjb.7.2023.09.14.09.55.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Sep 2023 09:55:54 -0700 (PDT)
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
X-Inumbo-ID: 9217ee60-531f-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1694710555; x=1695315355; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OrtqeKPEOOIINFRPKzqcHJS5KfxI2xTmwWo1vlg8v1c=;
        b=i5nvDajtX2/6Cv5naR+jsijkeWfJOElJFMSDn6nehhcm/3bPtqurhAMNnrenrLqoKE
         j7sTtbdj6yiJbI1Mj4qPNOUl6N3bX1oAO/xxOBP3m07XZK+fnfnORbnzNrYi4qkngaxe
         oj/b+JCqEd4jfb13n2htww3D5Z1RQuicJZFVHtTur75fCeRPXf59NXQF5ULI2t6kBV3/
         szzMa8SY5Cim0DY8hoEnIsJvyI87D4g6bOMqlVzJNoT20+bE0lQrRAxeXUfIYIPbSzKP
         BQ9N94YAoyqC1v18JtoIsLVsq7ptI644+9e1qYcTuzhG5W9Qr/5EUTVzFLrV2L6pHE/c
         ZAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694710555; x=1695315355;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OrtqeKPEOOIINFRPKzqcHJS5KfxI2xTmwWo1vlg8v1c=;
        b=QTyKaS1Mx7urGorP02I4+G+oNN4SyS+24Wy2e2i/+OP9SFVAO192JvK/mE/XKIYqjo
         /JZCM9PmxLy3ENzgWWdTfyd10mo3sVGgSd8eOuz6ybw+RK7RpRuxhcYw5t8Dzw4CzSJA
         VB/Arw3nvm0vLNDawSzQriAEACG3k0glMvNgGcTSsvOzCW1WZaHltyjaQYlPn315Jkst
         +GxtX/ktvcQ/oWAkbOng2eNOcRU6KCoB+RyyS63wDuQyTZBpkYKx7yAPRnme736kJlIE
         Ajy3UhXxzELwv430telzoWTNxPcqe92xB8rU6GAHOlrDsrj3GFA3Rp8bMgVDbdT/aW/V
         RLog==
X-Gm-Message-State: AOJu0YztcDhxMO6MSQWFrW7PSJXU0EzgiUDLsjFBnVx1wV3js9Y+QoP8
	XN/GmACfpQDeZBfqpGM5Yh2fmw==
X-Google-Smtp-Source: AGHT+IFH+aMJ9MxqVh7hQkBwUE8p1M4OsCi6Yoo2pLbXlxxU5AWS+iFf9SUPNMuXAmVTCmy9BtEkkw==
X-Received: by 2002:a17:90a:ba8b:b0:26b:5ba4:4948 with SMTP id t11-20020a17090aba8b00b0026b5ba44948mr5760315pjr.12.1694710554786;
        Thu, 14 Sep 2023 09:55:54 -0700 (PDT)
Message-ID: <391f745f-d00f-4289-be68-7590bceb902d@daynix.com>
Date: Fri, 15 Sep 2023 01:55:47 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [QEMU PATCH v4 10/13] virtio-gpu: Resource UUID
To: Albert Esteve <aesteve@redhat.com>
Cc: Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Antonio Caggiano <antonio.caggiano@collabora.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Robert Beckett <bob.beckett@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 "ernunes@redhat.com" <ernunes@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alyssa Ross <hi@alyssa.is>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
 "Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>,
 "Huang, Honglei1" <Honglei1.Huang@amd.com>,
 "Zhang, Julia" <Julia.Zhang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
References: <20230831093252.2461282-1-ray.huang@amd.com>
 <20230831093252.2461282-11-ray.huang@amd.com>
 <58a4e81f-b0ce-49db-8a6a-f6b5bdc3d2d6@daynix.com> <ZPw2UjxogIULU722@amd.com>
 <11c227e8-a464-41ce-a435-82c570746388@daynix.com>
 <CADSE00Kc1Jza7sbERRndWbXgoF1s2V-FNxEOWJ6WgvomzgvMPA@mail.gmail.com>
 <cf99ac00-6f48-4778-b319-6079a931ba5d@daynix.com>
 <CADSE00+6zcT7iKR0JW1Bk8es6HtBpzAKa9JW6u5yyjDoLPw2KQ@mail.gmail.com>
 <5e88f5d5-5aa2-4052-b250-69c2a443344f@daynix.com>
 <CADSE00+BUq-6jKH3v2PYNThn+9Z4UCFcr3Cv9Z48eUX0b=6ymA@mail.gmail.com>
 <3918c96c-f106-494d-8e97-6d86cef8df27@daynix.com>
 <CADSE00LNYm+vKaYwnTAdECGUXPCfiJ7aLqszDuqSzCLLhVOHhQ@mail.gmail.com>
 <0adaf816-e050-43c3-8284-fc41627543ef@daynix.com>
 <CADSE00Kyid+=FkkopSGDAyeJ_MY2exDdxoPf18pzthKy70kkKg@mail.gmail.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <CADSE00Kyid+=FkkopSGDAyeJ_MY2exDdxoPf18pzthKy70kkKg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2023/09/14 17:29, Albert Esteve wrote:
> 
> 
> On Thu, Sep 14, 2023 at 9:17 AM Akihiko Odaki <akihiko.odaki@daynix.com 
> <mailto:akihiko.odaki@daynix.com>> wrote:
> 
>     On 2023/09/13 23:18, Albert Esteve wrote:
>      >
>      >
>      > On Wed, Sep 13, 2023 at 3:43 PM Akihiko Odaki
>     <akihiko.odaki@daynix.com <mailto:akihiko.odaki@daynix.com>
>      > <mailto:akihiko.odaki@daynix.com
>     <mailto:akihiko.odaki@daynix.com>>> wrote:
>      >
>      >     On 2023/09/13 21:58, Albert Esteve wrote:
>      >      >
>      >      >
>      >      > On Wed, Sep 13, 2023 at 2:22 PM Akihiko Odaki
>      >     <akihiko.odaki@daynix.com <mailto:akihiko.odaki@daynix.com>
>     <mailto:akihiko.odaki@daynix.com <mailto:akihiko.odaki@daynix.com>>
>      >      > <mailto:akihiko.odaki@daynix.com
>     <mailto:akihiko.odaki@daynix.com>
>      >     <mailto:akihiko.odaki@daynix.com
>     <mailto:akihiko.odaki@daynix.com>>>> wrote:
>      >      >
>      >      >     On 2023/09/13 20:34, Albert Esteve wrote:
>      >      >      >
>      >      >      >
>      >      >      > On Wed, Sep 13, 2023 at 12:34 PM Akihiko Odaki
>      >      >     <akihiko.odaki@daynix.com
>     <mailto:akihiko.odaki@daynix.com> <mailto:akihiko.odaki@daynix.com
>     <mailto:akihiko.odaki@daynix.com>>
>      >     <mailto:akihiko.odaki@daynix.com
>     <mailto:akihiko.odaki@daynix.com> <mailto:akihiko.odaki@daynix.com
>     <mailto:akihiko.odaki@daynix.com>>>
>      >      >      > <mailto:akihiko.odaki@daynix.com
>     <mailto:akihiko.odaki@daynix.com>
>      >     <mailto:akihiko.odaki@daynix.com
>     <mailto:akihiko.odaki@daynix.com>>
>      >      >     <mailto:akihiko.odaki@daynix.com
>     <mailto:akihiko.odaki@daynix.com>
>      >     <mailto:akihiko.odaki@daynix.com
>     <mailto:akihiko.odaki@daynix.com>>>>> wrote:
>      >      >      >
>      >      >      >     On 2023/09/13 16:55, Albert Esteve wrote:
>      >      >      >      > Hi Antonio,
>      >      >      >      >
>      >      >      >      > If I'm not mistaken, this patch is related with:
>      >      >      >      >
>      >      >      >
>      >      >
>      >
>     https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html
>     <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html>
>      >   
>       <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html>>
>      >      >
>      >     
>       <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html> <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html>>>
>      >      >      >
>      >      >
>      >     
>       <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html> <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html>> <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html> <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html>>>>
>      >      >      >      >
>      >      >      >
>      >      >
>      >     
>       <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html> <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html>> <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html> <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html>>>
>      >      >      >
>      >      >
>      >     
>       <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html> <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html>> <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html> <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html>>>>>
>      >      >      >      > IMHO, ideally, virtio-gpu and vhost-user-gpu
>     both,
>      >     would
>      >      >     use the
>      >      >      >      > infrastructure from the patch I linked to
>     store the
>      >      >      >      > virtio objects, so that they can be later
>     shared with
>      >      >     other devices.
>      >      >      >
>      >      >      >     I don't think such sharing is possible because the
>      >     resources are
>      >      >      >     identified by IDs that are local to the device.
>     That also
>      >      >     complicates
>      >      >      >     migration.
>      >      >      >
>      >      >      >     Regards,
>      >      >      >     Akihiko Odaki
>      >      >      >
>      >      >      > Hi Akihiko,
>      >      >      >
>      >      >      > As far as I understand, the feature to export
>      >     dma-bufs from the
>      >      >      > virtgpu was introduced as part of the virtio
>     cross-device
>      >     sharing
>      >      >      > proposal [1]. Thus, it shall be posible. When
>      >     virtgpu ASSING_UUID,
>      >      >      > it exports and identifies the dmabuf resource, so that
>      >     when the
>      >      >     dmabuf gets
>      >      >      > shared inside the guest (e.g., with virtio-video),
>     we can
>      >     use the
>      >      >     assigned
>      >      >      > UUID to find the dmabuf in the host (using the
>     patch that I
>      >      >     linked above),
>      >      >      > and import it.
>      >      >      >
>      >      >      > [1] - https://lwn.net/Articles/828988/
>     <https://lwn.net/Articles/828988/>
>      >     <https://lwn.net/Articles/828988/
>     <https://lwn.net/Articles/828988/>>
>      >      >     <https://lwn.net/Articles/828988/
>     <https://lwn.net/Articles/828988/>
>      >     <https://lwn.net/Articles/828988/
>     <https://lwn.net/Articles/828988/>>>
>      >     <https://lwn.net/Articles/828988/
>     <https://lwn.net/Articles/828988/> <https://lwn.net/Articles/828988/
>     <https://lwn.net/Articles/828988/>>
>      >      >     <https://lwn.net/Articles/828988/
>     <https://lwn.net/Articles/828988/>
>      >     <https://lwn.net/Articles/828988/
>     <https://lwn.net/Articles/828988/>>>>
>      >      >
>      >      >     The problem is that virtio-gpu can have other kind of
>      >     resources like
>      >      >     pixman and OpenGL textures and manage them and
>     DMA-BUFs with
>      >     unified
>      >      >     resource ID.
>      >      >
>      >      >
>      >      > I see.
>      >      >
>      >      >
>      >      >     So you cannot change:
>      >      >     g_hash_table_insert(g->resource_uuids,
>      >      >     GUINT_TO_POINTER(assign.resource_id), uuid);
>      >      >     by:
>      >      >     virtio_add_dmabuf(uuid, assign.resource_id);
>      >      >
>      >      >     assign.resource_id is not DMA-BUF file descriptor, and the
>      >     underlying
>      >      >     resource my not be DMA-BUF at first place.
>      >      >
>      >      >
>      >      > I didn't really look into the patch in-depth, so the code was
>      >     intended
>      >      > to give an idea of how the implementation would look like with
>      >      > the cross-device patch API. Indeed, it is not the resource_id,
>      >      > (I just took a brief look at the virtio
>     specificacion 1.2), but the
>      >      > underlying
>      >      > resource what we want to use here.
>      >      >
>      >      >
>      >      >     Also, since this lives in the common code that is not used
>      >     only by
>      >      >     virtio-gpu-gl but also virtio-gpu, which supports
>     migration,
>      >     we also
>      >      >     need to take care of that. It is not a problem for
>     DMA-BUF as
>      >      >     DMA-BUF is
>      >      >     not migratable anyway, but the situation is different
>     in this
>      >     case.
>      >      >
>      >      >     Implementing cross-device sharing is certainly a
>     possibility,
>      >     but that
>      >      >     requires more than dealing with DMA-BUFs.
>      >      >
>      >      >
>      >      > So, if I understood correctly, dmabufs are just a subset
>     of the
>      >     resources
>      >      > that the gpu manages, or can assign UUIDs to. I am not
>     sure why
>      >      > the virt gpu driver would want to send a ASSIGN_UUID for
>     anything
>      >      > that is not a dmabuf (are we sure it does?), but I am not
>     super
>      >     familiarized
>      >      > with virtgpu to begin with.
>      >
>      >     In my understanding, an resource will be first created as
>     OpenGL or
>      >     Vulkan textures and then exported as a DMA-BUF file
>     descriptor. For
>      >     these resource types exporting/importing code is mandatory.
>      >
>      >     For pixman buffers (i.e., non-virgl device), I don't see a
>     compelling
>      >     reason to have cross-device sharing. It is possible to omit
>     resource
>      >     UUID feature from non-virgl device to avoid implementing
>     complicated
>      >     migration.
>      >
>      >
>      > I see, thanks for the clarification.
>      > I would assume you could avoid the UUID feature for those
>     resources, but
>      > I will need to check the driver implementation. It is worth checking
>      > though, if
>      > that would simplify the implementation.
>      >
>      >
>      >      > But I see that internally, the GPU specs relate a UUID with a
>      >     resource_id,
>      >      > so we still need both tables:
>      >      > - one to relate UUID with resource_id to be able to locate the
>      >      > underlying resource
>      >      > - the table that holds the dmabuf with the UUID for
>     cross-device
>      >     sharing
>      >      >
>      >      > With that in mind, sounds to me that the support for
>     cross-device
>      >      > sharing could
>      >      > be added on top of this patch, once
>      >      >
>      >
>     https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01850.html
>     <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01850.html>
>      >   
>       <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01850.html <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01850.html>>
>      >      >
>      >   
>       <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01850.html <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01850.html>
>      >   
>       <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01850.html <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01850.html>>>
>      >      > lands.
>      >
>      >     That is possible, but I think it's better to implement
>     cross-device
>      >     sharing at the same time introducing virtio-dmabuf.
>      >
>      >     The current design of virtio-dmabuf looks somewhat
>     inconsistent; it's
>      >     named "dmabuf", but internally the UUIDs are stored into
>     something
>      >     named
>      >     "resource_uuids" and it has SharedObjectType so it's more like a
>      >     generic
>      >     resource sharing mechanism. If you actually have an
>     implementation of
>      >     cross-device sharing using virtio-dmabuf, it will be clear
>     what kind of
>      >     feature is truly necessary.
>      >
>      >
>      > Yeah, the file was named as virtio-dmabuf following the kernel
>      > implementation. Also, because for the moment it only aims to share
>      > dmabufs. However, virtio specs leave the virtio object
>     defintion vague [1]
>      > (I guess purposely). It is up to the specific devices to define
>     what an
>      > object
>      > means for them. So the implementation tries to follow that, and
>      > leave the contents of the table generic. The table can hold any
>     kind of
>      > object,
>      > and the API exposes type-specific functions (for dmabufs, or others).
>     In the guest kernel, the name "virtio_dma_buf" represents the interface
>     between the *guest* kernel and *guest* user-space. It makes sense since
>     the cross-device resource sharing is managed by the userspace and
>     DMA-BUF is the only interface between them for this purpose.
> 
>     The situation is different for QEMU; QEMU interacts with backends using
>     backend-specific interfaces (OpenGL/pixman) and virgl is capable to
>     export textures as DMA-BUF. DMA-BUF is not universal in this sense. As
>     such, we cannot just borrow the kernel-side naming but invent one.
> 
> It is not a gpu-specific feature. It is a generic cross-device sharing
> mechanism for virtio objects. In this case, virtio objects happen to be
> dmabufs in this first iteration. Hence, the name.
> 
> virtio-gpu (and vhost-user-gpu) will use this feature only with virgl, 
> that is
> fine, and transversal to the object-sharing mechanism. It allows
> to share dmabufs in the host following how they are shared in the guest.
> The virtgpu driver may call ASSIGN_UUID for other types of resources 
> (not sure,
> but could be), but they will never be shared with other virtio devices.
> So they are not too relevant. Also, the shared objects table could 
> potentially
> be accessed from any virtio device, not only virtio-gpu or virtio-video.

The virtgpu driver will call ASSIGN_UUID for resources that are backed 
with pixman buffer. What is used as the backing store for resources is 
an implementation detail of VMM and the guest cannot know it. For the 
guest, they are same kind of resources (2D images).

