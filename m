Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BE52481EF
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 11:32:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7xxn-00007T-KZ; Tue, 18 Aug 2020 09:31:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ffgU=B4=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k7xxl-00006j-Kl
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 09:31:25 +0000
X-Inumbo-ID: 8854e788-4107-4852-9d57-55d0a790bbbe
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8854e788-4107-4852-9d57-55d0a790bbbe;
 Tue, 18 Aug 2020 09:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=3HDzEMNbrHFhIz4PlVc8IMLSJPOEwzu1XVP/FqjI4Y8=; b=s/YikJBEYUPmVS6NZE2ZFJAg1l
 d7CVnkesIoy5zKJF9NHAqBIQeFmBNXRpKtHJ23nmxS/jBwu66P6E04fpRQDCIZxGhYpUsXTvj1PHn
 usr7ku1clzoqcw0wNA5JP2vZRKTXBYIqCA30QJZI2nYfStKzt088u+o348htdjXW9qlE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k7xxh-0008AY-OT; Tue, 18 Aug 2020 09:31:21 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k7xxh-0000V6-FV; Tue, 18 Aug 2020 09:31:21 +0000
Subject: Re: [RFC PATCH V1 05/12] hvm/dm: Introduce
 xendevicemodel_set_irq_level DM op
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien.grall.oss@gmail.com>, Jan Beulich
 <jbeulich@suse.com>, Oleksandr Tyshchenko <olekstysh@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-6-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2008041358150.5748@sstabellini-ThinkPad-T480s>
 <00e261e0-295a-9cd8-ed11-7e3801a4eb58@xen.org>
 <alpine.DEB.2.21.2008050943300.5748@sstabellini-ThinkPad-T480s>
 <92e2b136-8468-2877-0e8c-c13ff2a0a1fb@xen.org>
 <alpine.DEB.2.21.2008061422300.16004@sstabellini-ThinkPad-T480s>
 <d8aa0f36-d3c4-011a-9ec1-32c1e3118112@suse.com>
 <alpine.DEB.2.21.2008071253520.16004@sstabellini-ThinkPad-T480s>
 <CAJ=z9a3ngzDS6Fu5DwdRSzWaMASPgp3cZLnpazMQzUbH-9_EEw@mail.gmail.com>
 <alpine.DEB.2.21.2008101142500.16004@sstabellini-ThinkPad-T480s>
 <97b477a9-3945-9c5d-671d-ab5cbb2d0468@xen.org>
 <alpine.DEB.2.21.2008111521050.15669@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <dbbf27bc-7ae0-9e25-cc30-2adb3ba26355@xen.org>
Date: Tue, 18 Aug 2020 10:31:18 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2008111521050.15669@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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

Hi Stefano,

On 11/08/2020 23:48, Stefano Stabellini wrote:
> On Tue, 11 Aug 2020, Julien Grall wrote:
>>>   I vaguely
>>> recall a bug 10+ years ago about this with QEMU on x86 and a line that
>>> could be both active-high and active-low. So QEMU would raise the
>>> interrupt but Xen would actually think that QEMU stopped the interrupt.
>>>
>>> To do this right, we would have to introduce an interface between Xen
>>> and QEMU to propagate the trigger type. Xen would have to tell QEMU when
>>> the guest changed the configuration. That would work, but it would be
>>> better if we can figure out a way to do without it to reduce complexity.
>> Per above, I don't think this is necessary.
>>
>>>
>>> Instead, given that QEMU and other emulators don't actually care about
>>> active-high or active-low, if we have a Xen interface that just says
>>> "fire the interrupt" we get away from this kind of troubles. It would
>>> also be more efficient because the total number of hypercalls required
>>> would be lower.
>>
>> I read "fire interrupt" the interrupt as "Please generate an interrupt once".
>> Is it what you definition you expect?
> 
> Yes, that is the idea. It would have to take into account the edge/level
> semantic difference: level would have "start it" and a "stop it".

I am still struggling to see how this can work:
     - At the moment, QEMU is only providing us the line state. How can 
we deduce the type of the interrupt? Would it mean a major modification 
of the QEMU API?
     - Can you provide a rough sketch how this could be implemented in Xen?

Cheers,

-- 
Julien Grall

