Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3534C4B0C
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 17:42:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279527.477254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNdf1-0000mt-Pn; Fri, 25 Feb 2022 16:41:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279527.477254; Fri, 25 Feb 2022 16:41:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNdf1-0000kP-Ln; Fri, 25 Feb 2022 16:41:39 +0000
Received: by outflank-mailman (input) for mailman id 279527;
 Fri, 25 Feb 2022 16:41:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nNdez-0000kJ-Lb
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 16:41:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nNdez-0006Fy-27; Fri, 25 Feb 2022 16:41:37 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.31.13]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nNdey-0003Rr-SF; Fri, 25 Feb 2022 16:41:37 +0000
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
	bh=j+s4BpypqEYU8nIQ67lJ3CtDHpzFI93+yBN3Gy8tHhM=; b=u1LzNFod7GHpxZuWJvtDRYPJM0
	n5LubCJDdUrL0/GaRgKA5Bj7hw8OZTiBgXII/882FtfpUJYALCCSyiY6QyV0cwgGl4BaAk3XQGmJ9
	OrglOEH+6XzmUiSLyoXPEPBtXG4aM9SlxQr0MHAO3yy6TaKtuWouEyl6vofvhD18HuWI=;
Message-ID: <9c6bbed2-14a1-87e9-cce0-dbc8e4488324@xen.org>
Date: Fri, 25 Feb 2022 16:41:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v3 03/19] xen/arm: p2m: Replace level_{orders, masks}
 arrays with XEN_PT_LEVEL_{ORDER, MASK}
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220221102218.33785-1-julien@xen.org>
 <20220221102218.33785-4-julien@xen.org>
 <66B2C3AB-A61C-4CC7-8249-AA925B2774FD@arm.com>
 <7a92b31a-ff09-3263-c25f-aba420adcce3@xen.org>
 <17D9F4AB-0FB1-4827-A564-4EBBDECF977A@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <17D9F4AB-0FB1-4827-A564-4EBBDECF977A@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 25/02/2022 08:27, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

> 
>> On 24 Feb 2022, at 22:41, Julien Grall <julien@xen.org> wrote:
>>
>>
>>
>> On 22/02/2022 15:55, Bertrand Marquis wrote:
>>> Hi Julien,
>>
>> Hi Bertrand,
>>
>>>> On 21 Feb 2022, at 10:22, Julien Grall <julien@xen.org> wrote:
>>>>
>>>> From: Julien Grall <jgrall@amazon.com>
>>>>
>>>> The array level_orders and level_masks can be replaced with the
>>>> recently introduced macros LEVEL_ORDER and LEVEL_MASK.
>>>>
>>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>> One open question: At this stage the convenience aliases that you
>>> kept in include/asm/lpae.h are used in a very limited number of places.
>>
>> I am not sure I would call it very limited:
>>
>> 42sh> ack "(FIRST|SECOND|THIRD)_(ORDER|SHIFT|MASK)" | wc -l
>> 65
>>
>> That's including the 9 definitions.
> 
> My bad I looked with your full serie in my tree.
> 
>>
>>> Could we remove those and use only XEN_PT_LEVEL_* to make the
>>> code a bit more coherent.
>>
>> I made an attempt in the past and it resulted to longer line in assembly. So I am on the fence to whether the aliases should be completely removed.
>>
>> At the same time, XEN_PT_LEVEL(...) is handy for places where we don't know at compile time the level.
> 
> One other big argument for making the switch is that XEN_PT_LEVEL is far more specific then FIRST_ORDER and others which are very unspecific names.

How about renaming them to XEN_PT_L0_ORDER? Or maybe XPT_L0_ORDER?

This would allows us to keep the assembly line relatively short.

Cheers,

-- 
Julien Grall

