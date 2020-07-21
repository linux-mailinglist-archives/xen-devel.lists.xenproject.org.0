Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A3F22821A
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 16:27:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxtEe-0003SK-HY; Tue, 21 Jul 2020 14:27:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Oq7=BA=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jxtEd-0003SF-Pk
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 14:27:11 +0000
X-Inumbo-ID: 437e9af6-cb5e-11ea-a0d8-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 437e9af6-cb5e-11ea-a0d8-12813bfff9fa;
 Tue, 21 Jul 2020 14:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=any1ZldPkLv8QiB89izz51569QuLfWLRrlaCbIsPb3I=; b=HLZrh25PcdjTCclsROzCEB07S/
 tmGNzj2TtCeLnvWy8BXdBHQTm/1Bj9F9JecuK4txWGsxgEyMYAaI97NUQq73Gequ5YhR2c5UfOLdk
 sbBPmprJ7+/KGgs2mv8AUdNBzPhil5S4ipFxdD36cnKli9bHZKCNnFSSkJs8YPiDcgdA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jxtEb-0008JF-RT; Tue, 21 Jul 2020 14:27:09 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jxtEb-0005AJ-Fq; Tue, 21 Jul 2020 14:27:09 +0000
Subject: Re: Virtio in Xen on Arm (based on IOREQ concept)
To: Oleksandr <olekstysh@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <CAPD2p-nthLq5NaU32u8pVaa-ub=a9-LOPenupntTYdS-cu31jQ@mail.gmail.com>
 <20200717150039.GV7191@Air-de-Roger>
 <8f4e0c0d-b3d4-9dd3-ce20-639539321968@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3dcab37d-0d60-f1cc-1d59-b5497f0fa95f@xen.org>
Date: Tue, 21 Jul 2020 15:27:07 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8f4e0c0d-b3d4-9dd3-ce20-639539321968@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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
Cc: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Artem Mygaiev <joculator@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 17/07/2020 19:34, Oleksandr wrote:
> 
> On 17.07.20 18:00, Roger Pau Monné wrote:
>>> requires
>>> some implementation to forward guest MMIO access to a device model. 
>>> And as
>>> it
>>> turned out the Xen on x86 contains most of the pieces to be able to 
>>> use that
>>> transport (via existing IOREQ concept). Julien has already done a big 
>>> amount
>>> of work in his PoC (xen/arm: Add support for Guest IO forwarding to a
>>> device emulator).
>>> Using that code as a base we managed to create a completely 
>>> functional PoC
>>> with DomU
>>> running on virtio block device instead of a traditional Xen PV driver
>>> without
>>> modifications to DomU Linux. Our work is mostly about rebasing Julien's
>>> code on the actual
>>> codebase (Xen 4.14-rc4), various tweeks to be able to run emulator
>>> (virtio-disk backend)
>>> in other than Dom0 domain (in our system we have thin Dom0 and keep all
>>> backends
>>> in driver domain),
>> How do you handle this use-case? Are you using grants in the VirtIO
>> ring, or rather allowing the driver domain to map all the guest memory
>> and then placing gfn on the ring like it's commonly done with VirtIO?
> 
> Second option. Xen grants are not used at all as well as event channel 
> and Xenbus. That allows us to have guest
> 
> *unmodified* which one of the main goals. Yes, this may sound (or even 
> sounds) non-secure, but backend which runs in driver domain is allowed 
> to map all guest memory.
> 
> In current backend implementation a part of guest memory is mapped just 
> to process guest request then unmapped back, there is no mappings in 
> advance. The xenforeignmemory_map
> 
> call is used for that purpose. For experiment I tried to map all guest 
> memory in advance and just calculated pointer at runtime. Of course that 
> logic performed better.

That works well for a PoC, however I am not sure you can rely on it long 
term as a guest is free to modify its memory layout. For instance, Linux 
may balloon in/out memory. You probably want to consider something 
similar to mapcache in QEMU.

On a similar topic, I am a bit surprised you didn't encounter memory 
exhaustion when trying to use virtio. Because on how Linux currently 
works (see XSA-300), the backend domain as to have a least as much RAM 
as the domain it serves. For instance, you have serve two domains with 
1GB of RAM each, then your backend would need at least 2GB + some for 
its own purpose.

This probably wants to be resolved by allowing foreign mapping to be 
"paging" out as you would for memory assigned to a userspace.

> I was thinking about guest static memory regions and forcing guest to 
> allocate descriptors from them (in order not to map all guest memory, 
> but a predefined region). But that implies modifying guest...

[...]

>>> misc fixes for our use-cases and tool support for the
>>> configuration.
>>> Unfortunately, Julien doesn’t have much time to allocate on the work
>>> anymore,
>>> so we would like to step in and continue.
>>>
>>> *A few word about the Xen code:*
>>> You can find the whole Xen series at [5]. The patches are in RFC state
>>> because
>>> some actions in the series should be reconsidered and implemented 
>>> properly.
>>> Before submitting the final code for the review the first IOREQ patch
>>> (which is quite
>>> big) will be split into x86, Arm and common parts. Please note, x86 part
>>> wasn’t
>>> even build-tested so far and could be broken with that series. Also the
>>> series probably
>>> wants splitting into adding IOREQ on Arm (should be focused first) and
>>> tools support
>>> for the virtio-disk (which is going to be the first Virtio driver)
>>> configuration before going
>>> into the mailing list.
>> Sending first a patch series to enable IOREQs on Arm seems perfectly
>> fine, and it doesn't have to come with the VirtIO backend. In fact I
>> would recommend that you send that ASAP, so that you don't spend time
>> working on the backend that would likely need to be modified
>> according to the review received on the IOREQ series.
> 
> Completely agree with you, I will send it after splitting IOREQ patch 
> and performing some cleanup.
> 
> However, it is going to take some time to make it properly taking into 
> the account
> 
> that personally I won't be able to test on x86.
I think other member of the community should be able to help here. 
However, nowadays testing Xen on x86 is pretty easy with QEMU :).

Cheers,

-- 
Julien Grall

