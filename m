Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3040E67C08A
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 00:00:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484643.751327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKokE-0000XP-W8; Wed, 25 Jan 2023 22:59:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484643.751327; Wed, 25 Jan 2023 22:59:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKokE-0000UH-TF; Wed, 25 Jan 2023 22:59:54 +0000
Received: by outflank-mailman (input) for mailman id 484643;
 Wed, 25 Jan 2023 22:59:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ecwt=5W=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pKokD-0000UB-8E
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 22:59:53 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9338a22-9d03-11ed-b8d1-410ff93cb8f0;
 Wed, 25 Jan 2023 23:59:51 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 f25-20020a1c6a19000000b003da221fbf48so68331wmc.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jan 2023 14:59:51 -0800 (PST)
Received: from [192.168.0.114] ([196.77.22.181])
 by smtp.gmail.com with ESMTPSA id
 h24-20020a05600c499800b003dc1a525f22sm2918005wmp.25.2023.01.25.14.59.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 14:59:50 -0800 (PST)
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
X-Inumbo-ID: f9338a22-9d03-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8dTJiZGN7IM1TGcu2FzqrQUW/4q0B2eS/x/LwLTuMGg=;
        b=Hu9WboM70U+ng5jm2wA8zD0O+GTSbl9c72Ae7mmteSGlLw6gFrbN+syN0gDbQq9jjK
         5CdlZjpkDj0EHnMvTRUdAn/FUDuOEfsovLxu0PTwwqLN79d9mDUjb2bkPmiRVp7SMHhU
         1/hPBk06aXrFR4phSkYIFTzAW3s05OtW94+tqLHUlU7U0dQIBr6S6Nxo59JF6VNWPrcR
         ZMNnjptfGAL3WuRxRLue5oTrR6ppRGOIrYvolxEp0ZHgvZK7hO42IW/V+he8gtLJPS0u
         9gdfdfNRAjkFgi58GK+Y7o65jWo+MnwavkHmJBhtHGpzD3LlH5zQfvSEnJ7Iqlmjgj2J
         2+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8dTJiZGN7IM1TGcu2FzqrQUW/4q0B2eS/x/LwLTuMGg=;
        b=QGfUgs8NB/BOAWPRC54sv6TI5oUXbbkX6KBTQ/V3nrnh2oTUljXLhf04z1cnIjq+ka
         nQB4rmY637eMQ3tf1froVy7iNVcRNYkpsN03iGlpb3l3kGj1tYCC6Dr4n4zVhEqFdc8O
         4h1ZolzQouk3eLYQCG2WKq7MaWWu4TEscybMqJleKBU3oOiLMGoyeH9TP2Ud/mH5s1ys
         JngwGhILPCGpR1phxUDqxFh9h6BQhZZ5226ZcBeOMLtPjAt2HKBZqAI7ABg8GGq/8cwF
         Na3iWt7D4K1jwNjWqh/XxD9TiQQPYGVlJWnOMl29WjIVO5INWFDPvPKW37ffFiee9pRo
         huOQ==
X-Gm-Message-State: AFqh2kqKUARqi/DIj2CkXXPnw265x+XYCZFa4mkl7TDmbgiKlJlgYiF+
	a5c6q/cGirkdZlqH2q3UJwS9ZQ==
X-Google-Smtp-Source: AMrXdXt5kkKnXWiu24bHOo+rgY1Pyx44R8PAHSh/XuuJxEVm1eXCdcuQXLw1FQMnqxp1y2dliMd/9A==
X-Received: by 2002:a05:600c:1712:b0:3d9:a145:91a with SMTP id c18-20020a05600c171200b003d9a145091amr33196886wmn.28.1674687590639;
        Wed, 25 Jan 2023 14:59:50 -0800 (PST)
Message-ID: <1294362f-4359-949e-3673-6198a78310be@linaro.org>
Date: Wed, 25 Jan 2023 23:59:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [QEMU][PATCH v4 01/10] hw/i386/xen/: move xen-mapcache.c to
 hw/xen/
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 alex.bennee@linaro.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
References: <20230125085407.7144-1-vikram.garhwal@amd.com>
 <20230125085407.7144-2-vikram.garhwal@amd.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230125085407.7144-2-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/1/23 09:53, Vikram Garhwal wrote:
