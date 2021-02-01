Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5794D30A84D
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 14:08:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79872.145601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Ywa-0006Vi-LO; Mon, 01 Feb 2021 13:08:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79872.145601; Mon, 01 Feb 2021 13:08:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Ywa-0006VJ-I9; Mon, 01 Feb 2021 13:08:40 +0000
Received: by outflank-mailman (input) for mailman id 79872;
 Mon, 01 Feb 2021 13:08:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jUbX=HD=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1l6YwY-0006VA-Od
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 13:08:38 +0000
Received: from mail-ej1-x62d.google.com (unknown [2a00:1450:4864:20::62d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27b28c91-9e9f-4dcb-b6e3-623c84fb84b9;
 Mon, 01 Feb 2021 13:08:38 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id sa23so7960844ejb.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Feb 2021 05:08:37 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id r26sm9134948edc.95.2021.02.01.05.08.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 05:08:36 -0800 (PST)
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
X-Inumbo-ID: 27b28c91-9e9f-4dcb-b6e3-623c84fb84b9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=y4kRp1O9NSMOYw470pZIHLMK+3nXsZMTt27NrvtPWBY=;
        b=ovTBQDzeS7zCx9tL7P7Xk3plyacF02rVpLFtCjZKWXJUBgmWY1oXR1tK6yi8ng40B5
         55ReqthCZais7QcdQGliDXTtSW6Ve6qAy21SGP3iZLIqSkZTlNYMSah1Bi46dayCHdjK
         b/cnTE77BDbBU4Cuor5oDH5bVMY+xi2Ixvg68G869jB0CKYCl4JQxA3tN8Yn3vd+0bzg
         /QsHl38bVof4umYD9LFZ2nQA9bBtcN00LME5YrZqFoUSoTnq05PcaRVzNL4/kH3pz4uU
         ocMtSZAuWY/JDke64T1h2LghIsMaEvWqgFTo2hFw91zvc1iSDT6SaLVAS5i5m4xJOVLR
         QVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=y4kRp1O9NSMOYw470pZIHLMK+3nXsZMTt27NrvtPWBY=;
        b=LaTuL8FfG5rI5q8kBQslxgr5tOpylCrtFlsXLZm4Ls15h2iGA/yc5EFtdvR41eru2+
         wEKpYp+J7DUytKdDIKodUZbD6SZAqxNyBkOoSJ7VqUj6M/t0h3bYccDXyo2RDKn7rU3b
         jrbTbkaAb/O2NbWPdSY/xur7zpVPuUWFmmasMigz8Yi/3XRpGM5sP342lvSS4Y/p0okm
         YZY29dfYKGVoxjeWgnFd67+Sil5cy1AsLJqx2anAluv/UjRilt1AMkv4RWOMjpAlofd+
         j31vZ+zHfxZxantNDPcPaibct24b7rFdIHv+rV7MQsm2RyERxAENdp+sXZ9TeDNLTn7i
         XIeA==
X-Gm-Message-State: AOAM532by0uoIN9QGad3ztGGcRV6yMgpZutF1m2UzaAUZ8yL7FzKJmoH
	ubvzVfJJqLFDg6DjuBr+Sec=
X-Google-Smtp-Source: ABdhPJwTwiao55AEZH/q4YO3I6ip3slYCuygRAACBsntgWTgI4+6twqi5ufD5XR1Cd/PPfzw3vKE4w==
X-Received: by 2002:a17:906:4d8f:: with SMTP id s15mr17815981eju.389.1612184917083;
        Mon, 01 Feb 2021 05:08:37 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v3 3/7] accel/xen: Incorporate xen-mapcache.c
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210201112905.545144-1-f4bug@amsat.org>
 <20210201112905.545144-4-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8c7281bb-5688-5ef4-4841-3181bdb02bfc@amsat.org>
Date: Mon, 1 Feb 2021 14:08:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210201112905.545144-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2/1/21 12:29 PM, Philippe Mathieu-Daudé wrote:
> xen-mapcache.c contains accelerator related routines,
> not particular to the X86 HVM machine. Move this file
> to accel/xen/ (adapting the buildsys machinery).
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  meson.build                           |  3 +++
>  accel/xen/trace.h                     |  1 +
>  {hw/i386 => accel}/xen/xen-mapcache.c |  0
>  hw/i386/xen/xen-hvm.c                 |  1 -
>  accel/xen/meson.build                 |  5 ++++-
>  accel/xen/trace-events                | 10 ++++++++++
>  hw/i386/xen/meson.build               |  1 -
>  hw/i386/xen/trace-events              |  6 ------
>  8 files changed, 18 insertions(+), 9 deletions(-)
>  create mode 100644 accel/xen/trace.h
>  rename {hw/i386 => accel}/xen/xen-mapcache.c (100%)
>  create mode 100644 accel/xen/trace-events
...
> diff --git a/accel/xen/trace-events b/accel/xen/trace-events
> new file mode 100644
> index 00000000000..30bf4f42283
> --- /dev/null
> +++ b/accel/xen/trace-events
> @@ -0,0 +1,10 @@
> +# See docs/devel/tracing.txt for syntax documentation.
> +
> +# xen-hvm.c
> +xen_ram_alloc(unsigned long ram_addr, unsigned long size) "requested: 0x%lx, size 0x%lx"

Self-Nack, this should not be here ^

> +
> +# xen-mapcache.c
> +xen_map_cache(uint64_t phys_addr) "want 0x%"PRIx64
> +xen_remap_bucket(uint64_t index) "index 0x%"PRIx64
> +xen_map_cache_return(void* ptr) "%p"

