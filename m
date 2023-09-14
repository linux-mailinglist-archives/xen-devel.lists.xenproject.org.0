Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FE879FD1C
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 09:18:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602076.938441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qggbj-0003py-Uh; Thu, 14 Sep 2023 07:17:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602076.938441; Thu, 14 Sep 2023 07:17:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qggbj-0003nT-Qy; Thu, 14 Sep 2023 07:17:47 +0000
Received: by outflank-mailman (input) for mailman id 602076;
 Thu, 14 Sep 2023 07:17:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=19c3=E6=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1qggbh-0003fq-GG
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 07:17:45 +0000
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [2607:f8b0:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb7b50a9-52ce-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 09:17:43 +0200 (CEST)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-68fc9a4ebe9so538280b3a.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 00:17:43 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 x42-20020a056a000bea00b0068fcb70ccafsm677725pfu.129.2023.09.14.00.17.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Sep 2023 00:17:41 -0700 (PDT)
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
X-Inumbo-ID: cb7b50a9-52ce-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1694675862; x=1695280662; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uqTMjI12oEslN/cdU8+lG8JyAFXx0YetqvWil7XV4Mg=;
        b=f2N+rFLFVDUgnwXMpZWhgPld/UR3+LIMcebL9NNZyOSGMcevFtj79+ZcjW85eG/B1I
         nQy8IHUYDkD/WBRCyCMM98QV6jddmS5BGDfe+UlWebKw48lM9yH9SxXdy72k69DtoQ8E
         hVnnqS+kFwwROzxeVzzNHMJ4IPq1LsyzWR1T/i5vAo6Wbns+6XyxhfSgx+IEe0Do74Rs
         1IqPLSi8v8Ym2v1D5Jy5WzE4grxbvIThHUi8htW4wutSDp14/mgbqSSUOVS02k9jOnVk
         SXFHg9EkpHhPB5wkTEbJLejn1fLO6HNvhka4AfgH4nm0pfLVg/5Ob46/B11avFqHM97E
         y6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694675862; x=1695280662;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uqTMjI12oEslN/cdU8+lG8JyAFXx0YetqvWil7XV4Mg=;
        b=UhfrH1+zBlE2tYG5pe2qIaal/M1ICdvJCpppTAJWEgMHczfuEHDYiFUIUhTYPBHNUH
         PMhE19FEgEEQwOSrQa3jpguNbECbLJ9QdZpue/M2Xm4A1ZeSCyKUW+v0EsHHha7zYrK6
         KGzhZru5BFTLmWt3a1Pcxw9V0lUf+ajtpwVj/va9F8Fugt2ncSzqpFYeGg66NOqA0oNj
         R5/U826JeEGZUVxZCggpN3SJnHA5bqhyUCI+ZHN2fxqDhLrllnbjdXUYlLRwk5QMA+nC
         JHQTflceZ22KkA263cIO5XyQ9yxQR4WiL0GFQ8fR/ZJxVO8vNFrr+cwxTwovsnLkBHh1
         uEqg==
X-Gm-Message-State: AOJu0Yz/faNUpnHzBNHtHVqYUi6nz7eZ4rXH+5u+xS4th5Ez1Fq10Rby
	/iKWa4xaOeZcjN7kl4dDgH09SQ==
X-Google-Smtp-Source: AGHT+IFXFXaRHWzlAZYk1FLs37f3CLh1srkB+0ieEvWKyB3reXm+soQ/M+35zTXGmfSIImIrYn3hdg==
X-Received: by 2002:a05:6a00:1d8d:b0:690:2ad9:1454 with SMTP id z13-20020a056a001d8d00b006902ad91454mr947350pfw.33.1694675861823;
        Thu, 14 Sep 2023 00:17:41 -0700 (PDT)
Message-ID: <0adaf816-e050-43c3-8284-fc41627543ef@daynix.com>
Date: Thu, 14 Sep 2023 16:17:34 +0900
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
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <CADSE00LNYm+vKaYwnTAdECGUXPCfiJ7aLqszDuqSzCLLhVOHhQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2023/09/13 23:18, Albert Esteve wrote:
> 
> 
> On Wed, Sep 13, 2023 at 3:43 PM Akihiko Odaki <akihiko.odaki@daynix.com 
> <mailto:akihiko.odaki@daynix.com>> wrote:
> 
>     On 2023/09/13 21:58, Albert Esteve wrote:
>      >
>      >
>      > On Wed, Sep 13, 2023 at 2:22 PM Akihiko Odaki
>     <akihiko.odaki@daynix.com <mailto:akihiko.odaki@daynix.com>
>      > <mailto:akihiko.odaki@daynix.com
>     <mailto:akihiko.odaki@daynix.com>>> wrote:
>      >
>      >     On 2023/09/13 20:34, Albert Esteve wrote:
>      >      >
>      >      >
>      >      > On Wed, Sep 13, 2023 at 12:34 PM Akihiko Odaki
>      >     <akihiko.odaki@daynix.com <mailto:akihiko.odaki@daynix.com>
>     <mailto:akihiko.odaki@daynix.com <mailto:akihiko.odaki@daynix.com>>
>      >      > <mailto:akihiko.odaki@daynix.com
>     <mailto:akihiko.odaki@daynix.com>
>      >     <mailto:akihiko.odaki@daynix.com
>     <mailto:akihiko.odaki@daynix.com>>>> wrote:
>      >      >
>      >      >     On 2023/09/13 16:55, Albert Esteve wrote:
>      >      >      > Hi Antonio,
>      >      >      >
>      >      >      > If I'm not mistaken, this patch is related with:
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
>       <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html> <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html>>
>      >      >
>      >     
>       <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html> <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html>>>>
>      >      >      > IMHO, ideally, virtio-gpu and vhost-user-gpu both,
>     would
>      >     use the
>      >      >      > infrastructure from the patch I linked to store the
>      >      >      > virtio objects, so that they can be later shared with
>      >     other devices.
>      >      >
>      >      >     I don't think such sharing is possible because the
>     resources are
>      >      >     identified by IDs that are local to the device. That also
>      >     complicates
>      >      >     migration.
>      >      >
>      >      >     Regards,
>      >      >     Akihiko Odaki
>      >      >
>      >      > Hi Akihiko,
>      >      >
>      >      > As far as I understand, the feature to export
>     dma-bufs from the
>      >      > virtgpu was introduced as part of the virtio cross-device
>     sharing
>      >      > proposal [1]. Thus, it shall be posible. When
>     virtgpu ASSING_UUID,
>      >      > it exports and identifies the dmabuf resource, so that
>     when the
>      >     dmabuf gets
>      >      > shared inside the guest (e.g., with virtio-video), we can
>     use the
>      >     assigned
>      >      > UUID to find the dmabuf in the host (using the patch that I
>      >     linked above),
>      >      > and import it.
>      >      >
>      >      > [1] - https://lwn.net/Articles/828988/
>     <https://lwn.net/Articles/828988/>
>      >     <https://lwn.net/Articles/828988/
>     <https://lwn.net/Articles/828988/>>
>     <https://lwn.net/Articles/828988/ <https://lwn.net/Articles/828988/>
>      >     <https://lwn.net/Articles/828988/
>     <https://lwn.net/Articles/828988/>>>
>      >
>      >     The problem is that virtio-gpu can have other kind of
>     resources like
>      >     pixman and OpenGL textures and manage them and DMA-BUFs with
>     unified
>      >     resource ID.
>      >
>      >
>      > I see.
>      >
>      >
>      >     So you cannot change:
>      >     g_hash_table_insert(g->resource_uuids,
>      >     GUINT_TO_POINTER(assign.resource_id), uuid);
>      >     by:
>      >     virtio_add_dmabuf(uuid, assign.resource_id);
>      >
>      >     assign.resource_id is not DMA-BUF file descriptor, and the
>     underlying
>      >     resource my not be DMA-BUF at first place.
>      >
>      >
>      > I didn't really look into the patch in-depth, so the code was
>     intended
>      > to give an idea of how the implementation would look like with
>      > the cross-device patch API. Indeed, it is not the resource_id,
>      > (I just took a brief look at the virtio specificacion 1.2), but the
>      > underlying
>      > resource what we want to use here.
>      >
>      >
>      >     Also, since this lives in the common code that is not used
>     only by
>      >     virtio-gpu-gl but also virtio-gpu, which supports migration,
>     we also
>      >     need to take care of that. It is not a problem for DMA-BUF as
>      >     DMA-BUF is
>      >     not migratable anyway, but the situation is different in this
>     case.
>      >
>      >     Implementing cross-device sharing is certainly a possibility,
>     but that
>      >     requires more than dealing with DMA-BUFs.
>      >
>      >
>      > So, if I understood correctly, dmabufs are just a subset of the
>     resources
>      > that the gpu manages, or can assign UUIDs to. I am not sure why
>      > the virt gpu driver would want to send a ASSIGN_UUID for anything
>      > that is not a dmabuf (are we sure it does?), but I am not super
>     familiarized
>      > with virtgpu to begin with.
> 
>     In my understanding, an resource will be first created as OpenGL or
>     Vulkan textures and then exported as a DMA-BUF file descriptor. For
>     these resource types exporting/importing code is mandatory.
> 
>     For pixman buffers (i.e., non-virgl device), I don't see a compelling
>     reason to have cross-device sharing. It is possible to omit resource
>     UUID feature from non-virgl device to avoid implementing complicated
>     migration.
> 
> 
> I see, thanks for the clarification.
> I would assume you could avoid the UUID feature for those resources, but
> I will need to check the driver implementation. It is worth checking 
> though, if
> that would simplify the implementation.
> 
> 
>      > But I see that internally, the GPU specs relate a UUID with a
>     resource_id,
>      > so we still need both tables:
>      > - one to relate UUID with resource_id to be able to locate the
>      > underlying resource
>      > - the table that holds the dmabuf with the UUID for cross-device
>     sharing
>      >
>      > With that in mind, sounds to me that the support for cross-device
>      > sharing could
>      > be added on top of this patch, once
>      >
>     https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01850.html
>     <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01850.html>
>      >
>     <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01850.html
>     <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01850.html>>
>      > lands.
> 
>     That is possible, but I think it's better to implement cross-device
>     sharing at the same time introducing virtio-dmabuf.
> 
>     The current design of virtio-dmabuf looks somewhat inconsistent; it's
>     named "dmabuf", but internally the UUIDs are stored into something
>     named
>     "resource_uuids" and it has SharedObjectType so it's more like a
>     generic
>     resource sharing mechanism. If you actually have an implementation of
>     cross-device sharing using virtio-dmabuf, it will be clear what kind of
>     feature is truly necessary.
> 
> 
> Yeah, the file was named as virtio-dmabuf following the kernel
> implementation. Also, because for the moment it only aims to share
> dmabufs. However, virtio specs leave the virtio object defintion vague [1]
> (I guess purposely). It is up to the specific devices to define what an 
> object
> means for them. So the implementation tries to follow that, and
> leave the contents of the table generic. The table can hold any kind of 
> object,
> and the API exposes type-specific functions (for dmabufs, or others).
In the guest kernel, the name "virtio_dma_buf" represents the interface 
between the *guest* kernel and *guest* user-space. It makes sense since 
the cross-device resource sharing is managed by the userspace and 
DMA-BUF is the only interface between them for this purpose.

The situation is different for QEMU; QEMU interacts with backends using 
backend-specific interfaces (OpenGL/pixman) and virgl is capable to 
export textures as DMA-BUF. DMA-BUF is not universal in this sense. As 
such, we cannot just borrow the kernel-side naming but invent one.

