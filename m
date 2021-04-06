Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 146EE35575C
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 17:10:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106055.202802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTnKz-0003O7-FD; Tue, 06 Apr 2021 15:09:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106055.202802; Tue, 06 Apr 2021 15:09:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTnKz-0003Ni-BT; Tue, 06 Apr 2021 15:09:53 +0000
Received: by outflank-mailman (input) for mailman id 106055;
 Tue, 06 Apr 2021 15:09:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lTnKy-0003Nd-G8
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 15:09:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTnKj-0000km-3z; Tue, 06 Apr 2021 15:09:37 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTnKi-0007e4-Sf; Tue, 06 Apr 2021 15:09:37 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=0IuzaOUgfeZqwPY0X23GNFX/jWUqC0Dlgz8g41bnkLI=; b=rDaaBr/Xh1dntAa8+TnVOzEGvS
	3zm/BUN8f56ZuckeH8IpBGJBUFu5J0VlUpaUTkwqhEkjyMW89vX/Txe06ly4zcdYqHEt+1u82Rnby
	9kcQ6Xxo9HTUlRdnwE0B3ouaM+GYXM/c96W1p7g9ZLKNtxhkq6L6NYxUzqduBdq7SnFY=;
Subject: Re: [PATCH 2/2] xen/pci: Gate all MSI code in common code with
 CONFIG_HAS_PCI_MSI
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org,
 bertrand.marquis@arm.com, Jan Beulich <jbeulich@suse.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <cover.1617702520.git.rahul.singh@arm.com>
 <4471ba4fffc8a0cef24cc11314fc788334f85ccc.1617702520.git.rahul.singh@arm.com>
 <YGxsfdK9GEefLgAv@Air-de-Roger>
 <75848a0d-d060-6a8b-5ebc-7376ffc14af0@xen.org>
 <YGx3TsTlAuE9eQ7i@Air-de-Roger>
From: Julien Grall <julien@xen.org>
Message-ID: <88704bcf-a06b-cf89-5fa3-0db94428f9f8@xen.org>
Date: Tue, 6 Apr 2021 16:09:34 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YGx3TsTlAuE9eQ7i@Air-de-Roger>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 06/04/2021 15:59, Roger Pau Monné wrote:
> On Tue, Apr 06, 2021 at 03:30:01PM +0100, Julien Grall wrote:
>> Hi Roger,
>>
>> On 06/04/2021 15:13, Roger Pau Monné wrote:
>>> On Tue, Apr 06, 2021 at 12:39:11PM +0100, Rahul Singh wrote:
>>>> MSI support is not implemented for ARM architecture but it is enabled
>>>> for x86 architecture and referenced in common passthrough/pci.c code.
>>>>
>>>> Therefore introducing the new flag to gate the MSI code for ARM in
>>>> common code to avoid compilation error when HAS_PCI is enabled for ARM.
>>>
>>> Is such option really interesting long term?
>>>
>>> IIRC PCI Express mandates MSI support, at which point I don't see much
>>> value in being able to compile out the MSI support.
>>
>> I am pretty sure there are board out with PCI support but no MSI support.
>> Anyway, even if the spec may mandate it...
>>
>>>
>>> So while maybe helpful for Arm PCI efforts ATM, I'm not sure it
>>> warrants a Kconfig option, I would rather see Arm introduce dummy
>>> helpers for the missing functionality, even if unimplemented at the
>>> moment.
>>
>> ... from my understanding, most of (if not all) the MSI code is not very
>> useful on Arm when using the GICv3 ITS.
>>
>> The GICv3 ITS will do the isolation for you and therefore we should not need
>> to keep track of the state at the vPCI level.
> 
> Right, but MSI has nothing to do with isolation, is just the
> capability to setup interrupts from PCI devices. What about systems
> without GICv3 ITS, is there an aim to support those also? (as from my
> reading of your reply those would require more auditing of the MSI
> accesses by the guests)

I am not aware of any plan for them so far.

> 
>> So I think we want to be able to compile out the code if not used. That
>> said, I think providing stub would be better to avoid multiple #ifdef in the
>> same function.
> 
> I think providing stubs is the way to go, that should allow to remove
> the unneeded code without having to explicitly drop MSI support. 
> As
> said before, I think it's fine to provide those unimplemented for Arm
> ATM, can be filled later if there's more pressing PCI work to do
> first.

We should remove unneeded and *avoid* allocation. Providing stub for 
existing functions will only address the first problem.

For the allocation (see alloc_pdev()) , we will need to move it in 
separate function and gate them to prevent the allocation.

It would be wrong to gate the code with #ifdef CONFIG_X86. So I think 
Rahul's idea to provide the new #ifdef is correct.

Cheers,

-- 
Julien Grall

