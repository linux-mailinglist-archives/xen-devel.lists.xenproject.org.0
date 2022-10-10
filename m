Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CE65F9B6B
	for <lists+xen-devel@lfdr.de>; Mon, 10 Oct 2022 10:53:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419166.663913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohoWt-0006Ng-6C; Mon, 10 Oct 2022 08:52:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419166.663913; Mon, 10 Oct 2022 08:52:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohoWt-0006Lp-2x; Mon, 10 Oct 2022 08:52:55 +0000
Received: by outflank-mailman (input) for mailman id 419166;
 Mon, 10 Oct 2022 08:52:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bLGv=2L=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1ohoWr-0006Lj-L2
 for xen-devel@lists.xenproject.org; Mon, 10 Oct 2022 08:52:53 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ecbbc4b6-4878-11ed-9377-c1cf23e5d27e;
 Mon, 10 Oct 2022 10:52:52 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id q9so18889833ejd.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Oct 2022 01:52:52 -0700 (PDT)
Received: from [192.168.1.93] (adsl-75.176.58.241.tellas.gr. [176.58.241.75])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a17090653d000b00770812e2394sm4971174ejo.160.2022.10.10.01.52.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Oct 2022 01:52:51 -0700 (PDT)
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
X-Inumbo-ID: ecbbc4b6-4878-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Z5l4CKBmKCa6BsMTvccB8bFRHLFhMh7B4VtRTqQNQg=;
        b=nz9S/R1N6ZE2GTv9m67skadQj19LK1GjkVLuZGLc8g6uwtb5kLd/R47O4bSVB192wV
         WLK3Yxx8270rpQSQcZEU2mI+hX94GVEvCxPQcPRNmJ8lUzhHkU/Grj//QtZKV71tiP8V
         Wy9O8kEFKd4SgHbd1Z56V39c/+IR1MVlomylUEdFqhNUY9tWb/rlzBBr6l1/Y//stIUb
         mEce1pSU4/QFV+7RLPKGnzC/AV7m54XjT0/jInxUBoudJDYcrpqNDlLVOx1EDyCc1de+
         YqFPIwGF+zV9Wp7T6Bp4Kb/iLdWGIqH3jTY2SKXtA5eMaXlVYEW11RoxYMDnRH6zXXMS
         LPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Z5l4CKBmKCa6BsMTvccB8bFRHLFhMh7B4VtRTqQNQg=;
        b=J53fRs2GoFwtAoIcnrgmHGaQcEcs0q4gc0Zb3wPGGhAPimw7Xl5t6L7J0rx9QRh2Mu
         UxTc/IkZyvlqpksZloqJIknawBQqv+jm5Z4g+P/zRgPicSBmtonQjX1lwgY0rwAcS5c0
         BMT4k/l0jQT8t3UIpniryEpJFM7/1tAzamzMxD41XFzUtRrttqIl/aNSlZEHUZsMMtIZ
         QSVgiqy25LvpELNs4zAkdr4MEo3v8h+Y4V3XIM7eWnGeHNhmO/Hf41fmFQSD12jgo1DC
         5kahnOUfEy47W0UolbcNDHE+ET8vQwr35PBEVIHBzN3Bmx211MNiGftGW4H7T0ecJ6gY
         GLdw==
X-Gm-Message-State: ACrzQf15EocCtuEFXaj506WU9T/Lba3nmwxrlF+Xv83JsdKvCHIznzy2
	VuwMIy0msal8V20Z212wFSG1OQPFyqo14w==
X-Google-Smtp-Source: AMsMyM7YE7esBBMYse2AC0OOuiWp2UIwtMaS79Eyc0SHEcpxWcPdaJoxlln9Ivfg5EsTA4N3TsTqiQ==
X-Received: by 2002:a17:907:70a:b0:750:bf91:caa3 with SMTP id xb10-20020a170907070a00b00750bf91caa3mr13793106ejb.711.1665391971890;
        Mon, 10 Oct 2022 01:52:51 -0700 (PDT)
Message-ID: <4fc23936-4bfd-635c-b3a2-554e280ce884@gmail.com>
Date: Mon, 10 Oct 2022 11:52:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [ImageBuilder v2] Add support for 64-bit addresses/sizes
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org
References: <20221010072947.8300-1-michal.orzel@amd.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <20221010072947.8300-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/10/22 10:29, Michal Orzel wrote:

Hi Michal

> At the moment, ImageBuilder assumes that all addresses/sizes are
> 32-bit max. It sets #{address,size}-cells to 0x2 and puts 0x0 as the
> value for the first cell. Because of that, we cannot specify
> MEMORY_START and MEMORY_END to be above 32-bits (e.g. to place the images
> in the upper memory bank).
> 
> Add support to properly handle 64-bit addresses/sizes:
>   - add function split_into_halves to split the value passed as a first
>     argument into upper and lower halves. These are then set as values for
>     variables passed respetively as the second and third argument,

