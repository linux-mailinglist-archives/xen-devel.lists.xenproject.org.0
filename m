Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE763B95B4
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 19:52:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149023.275453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lz0rS-000279-62; Thu, 01 Jul 2021 17:52:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149023.275453; Thu, 01 Jul 2021 17:52:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lz0rS-000252-2i; Thu, 01 Jul 2021 17:52:26 +0000
Received: by outflank-mailman (input) for mailman id 149023;
 Thu, 01 Jul 2021 17:52:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YaNF=LZ=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1lz0rQ-00024p-WD
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 17:52:25 +0000
Received: from mail-pj1-x1029.google.com (unknown [2607:f8b0:4864:20::1029])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b30768fb-0fb2-413e-a749-f44269e4bae8;
 Thu, 01 Jul 2021 17:52:24 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id l11so4719373pji.5
 for <xen-devel@lists.xenproject.org>; Thu, 01 Jul 2021 10:52:24 -0700 (PDT)
Received: from ?IPv6:2602:4b:a45e:ca01::9? ([2602:4b:a45e:ca01::9])
 by smtp.gmail.com with ESMTPSA id c21sm616684pfv.138.2021.07.01.10.52.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 10:52:23 -0700 (PDT)
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
X-Inumbo-ID: b30768fb-0fb2-413e-a749-f44269e4bae8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0Vsex3I4g2OE7oG/neSBO+550Ku5bwDkSc1VWgWklJM=;
        b=On3F/DLFrInmIVnIoyaTcrsbnbqpU3BpzOCQYFEznAuC+3DFHOQ6+JjCPOoSTdGZVA
         byUJh5p1wd0b0FjyGvzfmFss1+urhZ+mj07fvFoNqlIDhGhOMCjXEFmFFnA9alnJ2ARR
         XbcVkLAr0O91ygXq1Izd16SulB2/JE1dIwja8atj+lqaQdhhR091/Rh94CKrUuyr0eft
         jAjobzsj+Y2uJ+jFoCUgNnLQMr3eUXV4/KnIGgdlzZGwnWhPXGRU2fd+5bD/U3xz2b8U
         wrxCBRsdEMQQQDp2B13jiHzx7nQ/9/yGc/FiFaUuozCpNIE+Pfopku0MOg6S3wJnNvm6
         OO5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=0Vsex3I4g2OE7oG/neSBO+550Ku5bwDkSc1VWgWklJM=;
        b=kzDSrWVyZYCtMuEfZr1gRTRS/pABGLCiKMtBtBUjEnN+qN4ZFwAI8gCr+XTpi0TLs4
         4j1N+KMVUWGJTHBBzGSW0XXswkd6RQvE33hoAd5xJzgOfO11SSB/V0X7K4nY+nF+7DAr
         RHjyMg7JJGb2A/s3Vhct38wWQSvYrmT1TFfKlZDrY5oI84C2XXBeKjctivgpNypRfX3K
         TxZ64UjAqks2RxTg3rQTXzEiRUdDs1ox8imEc81K0lXmIxbpbzCeM5fgoH/VIHJmLCZb
         gjnMz8nnhujm8NuxYeBkANvyY9cnTawXSqt11bRRSy+Xl4pLWvJiFX/bJHU6hHUmqbkD
         R2MA==
X-Gm-Message-State: AOAM5333GxMguvf0opSiHghDKMyJ+fha+a06ui9wxV2WXCFzRIrBCYjm
	QWnCX2o2euXviA6WUWbYNds=
X-Google-Smtp-Source: ABdhPJy5IhU4yYYT5O819bfLHWpyYviWFKlRWlUTu4WevT8HGP6l22zduT9xqn3d5FvMIrGyDVNARg==
X-Received: by 2002:a17:902:d102:b029:128:e250:ebca with SMTP id w2-20020a170902d102b0290128e250ebcamr678585plw.14.1625161943699;
        Thu, 01 Jul 2021 10:52:23 -0700 (PDT)
Subject: Re: [XEN PATCH v6 31/31] build,riscv: tell the build system about
 riscv64/head.S
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-32-anthony.perard@citrix.com>
From: Bob Eshleman <bobbyeshleman@gmail.com>
Organization: Vates SAS
Message-ID: <40116c39-1437-de8c-23bd-0454e4551478@gmail.com>
Date: Thu, 1 Jul 2021 10:52:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210701141011.785641-32-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/1/21 7:10 AM, Anthony PERARD wrote:
> This allows to `make arch/riscv/riscv64/head.o`.
> 
> Example of rune on a fresh copy of the repository:
>     make XEN_TARGET_ARCH=riscv64 CROSS_COMPILE=riscv64-linux-gnu- KBUILD_DEFCONFIG=tiny64_defconfig arch/riscv/riscv64/head.o
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>  xen/arch/riscv/riscv64/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>  create mode 100644 xen/arch/riscv/riscv64/Makefile
> 
> diff --git a/xen/arch/riscv/riscv64/Makefile b/xen/arch/riscv/riscv64/Makefile
> new file mode 100644
> index 000000000000..15a4a65f6615
> --- /dev/null
> +++ b/xen/arch/riscv/riscv64/Makefile
> @@ -0,0 +1 @@
> +extra-y += head.o
> 

Acked-by: Bob Eshleman <bobbyeshleman@gmail.com>

-- 
Bobby Eshleman
SE at Vates SAS

