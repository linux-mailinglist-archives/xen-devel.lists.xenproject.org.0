Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F85B22432C
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 20:35:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwVCH-0005Wp-Re; Fri, 17 Jul 2020 18:35:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z3hM=A4=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1jwVCF-0005Wk-Qt
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 18:34:59 +0000
X-Inumbo-ID: 3738f3c2-c85c-11ea-bca7-bc764e2007e4
Received: from mail-lj1-x22e.google.com (unknown [2a00:1450:4864:20::22e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3738f3c2-c85c-11ea-bca7-bc764e2007e4;
 Fri, 17 Jul 2020 18:34:58 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id q4so13853116lji.2
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2020 11:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=cjn/+HtkHu6VGY1bWiMHWEzCHRCWeG+Zqp25hnjNy2M=;
 b=qmjQ287Uuh+mNnpVHob8PUaQurZOaUWY0tJxgFIG8itAQgN2+acyUGvxZnnkn3j6V3
 hahTQ01txrVa4OpTGDuLiH4CzDurauczezQ5hWMkICvRmqY29+kurDvp6MZo8V8dSidR
 QmCO3cGbk1AYBKYwayJzOBcbPVaxIA1+tl0gJhWyQtjY5zbuDtpQAdh78H0TfKjJJwUC
 if+UECkBnZ31gP8MHgDocpspbKUqD062VOwXS6SYRVc1s6DDcg633aKtOITpfFdODJZ/
 86hFS15p8VQGxSAZsBwveDXKdnfRGnqHF/JQSZPUagX5ZOsjRJsmuRR7rPhfdiWVwOJw
 O3zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=cjn/+HtkHu6VGY1bWiMHWEzCHRCWeG+Zqp25hnjNy2M=;
 b=jeQ3pG3mYMzCE+/clPfauG1B7+bnuyXe989MQ7jRWFcABNOO4cPk4MUWwKxftffM1X
 SvNnz0hHYkyrToiiamsIJwF2r5U/6MWKcIVo4ZCcFozyg439DumnYYrDLJFUOC5FAkKG
 LtNLqMhJBRwL64lJqyYSh1NR94ZKrExy/egmyoBlnHF+LM+xn3Z3KbJdIEZQTipPBV6g
 GcY/Cne0pZNFGO0Stw2g5zrbI8K/GyTje8bBFqeOBjMnX8xZQV/4xAToZT5JUBU/zb68
 v1121f1kxuJGy1y6PpfeJCEA14zNrPmgMkoYPiZj2b4zBwKQHIfDxiZl5lzIu/xTQ+M/
 l1FQ==
X-Gm-Message-State: AOAM532UY4JDONdlNPgAIto9TiESQ3h48fJ79YaGTxDRR85o4/IlxI85
 yiHZB6KCEJWKtwpBUxn+omQ=
X-Google-Smtp-Source: ABdhPJw8LAuh+vN1Ky/FEp8eKnoZEvPCfkxxaB2nn0RJIW5hlREZ8PyEBHS/WCKOFdUtvC283+EAIQ==
X-Received: by 2002:a2e:8e8a:: with SMTP id z10mr4808032ljk.351.1595010897044; 
 Fri, 17 Jul 2020 11:34:57 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id a8sm1773197ljk.138.2020.07.17.11.34.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jul 2020 11:34:56 -0700 (PDT)
Subject: Re: Virtio in Xen on Arm (based on IOREQ concept)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <CAPD2p-nthLq5NaU32u8pVaa-ub=a9-LOPenupntTYdS-cu31jQ@mail.gmail.com>
 <20200717150039.GV7191@Air-de-Roger>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <8f4e0c0d-b3d4-9dd3-ce20-639539321968@gmail.com>
Date: Fri, 17 Jul 2020 21:34:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200717150039.GV7191@Air-de-Roger>
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


On 17.07.20 18:00, Roger Pau Monné wrote:
> Hello,

Hello Roger


> I'm very happy to see this proposal, as I think having proper (1st
> class) VirtIO support on Xen is crucial to our survival. Almost all
> OSes have VirtIO frontends, while the same can't be said about Xen PV
> frontends. It would also allow us to piggyback on any new VirtIO
> devices without having to re-invent the wheel by creating a clone Xen
> PV device.

Thank you.


>
> On Fri, Jul 17, 2020 at 05:11:02PM +0300, Oleksandr Tyshchenko wrote:
>> Hello all.
>>
>> We would like to resume Virtio in Xen on Arm activities. You can find some
>> background at [1] and Virtio specification at [2].
>>
>> *A few words about importance:*
>> There is an increasing interest, I would even say, the requirement to have
>> flexible, generic and standardized cross-hypervisor solution for I/O
>> virtualization
>> in the automotive and embedded areas. The target is quite clear here.
>> Providing a standardized interface and device models for device
>> para-virtualization
>> in hypervisor environments, Virtio interface allows us to move Guest domains
>> among different hypervisor systems without further modification at the
>> Guest side.
>> What is more that Virtio support is available in Linux, Android and many
>> other
>> operating systems and there are a lot of existing Virtio drivers (frontends)
>> which could be just reused without reinventing the wheel. Many
>> organisations push
>> Virtio direction as a common interface. To summarize, Virtio support would
>> be
>> the great feature in Xen on Arm in addition to traditional Xen PV drivers
>> for
>> the user to be able to choose which one to use.
> I think most of the above also applies to x86, and fully agree.
>
>> *A few word about solution:*
>> As it was mentioned at [1], in order to implement virtio-mmio Xen on Arm
> Any plans for virtio-pci? Arm seems to be moving to the PCI bus, and
> it would be very interesting from a x86 PoV, as I don't think
> virtio-mmio is something that you can easily use on x86 (or even use
> at all).

Being honest I didn't consider virtio-pci so far. Julien's PoC (we are 
based on) provides support for the virtio-mmio transport

which is enough to start working around VirtIO and is not as complex as 
virtio-pci. But it doesn't mean there is no way for virtio-pci in Xen.

I think, this could be added in next steps. But the nearest target is 
virtio-mmio approach (of course if the community agrees on that).


>> requires
>> some implementation to forward guest MMIO access to a device model. And as
>> it
>> turned out the Xen on x86 contains most of the pieces to be able to use that
>> transport (via existing IOREQ concept). Julien has already done a big amount
>> of work in his PoC (xen/arm: Add support for Guest IO forwarding to a
>> device emulator).
>> Using that code as a base we managed to create a completely functional PoC
>> with DomU
>> running on virtio block device instead of a traditional Xen PV driver
>> without
>> modifications to DomU Linux. Our work is mostly about rebasing Julien's
>> code on the actual
>> codebase (Xen 4.14-rc4), various tweeks to be able to run emulator
>> (virtio-disk backend)
>> in other than Dom0 domain (in our system we have thin Dom0 and keep all
>> backends
>> in driver domain),
> How do you handle this use-case? Are you using grants in the VirtIO
> ring, or rather allowing the driver domain to map all the guest memory
> and then placing gfn on the ring like it's commonly done with VirtIO?

Second option. Xen grants are not used at all as well as event channel 
and Xenbus. That allows us to have guest

*unmodified* which one of the main goals. Yes, this may sound (or even 
sounds) non-secure, but backend which runs in driver domain is allowed 
to map all guest memory.

In current backend implementation a part of guest memory is mapped just 
to process guest request then unmapped back, there is no mappings in 
advance. The xenforeignmemory_map

call is used for that purpose. For experiment I tried to map all guest 
memory in advance and just calculated pointer at runtime. Of course that 
logic performed better.

I was thinking about guest static memory regions and forcing guest to 
allocate descriptors from them (in order not to map all guest memory, 
but a predefined region). But that implies modifying guest...


>
> Do you have any plans to try to upstream a modification to the VirtIO
> spec so that grants (ie: abstract references to memory addresses) can
> be used on the VirtIO ring?

But VirtIO spec hasn't been modified as well as VirtIO infrastructure in 
the guest. Nothing to upsteam)