> xen-mapcache.c contains common functions which can be used for enabling Xen on
> aarch64 with IOREQ handling. Moving it out from hw/i386/xen to hw/xen to make it
> accessible for both aarch64 and x86.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>   hw/i386/meson.build              | 1 +
>   hw/i386/xen/meson.build          | 1 -
>   hw/i386/xen/trace-events         | 5 -----
>   hw/xen/meson.build               | 4 ++++
>   hw/xen/trace-events              | 5 +++++
>   hw/{i386 => }/xen/xen-mapcache.c | 0
>   6 files changed, 10 insertions(+), 6 deletions(-)
>   rename hw/{i386 => }/xen/xen-mapcache.c (100%)
> 
> diff --git a/hw/i386/meson.build b/hw/i386/meson.build
> index 213e2e82b3..cfdbfdcbcb 100644
> --- a/hw/i386/meson.build
> +++ b/hw/i386/meson.build
> @@ -33,5 +33,6 @@ subdir('kvm')
>   subdir('xen')
>   
>   i386_ss.add_all(xenpv_ss)
> +i386_ss.add_all(xen_ss)
>   
>   hw_arch += {'i386': i386_ss}
> diff --git a/hw/i386/xen/meson.build b/hw/i386/xen/meson.build
> index be84130300..2fcc46e6ca 100644
> --- a/hw/i386/xen/meson.build
> +++ b/hw/i386/xen/meson.build
> @@ -1,6 +1,5 @@
>   i386_ss.add(when: 'CONFIG_XEN', if_true: files(
>     'xen-hvm.c',
> -  'xen-mapcache.c',
>     'xen_apic.c',
>     'xen_platform.c',
>     'xen_pvdevice.c',
> diff --git a/hw/i386/xen/trace-events b/hw/i386/xen/trace-events
> index 5d6be61090..a0c89d91c4 100644
> --- a/hw/i386/xen/trace-events
> +++ b/hw/i386/xen/trace-events
> @@ -21,8 +21,3 @@ xen_map_resource_ioreq(uint32_t id, void *addr) "id: %u addr: %p"
>   cpu_ioreq_config_read(void *req, uint32_t sbdf, uint32_t reg, uint32_t size, uint32_t data) "I/O=%p sbdf=0x%x reg=%u size=%u data=0x%x"
>   cpu_ioreq_config_write(void *req, uint32_t sbdf, uint32_t reg, uint32_t size, uint32_t data) "I/O=%p sbdf=0x%x reg=%u size=%u data=0x%x"
>   
> -# xen-mapcache.c
> -xen_map_cache(uint64_t phys_addr) "want 0x%"PRIx64
> -xen_remap_bucket(uint64_t index) "index 0x%"PRIx64
> -xen_map_cache_return(void* ptr) "%p"
> -
> diff --git a/hw/xen/meson.build b/hw/xen/meson.build
> index ae0ace3046..19d0637c46 100644
> --- a/hw/xen/meson.build
> +++ b/hw/xen/meson.build
> @@ -22,3 +22,7 @@ else
>   endif
>   
>   specific_ss.add_all(when: ['CONFIG_XEN', xen], if_true: xen_specific_ss)
> +
> +xen_ss = ss.source_set()
> +
> +xen_ss.add(when: 'CONFIG_XEN', if_true: files('xen-mapcache.c'))

Can't we add it to softmmu_ss directly?

> diff --git a/hw/xen/trace-events b/hw/xen/trace-events
> index 3da3fd8348..2c8f238f42 100644
> --- a/hw/xen/trace-events
> +++ b/hw/xen/trace-events
> @@ -41,3 +41,8 @@ xs_node_vprintf(char *path, char *value) "%s %s"
>   xs_node_vscanf(char *path, char *value) "%s %s"
>   xs_node_watch(char *path) "%s"
>   xs_node_unwatch(char *path) "%s"
> +
> +# xen-mapcache.c
> +xen_map_cache(uint64_t phys_addr) "want 0x%"PRIx64
> +xen_remap_bucket(uint64_t index) "index 0x%"PRIx64
> +xen_map_cache_return(void* ptr) "%p"
> diff --git a/hw/i386/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> similarity index 100%
> rename from hw/i386/xen/xen-mapcache.c
> rename to hw/xen/xen-mapcache.c


