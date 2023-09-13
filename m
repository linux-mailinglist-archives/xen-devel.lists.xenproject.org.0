Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B51D79E7D4
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 14:23:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601253.937226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgOtB-00068o-FP; Wed, 13 Sep 2023 12:22:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601253.937226; Wed, 13 Sep 2023 12:22:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgOtB-00065y-Ck; Wed, 13 Sep 2023 12:22:37 +0000
Received: by outflank-mailman (input) for mailman id 601253;
 Wed, 13 Sep 2023 12:22:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o3wF=E5=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1qgOt9-00065s-KT
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 12:22:35 +0000
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [2607:f8b0:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 374573e3-5230-11ee-8786-cb3800f73035;
 Wed, 13 Sep 2023 14:22:34 +0200 (CEST)
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-577a98f78b2so1236916a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 Sep 2023 05:22:34 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a170902c38100b001c3267ae314sm10323061plg.156.2023.09.13.05.22.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Sep 2023 05:22:32 -0700 (PDT)
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
X-Inumbo-ID: 374573e3-5230-11ee-8786-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1694607753; x=1695212553; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bd7AjsFGHVU9ZgF8t64qnNi1wuPnAXka53rRg0j9Ps8=;
        b=LWgyjsEEelOcCRWM2eUo45fI/75Ruucet0marW43aDGtBKe74wV4/0Fqxy0kEYBaHX
         wi0K0WT3enAI9QUuD5s0S7tJ7q/s20xkvTc3EYblc497Mt3wUOP4RmdjMK9Nnez48kcH
         UrHgsnweuxIJDJkjZe1Aaid0o8lk5u0i8SdAtM0sFXLzUNENcpa/sFWX9Gn3nWUEQZ+z
         gdIY5KGeZrvc4YgF95Huj7UBIZcLvnuCCI6d+SqzzcS/jgXvQjAXB5urWo39yxZ1i8DI
         MN/16lz5tKk9/rYpAMqa+dDti2jK1ivdoQ1n4qZlHvWU/a7Wl5BIfLG6mEX7mIXK91oj
         hxAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694607753; x=1695212553;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bd7AjsFGHVU9ZgF8t64qnNi1wuPnAXka53rRg0j9Ps8=;
        b=TjMIHSekCpoxXPMN7JUqKybhVzvpMFtorz/TThzzY0No8BoG/RIXUuZYuIIBl/nI4t
         M1xF+isxDtEZFzv4dao4H8sXBqCTCRFG7PDVv8wSzyjs6xE18aE1YBTlxrHEdNa7rvnr
         9N3gMSvvXNn1xKWw3kQ7kOxubeiSKGWJU0hoiTeJ0M/8A4Mzen41rdiAYwYPz3Twy8d+
         RJlh2dtSzgmxD/oMrAb8hoU6yBhTEoPWANU+AmSKlW87hqllQBmeeglVXc5OxUHiRE94
         Ly/AhQ3AWrmBBPl8FvUrtvKFZvmHzE4GUAzb656kSdl9KwwVeJWFB+G3Io5lfY3v4mRV
         mGYg==
X-Gm-Message-State: AOJu0YyzHt9hbHuakHO13egfBHhkhES6oZ5WLoCXfS++mp4RqRYpmPU5
	FhhEp8aLBvSMc6Zp+b++CPK+HQ==
X-Google-Smtp-Source: AGHT+IFUceWhWOwzr7PceZj0Aedx/pJWoToZ/n1XM68m4HSxGEeSRi2V9aKihvMef0Dz/aLMOl/mPA==
X-Received: by 2002:a05:6a20:e125:b0:137:3c67:85d7 with SMTP id kr37-20020a056a20e12500b001373c6785d7mr2865750pzb.16.1694607752788;
        Wed, 13 Sep 2023 05:22:32 -0700 (PDT)
Message-ID: <5e88f5d5-5aa2-4052-b250-69c2a443344f@daynix.com>
Date: Wed, 13 Sep 2023 21:22:26 +0900
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
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <CADSE00+6zcT7iKR0JW1Bk8es6HtBpzAKa9JW6u5yyjDoLPw2KQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2023/09/13 20:34, Albert Esteve wrote:
> 
> 
> On Wed, Sep 13, 2023 at 12:34 PM Akihiko Odaki <akihiko.odaki@daynix.com 
> <mailto:akihiko.odaki@daynix.com>> wrote:
> 
>     On 2023/09/13 16:55, Albert Esteve wrote:
>      > Hi Antonio,
>      >
>      > If I'm not mistaken, this patch is related with:
>      >
>     https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html
>     <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html>
>      >
>     <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html
>     <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html>>
>      > IMHO, ideally, virtio-gpu and vhost-user-gpu both, would use the
>      > infrastructure from the patch I linked to store the
>      > virtio objects, so that they can be later shared with other devices.
> 
>     I don't think such sharing is possible because the resources are
>     identified by IDs that are local to the device. That also complicates
>     migration.
> 
>     Regards,
>     Akihiko Odaki
> 
> Hi Akihiko,
> 
> As far as I understand, the feature to export dma-bufs from the
> virtgpu was introduced as part of the virtio cross-device sharing
> proposal [1]. Thus, it shall be posible. When virtgpu ASSING_UUID,
> it exports and identifies the dmabuf resource, so that when the dmabuf gets
> shared inside the guest (e.g., with virtio-video), we can use the assigned
> UUID to find the dmabuf in the host (using the patch that I linked above),
> and import it.
> 
> [1] - https://lwn.net/Articles/828988/ <https://lwn.net/Articles/828988/>

The problem is that virtio-gpu can have other kind of resources like 
pixman and OpenGL textures and manage them and DMA-BUFs with unified 
resource ID.

So you cannot change:
g_hash_table_insert(g->resource_uuids, 
GUINT_TO_POINTER(assign.resource_id), uuid);
by:
virtio_add_dmabuf(uuid, assign.resource_id);

assign.resource_id is not DMA-BUF file descriptor, and the underlying 
resource my not be DMA-BUF at first place.

Also, since this lives in the common code that is not used only by 
virtio-gpu-gl but also virtio-gpu, which supports migration, we also 
need to take care of that. It is not a problem for DMA-BUF as DMA-BUF is 
not migratable anyway, but the situation is different in this case.

Implementing cross-device sharing is certainly a possibility, but that 
requires more than dealing with DMA-BUFs.

