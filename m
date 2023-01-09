Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C766621B8
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 10:37:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473452.734065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEoaG-0002hz-Vr; Mon, 09 Jan 2023 09:36:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473452.734065; Mon, 09 Jan 2023 09:36:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEoaG-0002gI-Qy; Mon, 09 Jan 2023 09:36:48 +0000
Received: by outflank-mailman (input) for mailman id 473452;
 Mon, 09 Jan 2023 09:36:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bkgU=5G=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1pEoaF-0002gC-WA
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 09:36:48 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21ba2e36-9001-11ed-b8d0-410ff93cb8f0;
 Mon, 09 Jan 2023 10:36:45 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id fc4so18483436ejc.12
 for <xen-devel@lists.xenproject.org>; Mon, 09 Jan 2023 01:36:45 -0800 (PST)
Received: from [192.168.0.106] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a1709060c1100b0084d21db0691sm3499300ejf.179.2023.01.09.01.36.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 01:36:44 -0800 (PST)
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
X-Inumbo-ID: 21ba2e36-9001-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B/99t8qgIMvqhTeD4zkjN62XwwCpzj4U7vSzDxnnCDc=;
        b=Wr6wSX47NhAaHWDBxrRzP3g44XWLE7Sy4kLqNdnb4foosqDf+nLDomsCssY2zOOFog
         NXPtAcnszBjFC9BS097w7hd8JmxrV8iNjfl9n7AZGkrK3EgI5EYIZeDrPqokl4jqwOvc
         +j2Hxtw3xlpjURIxGkdnfvWzCUxvpQAY3PxkreiLVHXCL6UBUtGr9Iq20YUW0vici0NI
         kzgVzZC5tNRTd6takvgAt90yusSH2cV89CQeoEPCx6XWQmBls8ewonRT1cpYKsOCV8ej
         Jdknn++muHOcvJZCFsNHJM73JecI5DumceEo8ZZN/duRaVt0CSnb5FAVWarGefsUczRr
         gYFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B/99t8qgIMvqhTeD4zkjN62XwwCpzj4U7vSzDxnnCDc=;
        b=5wOiGOX/p5ztpHw+s1ivzWaOE0TV1qCnYu94RaEdRzGs++ZPwJk/Y6fwfVloZmv/kI
         pdMPmxQHOFmv8h5Wyrzgp7ThZbETIswKgLkAOvFY7oVO2UrzOfFLOBr0L3xDeHQ2W77M
         5ITsJ4dIYUNxm97SYTeoCSvfa3EjtN0Hczv5xcLn0TzXluZvnWQ9s/Iwl6Z1ImBE1zMl
         ZoJ8E3IgFwhfFb6LVBN6qrQar2n/KaWQEeShMKpQftqHA/eF2zCPPymCmK62KlO0s3Pl
         O/mzADqTQxLWlIsfmaCb9HkZhTcCAID9+9cvkMULG8dn88E4U2HiWtdwdiaw45wvJF/I
         E0CQ==
X-Gm-Message-State: AFqh2krKytZ1t6L6TiPADzw4zfQgNFIoohBivaRurIT1mbxcJfy3yrm0
	m/r539nZv+PMOphfEY0jSL0=
X-Google-Smtp-Source: AMrXdXs0p4wKdR5+FK+UzVIUwLWzUEefxJdL4gN93AyqKDIsqVQkT7sg4nqObI5zLUjwfACLEYyPJw==
X-Received: by 2002:a17:906:1583:b0:83f:384f:ea23 with SMTP id k3-20020a170906158300b0083f384fea23mr51928606ejd.57.1673257004921;
        Mon, 09 Jan 2023 01:36:44 -0800 (PST)
Message-ID: <20b15211-492b-713e-288c-14bd5e137ed7@gmail.com>
Date: Mon, 9 Jan 2023 11:36:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [XEN v4] xen/arm: Probe the load/entry point address of an uImage
 correctly
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org, Dmytro_Firsov@epam.com
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, michal.orzel@amd.com,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
References: <20221221185300.5309-1-ayan.kumar.halder@amd.com>
 <e26768b7-99f7-f4e4-6ae5-094d17e1594a@xen.org>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <e26768b7-99f7-f4e4-6ae5-094d17e1594a@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 08.01.23 18:06, Julien Grall wrote:

Hello Julien, Ayan, all

> Hi Ayan,
> 
> On 21/12/2022 18:53, Ayan Kumar Halder wrote:
>> Currently, kernel_uimage_probe() does not read the load/entry point 
>> address
>> set in the uImge header. Thus, info->zimage.start is 0 (default 
>> value). This
>> causes, kernel_zimage_place() to treat the binary (contained within 
>> uImage)
>> as position independent executable. Thus, it loads it at an incorrect
>> address.
>>
>> The correct approach would be to read "uimage.load" and set
>> info->zimage.start. This will ensure that the binary is loaded at the
>> correct address. Also, read "uimage.ep" and set info->entry (ie kernel 
>> entry
>> address).
>>
>> If user provides load address (ie "uimage.load") as 0x0, then the 
>> image is
>> treated as position independent executable. Xen can load such an image at
>> any address it considers appropriate. A position independent executable
>> cannot have a fixed entry point address.
>>
>> This behavior is applicable for both arm32 and arm64 platforms.
>>
>> Earlier for arm32 and arm64 platforms, Xen was ignoring the load and 
>> entry
>> point address set in the uImage header. With this commit, Xen will use 
>> them.
>> This makes the behavior of Xen consistent with uboot for uimage headers.
> 
> The changes look good to me (with a few of comments below). That said, 
> before acking the code, I would like an existing user of uImage (maybe 
> EPAM or Arm?) to confirm they are happy with the change.


I have just re-checked current patch in our typical Xen based 
environment (no dom0less, Linux in Dom0) and didn't notice issues with 
it. But we use zImage for Dom0's kernel, so kernel_uimage_probe() is not 
called.



I CCed Dmytro Firsov who is playing with Zephyr in Dom0 and *might* use 
uImage.


[snip]

