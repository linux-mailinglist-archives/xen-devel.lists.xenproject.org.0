Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AEA41AA01
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 09:43:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197711.350920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV7lJ-0007Eo-3w; Tue, 28 Sep 2021 07:42:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197711.350920; Tue, 28 Sep 2021 07:42:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV7lJ-0007C6-0h; Tue, 28 Sep 2021 07:42:49 +0000
Received: by outflank-mailman (input) for mailman id 197711;
 Tue, 28 Sep 2021 07:42:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sHmr=OS=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1mV7lI-0007C0-3F
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 07:42:48 +0000
Received: from mail-wm1-x334.google.com (unknown [2a00:1450:4864:20::334])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6a38e9ef-717e-4fdd-a30e-2fb3b88cbf87;
 Tue, 28 Sep 2021 07:42:46 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id v127so2648968wme.5
 for <xen-devel@lists.xenproject.org>; Tue, 28 Sep 2021 00:42:46 -0700 (PDT)
Received: from ?IPV6:2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec?
 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id o5sm7528635wrf.85.2021.09.28.00.42.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 00:42:45 -0700 (PDT)
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
X-Inumbo-ID: 6a38e9ef-717e-4fdd-a30e-2fb3b88cbf87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gCYg6qV9LtwuAYek9WtbGywdKoMVO4jikqVXZIdqHBc=;
        b=VG7AaA0U9BscB+iS7fD7aYibTgB7yHa3LN0E7eOAgv8Y6i/Z2xXZPSCg+ywfiwONPQ
         S5aaXVrAsWdd1GTTEejAlyEjZ9clFZyRNgaNedh1WQlmuCp4u96gkHNcZ4Whv+5t5aVL
         Zuoj/jJV/5jYmjW1JvXhcyHYVKjZC92GKW/waeEg3Lew8Yyba8w0CbHdIOMouQLJMCIh
         RKV1iPWRi2+V42Wrr15IEy9AhRKth1oQXzETGt5Sc7U7YXax1Lrvbp6lNnEITm8b0irN
         Fs5NxjXR6HYrEBQjS9JtrNbznRNsrhfMxdxAawvlGWBgMZKTbd0fvncBchIMl0KFe9Fg
         FhSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gCYg6qV9LtwuAYek9WtbGywdKoMVO4jikqVXZIdqHBc=;
        b=hkqEOKQeKoErgMJGKCrm317YeqO8Kvtil2xqGo0AlZnWW7Llmo5H1F15lt+YvuHKcQ
         McmHgt3cex82EigOkLPGoQDqqeWIdHT52zTDZjXjRUiVf3a6vdxmGK7n37rAYFn3K/9+
         cyKKPTaFWIdfgATXNCwQY63rM1eJpgntrQ+nlB/RJ3pMM8X9A8qgKO+GO2kr6c+BcoqT
         XUZqPw7akZGN+aFafQnsZz6+fWCButPlYhTeMr59eAlFv6NX1rrjv3Uo0FIZUAfbEKRl
         iFg/75bdxOeKvNJzGpyffnGy/Qg0zI1g1xo6kJUMw9AfhbnGt+vJzZe0L/DKGA/wRZrk
         I7oA==
X-Gm-Message-State: AOAM5325djCsXsJbNF01tdlaYGyDSLm5/xceOFktbIPX7OcNv2jGd9a4
	QYQOwDVH/7Q1sP2yBacz1Dc=
X-Google-Smtp-Source: ABdhPJzHavlBPaI4vnHVFpOZZRr1LMDbRv+IL4vPXk3W95yWQVW8ymuxDZyC5utj0kGm6sk2Kxz9yg==
X-Received: by 2002:a7b:c932:: with SMTP id h18mr3229680wml.112.1632814965924;
        Tue, 28 Sep 2021 00:42:45 -0700 (PDT)
Message-ID: <ba9fe216-32a8-ef6d-173b-4f0d31a20db2@gmail.com>
Date: Tue, 28 Sep 2021 08:42:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Reply-To: paul@xen.org
Subject: Re: [PATCH v8 6/6] AMD/IOMMU: expose errors and warnings
 unconditionally
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <d249a759-188a-d689-316a-4743922827e5@suse.com>
 <dc0cd7f7-a313-099d-3e89-e3862ed11f43@suse.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <dc0cd7f7-a313-099d-3e89-e3862ed11f43@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/09/2021 15:38, Jan Beulich wrote:
