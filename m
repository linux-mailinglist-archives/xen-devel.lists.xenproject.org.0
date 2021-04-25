Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9824E36A92B
	for <lists+xen-devel@lfdr.de>; Sun, 25 Apr 2021 22:20:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.117350.223219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lalET-0002i4-NG; Sun, 25 Apr 2021 20:19:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117350.223219; Sun, 25 Apr 2021 20:19:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lalET-0002hf-K2; Sun, 25 Apr 2021 20:19:57 +0000
Received: by outflank-mailman (input) for mailman id 117350;
 Sun, 25 Apr 2021 20:19:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lalER-0002ha-Pg
 for xen-devel@lists.xenproject.org; Sun, 25 Apr 2021 20:19:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lalER-0000vY-Fj; Sun, 25 Apr 2021 20:19:55 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lalER-00068g-6J; Sun, 25 Apr 2021 20:19:55 +0000
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
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=ug2O5bX0F+VGmViQca4vCK0pBhVytLBv0K5BxrV+pbA=; b=hTPj6F+DKppW898qF4fktcGw3S
	xIkDFQGkLusPhy/IsEd1BhNVdvOrLcPrwvB0d0wa0RVkChMg1vkZOv+dIPNebd/2GXACx2dI0RB74
	ZvxSfvtgZYJbhCrt4mb0WoHBpeG+UwdT3UMwrEtGICoFMJoJxqgOcKhy/ZtDX5ASxPko=;
Subject: Re: Discussion of Xenheap problems on AArch64
To: Henry Wang <Henry.Wang@arm.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Chen <Wei.Chen@arm.com>, Penny Zheng <Penny.Zheng@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <PA4PR08MB6253F49C13ED56811BA5B64E92479@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <cdde98ca-4183-c92b-adca-801330992fc5@xen.org>
 <PA4PR08MB62538BBA256E66A0415F0C7192479@PA4PR08MB6253.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f14aa1d6-35d2-a9a3-0672-7f0d3ae3ec89@xen.org>
Date: Sun, 25 Apr 2021 21:19:53 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <PA4PR08MB62538BBA256E66A0415F0C7192479@PA4PR08MB6253.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 21/04/2021 10:32, Henry Wang wrote:
> Hi Julien,

Hi Henry,

>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: Wednesday, April 21, 2021 5:04 PM
>> To: Henry Wang <Henry.Wang@arm.com>; sstabellini@kernel.org; xen-
>> devel@lists.xenproject.org
>> Cc: Wei Chen <Wei.Chen@arm.com>; Penny Zheng
>> <Penny.Zheng@arm.com>; Bertrand Marquis <Bertrand.Marquis@arm.com>
>> Subject: Re: Discussion of Xenheap problems on AArch64
>>
>>
>>
>> On 21/04/2021 07:28, Henry Wang wrote:
>>> Hi,
>>
>> Hi Henry,
>>
>>>
>>> We are trying to implement the static memory allocation on AArch64. Part
>> of
>>> this feature is the reserved heap memory allocation, where a specific range
>> of
>>> memory is reserved only for heap. In the development process, we found a
>>> pitfall in current AArch64 setup_xenheap_mappings() function.
>>>
>>> According to a previous discussion in community
>>> https://lore.kernel.org/xen-devel/20190216134456.10681-1-
>> peng.fan@nxp.com/,
>>> on AArch64, bootmem is initialized after setup_xenheap_mappings(),
>>> setup_xenheap_mappings() may try to allocate memory before memory
>> has been
>>> handed over to the boot allocator. If the reserved heap memory allocation
>> is
>>> introduced, either of below 2 cases will trigger a crash:
>>>
>>> 1. If the reserved heap memory is at the end of the memory block list and
>> the
>>> gap between reserved and unreserved memory is bigger than 512GB, when
>> we setup
>>> mappings from the beginning of the memory block list, we will get OOM
>> caused
>>> by lack of pages in boot allocator. This is because the memory that is
>> reserved
>>> for heap has not been mapped and added to the boot allocator.
>>>
>>> 2. If we add the memory that is reserved for heap to boot allocator first,
>> and
>>> then setup mappings for banks in the memory block list, we may get a page
>> which
>>> has not been setup mapping, causing a data abort.
>>
>> There are a few issues with setup_xenheap_mappings(). I have been
>> reworking the code on my spare time and started to upstream bits of it.
>> A PoC can be found here:
>>
>> https://xenbits.xen.org/gitweb/?p=people/julieng/xen-
>> unstable.git;a=shortlog;h=refs/heads/pt/dev
>>
> 
> Really great news! Thanks you very much for the information and your hard
> work on the PoC :) I will start to go through your PoC code then.

I spent sometimes today to clean-up the PoC and sent a series on the ML 
(see [1]). This has been lightly tested so far.

Would you be able to give a try and let me know if it helps your problem?

For convenience, I have pushed a branch with the series applied here:

https://xenbits.xen.org/gitweb/?p=people/julieng/xen-unstable.git;a=shortlog;h=refs/heads/pt/rfc-v2

Cheers,

[1] https://lore.kernel.org/xen-devel/20210425201318.15447-1-julien@xen.org/

-- 
Julien Grall

