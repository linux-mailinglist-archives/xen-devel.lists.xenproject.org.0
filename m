Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFDF6068A3
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 21:08:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427138.675950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olatG-00016D-W1; Thu, 20 Oct 2022 19:07:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427138.675950; Thu, 20 Oct 2022 19:07:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olatG-00013J-TD; Thu, 20 Oct 2022 19:07:38 +0000
Received: by outflank-mailman (input) for mailman id 427138;
 Thu, 20 Oct 2022 19:07:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1olatF-00013D-07
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 19:07:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1olatE-0007Av-HD; Thu, 20 Oct 2022 19:07:36 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1olatE-00024q-9V; Thu, 20 Oct 2022 19:07:36 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=AhvJHTyLy5bGSQTzLe5x1QbuD7Qhlb+kNZHuN+b6JO4=; b=P/RgjfsLrE8+9EeYK/ijEpsL75
	FO2xvdJt70A4RIxMXbYnm1fH4BELxwYxn9pW7C1X75wtETngyQwgtbIl6YEOlXDtdfrLwA4/uocgN
	SJ3I/V7euK/tRZdJzhCC3R0AcnisF91GZ/G8S6CcDoBlKXb6DaVWKlVslwIMze7HttvY=;
Message-ID: <810d2df8-baf8-370d-a7b6-0e5ceb74a986@xen.org>
Date: Thu, 20 Oct 2022 20:07:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
To: Stefano Stabellini <sstabellini@kernel.org>, Leo Yan <leo.yan@linaro.org>
Cc: Xen Develop <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Kasper Ornstein Mecklenburg <Kasper.OrnsteinMecklenburg@arm.com>,
 jgross@suse.com, oleksandr_tyshchenko@epam.com, boris.ostrovsky@oracle.com,
 wei.liu@kernel.org, paul@xen.org
References: <Y0QMQuAUKKSgrAAV@leoy-yangtze.lan>
 <alpine.DEB.2.22.394.2210101621480.3690179@ubuntu-linux-20-04-desktop>
 <Y0VbQ3esM8gucmqQ@leoy-yangtze.lan>
 <alpine.DEB.2.22.394.2210111434240.3690179@ubuntu-linux-20-04-desktop>
 <Y00/SW5Ro+SlhoBU@leoy-yangtze.lan>
 <alpine.DEB.2.22.394.2210171638080.4587@ubuntu-linux-20-04-desktop>
 <Y05w36OAVyDJwCCr@leoy-yangtze.lan>
 <alpine.DEB.2.22.394.2210181253260.4587@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
Subject: Re: Issue: Networking performance in Xen VM on Arm64
In-Reply-To: <alpine.DEB.2.22.394.2210181253260.4587@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 18/10/2022 20:54, Stefano Stabellini wrote:
> On Tue, 18 Oct 2022, Leo Yan wrote:
>> On Mon, Oct 17, 2022 at 04:50:05PM -0700, Stefano Stabellini wrote:
>>
>> [...]
>>
>>>> Which means it takes 543us to let Dom0 to receive the notification.
>>>> You could see DomU runs in CPU3 and Dom0 runs on CPU13, there should
>>>> not have contention for CPU resources.  Seems to me, it's likely Xen
>>>> hypervisor takes long time to deliver the interrupt, note, it's not
>>>> take so long time for every skb transferring, sometimes the time for
>>>> response a notification is short (about ~10us).
>>>
>>> Good find. I think this is worth investigating further. Do you have
>>> vwfi=native in your Xen command line as well?
>>
>> Yes, I have added "sched=null" and "vwfi=native" into Xen options:
>>
>> options=noreboot dom0_mem=4096M bootscrub=0 iommu=on loglvl=error guest_loglvl=error sched=null vwfi=native
>>
>>> After that, I would add printk also in Xen with the timestamp. The event
>>> channel notification code path is the following:
>>>
>>> # domU side
>>> xen/arch/arm/vgic-v2.c:vgic_v2_to_sgi
>>> xen/arch/arm/vgic.c:vgic_to_sgi
>>> xen/arch/arm/vgic.c:vgic_inject_irq
>>> xen/arch/arm/vgic.c:vcpu_kick
>>> xen/arch/arm/gic-v2.c:gicv2_send_SGI
>>>
>>> # dom0 side
>>> xen/arch/arm/gic.c:do_sgi
>>> xen/arch/arm/traps.c:leave_hypervisor_to_guest
>>>
>>> It would be good to understand why sometimes it takes ~10us and some
>>> other times it takes ~540us
>>
>> Thanks a lot for detailed info.
>>
>> Just note, in my platform DomU enables GICv3 driver rather than GICv2.
>> This would be a bit different in the Xen code.  But it should be easy
>> for me to map to vgic-v3 files.
>>
>> I have a question for how to trace Xen system.  Outputting chars to UART
>> is time costy (usually it's millisecond level), it is not friendly to
>> use console for debugging performance issue.  I searched a bit, either
>> "xl dmesg" or xentrace can be used for capturing trace logs, one thing
>> I am not certain is if we can save Xen logs only into log buffer and
>> doesn't output to UART, so that afterwards we can use "xl dmesg" to
>> capture the logs.  Could anyone confirm for this is correct usage with
>> "xl dmesg" or I should use xentrace for this case?
> 
> I am not super familiar about this. But if you take away the console
> entirely from Xen and give it to dom0 only (no dtuart command line
> option to Xen), you should get the behavior you described:
> - no console output because Xen has no console
> - xl dmesg should still work
You are right, xl dmesg will still work. The console is built using a 
ring so if you are using "xl dmesg" you will only get the latest log in 
the ring.

xenconsoled has an option to save the hypervisor log in 
/var/log/xen/hypervisor.log (default path) if you request to dump them. 
This is an option at startup and can be set in the init.d/systemd 
configuration for Xen (see XENCONSOLED_TRACE).

That said, xentrace is better suited if you are looking for low overhead 
tracing. The console is not directly involved in the process and you can 
already benefits from the trace point sprinkled in Xen code (such as the 
scheduling).

Cheers,

-- 
Julien Grall

