Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D146F225CFB
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 12:57:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxTTh-0004AM-Mn; Mon, 20 Jul 2020 10:57:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bPHy=A7=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1jxTTg-0004AH-H8
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 10:57:00 +0000
X-Inumbo-ID: bb8aa31a-ca77-11ea-848a-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb8aa31a-ca77-11ea-848a-bc764e2007e4;
 Mon, 20 Jul 2020 10:56:59 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id h22so19730856lji.9
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2020 03:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=thKLQZg/eCxpkga5gOSqVKbvyxLybiaQCBrOrgjQ4do=;
 b=WPfkHHkbOrAbZKNi/UJVbEHWPABsmPlAajL57yoj4NgS/FH81Hgx7BNqymS0r3uv2K
 3GHIgfHfVgT74DwbCnNv5Y2DiE8MqT8wbZZzrdSiOlkP7y4YQi/KGElXqkE+ISmPAmGw
 RwuUW5gTkI3YRcqqqSgnSHvqFee/Sy+8zg5d2Tdgb5+Wvn6owPjQlWgzl+MBslzlS0/U
 2P26FyV0AdhyAh8Tj7pQg/qbmgzGOBh9D/WovasEZxkrlGg+/pEkA4p/0hn4zbM/RbeL
 ptaAOUXYS0itXw9PUpkTi8DNl2969C8LpWLMWLEejHj89p/kkLr1v+NhRSyFz1BzRsyh
 qAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=thKLQZg/eCxpkga5gOSqVKbvyxLybiaQCBrOrgjQ4do=;
 b=GZVZj3yVkuPnjg31qFzwStqO0UyJIL/cIPjqjYdpZWdDbb+7cXw0cNprJXrNpHlzue
 Fql2fWhbCgVsKWoZhd/kiQb9cuOz3zA7SxsbzT1rnFlDtI5Ed3qATCiks5C/atpeyweO
 wbNG/HqiwwKUtGik/owp1iH9ocb9p6qN5bv3+dT0lr5le7UFbwo0K5IDzV5atzodBi04
 z9dPJ+75FpHBRGgsqn/Vf9SA99vILXtdQABJzV5WjZq2LN33MsuSNQPuYNh+OCN0eYsN
 W6WpxRNWjY2ZN4cgDsmHTliTr8u10O2G1ry5u0ldqOyN6C8HYF/LRKvc9FgefLzZBGXQ
 ELJA==
X-Gm-Message-State: AOAM531bL0ft7PktdKdNoNttAwZmtRHUSlUFXNmTDYsbCY1HAXn+Ni7o
 4Pyxxu9Dx0edpfXKFbEB7OI=
X-Google-Smtp-Source: ABdhPJzPTDZxafIiol1O0sufKm7qGloHnmhkj/5DzK1VkqpiFPY4V2Sfd9RfHnztXR/CZpJepbS+3Q==
X-Received: by 2002:a2e:850f:: with SMTP id j15mr10688121lji.44.1595242617795; 
 Mon, 20 Jul 2020 03:56:57 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id m5sm1543823lfo.47.2020.07.20.03.56.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2020 03:56:57 -0700 (PDT)
Subject: Re: Virtio in Xen on Arm (based on IOREQ concept)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <CAPD2p-nthLq5NaU32u8pVaa-ub=a9-LOPenupntTYdS-cu31jQ@mail.gmail.com>
 <20200717150039.GV7191@Air-de-Roger>
 <8f4e0c0d-b3d4-9dd3-ce20-639539321968@gmail.com>
 <20200720091722.GF7191@Air-de-Roger>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <be3fc8de-5582-8fd0-52cd-0cbfbfa96859@gmail.com>
Date: Mon, 20 Jul 2020 13:56:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200720091722.GF7191@Air-de-Roger>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Artem Mygaiev <joculator@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 20.07.20 12:17, Roger Pau Monné wrote:

Hello Roger

