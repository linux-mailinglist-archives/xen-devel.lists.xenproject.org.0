Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A791EB238
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 01:36:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jftyO-0006Sp-Cr; Mon, 01 Jun 2020 23:36:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zqDJ=7O=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1jftyM-0006SY-Mz
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 23:36:02 +0000
X-Inumbo-ID: a748da8a-a460-11ea-8993-bc764e2007e4
Received: from mail-pf1-x441.google.com (unknown [2607:f8b0:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a748da8a-a460-11ea-8993-bc764e2007e4;
 Mon, 01 Jun 2020 23:36:02 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id a127so2142318pfa.12
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2020 16:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hGrlH3PqgBr3ZkLXs0ICSwS5m6e98ZxaoB6gTALk4to=;
 b=GFWJNcIJwd07F0D6M4IVLW6PM8NwXWcTh05r+2LsqCuNKmw3KcaiHOLhKJcdunMpKy
 k8C7roaMyHD4kAFgeLh1abx6yLpKVPoLQr+e1sZVtY3Aw9W8WkhIiKz6w76YB+JqcH4P
 MxkAomMSNK8vmd+4Jxt+xrrsCTPQEsE8onWo67228m4xttiom20ukivbUAHX8Q8JUeWg
 0S/zSvXhSxLPN+S8RUH60vBO3/IgfMPExKMPz0QsEnIpgApVtllcayn9Qb0l9VfAtI6h
 +YQXQOC2rlmxeKBLJRIZWtdy0au/+c1OsjwAQZ0kpGZpn/9flGgboP2H4IxvkCRz+1fm
 FVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hGrlH3PqgBr3ZkLXs0ICSwS5m6e98ZxaoB6gTALk4to=;
 b=PPtoQzyZ6S/yyjWWx8ipnKNmR2YfYemlAxGO/Tpk5dxuWZujkmyFIHdhbL2iD+GofR
 vqnvHic6EI+kEZAQDLf7qxH/2FUg60ITJnQr6n4BJjnWn2HfFbBg65qBWQYzksUFINtI
 pIQiArwNMV+qRDd5oC2DgYoK2tMIcI5tDGWpbdMRyOgreJq2lpbjcE5g9zBsoj1axzaO
 tVz6rXgvLyWNih/BsqlwdB9Sn6Bm5VvTdHlwWuQO6VCwdrcCHGTDvbokrwUFx4eXscI1
 rxmTQ1Qtl2+jL83I+1IYiAc/ilNxpilrtSeH8yfm7aU6KrIslLWYNUOMYcbM8yaUajPI
 8ukQ==
X-Gm-Message-State: AOAM531mr6RNAD4PZ9wGGUzALOLAzmY7AgU08sKn9SYTva49rRCl5os6
 uCvJ5AJitX3LHP/Ekp2qzjNn3A==
X-Google-Smtp-Source: ABdhPJzQLtQYfpPCKrXikLqS/8usRLci/JPY1d5rfCIMc2sTmw/wqAqfi33AqaxVZO9QQc4TtjWvNw==
X-Received: by 2002:a62:ee07:: with SMTP id e7mr22044574pfi.42.1591054561486; 
 Mon, 01 Jun 2020 16:36:01 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id m14sm445894pgn.83.2020.06.01.16.36.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 16:36:00 -0700 (PDT)
Subject: Re: [PATCH v2 3/8] hw/pci/pci_bridge: Correct pci_bridge_io memory
 region size
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200601142930.29408-1-f4bug@amsat.org>
 <20200601142930.29408-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <35f77178-dc79-3b4a-7562-9bc37fad9d9b@linaro.org>
Date: Mon, 1 Jun 2020 16:35:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200601142930.29408-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 Paul Durrant <paul@xen.org>, qemu-trivial@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 6/1/20 7:29 AM, Philippe Mathieu-Daudé wrote:
> memory_region_set_size() handle the 16 Exabytes limit by
> special-casing the UINT64_MAX value. This is not a problem
> for the 32-bit maximum, 4 GiB.
> By using the UINT32_MAX value, the pci_bridge_io MemoryRegion
> ends up missing 1 byte:
> 
>   (qemu) info mtree
>   memory-region: pci_bridge_io
>     0000000000000000-00000000fffffffe (prio 0, i/o): pci_bridge_io
>       0000000000000060-0000000000000060 (prio 0, i/o): i8042-data
>       0000000000000064-0000000000000064 (prio 0, i/o): i8042-cmd
>       00000000000001ce-00000000000001d1 (prio 0, i/o): vbe
>       0000000000000378-000000000000037f (prio 0, i/o): parallel
>       00000000000003b4-00000000000003b5 (prio 0, i/o): vga
>       ...
> 
> Fix by using the correct value. We now have:
> 
>   memory-region: pci_bridge_io
>     0000000000000000-00000000ffffffff (prio 0, i/o): pci_bridge_io
>       0000000000000060-0000000000000060 (prio 0, i/o): i8042-data
>       0000000000000064-0000000000000064 (prio 0, i/o): i8042-cmd
>       ...
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/pci/pci_bridge.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


