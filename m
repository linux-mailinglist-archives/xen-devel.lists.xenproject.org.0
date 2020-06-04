Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C8F1EE94C
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 19:19:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgtWT-0008Ok-4N; Thu, 04 Jun 2020 17:19:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uZ5H=7R=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jgtWQ-0008OC-Sz
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 17:19:18 +0000
X-Inumbo-ID: 85998bfe-a687-11ea-81bc-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 85998bfe-a687-11ea-81bc-bc764e2007e4;
 Thu, 04 Jun 2020 17:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gyUeud3LAHOQgArjc8k9cmbOBFeQ4cDOX7SmrC9NY90=; b=RupD+k6Ldk8z1x8bgfjerbCVXq
 lgWAF8lhO2wE/17bNw6yv+JuQ87nFUJ+SAyrBBjmNp/pAaFI05VOazcyMbtt82Qexs9gYmvW+JfcK
 K4KHNX0ouJSpFFXgHhoLFaIq/HvcSkgjOtGK0vfupgnBMYHL8QMR3mK14COt9VZCwMbg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jgtWN-0002OE-Qk; Thu, 04 Jun 2020 17:19:15 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jgtWN-0005bf-It; Thu, 04 Jun 2020 17:19:15 +0000
Subject: Re: [PATCH] xen/rpi4: implement watchdog-based reset
To: Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
References: <20200603223156.12767-1-sstabellini@kernel.org>
 <3b3fa1cd-e50a-66f7-f5ac-eebc6f1d0953@xen.org>
 <24026a53-044b-843c-e548-22bb8325e5a7@arm.com>
 <alpine.DEB.2.21.2006040916370.6774@sstabellini-ThinkPad-T480s>
 <fb58e72b-2731-9d1b-5fb1-1fc14e3ef31f@arm.com>
 <alpine.DEB.2.21.2006040940140.6774@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <d0e9dec8-40c6-13c3-724f-aa05e1ec3063@xen.org>
Date: Thu, 4 Jun 2020 18:19:12 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2006040940140.6774@sstabellini-ThinkPad-T480s>
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



On 04/06/2020 17:46, Stefano Stabellini wrote:
> On Thu, 4 Jun 2020, André Przywara wrote:
>> On 04/06/2020 17:24, Stefano Stabellini wrote:
>>> On Thu, 4 Jun 2020, André Przywara wrote:
>>>> On 04/06/2020 09:48, Julien Grall wrote:
>>>>
>>>> Hi,
>>>>
>>>>> On 03/06/2020 23:31, Stefano Stabellini wrote:
>>>>>> Touching the watchdog is required to be able to reboot the board.
>>>>>
>>>>> In general the preferred method is PSCI. Does it mean RPI 4 doesn't
>>>>> support PSCI at all?
>>>>
>>>> There is mainline Trusted Firmware (TF-A) support for the RPi4 for a few
>>>> months now, which includes proper PSCI support (both for SMP bringup and
>>>> system reset/shutdown). At least that should work, if not, it's a bug.
>>>> An EDK-2 build for RPi4 bundles TF-A automatically, but you can use TF-A
>>>> without it, with or without U-Boot: It works as a drop-in replacement
>>>> for armstub.bin. Instruction for building it (one line!) are here:
>>>> https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/tree/docs/plat/rpi4.rst
>>>>
>>>>>>
>>>>>> The implementation is based on
>>>>>> drivers/watchdog/bcm2835_wdt.c:__bcm2835_restart in Linux.
>>>>>
>>>>> Can you give the baseline? This would allow us to track an issue and
>>>>> port them.
>>>>
>>>> Given the above I don't think it's a good idea to add extra platform
>>>> specific code to Xen.
>>>
>>> The RPi4, at least the one I have, doesn't come with any TF, and it
>>
>> My RPi4 didn't come with anything, actually ;-) It's just a matter of
>> what you put in the uSD card slot.
>>
>>> doesn't come with PSCI in device tree.
>>
>> TF-A patches the PSCI nodes in:
>> https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/commit/plat/rpi/rpi4?id=f67fa69cb6937a7fc559bbec4a7acce5edefa888
>>
>>> As a user, I would rather have
>>> this patch (even downstream) than having to introduce TF in my build and
>>> deployment just to be able to reboot.
>>
>> I get your point, but would rather put more pressure on people using
>> TF-A. After all you run without CPU hotplug, A72 errata workarounds and
>> without Spectre/Meltdown fixes. What was the IP address of your board
>> again? ;-)
> 
> Please send a pull request to remove __bcm2835_restart from the Linux
> kernel, once it is removed from there I'd be happy to take it away from
> Xen too ;-)

Xen is not a slave of Linux. We make our own informed decision ;).

> 
> I know I am being cheeky but we have enough battles to fight and enough
> problems with Xen -- I don't think we should use the hypervisor as a
> leverage to get people to use or upgrade TF. We just need to get good
> functionalities to our users with the less amount of friction possible.

Well it is nice to have functionality but you also need to have Xen 
running reliably and safely. No-one wants to drive in car with no brake 
on a windy road. Or maybe I am wrong? ;)

> 
> Everything you mentioned are good reason to use TF, and this patch does
> not take anything away from it. My suggestion would be to work with
> raspberrypi.org to have TF installed by default by the 	.

We actually did use the hypervisor as a leverage in the past. A pretty 
good example is RPI 3.

Anyway, the patch is pretty simple and limited to the platform. So I 
would be inclined to accept it.

Although this is just sweeping stability concern under the carpet and 
hoping for the best. What are the odds this is going to be used in 
production like that?

Cheers,

-- 
Julien Grall

