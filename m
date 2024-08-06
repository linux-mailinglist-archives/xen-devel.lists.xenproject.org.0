Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9861D948D74
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 13:09:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772815.1183257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbI3L-0000Sq-Jd; Tue, 06 Aug 2024 11:08:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772815.1183257; Tue, 06 Aug 2024 11:08:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbI3L-0000Qx-Gr; Tue, 06 Aug 2024 11:08:31 +0000
Received: by outflank-mailman (input) for mailman id 772815;
 Tue, 06 Aug 2024 11:08:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sbI3J-0000Qr-Oy
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 11:08:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sbI3J-0003y5-3W; Tue, 06 Aug 2024 11:08:29 +0000
Received: from [15.248.3.88] (helo=[10.24.67.24])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sbI3I-0000tR-T0; Tue, 06 Aug 2024 11:08:29 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=1bvXE5uRH/Dv/062MxORbx12HueYP6+rEdAcvS7ItMk=; b=bdqp/4Vk4tvRmrDtNmzFsDZuJl
	/jVdLAZAREEO5YCg94r1c7N7AcCZ3Ctqnlow68eL9D+shBtnLdYifNIcGo9aS5ggDpEr85eg27RbH
	bydljk1LhVE5tiuY3bkzDyBpFeaBdWuzXYgXlWnvkmpAAw+9y/hrssgjOvEYhKWmAt0s=;
Message-ID: <ff6a7077-efbb-4002-9426-a9f05760f8f8@xen.org>
Date: Tue, 6 Aug 2024 12:08:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: char: omap-uart: add "clock-hz" option
Content-Language: en-GB
To: Amneesh Singh <a-singh21@ti.com>
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20240719113313.145587-1-a-singh21@ti.com>
 <b7ef34fe-f6eb-45e8-8f6a-0e2c4bd0175b@xen.org>
 <njlq7laeswww46izwpkzuvnvu3lcycv7kc6dt2urbrpimj6uej@tzjuwwhwwqmp>
 <8c12dc98-bc9f-49bf-bc18-ddae99fa7312@xen.org>
 <csvohhbfi7ilqjzmozhb7u75jp7kfncpyj335hz5vksjw7lr46@57puayor4b4r>
From: Julien Grall <julien@xen.org>
In-Reply-To: <csvohhbfi7ilqjzmozhb7u75jp7kfncpyj335hz5vksjw7lr46@57puayor4b4r>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 06/08/2024 11:35, Amneesh Singh wrote:
> On 10:56-20240806, Julien Grall wrote:
>> On 06/08/2024 10:50, Amneesh Singh wrote:
>>> On 10:16-20240806, Julien Grall wrote:
>>>> Hi,
>>>>
>>>> On 19/07/2024 12:33, Amneesh Singh wrote:
>>>>> Quite a few TI K3 devices do not have clock-frequency specified in their
>>>>> respective UART nodes.
>>>>
>>>> Can you outline why fixing the device-tree is not solution?
>>> Because other frequencies, say 96MHz or 192 MHz are also valid inputs.
>>
>> Are you saying this is configurable by the user? Or do you mean the
>> firmware can configure it?
> u-boot or some other bootloader are free to configure it. And usually,
> linux's clock driver will pick it up using clk_get_rate (if not
> specified in the DT), I think. Now, in case we add the frequency to the
> DT, it may not match with the actual frequency configured before Xen
> initialisation. Since, there is no equivalent to clk_get_rate under Xen,
> and the fact I'm using imagebuilder, I found it easier to pass the
> frequency the way I did.

Thanks for the explanation. I haven't looked in details, but how 
difficult would it be to implement clk_get_rate() (at least just enough 
to work for the UART) in Xen?

>>>>
>>>>> However hard-coding the frequency is not a
>>>>    > solution as the function clock input can differ between SoCs.
>>>>
>>>> Can you provide some details how Linux is handling those SoCs?
>>> Yes, like omap-uart under xen, the 8250_omap driver also parses the DT,
>>> but unlike omap-uart, falls back to clk_get_rate() and if the value is
>>> still zero, it defaults to 48MHz.
>>
>> Thanks for the information. Then my next question is why Linux can get
>> away with a default value and not Xen?
> Sure why not? I guess, we can use a default value if everything fails
> but there should still be a way for the user to specify the frequency.

I think I am still missing something. Why would Xen allow the user to 
specify the clock speed if Linux doesn't? At least to me, it is more 
likely that a user would want to boot Linux on your HW than Xen...

> Of course, we can instead just force the user to change the DT slightly
> by just specifying the frequency. However, I feel it is easier to add it
> here, especially when there's already a method to pass these options via
> the command-line in place.
 > I believe, this is the best we can do with this.

The problem is the command line is OS/hypervisor specific. But the 
problem you describe doesn't seem Xen specific. This is where the DT is 
handy because you describe once and it can be used everywhere.

Overall, at the moment, I don't think the command line option is the 
right approach. If I am not mistaken, it would make Xen less 
user-friendly (compare to Linux) to boot on your HW as the user would 
need to specify the clockspeed on the command line. I think we should 
investigate other approaches such as implementing partially 
clk_get_rate() (if this is how Linux manage to retrieve the clock speed 
without any command line option).

Cheers,

-- 
Julien Grall


