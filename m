Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C38658B451
	for <lists+xen-devel@lfdr.de>; Sat,  6 Aug 2022 09:50:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381758.616529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oKEYL-0007e7-8u; Sat, 06 Aug 2022 07:48:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381758.616529; Sat, 06 Aug 2022 07:48:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oKEYL-0007b1-5n; Sat, 06 Aug 2022 07:48:57 +0000
Received: by outflank-mailman (input) for mailman id 381758;
 Sat, 06 Aug 2022 07:48:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vGaZ=YK=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oKEYJ-0007av-88
 for xen-devel@lists.xenproject.org; Sat, 06 Aug 2022 07:48:55 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3789a115-155c-11ed-924f-1f966e50362f;
 Sat, 06 Aug 2022 09:48:53 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 p8-20020a05600c05c800b003a50311d75cso4431285wmd.4
 for <xen-devel@lists.xenproject.org>; Sat, 06 Aug 2022 00:48:53 -0700 (PDT)
Received: from ?IPV6:2a02:587:ac1d:6c00:8f6:5cd3:d95f:677c?
 ([2a02:587:ac1d:6c00:8f6:5cd3:d95f:677c])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a1c7217000000b003a0323463absm6768490wmc.45.2022.08.06.00.48.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Aug 2022 00:48:52 -0700 (PDT)
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
X-Inumbo-ID: 3789a115-155c-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=kQUJyvpMJ2j1Cr1OlnG75QcsN292tBPizCATbRqCnOI=;
        b=HQOTl7PsOkluQ1AHCD5PTT9sDYTAiFA21JUu3pRdO8kJRkiETMF3BPVNHsArReJDyK
         X8najzN5MRXImXUUg8M9lOTS6sQ75ICP/7COqTf41KxnVOHgJ8s3A7VJsDq56U28w1zq
         Mtu8ZjpUoEjFuj1dBy3/liA1ZkWNnxz15GINR9YIZ7z6gYTTkUqxydwFUulj1iHzHR62
         iOQlp6NByq/+0/BsLhMtJMotnjuhzEb26do+Ew3MWMYtx6RYTuRA/IrtEMEP46NBsiZ6
         mwycMihcWNSgti8ntHf0HmWkIeQ5w4x1av17F+b/8LlttiX3OtO3Ya61bQtbVzpwVFUM
         4LIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=kQUJyvpMJ2j1Cr1OlnG75QcsN292tBPizCATbRqCnOI=;
        b=IQK/JASIlJcw/SnmNMbdkKdiE1rrJrBt/CQYBKI51xup+2StxRFUrUzpBVV0tO1CsW
         lzDqBPITmkS9YCb8uxHWSODoTfOfBwtfIITXBsi+bCufSl9V0uWciDkD0WJQaTfrJikO
         ISIlaAgXo0yyPm+B4f4+oCxZg0CaUbH4GYF9924s/HLoW4tV4RPGUM84b+mSb3xBtjDz
         D+r53mUtasBxlp+P1IKYjEq7xjxMn6fhilmjpHUKyq2/YBzofG4wUA8FAw7SpqPJJZWL
         LuWd63HwASQxWq7Bgcyi0HOxuHJysqXccc22IuHIr6bO7eD+wgefsuZDMnPfQodW5z+r
         TJWw==
X-Gm-Message-State: ACgBeo0IguuKXXCf4i9yQbxnVQlK4m52dJz04g296t4us9vbgEJuUKNM
	ojrcIN7VGFV5HSVpFh65YVg=
X-Google-Smtp-Source: AA6agR6MHuLOi/q+w+zs4ekeMKSAFT9dRzepKUhOmJyXLc51zczzTPJgXVW+xAIXkn6075WMQMb/zA==
X-Received: by 2002:a05:600c:a03:b0:39e:4f0c:938c with SMTP id z3-20020a05600c0a0300b0039e4f0c938cmr6804125wmp.145.1659772132669;
        Sat, 06 Aug 2022 00:48:52 -0700 (PDT)
Message-ID: <c9802c8f-b8e7-09c9-45ab-02ea23e5592e@gmail.com>
Date: Sat, 6 Aug 2022 10:48:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] automation: qemu-smoke-arm64: Run ping test over a pv
 network interface
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
References: <20220805211741.1869068-1-burzalodowa@gmail.com>
 <20220805211741.1869068-3-burzalodowa@gmail.com>
 <alpine.DEB.2.22.394.2208051453020.3147284@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2208051501510.3147284@ubuntu-linux-20-04-desktop>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2208051501510.3147284@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 8/6/22 04:18, Stefano Stabellini wrote:
> On Fri, 5 Aug 2022, Stefano Stabellini wrote:
>> On Sat, 6 Aug 2022, Xenia Ragiadakou wrote:
>>> This patch modified the test in the following way
>>> - Dom0 is booted with an alpine linux rootfs with the xen tools.
>>> - Once Dom0 is booted, it starts xenstored, calls init-dom0less to setup
>>> the xenstore interface for the dom0less Dom1, setups the bridged network
>>> and attaches a pv network interface to Dom1.
>>> - In the meantime, Dom1 in its init script tries to assign an ip to eth0
>>> and ping Dom0,
>>> - If Dom1 manages to ping Dom0, it prints 'passed'.
>>>
>>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> 
> [...]
> 
>>> @@ -113,5 +148,5 @@ timeout -k 1 240 \
>>>       -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin |& tee smoke.serial
>>>   
>>>   set -e
>>> -(grep -q "^BusyBox" smoke.serial && grep -q "DOM1: ${passed}" smoke.serial) || exit 1
>>> +(grep -q "^Welcome to Alpine Linux 3.12" smoke.serial && grep -q "DOM1: ${passed}" smoke.serial) || exit 1
>>>   exit 0
>>
>> This patch looks great! One minor comment: Should we great only for
>> "^Welcome to Alpine Linux" without the version (3.12) to make it easier
>> to upgrade in the future?
>>
>> If you are OK with it, I can remove "3.12" on commit.
> 
> We also need to remove DOMU_ENHANCED[0] from the ImageBuilder config
> otherwise this is not going to work.
> 
> diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
> index a79401fd81..0d19ad52cc 100755
> --- a/automation/scripts/qemu-smoke-arm64.sh
> +++ b/automation/scripts/qemu-smoke-arm64.sh
> @@ -118,7 +118,6 @@ NUM_DOMUS=1
>   DOMU_KERNEL[0]="Image"
>   DOMU_RAMDISK[0]="initrd"
>   DOMU_MEM[0]="256"
> -DOMU_ENHANCED[0]=0
>   
>   LOAD_CMD="tftpb"
>   UBOOT_SOURCE="boot.source"

This change was not there when I was testing, that's why.
I will wait a bit in case there are more comments and I will send a v2 
with this fixed and 3.12 removed.

-- 
Xenia

