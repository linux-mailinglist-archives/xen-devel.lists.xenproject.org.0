Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25302476AED
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 08:15:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247745.427215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxkyk-0000J1-GH; Thu, 16 Dec 2021 07:15:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247745.427215; Thu, 16 Dec 2021 07:15:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxkyk-0000H2-Ck; Thu, 16 Dec 2021 07:15:02 +0000
Received: by outflank-mailman (input) for mailman id 247745;
 Thu, 16 Dec 2021 07:15:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0wh=RB=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1mxkyi-0000Gw-Kn
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 07:15:00 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id e0a26c88-5e3f-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 08:14:59 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 278031435;
 Wed, 15 Dec 2021 23:14:58 -0800 (PST)
Received: from [10.57.5.90] (unknown [10.57.5.90])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B88713F73B;
 Wed, 15 Dec 2021 23:14:56 -0800 (PST)
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
X-Inumbo-ID: e0a26c88-5e3f-11ec-9e60-abaf8a552007
Subject: Re: [PATCH] xen/arm64: Zero the top 32 bits of gp registers on
 entry...
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <20211206142032.27536-1-michal.orzel@arm.com>
 <f3573439-4893-440f-54e1-fdeba3eb4508@xen.org>
 <dc114877-b9da-7a5b-260d-b9438cddd777@arm.com>
 <b7a53384-39cb-f368-f39b-9b560336226b@xen.org>
 <6ab797ce-86dc-2c32-1cd0-417fab7516c7@suse.com>
 <73913bdf-7449-34fb-b86b-662774cb3e62@xen.org>
 <865fb3a7-76fc-24da-e07d-c6e59e3e1abe@arm.com>
 <3aae0020-938e-d5fe-7d7f-d5d1c8335a24@xen.org>
 <447b6c54-7d0c-132f-6202-c1ae7fb16e5d@arm.com>
 <871bda7e-3f94-a5bd-3caa-16b0c8f6d693@suse.com>
 <87080c9d-803d-608a-1c5a-2102f014d2bc@xen.org>
 <1fcc18d4-70ce-12d1-6d54-ae82e511a4d7@xen.org>
 <040a1871-08ee-00e9-b46f-ca4854e8a541@arm.com>
 <82557218-539b-204a-a1a7-7c796a2baa8a@suse.com>
 <9dc003f8-4dd0-282f-61ce-6ca74c543f20@arm.com>
 <6e54f971-84c3-3635-12c8-643b619b2b53@suse.com>
 <219d27fe-4e77-59f5-b559-4bc70c2a0399@arm.com>
 <4b6c1865-5ded-fe6d-aead-bcd2e5cd4125@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <45d78e8e-8adb-e70c-40ca-9473cb58d918@arm.com>
Date: Thu, 16 Dec 2021 08:14:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4b6c1865-5ded-fe6d-aead-bcd2e5cd4125@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Julien,

On 15.12.2021 19:25, Julien Grall wrote:
> Hi Michal,
> 
> On 15/12/2021 10:40, Michal Orzel wrote:
>> On 15.12.2021 11:32, Jan Beulich wrote:
>>> (Re-sending an abridged version, as apparently spam filters didn't like
>>> the original message with more retained context; I'll have to see whether
>>> this one also isn't liked. Sorry.)
>>>
>>> On 15.12.2021 10:48, Michal Orzel wrote:
>>>> This patch and the problem it solves is about clearing top 32bits of all gp registers so not only x0,x1.
>>>
>>> That's well understood. Yet for everything still in registers simply
>>> using mov ahead of the respective push (as you had it) is still
>>> preferable imo.
>>>
>>> Jan
>>>
>>
>> In that case let's wait for Julien's opinion to decide whether I should get back to the previous
>> solution with mov or to the stack solution.
> 
> IIUC, your proposal is to:
>    1) Push all the 64-bit registers
>    2) Zero the top 32-bit
> 
> Jan's suggestion is to:
>    1) clobber the top 32-bit using mov wX, wX
>    2) Push all the registers
> 
> My preference is for the latter because there will be less memory/cache access.
> 
> So, this would be your original patch + a compile time check to ensure save_x0_x1 is 0 when compat=1.
> 
That is exactly what I would like to do. I will send this as v2.

> Cheers,
> 

Cheers,
Michal

