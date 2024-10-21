Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B10549A6E12
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 17:26:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823677.1237711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2uIn-0004GI-Lk; Mon, 21 Oct 2024 15:26:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823677.1237711; Mon, 21 Oct 2024 15:26:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2uIn-0004Dh-Ie; Mon, 21 Oct 2024 15:26:37 +0000
Received: by outflank-mailman (input) for mailman id 823677;
 Mon, 21 Oct 2024 15:26:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1t2uIm-0004DY-3g
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 15:26:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t2uIl-00031T-Mi; Mon, 21 Oct 2024 15:26:35 +0000
Received: from [2a02:8012:3a1:0:827:16ef:abff:1cc1]
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t2uIl-0001bp-G4; Mon, 21 Oct 2024 15:26:35 +0000
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
	bh=3WxrTBZEA732rGh3PXOA0Igi/wV6/lGDTLO8ghG8IXI=; b=izKhB6GTcQyDsuSfD62Ixh22tA
	tPzU6t/tANGYBjGUJMGKOjx9F0GirXSUiDhK2yLvEAZQOwE/DjZ+6O2hKiSJawlfyuS+0pXkauOLo
	xF+guCpQK6llVduGR/G5gACL3755lb2AGzqM9c4GuZQdDtKbDI/Q9GY1G92dKrvXoDMc=;
Message-ID: <cd2340a0-edfc-4d93-aa01-df9c5df76e3c@xen.org>
Date: Mon, 21 Oct 2024 16:26:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] xen/arm: mpu: Introduce choice between MMU and MPU
Content-Language: en-GB
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-3-ayan.kumar.halder@amd.com>
 <a2ba4e14-cede-4b30-a67a-790f4a55f3a6@xen.org>
 <74dd600b-4261-46a7-916a-506a11eb2c99@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <74dd600b-4261-46a7-916a-506a11eb2c99@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ayan,

On 21/10/2024 12:25, Ayan Kumar Halder wrote:
> 
> On 18/10/2024 15:08, Julien Grall wrote:
>> Hi,
> Hi,
>>
>> On 10/10/2024 15:03, Ayan Kumar Halder wrote:
>>> There are features in the forthcoming patches which are dependent on
>>> MPU. For eg fixed start address.
>>> Also, some of the Xen features (eg STATIC_MEMORY) will be selected
>>> by the MPU configuration.
>>>
>>> Thus, this patch introduces a choice between MMU and MPU for the type
>>> of memory management system. By default, MMU is selected.
>>> MPU is now gated by UNSUPPORTED.
>>>
>>> Update SUPPORT.md to state that the support for MPU is experimental.
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>
>> With one remark below:
>>
>> Acked-by: Julien Grall <jgrall@amazon.com>
> Thanks.
>>
>>> ---
>>> Changes from :-
>>>
>>> v1 - 1. Reworded the help messages.
>>> 2. Updated Support.md.
>>>
>>> v2 - 1. Reworded the help message.
>>>
>>>   SUPPORT.md                     |  1 +
>>>   xen/arch/arm/Kconfig           | 17 ++++++++++++++++-
>>>   xen/arch/arm/platforms/Kconfig |  2 +-
>>>   3 files changed, 18 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/SUPPORT.md b/SUPPORT.md
>>> index 23dd7e6424..3f6d788a43 100644
>>> --- a/SUPPORT.md
>>> +++ b/SUPPORT.md
>>> @@ -40,6 +40,7 @@ supported in this document.
>>>         Status, Xen in AArch64 mode: Supported
>>>       Status, Xen in AArch32 mode: Tech Preview
>>> +    Status, Xen with MPU: Experimental
>>
>> Maybe mention Armv8-R?
> 
> Yes.
> 
> I propose this change be done on commit as well.

Unless Stefano wants to do, I would rather not as you are going to send 
a new version of the series. Same applies for patch #1.

Cheers,

-- 
Julien Grall


