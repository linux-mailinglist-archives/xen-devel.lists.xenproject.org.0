Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E901E557A37
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 14:23:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354901.582255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Lrh-0003YD-90; Thu, 23 Jun 2022 12:23:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354901.582255; Thu, 23 Jun 2022 12:23:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Lrh-0003V7-5F; Thu, 23 Jun 2022 12:23:17 +0000
Received: by outflank-mailman (input) for mailman id 354901;
 Thu, 23 Jun 2022 12:23:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Gci=W6=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o4Lrf-0003V1-Da
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 12:23:15 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40bb4f29-f2ef-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 14:23:14 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 i127-20020a1c3b85000000b003a0297a61ddso91800wma.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jun 2022 05:23:14 -0700 (PDT)
Received: from [192.168.1.10] (adsl-190.37.6.169.tellas.gr. [37.6.169.190])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a05600c364200b003974d0d981dsm2858413wmq.35.2022.06.23.05.23.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jun 2022 05:23:12 -0700 (PDT)
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
X-Inumbo-ID: 40bb4f29-f2ef-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=VPICt6blLyS4p7N0awnN63eGtHxfntMFc7etnE4RIeY=;
        b=fvGpW++QszI76ej+oNvpd4LLAR1HlDeKmKV3ggTkO6r6YYTk0EQGfOOmZ65323bx91
         kGVqwVaLF0jgn4GXH+vEq2vN4BVmh7Ww5zPyfDSOJ5kjdGHcNUNJ58paDHctgWvb42zT
         IEmElFsBNhprpcZscu44zO9udc3e/CzXehkdWuSdaGbaA/eNAZZ4pCEMqEq9mZPNVnm/
         M8l22xHC06+TCfTsjSlXaHkLBWV0JQtEAGzxdD2F504X7IDnn4kZG7n8aqimjLHyysGL
         pKxVBgJkhA+8+iSNLylnEmayT2VlwpLeRI1aans48p0HDmTytlFtGZwz5mB9ntqRmavH
         gX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VPICt6blLyS4p7N0awnN63eGtHxfntMFc7etnE4RIeY=;
        b=i7Q7e5E0EcODB7DdK534Simgzf1eSv+w+jR8ILmTdkF++CXcnqGLNFcowOGrvMQngB
         WNAfxaI4GgzSPX/1Ll6BhvaMDxLyMiR9yeLs59FuXS9fdwCca56EYv/RLqeT+tB1OHY+
         zFttOtoNmbjj5Qvy2PRKiheI5WCg82fkcHyRZZCem8z35GCceY0Zi/vK0u9KR5QSf0nw
         TjD04DoBLGPYt8MU8wbsNGCDLBegTKCwA85r1xwmxMxlQ3QT5BMBzmVPgsA7IjWcd1J5
         BWfjKnQaKZ3rMUYxcoeALYwxVYtKKwxrPjo3nbM7UI0kcxKoJpdz5/MwjzzrdUNmlSfy
         7xTg==
X-Gm-Message-State: AJIora/tNCVwBe4obxpTt9hzspUJf40xYp/SRSv6+EA8lOT5kz9337TQ
	ioOAdn4Q0Npp3UswHMMF3ag=
X-Google-Smtp-Source: AGRyM1t2tBp/kK/9vndOGfdRohOTNudyGZqhMEos7KcQ27QOtMNFti+UkOgXt7pQ1mWvjXsHp2lQOg==
X-Received: by 2002:a05:600c:2282:b0:39c:7dc6:2d9d with SMTP id 2-20020a05600c228200b0039c7dc62d9dmr3878704wmf.86.1655986993436;
        Thu, 23 Jun 2022 05:23:13 -0700 (PDT)
