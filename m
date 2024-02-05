Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2829F84A70A
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 22:21:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676511.1052671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX6PA-00008u-FP; Mon, 05 Feb 2024 21:21:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676511.1052671; Mon, 05 Feb 2024 21:21:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX6PA-00006N-C8; Mon, 05 Feb 2024 21:21:28 +0000
Received: by outflank-mailman (input) for mailman id 676511;
 Mon, 05 Feb 2024 21:21:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rX6P8-00006H-Di
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 21:21:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rX6P5-0007RS-Tz; Mon, 05 Feb 2024 21:21:23 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rX6P5-00088N-NL; Mon, 05 Feb 2024 21:21:23 +0000
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
	bh=GSC24i2dQ31Wyy1eONMEhN79Ac5qxXifBbooRVtuCaw=; b=nub6J2VdbpUsGUDthSi9tAtn+w
	xqzBQxBLUgFg1wKm7fje8YtD77o+PZ9oxVD567U0C/qUSBZa7ykZQ6M7mjfhhX5cHBSU/45Q9z4gg
	DCiuHRkHw61yI0IlvlxfksV9Qrsz2+Pb0An6A0IGhjbDbF/iXl5f0g5v/sck1M7aSENc=;
Message-ID: <cbdf382c-a688-45f5-b834-9e3ab70ffc53@xen.org>
Date: Mon, 5 Feb 2024 21:21:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] Remove useless assignment
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20240205104637.14868-1-frediano.ziglio@cloud.com>
 <alpine.DEB.2.22.394.2402051241240.1925432@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2402051241240.1925432@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

The tag says '2/5' but I don't see a thread. Is the series meant to 
contain more patches?

Also, the title is not very specific about where the assignment is 
removed. I have committed with the following title:

xen/evtchn: Remove useful assignment in evtchn_alloc_unbound

On 05/02/2024 20:41, Stefano Stabellini wrote:
> On Mon, 5 Feb 2024, Frediano Ziglio wrote:
>> The variable is assigned later, that value is never used.

I also add 'rc' just for clarity.

>>
>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
>> ---
>>   xen/common/event_channel.c | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
>> index a7a004a084..15aec5dcbb 100644
>> --- a/xen/common/event_channel.c
>> +++ b/xen/common/event_channel.c
>> @@ -324,8 +324,6 @@ int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc, evtchn_port_t port)
>>           goto out;
>>       }
>>   
>> -    rc = 0;
>> -

This looks like a missing clean-up from e5ba5165cae6 ("xen/evtchn: Purge 
ERROR_EXIT{,_DOM}()").

Cheers,

-- 
Julien Grall

