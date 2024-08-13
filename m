Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06527950E35
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 22:59:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776631.1186800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdybs-0007qM-BO; Tue, 13 Aug 2024 20:59:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776631.1186800; Tue, 13 Aug 2024 20:59:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdybs-0007nH-8r; Tue, 13 Aug 2024 20:59:16 +0000
Received: by outflank-mailman (input) for mailman id 776631;
 Tue, 13 Aug 2024 20:59:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sdybq-0007nA-Q0
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 20:59:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sdybq-00071a-5r; Tue, 13 Aug 2024 20:59:14 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sdybq-0007fY-0h; Tue, 13 Aug 2024 20:59:14 +0000
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
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=6LcHDRfMqWcsVyiSNUhdYyYZ9aYRRqYrxG/vj9VEXAQ=; b=YeRtOz005qCvGo05gC+jMWMeVw
	6ZwlI08BbwrzfqL2f/rv84raA7MoWZbA1fXW8ans5KGJrL5P91+lzPEMHN40X8AtN7f4GM34TXxez
	k46Fs+igdK56yPcDUsd5v28RSHpfnf0A7Pommo5RP/gxt0+l9HIXMFeMrAFGwQFjV6eE=;
Message-ID: <308c6067-0d0d-4dc2-85fe-4bc956f99e16@xen.org>
Date: Tue, 13 Aug 2024 21:59:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm64: entry: Actually skip do_trap_*() when an
 SError is triggered
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240806124815.53492-1-julien@xen.org>
 <a27a865a-8a23-4185-9b31-d5fc6e362812@amd.com>
 <c1178d7a-ac95-4022-82d5-8da5901b6f43@xen.org>
In-Reply-To: <c1178d7a-ac95-4022-82d5-8da5901b6f43@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 06/08/2024 14:30, Julien Grall wrote:
> 
> 
> On 06/08/2024 14:26, Michal Orzel wrote:
>> Hi Julien,
>>
>> On 06/08/2024 14:48, Julien Grall wrote:
>>>
>>>
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> For SErrors, we support two configurations:
>>>    * Every SErrors will result to a panic in Xen
>>>    * We will forward SErrors triggered by a VM back to itself
>>>
>>> For the latter case, we want to skip the call to do_trap_*() because 
>>> the PC
>>> was already adjusted.
>>>
>>> However, the alternative used to decide between the two configurations
>>> is inverted. This would result to the VM corrupting itself if:
>>>    * x19 is non-zero in the panic case
>>>    * advance PC too much in the second case
>>>
>>> Solve the issue by switch from alternative_if to alternative_if_not.
>>>
>>> Fixes: a458d3bd0d25 ("xen/arm: entry: Ensure the guest state is 
>>> synced when receiving a vSError")
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> Acked-by: Michal Orzel <michal.orzel@amd.com>
>>
>>>
>>> ----
>> 3 instead of 4 dashes
> 
> I will fixed it.
> 
> The patchqueue tool I am using will strip anything after "---". So I am 
> using ---- to version changelog... I tend to forget that I need to 
> manually call sed -i 's/^----/---/' *.patch before sending every patch.

This is now committed.

Cheers,

-- 
Julien Grall