Message-ID: <2842ffc9-776a-d80b-b7c9-f1a21ed6d517@gmail.com>
Date: Thu, 23 Jun 2022 15:23:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [Viryaos-discuss] [ImageBuilder] [PATCH 1/2] uboot-script-gen:
 Skip dom0 instead of exiting if DOM0_KERNEL is not set
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: viryaos-discuss@lists.sourceforge.net
References: <20220619124316.378365-1-burzalodowa@gmail.com>
 <80dc865b-f053-d9c9-b8d4-efb19abb2e49@amd.com>
 <94cca06c-8439-ec92-3bc7-8f2a69929beb@amd.com>
From: xenia <burzalodowa@gmail.com>
In-Reply-To: <94cca06c-8439-ec92-3bc7-8f2a69929beb@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/23/22 13:01, Ayan Kumar Halder wrote:
> (Resending mail, as the previous delivery failed)
>
> On 21/06/2022 11:57, Ayan Kumar Halder wrote:
>> 1. In README.md, please mention in 'DOM0_KERNEL' description that it 
>> is an optional parameter. When user does not provide this, it 
>> generates a dom0less configuration.

Sure. This patch has been already merged upstream so I will do with a 
follow-on patch.

>>
>> 2. In uboot-script-gen, please provide a check like this :-
>>
>> if test -z "$DOM0_KERNEL"
>>
>> then
>>
>>     if test "DOM0_MEM" || "DOM0_VCPUS" || "DOM0_COLORS" || "DOM0_CMD" 
>> || "DOM0_RAMDISK" || "DOM0_ROOTFS"
>>
>>     then
>>
>>         echo "For Domoless configuration, "DOM0_MEM" || "DOM0_VCPUS" 
>> || "DOM0_COLORS" || "DOM0_CMD" || "DOM0_RAMDISK" || "DOM0_ROOTFS" 
>> should not be defined
>>
>>         exit 1
>>
>>     fi
>>
>> fi
>>
>> The reason is that user should not be allowed to provide with an 
>> incorrect configuration.
>>
Sure. I will do with a follow-on patch.

