Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD8E582A88
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 18:18:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376331.609025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGjjD-00031T-9V; Wed, 27 Jul 2022 16:17:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376331.609025; Wed, 27 Jul 2022 16:17:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGjjD-0002z0-6o; Wed, 27 Jul 2022 16:17:43 +0000
Received: by outflank-mailman (input) for mailman id 376331;
 Wed, 27 Jul 2022 16:17:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0cJb=YA=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oGjjB-0002ye-QM
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 16:17:41 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a305c374-0dc7-11ed-924f-1f966e50362f;
 Wed, 27 Jul 2022 18:17:40 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id u20so12571541ljk.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 Jul 2022 09:17:40 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 q10-20020a19f20a000000b00489dd78bdacsm3850979lfh.299.2022.07.27.09.17.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 09:17:37 -0700 (PDT)
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
X-Inumbo-ID: a305c374-0dc7-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=A1/uiDtrnUdSsuTb9m5A95mVj7LtpZz99YG5vTx9pKg=;
        b=AE9NGzJrkd1O5AzNkANK+bf7gjL/XNcgxVcISxvT7KwKGYiv4kpWZ2ULy7sOnn0aew
         DsBmthvEjK9FwzAWoTaAbYeVjmrVmc3BfsEgcvA+jlWMrPh2ijaqPGKi0CFVgkKKzDb8
         IPlMr3LgutK3iUbu9N1w267dI4F0bI47Sjid68UYqTaa0lTmuKAaB7I/RHTvMvCnI9+S
         iTe/Y1WK7qNP+J/pOuzmGI6rl7XW6pBvNNgCsHJvRWeB8pEJY96nXOmeB157stOQoYD/
         DVlL6miWikCqZG5uoKpY7E7yrEk0lu5u0E466L7+7UbPjomTIu7cjrikrxS0tRRgzCJc
         9rvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=A1/uiDtrnUdSsuTb9m5A95mVj7LtpZz99YG5vTx9pKg=;
        b=uySiVDuZ94KnQQeP+TgUJgoald7k4U57zaLiSnVZZyrfYxf5i8QTY0LdP+xGTjlw1g
         6uKJRM4ayxqFjuTOAHkH84ZeoWlRs1Q6Ab19VUQcJvKGGsdyN8wQHsHV7nL7RyC6FzsR
         fiYGlpch6bzcxn9XiRYXvxcLAPnonjV4I3o6l5B0iHZxt3HclJL2lACQ0qk+MnHoIdMn
         rJwhLgsaPe9BiZDvvXaz+HL1qKl2UnrLujOgxwIRF7WE/Idj8lnYUqDCWZtfU5sWM5Xi
         o+2pQM2cJiix+aGFmCIEg8fakvHzVYs01gS9mRJaIIjdvsDkBhqM3hU8A1QVB5tiyVAQ
         tw0Q==
X-Gm-Message-State: AJIora/5B1ejB5X5UTnLzNvM6Oss0uRIbKoCd7ortHufAHGLPiDGZFYR
	K6t4SSqufXwxyFBTDgRkGr75S3uvOTSma1n7
X-Google-Smtp-Source: AGRyM1senhLAUo75mOvUnRK2V9Rfha2mEQ6N8BPuM6ywhbbI5/74u28L5MBEGwwCk6c4Wlsu4Kvh6A==
X-Received: by 2002:a2e:84ca:0:b0:25d:77e0:2566 with SMTP id q10-20020a2e84ca000000b0025d77e02566mr8271642ljh.78.1658938658386;
        Wed, 27 Jul 2022 09:17:38 -0700 (PDT)
Message-ID: <25d96933-5582-ff1e-f685-d48b5380d531@gmail.com>
Date: Wed, 27 Jul 2022 19:17:36 +0300
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
From: Oleksandr <olekstysh@gmail.com>
In-Reply-To: <dfc1adb6-82ac-5afc-0d4d-4514548314e1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 27.07.22 13:15, Jan Beulich wrote:

Hello Jan

> On 19.07.2022 19:42, Oleksandr Tyshchenko wrote:
>> @@ -527,6 +592,17 @@ static int cf_check init_bars(struct pci_dev *pdev)
>>           if ( (val & PCI_BASE_ADDRESS_SPACE) == PCI_BASE_ADDRESS_SPACE_IO )
>>           {
>>               bars[i].type = VPCI_BAR_IO;
>> +
>> +#ifndef CONFIG_X86
>> +            if ( !is_hwdom )
>> +            {
>> +                rc = vpci_add_register(pdev->vpci, empty_bar_read, NULL,
>> +                                       reg, 4, &bars[i]);
>> +                if ( rc )
>> +                    goto fail;
>> +            }
>> +#endif
> Since long term this can't be correct, it wants a TODO comment put next
> to it.


Looking into the previous versions of this patch (up to V3) I failed to 
find any changes in current version which hadn't been discussed (and 
agreed in some form).

Could you please clarify what exactly can't be correct the long term, 
for me to put the proper TODO here. Do you perhaps mean that TODO needs 
to explain why we have to diverge?


>
>> @@ -553,34 +635,47 @@ static int cf_check init_bars(struct pci_dev *pdev)
>>           bars[i].size = size;
>>           bars[i].prefetchable = val & PCI_BASE_ADDRESS_MEM_PREFETCH;
>>   
>> -        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg, 4,
>> -                               &bars[i]);
>> +        rc = vpci_add_register(pdev->vpci,
>> +                               is_hwdom ? vpci_hw_read32 : guest_bar_read,
>> +                               is_hwdom ? bar_write : guest_bar_write,
>> +                               reg, 4, &bars[i]);
>>           if ( rc )
>> -        {
>> -            pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
>> -            return rc;
>> -        }
>> +            goto fail;
>>       }
>>   
>> -    /* Check expansion ROM. */
>> -    rc = pci_size_mem_bar(pdev->sbdf, rom_reg, &addr, &size, PCI_BAR_ROM);
>> -    if ( rc > 0 && size )
>> +    /* Check expansion ROM: we do not handle ROM for guests. */
>> +    if ( is_hwdom )
> This again can't be right long-term. Personally I'd prefer if the code
> was (largely) left as is, with adjustments (with suitable TODO comments)
> made on a much smaller scope only.


I can revive a comment that Oleksandr Andrushchenko provided for earlier 
version by transforming into TODO:


ROM BAR is only handled for the hardware domain and for guest domains
there is a stub: at the moment PCI expansion ROM handling is supported
for x86 only and it might not be used by other architectures without
emulating x86. Other use-cases may include using that expansion ROM before
Xen boots, hence no emulation is needed in Xen itself. Or when a guest
wants to use the ROM code which seems to be rare.



>   But I'm not the maintainer of this
> code - Roger may have a different view on this.


Well, let's wait for Roger's input here.


>
> Jan

-- 
Regards,

Oleksandr Tyshchenko


