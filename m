Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DC276E324
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 10:30:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576079.901817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRTib-0005uw-VB; Thu, 03 Aug 2023 08:30:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576079.901817; Thu, 03 Aug 2023 08:30:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRTib-0005rY-Rm; Thu, 03 Aug 2023 08:30:01 +0000
Received: by outflank-mailman (input) for mailman id 576079;
 Thu, 03 Aug 2023 08:30:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qRTia-0005jU-0m
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 08:30:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRTiZ-0000GS-KI; Thu, 03 Aug 2023 08:29:59 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRTiZ-0001l5-DR; Thu, 03 Aug 2023 08:29:59 +0000
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
	bh=mVJOpTN/SMXgzQ3juWQOsGhVuQYcAPpO4fcB+I4DqFM=; b=23U7AzbbK1Bp9MyIYLe5XCKy+A
	zOHqalCnNpmIMmai2cQ4kklrEJsav65VuJL8pcoucF/BxSvkbxkCtwizBhifbMbFAZs8A2cvE+3u4
	EigrTz+YU1OYlTJSYQ5HlZTE/JlvB5638BD/uBHDKRqzf6y16W8cFwBpXV8V+7dte4Fo=;
Message-ID: <3942c22a-80e1-29bd-4bd8-15d4bc43d220@xen.org>
Date: Thu, 3 Aug 2023 09:29:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] arm/gicv2: make GICv2 driver and vGICv2 optional
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Michal Orzel <michal.orzel@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230802135350.745251-1-luca.fancellu@arm.com>
 <17bc595a-dc30-9e76-4d31-aad62f9c9672@amd.com>
 <3ED442CB-0569-4C9C-9770-39D2FE4852A0@arm.com>
 <8c8f2564-935b-e3c8-ad15-348135140a53@amd.com>
 <92AE30B2-B2CE-465F-A6FC-A86961BED85A@arm.com>
 <9d40bd81-dc3a-0288-8f8a-1de62dc30d1d@xen.org>
 <1a364aa9-4549-80b9-4319-d91551f228bd@amd.com>
 <8516a6bb-8321-fc84-c7ce-10a7b41ecb59@xen.org>
 <33DCC5E2-7190-464C-B25A-68BC68CA4021@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <33DCC5E2-7190-464C-B25A-68BC68CA4021@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 03/08/2023 09:04, Luca Fancellu wrote:
>>> There are so many things that can go wrong during early boot including the entire boofdt parsing
>>> and having earlycon would be so desirable.
>> It is not clear what to take from your reply. Earlier you were concerned about the error not showing up in the log if the .config is not correct.
>>
>> There is no really quick fix for that as a .config may work for platform A but not platform B. The only viable solution is having an early console.
>>
>> Anything else like forcing to always have one GICvX selected is just a hack that would work for one set of people but not the others.
> 
> I agree with you in part, when you say that it would work for one set of people but not the others, isn’t it always the case? We are providing
> a defconfig that would fit the majority of the people, but it’s always a set of them.

Correct.

> 
> More specific to this patch, with the provided Kconfig “hack” as you say, it is not only providing the same user experience as the current state,
> it is doing more, it is providing a way to exclude from the build the GICv2 which is not possible currently, this work aims to provide a more
> fine granular configuration so that experienced users can remove entire modules that they don’t need in their platform so that they don’t have
> to take them into account when going to, for example, safety critical audits.

There seems to be some misunderstanding about the hack I am referring 
to. This is not about the patch itself but the following line:

select GICV2 if !GICV3 && !NEW_VGIC

Now that GICv2 can be deselecting, I see no point to force select GICV2 
if GICV3 is not selected.

As I wrote earlier, there is so many way for someone to create .config 
that is wrong or doesn't boot on their platform. So someone tweaking 
.config should always be careful when selecting/deselecting options.

> 
> I agree with you that earlycon would be perfect, so that we could make the user remove every module and let him know quickly the issue,
> but on the other hand it is a complete new feature that you are requesting (are you?) to make this patch go forward.

I didn't suggest it. I was making the point that if you have time, it is 
best to spend it trying to enable the early console rather than trying 
to prevent the user to disable both GIC.

Cheers,

-- 
Julien Grall