> On Fri, Jul 17, 2020 at 09:34:14PM +0300, Oleksandr wrote:
>> On 17.07.20 18:00, Roger Pau Monné wrote:
>>> On Fri, Jul 17, 2020 at 05:11:02PM +0300, Oleksandr Tyshchenko wrote:
>>>> requires
>>>> some implementation to forward guest MMIO access to a device model. And as
>>>> it
>>>> turned out the Xen on x86 contains most of the pieces to be able to use that
>>>> transport (via existing IOREQ concept). Julien has already done a big amount
>>>> of work in his PoC (xen/arm: Add support for Guest IO forwarding to a
>>>> device emulator).
>>>> Using that code as a base we managed to create a completely functional PoC
>>>> with DomU
>>>> running on virtio block device instead of a traditional Xen PV driver
>>>> without
>>>> modifications to DomU Linux. Our work is mostly about rebasing Julien's
>>>> code on the actual
>>>> codebase (Xen 4.14-rc4), various tweeks to be able to run emulator
>>>> (virtio-disk backend)
>>>> in other than Dom0 domain (in our system we have thin Dom0 and keep all
>>>> backends
>>>> in driver domain),
>>> How do you handle this use-case? Are you using grants in the VirtIO
>>> ring, or rather allowing the driver domain to map all the guest memory
>>> and then placing gfn on the ring like it's commonly done with VirtIO?
>> Second option. Xen grants are not used at all as well as event channel and
>> Xenbus. That allows us to have guest
>>
>> *unmodified* which one of the main goals. Yes, this may sound (or even
>> sounds) non-secure, but backend which runs in driver domain is allowed to
>> map all guest memory.
> Supporting unmodified guests is certainly a fine goal, but I don't
> think it's incompatible with also trying to expand the spec in
> parallel in order to support grants in a negotiated way (see below).
>
> That way you could (long term) regain some of the lost security.
>
>>> Do you have any plans to try to upstream a modification to the VirtIO
>>> spec so that grants (ie: abstract references to memory addresses) can
>>> be used on the VirtIO ring?
>> But VirtIO spec hasn't been modified as well as VirtIO infrastructure in the
>> guest. Nothing to upsteam)
> OK, so there's no intention to add grants (or a similar interface) to
> the spec?
>
> I understand that you want to support unmodified VirtIO frontends, but
> I also think that long term frontends could negotiate with backends on
> the usage of grants in the shared ring, like any other VirtIO feature
> negotiated between the frontend and the backend.
>
> This of course needs to be on the spec first before we can start
> implementing it, and hence my question whether a modification to the
> spec in order to add grants has been considered.
>
> It's fine to say that you don't have any plans in this regard.
Adding grants (or a similar interface) to the spec hasn't been 
considered so far.

But I understand and completely agree that some solution should be found 
in order not to reduce security.


>>>> misc fixes for our use-cases and tool support for the
>>>> configuration.
>>>> Unfortunately, Julien doesn’t have much time to allocate on the work
>>>> anymore,
>>>> so we would like to step in and continue.
>>>>
>>>> *A few word about the Xen code:*
>>>> You can find the whole Xen series at [5]. The patches are in RFC state
>>>> because
>>>> some actions in the series should be reconsidered and implemented properly.
>>>> Before submitting the final code for the review the first IOREQ patch
>>>> (which is quite
>>>> big) will be split into x86, Arm and common parts. Please note, x86 part
>>>> wasn’t
>>>> even build-tested so far and could be broken with that series. Also the
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
>> Completely agree with you, I will send it after splitting IOREQ patch and
>> performing some cleanup.
>>
>> However, it is going to take some time to make it properly taking into the
>> account
>>
>> that personally I won't be able to test on x86.
> We have gitlab and the osstest CI loop (plus all the reviewers) so we
> should be able to spot any regressions. Build testing on x86 would be
> nice so that you don't need to resend to fix build issues.

Of course, before sending series to ML I will definitely perform a build 
test

on x86.


