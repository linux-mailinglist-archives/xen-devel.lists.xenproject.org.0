Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAFD6FE611
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 23:20:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533022.829382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwrDC-0000Pq-1c; Wed, 10 May 2023 21:19:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533022.829382; Wed, 10 May 2023 21:19:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwrDB-0000Mj-UC; Wed, 10 May 2023 21:19:01 +0000
Received: by outflank-mailman (input) for mailman id 533022;
 Wed, 10 May 2023 21:19:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pwrDA-0000Md-45
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 21:19:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pwrD9-0005f2-PI; Wed, 10 May 2023 21:18:59 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[192.168.6.195]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pwrD9-00043x-JD; Wed, 10 May 2023 21:18:59 +0000
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
	bh=z0fUX7B9LM6LF/MijMo79FjjtItfb1cp+WlY7ZGNAhk=; b=tkf0Pbfk+qImamxAxPWmhxTwVM
	NP5kEM+AWJIUAyRbT3IhcQUFES3KHmOn4T36WkyonKpqBLDbYMdESM2tyJiivMJzyydiJ91bCdf+u
	+Ps+jvzG5SMku2F6GGPDROxRx6qbQcfsaSFF5Q3moQcVQ20BpVtY7NDrnoB2cHEg/2aU=;
Message-ID: <6ff7e2e7-9689-13f4-749d-1b041540fd41@xen.org>
Date: Wed, 10 May 2023 22:18:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [RFC PATCH] xen/arm: arm32: Enable smpboot on Arm32 based systems
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20230502105849.40677-1-ayan.kumar.halder@amd.com>
 <2d764f29-2eb9-ecff-84cd-9baf12961c54@xen.org>
 <e9a95271-021f-523a-770a-302c638bfe73@amd.com>
 <556611a5-dc9a-8155-650d-327b6853f761@xen.org>
 <22c4da5c-9ad7-68ba-b005-8ba18e584bf6@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <22c4da5c-9ad7-68ba-b005-8ba18e584bf6@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ayan,

On 04/05/2023 09:57, Ayan Kumar Halder wrote:
> 
> On 03/05/2023 18:43, Julien Grall wrote:
>> Hi Ayan,
> Hi Julien,
>>
>> On 03/05/2023 17:49, Ayan Kumar Halder wrote:
>>>
>>> On 03/05/2023 08:40, Julien Grall wrote:
>>>> Hi,
>>> Hi Julien,
>>>>
>>>> Title: Did you mean "Enable spin table"?
>>> Yes, that would be more concrete.
>>>>
>>>> On 02/05/2023 11:58, Ayan Kumar Halder wrote:
>>>>> On some of the Arm32 based systems (eg Cortex-R52), smpboot is 
>>>>> supported.
>>>>
>>>> Same here.
>>> Yes
>>>>
>>>>> In these systems PSCI may not always be supported. In case of 
>>>>> Cortex-R52, there
>>>>> is no EL3 or secure mode. Thus, PSCI is not supported as it 
>>>>> requires EL3.
>>>>>
>>>>> Thus, we use 'spin-table' mechanism to boot the secondary cpus. The 
>>>>> primary
>>>>> cpu provides the startup address of the secondary cores. This 
>>>>> address is
>>>>> provided using the 'cpu-release-addr' property.
>>>>>
>>>>> To support smpboot, we have copied the code from 
>>>>> xen/arch/arm/arm64/smpboot.c
>>>>
>>>> I would rather prefer if we don't duplicate the code but instead 
>>>> move the logic in common code.
>>> Ack
>>>>
>>>>> with the following changes :-
>>>>>
>>>>> 1. 'enable-method' is an optional property. Refer to the comment in
>>>>> https://www.kernel.org/doc/Documentation/devicetree/bindings/arm/cpus.yaml
>>>>> "      # On ARM 32-bit systems this property is optional"
>>>>
>>>> Looking at this list, "spin-table" doesn't seem to be supported
>>>> for 32-bit systems. 
>>>
>>> However, looking at 
>>> https://developer.arm.com/documentation/den0013/d/Multi-core-processors/Booting-SMP-systems/SMP-boot-in-Linux , it seems "spin-table" is a valid boot mechanism for Armv7 cpus.
>>
>> I am not able to find the associated code in Linux 32-bit. Do you have 
>> any pointer?
> 
> Unfortunately, no.
> 
> I see that in linux, "spin-table" support is added in 
> arch/arm64/kernel/smp_spin_table.c. So, there seems to be no Arm32 
> support for this.
>>
>>>
>>>
>>>> Can you point me to the discussion/patch where this would be added?
>>>
>>> Actually, this is the first discussion I am having with regards to 
>>> adding a "spin-table" support on Arm32.
>>
>> I was asking for the discussion on the Device-Tree/Linux ML or code.
>> I don't really want to do a "spin-table" support if this is not even 
>> supported in Linux.
> 
> I see your point. But that brings me to my next question, how do I parse 
> cpu node specific properties for Arm32 cpus.

I was probably not very clear in my previous message. What I don't want 
is for Xen to use unofficial bindings.

IOW, if the existing binding doesn't allow the spin-table on arm32 (IMHO 
it is not clear) and it makes sense to use them, then we should first 
consider to send a patch against the documentation and merge it before 
Xen can use the properties.

> 
> In 
> https://www.kernel.org/doc/Documentation/devicetree/bindings/arm/cpus.yaml , I see some of the properties valid for Arm32 cpus.
> 
> For example:-
> 
> secondary-boot-reg
> rockchip,pmu
> 
> Also, it says "additionalProperties: true" which means I can add 
> platform specific properties under the cpu node.

For clarification, are you saying the bindings below is not yet 
official? If so, then this should be first discussed with the 
Device-Tree folks.

> Please correct me if 
> mistaken.
> 
> My cpu nodes will look like this :-
> 
>          cpu@1 {
>              device_type = "cpu";
>              compatible = "arm,armv8";
>              reg = <0x00 0x01>;
>              enable-method = "spin-table";

The enable-method "spin-table" is generic and expect property like 
cpu-release-addr. Yet...

>              amd-cpu-release-addr = <0xEB58C010>; /* might also use 
> "secondary-boot-reg" */
>              amd-cpu-reset-addr = <0xEB58C000>;
>              amd-cpu-reset-delay = <0xF00000>;
>              amd-cpu-re

... these are all AMD properties. What are the reasons to not use the 
generic "spin-table" bindings?

If you can't use it, then I think you should define a new type of 
enable-method.

>              phandle = <0x03>;
>          };
> 
>          cpu@2 {
>              device_type = "cpu";
>              compatible = "arm,armv8";
>              reg = <0x00 0x02>;
>              enable-method = "spin-table";
>              amd-cpu-release-addr = <0xEB59C010>; /* might also use 
> "secondary-boot-reg" */
>              amd-cpu-reset-addr = <0xEB59C000>;
>              amd-cpu-reset-delay = <0xF00000>;
>              amd-cpu-re
>              phandle = <0x03>;
>          };
> 
> If the reasoning makes sense, then does the following proposed change 
> looks sane ?

I would first like to understand a bit more about how the bindings were 
created and whether this was discussed with the Device-Tree community.

Cheers,

-- 
Julien Grall

