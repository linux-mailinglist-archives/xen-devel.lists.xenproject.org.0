Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE64F4BF585
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 11:12:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276629.472850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMS9Y-0004ER-7Y; Tue, 22 Feb 2022 10:12:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276629.472850; Tue, 22 Feb 2022 10:12:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMS9Y-0004CJ-3y; Tue, 22 Feb 2022 10:12:16 +0000
Received: by outflank-mailman (input) for mailman id 276629;
 Tue, 22 Feb 2022 10:12:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nMS9W-0004CB-Di
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 10:12:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nMS9V-0001P4-Ni; Tue, 22 Feb 2022 10:12:13 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232] helo=[192.168.9.70])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nMS9V-00034J-Hd; Tue, 22 Feb 2022 10:12:13 +0000
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
	bh=M1G0fvJiOdsUQhk8JK3u8LuMlrfVoGz0NngWLNWF8wE=; b=2txrwz7q56EoOkylZ4ywyhDhx3
	cmA7CsiM+MWOdlH4RhEKEYV58NLcTjioMsnOcqHNF+ZE5nOFbseXtxZvNrrSlRs2bRxMpNjbcEjvo
	CYW8N36l0dsaPwnNbNCnqmkm/txzmempVBjO6LT24x6kWXV4UzUSvz4D/RGZ8Q7KA3Es=;
Message-ID: <0d089ace-f35f-b7ad-fe25-db937a00e802@xen.org>
Date: Tue, 22 Feb 2022 10:12:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH] xen/arm: Rename psr_mode_is_32bit to regs_mode_is_32bit
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20220221105931.12028-1-michal.orzel@arm.com>
 <1531f49d-c74c-8a41-a917-cfe76bee8e7d@xen.org>
 <05b5877b-7dc0-3d35-f073-5721e1605321@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <05b5877b-7dc0-3d35-f073-5721e1605321@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 22/02/2022 07:07, Michal Orzel wrote:
> Hi Julien,

Hi Michal,

> On 21.02.2022 16:58, Julien Grall wrote:
>> Hi Michal,
>>
>> On 21/02/2022 10:59, Michal Orzel wrote:
>>> Following a discussion [1] it seems like that renaming work has
>>> been forgotten.
>>
>> This is in my todo list of clean-up I need to do for Xen. But I haven't yet had a chance to look at it. Thank you for taking a look!
>>
>>> Perform renaming of psr_mode_is_32bit to
>>> regs_mode_is_32bit as the function no longer takes psr parameter.
>>
>> If we modify psr_mode_is_32bit(), then we should also modify psr_mode_is_user() because they have the same prototype and we should keep the naming consistent.
>>
> Ok, I agree. Do you think this should be done in a separate patch?

I am fine either way so long the two changes are committed together.

Cheers,

-- 
Julien Grall

