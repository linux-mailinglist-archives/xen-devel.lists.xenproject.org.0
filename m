Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5606732CFD8
	for <lists+xen-devel@lfdr.de>; Thu,  4 Mar 2021 10:40:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93074.175686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHkSC-00085c-4L; Thu, 04 Mar 2021 09:39:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93074.175686; Thu, 04 Mar 2021 09:39:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHkSC-00085D-1O; Thu, 04 Mar 2021 09:39:32 +0000
Received: by outflank-mailman (input) for mailman id 93074;
 Thu, 04 Mar 2021 09:39:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lHkSA-000858-Ga
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 09:39:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lHkS9-0007xl-2Z; Thu, 04 Mar 2021 09:39:29 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lHkS8-0004Xo-Mm; Thu, 04 Mar 2021 09:39:28 +0000
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
	bh=1C5pfvFivTPIGOBAnmXMsiW8PgkMElblzFfAjvNacds=; b=KYZg/ZIncLC54i+Hr3h4ytTYEj
	St+69h+VGYeUrCeRYFAzz4uvSetqjN55e0zzTSOs/MEtINXQQxj5awBQYmFMtbnkrCWhR5z4Kpmou
	VW2ulMKpIvMavHNnePL2XO+wIMvtb5ib3kXN7qvZsH+u2FoUTqSWvSiSiAcJPp6FXIy0=;
Subject: Re: [PATCH for-4.15] tools/xenstored: liveupdate: Properly check long
 transaction
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>,
 Bjoern Doebel <doebel@amazon.de>
References: <20210303170526.15903-1-julien@xen.org>
 <9f81d0c8-1ec8-7cd0-d943-fd31bc86de13@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6c2f8459-b109-9a16-79c1-ab92969c4ece@xen.org>
Date: Thu, 4 Mar 2021 09:39:26 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <9f81d0c8-1ec8-7cd0-d943-fd31bc86de13@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 04/03/2021 09:00, Jürgen Groß wrote:
> On 03.03.21 18:05, Julien Grall wrote:
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
>>
>> Fixes: e04e53a5be20 ("tools/xenstore: allow live update only with no 
>> transaction active")
>> Reported-by: Bjoern Doebel <doebel@amazon.de>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>
> 
>>
>> ---
>>
>> I am a bit puzzled on how -F is implemented. From my understanding we
>> will force LiveUpdate when one of the following conditions is met:
>>    1) All the active transactions are long running
>>    2) If we didn't manage to LiveUpdate after N sec
>>
>> It is not quite clear why we need the both as 2) would indirectly cover
>> 1). However 2) is probably unsafe as we may reset transactions for
>> "well-behaving" guest.
>>
>> So I am thinking to send a patch to drop 2). Any opinions?
> 
> This will enable two guests working together to block LU by using
> overlapping transactions:
> 
> Guest 1: ----- ----- -----  ...
> Guest 2: -- ----- ----- --- ... >
> There is always a transaction active, but none is regarded to be
> long running.

Right, how do you know whether two guests are working together?

I understand that "-F" means that things could break... However, I am 
not entirely sure who can realistically use this option without risking 
breaking other guests. For instance, there might be a 3rd guest that has 
an active transaction and not cooperating with the first two.

Rather than forcing in this case, how about we quiesce the connection if 
it starts a transaction when LiveUpdate is pending?

Cheers,

-- 
Julien Grall

