Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 035F38A4E0B
	for <lists+xen-devel@lfdr.de>; Mon, 15 Apr 2024 13:49:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706101.1103150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwKpe-0007oo-4m; Mon, 15 Apr 2024 11:49:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706101.1103150; Mon, 15 Apr 2024 11:49:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwKpe-0007mN-1Q; Mon, 15 Apr 2024 11:49:06 +0000
Received: by outflank-mailman (input) for mailman id 706101;
 Mon, 15 Apr 2024 11:49:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rwKpc-0007mH-W0
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2024 11:49:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rwKpY-00039C-ES; Mon, 15 Apr 2024 11:49:00 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rwKpY-0003Ua-7c; Mon, 15 Apr 2024 11:49:00 +0000
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
	bh=oIaDg+t9CGO99Gtq6RLzV8jM0FVTV6QbDygYW+3nI2U=; b=c0UdKGDwx6ZnsIUhn10kZ/r40p
	wO+1hDnxRccDR/x6mGVhE5kLVDLXCzQlKp7enkqUX6lz3KOU4lM1Agz724a0xl3cLLe4MVlmf+pPe
	GOeGtLqrHwo48JPlpw4qjSjX2O4v5K5CQnPovfAk/JTuakTWhH3e0VeepwDskhEi4I5A=;
Message-ID: <1272bb77-8a93-4ca2-af0d-4c1c36729307@xen.org>
Date: Mon, 15 Apr 2024 12:48:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] xen/arm: Add imx8q{m,x} platform glue
Content-Language: en-GB
To: John Ernberg <john.ernberg@actia.se>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "conduct@xenproject.org" <conduct@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Peng Fan <peng.fan@nxp.com>, Jonas Blixt <jonas.blixt@actia.se>
References: <20240408161129.900347-1-john.ernberg@actia.se>
 <20240408161129.900347-2-john.ernberg@actia.se>
 <084b9ed5-1585-4802-b504-6ccd2f262542@xen.org>
 <69dcd768-74b8-4033-8ab3-77848d6774dc@citrix.com>
 <4b39f4fa-246d-479e-ab76-ff234b641703@xen.org>
 <e3785d8a-9b16-4b74-9453-b0166bdbb171@actia.se>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e3785d8a-9b16-4b74-9453-b0166bdbb171@actia.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi John,

On 15/04/2024 12:17, John Ernberg wrote:
> Hi Julien,
> 
> On 4/15/24 1:03 PM, Julien Grall wrote:
>>
>>
>> On 15/04/2024 11:50, Andrew Cooper wrote:
>>> On 15/04/2024 11:25 am, Julien Grall wrote:
>>>> Hi John,
>>>>
>>>> I saw this patch was committed. I have one question this may require
>>>> some adjustment.
>>>>
>>>> On 08/04/2024 17:11, John Ernberg wrote:
>>>>> ---
>>>>>     xen/arch/arm/platforms/Makefile |   1 +
>>>>>     xen/arch/arm/platforms/imx8qm.c | 139
>>>>> ++++++++++++++++++++++++++++++++
>>>>>     2 files changed, 140 insertions(+)
>>>>>     create mode 100644 xen/arch/arm/platforms/imx8qm.c
>>>>>
>>>>> diff --git a/xen/arch/arm/platforms/Makefile
>>>>> b/xen/arch/arm/platforms/Makefile
>>>>> index 8632f4115f..bec6e55d1f 100644
>>>>> --- a/xen/arch/arm/platforms/Makefile
>>>>> +++ b/xen/arch/arm/platforms/Makefile
>>>>> @@ -9,5 +9,6 @@ obj-$(CONFIG_ALL_PLAT)   += sunxi.o
>>>>>     obj-$(CONFIG_ALL64_PLAT) += thunderx.o
>>>>>     obj-$(CONFIG_ALL64_PLAT) += xgene-storm.o
>>>>>     obj-$(CONFIG_ALL64_PLAT) += brcm-raspberry-pi.o
>>>>> +obj-$(CONFIG_ALL64_PLAT) += imx8qm.o
>>>>>     obj-$(CONFIG_MPSOC_PLATFORM)  += xilinx-zynqmp.o
>>>>>     obj-$(CONFIG_MPSOC_PLATFORM)  += xilinx-zynqmp-eemi.o
>>>>> diff --git a/xen/arch/arm/platforms/imx8qm.c
>>>>> b/xen/arch/arm/platforms/imx8qm.c
>>>>> new file mode 100644
>>>>> index 0000000000..3600a073e8
>>>>> --- /dev/null
>>>>> +++ b/xen/arch/arm/platforms/imx8qm.c
>>>>> @@ -0,0 +1,139 @@
>>>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>>>
>>>> The majority of Xen code is using GPL-2.0-only. In the early days for
>>>> Xen on Arm we started to use GPLv2+ which I consider it was a mistake.
>>>> Unfortunately this started to spread as people copied/pasted the same
>>>> copyright headers.
>>>>
>>>> So can you confirm whether you intended to use GPL-2.0+? If not would
>>>> you be able to send a patch to adjust it? (Better to it before there
>>>> are more modifications).
>>>
>>> Julien: I've called you out multiple times before.
>>
>> And there are multiple thread explaining why I am requesting if we can
>> use GPLv2-only. In fact from CONTRIBUTING:
>>
>> The recommended license of a directory will depend on the COPYING file.
>> If the new file is using a different license, this should be highlighted
>> and discussed in the commit message or cover letter introducing the
>> file.
>>
> 
> Since part of the code was not written by me, but by Peng, I think both
> of us need to agree to a license change if one is to be made.

Ah I didn't realize that Peng also contributed. Let's wait if he is 
happy with the change.

Also, offline, I was pointed out that I could explain a little bit more 
why I asked if this could be changed. From [1]:

"IIRC from past discussion there are two broads concern with GPLv2+:
    - We are leaving the choice of which license applies to the person
copying the code. So if a new version is released that is less favorable
to the initial contributor, then we have no leverage.
    - Some companies are rather cautious to contribute code that may be
licensed under GPLv3 (would be allowed with GPLv2+).

The later is particularly a problem because not many people realize that
a fair part of Xen on Arm is GPLv2+. I never really understood why we
chose that (this was before my time) but this got spread as the existing
copyright was added to a new file. Admittely, the contributor should be
more cautious. But I would not say this is trivial to spot the difference."

Cheers,

[1] 
https://lore.kernel.org/xen-devel/f235f6f8-d585-4e24-7fc8-3f2df9240c9d@xen.org/

-- 
Julien Grall