s/respetively/respectively/

>   - add function split_addr_size to split address and size and form a
>     string to be passed to dt_set as data argument for reg property.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> Changes in v2:
> - redesign a patch based on master-next instead of NXP dynamic assignment patch
> ---
>   scripts/uboot-script-gen | 33 ++++++++++++++++++++++++++++-----
>   1 file changed, 28 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index b24dca2b7f7e..09d237d192c1 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -22,6 +22,29 @@ function dt_mknode()
>       fi
>   }
>   
> +# Usage:
> +# split_into_halves <value> <variable_to_store_upper> <variable_to_store_lower>
> +function split_into_halves()
> +{
> +    local value=$1
> +    local upper=$2
> +    local lower=$3
> +
> +    eval "$upper=$(printf "0x%X\n" $(($value >> 32)))"
> +    eval "$lower=$(printf "0x%X\n" $(($value & 0xFFFFFFFF)))"
> +}
> +
> +function split_addr_size()
> +{
> +    local addr=$1
> +    local size=$2
> +
> +    split_into_halves $addr addr_upper addr_lower
> +    split_into_halves $size size_upper size_lower
> +

Just a minor observation, the variables addr_upper, addr_lower, 
size_upper and size_lower can be declared local.

> +    echo "$addr_upper $addr_lower $size_upper $size_lower"
> +}
> +
>   # data_type is either
>   #   int
>   #   hex
> @@ -93,7 +116,7 @@ function add_device_tree_kernel()
>   
>       dt_mknode "$path" "module$addr"
>       dt_set "$path/module$addr" "compatible" "str_a" "multiboot,kernel multiboot,module"
> -    dt_set "$path/module$addr" "reg" "hex"  "0x0 $addr 0x0 $(printf "0x%x" $size)"
> +    dt_set "$path/module$addr" "reg" "hex"  "$(split_addr_size $addr $size)"
>       dt_set "$path/module$addr" "bootargs" "str" "$bootargs"
>   }
>   
> @@ -106,7 +129,7 @@ function add_device_tree_ramdisk()
>   
>       dt_mknode "$path"  "module$addr"
>       dt_set "$path/module$addr" "compatible" "str_a" "multiboot,ramdisk multiboot,module"
> -    dt_set "$path/module$addr" "reg" "hex"  "0x0 $addr 0x0 $(printf "0x%x" $size)"
> +    dt_set "$path/module$addr" "reg" "hex"  "$(split_addr_size $addr $size)"
>   }
>   
>   
> @@ -118,7 +141,7 @@ function add_device_tree_passthrough()
>   
>       dt_mknode "$path"  "module$addr"
>       dt_set "$path/module$addr" "compatible" "str_a" "multiboot,device-tree multiboot,module"
> -    dt_set "$path/module$addr" "reg" "hex"  "0x0 $addr 0x0 $(printf "0x%x" $size)"
> +    dt_set "$path/module$addr" "reg" "hex"  "$(split_addr_size $addr $size)"
>   }
>   
>   function add_device_tree_mem()
> @@ -260,7 +283,7 @@ function xen_device_tree_editing()
>       then
>           dt_mknode "/chosen" "dom0"
>           dt_set "/chosen/dom0" "compatible" "str_a" "xen,linux-zimage xen,multiboot-module multiboot,module"
> -        dt_set "/chosen/dom0" "reg" "hex" "0x0 $dom0_kernel_addr 0x0 $(printf "0x%x" $dom0_kernel_size)"
> +        dt_set "/chosen/dom0" "reg" "hex" "$(split_addr_size $dom0_kernel_addr $dom0_kernel_size)"
>           dt_set "/chosen" "xen,dom0-bootargs" "str" "$DOM0_CMD"
>       fi
>   
> @@ -268,7 +291,7 @@ function xen_device_tree_editing()
>       then
>           dt_mknode "/chosen" "dom0-ramdisk"
>           dt_set "/chosen/dom0-ramdisk" "compatible" "str_a" "xen,linux-initrd xen,multiboot-module multiboot,module"
> -        dt_set "/chosen/dom0-ramdisk" "reg" "hex" "0x0 $ramdisk_addr 0x0 $(printf "0x%x" $ramdisk_size)"
> +        dt_set "/chosen/dom0-ramdisk" "reg" "hex" "$(split_addr_size $ramdisk_addr $ramdisk_size)"
>       fi
>   
>       i=0

-- 
Xenia

