Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE60361F013
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 11:16:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439220.693233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orzB5-0002UI-8K; Mon, 07 Nov 2022 10:16:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439220.693233; Mon, 07 Nov 2022 10:16:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orzB5-0002SI-5c; Mon, 07 Nov 2022 10:16:27 +0000
Received: by outflank-mailman (input) for mailman id 439220;
 Mon, 07 Nov 2022 10:16:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1orzB3-0002SA-S7
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 10:16:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1orzB3-000362-HR; Mon, 07 Nov 2022 10:16:25 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.25.99]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1orzB3-0004RH-7P; Mon, 07 Nov 2022 10:16:25 +0000
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
	bh=BeG86s7GWDswrJjftMVkYlC0nUB0Ox1aQ3hTzWcJHmE=; b=tPLzqC6fCd6GDsFBkKpyXxEQT+
	ntOGBQ3fxLY9Pqd2i4/L2rVLU/8Q31HYfBPNI2W2fjKSqQwt/swhxHq4Y1ijIssF3iHLnNXWAnFSN
	Mq5UrozbUtDxYknHQBOZuK4yl5v2Q5sqzjZkD7ybtyo2Bi2wjDNswYG3WK7UZi6ndDuM=;
Message-ID: <88c909b5-4cad-aab0-2acd-fb3519963128@xen.org>
Date: Mon, 7 Nov 2022 10:16:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v6 00/11] xen/arm: Add Armv8-R64 MPU support to Xen -
 Part#1
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
 <9c3bfa0c-2c8f-2160-46d1-3be234b5bcaf@xen.org>
 <PAXPR08MB742097DFF1BD4E9BF19B41459E3C9@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <PAXPR08MB742097DFF1BD4E9BF19B41459E3C9@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/11/2022 09:52, Wei Chen wrote:
> Hi Julien,

Hi,

> 
>>>    - Supports only a single Security state - Secure.
>>>    - MPU in EL1 & EL2 is configurable, MMU in EL1 is configurable.
>>>
>>> These patch series are implementing the Armv8-R64 MPU support
>>> for Xen, which are based on the discussion of
>>> "Proposal for Porting Xen to Armv8-R64 - DraftC" [1].
>>>
>>> We will implement the Armv8-R64 and MPU support in three stages:
>>> 1. Boot Xen itself to idle thread, do not create any guests on it.
>>
>> I read this as I can build Xen and see it boots (not creating domain).
>> However... HAS_MPU is not defined and I was expecting mm.c to be
>> modified to cater the MPU support. So I am a bit ensure what the series
>> is actually doing.
>>
> 
> These 11 patches are part#1 of stage#1, the full stage#1 has about 30
> patches. We have some concerns if we send so many patches at once, the
> review pressure of maintainers may be very high, so we only choose about
> 10 to send as part of it. But this also means that we can't do a relatively
> complete thing in this part#1 series.
> 
> We want to hear some suggestions from you to make so many patches can be
> Reviewed efficiently. Can we send the patches by stages, even the stage#1
> will have about 30 patches?

30 patches in a go is no too bad. I would personally prefer that because 
at least I have better idea of the shape of the code after stage#1 and 
also possibly test it (I need to check if I have access for the ARMv8-R 
model).

Cheers,

-- 
Julien Grall

