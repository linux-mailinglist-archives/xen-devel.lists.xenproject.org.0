Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D247F584266
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 16:57:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376891.609939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH4wT-00024S-4h; Thu, 28 Jul 2022 14:56:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376891.609939; Thu, 28 Jul 2022 14:56:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH4wT-00021f-1x; Thu, 28 Jul 2022 14:56:49 +0000
Received: by outflank-mailman (input) for mailman id 376891;
 Thu, 28 Jul 2022 14:56:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B2Bu=YB=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oH4wR-00021Z-L3
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 14:56:47 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 805e992b-0e85-11ed-bd2d-47488cf2e6aa;
 Thu, 28 Jul 2022 16:56:46 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id t1so3211478lft.8
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jul 2022 07:56:46 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 u13-20020ac258cd000000b00489f0c8bddesm231487lfo.207.2022.07.28.07.56.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 07:56:45 -0700 (PDT)
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
X-Inumbo-ID: 805e992b-0e85-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=aukZP7fIYEgRcNgQauT0c9Fws8Q4PpqsdZsgdLKxqdI=;
        b=p0dpGsyJfHJgJQcWgPZ4/jOCo/m9pB2Qa7AhY2yTiZ6eeAyVczlLL96AL1+lgOTG5o
         vbIo1mtG9erExx5xTrC25nEy7doWOnH7b7SQ0a5JqIZrYUQYpwL/C7T87hpW+0aGGkD2
         VG5OzaACprRjtKdSpgzXMbxQLzA1IRoryPRXXMdUB/kVqqgmLaojTV4MqoCc1dPtHGFF
         fX1aPrrrZ3V4SZqFX1i+mvJ2wqtq5YIkElUDri8YIXeHulUnxEz0yMnxOH3SoLBw+p+x
         cUzC6y6cQ3KQU+phGXGS8oR+h9HHSkghRWSkewVujg/++RzpcWDzlbZXDsvE6ZWLX/W8
         UMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=aukZP7fIYEgRcNgQauT0c9Fws8Q4PpqsdZsgdLKxqdI=;
        b=a1x9yGjCzJdzACJtw1wMZ/GfjxMymk3jbXue4qaNTv5Aefx/R2HVoVz862mFLPcxHv
         OrYRmL9nidY0nGJjhyqRw7vbckdvqz8Q51IYTSCt3OegX6tymoq6Qw5VI+cSc1MSzVhn
         /qNS/ll3e0vE3YcjrMyeCkJ8GLGGU++y8qEUbGeLDLCWpnZAUOIDKfOmmlaf/S62N8yy
         /r+WIFp4MJmTzfTybqohvbuNSFx4n1NmnBAwifpYhppW2knL9Zl9hYai2NxHFNmucTta
         1chj8y/Rmh2TrLJzkkb7ewFRa68GQqIxfizkHr5OYwvJcfcqdTqG//rgM7jNZJtlA7nB
         pKQQ==
X-Gm-Message-State: AJIora+pT4YqqhFm1/S0w4R3TE9uPsvjPu+J201seZUePrR2xySBWPYN
	dRBV1ENicBNfQLV71Jt0gqU=
X-Google-Smtp-Source: AGRyM1tq1Iizw2ysuZFEUUnG4A26/4b5TR/GA5uOcfZsK6KObj3Qu8/0N2JnaRC/hPz0qmjiMu31DA==
X-Received: by 2002:a05:6512:2141:b0:48a:772b:bf86 with SMTP id s1-20020a056512214100b0048a772bbf86mr9954494lfr.178.1659020206115;
        Thu, 28 Jul 2022 07:56:46 -0700 (PDT)
Message-ID: <00968e58-8e52-dc5f-f5fc-09274d8f4ec3@gmail.com>
Date: Thu, 28 Jul 2022 17:56:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V7 03/11] vpci/header: implement guest BAR register
 handlers
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220719174253.541965-1-olekstysh@gmail.com>
 <20220719174253.541965-4-olekstysh@gmail.com>
 <dfc1adb6-82ac-5afc-0d4d-4514548314e1@suse.com>
 <25d96933-5582-ff1e-f685-d48b5380d531@gmail.com>
 <a43ac496-3296-93d4-f1ed-5fd4acfe9ac6@suse.com>