> Making these dependent upon "iommu=debug" isn't really helpful in the
> field. Where touching respective code anyway also make use of %pp and
> %pd.
> 
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Paul Durrant <paul@xen.org>

... with one nit below...

> ---
[snip]
> --- a/xen/drivers/passthrough/amd/iommu_acpi.c
> +++ b/xen/drivers/passthrough/amd/iommu_acpi.c
> @@ -174,7 +174,7 @@ static int __init reserve_unity_map_for_
>           if ( unity_map->addr + unity_map->length > base &&
>                base + length > unity_map->addr )
>           {
> -            AMD_IOMMU_DEBUG("IVMD Error: overlap [%lx,%lx) vs [%lx,%lx)\n",
> +            AMD_IOMMU_ERROR("IVMD: overlap [%lx,%lx) vs [%lx,%lx)\n",
>                               base, base + length, unity_map->addr,
>                               unity_map->addr + unity_map->length);
>               return -EPERM;
> @@ -248,7 +248,7 @@ static int __init register_range_for_dev
>       iommu = find_iommu_for_device(seg, bdf);
>       if ( !iommu )
>       {
> -        AMD_IOMMU_DEBUG("IVMD Error: No IOMMU for Dev_Id %#x!\n", bdf);
> +        AMD_IOMMU_ERROR("IVMD: no IOMMU for Dev_Id %#x\n", bdf);
>           return -ENODEV;
>       }
>       req = ivrs_mappings[bdf].dte_requestor_id;
> @@ -318,7 +318,7 @@ static int __init parse_ivmd_device_sele
>       bdf = ivmd_block->header.device_id;
>       if ( bdf >= ivrs_bdf_entries )
>       {
> -        AMD_IOMMU_DEBUG("IVMD Error: Invalid Dev_Id %#x\n", bdf);
> +        AMD_IOMMU_ERROR("IVMD: invalid Dev_Id %#x\n", bdf);
>           return -ENODEV;
>       }
>   
> @@ -335,16 +335,14 @@ static int __init parse_ivmd_device_rang
>       first_bdf = ivmd_block->header.device_id;
>       if ( first_bdf >= ivrs_bdf_entries )
>       {
> -        AMD_IOMMU_DEBUG("IVMD Error: "
> -                        "Invalid Range_First Dev_Id %#x\n", first_bdf);
> +        AMD_IOMMU_ERROR("IVMD: invalid Range_First Dev_Id %#x\n", first_bdf);
>           return -ENODEV;
>       }
>   
>       last_bdf = ivmd_block->aux_data;
>       if ( (last_bdf >= ivrs_bdf_entries) || (last_bdf <= first_bdf) )
>       {
> -        AMD_IOMMU_DEBUG("IVMD Error: "
> -                        "Invalid Range_Last Dev_Id %#x\n", last_bdf);
> +        AMD_IOMMU_ERROR("IVMD: invalid Range_Last Dev_Id %#x\n", last_bdf);
>           return -ENODEV;
>       }
>   
> @@ -367,7 +365,7 @@ static int __init parse_ivmd_device_iomm
>                                       ivmd_block->aux_data);
>       if ( !iommu )
>       {
> -        AMD_IOMMU_DEBUG("IVMD Error: No IOMMU for Dev_Id %#x Cap %#x\n",
> +        AMD_IOMMU_ERROR("IVMD: no IOMMU for Dev_Id %#x Cap %#x\n",
>                           ivmd_block->header.device_id, ivmd_block->aux_data);
>           return -ENODEV;
>       }
> @@ -384,7 +382,7 @@ static int __init parse_ivmd_block(const
>   
>       if ( ivmd_block->header.length < sizeof(*ivmd_block) )
>       {
> -        AMD_IOMMU_DEBUG("IVMD Error: Invalid Block Length!\n");
> +        AMD_IOMMU_ERROR("IVMD: invalid block length\n");
>           return -ENODEV;
>       }
>   
> @@ -402,8 +400,8 @@ static int __init parse_ivmd_block(const
>            (addr_bits < BITS_PER_LONG &&
>             ((start_addr + mem_length - 1) >> addr_bits)) )
>       {
> -        AMD_IOMMU_DEBUG("IVMD: [%lx,%lx) is not IOMMU addressable\n",
> -                        start_addr, start_addr + mem_length);
> +        AMD_IOMMU_WARN("IVMD: [%lx,%lx) is not IOMMU addressable\n",
> +                       start_addr, start_addr + mem_length);
>           return 0;
>       }
>   
> @@ -411,8 +409,8 @@ static int __init parse_ivmd_block(const
>       {
>           paddr_t addr;
>   
> -        AMD_IOMMU_DEBUG("IVMD: [%lx,%lx) is not (entirely) in reserved memory\n",
> -                        base, limit + PAGE_SIZE);
> +        AMD_IOMMU_WARN("IVMD: [%lx,%lx) is not (entirely) in reserved memory\n",
> +                       base, limit + PAGE_SIZE);
>   
>           for ( addr = base; addr <= limit; addr += PAGE_SIZE )
>           {
> @@ -423,7 +421,7 @@ static int __init parse_ivmd_block(const
>                   if ( e820_add_range(&e820, addr, addr + PAGE_SIZE,
>                                       E820_RESERVED) )
>                       continue;
> -                AMD_IOMMU_DEBUG("IVMD Error: Page at %lx couldn't be reserved\n",
> +                AMD_IOMMU_ERROR("IVMD: page at %lx couldn't be reserved\n",
>                                   addr);
>                   return -EIO;
>               }
> @@ -433,8 +431,7 @@ static int __init parse_ivmd_block(const
>                              RAM_TYPE_UNUSABLE)) )
>                   continue;
>   
> -            AMD_IOMMU_DEBUG("IVMD Error: Page at %lx can't be converted\n",
> -                            addr);
> +            AMD_IOMMU_ERROR("IVMD: page at %lx can't be converted\n", addr);
>               return -EIO;
>           }
>       }
> @@ -448,7 +445,7 @@ static int __init parse_ivmd_block(const
>       }
>       else
>       {
> -        AMD_IOMMU_DEBUG("IVMD Error: Invalid Flag Field!\n");
> +        AMD_IOMMU_ERROR("IVMD: invalid flag field\n");
>           return -ENODEV;
>       }
>   
> @@ -471,7 +468,8 @@ static int __init parse_ivmd_block(const
>                                          iw, ir, exclusion);
>   
>       default:
> -        AMD_IOMMU_DEBUG("IVMD Error: Invalid Block Type!\n");
> +        AMD_IOMMU_ERROR("IVMD: unknown block type %#x\n",
> +                        ivmd_block->header.type);
>           return -ENODEV;
>       }
>   }
> @@ -481,7 +479,7 @@ static u16 __init parse_ivhd_device_padd
>   {
>       if ( header_length < (block_length + pad_length) )
>       {
> -        AMD_IOMMU_DEBUG("IVHD Error: Invalid Device_Entry Length!\n");
> +        AMD_IOMMU_ERROR("IVHD: invalid Device_Entry length\n");
>           return 0;
>       }
>   
> @@ -496,7 +494,7 @@ static u16 __init parse_ivhd_device_sele
>       bdf = select->header.id;
>       if ( bdf >= ivrs_bdf_entries )
>       {
> -        AMD_IOMMU_DEBUG("IVHD Error: Invalid Device_Entry Dev_Id %#x\n", bdf);
> +        AMD_IOMMU_ERROR("IVHD: invalid Device_Entry Dev_Id %#x\n", bdf);
>           return 0;
>       }
>   
> @@ -515,14 +513,13 @@ static u16 __init parse_ivhd_device_rang
>       dev_length = sizeof(*range);
>       if ( header_length < (block_length + dev_length) )
>       {
> -        AMD_IOMMU_DEBUG("IVHD Error: Invalid Device_Entry Length!\n");
> +        AMD_IOMMU_ERROR("IVHD: invalid Device_Entry length\n");
>           return 0;
>       }
>   
>       if ( range->end.header.type != ACPI_IVRS_TYPE_END )
>       {
> -        AMD_IOMMU_DEBUG("IVHD Error: "
> -                        "Invalid Range: End_Type %#x\n",
> +        AMD_IOMMU_ERROR("IVHD Error: invalid range: End_Type %#x\n",

NIT: I guess you want to drop the 'Error' here like you did elsewhere.


