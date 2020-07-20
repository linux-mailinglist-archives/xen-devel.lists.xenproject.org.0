Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B05C225BE3
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 11:41:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxSHu-0006Ai-EU; Mon, 20 Jul 2020 09:40:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Eely=A7=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jxSHt-0006AZ-0p
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 09:40:45 +0000
X-Inumbo-ID: 14e0ce7c-ca6d-11ea-9f74-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 14e0ce7c-ca6d-11ea-9f74-12813bfff9fa;
 Mon, 20 Jul 2020 09:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7jekAShMJES6zG0w+MwjXR5yipns1iTsnrBv9YJulBY=; b=2S36o/82rdqdAQkC2GUmoowq2T
 RTUVseoPXt8k4laC8e8yC6bKY9b8T/4eBRtD/6uzMzs2SO69RoYezYEu20fchy+R42/VBp608H8cg
 dimP44SIuGL3nl3W0SoFFNIXflnJb7fKCL00/5UJjxyXEqyXoDi/q9DGFXQfUhqCoo40=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jxSHq-0001oO-HZ; Mon, 20 Jul 2020 09:40:42 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jxSHq-0007kB-Al; Mon, 20 Jul 2020 09:40:42 +0000
Subject: Re: Virtio in Xen on Arm (based on IOREQ concept)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Oleksandr <olekstysh@gmail.com>
References: <CAPD2p-nthLq5NaU32u8pVaa-ub=a9-LOPenupntTYdS-cu31jQ@mail.gmail.com>
 <20200717150039.GV7191@Air-de-Roger>
 <8f4e0c0d-b3d4-9dd3-ce20-639539321968@gmail.com>
 <20200720091722.GF7191@Air-de-Roger>
From: Julien Grall <julien@xen.org>
Message-ID: <10eaec62-2c48-52ae-d113-1681c87e3d59@xen.org>
Date: Mon, 20 Jul 2020 10:40:40 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200720091722.GF7191@Air-de-Roger>
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



On 20/07/2020 10:17, Roger Pau Monné wrote:
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
>>
>> Second option. Xen grants are not used at all as well as event channel and
>> Xenbus. That allows us to have guest
>>
>> *unmodified* which one of the main goals. Yes, this may sound (or even
>> sounds) non-secure, but backend which runs in driver domain is allowed to
>> map all guest memory.
> 
> Supporting unmodified guests is certainly a fine goal, but I don't
> think it's incompatible with also trying to expand the spec in
> parallel in order to support grants in a negotiated way (see below).
> 
> That way you could (long term) regain some of the lost security.

FWIW, Xen is not the only hypervisor/community interested in creating 
"less privileged" backend.

> 
>>> Do you have any plans to try to upstream a modification to the VirtIO
>>> spec so that grants (ie: abstract references to memory addresses) can
>>> be used on the VirtIO ring?
>>
>> But VirtIO spec hasn't been modified as well as VirtIO infrastructure in the
>> guest. Nothing to upsteam)
> 
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
The problem is not really the specification but the adoption in the 
ecosystem. A protocol based on grant-tables would mostly only be used by 
Xen therefore:
    - It may be difficult to convince a proprietary OS vendor to invest 
resource on implementing the protocol
    - It would be more difficult to move in/out of Xen ecosystem.

Both, may slow the adoption of Xen in some areas.

If one is interested in security, then it would be better to work with 
the other interested parties. I think it would be possible to use a 
virtual IOMMU for this purpose.

Cheers,

-- 
Julien Grall

