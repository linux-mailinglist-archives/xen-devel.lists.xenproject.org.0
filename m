Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCA2423DFC
	for <lists+xen-devel@lfdr.de>; Wed,  6 Oct 2021 14:45:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202914.357934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY6IQ-0006Qk-KK; Wed, 06 Oct 2021 12:45:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202914.357934; Wed, 06 Oct 2021 12:45:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY6IQ-0006Ov-HG; Wed, 06 Oct 2021 12:45:18 +0000
Received: by outflank-mailman (input) for mailman id 202914;
 Wed, 06 Oct 2021 12:45:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RZr5=O2=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mY6IO-0006On-7P
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 12:45:16 +0000
Received: from mail-ed1-x532.google.com (unknown [2a00:1450:4864:20::532])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id de980cca-115b-4966-a4b9-ff8b2d983a8e;
 Wed, 06 Oct 2021 12:45:15 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id z20so9289406edc.13
 for <xen-devel@lists.xenproject.org>; Wed, 06 Oct 2021 05:45:15 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id t4sm9975460edc.2.2021.10.06.05.45.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 05:45:13 -0700 (PDT)
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
X-Inumbo-ID: de980cca-115b-4966-a4b9-ff8b2d983a8e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=CU5CqIpOCHtcOd9CxtMIwi/oo3TxK0WDN2pzFn/z9CQ=;
        b=WMvX4w2TGGF75p877H0e8sfCvLWKPx51TtpWYklYlIrT448EML7JiMohV3i0aKIMMV
         JZ8Z5cioLigRK57WxaSVs6e1mt588rzx4FZBVY5BF6rRyx6j5M+YY5o87XwzZK1FSAXL
         YxZF1REWbcrNJknEHCcVhsEQSKwSSPcKA7snaMyGcn34ObrBOo4zJZZ4VyaWq+4LcWTn
         dM/0R4EwbbgcNoX6yAfzJKAtARTgCgZZWz67A/KQWNsCfwQP5CAU6EA2gI34mAATDYBH
         rXsi8JAemghp6xpxTyJPWNv6WnAxTqXig0q+2ZEv2iO+Qx/ZVzQbXtD76msRAm+J/4sn
         4FRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=CU5CqIpOCHtcOd9CxtMIwi/oo3TxK0WDN2pzFn/z9CQ=;
        b=rm09wLns3mhhBS0fE7JT71nFQFpupVE9CMAr2eRwDQfU9y+uqUQArt4jmSsEGit5ro
         R8nhLgSjSyk4OUHjxVGaukvr2K8rZFoSwGDUa+jHF85fffvA6DFvx1bkCdnjrKEk9y4w
         +7MI0JSzBEfFaMrGrrv0z5Xps378f/6cZYgW4lBGBxjnpogOeOgU0MymXrbr5Vr57fx0
         2V2iB+PrclZbHKKww+8bjwcIxoQGZHRlhfjewBWQ18njD9TJbomJZSFhDbESeKC08tAV
         9mN8z3o7mzN1kl462s1Q1Th4lMs90wQXCViO4ViOz9MHC1XXohKaash98QYzQirA1kMx
         CR6g==
X-Gm-Message-State: AOAM532QjI2vnzS3v/rx/3CckjEHjAuqnvY83kv+Iv7YsOjUxE7hoATg
	mzzpnwWpLSHE8tqQ7JwAvluNzU6FbOk=
X-Google-Smtp-Source: ABdhPJzISS1y47ByabQFHMmtwUVPlczNmyQfHM2YI91ugjTR1XLdFFJCdo4vZxsliwgTg9wBXlMhlw==
X-Received: by 2002:a17:906:a2c9:: with SMTP id by9mr27602554ejb.305.1633524314059;
        Wed, 06 Oct 2021 05:45:14 -0700 (PDT)
Subject: Re: [RFC 1/1] xen/arm: set iommu property for IOMMU-protected devices
To: Roman Skakun <rm.skakun@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, xen-devel@lists.xenproject.org,
 Roman Skakun <roman_skakun@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrii Anisov <andrii_anisov@epam.com>
References: <cover.1633106362.git.roman_skakun@epam.com>
 <5b101e4e85668bbb18da83044520b0350344f408.1633106362.git.roman_skakun@epam.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <292787a5-503f-72a5-3255-e583a1d014cb@gmail.com>
Date: Wed, 6 Oct 2021 15:45:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5b101e4e85668bbb18da83044520b0350344f408.1633106362.git.roman_skakun@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 04.10.21 12:54, Roman Skakun wrote:

Hi Roman

> From: Roman Skakun <roman_skakun@epam.com>
>
> Xen is not exposing any IOMMU properties to Dom0.
> So Dom0 assumes that all it's devices are not protected by IOMMU.
>
> To make Dom0 aware of IOMMU-protected devices, we need to mark
> them somehow. With this approach Dom0 Linux kernel will be able
> to selectively disable swiotlb-xen fops for them which will remove
> unnecessary buffer bounces.
>
> This patch adds mechanism to describe IOMMU-protected devices by
> adding `xen,behind-iommu` property to relevant device nodes in
> Dom0 device tree.

I think that new property should be documented probably at

docs/misc/arm/device-tree/...

>
> Signed-off-by: Roman Skakun <roman_skakun@epam.com>
> ---
>   xen/arch/arm/domain_build.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 69fff7fc29..99e2c42b6c 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -580,6 +580,13 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
>               return res;
>       }
>   
> +    if ( iommu_node && is_iommu_enabled(d) && dt_device_is_protected(node) )
> +    {
> +        res = fdt_property(kinfo->fdt, "xen,behind-iommu", NULL, 0);
> +        if ( res )
> +            return res;
> +    }
> +
>       /*
>        * Override the property "status" to disable the device when it's
>        * marked for passthrough.

-- 
Regards,

Oleksandr Tyshchenko


