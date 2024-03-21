Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 153CF885FEB
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 18:39:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696553.1087568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnMO0-00072y-JY; Thu, 21 Mar 2024 17:39:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696553.1087568; Thu, 21 Mar 2024 17:39:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnMO0-000716-Gv; Thu, 21 Mar 2024 17:39:28 +0000
Received: by outflank-mailman (input) for mailman id 696553;
 Thu, 21 Mar 2024 17:39:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rnMNz-00070y-6f
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 17:39:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rnMNt-0006oO-6C; Thu, 21 Mar 2024 17:39:21 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rnMNt-0007SE-0n; Thu, 21 Mar 2024 17:39:21 +0000
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
	bh=WjlG1/ZFIX5hlW4tsmLgEDxx/RinRxtOnJmQX5Ou/Mg=; b=3jryVX5RqLccj0I+Ie63QvUmvG
	r46SPrdyHo7n8SS/hvA80Q/At6tUzVBuFQkxjXb8nGGeZq8YeXnKeQ+BU1X1hb2At7iFYzIApdWyG
	33rbaR1ltT5RRNjaTLBJJOMk2wSxxYZIE/EUi1c+f3R1vYTW31r1SOcRRoM2B47mpOP0=;
Message-ID: <f407c95f-8393-4753-ae66-98a94da69648@xen.org>
Date: Thu, 21 Mar 2024 17:39:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] xen/device-tree: Move Arm's setup.c bootinfo
 functions to common
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: tpearson@raptorengineering.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1710443965.git.sanastasio@raptorengineering.com>
 <039524d4157dddb2faf6887739a727f6e993b53f.1710443965.git.sanastasio@raptorengineering.com>
 <152e76ee-6e75-4881-aa88-313f0ae058be@suse.com>
 <8adb6bf8-9804-4313-b1e1-5cf96d643d5e@raptorengineering.com>
 <98996023-f47c-45fd-b804-77440f333fc6@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <98996023-f47c-45fd-b804-77440f333fc6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 21/03/2024 07:42, Jan Beulich wrote:
> On 20.03.2024 19:07, Shawn Anastasio wrote:
>> On 3/15/24 4:16 AM, Jan Beulich wrote:
>>> On 14.03.2024 23:15, Shawn Anastasio wrote:
>>>> Arm's setup.c contains a collection of functions for parsing memory map
>>>> and other boot information from a device tree. Since these routines are
>>>> generally useful on any architecture that supports device tree booting,
>>>> move them into xen/common/device-tree.
>>>>
>>>> Suggested-by: Julien Grall <julien@xen.org>
>>>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>>>> ---
>>>>   MAINTAINERS                       |   1 +
>>>>   xen/arch/arm/setup.c              | 419 --------------------------
>>>>   xen/common/Makefile               |   1 +
>>>>   xen/common/device-tree/Makefile   |   1 +
>>>>   xen/common/device-tree/bootinfo.c | 469 ++++++++++++++++++++++++++++++
>>>>   5 files changed, 472 insertions(+), 419 deletions(-)
>>>>   create mode 100644 xen/common/device-tree/Makefile
>>>>   create mode 100644 xen/common/device-tree/bootinfo.c
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index 56a6932037..e85fbe6737 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -301,6 +301,7 @@ M:	Stefano Stabellini <sstabellini@kernel.org>
>>>>   M:	Julien Grall <julien@xen.org>
>>>>   S:	Supported
>>>>   F:	xen/common/libfdt/
>>>> +F:	xen/common/device-tree/setup.c
>>>
>>> Perhaps more generally
>>>
>>> F:	xen/common/device-tree/
>>>
>>> ?
>>>
>>
>> This was done to allow bootfdt.c (next patch) to remain under ARM's
>> maintainership, which I believe was your suggestion in v2.
>>
>> Perhaps it would make sense to leave both setup.c and bootfdt.c under
>> ARM's maintainership, or would it be acceptable to move both to device
>> tree?
> 
> What exactly is wanted needs to be sorted by the maintainers (Arm / DT).
> To me, having everything DT under DT maintainership (which is a subset
> of Arm maintainers anyway) would make most sense.

I would say this should go under "Device Tree". So it will be easy to 
add PPC/RISC-V folks in the future.

I am also open to add Bertrand/Michal to the existing "Device Tree" 
category. But this can be sorted it out separately.

Cheers,

-- 
Julien Grall

