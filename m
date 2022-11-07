Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EDC61FE1D
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 20:01:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439598.693646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1os7Mj-0002E7-4o; Mon, 07 Nov 2022 19:01:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439598.693646; Mon, 07 Nov 2022 19:01:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1os7Mj-0002Bq-1y; Mon, 07 Nov 2022 19:01:01 +0000
Received: by outflank-mailman (input) for mailman id 439598;
 Mon, 07 Nov 2022 19:00:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1os7Mh-0002Bk-FY
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 19:00:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1os7Mh-0006qA-0d; Mon, 07 Nov 2022 19:00:59 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.25.99]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1os7Mg-0004in-Nr; Mon, 07 Nov 2022 19:00:58 +0000
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
	bh=b7ir6/IhUCtGyHfS+Nzmm4aXt6Qy9706LzlqhPlFRA4=; b=usupigZLKaVMRJGvq3aopuIohy
	6ax6KIdLpSPbbBRSwX3xmKWgU0P6NhE0Hz4Rg4Z8U8zndDA6YSMvy7zkQdPu1/6jAgPXmzVzRZH3m
	EZLy1PJdR9mTNHTn9qfI4ypuwVARLz/Pg8BVDJrcxyg5ru5SlImhl0QLe3XKfqbt4/ys=;
Message-ID: <b6666d77-6f80-d8c8-9f6a-b08252555c2d@xen.org>
Date: Mon, 7 Nov 2022 19:00:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v6 02/11] xen/arm: add iounmap after initrd has been
 loaded in domain_build
Content-Language: en-US
From: Julien Grall <julien@xen.org>
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
 <20221104100741.2176307-3-wei.chen@arm.com>
 <a3b0c695-3e2f-7529-39c6-2e4c23ee9b78@xen.org>
In-Reply-To: <a3b0c695-3e2f-7529-39c6-2e4c23ee9b78@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/11/2022 18:55, Julien Grall wrote:
> (+ Henry)
> 
> Hi,
> 
> On 04/11/2022 10:07, Wei Chen wrote:
>> domain_build use ioremap_wc to map a new non-cacheable virtual
> 
> s/use/uses/
> 
>> address for initrd. After Xen copy initrd from this address to
>> guest, this new allocated virtual address has not been unmapped.
>>
>> So in this patch, we add an iounmap to the end of domain_build,
>> after Xen loaded initrd to guest memory.
>>
> 
> Please a fixes tag. The issue was introduced by commit bb7e6d565d92.

Well I forgot to add it on commit :/. I will try to remember to backport it.

Cheers,

-- 
Julien Grall

