Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C6672F8B0
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 11:08:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548603.856601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9MTh-00079t-Fq; Wed, 14 Jun 2023 09:07:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548603.856601; Wed, 14 Jun 2023 09:07:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9MTh-000770-C8; Wed, 14 Jun 2023 09:07:45 +0000
Received: by outflank-mailman (input) for mailman id 548603;
 Wed, 14 Jun 2023 09:07:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q9MTg-00076s-KV
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 09:07:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q9MTc-0005FC-O0; Wed, 14 Jun 2023 09:07:40 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.9.244]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q9MTc-0001hg-HV; Wed, 14 Jun 2023 09:07:40 +0000
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
	bh=hxeLzK98mBRCxEJBY+3ja56BaP9taQEScs3KdlkAk6E=; b=a//fipWBHpvwdxkyHXekWJZ2Bd
	B4ajQWHUS6mcXRddt7wgoGu2mg1M2QOGd4S89sBrliJ2QcqWNLpSHOoFwbzUfTZcsXviNQT+X7FUo
	OmCxq9kK98qvdEnV8h2TuNahu1aZPQg4GV4ljqcYJJfhmy6aA0FPjDl5wm5LkSzqRb28=;
Message-ID: <ef9ba8bd-0019-10b2-631f-9a64505fe016@xen.org>
Date: Wed, 14 Jun 2023 10:07:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH] xen/evtchn: Purge ERROR_EXIT{,_DOM}()
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230613162220.3052184-1-andrew.cooper3@citrix.com>
 <c23a8396-a4e5-f6f8-9be9-b56c2c4ebdab@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c23a8396-a4e5-f6f8-9be9-b56c2c4ebdab@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 14/06/2023 07:59, Jan Beulich wrote:
> On 13.06.2023 18:22, Andrew Cooper wrote:
>> These are disliked specifically by MISRA, but they also interfere with code
>> legibility by hiding control flow.  Expand and drop them.
>>
>>   * Rearrange the order of actions to write into rc, then render rc in the
>>     gdprintk().
>>   * Drop redundant "rc = rc" assignments
>>   * Switch to using %pd for rendering domains
> 
> With this change, ...
> 
>> No functional change.  Resulting binary is identical.
> 
> ... I doubt this. Even .text being entirely identical would be pure luck,
> as message offsets might change slightly depending on how much padding
> the compiler inserts between them. Furthermore I wonder whether ...
> 
>> @@ -336,7 +319,11 @@ int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc, evtchn_port_t port)
>>   
>>       port = rc = evtchn_get_port(d, port);
>>       if ( rc < 0 )
>> -        ERROR_EXIT(rc);
>> +    {
>> +        gdprintk(XENLOG_WARNING, "EVTCHNOP failure: error %d\n", rc);
>> +        goto out;
>> +    }
> 
> ... it wouldn't make sense to mention the actual operation that failed,
> now that each function has its own message(s). In turn I question the
> usesfulness of "error" in the message text.
> 
> Then again I wonder whether it isn't time to purge these gdprintk()s
> altogether. Surely they served a purpose for bringing up initial Linux
> and mini-os and alike, but that's been two decades ago now.

There are still port of new OS on Xen (e.g. QNX, FreeRTOS...) happening 
time to time. Also, having messages in error path is something I wish 
most of Xen had. Quite often when I end up to debug an hypercall, I will 
add printks().

So I am not in favor of removing the gdprintk()s.

Cheers,

-- 
Julien Grall

