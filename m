Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1791F588886
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 10:15:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379642.613255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ9WC-0002rp-1W; Wed, 03 Aug 2022 08:14:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379642.613255; Wed, 03 Aug 2022 08:14:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ9WB-0002oP-Tv; Wed, 03 Aug 2022 08:14:15 +0000
Received: by outflank-mailman (input) for mailman id 379642;
 Wed, 03 Aug 2022 08:14:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oJ9W9-0002oJ-Pd
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 08:14:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oJ9W4-00037G-99; Wed, 03 Aug 2022 08:14:08 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.5.217]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oJ9W4-0006Xr-0g; Wed, 03 Aug 2022 08:14:08 +0000
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
	bh=Vuj37ngFxl78R9EVe5kuy/VeseUSZKlqnryuhI1bzFc=; b=tt2MONJ11EhYhJxv3m39rMqE0y
	QBjBstfANfAM6zYWTcjtGYawCe/UoGtDY2q4F0PTQvkfHV9kBlfACtfPrGAJNMn9NYYX0+ykGCxki
	yirbfXypEw05fn29gPwZiLCuzfgQxe2dp3outeArJ7NdLS64aNJ9owbkU+HrtY9+AhyA=;
Message-ID: <19295a89-8d89-973e-defe-2a0b063cbde4@xen.org>
Date: Wed, 3 Aug 2022 09:14:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [PATCH v2 1/2] xen: add late init call in start_xen
Content-Language: en-US
To: boyoun.park@samsung.com, Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "wl@xen.org" <wl@xen.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Chungwoo Park <cww.park@samsung.com>, Gang Li <gang30.li@samsung.com>,
 Lei Wang <lei19.wang@samsung.com>, SoungKwan Kimn <sk.kimn@samsung.com>,
 DongJin PARK <djpax.park@samsung.com>, Joonjae Lee <joonjae7.lee@samsung.com>
References: <alpine.DEB.2.22.394.2207291447080.4648@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2207281251160.4648@ubuntu-linux-20-04-desktop>
 <97499212.9948800.1659000157467@mail-kr2-3>
 <88025800-66e2-4fb4-facf-5989e75ba08f@suse.com>
 <20220729110313epcms2p5f9b24d5a65b98c220a6e99675298560f@epcms2p5>
 <CGME20220728092237epcms2p53821bba31388763f45b5204d56520c20@epcms2p8>
 <1470588578.9967963.1659494457934@mail-kr2-1>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1470588578.9967963.1659494457934@mail-kr2-1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Boyoun,

On 03/08/2022 03:40, Boyoun Park wrote:
> Thank you for your reply. I will seriously consider contributing
> platform specific drivers. Currently, I make a sample usage by applying this
> to a function in start_xen. I think functions in start_xen could be reduced
> for readability and understandability.
> These patches are just one of my suggestion. So feel free to reject it.

Please avoid top-posting. Also, I would suggest to read through [1] to 
check how patch series should be submitted. For instance...