>>>> What I would like to add here, the IOREQ feature on Arm could be used not
>>>> only
>>>> for implementing Virtio, but for other use-cases which require some
>>>> emulator entity
>>>> outside Xen such as custom PCI emulator (non-ECAM compatible) for example.
>>>>
>>>> *A few word about the backend(s):*
>>>> One of the main problems with Virtio in Xen on Arm is the absence of
>>>> “ready-to-use” and “out-of-Qemu” Virtio backends (I least am not aware of).
>>>> We managed to create virtio-disk backend based on demu [3] and kvmtool [4]
>>>> using
>>>> that series. It is worth mentioning that although Xenbus/Xenstore is not
>>>> supposed
>>>> to be used with native Virtio, that interface was chosen to just pass
>>>> configuration from toolstack
>>>> to the backend and notify it about creating/destroying Guest domain (I
>>>> think it is
>>> I would prefer if a single instance was launched to handle each
>>> backend, and that the configuration was passed on the command line.
>>> Killing the user-space backend from the toolstack is fine I think,
>>> there's no need to notify the backend using xenstore or any other
>>> out-of-band methods.
>>>
>>> xenstore has proven to be a bottleneck in terms of performance, and it
>>> would be better if we can avoid using it when possible, specially here
>>> that you have to do this from scratch anyway.
>> Let me elaborate a bit more on this.
>>
>> In current backend implementation, the Xenstore is *not* used for
>> communication between backend (VirtIO device) and frontend (VirtIO driver),
>> frontend knows nothing about it.
>>
>> Xenstore was chosen as an interface in order to be able to pass
>> configuration from toolstack in Dom0 to backend which may reside in other
>> than Dom0 domain (DomD in our case),
> There's 'xl devd' which can be used on the driver domain to spawn
> backends, maybe you could add the logic there so that 'xl devd' calls
> the backend executable with the required command line parameters, so
> that the backend itself doesn't need to interact with xenstore in any
> way?
>
> That way in the future we could use something else instead of
> xenstore, like Argo for instance in order to pass the backend data
> from the control domain to the driver domain.
>
>> also looking into the Xenstore entries backend always knows when the
>> intended guest is been created/destroyed.
> xl devd should also do the killing of backends anyway when a domain is
> destroyed, or else malfunctioning user-space backends could keep
> running after the domain they are serving is destroyed.
>
>> I may mistake, but I don't think we can avoid using Xenstore (or other
>> interface provided by toolstack) for the several reasons.
>>
>> Besides a virtio-disk configuration (a disk to be assigned to the guest, R/O
>> mode, etc), for each virtio-mmio device instance
>>
>> a pair (mmio range + IRQ) are allocated by toolstack at the guest
>> construction time and inserted into virtio-mmio device tree node
>>
>> in the guest device tree. And for the backend to properly operate these
>> variable parameters are also passed to the backend via Xenstore.
> I think you could pass all these parameters as command line arguments
> to the backend?
>
>> The other reasons are:
>>
>> 1. Automation. With current backend implementation we don't need to pause
>> guest right after creating it, then go to the driver domain and spawn
>> backend and
>>
>> after that go back to the dom0 and unpause the guest.
> xl devd should be capable of handling this for you on the driver
> domain.
>
>> 2. Ability to detect when guest with involved frontend has gone away and
>> properly release resource (guest destroy/reboot).
>>
>> 3. Ability to (re)connect to the newly created guest with involved frontend
>> (guest create/reboot).
>>
>> 4. What is more that having Xenstore support the backend is able to detect
>> the dom_id it runs into and the guest dom_id, there is no need pass them via
>> command line.
>>
>>
>> I will be happy to explain in details after publishing backend code).
> As I'm not the one doing the work I certainly won't stop you from
> using xenstore on the backend. I would certainly prefer if the backend
> gets all the information it needs from the command line so that the
> configuration data is completely agnostic to the transport layer used
> to convey it.
>
> Thanks, Roger.

Thank you for pointing another possible way. I feel I need to 
investigate what is the "xl devd" (+ Argo?) and how it works. If it is 
able to provide backend with

the support/information it needs and xenstore is not welcome then I 
would be absolutely ok to consider using other solution.

I propose to get back to that discussion after I prepare and send out 
the proper IOREQ series.


-- 
Regards,

Oleksandr Tyshchenko


