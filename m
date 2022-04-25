Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8108050E214
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 15:43:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312988.530424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niyze-0007MY-W4; Mon, 25 Apr 2022 13:43:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312988.530424; Mon, 25 Apr 2022 13:43:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niyze-0007Jt-SM; Mon, 25 Apr 2022 13:43:10 +0000
Received: by outflank-mailman (input) for mailman id 312988;
 Mon, 25 Apr 2022 13:43:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1niyzd-0007Jn-VA
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 13:43:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1niyza-0004DA-GV; Mon, 25 Apr 2022 13:43:06 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[192.168.15.211]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1niyza-0007yW-9K; Mon, 25 Apr 2022 13:43:06 +0000
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
	bh=SIRyqshOu0DGw1xfId/vUcFwO7nyD0yx3usILzwM/Jc=; b=62WbAMgoZEwCA0AztidelRDKRW
	qEzXS6kO7TsnRUrGeJe1/6OSnKAVGF0BVGxwotJ47hnoeQuixyIUk+odrKHtmxo5EiTWmXuKxeJ0W
	U+nsNR6xL4oYKezVCqbieil3cVcyV8O2KXw9fJcsF+qK30Sg8TkSkNUDH0thVdaUe9tk=;
Message-ID: <74500983-79f8-07a9-7dcf-54a7bc162061@xen.org>
Date: Mon, 25 Apr 2022 14:43:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [PATCH v4] page_alloc: assert IRQs are enabled in heap alloc/free
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 David Vrabel <dvrabel@amazon.co.uk>, David Vrabel <dvrabel@cantab.net>,
 xen-devel@lists.xenproject.org
References: <20220425132801.1076759-1-dvrabel@cantab.net>
 <4fbc28f9-5a0e-5ed2-12a7-d2bfd63af633@xen.org>
 <afb15744-5e80-6c40-069e-6fc076e40e3d@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <afb15744-5e80-6c40-069e-6fc076e40e3d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 25/04/2022 14:37, Jan Beulich wrote:
> On 25.04.2022 15:34, Julien Grall wrote:
>> On 25/04/2022 14:28, David Vrabel wrote:
>>> --- a/xen/common/page_alloc.c
>>> +++ b/xen/common/page_alloc.c
>>> @@ -162,6 +162,13 @@
>>>    static char __initdata opt_badpage[100] = "";
>>>    string_param("badpage", opt_badpage);
>>>    
>>> +/*
>>> + * Heap allocations may need TLB flushes which require IRQs to be
>>
>> The comment needs to be updated to reflect the fact that at least Arm
>> doesn't use IPI to flush TLBs.
> 
> I thought the use of "may" was satisfying your earlier request?

Maybe I read wrongly this comment... To me, anything after 'which' is 
optional (it is a non-defining clause) and describe how the TLB flushes 
works. So the 'may' here is referring to the possibility to use flush TLB.

Cheers,

-- 
Julien Grall