>> 3. Please test the patch for both dom0 and dom0less. The reason being 
>> such a change might break something. :)
>>
>> - Ayan
>>
>> On 19/06/2022 13:43, Xenia Ragiadakou wrote:
>>> When the parameter DOM0_KERNEL is not specified and NUM_DOMUS is not 0,
>>> instead of failing the script, just skip any dom0 specific setup.
>>> This way the script can be used to boot XEN in dom0less mode.
>>>
>>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>>> ---
>>>   scripts/uboot-script-gen | 60 
>>> ++++++++++++++++++++++++++++------------
>>>   1 file changed, 43 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
>>> index 455b4c0..bdc8a6b 100755
>>> --- a/scripts/uboot-script-gen
>>> +++ b/scripts/uboot-script-gen
>>> @@ -168,10 +168,15 @@ function xen_device_tree_editing()
>>>       dt_set "/chosen" "#address-cells" "hex" "0x2"
>>>       dt_set "/chosen" "#size-cells" "hex" "0x2"
>>>       dt_set "/chosen" "xen,xen-bootargs" "str" "$XEN_CMD"
>>> -    dt_mknode "/chosen" "dom0"
>>> -    dt_set "/chosen/dom0" "compatible" "str_a" "xen,linux-zimage 
>>> xen,multiboot-module multiboot,module"
>>> -    dt_set "/chosen/dom0" "reg" "hex" "0x0 $dom0_kernel_addr 0x0 
>>> $(printf "0x%x" $dom0_kernel_size)"
>>> -    dt_set "/chosen" "xen,dom0-bootargs" "str" "$DOM0_CMD"
>>> +
>>> +    if test "$DOM0_KERNEL"
>>> +    then
>>> +        dt_mknode "/chosen" "dom0"
>>> +        dt_set "/chosen/dom0" "compatible" "str_a" 
>>> "xen,linux-zimage xen,multiboot-module multiboot,module"
>>> +        dt_set "/chosen/dom0" "reg" "hex" "0x0 $dom0_kernel_addr 
>>> 0x0 $(printf "0x%x" $dom0_kernel_size)"
>>> +        dt_set "/chosen" "xen,dom0-bootargs" "str" "$DOM0_CMD"
>>> +    fi
>>> +
>>>       if test "$DOM0_RAMDISK" && test $ramdisk_addr != "-"
>>>       then
>>>           dt_mknode "/chosen" "dom0-ramdisk"
>>> @@ -203,7 +208,10 @@ function xen_device_tree_editing()
>>>               add_device_tree_static_mem "/chosen/domU$i" 
>>> "${DOMU_STATIC_MEM[$i]}"
>>>           fi
>>>           dt_set "/chosen/domU$i" "vpl011" "hex" "0x1"
>>> -        dt_set "/chosen/domU$i" "xen,enhanced" "str" "enabled"
>>> +        if test "$DOM0_KERNEL"
>>> +        then
>>> +            dt_set "/chosen/domU$i" "xen,enhanced" "str" "enabled"
>>> +        fi
>>>             if test "${DOMU_COLORS[$i]}"
>>>           then
>>> @@ -433,6 +441,19 @@ function xen_config()
>>>               DOM0_CMD="$DOM0_CMD root=$root_dev"
>>>           fi
>>>       fi
>>> +    if test -z "$DOM0_KERNEL"
>>> +    then
>>> +        if test "$NUM_DOMUS" -eq "0"
>>> +        then
>>> +            echo "Neither dom0 or domUs are specified, exiting."
>>> +            exit 1
>>> +        fi
>>> +        echo "Dom0 kernel is not specified, continue with dom0less 
>>> setup."
>>> +        unset DOM0_RAMDISK
>>> +        # Remove dom0 specific parameters from the XEN command line.
>>> +        local params=($XEN_CMD)
>>> +        XEN_CMD="${params[@]/dom0*/}"
>>> +    fi
>>>       i=0
>>>       while test $i -lt $NUM_DOMUS
>>>       do
>>> @@ -490,11 +511,13 @@ generate_uboot_images()
>>>     xen_file_loading()
>>>   {
>>> -    check_compressed_file_type $DOM0_KERNEL "executable"
>>> -    dom0_kernel_addr=$memaddr
>>> -    load_file $DOM0_KERNEL "dom0_linux"
>>> -    dom0_kernel_size=$filesize
>>> -
>>> +    if test "$DOM0_KERNEL"
>>> +    then
>>> +        check_compressed_file_type $DOM0_KERNEL "executable"
>>> +        dom0_kernel_addr=$memaddr
>>> +        load_file $DOM0_KERNEL "dom0_linux"
>>> +        dom0_kernel_size=$filesize
>>> +    fi
>>>       if test "$DOM0_RAMDISK"
>>>       then
>>>           check_compressed_file_type $DOM0_RAMDISK "cpio archive"
>>> @@ -597,14 +620,16 @@ bitstream_load_and_config()
>>>     create_its_file_xen()
>>>   {
>>> -    if test "$ramdisk_addr" != "-"
>>> +    if test "$DOM0_KERNEL"
>>>       then
>>> -        load_files="\"dom0_linux\", \"dom0_ramdisk\""
>>> -    else
>>> -        load_files="\"dom0_linux\""
>>> -    fi
>>> -    # xen below
>>> -    cat >> "$its_file" <<- EOF
>>> +        if test "$ramdisk_addr" != "-"
>>> +        then
>>> +            load_files="\"dom0_linux\", \"dom0_ramdisk\""
>>> +        else
>>> +            load_files="\"dom0_linux\""
>>> +        fi
>>> +        # xen below
>>> +        cat >> "$its_file" <<- EOF
>>>           dom0_linux {
>>>               description = "dom0 linux kernel binary";
>>>               data = /incbin/("$DOM0_KERNEL");
>>> @@ -616,6 +641,7 @@ create_its_file_xen()
>>>               $fit_algo
>>>           };
>>>       EOF
>>> +    fi
>>>       # domUs
>>>       i=0
>>>       while test $i -lt $NUM_DOMUS

