Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 969E13BC244
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 19:27:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150561.278371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0SMn-0003sk-Ip; Mon, 05 Jul 2021 17:26:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150561.278371; Mon, 05 Jul 2021 17:26:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0SMn-0003qd-F6; Mon, 05 Jul 2021 17:26:45 +0000
Received: by outflank-mailman (input) for mailman id 150561;
 Mon, 05 Jul 2021 17:26:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SjzX=L5=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1m0SMl-0003ps-CZ
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 17:26:43 +0000
Received: from mail-lf1-x12a.google.com (unknown [2a00:1450:4864:20::12a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f2e1ffc-5ace-4d59-96f2-4531e3f29c86;
 Mon, 05 Jul 2021 17:26:42 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id a18so33585615lfs.10
 for <xen-devel@lists.xenproject.org>; Mon, 05 Jul 2021 10:26:42 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id b13sm1143729lfo.104.2021.07.05.10.26.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 10:26:40 -0700 (PDT)
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
X-Inumbo-ID: 5f2e1ffc-5ace-4d59-96f2-4531e3f29c86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=30pHL+0bsWVhDKjKuKXQtWBdB5MCQSS442KAY8eU9k8=;
        b=S3XELwdSwBe0ZEeLLizZz9u9gMYx9q9DPKgGtgNOG+ydPzPDxmGjm7iLmgjleUIm3d
         1CYPAPqnwEJY+Qpm1cnxrHUSkItl4WBHVdpXuW+r8n5NeAlUujl3NqKnqg3eqiDPp2/O
         1MfFRUOb28TWCFpvvCFPL0ZKz2sirIjRALNLiP0FJR34Jwp6nxBtuLmkI336Y2UvtAn4
         gu504J/SF0fHiUhOQN0/B4DAtM5vfuS3ORd95zW881rPSFH2mFY0kV5oNoFoesjAikdv
         vNEc1i6OhXu6jfY2hQ4ayPDq8fC7kfSTFtw+mpkyMOml/0CJg34Zy5crx2yNWwL1hMNr
         IS4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=30pHL+0bsWVhDKjKuKXQtWBdB5MCQSS442KAY8eU9k8=;
        b=dt24brq/NCweq1NygL70ZNGaYvBviVc86eIWqgJLTgYzoOQREl0nJd0ywoteX37G6I
         MXZyVh3akLpQAj+oC72o401AXgVr6XLbXEVwz33W4g2oTB+a+SCyXBoe0+Inb4G/i/LM
         ZISrWBQ9cG3/a+Ltp5L+Fv6VLoHHXszMW+DV4ngUzCAZUc94OWu7oLgAT++xoI5Ig0tS
         pnTa14KVuh6Ft0KaJM1y5WLHNrQHeDGtd9vvoDKs3DcCgvOg6YQxR4BGQJqU8JQqanfC
         KKxbFqCgZgx3fkyoOUoyRloYP5ZRMcum2y65BFyABwo1tgo6/NST43pKv622VG4ucSHK
         ghcQ==
X-Gm-Message-State: AOAM531ZPzV1XNhi9sy0i6dkv0dqCVvmeaRESPqb6QVNfzSVP7VZhwVb
	BsVv3o0e0CMUn/JB8Xs8jCU=
X-Google-Smtp-Source: ABdhPJyMN06TuL1GS7sqrs+SclXfuNnKvAc4ih3mLWE3CDAqh+l0biduwjPqvko8VtsX486RNr6mNA==
X-Received: by 2002:ac2:5986:: with SMTP id w6mr11190537lfn.392.1625506001276;
        Mon, 05 Jul 2021 10:26:41 -0700 (PDT)
Subject: Re: [PATCH] xen/arm: bootfdt: Always sort memory banks
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1623699267-9475-1-git-send-email-olekstysh@gmail.com>
 <47cbf077-8681-7ac4-04e2-f31e1fa4c04f@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <fb1526f2-d377-771f-7824-817891d883be@gmail.com>
Date: Mon, 5 Jul 2021 20:26:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <47cbf077-8681-7ac4-04e2-f31e1fa4c04f@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 30.06.21 11:56, Julien Grall wrote:
> Hi Oleksandr,

Hi Julien


Sorry for the late response.


>
> On 14/06/2021 20:34, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> At the moment, Xen expects the memory banks to be ordered.
>> Unfortunately, there may be a case when updated by firmware
>> device tree contains unordered banks. This means Xen will panic
>> when setting xenheap mappings for the subsequent bank with start
>> address being less than xenheap_mfn_start (start address of
>> the first bank).
>
> Please clarify in the commit message that the behavior you are 
> describing is for arm64. For arm32, there is only one heap region.
>
> That said, I think the sorting is fine to be done in common code.

ok


>
>
>>
>> As there is no clear requirment regarding ordering in the device
>
> s/requirment/requirement/

ok


>
>> tree, update code to be able to deal with by sorting memory
>> banks if we have more than one.
>>
>> Suggested-by: Julien Grall <jgrall@amazon.com>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>>
>> The proposed commit fixes the booting Xen on R-Car M3-W+ SoC:
>>
>> Starting kernel ...
>> - UART enabled -
>> - Boot CPU booting -
>> - Current EL 00000008 -
>> - Initialize CPU -
>> - Turning on paging -
>> - Zero BSS -
>> - Ready -
>> (XEN) Checking for initrd in /chosen
>> (XEN) Initrd 0000000084000040-0000000085dbc32a
>> (XEN) RAM: 0000000480000000 - 00000004ffffffff
>> (XEN) RAM: 0000000048000000 - 00000000bfffffff
>> (XEN) RAM: 0000000600000000 - 00000006ffffffff
>>
>> ...
>>
>> (XEN) ****************************************
>> (XEN) Panic on CPU 0:
>> (XEN) cannot add xenheap mapping at 48000 below heap start 480000
>> (XEN) ****************************************
>> (XEN)
>> (XEN) Reboot in five seconds...
>> ---
>>   xen/arch/arm/bootfdt.c | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>
>> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
>> index dcff512..3ef63b3 100644
>> --- a/xen/arch/arm/bootfdt.c
>> +++ b/xen/arch/arm/bootfdt.c
>> @@ -13,6 +13,7 @@
>>   #include <xen/init.h>
>>   #include <xen/device_tree.h>
>>   #include <xen/libfdt/libfdt.h>
>> +#include <xen/sort.h>
>>   #include <xsm/xsm.h>
>>   #include <asm/setup.h>
>>   @@ -395,6 +396,21 @@ static void __init early_print_info(void)
>>       printk("\n");
>>   }
>>   +/* This function assumes that memory regions are not overlapped */
>> +static int __init cmp_memory_node(const void *key, const void *elem)
>> +{
>> +    const struct membank *handler0 = key;
>> +    const struct membank *handler1 = elem;
>> +
>> +    if ( handler0->start < handler1->start )
>> +        return -1;
>> +
>> +    if ( handler0->start >= (handler1->start + handler1->size) )
>> +        return 1;
>> +
>> +    return 0;
>> +}
>> +
>>   /**
>>    * boot_fdt_info - initialize bootinfo from a DTB
>>    * @fdt: flattened device tree binary
>> @@ -412,6 +428,12 @@ size_t __init boot_fdt_info(const void *fdt, 
>> paddr_t paddr)
>>       add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);
>>         device_tree_for_each_node((void *)fdt, 0, early_scan_node, 
>> NULL);
>> +    if ( bootinfo.mem.nr_banks > 1 )
>
> NIT: sort() is already be able to deal with one element array. So this 
> checks looks a bit pointless.

Agree, will drop.


>
>
>> +    {
>> +        /* Some DT may describe unordered banks, sort them in 
>> ascending order */
>
> It would be good to explain in the comment *why* this is necessary. 
> Some along the line:
>
> On Arm64, setup_xenheap_pages() expects to be called with the lowest 
> bank in memory first. There is no requirement that the DT will provide 
> the banks sorted in ascending order. So sort them through.

ok


>
>
>> +        sort(bootinfo.mem.bank, bootinfo.mem.nr_banks, sizeof(struct 
>> membank),
>> +             cmp_memory_node, NULL);
>> +    }
>>       early_print_info();
>>         return fdt_totalsize(fdt);
>>
>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


