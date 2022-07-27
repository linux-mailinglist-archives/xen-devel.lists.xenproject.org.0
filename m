Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18945582FDE
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 19:31:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376400.609139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGks8-0000UM-5I; Wed, 27 Jul 2022 17:31:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376400.609139; Wed, 27 Jul 2022 17:31:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGks8-0000RT-2H; Wed, 27 Jul 2022 17:31:00 +0000
Received: by outflank-mailman (input) for mailman id 376400;
 Wed, 27 Jul 2022 17:30:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0cJb=YA=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oGks6-0000RN-DF
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 17:30:58 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfcd726c-0dd1-11ed-bd2d-47488cf2e6aa;
 Wed, 27 Jul 2022 19:30:57 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id e11so20592895ljl.4
 for <xen-devel@lists.xenproject.org>; Wed, 27 Jul 2022 10:30:57 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a05651c10a600b0025dd5b3fabesm3889541ljn.102.2022.07.27.10.30.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 10:30:56 -0700 (PDT)
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
X-Inumbo-ID: dfcd726c-0dd1-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=zjfjI1qOAot5uSZpRbjgv22gTCd0jDySVkMsyPMiU0k=;
        b=lYykyt7oEGtZAkPJXwWKoxcUUaBf9jN6Uc6qvIg8LUPv1K4adfqgJ05Qm4XQoiEUTh
         udcMS7bKzmgl7lFZ82APMhBrHzD4M2zzZ8af4idoaY60ozHuti/tZe5hAwjolFlWw8Tc
         2+X1DYJiz6+ySBMGBEpJFAqZYjSHCtGGbqPCx0hBY+6qEb/2NUtnmwlIljCvRONczafd
         PQYs6xzBucZJ+tyBArfdySHxkHaqfO+1bUwm8UC94ogfjCzwQHMWf+lg7a3SjJ2HHYmw
         eHzeuXbBuAGBt/QSnCF7f8BFcrayjFhqUG97kkiyBVXX1FrdO4QXWENQ66H4U7aMaH/W
         9UlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=zjfjI1qOAot5uSZpRbjgv22gTCd0jDySVkMsyPMiU0k=;
        b=zyk2/V3KzKamGwzR1PNZQBnrC7VDsJ0GR3l5NLp+EHL8DLgh+hDZOuba7nftMztgae
         PtGSt3OlIbaDXiopigqYrhqulBk0gwkRdis1Zg1eHkLz1uaJ0rJ3wNA9oDfR8akW9Rqu
         qW/gZtP9Nlz8C7DCPiZKjo7w6K0EuviQpD6DPne1Yf7MQOgC+ciLRy9t7HXCPPo7PJHa
         hVN0d/qpcRKaMqMUwVuKTy4DG540YClydRnKedy2eaW9w6BSUx1zZHc6IXTYhn9ygSPg
         DGpR68PenGUwkf+nhtUngxCPp68tsxnfd0mGvfY3rNjlugyncWIcrLhww+QgKdHhVDIL
         sG+w==
X-Gm-Message-State: AJIora+lqLyHUrwYIOlIR5vwaTKV+BhjcYsGXm9BoCiC2aiwjMNDspNE
	RH3m+3OZIWPlSjCUFXtZbPI=
X-Google-Smtp-Source: AGRyM1u7vpeIEM6smt9OW6QpOYV5TJhbyYdRQ6x+O9VPk9VsGynVqN77BRh9zs4ffzSo+Aty2rkXoQ==
X-Received: by 2002:a05:651c:981:b0:253:b87e:ba6c with SMTP id b1-20020a05651c098100b00253b87eba6cmr8063323ljq.530.1658943056989;
        Wed, 27 Jul 2022 10:30:56 -0700 (PDT)
Message-ID: <fba54c4b-e82d-cf27-256a-e4c61dc025cd@gmail.com>
Date: Wed, 27 Jul 2022 20:30:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V7 07/11] vpci/header: emulate PCI_COMMAND register for
 guests
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220719174253.541965-1-olekstysh@gmail.com>
 <20220719174253.541965-8-olekstysh@gmail.com>
 <9f2bd47d-cd48-f544-4e8d-a8a698470889@suse.com>
From: Oleksandr <olekstysh@gmail.com>
In-Reply-To: <9f2bd47d-cd48-f544-4e8d-a8a698470889@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 26.07.22 18:30, Jan Beulich wrote:

Hello Jan

> On 19.07.2022 19:42, Oleksandr Tyshchenko wrote:
>> --- a/xen/drivers/vpci/header.c
>> +++ b/xen/drivers/vpci/header.c
>> @@ -443,11 +443,27 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>>       return 0;
>>   }
>>   
>> +/* TODO: Add proper emulation for all bits of the command register. */
>>   static void cf_check cmd_write(
>>       const struct pci_dev *pdev, unsigned int reg, uint32_t cmd, void *data)
>>   {
>>       uint16_t current_cmd = pci_conf_read16(pdev->sbdf, reg);
>>   
>> +    if ( !is_hardware_domain(pdev->domain) )
>> +    {
>> +        struct vpci_header *header = data;
>> +
>> +        header->guest_cmd = cmd;
>> +#ifdef CONFIG_HAS_PCI_MSI
>> +        if ( pdev->vpci->msi->enabled || pdev->vpci->msix->enabled )
>> +            /*
>> +             * Guest wants to enable INTx, but it can't be enabled
>> +             * if MSI/MSI-X enabled.
>> +             */
>> +            cmd |= PCI_COMMAND_INTX_DISABLE;
>> +#endif
>> +    }
>> +
>>       /*
>>        * Let Dom0 play with all the bits directly except for the memory
>>        * decoding one.
>> @@ -464,6 +480,19 @@ static void cf_check cmd_write(
>>           pci_conf_write16(pdev->sbdf, reg, cmd);
>>   }
>>   
>> +static uint32_t cf_check cmd_read(
>> +    const struct pci_dev *pdev, unsigned int reg, void *data)
>> +{
>> +    if ( !is_hardware_domain(pdev->domain) )
>> +    {
>> +        struct vpci_header *header = data;
>> +
>> +        return header->guest_cmd;
>> +    }
>> +
>> +    return pci_conf_read16(pdev->sbdf, reg);
>> +}
> This function wants the same leading comment as cmd_write().

ok


>   I also
> think you better wouldn't give the guest the impression that r/o bits
> can actually be written to (but getting this right may well fall
> under the TODO).

ok


>
> Jan

-- 
Regards,

Oleksandr Tyshchenko


