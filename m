Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3245606E1
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 19:02:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357974.586889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6b4f-0001xz-PO; Wed, 29 Jun 2022 17:01:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357974.586889; Wed, 29 Jun 2022 17:01:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6b4f-0001vU-Mh; Wed, 29 Jun 2022 17:01:57 +0000
Received: by outflank-mailman (input) for mailman id 357974;
 Wed, 29 Jun 2022 17:01:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M2+n=XE=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o6b4e-0001vO-Q3
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 17:01:56 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2dec736f-f7cd-11ec-bd2d-47488cf2e6aa;
 Wed, 29 Jun 2022 19:01:55 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id ay16so33852850ejb.6
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jun 2022 10:01:55 -0700 (PDT)
Received: from [192.168.1.10] (adsl-146.37.6.170.tellas.gr. [37.6.170.146])
 by smtp.gmail.com with ESMTPSA id
 fd5-20020a056402388500b00436f3107bdasm10688424edb.38.2022.06.29.10.01.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jun 2022 10:01:54 -0700 (PDT)
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
X-Inumbo-ID: 2dec736f-f7cd-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=+Vd8lywTbQEL1LZx5JFpNcyJV94TE2CwbAKyE4V1pTc=;
        b=FtHb6P631xYi8c4peq8t7LqoYLzgy4qDtqyC80vqfMJFNDpFwMHKH9Z6nOv+otBek+
         sNGMbmErhMRIBJ5RXIeMO7N3TjQ5/et2Z+bpTVuC5NtstKAOSUdp1hLUkzGW2kE57jQa
         ebHoNRPtiqc23s/3rPtMNYZBYD4RZlG51ejKv8VK4F41GYt/3XoLL+YXreEFcEZtI8AV
         sFWOgsC3Yotv6laU0J3dlQFouIGcey2Xnfz4zeouBj3Vw7eGouKHvqE1diV8cNiMeZba
         huzcoUMKTHq0zAhz7lQC4OucogW9dlJf8E0SeitLslsXoS24IUxbOx+8xbLSfqxA8rNE
         iAmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+Vd8lywTbQEL1LZx5JFpNcyJV94TE2CwbAKyE4V1pTc=;
        b=v3FgtNCgw9SdMeQ63VDlNCSjkE8KHtdOpVVfSaQA1h3qLGP66Kox00H86hP5oBHv60
         CL6Zgj2UvFNs/zdCFb8YNAGH0T3Ywklt+WuHcjc6rTWprx4g9tcyWUH3id1iDFcGjGqv
         ZhizmYFYUHgp65VnFKnOTJ2v003/TfyAuuTSWjkTvNcb2T0BzpotUnvTxAen+UdEqdxI
         L/IEKaJ8ZHbLb3/cHK2V+e9FTyGa8avOd8UHJJMmIbdNiE/MRyrmHBhW5uFcseXg+W9L
         RBlUaccMdJBeb6hhpwo/cgKhbAAdFf97DADbov/YDVmU47mcz27pKb941H+QabdlwCoR
         Fr9g==
X-Gm-Message-State: AJIora8TY/E3UmjLRu3/hrNnwsYEdvI8m6W3Oz2qSwocdBlwZrkBFILB
	C9+aDttzEh5zQ5nbEAlBJ/U=
X-Google-Smtp-Source: AGRyM1vsMeIxmAkw/U+lfMrlAnsr3lW5Y7VOTSMtc5+e3TOgTMouGYEa6IDhb+4rq0nRfGKj1x5nSg==
X-Received: by 2002:a17:907:1620:b0:726:c0d8:7578 with SMTP id hb32-20020a170907162000b00726c0d87578mr4203309ejc.587.1656522115005;
        Wed, 29 Jun 2022 10:01:55 -0700 (PDT)
Message-ID: <22476413-14da-21cd-eb02-15165bfe602a@gmail.com>
Date: Wed, 29 Jun 2022 20:01:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/2] uboot-script-gen: do not enable direct mapping by
 default
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, viryaos-discuss@lists.sourceforge.net,
 Ayan Kumar Halder <ayankuma@amd.com>
References: <20220626184536.666647-1-burzalodowa@gmail.com>
 <20220626184536.666647-2-burzalodowa@gmail.com>
 <alpine.DEB.2.22.394.2206281727080.4389@ubuntu-linux-20-04-desktop>
From: xenia <burzalodowa@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2206281727080.4389@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 6/29/22 03:28, Stefano Stabellini wrote:
> On Sun, 26 Jun 2022, Xenia Ragiadakou wrote:
>> To be inline with XEN, do not enable direct mapping automatically for all
>> statically allocated domains.
>>
>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> Actually I don't know about this one. I think it is OK that ImageBuilder
> defaults are different from Xen defaults. This is a case where I think
> it would be good to enable DOMU_DIRECT_MAP by default when
> DOMU_STATIC_MEM is specified.
Just realized that I forgot to add [ImageBuilder] tag to the patches. 
Sorry about that.

I cc Ayan, since the change was suggested by him.
I have no strong preference on the default value.

Xenia

>> ---
>>   README.md                | 4 ++--
>>   scripts/uboot-script-gen | 8 ++------
>>   2 files changed, 4 insertions(+), 8 deletions(-)
>>
>> diff --git a/README.md b/README.md
>> index cb15ca5..03e437b 100644
>> --- a/README.md
>> +++ b/README.md
>> @@ -169,8 +169,8 @@ Where:
>>     if specified, indicates the host physical address regions
>>     [baseaddr, baseaddr + size) to be reserved to the VM for static allocation.
>>   
>> -- DOMU_DIRECT_MAP[number] can be set to 1 or 0.
>> -  If set to 1, the VM is direct mapped. The default is 1.
>> +- DOMU_DIRECT_MAP[number] if set to 1, enables direct mapping.
>> +  By default, direct mapping is disabled.
>>     This is only applicable when DOMU_STATIC_MEM is specified.
>>   
>>   - LINUX is optional but specifies the Linux kernel for when Xen is NOT
>> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
>> index 085e29f..66ce6f7 100755
>> --- a/scripts/uboot-script-gen
>> +++ b/scripts/uboot-script-gen
>> @@ -52,7 +52,7 @@ function dt_set()
>>               echo "fdt set $path $var $array" >> $UBOOT_SOURCE
>>           elif test $data_type = "bool"
>>           then
>> -            if test "$data" -eq 1
>> +            if test "$data" == "1"
>>               then
>>                   echo "fdt set $path $var" >> $UBOOT_SOURCE
>>               fi
>> @@ -74,7 +74,7 @@ function dt_set()
>>               fdtput $FDTEDIT -p -t s $path $var $data
>>           elif test $data_type = "bool"
>>           then
>> -            if test "$data" -eq 1
>> +            if test "$data" == "1"
>>               then
>>                   fdtput $FDTEDIT -p $path $var
>>               fi
>> @@ -491,10 +491,6 @@ function xen_config()
>>           then
>>               DOMU_CMD[$i]="console=ttyAMA0"
>>           fi
>> -        if test -z "${DOMU_DIRECT_MAP[$i]}"
>> -        then
>> -             DOMU_DIRECT_MAP[$i]=1
>> -        fi
>>           i=$(( $i + 1 ))
>>       done
>>   }
>> -- 
>> 2.34.1
>>

