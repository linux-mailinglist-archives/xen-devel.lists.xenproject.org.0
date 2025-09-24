Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA84B9995C
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 13:32:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129342.1469346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1NjV-0002K9-RK; Wed, 24 Sep 2025 11:32:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129342.1469346; Wed, 24 Sep 2025 11:32:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1NjV-0002Hs-O7; Wed, 24 Sep 2025 11:32:25 +0000
Received: by outflank-mailman (input) for mailman id 1129342;
 Wed, 24 Sep 2025 11:32:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=R8Be=4D=redhat.com=clg@srs-se1.protection.inumbo.net>)
 id 1v1NjT-0002Hk-S1
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 11:32:23 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22093ac1-993a-11f0-9809-7dc792cee155;
 Wed, 24 Sep 2025 13:32:21 +0200 (CEST)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-1e7dVatdNqCk6R9CasEJ7A-1; Wed, 24 Sep 2025 07:32:18 -0400
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3f44000639fso3576086f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Sep 2025 04:32:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee15bfab67sm24078831f8f.43.2025.09.24.04.32.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Sep 2025 04:32:15 -0700 (PDT)
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
X-Inumbo-ID: 22093ac1-993a-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758713540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3wm4aQYa97ehJU5fswKMnk8HHXPm1syDq073s2wb1ds=;
	b=Ewqynfj1Cl/zGy4ektfXpRZ3jpYGvR4dddq1k9ZIAEGeHytttrdRG49/h8Gbre+0UigTwJ
	dSpBMZ/FnsMbYbAybtBPcZqQZserg2ed1uOqczx71uRba9P0Ro60+QBqkYpqM8KOjAhRc8
	FdDicdOY0uFg+3iK4W8DCYTuqPcwuac=
X-MC-Unique: 1e7dVatdNqCk6R9CasEJ7A-1
X-Mimecast-MFC-AGG-ID: 1e7dVatdNqCk6R9CasEJ7A_1758713537
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758713537; x=1759318337;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3wm4aQYa97ehJU5fswKMnk8HHXPm1syDq073s2wb1ds=;
        b=f/zbuSFLkMIxEmZu0eSURzpoBFFrG6peJlSb8Xgj1n7Ej5a+eoRYvjY7tjDvpjbp0k
         BZ7TIXGz1g26uMx/oB31K5Kl0TJzBcqpjk/8fyE4h5RR/GYTVmEuFj+gNP+Rl3I4Mp/q
         vFLR5qLGttdlsQCpXTU6vpz/7vsIRgucxhJX85H0ITR1/EEmWtVQmX1KeDQn/qIV9D6J
         jsI58X/4LJOUmVzDu4Tfjvi9XgsQjwRGv5xuBowafBy5sQyTmPB7ma63UqiaR8l/uelV
         ZALLTnE3awExxMc2nm/P2gQCO8wH/7nqRpXcR60rWkRI+Uyx8dcRivtPaxk0MQXcBQoD
         x/kw==
X-Forwarded-Encrypted: i=1; AJvYcCWFVj5HBurkaOpfS0XhtLz1OOvAqIWbFhHhTM+MGRziEk1y3RmeDeyVn4bleEwdbVXgKUpH83X7j9s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwPf+t0IwY39gjR6VFz7weU09LHLqub+GM59Uu0zxHJ+YMNihHN
	MadFkqyIm7wKalWTloacuyGxNw6knvSEJq3NcOOej8314zI3+ue+5FXmrLjADJg5CXB3HzzjrwD
	3+LWvBLhn03ZclrqlIc6zY5guqXMHHT9mKj3CmrGPyoBbAJT50jx5LoDwIQw1xHRVycQG
X-Gm-Gg: ASbGncuJ7+av7gmvZ7ojscOg484iG5sijCEUdiz376eFuD2w+uu9eVAU08jreqVo65C
	3gXYjy4rZNJKFi7UXioKvI2JTtddwy9S2VyOIVBCLczBxrst6NosxqhZgBEHN9/pnVncl/eCIhP
	o53/tF15sk0FEQcTSK1FFxcS00nDN5eWDCaglMXzyM37sNa/jntOjkEIMj+pyrfAd+8ZtK3VH2U
	waCASZ+c8S/DmdZ34mIScizhmt1Hz//ghnexes2vHz+tO+6jVUvEs+ygQ4B73zb4VNOOAn3w7b+
	UGVLeW8QSv6yO1Gg9zmSluYeR1U/8u2f6eIzdG5gMyLbRrS0F4mUUREASWpqIN2B3SKyjN4+TCE
	705Q=
