Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 668125840E1
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 16:17:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376828.609853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH4Jo-0001rL-G2; Thu, 28 Jul 2022 14:16:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376828.609853; Thu, 28 Jul 2022 14:16:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH4Jo-0001oa-Cq; Thu, 28 Jul 2022 14:16:52 +0000
Received: by outflank-mailman (input) for mailman id 376828;
 Thu, 28 Jul 2022 14:16:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B2Bu=YB=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oH4Jm-0001oU-MY
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 14:16:50 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea939c6d-0e7f-11ed-924f-1f966e50362f;
 Thu, 28 Jul 2022 16:16:48 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id y11so3056240lfs.6
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jul 2022 07:16:47 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 s20-20020a056512315400b0048905c6103csm223997lfi.9.2022.07.28.07.16.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 07:16:46 -0700 (PDT)
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
X-Inumbo-ID: ea939c6d-0e7f-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=uLGV/ivQm/gN1RxftsIYR5A5kG96FtC2aToVdlXspR4=;
        b=XlM/vPczUoIC6bLr/ZY2UIogJ0oKcJkERvKMaTy2lT+uH4P0oU7fcMM2Dq0/CdKMMT
         6K4ApZ/h+6nqEOpwaquZ1k5ymzDmv5beOGvLoeoY1i4gidoTiD07UtlJkxcJBiu9WUaP
         D4xKBHZNJwlykr4nqCBIUI3e1ZKWdwohu7oG+69KdiX7MIPEWP7Q5p17rLo1bGpQisew
         cm8dLpVufHnS8SEtDI6PyJzPQhc+75cHMHolFr69W+4W+ZGVFxkjjMo38HRq2AHrzfHB
         YSfUoQEgs0gttlsWPdwswdPd+jlGPfPSt0eEChKNRX+UxfmoDu4+Swyfsm07fsIoBpT2
         jYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=uLGV/ivQm/gN1RxftsIYR5A5kG96FtC2aToVdlXspR4=;
        b=0G1qbqa4vSTdNL2MR9thKGA6TzMyaV9V4v/RbRra0UPl6+Hm+5SfbCb7e2kCS4jQM+
         1iKp0BDm89qr9NnWLNr2ztI86xrdwAAdth+DCCUT/ogwlUvdEc4GBJOM/dxGDSs4IrCw
         FTLDL2GPj1eJQBEBYqj+KcWNeiyFWEfX9VQ4ENQwoKbcixVUD0O6a5fnmmMpJSfFmV01
         wgZRuy9lgFsRqalINQz93yDOUXG5VgIBSOWozXaT5wMw91LXKr4z6S9vbCn2A4Jq9JPO
         HrFXO0t6lJ9hC5AA57a9Mxq4n0C4bb0k5/Emm0rQPxKuwzuQsRRgCDVkHfoT1m8xjwsY
         RCvA==
X-Gm-Message-State: AJIora/Pja4n1Xh0vokBs9PwnBqrbAfXAycA54vAR7tNQfAIOIDxlv+b
	4b8ccpUN56dYl810XMFdmCg=
X-Google-Smtp-Source: AGRyM1sfrHtR5vRFz4+UY3goMb2y4Ogony8hYZbNN7R8OEgNLqQ/6GpehZKfPYFZCTVawWE43oitHA==
X-Received: by 2002:a05:6512:baa:b0:48a:b09e:f299 with SMTP id b42-20020a0565120baa00b0048ab09ef299mr3975621lfv.38.1659017806974;
        Thu, 28 Jul 2022 07:16:46 -0700 (PDT)
Message-ID: <65aad251-2775-45cb-e642-3314f253ace6@gmail.com>
Date: Thu, 28 Jul 2022 17:16:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V7 09/11] vpci: add initial support for virtual PCI bus
 topology
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220719174253.541965-1-olekstysh@gmail.com>
 <20220719174253.541965-10-olekstysh@gmail.com>
 <3b3dd7bf-b528-b7ab-aec9-c912a30d9cd0@suse.com>
From: Oleksandr <olekstysh@gmail.com>
In-Reply-To: <3b3dd7bf-b528-b7ab-aec9-c912a30d9cd0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 27.07.22 13:32, Jan Beulich wrote:


Hello Jan


> On 19.07.2022 19:42, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>
>> Assign SBDF to the PCI devices being passed through with bus 0.
>> The resulting topology is where PCIe devices reside on the bus 0 of the
>> root complex itself (embedded endpoints).
>> This implementation is limited to 32 devices which are allowed on
>> a single PCI bus.
>>
>> Please note, that at the moment only function 0 of a multifunction
>> device can be passed through.
> I've not been able to spot where this restriction is being enforced -
> can you please point me at the respective code?

Nor have I found the respective code.

Could you please suggest a place where to put such enforcement (I guess, 
this should be present in the toolstack)?



