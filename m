Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 087CC534C6E
	for <lists+xen-devel@lfdr.de>; Thu, 26 May 2022 11:19:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337489.562091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nu9dh-0004kS-28; Thu, 26 May 2022 09:18:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337489.562091; Thu, 26 May 2022 09:18:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nu9dg-0004hr-Vi; Thu, 26 May 2022 09:18:40 +0000
Received: by outflank-mailman (input) for mailman id 337489;
 Thu, 26 May 2022 09:18:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kpz8=WC=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nu9df-0004hl-0l
 for xen-devel@lists.xenproject.org; Thu, 26 May 2022 09:18:39 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id d1bbdbed-dcd4-11ec-bd2c-47488cf2e6aa;
 Thu, 26 May 2022 11:18:37 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A4E21474;
 Thu, 26 May 2022 02:18:34 -0700 (PDT)
Received: from [10.57.7.92] (unknown [10.57.7.92])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E1F63F73D;
 Thu, 26 May 2022 02:18:31 -0700 (PDT)
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
X-Inumbo-ID: d1bbdbed-dcd4-11ec-bd2c-47488cf2e6aa
Message-ID: <455173fb-139a-879f-a0b5-f2404f94a710@arm.com>
Date: Thu, 26 May 2022 11:18:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] xen/arm: Allow setting the number of CPUs to activate at
 runtime
Content-Language: en-US
From: Michal Orzel <michal.orzel@arm.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220523091324.137350-1-michal.orzel@arm.com>
 <45054a80-3958-a6b8-1575-02dd5bb17892@xen.org>
 <cb1e1ce0-4667-c436-6e5d-abc26add4ebe@arm.com>
 <3236e8e6-c25d-1733-9315-e0363cc73f84@xen.org>
 <06dbe73a-a14f-4b9f-4839-9c97829303ff@arm.com>
In-Reply-To: <06dbe73a-a14f-4b9f-4839-9c97829303ff@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Julien,

Gentle ping asking to reply to my previous mail.

On 24.05.2022 08:34, Michal Orzel wrote:
> Hi Julien,
> 
> On 23.05.2022 22:00, Julien Grall wrote:
>>
>>
>> On 23/05/2022 11:21, Michal Orzel wrote:
>>> Hi Julien,
>>
>> Hi Michal,
>>
>>>
>>> On 23.05.2022 12:05, Julien Grall wrote:
>>>> Hi,
>>>>
>>>> On 23/05/2022 10:13, Michal Orzel wrote:
>>>>> Introduce a command line parameter "maxcpus" on Arm to allow adjusting
>>>>> the number of CPUs to activate.
>>>>
>>>> The current definition "maxcpus" is not really suitable for big.LITTLE systems as you have no flexibility to say how many types of each cores you want to boot.
>>>>
>>>> Instead, Xen will pick-up the first CPUs it parsed from the firmware tables.
>>>>
>>>>
>>>> So what's your use-case/target?
>>>>
>>> - use cases where we have no big little (although even on big.LITTLE limiting this number makes sense if we do not care about the types)
>>
>> This may make sense in debug build, but for prod I think you need some certainty how which CPUs you are going to use.
> My conviction was that using big.LITTLE by enabling hmp-unsafe is not really used in the production systems (after all it's called *unsafe*)
> as it may easily end up in an insecure/unstable platform without specifying the cpu affinity (which must be done carefully).
> 
>>
>> So I would like a warning in the documentation "maxcpus" that in big.LITTLE system, there are no guarantee on which types will be used.
> I'm fully ok with adding this warning.
> 
> **WARNING: On Arm big.LITTLE systems, when `hmp-unsafe` option is enabled, this command line
> option does not guarantee on which CPU types will be used.**
> 
>>
>> This is technically a lie, but I don't want a user to start relying on how Xen will parse the DT.
>>
>>> - debug cases where we want to set maxcpus=1
>>
>> Thanks for the clarification. I would be happy to add my tag with a warning in the documentation.
>>
> Does it mean you want to do this on commit or should I handle it in v2?
> 
>> Cheers,
>>
> 
> Cheers,
> Michal
> 

