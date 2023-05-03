Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C294A6F5D32
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 19:44:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529414.823826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puGW4-0008Ii-Qa; Wed, 03 May 2023 17:43:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529414.823826; Wed, 03 May 2023 17:43:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puGW4-0008GV-Ne; Wed, 03 May 2023 17:43:48 +0000
Received: by outflank-mailman (input) for mailman id 529414;
 Wed, 03 May 2023 17:43:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1puGW3-0008GP-Qx
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 17:43:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1puGW3-0001DY-6Q; Wed, 03 May 2023 17:43:47 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=[192.168.7.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1puGW2-0004EE-SN; Wed, 03 May 2023 17:43:47 +0000
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
	bh=MqtxypmUk17dKd0G1AXzSt7RuNsLGclS8MiMovjho+0=; b=e6XZocs5E9HLnhipQ/5hjf1KrZ
	ZKN6VUuZcy6CGZTFtwE4Kyimdoh984dANucEPTMdKEqRIcZga2c96cu2hYzO5MKBOcsjbHo1l9k4r
	ApbepXV5zplE+QlFtiSY5sCr4ZeaCYa6FPOFHglHD9Bp/Gsxtxs3au/TratNBiLUh9sk=;
Message-ID: <556611a5-dc9a-8155-650d-327b6853f761@xen.org>
Date: Wed, 3 May 2023 18:43:44 +0100
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <e9a95271-021f-523a-770a-302c638bfe73@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ayan,

On 03/05/2023 17:49, Ayan Kumar Halder wrote:
> 
> On 03/05/2023 08:40, Julien Grall wrote:
>> Hi,
> Hi Julien,
>>
>> Title: Did you mean "Enable spin table"?
> Yes, that would be more concrete.
>>
>> On 02/05/2023 11:58, Ayan Kumar Halder wrote:
>>> On some of the Arm32 based systems (eg Cortex-R52), smpboot is 
>>> supported.
>>
>> Same here.
> Yes
>>
>>> In these systems PSCI may not always be supported. In case of 
>>> Cortex-R52, there
>>> is no EL3 or secure mode. Thus, PSCI is not supported as it requires 
>>> EL3.
>>>
>>> Thus, we use 'spin-table' mechanism to boot the secondary cpus. The 
>>> primary
>>> cpu provides the startup address of the secondary cores. This address is
>>> provided using the 'cpu-release-addr' property.
>>>
>>> To support smpboot, we have copied the code from 
>>> xen/arch/arm/arm64/smpboot.c
>>
>> I would rather prefer if we don't duplicate the code but instead move 
>> the logic in common code.
> Ack
>>
>>> with the following changes :-
>>>
>>> 1. 'enable-method' is an optional property. Refer to the comment in
>>> https://www.kernel.org/doc/Documentation/devicetree/bindings/arm/cpus.yaml
>>> "      # On ARM 32-bit systems this property is optional"
>>
>> Looking at this list, "spin-table" doesn't seem to be supported
>> for 32-bit systems. 
> 
> However, looking at 
> https://developer.arm.com/documentation/den0013/d/Multi-core-processors/Booting-SMP-systems/SMP-boot-in-Linux , it seems "spin-table" is a valid boot mechanism for Armv7 cpus.

I am not able to find the associated code in Linux 32-bit. Do you have 
any pointer?

> 
> 
>> Can you point me to the discussion/patch where this would be added?
> 
> Actually, this is the first discussion I am having with regards to 
> adding a "spin-table" support on Arm32.

I was asking for the discussion on the Device-Tree/Linux ML or code.
I don't really want to do a "spin-table" support if this is not even 
supported in Linux.

Cheers,

-- 
Julien Grall

