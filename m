Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2833977A20
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 09:46:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798023.1208154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp102-0001Fe-LK; Fri, 13 Sep 2024 07:45:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798023.1208154; Fri, 13 Sep 2024 07:45:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp102-0001CX-II; Fri, 13 Sep 2024 07:45:50 +0000
Received: by outflank-mailman (input) for mailman id 798023;
 Fri, 13 Sep 2024 07:45:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sp101-0001CQ-Kc
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 07:45:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sp100-0000WK-PG; Fri, 13 Sep 2024 07:45:48 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sp100-00044J-Iq; Fri, 13 Sep 2024 07:45:48 +0000
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
	bh=CR1zUln5HRVI9X+GWypgT/7pl5YEO2F5iq3wZXFjfv0=; b=UshWIa818hILjhenVPahYzPk6Y
	9KfFJAUc1gDVCdDLSNqRlFMXnz/giBXRXAZu7N4xGf7ZqIltJ/H0QJE3xlY94pPKevG9VR6cBW0Hy
	iOSa969QLx80L5xJqSu5NlrzxqOOhdcMbLaFwPZ2lzxXpTyCLo4w7bRKv8rjo1Rr7u1w=;
Message-ID: <ca9d2255-bb62-433b-9764-59a8712f8099@xen.org>
Date: Fri, 13 Sep 2024 08:45:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: fusa: Add Assumption of Use (AoU)
Content-Language: en-GB
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Artem Mygaiev <artem_mygaiev@epam.com>,
 Hisao Munakata <hisao.munakata.vt@renesas.com>
References: <20240911094456.2156647-1-ayan.kumar.halder@amd.com>
 <918755fd-ef73-4dd5-b77d-f386f8f74ac6@xen.org>
 <802d7cf1-98cd-4ac9-9d60-24aabaaa9e19@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <802d7cf1-98cd-4ac9-9d60-24aabaaa9e19@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/09/2024 12:24, Ayan Kumar Halder wrote:
> 
> On 11/09/2024 10:55, Julien Grall wrote:
>> Hi,
> Hi,
>>
>> On 11/09/2024 10:44, Ayan Kumar Halder wrote:
>>> From: Michal Orzel <michal.orzel@amd.com>
>>>
>>> AoU are the assumptions Xen relies on other components (eg platform, 
>>> domains)
>>> to fulfill its requirements. In our case, platform means a 
>>> combination of
>>> hardware, firmware and bootloader.
>>>
>>> We have defined AoU in the intro.rst and added AoU for the generic 
>>> timer.
>>>
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> ---
>>> Changes from :-
>>>
>>> v1 - 1. Removed the part of requirement which states that Xen exposes 
>>> the
>>> frequency of the system timer by reading the "clock-frequency" property.
>>>
>>> 2. Added a rationale for AoU.
>>>
>>> 3. Reworded the AoU.
>>>
>>>   .../reqs/design-reqs/arm64/generic-timer.rst  | 24 ++++++++++++++++++-
>>>   docs/fusa/reqs/intro.rst                      | 10 ++++++++
>>>   2 files changed, 33 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst b/ 
>>> docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
>>> index f2a0cd7fb8..86d84a3c40 100644
>>> --- a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
>>> +++ b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
>>> @@ -30,7 +30,7 @@ Read system counter frequency
>>>     Description:
>>>   Xen shall expose the frequency of the system counter to the domains in
>>> -CNTFRQ_EL0 register and/or domain device tree's "clock-frequency" 
>>> property.
>>> +CNTFRQ_EL0 register.
>>
>> This either wants to be split or explained in the commit message.
> 
> Yes, I will explain this in the commit message. Does the following sound 
> fine ?
> 
> ```
> 
> docs: fusa: Add Assumption of Use (AoU)
> 
> AoU are the assumptions that Xen relies on other components (eg 
> platform, domains)
> to fulfill its requirements. In our case, platform means a combination of
> hardware, firmware and bootloader.
> 
> We have defined AoU in the intro.rst and added AoU for the generic timer.
> 
> Also, fixed a requirement to denote that Xen shall **not** expose the 
> system counter frequency via the "clock-frequency" device tree property. 
> The reason being the device tree documentation strongly discourages the 
> use of this peoperty. Further if the "clock-frequency" is exposed, then 
> it overrides the value programmed in the CNTFRQ_EL0 register.
> 
> So, the frequency shall be exposed via the CNTFRQ_EL0 register only and 
> consequently there is an assumption on the platform to program the 
> register correctly.
> 
> ```

LGTM

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


