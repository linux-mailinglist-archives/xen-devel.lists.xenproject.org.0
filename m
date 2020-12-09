Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A422D3C49
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 08:32:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48001.84922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmtxc-0005zo-Vy; Wed, 09 Dec 2020 07:32:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48001.84922; Wed, 09 Dec 2020 07:32:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmtxc-0005zR-So; Wed, 09 Dec 2020 07:32:28 +0000
Received: by outflank-mailman (input) for mailman id 48001;
 Wed, 09 Dec 2020 07:32:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ml5q=FN=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1kmtxb-0005zM-5s
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 07:32:27 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c613b343-a7cb-4a85-af53-992c3d92ab12;
 Wed, 09 Dec 2020 07:32:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E94BA30E;
 Tue,  8 Dec 2020 23:32:24 -0800 (PST)
Received: from [10.57.1.227] (unknown [10.57.1.227])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF3313F66B;
 Tue,  8 Dec 2020 23:32:23 -0800 (PST)
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
X-Inumbo-ID: c613b343-a7cb-4a85-af53-992c3d92ab12
Subject: Re: [PATCH] xen/arm: Add workaround for Cortex-A53 erratum #845719
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
References: <20201208072327.11890-1-michal.orzel@arm.com>
 <d286241c-fd3b-8506-37e5-0ddcdaae97be@xen.org>
 <5D1B5771-A6B3-4F5E-81A1-864DBC8787B4@arm.com>
 <bf45e0f4-2de7-d1db-4732-342937bf61e7@xen.org>
 <alpine.DEB.2.21.2012081730020.20986@sstabellini-ThinkPad-T480s>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <e974547f-ddf2-a7d1-43a1-cdc81c874823@arm.com>
Date: Wed, 9 Dec 2020 08:32:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2012081730020.20986@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 09.12.2020 02:34, Stefano Stabellini wrote:
> On Tue, 8 Dec 2020, Julien Grall wrote:
>> On 08/12/2020 14:38, Bertrand Marquis wrote:
>>> Hi Julien,
>>>
>>>> On 8 Dec 2020, at 09:47, Julien Grall <julien@xen.org> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 08/12/2020 07:23, Michal Orzel wrote:
>>>>> When executing in aarch32 state at EL0, a load at EL0 from a
>>>>> virtual address that matches the bottom 32 bits of the virtual address
>>>>> used by a recent load at (aarch64) EL1 might return incorrect data.
>>>>> The workaround is to insert a write of the contextidr_el1 register
>>>>> on exception return to an aarch32 guest.
>>>>
>>>> I am a bit confused with this comment. In the previous paragraph, you are
>>>> suggesting that the problem is an interaction between EL1 AArch64 and EL0
>>>> AArch32. But here you seem to imply the issue only happen when running a
>>>> AArch32 guest.
>>>>
>>>> Can you clarify it?
>>>
>>> This can happen when switching from an aarch64 guest to an aarch32 guest so
>>> not only when there is interaction.
> 
> Just to confirm: it cannot happen when switching from aarch64 *EL2* to
> aarch32 EL0/1, right?  Because that happens all the time in Xen.
> 
> 
No it cannot. It can only happen when switching from aarch64 EL1 to aarch32 EL0.
>> Right, but the context switch will write to CONTEXTIDR_EL1. So this case
>> should already be handled.
>>
>> Xen will never switch from AArch64 EL1 to AArch32 EL0 without a context switch
>> (the inverse can happen if we inject an exception to the guest).
>>
>> Reading the Cortex-A53 SDEN, it sounds like this is an OS and not Hypervisor
>> problem. In fact, Linux only seems to workaround it when switching in the OS
>> side rather than the hypervisor.
>>
>> Therefore, I am not sure to understand why we need to workaroud it in Xen.
> 
> It looks like Julien is right in regards to the "aarch64 EL1 to aarch32
> EL0" issue.
> 
Yes I agree. I missed the fact that there is a write to CONTEXTIDR_EL1
in 'ctxt_switch_to'. Let's abandon this.

Thanks,
Michal