From: Oleksandr <olekstysh@gmail.com>
In-Reply-To: <a43ac496-3296-93d4-f1ed-5fd4acfe9ac6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 28.07.22 10:01, Jan Beulich wrote:

Hello Jan


> On 27.07.2022 18:17, Oleksandr wrote:
>> On 27.07.22 13:15, Jan Beulich wrote:
>>> On 19.07.2022 19:42, Oleksandr Tyshchenko wrote:
>>>> @@ -527,6 +592,17 @@ static int cf_check init_bars(struct pci_dev *pdev)
>>>>            if ( (val & PCI_BASE_ADDRESS_SPACE) == PCI_BASE_ADDRESS_SPACE_IO )
>>>>            {
>>>>                bars[i].type = VPCI_BAR_IO;
>>>> +
>>>> +#ifndef CONFIG_X86
>>>> +            if ( !is_hwdom )
>>>> +            {
>>>> +                rc = vpci_add_register(pdev->vpci, empty_bar_read, NULL,
>>>> +                                       reg, 4, &bars[i]);
>>>> +                if ( rc )
>>>> +                    goto fail;
>>>> +            }
>>>> +#endif
>>> Since long term this can't be correct, it wants a TODO comment put next
>>> to it.
>>
>> Looking into the previous versions of this patch (up to V3) I failed to
>> find any changes in current version which hadn't been discussed (and
>> agreed in some form).
>>
>> Could you please clarify what exactly can't be correct the long term,
>> for me to put the proper TODO here. Do you perhaps mean that TODO needs
>> to explain why we have to diverge?
> If a device has I/O port ranges, then that's typically for a reason.
> Drivers (in the guest) may therefore want to use those ranges to
> communicate with the device. Imagine in particular a device without
> any MMIO BARs, and with only I/O port one(s).
>
>>>> @@ -553,34 +635,47 @@ static int cf_check init_bars(struct pci_dev *pdev)
>>>>            bars[i].size = size;
>>>>            bars[i].prefetchable = val & PCI_BASE_ADDRESS_MEM_PREFETCH;
>>>>    
>>>> -        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg, 4,
>>>> -                               &bars[i]);
>>>> +        rc = vpci_add_register(pdev->vpci,
>>>> +                               is_hwdom ? vpci_hw_read32 : guest_bar_read,
>>>> +                               is_hwdom ? bar_write : guest_bar_write,
>>>> +                               reg, 4, &bars[i]);
>>>>            if ( rc )
>>>> -        {
>>>> -            pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
>>>> -            return rc;
>>>> -        }
>>>> +            goto fail;
>>>>        }
>>>>    
>>>> -    /* Check expansion ROM. */
>>>> -    rc = pci_size_mem_bar(pdev->sbdf, rom_reg, &addr, &size, PCI_BAR_ROM);
>>>> -    if ( rc > 0 && size )
>>>> +    /* Check expansion ROM: we do not handle ROM for guests. */
>>>> +    if ( is_hwdom )
>>> This again can't be right long-term. Personally I'd prefer if the code
>>> was (largely) left as is, with adjustments (with suitable TODO comments)
>>> made on a much smaller scope only.
>>
>> I can revive a comment that Oleksandr Andrushchenko provided for earlier
>> version by transforming into TODO:
>>
>>
>> ROM BAR is only handled for the hardware domain and for guest domains
>> there is a stub: at the moment PCI expansion ROM handling is supported
>> for x86 only and it might not be used by other architectures without
>> emulating x86. Other use-cases may include using that expansion ROM before
>> Xen boots, hence no emulation is needed in Xen itself. Or when a guest
>> wants to use the ROM code which seems to be rare.
> ROMs can contain other than x86 code. While reportedly mostly dead, EFI
> bytecode was an example of an abstraction layer supporting arbitrary
> architectures. Therefore a comment along these lines would be okay, but
> personally I'd prefer it to be less verbose - along the lines of the
> one to be supplied for the I/O port restriction.


Thanks for the clarification. I will add two TODOs.



>
> Jan

-- 
Regards,

Oleksandr Tyshchenko


