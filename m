Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4653F561980
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 13:46:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358445.587661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6scd-0000wN-6W; Thu, 30 Jun 2022 11:46:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358445.587661; Thu, 30 Jun 2022 11:46:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6scd-0000sy-3m; Thu, 30 Jun 2022 11:46:11 +0000
Received: by outflank-mailman (input) for mailman id 358445;
 Thu, 30 Jun 2022 11:46:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8cNV=XF=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o6scc-0000ss-BI
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 11:46:10 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b67e9e9-f86a-11ec-bd2d-47488cf2e6aa;
 Thu, 30 Jun 2022 13:46:09 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id g26so38460656ejb.5
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jun 2022 04:46:09 -0700 (PDT)
Received: from [192.168.1.10] (adsl-146.37.6.170.tellas.gr. [37.6.170.146])
 by smtp.gmail.com with ESMTPSA id
 ba29-20020a0564021add00b00435a62d35b5sm12970888edb.45.2022.06.30.04.46.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 04:46:08 -0700 (PDT)
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
X-Inumbo-ID: 3b67e9e9-f86a-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ZKlio/AzJ6PJL+hQCWsbnuy/GPadpi3W60W3AP2+H8A=;
        b=RKj0sHHY2C+uCXtO8Qj+yRPowIxiu22aiiiZ2tOmNnliEul8TQvB2Q7WwqX9ZFRJD0
         OnL3TdSMoESaqj8SMqtobdf6+FnrzxxeryMp6X1ipnt8Bdqm6MTsKUmb9N5Plkbf0LGv
         0ffwSoiwvmcxpIMU26Qn25AwYgykcb+CG+mC8sfQqlEDtNTVIgQb6coxmxVFJ8Twowt5
         RIsGC55L6WUtvkeg9FgOKz5gJgmkdpoJBFwtTggcNxG3bV1WVCPOjNiKRCiwO4xZTeil
         MPt25KUkZfn/IkWhhPpq6Wzte/JuW2omQc8Uupf9V7i2rrBiVv2qpUXinlqNghiwDZt7
         4nRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZKlio/AzJ6PJL+hQCWsbnuy/GPadpi3W60W3AP2+H8A=;
        b=7kx3Dlzz4uL7T2Sln+Q3FMO+LeRUQ+rQF/kBobIrGAR3X/oUfTz16k2hAluyhnNKu3
         oHZ6PguIePye17Lu/VW376HiONeyZGfTV6ltJlF9EhU7pzZjKnHK0YjR/lrsuhSDmvw2
         Q3/M72TL4iukHTykmipmq30juzksF5X2N689vdeNxd+xJt/oDyaYJXCYu7ELhRKokVWc
         wZ5cF0gzhs96z129CKeB9mWz3xVLfm0mzIh8xiJiuYLysO8x/AaGqipY+vszMxuDu7mP
         1cuSfAfpatyISPU6hPG0vPLx6SxCXvO1KOxl7p/gvMiE1CsKdQMDHs85gGIL4AfFKPPM
         qqYQ==
X-Gm-Message-State: AJIora9o2AndMv34G2xTMiTkwYSFFBpr+4t3b+GWOCuIflrbEjsxO0eO
	f+/qvBT7pXHRXX2x+nmtbH4=
X-Google-Smtp-Source: AGRyM1vWodVPizm0Aj6tgU/N7E06+lBncILbxFulU2MeNOjWycOPURyqrso66jaxNnTVaPmMxXlTjA==
X-Received: by 2002:a17:907:16a2:b0:726:abbc:69bf with SMTP id hc34-20020a17090716a200b00726abbc69bfmr8326891ejc.363.1656589568578;
        Thu, 30 Jun 2022 04:46:08 -0700 (PDT)
Message-ID: <da2b825d-9612-acb5-8069-1ec5b210e4d6@gmail.com>
Date: Thu, 30 Jun 2022 14:46:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/2] uboot-script-gen: do not enable direct mapping by
 default
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, viryaos-discuss@lists.sourceforge.net
References: <20220626184536.666647-1-burzalodowa@gmail.com>
 <20220626184536.666647-2-burzalodowa@gmail.com>
 <alpine.DEB.2.22.394.2206281727080.4389@ubuntu-linux-20-04-desktop>
 <22476413-14da-21cd-eb02-15165bfe602a@gmail.com>
 <cafc1602-6f5f-3238-801d-29c13ed37f50@amd.com>
 <alpine.DEB.2.22.394.2206291323470.4389@ubuntu-linux-20-04-desktop>
 <d2057409-6557-ec71-ab68-e74dc9aafe66@amd.com>
From: xenia <burzalodowa@gmail.com>
In-Reply-To: <d2057409-6557-ec71-ab68-e74dc9aafe66@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ayan,

