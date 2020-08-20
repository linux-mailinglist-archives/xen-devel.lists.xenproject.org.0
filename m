Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3183D24C633
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 21:14:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8q1K-0002Lh-7F; Thu, 20 Aug 2020 19:14:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ocHG=B6=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k8q1J-0002La-0m
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 19:14:41 +0000
X-Inumbo-ID: a3ea8cfd-d3dd-4c04-9681-810e557664c3
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3ea8cfd-d3dd-4c04-9681-810e557664c3;
 Thu, 20 Aug 2020 19:14:40 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id j15so1501586lfg.7
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2020 12:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=StvZMULVWarDf+G9ipABBLRaDuacMc7AU3bPF/B4lw8=;
 b=sg4MwOdrv4UiScI+5QBGN2iAUlBw8uIcNMJitzOMp8pQjx7OALr8/N4oJFr9QThxxS
 3YaWdCbTTW3shrEqLG7NVfgIv53DOMe0qcLz83BpnpYvF8HuUsThoVfT3xrR8h8/t8xv
 Da1DLQhTDscIGwjK4aUzSthso9v/EKnjDkymfVFJ85NsQyvpYu2s1HCJkKIwF5Hz0HtY
 MdDMu5gmPUfoZi1C4hhgAfFRKDVx0Wi+DroDD6HBsgyfElW0oVXeNm+wAswyTj2AEsSm
 svz+tTDkpVl4GW8B0mZm1uPGgWK0qrAnKuSYRr8VcKyg4zYVUX5RYizlIdI9ueFEZcb1
 t8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=StvZMULVWarDf+G9ipABBLRaDuacMc7AU3bPF/B4lw8=;
 b=mw7sz9OOPF6J6IeKo9ICO9YjGUV/cR6EqEb9hEGkhFVyLAEOeqWGxbK2+6S2w8yMa+
 HYLtN/M4Bq1OfMgWafh5e9nWY3ZjWCE9Dss8iPRHTl5tYfy/bNA1QVhW9m/9HrSFla9x
 4QWL9yKH4R2SRN09Dcy0CZAnLT2pBcPbBlR37csQjU2KI3YtLXtORrVJxTZrtcoRCq4b
 A+ONZ/KdnsuAo0NCI7XfkiVOGMjV0FJ24CSk+66kdAY5tUnoSU6M/V4Z/j0S1dQ+099M
 95kXs6znOQ36L1r3w7RaXExa2R3n/9h8oTLS/1emeFgUCCDa7HZttnrpm94Yb/vQodin
 1BLg==
X-Gm-Message-State: AOAM532C6QURSlnhdkgdujeNFWGJS1Jn6ydWsXFhYIvtgYlkQBWZ44wz
 vtK9i89fWqUPFIMM9OKTwtk=
X-Google-Smtp-Source: ABdhPJzz4cv2ZfOl/nIrK8lMxN8EFZyGaK7UBHcUlTkjqjjDu6Cs6cXY1XVi8e3RNpoX6uCKQITyeg==
X-Received: by 2002:ac2:4d4f:: with SMTP id 15mr2215425lfp.163.1597950878882; 
 Thu, 20 Aug 2020 12:14:38 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id s2sm680334lfs.4.2020.08.20.12.14.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2020 12:14:38 -0700 (PDT)
Subject: Re: [RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature common
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: paul@xen.org, xen-devel@lists.xenproject.org,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Jan Beulich' <jbeulich@suse.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Wei Liu' <wl@xen.org>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'Jun Nakajima' <jun.nakajima@intel.com>, 'Kevin Tian'
 <kevin.tian@intel.com>, 'Tim Deegan' <tim@xen.org>,
 'Julien Grall' <julien.grall@arm.com>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-2-git-send-email-olekstysh@gmail.com>
 <000c01d66a33$2bd56510$83802f30$@xen.org>
 <9f83a7ed-ca97-449f-c7b9-a1140644abe9@gmail.com>
 <f0c32cfe-5c33-30ae-b08a-3d72e935745a@xen.org>
 <alpine.DEB.2.21.2008041105510.5748@sstabellini-ThinkPad-T480s>
 <5df97055-67f9-16cc-a274-864672d67164@xen.org>
 <alpine.DEB.2.21.2008051121580.5748@sstabellini-ThinkPad-T480s>
 <1afb9ffd-088c-ef4e-131a-0f2b62142405@xen.org>
 <alpine.DEB.2.21.2008061352141.16004@sstabellini-ThinkPad-T480s>
 <598e2f35-e70e-36a7-1e5d-259ebb2e3cde@xen.org>
 <alpine.DEB.2.21.2008101433050.16004@sstabellini-ThinkPad-T480s>
 <3e9c1820-5a75-49d7-0a97-4c24b20986c3@xen.org>
 <alpine.DEB.2.21.2008111446500.15669@sstabellini-ThinkPad-T480s>
 <19d27a9a-ca14-cb86-52a1-6441bd24933a@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <30bf5755-8324-7612-9392-1a25a361e69f@gmail.com>
Date: Thu, 20 Aug 2020 22:14:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <19d27a9a-ca14-cb86-52a1-6441bd24933a@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 12.08.20 11:19, Julien Grall wrote:
> Hi,

Hi Julien, Stefano


>
> On 11/08/2020 23:48, Stefano Stabellini wrote:
>>> I have the impression that we disagree in what the Device Emulator 
>>> is meant to
>>> do. IHMO, the goal of the device emulator is to emulate a device in an
>>> arch-agnostic way.
>>
>> That would be great in theory but I am not sure it is achievable: if we
>> use an existing emulator like QEMU, even a single device has to fit
>> into QEMU's view of the world, which makes assumptions about host
>> bridges and apertures. It is impossible today to build QEMU in an
>> arch-agnostic way, it has to be tied to an architecture.
>
> AFAICT, the only reason QEMU cannot build be in an arch-agnostic way 
> is because of TCG. If this wasn't built then you could easily write a 
> machine that doesn't depend on the instruction set.
>
> The proof is, today, we are using QEMU x86 to serve Arm64 guest. 
> Although this is only for PV drivers.
>
>>
>> I realize we are not building this interface for QEMU specifically, but
>> even if we try to make the interface arch-agnostic, in reality the
>> emulators won't be arch-agnostic.
>
> This depends on your goal. If your goal is to write a standalone 
> emulator for a single device, then it is entirely possible to make it 
> arch-agnostic.
>
> Per above, this would even be possible if you were emulating a set of 
> devices.
>
> What I want to avoid is requiring all the emulators to contain 
> arch-specific code just because it is easier to get QEMU working on 
> Xen on Arm.
>
>> If we send a port-mapped I/O request
>> to qemu-system-aarch64 who knows what is going to happen: it is a code
>> path that it is not explicitly tested.
>
> Maybe, maybe not. To me this is mostly software issues that can easily 
> be mitigated if we do proper testing...

Could we please find a common ground on whether the PIO handling needs 
to be implemented on Arm or not? At least for the current patch series.


Below my thoughts:
 From one side I agree that emulator shouldn't contain any arch-specific 
code, yes it is hypervisor specific but it should be arch agnostic if 
possible. So PIO case should be handled.
 From other side I tend to think that it might be possible to skip PIO 
handling for the current patch series (leave it x86 specific for now as 
we do with handle_realmode_completion()).
I think nothing will prevent us from adding PIO handling later on if 
there is a real need (use-case) for that. Please correct me if I am wrong.

I would be absolutely OK with any options.

What do you think?


-- 
Regards,

Oleksandr Tyshchenko


