Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3301EE430
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 14:08:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgofG-0001Xq-ID; Thu, 04 Jun 2020 12:08:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uZ5H=7R=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jgofF-0001Xj-9s
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 12:08:05 +0000
X-Inumbo-ID: 0aa5d84c-a65c-11ea-ae6e-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0aa5d84c-a65c-11ea-ae6e-12813bfff9fa;
 Thu, 04 Jun 2020 12:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ToApL6M3YpuTxJGQ/fa/KnrLblFVeDhK9sd/egpbrx0=; b=4wnPiAeDjwGsorvFS7FkejL7XO
 qiyeY4lb5p/qnDwq9HeGS3DI+dmai0aAXP+bxkCzNq3ttIepjgKZqoS94Hvth4rZrMSbs3bau5+SL
 wLDHiyR3Cy4dNWmby9XxR/uyT0CJdh465OrByIk8EDDEKc85dsJyDUbwnTtDm7v1D4Ig=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jgofB-0003ma-FU; Thu, 04 Jun 2020 12:08:01 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jgofB-0003u2-8m; Thu, 04 Jun 2020 12:08:01 +0000
Subject: Re: [PATCH] xen/rpi4: implement watchdog-based reset
To: cminyard@mvista.com
References: <20200603223156.12767-1-sstabellini@kernel.org>
 <20200604001552.GC2903@minyard.net>
 <50ad4bca-5eb8-8db0-0aae-dc7febfdb56a@xen.org>
 <20200604115907.GD2903@minyard.net>
From: Julien Grall <julien@xen.org>
Message-ID: <14d94375-c895-a8ae-c083-59ff8296b308@xen.org>
Date: Thu, 4 Jun 2020 13:07:59 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200604115907.GD2903@minyard.net>
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 tamas@tklengyel.com, roman@zededa.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 04/06/2020 12:59, Corey Minyard wrote:
> On Thu, Jun 04, 2020 at 09:15:33AM +0100, Julien Grall wrote:
>> Hi,
>>
>> On 04/06/2020 01:15, Corey Minyard wrote:
>>> On Wed, Jun 03, 2020 at 03:31:56PM -0700, Stefano Stabellini wrote:
>>>> Touching the watchdog is required to be able to reboot the board.
>>>>
>>>> The implementation is based on
>>>> drivers/watchdog/bcm2835_wdt.c:__bcm2835_restart in Linux.
>>>
>>> Ah, I was looking at this just today, as it had been annoying me
>>> greatly.  This works for me, so:
>>>
>>> Tested-by: Corey Minyard <cminyard@mvista.com>
>>>
>>> However, I was wondering if it might be better to handle this by failing
>>> the operation in xen and passing it back to dom0 to do.  On the Pi you
>>> send a firmware message to reboot, and that seems like too much to do in
>>> Xen, but it would seem possible to send this back to dom0.
>> I don't think this is possible in the current setup. Xen will usually
>> restart the platform if Dom0 requested a clean reboot or crashed. So the
>> domain wouldn't be in state to service such call.
> 
> Ok, I hadn't looked at Xen yet, I didn't know how much shutdown of dom0
> happens on a reset.
> 
>>
>>> Just a
>>> thought, as it might be a more general fix for other devices in the same
>>> situation.
>>
>> What are the devices you have in mind?
> 
> Nothing in particular, but other systems might have the same issue.  I
> guess you have ACPI implemented on x86 already.  It just seemed that
> Linux already has to be able to do this, and passing the buck back there
> might be a more general solution.

I don't really see how you can make a generic solution here. Each 
devices may have a different way to act.

For anything related to power control, the right solution is to 
implement PSCI/SCMI in your firmware so you don't need to rely on Dom0 
(which may not exist) for such thing.

Cheers,

-- 
Julien Grall

