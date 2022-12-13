Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECA664BE80
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 22:34:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461231.719299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5CvJ-0004t6-Ka; Tue, 13 Dec 2022 21:34:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461231.719299; Tue, 13 Dec 2022 21:34:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5CvJ-0004rL-Hg; Tue, 13 Dec 2022 21:34:49 +0000
Received: by outflank-mailman (input) for mailman id 461231;
 Tue, 13 Dec 2022 21:34:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p5CvI-0004rD-5D
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 21:34:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5CvI-0003zv-1r; Tue, 13 Dec 2022 21:34:48 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5CvH-0001Bi-TW; Tue, 13 Dec 2022 21:34:48 +0000
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
	bh=nukfUzNjk3FeVDxFZNyoJNwPhsu1/XSGo408LdITb7I=; b=KowsZ2b1ShlSEQ/TK/b/VTPpo9
	OIPMoYQNsX7Mo5MZzZedZUeDi+nZMeoXrIoC+oDqFkwotIMleYAMS6PqI8QyoGbkoUN1FwTdz+7Qc
	5c05ygMO5aEJut3LvLSjcqCRMyReOrX6/KbTqCbA7mEhSR6a3ipCdaUI4tTtVlHnRGr8=;
Message-ID: <5767e87a-b280-4c9e-4815-869d045fafff@xen.org>
Date: Tue, 13 Dec 2022 21:34:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] xen/arm: Reduce redundant clear root pages when teardown
 p2m
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221212064119.2632626-1-Henry.Wang@arm.com>
 <65819ff9-1a1a-dfc3-f700-289dd8c340dc@xen.org>
 <AS8PR08MB799154878CCA46EE1A1B998D92E29@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB799154878CCA46EE1A1B998D92E29@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/12/2022 11:27, Henry Wang wrote:
> Hi Julien,

Hi,

>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Subject: Re: [PATCH] xen/arm: Reduce redundant clear root pages when
>> teardown p2m
>>
>> Hi Henry,
>>
>>>        PROGRESS(p2m):
>>> +        /*
>>> +         * We are about to free the intermediate page-tables, so clear the
>>> +         * root to prevent any walk to use them.
>>> +         */
>>> +        p2m_clear_root_pages(&d->arch.p2m);
>>
>> The commit message suggests this should only be called once. However,
>> you will still end up to call p2m_clear_root_pages() multiple time if
>> p2m_teardown() is preempted.
> 
> Thanks for confirming this, would adding another PROGRESS stage
> such as PROGRESS(p2m_clean) before PROGRESS(p2m) seem ok to you?

The would be fine with me.

Cheers,

-- 
Julien Grall

