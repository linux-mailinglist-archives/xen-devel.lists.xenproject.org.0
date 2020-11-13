Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5013D2B22AA
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 18:39:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26829.55339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdd2W-0004qM-Fc; Fri, 13 Nov 2020 17:39:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26829.55339; Fri, 13 Nov 2020 17:39:12 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdd2W-0004px-Cc; Fri, 13 Nov 2020 17:39:12 +0000
Received: by outflank-mailman (input) for mailman id 26829;
 Fri, 13 Nov 2020 17:39:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HVgh=ET=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kdd2U-0004ps-Lk
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 17:39:10 +0000
Received: from mail-lf1-x135.google.com (unknown [2a00:1450:4864:20::135])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 758d6ebc-941d-4951-a1a9-9c864e7911f4;
 Fri, 13 Nov 2020 17:39:09 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id f11so15086250lfs.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2020 09:39:09 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id t6sm1314133lfe.81.2020.11.13.09.39.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 09:39:03 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=HVgh=ET=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kdd2U-0004ps-Lk
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 17:39:10 +0000
X-Inumbo-ID: 758d6ebc-941d-4951-a1a9-9c864e7911f4
Received: from mail-lf1-x135.google.com (unknown [2a00:1450:4864:20::135])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 758d6ebc-941d-4951-a1a9-9c864e7911f4;
	Fri, 13 Nov 2020 17:39:09 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id f11so15086250lfs.3
        for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2020 09:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=C9PtRL7msCPm1ZBfIObuxvZHC9YDPfDdR1cQIEJ3ZDs=;
        b=Pb1lg8TFL/w6UkhSagcgZCoEQ9EtdS1b2AmysfWsSuK5EIylk1JoD4fsLCqTMuUfxc
         8LLkIqiZGBbLgxP6e6EFNDJsbIZZ8sinVzKhS1rlNhit85pRTtknKTY97/sMuX4SzvT/
         5ADAGRlIU0uXkfT0ecVoUNjdd9MSvovLaqs7ifjub+DS4KUoNO+bDwOjN1+u4wQsYv6F
         aA/I9jffrucCLbI/KtMmPVy3e6TJZlyEzhtMXXQtTX6aSoZyDmxzDnRDZpLbi/uprTui
         U05BEYBBPs+m/1J9KwbAQaB2KNypsIq56t41GPeIeVK87k8HBlrWyJ0tWf8ziTd7U8Vt
         aI3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=C9PtRL7msCPm1ZBfIObuxvZHC9YDPfDdR1cQIEJ3ZDs=;
        b=pjptPM9HvqCJ4EjW7VSl9mJPfrV7KatyoV+brBWd4hQEQkUc/EXNKhWhuhM1xBLQge
         NMM6LLdKYedWuXMDssiEOE01++9k95pMzkqLSHSiQqUuHHB8u586UgRCMSTLWN/fyJH6
         77gXjXQIZbopOcQjmMrvBunWpdl6qqQtfwVaNO0GS4CrgyphUPpCSrl8YA4+Dc852zp/
         a3O2kG28TTtKaCB0SnTsc1xWrIOmdZggbY0AAuvu10klTWZyCSoOzutWaBXwcybVXjMu
         y35ZFNT0cQ2p4HFRhP7hbSKfqNBq7DAwX5kNr4/7cT+QDQ/btJI8Dxa8XIcgxIFK5L0o
         rIzw==
X-Gm-Message-State: AOAM5303veqk8f5yaZGZq0otRjhRkCMjlPZevBtItBFYA1ppeDBxKYK/
	Vjbh97MRpttWLcCToJ+OQc8=
X-Google-Smtp-Source: ABdhPJxqAhKIOTD4SX+UmSwHNM152ljEbWHagMBvrxhG4je+V7+JPIO8Hk0y+N0mXMRI6nYqUYrkrQ==
X-Received: by 2002:ac2:44ac:: with SMTP id c12mr1433429lfm.602.1605289143572;
        Fri, 13 Nov 2020 09:39:03 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id t6sm1314133lfe.81.2020.11.13.09.39.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2020 09:39:03 -0800 (PST)
Subject: Re: [PATCH V2 23/23] [RFC] libxl: Add support for virtio-disk
 configuration
To: Wei Chen <Wei.Chen@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-24-git-send-email-olekstysh@gmail.com>
 <AM0PR08MB374735F747FFF1A3016F37329EEA0@AM0PR08MB3747.eurprd08.prod.outlook.com>
 <99636dd8-4c90-bb84-b96f-6c7a9ad31b63@gmail.com>
 <AM0PR08MB3747DB347ED64AF7DF99C5A19EE80@AM0PR08MB3747.eurprd08.prod.outlook.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <22ec8e33-6c53-69fa-3cc3-00ca00e1e20e@gmail.com>
Date: Fri, 13 Nov 2020 19:38:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <AM0PR08MB3747DB347ED64AF7DF99C5A19EE80@AM0PR08MB3747.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 11.11.20 06:28, Wei Chen wrote:
> Hi Oleksandr,

Hi Wei


>>>> An example of domain configuration (two disks are assigned to the guest,
>>>> the latter is in readonly mode):
>>>>
>>>> vdisk = [ 'backend=DomD, disks=rw:/dev/mmcblk0p3;ro:/dev/mmcblk1p3' ]
>>>>
>>> Can we keep use the same 'disk' parameter for virtio-disk, but add an option
>> like
>>>    "model=virtio-disk"?
>>> For example:
>>> disk = [ 'backend=DomD, disks=rw:/dev/mmcblk0p3,model=virtio-disk' ]
>>> Just like what Xen has done for x86 virtio-net.
>> I think, this needs an additional investigation. In general I agree with
>> you that it would be nice to reuse existing 'disk' parameter somehow
>> rather than introducing new one
>> for the same purpose (to handle virtual block device(s)).
>>
>>
>> One note, although both are used for the same purpose they are different
>> in at least one important option.
>>
>> For example:
>> 1. disk = [ 'backend=DomD, phy:/dev/mmcblk0p3, xvda1' ]
>> 2. vdisk = [ 'backend=DomD, disks=rw:/dev/mmcblk0p3' ]
>> As you can see existing "disk" parameter contains xvda1, this means that
>> a new device /dev/xvda1 will appear at the guest side, but "vdisk"
>> doesn't contain anything similar. So with Xen PV driver (xen-blkfront)
> Yes, I understand your concerns. But I think specifying a device name
> for virtio disk is not a mandatory requirement. Even if we're using physical
> disks on bare metal machine, we can't guarantee slot#1 disk is always 'sda'.
> So most modern OS are prefer to use blkid to mount filesystem.
>
>> we are able to configure a device name, but with VirtIO solution
>> (virtio-blk) we aren't (at least I don't know how exactly).
>>
> Just my understanding, not exactly accurate:
> The virtio-blk could not get VDEV information for a bus like Xen-bus. So the disk
> ID is allocated dynamically in bus probe progress. The first probed disk will get
> ID 'a'. And then the ID keeps increasing. If we want to specify the disk ID for virtio
> disk, one possible way to do this is to construct a reasonable position on bus
> (fdt node position of virtio mmio device, PCI Function ID of virtio pci block) for
> virtio disk. But it is not always successful, we can't skip 'vda' to specify a virtio
> disk as 'vdb'.
Thank you for the explanation. I got your point regarding using the same 
disk parameter and I think it makes sense. Now I am focusing on IOREQ 
transport to be available on Arm, and after that (I hope)
I will be able to return to virtio stuff.

-- 
Regards,

Oleksandr Tyshchenko


