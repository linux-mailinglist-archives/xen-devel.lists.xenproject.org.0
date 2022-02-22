Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 010B24BF559
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 11:06:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276622.472838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMS3I-0002pA-Go; Tue, 22 Feb 2022 10:05:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276622.472838; Tue, 22 Feb 2022 10:05:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMS3I-0002mw-De; Tue, 22 Feb 2022 10:05:48 +0000
Received: by outflank-mailman (input) for mailman id 276622;
 Tue, 22 Feb 2022 10:05:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IN1Y=TF=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nMS3H-0002mq-00
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 10:05:47 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id ff67cd33-93c6-11ec-8eb8-a37418f5ba1a;
 Tue, 22 Feb 2022 11:05:44 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89DB0106F;
 Tue, 22 Feb 2022 02:05:43 -0800 (PST)
Received: from [10.57.3.116] (unknown [10.57.3.116])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2E72C3F5A1;
 Tue, 22 Feb 2022 02:05:41 -0800 (PST)
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
X-Inumbo-ID: ff67cd33-93c6-11ec-8eb8-a37418f5ba1a
Subject: Re: [PATCH] xen/arm: Rename psr_mode_is_32bit to regs_mode_is_32bit
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220221105931.12028-1-michal.orzel@arm.com>
 <1531f49d-c74c-8a41-a917-cfe76bee8e7d@xen.org>
 <05b5877b-7dc0-3d35-f073-5721e1605321@arm.com>
 <A666192F-D43D-484D-8125-8908F45155BB@arm.com>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <c38ed3e6-0667-010a-705a-3f0b7308afab@arm.com>
Date: Tue, 22 Feb 2022 11:05:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <A666192F-D43D-484D-8125-8908F45155BB@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 22.02.2022 09:48, Bertrand Marquis wrote:
> Hi Michal,
> 
>> On 22 Feb 2022, at 07:07, Michal Orzel <michal.orzel@arm.com> wrote:
>>
>> Hi Julien,
>>
>> On 21.02.2022 16:58, Julien Grall wrote:
>>> Hi Michal,
>>>
>>> On 21/02/2022 10:59, Michal Orzel wrote:
>>>> Following a discussion [1] it seems like that renaming work has
>>>> been forgotten.
>>>
>>> This is in my todo list of clean-up I need to do for Xen. But I haven't yet had a chance to look at it. Thank you for taking a look!
>>>
>>>> Perform renaming of psr_mode_is_32bit to
>>>> regs_mode_is_32bit as the function no longer takes psr parameter.
>>>
>>> If we modify psr_mode_is_32bit(), then we should also modify psr_mode_is_user() because they have the same prototype and we should keep the naming consistent.
>>>
>> Ok, I agree. Do you think this should be done in a separate patch?
>> FWICS, psr_mode_is_user is used in traps.c, vcpreg.c ,vtimer.c and vsysreg.c whereas psr_mode_is_32bit - only in traps.c.
> 
> I think it can be done in a separate patch.
> 
Ok, so I will push a patch series consisting of two patches.

> Cheers
> Bertrand
> 
>>
>>>>
>>>> [1] https://marc.info/?l=xen-devel&m=156457538423787&w=2
>>>
>>> NIT: The first sentence and this link adds value for the review on the mailing list (we know where the request came from) but doesn't add any after the commit message (there are no extra information in them).
>>>
>>> So I would move this information after ---. This will get dropped on commit.
>>>
>> Ok.
>>> Cheers,
>>>
>>
>> Cheers,
>> Michal
>>
> 

Cheers,
Michal

