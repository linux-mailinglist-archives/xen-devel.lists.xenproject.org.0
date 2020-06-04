Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAEC1EE8A9
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 18:36:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgsr8-0003oF-Dt; Thu, 04 Jun 2020 16:36:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uZ5H=7R=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jgsr6-0003oA-Iw
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 16:36:36 +0000
X-Inumbo-ID: 8e76ea6a-a681-11ea-aec2-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8e76ea6a-a681-11ea-aec2-12813bfff9fa;
 Thu, 04 Jun 2020 16:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3GYK2KCQ3WUbCDYvaFcSHDf0670NtWTEbYye5IIai8Q=; b=CwQ0ewc0ZgH+piIPvFd9yekR4S
 VkSqqIZCzUi7FEpor5rt6prHFydBmEl5URRVxK3WUB5qFoi6Xxq4h3j9cPAGMFIdJO2jhzj4IeHjW
 +3RjsryXtDwufZYC4Byb3An6+x/u+20v2fIKOKani0E2b04q2kU3bUgX33C8kIvLNbw8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jgsr1-0001Ru-9c; Thu, 04 Jun 2020 16:36:31 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jgsr1-0003QA-37; Thu, 04 Jun 2020 16:36:31 +0000
Subject: Re: [PATCH] xen/rpi4: implement watchdog-based reset
To: Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
References: <20200603223156.12767-1-sstabellini@kernel.org>
 <3b3fa1cd-e50a-66f7-f5ac-eebc6f1d0953@xen.org>
 <24026a53-044b-843c-e548-22bb8325e5a7@arm.com>
 <alpine.DEB.2.21.2006040916370.6774@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <eed1064a-da3b-7c7c-7a1a-2e339db089cf@xen.org>
Date: Thu, 4 Jun 2020 17:36:29 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2006040916370.6774@sstabellini-ThinkPad-T480s>
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
Cc: xen-devel@lists.xenproject.org, roman@zededa.com, tamas@tklengyel.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, cminyard@mvista.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 04/06/2020 17:24, Stefano Stabellini wrote:
> On Thu, 4 Jun 2020, André Przywara wrote:
>> On 04/06/2020 09:48, Julien Grall wrote:
>>
>> Hi,
>>
>>> On 03/06/2020 23:31, Stefano Stabellini wrote:
>>>> Touching the watchdog is required to be able to reboot the board.
>>>
>>> In general the preferred method is PSCI. Does it mean RPI 4 doesn't
>>> support PSCI at all?
>>
>> There is mainline Trusted Firmware (TF-A) support for the RPi4 for a few
>> months now, which includes proper PSCI support (both for SMP bringup and
>> system reset/shutdown). At least that should work, if not, it's a bug.
>> An EDK-2 build for RPi4 bundles TF-A automatically, but you can use TF-A
>> without it, with or without U-Boot: It works as a drop-in replacement
>> for armstub.bin. Instruction for building it (one line!) are here:
>> https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/tree/docs/plat/rpi4.rst
>>
>>>>
>>>> The implementation is based on
>>>> drivers/watchdog/bcm2835_wdt.c:__bcm2835_restart in Linux.
>>>
>>> Can you give the baseline? This would allow us to track an issue and
>>> port them.
>>
>> Given the above I don't think it's a good idea to add extra platform
>> specific code to Xen.
> 
> The RPi4, at least the one I have, doesn't come with any TF, and it
> doesn't come with PSCI in device tree. As a user, I would rather have
> this patch (even downstream) than having to introduce TF in my build and
> deployment just to be able to reboot.

So what are you using for the firmware? Do you boot Xen directly?

Cheers,

-- 
Julien Grall

