Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DA97ADF74
	for <lists+xen-devel@lfdr.de>; Mon, 25 Sep 2023 21:14:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608101.946393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkr2e-0005eK-CK; Mon, 25 Sep 2023 19:14:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608101.946393; Mon, 25 Sep 2023 19:14:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkr2e-0005cC-9J; Mon, 25 Sep 2023 19:14:48 +0000
Received: by outflank-mailman (input) for mailman id 608101;
 Mon, 25 Sep 2023 19:14:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qkr2c-0005c4-ND
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 19:14:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qkr2c-000800-E9; Mon, 25 Sep 2023 19:14:46 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qkr2c-0003gn-7s; Mon, 25 Sep 2023 19:14:46 +0000
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
	bh=du+o7UoYB26LcHm49V1c3TzfqKJHEJjZbvWnnX50IeM=; b=T0p3IsAnpiMhGb3L/UdHA9BYPm
	1K2//nq7T/oCjR0AIOdqqsuE0YfIidD4vOYDDrY0tanyG4y8i84HYMzl2RDuyvT0LNS48jdQ3KOrJ
	FpTn4AB3sCwBHu9xkgc9//92jp8SCITYeUlXk+Nauw7MnAzYiD97TGkr6UhhcvWSGc1o=;
Message-ID: <be89552d-8d00-463b-a6a9-d54b8a26f8a9@xen.org>
Date: Mon, 25 Sep 2023 20:14:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for-4.18] Re: [PATCH v2] ARM: GICv3 ITS: flush caches for newly
 allocated ITT
Content-Language: en-GB
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Henry Wang <Henry.Wang@arm.com>
References: <20230922222710.1383808-1-volodymyr_babchuk@epam.com>
 <d4ab6108-b190-437e-bd15-af9afb086794@xen.org> <87lecudqon.fsf@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <87lecudqon.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 25/09/2023 20:00, Volodymyr Babchuk wrote:
> 
> Hi Julien, Henry,
> 
> Julien Grall <julien@xen.org> writes:
> 
>> Hi,
>>
>> (Adding [for-4.18] in the title for Henry to spot the request)
>>
>> On 22/09/2023 23:27, Volodymyr Babchuk wrote:
>>> ITS manages Device Tables and Interrupt Translation Tables on its own,
>>> so generally we are not interested in maintaining any coherence with
>>> CPU's view of those memory regions, except one case: ITS requires that
>>> Interrupt Translation Tables should be initialized with
>>> zeroes. Existing code already does this, but it does not cleans
>>> caches afterwards. This means that ITS may see un-initialized ITT and
>>> CPU can overwrite portions of ITT later, when it finally decides to
>>> flush caches. Visible effect of this issue that there are not
>>> interrupts delivered from a device.
>>> Fix this by calling clean_and_invalidate_dcache_va_range() for newly
>>> allocated ITT.
>>>
>>
>> I would consider to add:
>>
>> Fixes: 69082e1c210d ("ARM: GICv3 ITS: introduce device mapping")
> 
> May I ask you (or Henry?) to add this when you'll commit this change? Or
> should I publish an updated version?

I can do it on commit.

Cheers,

-- 
Julien Grall

