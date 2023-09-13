Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA8579E98C
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 15:44:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601339.937357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgQ9j-0003LK-81; Wed, 13 Sep 2023 13:43:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601339.937357; Wed, 13 Sep 2023 13:43:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgQ9j-0003JF-3H; Wed, 13 Sep 2023 13:43:47 +0000
Received: by outflank-mailman (input) for mailman id 601339;
 Wed, 13 Sep 2023 13:43:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o3wF=E5=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1qgQ9h-0003J9-A1
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 13:43:45 +0000
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [2607:f8b0:4864:20::c33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d5e3af2-523b-11ee-9b0d-b553b5be7939;
 Wed, 13 Sep 2023 15:43:43 +0200 (CEST)
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-57358a689d2so4296501eaf.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Sep 2023 06:43:43 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a637e03000000b0057754ae4eb7sm6425543pgc.39.2023.09.13.06.43.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Sep 2023 06:43:41 -0700 (PDT)
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
X-Inumbo-ID: 8d5e3af2-523b-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1694612622; x=1695217422; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jzquTyFTIWLKE8HIbexGNq7IS2ePO5uzHkINhBe2ZVw=;
        b=1sS7zzB6hmoGIgIuOcSEug5jhVdqWoc3V47kojdMnOnWOJ8z3/erBtQ2ulCFyLmtjG
         WFdMeUHlCju6bGYm8AKxp1QQ33LVEB3Lzez0WWmRHirzHE/PcJ9WGqMCCINtkvcddyT/
         ciCPbXzn1e/2hAtTiaA5J+qd2Z3xAUf3saerX7jGIMpuGB+ZbW9d8aQDcq1s4/FjxOeT
         XoElN1Y4R7HvnmEjAQs3mUEbJYx0BBkKOo9KG0WmkCuchfyWbJPGhKCowJ4GVcX3b5Z3
         6VwaWdbsYLFdr1Q+82HuXnMkkVSBOZy4YyOcJT03tYsX6RrwWOHvxvZMmfV1zXGcgi03
         ux0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694612622; x=1695217422;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jzquTyFTIWLKE8HIbexGNq7IS2ePO5uzHkINhBe2ZVw=;
        b=J5csugNC5HF3ZlpAUUm2fy7RhkDuQnRY9W5uHn+bx/sfPbRq2xUJAKYlYDVs8qsiN+
         OiZ8aDBbwLI9zjXrhScwg3T5vBhPnCfxKnVJ/7If3A14vdr1MLpuE7zIKisFGQ/gYhpt
         r0DRBsb6iuRyAuCv+K6PWce8fBuPe7BLZYt/RIK703hfX7KyhmSnPQTx1zRNmOF61TJB
         zFGQcvxfawcxGm+b0hGAkHTWE22oDy2Yrgt3FGPlPeSv8aWseCRM+HapcHiK9eh9pQKO
         ZNpLxC1G+ishx2Z9rn8YOim92jXal6WoTE341iSOWcGKA7U8+VIsG1BaH6BIDIOt7S3f
         U0BQ==
X-Gm-Message-State: AOJu0YxN7LDbsvZAVx3N+fA4Incikc+iienYDy4LKRnPU+0XgfUYSZEw
	9F+mikgA7bo0x6otlJRRPj2SLg==
X-Google-Smtp-Source: AGHT+IEjkozRTXVlPn3DXYlS/zHkwLkZFxqYB9oImVmpvIGYOqRLulaJpbERB9hWp44RWG6Uk7Evlg==
X-Received: by 2002:a05:6358:278b:b0:139:5a46:ea7e with SMTP id l11-20020a056358278b00b001395a46ea7emr2890869rwb.28.1694612621726;
        Wed, 13 Sep 2023 06:43:41 -0700 (PDT)
Message-ID: <3918c96c-f106-494d-8e97-6d86cef8df27@daynix.com>
Date: Wed, 13 Sep 2023 22:43:34 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [QEMU PATCH v4 10/13] virtio-gpu: Resource UUID
Content-Language: en-US
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
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <CADSE00+BUq-6jKH3v2PYNThn+9Z4UCFcr3Cv9Z48eUX0b=6ymA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2023/09/13 21:58, Albert Esteve wrote:
> 
> 
> On Wed, Sep 13, 2023 at 2:22 PM Akihiko Odaki <akihiko.odaki@daynix.com 
> <mailto:akihiko.odaki@daynix.com>> wrote:
> 
>     On 2023/09/13 20:34, Albert Esteve wrote:
>      >
>      >
>      > On Wed, Sep 13, 2023 at 12:34 PM Akihiko Odaki
>     <akihiko.odaki@daynix.com <mailto:akihiko.odaki@daynix.com>
>      > <mailto:akihiko.odaki@daynix.com
>     <mailto:akihiko.odaki@daynix.com>>> wrote:
>      >
>      >     On 2023/09/13 16:55, Albert Esteve wrote:
>      >      > Hi Antonio,
>      >      >
>      >      > If I'm not mistaken, this patch is related with:
>      >      >
>      >
>     https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html
>     <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html>
>      >   
>       <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html>>
>      >      >
>      >   
>       <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html>
>      >   
>       <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html>>>
>      >      > IMHO, ideally, virtio-gpu and vhost-user-gpu both, would
>     use the
>      >      > infrastructure from the patch I linked to store the
>      >      > virtio objects, so that they can be later shared with
>     other devices.
>      >
>      >     I don't think such sharing is possible because the resources are
>      >     identified by IDs that are local to the device. That also
>     complicates
>      >     migration.
>      >
>      >     Regards,
>      >     Akihiko Odaki
>      >
>      > Hi Akihiko,
>      >
>      > As far as I understand, the feature to export dma-bufs from the
>      > virtgpu was introduced as part of the virtio cross-device sharing
>      > proposal [1]. Thus, it shall be posible. When virtgpu ASSING_UUID,
>      > it exports and identifies the dmabuf resource, so that when the
>     dmabuf gets
>      > shared inside the guest (e.g., with virtio-video), we can use the
>     assigned
>      > UUID to find the dmabuf in the host (using the patch that I
>     linked above),
>      > and import it.
>      >
>      > [1] - https://lwn.net/Articles/828988/
>     <https://lwn.net/Articles/828988/> <https://lwn.net/Articles/828988/
>     <https://lwn.net/Articles/828988/>>
> 
>     The problem is that virtio-gpu can have other kind of resources like
>     pixman and OpenGL textures and manage them and DMA-BUFs with unified
>     resource ID.
> 
> 
> I see.
> 
> 
>     So you cannot change:
>     g_hash_table_insert(g->resource_uuids,
>     GUINT_TO_POINTER(assign.resource_id), uuid);
>     by:
>     virtio_add_dmabuf(uuid, assign.resource_id);
> 
>     assign.resource_id is not DMA-BUF file descriptor, and the underlying
>     resource my not be DMA-BUF at first place.
> 
> 
> I didn't really look into the patch in-depth, so the code was intended
> to give an idea of how the implementation would look like with
> the cross-device patch API. Indeed, it is not the resource_id,
> (I just took a brief look at the virtio specificacion 1.2), but the 
> underlying
> resource what we want to use here.
> 
> 
>     Also, since this lives in the common code that is not used only by
>     virtio-gpu-gl but also virtio-gpu, which supports migration, we also
>     need to take care of that. It is not a problem for DMA-BUF as
>     DMA-BUF is
>     not migratable anyway, but the situation is different in this case.
> 
>     Implementing cross-device sharing is certainly a possibility, but that
>     requires more than dealing with DMA-BUFs.
> 
> 
> So, if I understood correctly, dmabufs are just a subset of the resources
> that the gpu manages, or can assign UUIDs to. I am not sure why
> the virt gpu driver would want to send a ASSIGN_UUID for anything
> that is not a dmabuf (are we sure it does?), but I am not super familiarized
> with virtgpu to begin with.

In my understanding, an resource will be first created as OpenGL or 
Vulkan textures and then exported as a DMA-BUF file descriptor. For 
these resource types exporting/importing code is mandatory.

For pixman buffers (i.e., non-virgl device), I don't see a compelling 
reason to have cross-device sharing. It is possible to omit resource 
UUID feature from non-virgl device to avoid implementing complicated 
migration.

> But I see that internally, the GPU specs relate a UUID with a resource_id,
> so we still need both tables:
> - one to relate UUID with resource_id to be able to locate the 
> underlying resource
> - the table that holds the dmabuf with the UUID for cross-device sharing
> 
> With that in mind, sounds to me that the support for cross-device 
> sharing could
> be added on top of this patch, once 
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01850.html 
> <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01850.html>
> lands.

That is possible, but I think it's better to implement cross-device 
sharing at the same time introducing virtio-dmabuf.

The current design of virtio-dmabuf looks somewhat inconsistent; it's 
named "dmabuf", but internally the UUIDs are stored into something named 
"resource_uuids" and it has SharedObjectType so it's more like a generic 
resource sharing mechanism. If you actually have an implementation of 
cross-device sharing using virtio-dmabuf, it will be clear what kind of 
feature is truly necessary.

Regards,
Akihiko Odaki