>
>> @@ -99,6 +102,62 @@ int vpci_add_handlers(struct pci_dev *pdev)
>>   }
>>   
>>   #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
>> +static int add_virtual_device(struct pci_dev *pdev)
>> +{
>> +    struct domain *d = pdev->domain;
>> +    pci_sbdf_t sbdf = { 0 };
>> +    unsigned long new_dev_number;
>> +
>> +    if ( is_hardware_domain(d) )
>> +        return 0;
>> +
>> +    ASSERT(pcidevs_write_locked());
>> +
>> +    /*
>> +     * Each PCI bus supports 32 devices/slots at max or up to 256 when
>> +     * there are multi-function ones which are not yet supported.
>> +     */
>> +    if ( pdev->info.is_extfn )
>> +    {
>> +        gdprintk(XENLOG_ERR, "%pp: only function 0 passthrough supported\n",
>> +                 &pdev->sbdf);
>> +        return -EOPNOTSUPP;
>> +    }
>> +
>> +    new_dev_number = find_first_zero_bit(d->vpci_dev_assigned_map,
>> +                                         VPCI_MAX_VIRT_DEV);
>> +    if ( new_dev_number >= VPCI_MAX_VIRT_DEV )
>> +        return -ENOSPC;
>> +
>> +    __set_bit(new_dev_number, &d->vpci_dev_assigned_map);
>> +
>> +    /*
>> +     * Both segment and bus number are 0:
>> +     *  - we emulate a single host bridge for the guest, e.g. segment 0
>> +     *  - with bus 0 the virtual devices are seen as embedded
>> +     *    endpoints behind the root complex
>> +     *
>> +     * TODO: add support for multi-function devices.
>> +     */
>> +    sbdf.devfn = PCI_DEVFN(new_dev_number, 0);
>> +    pdev->vpci->guest_sbdf = sbdf;
>> +
>> +    return 0;
>> +
>> +}
>> +
>> +static void vpci_remove_virtual_device(const struct pci_dev *pdev)
>> +{
>> +    ASSERT(pcidevs_write_locked());
>> +
>> +    if ( pdev->vpci )
>> +    {
>> +        __clear_bit(pdev->vpci->guest_sbdf.dev,
>> +                    &pdev->domain->vpci_dev_assigned_map);
>> +        pdev->vpci->guest_sbdf.sbdf = ~0;
>> +    }
>> +}
> Feels like I did comment on this before: When ...
>
>> @@ -111,8 +170,16 @@ int vpci_assign_device(struct pci_dev *pdev)
>>   
>>       rc = vpci_add_handlers(pdev);
>>       if ( rc )
>> -        vpci_deassign_device(pdev);
>> +        goto fail;
> ... this path is taken and hence ...
>
>> +    rc = add_virtual_device(pdev);
> ... this is bypassed, ...
>
>> +    if ( rc )
>> +        goto fail;
>> +
>> +    return 0;
>>   
>> + fail:
>> +    vpci_deassign_device(pdev);
> ... the function here will see guest_sbdf still as ~0, while pdev->vpci
> is non-NULL. Therefore mistakenly bit 31 of vpci_dev_assigned_map will
> be cleared.


Indeed, good catch, thanks! I assume this can be just fixed by extending 
a check in vpci_remove_virtual_device():

if ( pdev->vpci && (pdev->vpci->guest_sbdf.sbdf != ~0) )




>
>> @@ -124,6 +191,7 @@ void vpci_deassign_device(struct pci_dev *pdev)
>>       if ( !has_vpci(pdev->domain) )
>>           return;
>>   
>> +    vpci_remove_virtual_device(pdev);
>>       vpci_remove_device(pdev);
>>   }
> And other call sites of vpci_remove_device() do not have a need of
> cleaning up guest_sbdf / vpci_dev_assigned_map?

I am not 100% sure, but it looks like they don't need. On the other 
hand, even if they don't need that, doing the cleaning won't be an issue 
at all,

there is a check before cleaning (which will be extended as I proposed 
above), so ...


> IOW I wonder if it
> wouldn't be better to have vpci_remove_device() do this as well
> (retaining - see my comment on the earlier patch) the simple aliasing
> of vpci_deassign_device() to vpci_remove_device()).


    ... maybe yes. Shall I do that change?



>
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -457,6 +457,14 @@ struct domain
>>   
>>   #ifdef CONFIG_HAS_PCI
>>       struct list_head pdev_list;
>> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
>> +    /*
>> +     * The bitmap which shows which device numbers are already used by the
>> +     * virtual PCI bus topology and is used to assign a unique SBDF to the
>> +     * next passed through virtual PCI device.
>> +     */
>> +    DECLARE_BITMAP(vpci_dev_assigned_map, VPCI_MAX_VIRT_DEV);
>> +#endif
>>   #endif
> Hmm, yet another reason to keep sched.h including vpci.h, which
> imo would better be dropped - sched.h already has way too many
> dependencies. (Just a remark, not strictly a request to change
> anything.)


I see.


>
> Jan

-- 
Regards,

Oleksandr Tyshchenko


