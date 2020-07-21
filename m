Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E09E22873E
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 19:25:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxw0p-0003U8-9x; Tue, 21 Jul 2020 17:25:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FhFK=BA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1jxw0o-0003U3-78
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 17:25:06 +0000
X-Inumbo-ID: 1d4f7594-cb77-11ea-8584-bc764e2007e4
Received: from mail-lj1-x22e.google.com (unknown [2a00:1450:4864:20::22e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d4f7594-cb77-11ea-8584-bc764e2007e4;
 Tue, 21 Jul 2020 17:25:04 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id d17so24954976ljl.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2020 10:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=cwFmheLwP7XUTScLQASuc1Rn/JAgGwsxwDrCkfQpiQY=;
 b=q1WxdZXZ8boc4Md6AiV0GyO/7pD4k+GptMLYvxZiDF1RfBmSnW2N9yQM/rJk0zc7r9
 7EXWd1808ixzLFGFEGpWso36ObdtzRs9aOh6PjRRiy2GlXbb5hWnXWmSxcnNf1T42P/Q
 vGwvZitp0CltohLEWrDwHl7A8ft4jqiquHlvLx0HqrEw28a8/bw41IEBoRAvMhNmsF6n
 Rd4X+67YBC4yJ3THD6IXEijlwAx3++5hdqf0FRQKtudSjpTKCrC2N13tPE83Kaj4Tm9N
 6kUxkpii0rDwjb9y/+6FbzmMtRWvwz3WM2RGA0R+uAfrX479QiwuT7pUbXDfO8Z5WCSA
 ociw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=cwFmheLwP7XUTScLQASuc1Rn/JAgGwsxwDrCkfQpiQY=;
 b=KbUzlXqjDHfrTNv6HgB+dv/ST4ezVnvFsWncbgY3uE5ZXeRkwYueCenLa0mlZ1hb2K
 w1TLPkj9uKPQF1dXgXV7V5ociozaIiH47eUREJvfGIZ5P36s6NXKkj5gXb9fILa2q8pK
 bVntOIFr/Y1/Rea9+Gu/opAMUeC0nCxhvLBApNPgL5bH+kWShgXaMx9iW69Mi3M34f5m
 2vlKexd0gAlTiUGaD5cBE3DOGnLcygJKkftRqEvOe/1lzh3hXK4HFB1JeTfCBCnUZddV
 l8sfE6aSE2w6JwQ107EPCcd+sv8vxTgQ3DgAGO9IWuXFl6ajh7sF+3CkBpjyBPbh/tx0
 9dXg==
X-Gm-Message-State: AOAM533dg7ek58mNKs2A2XPSbbddt6jbOVF0+/oN2qUKzMHNJO+FyrYw
 NcbknMrA/JVTa0hhltNZK3s=
X-Google-Smtp-Source: ABdhPJzeF8Eow23dHn4U1iwWcosv4ox4PvH0/Ozno+/UlHy6AVKK2KNswyVaxQIfLreadNTaL6oVHw==
X-Received: by 2002:a2e:98c8:: with SMTP id s8mr3127222ljj.368.1595352303624; 
 Tue, 21 Jul 2020 10:25:03 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id d23sm5598940lfm.85.2020.07.21.10.25.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2020 10:25:03 -0700 (PDT)
Subject: Re: Virtio in Xen on Arm (based on IOREQ concept)
To: Julien Grall <julien@xen.org>
References: <CAPD2p-nthLq5NaU32u8pVaa-ub=a9-LOPenupntTYdS-cu31jQ@mail.gmail.com>
 <20200717150039.GV7191@Air-de-Roger>
 <8f4e0c0d-b3d4-9dd3-ce20-639539321968@gmail.com>
 <3dcab37d-0d60-f1cc-1d59-b5497f0fa95f@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <4a66d39f-dece-672a-5ad3-7801f2583d07@gmail.com>
Date: Tue, 21 Jul 2020 20:24:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3dcab37d-0d60-f1cc-1d59-b5497f0fa95f@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Artem Mygaiev <joculator@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 21.07.20 17:27, Julien Grall wrote:
> Hi,

Hello Julien


>
> On 17/07/2020 19:34, Oleksandr wrote:
>>
>> On 17.07.20 18:00, Roger Pau Monné wrote:
>>>> requires
>>>> some implementation to forward guest MMIO access to a device model. 
>>>> And as
>>>> it
>>>> turned out the Xen on x86 contains most of the pieces to be able to 
>>>> use that
>>>> transport (via existing IOREQ concept). Julien has already done a 
>>>> big amount
>>>> of work in his PoC (xen/arm: Add support for Guest IO forwarding to a
>>>> device emulator).
>>>> Using that code as a base we managed to create a completely 
>>>> functional PoC
>>>> with DomU
>>>> running on virtio block device instead of a traditional Xen PV driver
>>>> without
>>>> modifications to DomU Linux. Our work is mostly about rebasing 
>>>> Julien's
>>>> code on the actual
>>>> codebase (Xen 4.14-rc4), various tweeks to be able to run emulator
>>>> (virtio-disk backend)
>>>> in other than Dom0 domain (in our system we have thin Dom0 and keep 
>>>> all
>>>> backends
>>>> in driver domain),
>>> How do you handle this use-case? Are you using grants in the VirtIO
>>> ring, or rather allowing the driver domain to map all the guest memory
>>> and then placing gfn on the ring like it's commonly done with VirtIO?
>>
>> Second option. Xen grants are not used at all as well as event 
>> channel and Xenbus. That allows us to have guest
>>
>> *unmodified* which one of the main goals. Yes, this may sound (or 
>> even sounds) non-secure, but backend which runs in driver domain is 
>> allowed to map all guest memory.
>>
>> In current backend implementation a part of guest memory is mapped 
>> just to process guest request then unmapped back, there is no 
>> mappings in advance. The xenforeignmemory_map
>>
>> call is used for that purpose. For experiment I tried to map all 
>> guest memory in advance and just calculated pointer at runtime. Of 
>> course that logic performed better.
>
> That works well for a PoC, however I am not sure you can rely on it 
> long term as a guest is free to modify its memory layout. For 
> instance, Linux may balloon in/out memory. You probably want to 
> consider something similar to mapcache in QEMU.
Yes, that was considered and even tried.
Current backend implementation is based on map/unmap only needed part of 
guest memory per each request with some kind of mapcache. I borrowed x86 
logic on Arm to invalidate mapcache on XENMEM_decrease_reservation call, 
so if mapcache is in use it will be cleared. Hopefully DomU without 
backends running is not going to balloon in/out memory often.


>
> On a similar topic, I am a bit surprised you didn't encounter memory 
> exhaustion when trying to use virtio. Because on how Linux currently 
> works (see XSA-300), the backend domain as to have a least as much RAM 
> as the domain it serves. For instance, you have serve two domains with 
> 1GB of RAM each, then your backend would need at least 2GB + some for 
> its own purpose.
I understand these bits. You have already warned me about that. When 
playing with mapping the whole guest memory in advance, I gave a DomU 
512MB only, that was enough to not encounter memory exhaustion on my
environment. Then switched to "map/unmap at runtime" model.


>>>>
>>>> *A few word about the Xen code:*
>>>> You can find the whole Xen series at [5]. The patches are in RFC state
>>>> because
>>>> some actions in the series should be reconsidered and implemented 
>>>> properly.
>>>> Before submitting the final code for the review the first IOREQ patch
>>>> (which is quite
>>>> big) will be split into x86, Arm and common parts. Please note, x86 
>>>> part
>>>> wasn’t
>>>> even build-tested so far and could be broken with that series. Also 
>>>> the
>>>> series probably
>>>> wants splitting into adding IOREQ on Arm (should be focused first) and
>>>> tools support
>>>> for the virtio-disk (which is going to be the first Virtio driver)
>>>> configuration before going
>>>> into the mailing list.
>>> Sending first a patch series to enable IOREQs on Arm seems perfectly
>>> fine, and it doesn't have to come with the VirtIO backend. In fact I
>>> would recommend that you send that ASAP, so that you don't spend time
>>> working on the backend that would likely need to be modified
>>> according to the review received on the IOREQ series.
>>
>> Completely agree with you, I will send it after splitting IOREQ patch 
>> and performing some cleanup.
>>
>> However, it is going to take some time to make it properly taking 
>> into the account
>>
>> that personally I won't be able to test on x86.
> I think other member of the community should be able to help here. 
> However, nowadays testing Xen on x86 is pretty easy with QEMU :).

That's good.


-- 
Regards,

Oleksandr Tyshchenko


