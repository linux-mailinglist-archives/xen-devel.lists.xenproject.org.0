Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D686C3BC829
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 10:57:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150915.278977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0gss-00085h-KF; Tue, 06 Jul 2021 08:56:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150915.278977; Tue, 06 Jul 2021 08:56:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0gss-000830-H5; Tue, 06 Jul 2021 08:56:50 +0000
Received: by outflank-mailman (input) for mailman id 150915;
 Tue, 06 Jul 2021 08:56:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m0gsr-00082u-Vd
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 08:56:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m0gsr-0005Dj-5Z; Tue, 06 Jul 2021 08:56:49 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m0gsq-0005dG-VX; Tue, 06 Jul 2021 08:56:49 +0000
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
	MIME-Version:Date:Message-ID:References:Cc:To:From:Subject;
	bh=tX5+4XY3956Gy8wlFKkUsjk3CnAtnQatEPJpgnOEWEc=; b=2xOiIqFn9AdV7ba4fFbaClgCoJ
	EBCBgWNgo8F5g0yrMe7hC4DoAyYz5uEdsfp6INEwbZYL+fmCes2/glV3IefMwQJ+E2FIxt8aNU6y7
	L7nyf0owAvtugp3I9uYVCUJJ0zTlVzbqzwntr5RjBGBdfnhinlbpEvSUZleRkNLT/IEU=;
Subject: Re: [PATCH V2] xen/arm: bootfdt: Always sort memory banks
From: Julien Grall <julien@xen.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1625507331-17934-1-git-send-email-olekstysh@gmail.com>
 <5efd21da-bd26-64bd-4a79-67a955addbd1@xen.org>
Message-ID: <dd620d87-a1ba-2fa9-3505-36ee2f5d6514@xen.org>
Date: Tue, 6 Jul 2021 09:56:47 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5efd21da-bd26-64bd-4a79-67a955addbd1@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 06/07/2021 09:52, Julien Grall wrote:
> Hi Oleksandr,
> 
> On 05/07/2021 18:48, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> At the moment, Xen on Arm64 expects the memory banks to be ordered.
>> Unfortunately, there may be a case when updated by firmware
>> device tree contains unordered banks. This means Xen will panic
>> when setting xenheap mappings for the subsequent bank with start
>> address being less than xenheap_mfn_start (start address of
>> the first bank).
>>
>> As there is no clear requirement regarding ordering in the device
>> tree, update code to be able to deal with by sorting memory
>> banks. There is only one heap region on Arm32, so the sorting
>> is fine to be done in the common code.
>>
>> Suggested-by: Julien Grall <jgrall@amazon.com>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

And committed.

Cheers,

-- 
Julien Grall

