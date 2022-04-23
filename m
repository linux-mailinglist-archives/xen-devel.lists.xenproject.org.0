Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA94350CBC0
	for <lists+xen-devel@lfdr.de>; Sat, 23 Apr 2022 17:25:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311684.528948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niHdh-0005uq-MQ; Sat, 23 Apr 2022 15:25:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311684.528948; Sat, 23 Apr 2022 15:25:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niHdh-0005s5-JM; Sat, 23 Apr 2022 15:25:37 +0000
Received: by outflank-mailman (input) for mailman id 311684;
 Sat, 23 Apr 2022 15:25:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hJIN=VB=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1niHdg-0005rz-8V
 for xen-devel@lists.xenproject.org; Sat, 23 Apr 2022 15:25:36 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e9705de-c319-11ec-a405-831a346695d4;
 Sat, 23 Apr 2022 17:25:35 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id t25so19097311lfg.7
 for <xen-devel@lists.xenproject.org>; Sat, 23 Apr 2022 08:25:34 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 w23-20020a197b17000000b0046d1729e7d9sm651824lfc.294.2022.04.23.08.25.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 08:25:33 -0700 (PDT)
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
X-Inumbo-ID: 9e9705de-c319-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=uPFaFyXz+EDuxvlVGUNcApp1IgYD33kJxyk7ho7JgsI=;
        b=qAX7YMz/JVxRQSD3fqnQXDX9zVCZWMtAGJZf1JQG6BC5yFq+jBJs0Bmw87DF2eoCmq
         eB2jJ/jLcplC0r+dgKvQHASQCXlpPx9qQUvjOIRwmext+2BEI0HSQFsH+wCaKaT+dSrx
         pM78v3UdfvFh6ZqEaYYirFC4NVvxB3UYNKeyJAuxTPBGueHYmNO1YXcqFHfXfqC5kFeK
         XCKNDjDTj1YGjwgrnHyOM3osVRjWrQAzoW4HO1CVCAsEzUy/NId/1IIJ6vn2OTwihsxL
         HbGqWv2cHnxee5QlZ8keGC34Wlv1JJF3pXORff0x5PdSPBVpKxUSGjq/0Pa0qxEffFfF
         oZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=uPFaFyXz+EDuxvlVGUNcApp1IgYD33kJxyk7ho7JgsI=;
        b=QZoY+9fTtVki2BSwCt7hIztxUEHaegFQcZCjeppvK88tdEi2RQb1dugbj+we6MsIO8
         ypG7PDE5GHFAIK4wBJr/jIbVddBYHDQ/JelcjxjPPjhZ/eUs/32xsGW20OW1Dt+UmEgI
         am6wb2zIKHmSpqwBUDz8al44UAH/+FPxESC6DhzsfK18j/7CSShDB2JjH/W3DHDdO1OS
         7hIrkNS7PU9SG23f5lqLv+rXyjEaCkvHoDMS5B9tMk2dgZcfgIrhyQgaNZfC/PIe8xqJ
         /LJX8k+sGnveZlL1SQrqYgWlxnkb7XzvB3YTsSxtfeid1BMr4zwX1dlcL/MUEJtSxfds
         NqKA==
X-Gm-Message-State: AOAM531snxMAcFMxVP/L/wWsaXjqkJc76P+TbTshZuBAJB/Bl88am0JU
	g11wyUdeLTkaAGj5V/MnwMs=
X-Google-Smtp-Source: ABdhPJwZNl8ZX/SsU1gM9f+mVYW4LB3X8j+kRC6d+voW45tPtkkQcLAFY9FBtTyQGpxCpCgIZRyrOQ==
X-Received: by 2002:a19:dc0f:0:b0:439:702c:d83b with SMTP id t15-20020a19dc0f000000b00439702cd83bmr6906996lfg.192.1650727534046;
        Sat, 23 Apr 2022 08:25:34 -0700 (PDT)
Subject: Re: [PATCH V1 3/6] xen/virtio: Add option to restrict memory access
 under Xen
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Julien Grall <julien@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Christoph Hellwig <hch@infradead.org>
References: <1650646263-22047-1-git-send-email-olekstysh@gmail.com>
 <1650646263-22047-4-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.22.394.2204221526221.915916@ubuntu-linux-20-04-desktop>
 <3de2852b-0a94-fd1d-2eb6-fd818f33fc88@gmail.com>
 <8acfaa93-50ce-8dd9-49c6-cc328bb37569@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <cfeec3e9-8a04-b2ae-56bf-153e4ff2d9c7@gmail.com>
Date: Sat, 23 Apr 2022 18:25:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8acfaa93-50ce-8dd9-49c6-cc328bb37569@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 23.04.22 12:10, Juergen Gross wrote:

Hello Juergen

> On 23.04.22 09:05, Oleksandr wrote:
>>
>> On 23.04.22 02:00, Stefano Stabellini wrote:
>>
>> Hello Stefano
>>
>>
>>> On Fri, 22 Apr 2022, Oleksandr Tyshchenko wrote:
>>>> From: Juergen Gross <jgross@suse.com>
>>>>
>>>> Introduce Xen grant DMA-mapping layer which contains special 
>>>> DMA-mapping
>>>> routines for providing grant references as DMA addresses to be used by
>>>> frontends (e.g. virtio) in Xen guests.
>>>>
>>>> In order to support virtio in Xen guests add a config option 
>>>> XEN_VIRTIO
>>>> enabling the user to specify whether in all Xen guests virtio should
>>>> be able to access memory via Xen grant mappings only on the host side.
>>>>
>>>> As this also requires providing 
>>>> arch_has_restricted_virtio_memory_access
>>>> implementation, switch from a pure stub to a real function on Arm
>>>> and combine with existing implementation for the SEV guests on x86.
>>>>
>>>> Add the needed functionality by providing a special set of DMA ops
>>>> handling the needed grant operations for the I/O pages.
>>>>
>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>> There are a couple of minor things that checkpatch.pl reports,
>>
>> Thank you for pointing this out, my fault.
>>
>>
>>>   but aside
>>> from those the patch looks fine to me.
>>
>> good
>>
>>
>> The attached diff to be squashed for the new version. One thing remains:
>>
>> checkpatch.pl says regarding drivers/xen/grant-dma-ops.c:
>>
>> WARNING: added, moved or deleted file(s), does MAINTAINERS need 
>> updating?
>> #151:
>> new file mode 100644
>>
>>
>> Which, I assume, this is not an issue as new file falls under XEN 
>> HYPERVISOR INTERFACE maintainership?
>
> Yes.


ok, thank you for the confirmation.


>
>
> Juergen

-- 
Regards,

Oleksandr Tyshchenko


