Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A29F32B9BD
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 19:09:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92957.175371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHVvT-0003sy-DR; Wed, 03 Mar 2021 18:08:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92957.175371; Wed, 03 Mar 2021 18:08:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHVvT-0003sc-AD; Wed, 03 Mar 2021 18:08:47 +0000
Received: by outflank-mailman (input) for mailman id 92957;
 Wed, 03 Mar 2021 18:08:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lHVvR-0003sX-OY
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 18:08:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lHVvQ-00065t-18; Wed, 03 Mar 2021 18:08:44 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lHVvP-000446-Ll; Wed, 03 Mar 2021 18:08:43 +0000
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
	bh=NyJ73P3bQHFqcw0vKIRcuIkPNDOKYqDain6zidlOdIE=; b=TMGzD3KPHS9Yrk6LIYc3/jm554
	QXQSemwawvMO0kmZ8o4xZh6TkgVATuufi3J5Ourom6F+3RklcuSYzi3uS4Dr1HU84EpZf8UwcfaZD
	fHtcphSICml8w5arGqdAkifAnamT51UU8o86d3ebKKw8QkGC3aM67g1bVlriej9My1Kw=;
Subject: Re: [PATCH for-4.15] tools/xenstored: liveupdate: Properly check long
 transaction
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, raphning@amazon.co.uk,
 Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Bjoern Doebel <doebel@amazon.de>
References: <20210303170526.15903-1-julien@xen.org>
 <24639.51758.530818.933444@mariner.uk.xensource.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2ee798da-bb57-919d-f35e-1be5aa1abcce@xen.org>
Date: Wed, 3 Mar 2021 18:08:41 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <24639.51758.530818.933444@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Ian,

On 03/03/2021 17:41, Ian Jackson wrote:
> Julien Grall writes ("[PATCH for-4.15] tools/xenstored: liveupdate: Properly check long transaction"):
>> From: Julien Grall <jgrall@amazon.com>
>>
>> As XenStored is single-threaded, conn->ta_start_time will always be
>> smaller than now. As we substract the latter from the former, it means
>> a transaction will never be considered long running.
>>
>> Invert the two operands of the substraction in both lu_reject_reason()
>> and lu_check_allowed(). In addition to that, the former also needs to
>> check that conn->ta_start_time is not 0 (i.e the transaction is not
>> active).
>>
>> Take the opportunity to document the return condition of
>> lu_check_allowed().
> 
> AFAICT this only affects live updated which is not security-supported
> in 4.15 and which won't block our tests. 

That's correct.

> So:
> 
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Thanks!

Cheers,

-- 
Julien Grall

