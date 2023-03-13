Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC476B71E4
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 10:01:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509184.784497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbe3M-0006Fs-4l; Mon, 13 Mar 2023 09:01:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509184.784497; Mon, 13 Mar 2023 09:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbe3M-0006Co-1f; Mon, 13 Mar 2023 09:01:12 +0000
Received: by outflank-mailman (input) for mailman id 509184;
 Mon, 13 Mar 2023 09:01:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mm2P=7F=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pbe3K-0006Ci-OT
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 09:01:10 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 963d398b-c17d-11ed-87f5-c1b5be75604c;
 Mon, 13 Mar 2023 10:01:05 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id j3so7341119wms.2
 for <xen-devel@lists.xenproject.org>; Mon, 13 Mar 2023 02:01:05 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 q6-20020adff946000000b002c703d59fa7sm7335537wrr.12.2023.03.13.02.01.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 02:01:04 -0700 (PDT)
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
X-Inumbo-ID: 963d398b-c17d-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678698065;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+yRTQUoioB4e4JGXFcl0uR5I7yidXlwRcuL8pkMIFhI=;
        b=Hs11MoEiln8Nl7L2cl8mYfzcvur8zVlWaDOMrDRDM4ZqSmktfn6o3r2bGPbDrtW89U
         UeDrdBTIbnT55ZYOPzclVKH5xTlFpql11GB4GCtk31k+SbWKDE11MT1ysY9fbunL0JLA
         EheA9QIsfS1eo8gKN0sjiOlCCrXMs3HcEjcea9c+Sz8W7WZ0hdEp2CRbyly5rCO/lm1Y
         9N6LWkL3IF7APnDkF2gSYixabCw28x+NIkkGWQaOs5SbJixOoXrN5c50BJBRbYMJc3ho
         KtQfn8EjY8TxNSDMihlq+7YCbHuorpgyYjTdpaGHcl4m9InBHCyRlQRGAJBERrQQeZH7
         ggPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678698065;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+yRTQUoioB4e4JGXFcl0uR5I7yidXlwRcuL8pkMIFhI=;
        b=L2EcpXra70ccZQnrCGedU/CmjRVdXAbu57EChibPbV+n8KBtbTzqtHu3jlE6bgb3PK
         aEudMlH3scaRxMGAxBvBJAdwSVxTWcIZCRMHWL44pa8LEe9bo/DYK4rYiJ6Vx3lwBEjv
         3icWv/jXQ4fW3LPCICSpe0po8HUFZbI++Px9oeK0Dmhk70zDUdaOQeVdRI5g7O/7/TvI
         NG39+EdLMSVk6aMjBw2iho6UMkpm4+6OzLS02frK0+BIFALW5yYW1CNz8aOyaMH4He03
         MhhBaTUj4GsOh5pyc1elFjDkBanHry3Ex4cpa8nZbHynK2142Exam72Km5Fra88h6vPb
         JwSA==
X-Gm-Message-State: AO0yUKXpzvJCv7oGFpFV5q4Wy9W6EWl2c6R6xwbQbEiWA7n8GNsqlakv
	efN1du0YkpGMx++WwVGGQsWhWw==
X-Google-Smtp-Source: AK7set8YKjt4pCS2UPrBXHY3xTR5X6jSogUcNTsr00XQW/4qGiNyi7WB2Xnrt+5yoOc8daREainADg==
X-Received: by 2002:a05:600c:1d18:b0:3ed:2981:1ea8 with SMTP id l24-20020a05600c1d1800b003ed29811ea8mr553751wms.8.1678698065004;
        Mon, 13 Mar 2023 02:01:05 -0700 (PDT)
Message-ID: <193506e9-76bb-96b9-551d-cb08ee743c2d@linaro.org>
Date: Mon, 13 Mar 2023 10:01:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [RFC QEMU PATCH 01/18] virtio: Add shared memory capability
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Antonio Caggiano <antonio.caggiano@collabora.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Robert Beckett <bob.beckett@collabora.com>, qemu-devel@nongnu.org,
 xen-devel@lists.xenproject.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>
References: <20230312092244.451465-1-ray.huang@amd.com>
 <20230312092244.451465-2-ray.huang@amd.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230312092244.451465-2-ray.huang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/3/23 10:22, Huang Rui wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Define a new capability type 'VIRTIO_PCI_CAP_SHARED_MEMORY_CFG' to allow
> defining shared memory regions with sizes and offsets of 2^32 and more.
> Multiple instances of the capability are allowed and distinguished
> by a device-specific 'id'.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> ---
>   hw/virtio/virtio-pci.c         | 18 ++++++++++++++++++
>   include/hw/virtio/virtio-pci.h |  4 ++++
>   2 files changed, 22 insertions(+)
> 
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index a1c9dfa7bb..ae4c29cb96 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -1191,6 +1191,24 @@ static int virtio_pci_add_mem_cap(VirtIOPCIProxy *proxy,
>       return offset;
>   }
>   
> +int virtio_pci_add_shm_cap(VirtIOPCIProxy *proxy,
> +                           uint8_t bar, uint64_t offset, uint64_t length,
> +                           uint8_t id)
> +{
> +    struct virtio_pci_cap64 cap = {
> +        .cap.cap_len = sizeof cap,
> +        .cap.cfg_type = VIRTIO_PCI_CAP_SHARED_MEMORY_CFG,
> +    };
> +
> +    cap.cap.bar = bar;
> +    cap.cap.length = cpu_to_le32(length);
> +    cap.length_hi = cpu_to_le32(length >> 32);
> +    cap.cap.offset = cpu_to_le32(offset);
> +    cap.offset_hi = cpu_to_le32(offset >> 32);
> +    cap.cap.id = id;

Why initializing 'cap' using 2 different coding styles?

> +    return virtio_pci_add_mem_cap(proxy, &cap.cap);
> +}


