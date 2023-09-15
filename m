Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ACA7A2205
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 17:12:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603259.940225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhATr-0003kn-Lc; Fri, 15 Sep 2023 15:11:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603259.940225; Fri, 15 Sep 2023 15:11:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhATr-0003iX-Iu; Fri, 15 Sep 2023 15:11:39 +0000
Received: by outflank-mailman (input) for mailman id 603259;
 Fri, 15 Sep 2023 15:11:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cweo=E7=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1qhATp-0003iR-B6
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 15:11:37 +0000
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28701ae4-53da-11ee-9b0d-b553b5be7939;
 Fri, 15 Sep 2023 17:11:35 +0200 (CEST)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1c336f5b1ffso20096125ad.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Sep 2023 08:11:35 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a17090341c600b001c3f7fd1ef7sm3623245ple.12.2023.09.15.08.11.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Sep 2023 08:11:32 -0700 (PDT)
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
X-Inumbo-ID: 28701ae4-53da-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1694790693; x=1695395493; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KCQqoZ18jpGX1KCrU7S3I3Im0sSOsGzv0y0heQncKU4=;
        b=b+60VPOOc18Rc0vZz0qVv30N2I5F6mEQP6orxrPmaesCk6YDfefq3Y/ajFegYyrioA
         SiorMQga5wCqsdEpVQYgOVtchmwJfJhMAwNlsdbM/7rRLA2+Uf1mfBORShZHC9NN8VDy
         vbK0tWPfHRVJAwo/EM04m4qVopTE+K0QJDl4clAAImJfT+VwjKsYHeou6nEouNrNwri+
         AF5dNFfQoJQnQ7Cs8wmCz5OVU7PEmz5Zl6Lnd+bxgocgdA20mBdqL0j2Mt/YzkWm5d2M
         4qj5JGlO1p0LWQa2biy8iEvYl+MIw0ubpRu2ew2SofYHn6rf/GGiVC0AKMSwW/JMnIrF
         ON4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694790693; x=1695395493;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KCQqoZ18jpGX1KCrU7S3I3Im0sSOsGzv0y0heQncKU4=;
        b=NOkAGoXHJiA73R8gmx4Hcq7OijPyOkAk72H7SbfVBAw+Xyohhjfag1XpfmM/YP7ivs
         83TepbhAM2DlqN8ueUTy7X7jAMpDoWKX11YUnRp/AL3s6kvxdmbREDboFIElwcORRsjv
         P8l3Az4GwIqepuV8yJ5SV3agv3ctVopKXgGXescUO76wdjIPBTCcUDpWoawIxyDc+Eya
         ew7UBWBIM5htd8dtmeD2X8ijrXzMdxnii3S58RlihIiCmVueRMNxhTVdfGvUIeWvcqbJ
         N3ErLP0xAxZ7b6RlgqJRRdV5uugWti5mhLXwrkDomhv2xhWwNqRBGSNvjhOwsuHpLBBy
         Rcow==
X-Gm-Message-State: AOJu0Yxe2zemn3BDTqfqOQ0z+qbbV4pVNRqH+/8J9evQk9+Z53lBvlJa
	6Qxyy3rGGmWGNxSIu4I90275Cg==
X-Google-Smtp-Source: AGHT+IFeBqAAw/xZfJOIrv+PMMlVSoIDSLdN/PSNRJYjvS4mbp4KtNnaSSjCRhmZFu3zOoD/wmVTFw==
X-Received: by 2002:a17:902:e552:b0:1c3:3682:f83f with SMTP id n18-20020a170902e55200b001c33682f83fmr2476230plf.30.1694790693438;
        Fri, 15 Sep 2023 08:11:33 -0700 (PDT)
Message-ID: <99fb4575-9f8d-4ab6-bc22-911bbaa7ca55@daynix.com>
Date: Sat, 16 Sep 2023 00:11:27 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [QEMU PATCH v5 07/13] softmmu/memory: enable automatic
 deallocation of memory regions
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Antonio Caggiano <quic_acaggian@quicinc.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Robert Beckett <bob.beckett@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Albert Esteve <aesteve@redhat.com>, ernunes@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alyssa Ross <hi@alyssa.is>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>
References: <20230915111130.24064-1-ray.huang@amd.com>
 <20230915111130.24064-8-ray.huang@amd.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20230915111130.24064-8-ray.huang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/09/15 20:11, Huang Rui wrote:
> From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
> 
> When the memory region has a different life-cycle from that of her parent,
> could be automatically released, once has been unparent and once all of her
> references have gone away, via the object's free callback.
> 
> However, currently, references to the memory region are held by its owner
> without first incrementing the memory region object's reference count.
> As a result, the automatic deallocation of the object, not taking into
> account those references, results in use-after-free memory corruption.
> 
> This patch increases the reference count of an owned memory region object
> on each memory_region_ref() and decreases it on each memory_region_unref().
> 
> Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> ---
> 
> V4 -> V5:
>      - ref/unref only owned memory regions (Akihiko)
> 
>   softmmu/memory.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 7d9494ce70..15e1699750 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -1800,6 +1800,9 @@ void memory_region_ref(MemoryRegion *mr)
>       /* MMIO callbacks most likely will access data that belongs
>        * to the owner, hence the need to ref/unref the owner whenever
>        * the memory region is in use.
> +     * Likewise, the owner keeps references to the memory region,
> +     * hence the need to ref/unref the memory region object to prevent
> +     * its automatic deallocation while still referenced by its owner.

This comment does not make sense. Traditionally no such automatic 
deallocation happens so the owner has been always required to free the 
memory region when it gets finalized.

"[QEMU PATCH v5 09/13] virtio-gpu: Handle resource blob commands" 
introduces a different kind of memory region, which can be freed anytime 
before the device gets finalized. Even in this case, the owner removes 
the reference to the memory owner by doing res->region = NULL;

Regards,
Akihiko Odaki