X-Received: by 2002:a05:6000:2802:b0:405:ed47:b285 with SMTP id ffacd0b85a97d-405ed47c21bmr2970234f8f.58.1758713536871;
        Wed, 24 Sep 2025 04:32:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoNAZLN+nDh03f9cXRCLX0UgIm+FEEbH1KWxZOtQMveos7vpMCeoUcTE8YA9R2fRZI1we1Gw==
X-Received: by 2002:a05:6000:2802:b0:405:ed47:b285 with SMTP id ffacd0b85a97d-405ed47c21bmr2970171f8f.58.1758713536387;
        Wed, 24 Sep 2025 04:32:16 -0700 (PDT)
Message-ID: <ab5369c7-f7f0-4f0a-b314-ff5bbaa9263e@redhat.com>
Date: Wed, 24 Sep 2025 13:32:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] vfio: Do not unparent in instance_finalize()
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Jesper Devantier <foss@defmacro.it>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org,
 John Levon <john.levon@nutanix.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 Yanan Wang <wangyanan55@huawei.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Aleksandar Rikalo
 <arikalo@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Bin Meng <bmeng.cn@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20250924-use-v4-0-07c6c598f53d@rsg.ci.i.u-tokyo.ac.jp>
 <20250924-use-v4-6-07c6c598f53d@rsg.ci.i.u-tokyo.ac.jp>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <20250924-use-v4-6-07c6c598f53d@rsg.ci.i.u-tokyo.ac.jp>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: voN5DcSkEb90Cspy8x6PBWLgJbdc6keBsX94M7rzTsI_1758713537
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/24/25 06:37, Akihiko Odaki wrote:
> Children are automatically unparented so manually unparenting is
> unnecessary.
> 
> Worse, automatic unparenting happens before the instance_finalize()
> callback of the parent gets called, so object_unparent() calls in
> the callback will refer to objects that are already unparented, which
> is semantically incorrect.
> 
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   hw/vfio/pci-quirks.c | 9 +--------
>   hw/vfio/region.c     | 3 ---
>   2 files changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
> index c97606dbf194..b5da6afbf5b0 100644
> --- a/hw/vfio/pci-quirks.c
> +++ b/hw/vfio/pci-quirks.c
> @@ -1159,15 +1159,12 @@ void vfio_vga_quirk_exit(VFIOPCIDevice *vdev)
>   
>   void vfio_vga_quirk_finalize(VFIOPCIDevice *vdev)
>   {
> -    int i, j;
> +    int i;
>   
>       for (i = 0; i < ARRAY_SIZE(vdev->vga->region); i++) {
>           while (!QLIST_EMPTY(&vdev->vga->region[i].quirks)) {
>               VFIOQuirk *quirk = QLIST_FIRST(&vdev->vga->region[i].quirks);
>               QLIST_REMOVE(quirk, next);
> -            for (j = 0; j < quirk->nr_mem; j++) {
> -                object_unparent(OBJECT(&quirk->mem[j]));
> -            }
>               g_free(quirk->mem);
>               g_free(quirk->data);
>               g_free(quirk);
> @@ -1207,14 +1204,10 @@ void vfio_bar_quirk_exit(VFIOPCIDevice *vdev, int nr)
>   void vfio_bar_quirk_finalize(VFIOPCIDevice *vdev, int nr)
>   {
>       VFIOBAR *bar = &vdev->bars[nr];
> -    int i;
>   
>       while (!QLIST_EMPTY(&bar->quirks)) {
>           VFIOQuirk *quirk = QLIST_FIRST(&bar->quirks);
>           QLIST_REMOVE(quirk, next);
> -        for (i = 0; i < quirk->nr_mem; i++) {
> -            object_unparent(OBJECT(&quirk->mem[i]));
> -        }
>           g_free(quirk->mem);
>           g_free(quirk->data);
>           g_free(quirk);
> diff --git a/hw/vfio/region.c b/hw/vfio/region.c
> index d04c57db630f..b165ab0b9378 100644
> --- a/hw/vfio/region.c
> +++ b/hw/vfio/region.c
> @@ -365,12 +365,9 @@ void vfio_region_finalize(VFIORegion *region)
>       for (i = 0; i < region->nr_mmaps; i++) {
>           if (region->mmaps[i].mmap) {
>               munmap(region->mmaps[i].mmap, region->mmaps[i].size);
> -            object_unparent(OBJECT(&region->mmaps[i].mem));
>           }
>       }
>   
> -    object_unparent(OBJECT(region->mem));
> -
>       g_free(region->mem);
>       g_free(region->mmaps);
>   
> 

What about vfio_subregion_unmap() calling object_unparent() too ?

C.