On 6/30/22 14:28, Ayan Kumar Halder wrote:
>
> On 29/06/2022 21:28, Stefano Stabellini wrote:
>> On Wed, 29 Jun 2022, Ayan Kumar Halder wrote:
>>> Hi Stefano/Xenia,
>>>
>>> On 29/06/2022 18:01, xenia wrote:
>>>> Hi Stefano,
>>>>
>>>> On 6/29/22 03:28, Stefano Stabellini wrote:
>>>>> On Sun, 26 Jun 2022, Xenia Ragiadakou wrote:
>>>>>> To be inline with XEN, do not enable direct mapping automatically 
>>>>>> for
>>>>>> all
>>>>>> statically allocated domains.
>>>>>>
>>>>>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>>>>> Actually I don't know about this one. I think it is OK that 
>>>>> ImageBuilder
>>>>> defaults are different from Xen defaults. This is a case where I 
>>>>> think
>>>>> it would be good to enable DOMU_DIRECT_MAP by default when
>>>>> DOMU_STATIC_MEM is specified.
>>>> Just realized that I forgot to add [ImageBuilder] tag to the 
>>>> patches. Sorry
>>>> about that.
>>> @Stefano, why do you wish the Imagebuilder's behaviour to differ 
>>> from Xen ? Is
>>> there any use-case that helps.
>> As background, ImageBuilder is meant to be very simple to use especially
>> for the most common configurations. In fact, I think ImageBuilder
>> doesn't necessarely have to support all the options that Xen offers,
>> only the most common and important.
>>
>> If someone wants an esoteric option, they can always edit the generated
>> boot.source and make any necessary changes. I make sure to explain that
>> editing boot.source is always a possibility in all the talks I gave
>> about ImageBuilder.
>>
>> Now to answer the specific question. I am positive that the most common
>> configuration for people that wants static memory is to have direct_map.
>> That is because the two go hand-in-hand in configuration where the IOMMU
>> is not used. So I think that from an ImageBuilder perspective direct_map
>> should default to enabled when static memory is requested. It can always
>> be disabled, both using DOMU_DIRECT_MAP, or editing boot.source.
>
> Many thanks for the explanation. This makes sense.
>
> I think this patch can be dropped then.
>
> Xenia, apologies for suggesting you to do this in the first place.

No worries, it 's all part of the process :)

> - Ayan
>
>>
>>>> I cc Ayan, since the change was suggested by him.
>>>> I have no strong preference on the default value.
>>>>
>>>> Xenia
>>>>
>>>>>> ---
>>>>>>    README.md                | 4 ++--
>>>>>>    scripts/uboot-script-gen | 8 ++------
>>>>>>    2 files changed, 4 insertions(+), 8 deletions(-)
>>>>>>
>>>>>> diff --git a/README.md b/README.md
>>>>>> index cb15ca5..03e437b 100644
>>>>>> --- a/README.md
>>>>>> +++ b/README.md
>>>>>> @@ -169,8 +169,8 @@ Where:
>>>>>>      if specified, indicates the host physical address regions
>>>>>>      [baseaddr, baseaddr + size) to be reserved to the VM for static
>>>>>> allocation.
>>>>>>    -- DOMU_DIRECT_MAP[number] can be set to 1 or 0.
>>>>>> -  If set to 1, the VM is direct mapped. The default is 1.
>>>>>> +- DOMU_DIRECT_MAP[number] if set to 1, enables direct mapping.
>>>>>> +  By default, direct mapping is disabled.
>>>>>>      This is only applicable when DOMU_STATIC_MEM is specified.
>>>>>>      - LINUX is optional but specifies the Linux kernel for when 
>>>>>> Xen is
>>>>>> NOT
>>>>>> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
>>>>>> index 085e29f..66ce6f7 100755
>>>>>> --- a/scripts/uboot-script-gen
>>>>>> +++ b/scripts/uboot-script-gen
>>>>>> @@ -52,7 +52,7 @@ function dt_set()
>>>>>>                echo "fdt set $path $var $array" >> $UBOOT_SOURCE
>>>>>>            elif test $data_type = "bool"
>>>>>>            then
>>>>>> -            if test "$data" -eq 1
>>>>>> +            if test "$data" == "1"
>>>>>>                then
>>>>>>                    echo "fdt set $path $var" >> $UBOOT_SOURCE
>>>>>>                fi
>>>>>> @@ -74,7 +74,7 @@ function dt_set()
>>>>>>                fdtput $FDTEDIT -p -t s $path $var $data
>>>>>>            elif test $data_type = "bool"
>>>>>>            then
>>>>>> -            if test "$data" -eq 1
>>>>>> +            if test "$data" == "1"
>>>>>>                then
>>>>>>                    fdtput $FDTEDIT -p $path $var
>>>>>>                fi
>>>>>> @@ -491,10 +491,6 @@ function xen_config()
>>>>>>            then
>>>>>>                DOMU_CMD[$i]="console=ttyAMA0"
>>>>>>            fi
>>>>>> -        if test -z "${DOMU_DIRECT_MAP[$i]}"
>>>>>> -        then
>>>>>> -             DOMU_DIRECT_MAP[$i]=1
>>>>>> -        fi
>>>>>>            i=$(( $i + 1 ))
>>>>>>        done
>>>>>>    }
>>>>>> -- 
>>>>>> 2.34.1
>>>>>>