>
>> misc fixes for our use-cases and tool support for the
>> configuration.
>> Unfortunately, Julien doesn’t have much time to allocate on the work
>> anymore,
>> so we would like to step in and continue.
>>
>> *A few word about the Xen code:*
>> You can find the whole Xen series at [5]. The patches are in RFC state
>> because
>> some actions in the series should be reconsidered and implemented properly.
>> Before submitting the final code for the review the first IOREQ patch
>> (which is quite
>> big) will be split into x86, Arm and common parts. Please note, x86 part
>> wasn’t
>> even build-tested so far and could be broken with that series. Also the
>> series probably
>> wants splitting into adding IOREQ on Arm (should be focused first) and
>> tools support
>> for the virtio-disk (which is going to be the first Virtio driver)
>> configuration before going
>> into the mailing list.
> Sending first a patch series to enable IOREQs on Arm seems perfectly
> fine, and it doesn't have to come with the VirtIO backend. In fact I
> would recommend that you send that ASAP, so that you don't spend time
> working on the backend that would likely need to be modified
> according to the review received on the IOREQ series.

Completely agree with you, I will send it after splitting IOREQ patch 
and performing some cleanup.

However, it is going to take some time to make it properly taking into 
the account

that personally I won't be able to test on x86.


>
>> What I would like to add here, the IOREQ feature on Arm could be used not
>> only
>> for implementing Virtio, but for other use-cases which require some
>> emulator entity
>> outside Xen such as custom PCI emulator (non-ECAM compatible) for example.
>>
>> *A few word about the backend(s):*
>> One of the main problems with Virtio in Xen on Arm is the absence of
>> “ready-to-use” and “out-of-Qemu” Virtio backends (I least am not aware of).
>> We managed to create virtio-disk backend based on demu [3] and kvmtool [4]
>> using
>> that series. It is worth mentioning that although Xenbus/Xenstore is not
>> supposed
>> to be used with native Virtio, that interface was chosen to just pass
>> configuration from toolstack
>> to the backend and notify it about creating/destroying Guest domain (I
>> think it is
> I would prefer if a single instance was launched to handle each
> backend, and that the configuration was passed on the command line.
> Killing the user-space backend from the toolstack is fine I think,
> there's no need to notify the backend using xenstore or any other
> out-of-band methods.
>
> xenstore has proven to be a bottleneck in terms of performance, and it
> would be better if we can avoid using it when possible, specially here
> that you have to do this from scratch anyway.

Let me elaborate a bit more on this.

In current backend implementation, the Xenstore is *not* used for 
communication between backend (VirtIO device) and frontend (VirtIO 
driver), frontend knows nothing about it.

Xenstore was chosen as an interface in order to be able to pass 
configuration from toolstack in Dom0 to backend which may reside in 
other than Dom0 domain (DomD in our case),

also looking into the Xenstore entries backend always knows when the 
intended guest is been created/destroyed.

I may mistake, but I don't think we can avoid using Xenstore (or other 
interface provided by toolstack) for the several reasons.

Besides a virtio-disk configuration (a disk to be assigned to the guest, 
R/O mode, etc), for each virtio-mmio device instance

a pair (mmio range + IRQ) are allocated by toolstack at the guest 
construction time and inserted into virtio-mmio device tree node

in the guest device tree. And for the backend to properly operate these 
variable parameters are also passed to the backend via Xenstore.

The other reasons are:

1. Automation. With current backend implementation we don't need to 
pause guest right after creating it, then go to the driver domain and 
spawn backend and

after that go back to the dom0 and unpause the guest.

2. Ability to detect when guest with involved frontend has gone away and 
properly release resource (guest destroy/reboot).

3. Ability to (re)connect to the newly created guest with involved 
frontend (guest create/reboot).

4. What is more that having Xenstore support the backend is able to 
detect the dom_id it runs into and the guest dom_id, there is no need 
pass them via command line.


I will be happy to explain in details after publishing backend code).


-- 
Regards,

Oleksandr Tyshchenko


