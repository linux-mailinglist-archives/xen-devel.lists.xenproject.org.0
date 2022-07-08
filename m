Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C049256B3C9
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 09:46:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363269.593758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9ih8-0005tx-2s; Fri, 08 Jul 2022 07:46:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363269.593758; Fri, 08 Jul 2022 07:46:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9ih7-0005s2-VU; Fri, 08 Jul 2022 07:46:33 +0000
Received: by outflank-mailman (input) for mailman id 363269;
 Fri, 08 Jul 2022 07:46:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/WbS=XN=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o9ih6-0005pn-1v
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 07:46:32 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14cde0df-fe92-11ec-924f-1f966e50362f;
 Fri, 08 Jul 2022 09:46:31 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id dn9so31043875ejc.7
 for <xen-devel@lists.xenproject.org>; Fri, 08 Jul 2022 00:46:31 -0700 (PDT)
Received: from [192.168.1.10] (adsl-142.37.6.26.tellas.gr. [37.6.26.142])
 by smtp.gmail.com with ESMTPSA id
 ba29-20020a0564021add00b00435a62d35b5sm29548359edb.45.2022.07.08.00.46.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 00:46:30 -0700 (PDT)
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
X-Inumbo-ID: 14cde0df-fe92-11ec-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ARRkIZ8oM6AY7XkmPNQ+UAJJsD+UxhJYrjou3qsB+Ew=;
        b=Tabu27DFSa1QTsTGieIl0R3OJWDfCoyk9JiJuW1HBM1TXdrKj7PnOPUpzd1YZ6qUsB
         wfl5Yi8AfmQaONlu49rXKp4Ro+7kcfj4llGztHCRYPLquT+F9dkKf9ItXDKCuX0NqLCD
         VIudk2QhqMKfb13Sqd2qn/zfqAxt8yRq/AUEsB5hc5thHyU/qIyYpxx78KiYkK8k4p0V
         HaUWx+mEch+HyM3PkqpNJNUSgSRdNm1EbCzl9Kt73YHo400Dz3fyrWzV2LNmjeZcwt1s
         SB7tOF8DU38YkXFpzmnz3J6MXgI2KcFqRjO1l+kPsoNUXwDMJ0xnQD37m9YZ4MGO00CR
         YRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ARRkIZ8oM6AY7XkmPNQ+UAJJsD+UxhJYrjou3qsB+Ew=;
        b=twxc4Oi79kdRm8Q1OV80YhEe6skvyRbvm5UeBUGfFDvtLIYZNkL9FRkeIkCXYCkUIg
         +6GKDiX+QaU5TKkX6Ja/VGIinPBH+QzpmHPd2WAO3VdLz//Y/F491UG3AFMK1P21AOG8
         kfosHN5aXpsDsMOleYcuFC/IU7OJLd5ZiJHWIBfO6UsQOcBxMNp6IyJTL2Xh9JBTrjEd
         mWk7RxXaMxUN7XW6afVofHSyXJy+l1ohTergEE/1+fO4nROAcQn4kqXtbU6dtOFKp+sA
         soyZ6xtQvkgO0FQ8qDW/Cmfs8yR+GKR3M6/LPVMwoqsnTv2iNrievsrTcYHyevjPOi5p
         eI4A==
X-Gm-Message-State: AJIora/jNqggyTtDL0lGO4A8q1lQFV04ds1Vm5Bmi9NefY4LaqFqZWbN
	wlUt7E0tmIZEHyWKqeB41n/0a9s7vEo=
X-Google-Smtp-Source: AGRyM1uHFjO57EYgHOGL6FuR37nYm/5085Cdai4oROdXsNhyY3LiT29ERwNSywa3mnZemVF2Bdusgg==
X-Received: by 2002:a17:906:9b8a:b0:722:e6e0:33d with SMTP id dd10-20020a1709069b8a00b00722e6e0033dmr2153998ejc.317.1657266390496;
        Fri, 08 Jul 2022 00:46:30 -0700 (PDT)
Message-ID: <bf3c4081-3133-dd53-b98d-b191942ec585@gmail.com>
Date: Fri, 8 Jul 2022 10:46:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/2] automation: arm64: Create a test job for testing
 static allocation on qemu
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
References: <20220707203803.798317-1-burzalodowa@gmail.com>
 <20220707203803.798317-3-burzalodowa@gmail.com>
 <259c9042-4a40-ddd3-5e3c-7a1698df74c4@xen.org>
 <alpine.DEB.2.22.394.2207071548220.2354836@ubuntu-linux-20-04-desktop>
 <2176a93e-5949-022e-d107-e42c859626ef@xen.org>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <2176a93e-5949-022e-d107-e42c859626ef@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 7/8/22 10:35, Julien Grall wrote:
> Hi,
> 
> On 08/07/2022 00:05, Stefano Stabellini wrote:
>> On Thu, 7 Jul 2022, Julien Grall wrote:
>>>> +# Run the test
>>>> +rm -f qemu-staticmem.serial
>>>> +set +e
>>>> +echo "  virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 
>>>> 0x40000000"| \
>>>> +timeout -k 1 60 ./binaries/qemu-system-aarch64 -nographic \
>>>> +    -M virtualization=true \
>>>> +    -M virt \
>>>> +    -M virt,gic-version=2 \
>>>> +    -cpu cortex-a57 \
>>>> +    -smp 2 \
>>>> +    -m 8G \
>>>> +    -no-reboot \
>>>> +    -device virtio-net-pci,netdev=vnet0 -netdev 
>>>> user,id=vnet0,tftp=binaries
>>>> \
>>>> +    -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin \
>>>> +    -dtb ./binaries/virt-gicv2.dtb \
>>>> +    |& tee qemu-staticmem.serial
>>>> +
>>>> +set -e
>>>
>>> A lot of the code above is duplicated from qemu-smoke-arm64.sh. I 
>>> think it
>>> would be better to consolidate in a single script. Looking briefly 
>>> throught
>>> the existing scripts, it looks like it is possible to pass arguments 
>>> (see
>>> qemu-smoke-x86-64.sh).
>> One idea would be to make the script common and "source" a second
>> script or config file with just the ImageBuilder configuration because
>> it looks like it is the only thing different.
> 
> This would mean creating a new bash script for every new test. This 
> sounds a bit pointless if the only difference is the ImageBuilder 
> configuration. Instead, it would be better to pass an argument to the 
> script (like qemu-smoke-x86-64.sh) indicating which test we are going to 
> perform.

I agree with Julien, also because the ImageBuilder script depends on how 
qemu is configured. It is not completely independent.

-- 
Xenia

