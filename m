Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E1C2AE528
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 01:54:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24129.51219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kceNt-0005vy-7N; Wed, 11 Nov 2020 00:53:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24129.51219; Wed, 11 Nov 2020 00:53:13 +0000
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
	id 1kceNt-0005vZ-4C; Wed, 11 Nov 2020 00:53:13 +0000
Received: by outflank-mailman (input) for mailman id 24129;
 Wed, 11 Nov 2020 00:53:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OH4G=ER=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kceNr-0005vU-76
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 00:53:11 +0000
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f9dbde4-1312-4efd-a783-4c30960e8620;
 Wed, 11 Nov 2020 00:53:10 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id w142so808082lff.8
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2020 16:53:08 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id b13sm40632ljf.107.2020.11.10.16.53.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 16:53:06 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=OH4G=ER=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kceNr-0005vU-76
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 00:53:11 +0000
X-Inumbo-ID: 3f9dbde4-1312-4efd-a783-4c30960e8620
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3f9dbde4-1312-4efd-a783-4c30960e8620;
	Wed, 11 Nov 2020 00:53:10 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id w142so808082lff.8
        for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2020 16:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=LRw/QZu5dIL2xriEbomndRVnVkLZPwRTAU/cv/U3GFA=;
        b=Q8oAW52+w8xZ5KFDsBl6QpJY5bOAhZjwrdnFiIQhxfR51ZJrBAVb+FlgCee6bK5aGh
         5FxjtHJ1f78FVzBvLYWffHNeTdDjfrLnTlq60+P4XknMcZnIbe36vrChf2B3XGrP2TNw
         7kf088AjIw+WzMCOQc22JkTtZW6e+DJQdxg6T0bFGPs6EUEcQQffIi8+wKTJCMxG0mdf
         4B1GnYe1N8VMGlVbncgi7xrW5zzGzX8lwyHrwsHipmu5nHLRBFzoQINWEjtsjo1hyNKH
         P65WIOXgCVpGjFnoEWIKic2lMndGLXg+33+E4ez/ASR2lI6sOk16FVJrGGb8+MPuZzT5
         qpFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=LRw/QZu5dIL2xriEbomndRVnVkLZPwRTAU/cv/U3GFA=;
        b=NZG6UKr3YNrw8tq3Eel/CZGB121bx5MbVcqmIQr2ytKhz0S3xxa7VnFfMySxzNQRZw
         sSppMN171wxSf8Q9R/maOLsRuTq/fWo4zlv2z0xvRL1tjLy/KmBpRcCv5buCiwtqyqlb
         lcVSeEF3fpF+ehiZ1MHfO0eTBng17PmmrCkeqPV+bji0ccC5gEsfBF8ZZ01R3HA0iVKq
         HDrDhL0oR4+x+BLLxZ1Nc4llBvUAygKbST7jOK8DTxRZzLTjyyWlJiH6U2T9pwGrr4rc
         Nyhqp3d21UHRxaZxygfk1GXj/8tvY89K/tTRmrtdyFx6/vEwxq2+x0+aU2kwsYWlSZGD
         B9GQ==
X-Gm-Message-State: AOAM533pJrWPidO9Gz1bvqJutWYMSuySydrwEjwpn0os3Ww7XVfvMyTM
	fWLMhOfVE3entviaQdSqO6k=
X-Google-Smtp-Source: ABdhPJztHAicBw9PTCIV7025j4tNDaE4GHIrIs8fqFUivrnDBmVL+vbA5i/4FE1JJHaleIw3eTM+GQ==
X-Received: by 2002:a19:c60c:: with SMTP id w12mr1445530lff.244.1605055987491;
        Tue, 10 Nov 2020 16:53:07 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id b13sm40632ljf.107.2020.11.10.16.53.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2020 16:53:06 -0800 (PST)
Subject: Re: [PATCH V2 23/23] [RFC] libxl: Add support for virtio-disk
 configuration
To: Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-24-git-send-email-olekstysh@gmail.com>
 <AM0PR08MB374735F747FFF1A3016F37329EEA0@AM0PR08MB3747.eurprd08.prod.outlook.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <99636dd8-4c90-bb84-b96f-6c7a9ad31b63@gmail.com>
Date: Wed, 11 Nov 2020 02:53:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <AM0PR08MB374735F747FFF1A3016F37329EEA0@AM0PR08MB3747.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 09.11.20 08:45, Wei Chen wrote:
> Hi Oleksandr,

Hi Wei


>
>> -----Original Message-----
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
>> Oleksandr Tyshchenko
>> Sent: 2020年10月16日 0:45
>> To: xen-devel@lists.xenproject.org
>> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Ian Jackson
>> <iwj@xenproject.org>; Wei Liu <wl@xen.org>; Anthony PERARD
>> <anthony.perard@citrix.com>; Julien Grall <julien@xen.org>; Stefano Stabellini
>> <sstabellini@kernel.org>
>> Subject: [PATCH V2 23/23] [RFC] libxl: Add support for virtio-disk configuration
>>
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> This patch adds basic support for configuring and assisting virtio-disk
>> backend (emualator) which is intended to run out of Qemu and could be run
>> in any domain.
>>
>> Xenstore was chosen as a communication interface for the emulator running
>> in non-toolstack domain to be able to get configuration either by reading
>> Xenstore directly or by receiving command line parameters (an updated 'xl devd'
>> running in the same domain would read Xenstore beforehand and call backend
>> executable with the required arguments).
>>
>> An example of domain configuration (two disks are assigned to the guest,
>> the latter is in readonly mode):
>>
>> vdisk = [ 'backend=DomD, disks=rw:/dev/mmcblk0p3;ro:/dev/mmcblk1p3' ]
>>
> Can we keep use the same 'disk' parameter for virtio-disk, but add an option like
>   "model=virtio-disk"?
> For example:
> disk = [ 'backend=DomD, disks=rw:/dev/mmcblk0p3,model=virtio-disk' ]
> Just like what Xen has done for x86 virtio-net.

I think, this needs an additional investigation. In general I agree with 
you that it would be nice to reuse existing 'disk' parameter somehow 
rather than introducing new one
for the same purpose (to handle virtual block device(s)).


One note, although both are used for the same purpose they are different 
in at least one important option.

For example:
1. disk = [ 'backend=DomD, phy:/dev/mmcblk0p3, xvda1' ]
2. vdisk = [ 'backend=DomD, disks=rw:/dev/mmcblk0p3' ]
As you can see existing "disk" parameter contains xvda1, this means that 
a new device /dev/xvda1 will appear at the guest side, but "vdisk" 
doesn't contain anything similar. So with Xen PV driver (xen-blkfront) 
we are able to configure a device name, but with VirtIO solution 
(virtio-blk) we aren't (at least I don't know how exactly).





-- 
Regards,

Oleksandr Tyshchenko


