Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B22442FB27
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 20:39:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211030.368091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbS65-0004L4-A0; Fri, 15 Oct 2021 18:38:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211030.368091; Fri, 15 Oct 2021 18:38:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbS65-0004Is-4x; Fri, 15 Oct 2021 18:38:25 +0000
Received: by outflank-mailman (input) for mailman id 211030;
 Fri, 15 Oct 2021 18:38:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mbS63-0004Im-T8
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 18:38:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mbS62-0002q9-9a; Fri, 15 Oct 2021 18:38:22 +0000
Received: from [54.239.6.185] (helo=[192.168.0.140])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mbS62-0002tJ-1G; Fri, 15 Oct 2021 18:38:22 +0000
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
	bh=xWB/GjandfxY7il5xlUzhjF2/0EcAFuuglOttH/SFLo=; b=eThHxZiLZu68aD/A6mZ6Yg/CiK
	ada8w6khFhT6vk2UMt4GKFXVVFr6cVQFBmoZmaP7zRofeQ3CpxYvdi8PRo4XGu76uY2xzIprsFx26
	7z1g8l86vUS4YCfI04R2VbwbjPGmG6LhFotLIK1mK1ThpOS0P0eM9a6JL8ln5aSCx0AA=;
Message-ID: <a45077dc-e144-4427-9ae2-5815045ecaec@xen.org>
Date: Fri, 15 Oct 2021 19:38:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v8 2/5] xen/arm: Enable the existing x86 virtual PCI
 support for ARM
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 "iwj@xenproject.org" <iwj@xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Rahul Singh <Rahul.Singh@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.1634315461.git.bertrand.marquis@arm.com>
 <e2b10f56043155e4bb8eae824723045ccc042f8e.1634315461.git.bertrand.marquis@arm.com>
 <cef8d2a6-91c1-2d4d-2078-98d0a92b067a@xen.org>
 <F447A1D8-A023-4127-AAC0-7511868DE9C4@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <F447A1D8-A023-4127-AAC0-7511868DE9C4@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/10/2021 18:33, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

> 
>> On 15 Oct 2021, at 18:25, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Bertrand,
>>
>> On 15/10/2021 17:51, Bertrand Marquis wrote:
>>> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
>>> index 3aa8c3175f..35e0190796 100644
>>> --- a/xen/drivers/passthrough/pci.c
>>> +++ b/xen/drivers/passthrough/pci.c
>>> @@ -756,6 +756,19 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>>       if ( !pdev->domain )
>>>       {
>>>           pdev->domain = hardware_domain;
>>> +#ifdef CONFIG_ARM
>>> +        /*
>>> +         * On ARM PCI devices discovery will be done by Dom0. Add vpci handler
>>> +         * when Dom0 inform XEN to add the PCI devices in XEN.
>>> +         */
>>> +        ret = vpci_add_handlers(pdev);
>>
>> I don't seem to find the code to remove __init_hwdom in this series. Are you intending to fix it separately?
> 
> Yes I think it is better to fix that in a new patch as it will require some discussion as it will impact the x86 code if I just remove the flag now.
For the future patch series, may I ask to keep track of outstanding 
issues in the commit message (if you don't plan to address them before 
commiting) or after --- (if they are meant to be addressed before 
commiting)?

In this case, the impact on Arm is this would result to an hypervisor 
crash if called. If we drop __init_hwdom, the impact on x86 is Xen text 
will slightly be bigger after the boot time.

AFAICT, the code is not reachable on Arm (?). Therefore, one could argue 
we this can wait after the week-end as this is a latent bug. Yet, I am 
not really comfortable to see knowningly buggy code merged.

Stefano, would you be willing to remove __init_hwdom while committing 
it? If not, can you update the commit message and mention this patch 
doesn't work as intended?

Cheers,

-- 
Julien Grall