> 
> On Sat, 30 Jul 2022, Stefano Stabellini wrote:
>> On Fri, 29 Jul 2022, Boyoun Park wrote:
>>>   I really appreciate all the comments and reviews.
>>>   I understand that it is hard to add this patch without any usage.
>>>   
>>>   On Fri, 29 Jul 2022, Stefano Stabellini:
>>>>   On Thu, 28 Jul 2022, Jan Beulich wrote:
>>>>>   On 28.07.2022 11:22, Boyoun Park wrote:
>>>>>>   Subject: [PATCH v1] xen: add late init call in start_xen
>>>>>>   
>>>>>>   This patch added late_initcall section in init.data.
>>>>>>   
>>>>>>   The late initcall would be called after initcall
>>>>>>   
>>>>>>   in the start_xen function.
>>>>>>   
>>>>>>   Some initializing works on priority should be run
>>>>>>   
>>>>>>   in do_initcalls and other non-prioritized works
>>>>>>   
>>>>>>   would be run in do_late_initcalls.
>>>>>>   
>>>>>>   To call some functions by late_initcall,
>>>>>>   
>>>>>>   then it is possible by using
>>>>>>   
>>>>>>   __late_initcall(/*Function Name*/);
>>>>>>   
>>>>>>   Signed-off-by: Boyoun Park <boyoun.park@samsung.com>
>>>>>   
>>>>>   So I could imagine this patch to be in a series where a subsequent
>>>>>   patch then adds an actual use of the new functionality. Without
>>>>>   that what you're proposing is to add dead code.
>>>>   
>>>>   Yeah, I think it would be cool to have late initcalls but it makes sense
>>>>   to add them if we have someone that makes use of them.
>>>   
>>>   I totally agree with your comments. Some drivers that I'm developing now and use this function are specific to my hardware environment.
>>>   Thus, it seems difficult to arrange them in the near future.
>>>   I will update patches if I can suggest an actual use.
>>
>> I totally understand custom setups and non-upstreamable configurations
>> and I have certainly some of them myself.
>>
>> However, I just wanted to let you know that we are fine with accepting
>> platform specific drivers in Xen where it makes sense, for instance:
>>
>> - Renesas IPMMU-VMSA found in R-Car Gen3/Gen4 SoCs (an IOMMU driver)
>> xen/drivers/passthrough/arm/ipmmu-vmsa.c
>>
>> - Xilinx EEMI firmware interface "mediator" in Xen (power management)
>> xen/arch/arm/platforms/xilinx-zynqmp-eemi.c
> 
> From: Boyoun Park <boyoun.park@samsung.com>
> Date: Tue, 15 Mar 2022 12:57:59 +0900
> Subject: [PATCH v2 1/2] xen: add late init call in start_xen

A new version of a series is usually sent as a separate thread rather 
than in-reply to the previous version.

Furthermore, as there is 2 patches, you need to provide a cover letter 
(even it doesn't contain much).

Lastly (process wise), please provide a list of changes made in v2. I 
tend to prefer per-patch changelog, but one in the cover letter would 
also work.

> 
> This patch added late_initcall section in init.data.
> The late initcall would be called after initcall
> in the start_xen function.

I think this is a bit too vague. AFAIU, you want late_initcall() to 
happen *after* all the domains have been created but *before* they are 
unpaused. Is that correct?

 From the previous discussion, I saw you said you have drivers needing 
to call initlate. Could you briefly explain why they can't be called in 
initcall?

> 
> Some initializing works on priority should be run
> in do_initcalls and other non-prioritized works
> would be run in do_late_initcalls.

IIUC, you are saying that do_late_initcalls() was introduced for 
prioritization purpose. But then, there are also a difference in 
behavior (initcalls happens before creating the domains whereas late 
happens after).

Therefore, if the priority is the only reasons, then I think we should 
introduce priority within the initcalls.

> 
> To call some functions by late_initcall,
> then it is possible by using
> __late_initcall(/*Function Name*/);
> 
> Signed-off-by: Boyoun Park <boyoun.park@samsung.com>
> ---
>   xen/arch/arm/setup.c   | 2 ++
>   xen/arch/arm/xen.lds.S | 2 ++
>   xen/arch/x86/setup.c   | 2 ++
>   xen/arch/x86/xen.lds.S | 2 ++
>   xen/common/kernel.c    | 9 ++++++++-
>   xen/include/xen/init.h | 3 +++
>   6 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 85ff956..332a207 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -1063,6 +1063,8 @@ void __init start_xen(unsigned long boot_phys_offset,
>       /* Hide UART from DOM0 if we're using it */
>       serial_endboot();
>   
> +    do_late_initcalls();
> +

[...]


> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index f08b07b..5dc6654 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1952,6 +1952,8 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>   
>       setup_io_bitmap(dom0);
>   
> +    do_late_initcalls();
> +

It would be preferable if the call is done roughly at the same place on 
all architecture. So if it easier for a developer to know when this will 
be called (e.g. just after serial_endboot()).

If you need to call the function at the different place, then I think 
this ought to be explained.

Cheers,

[1] https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches

-- 
Julien Grall

