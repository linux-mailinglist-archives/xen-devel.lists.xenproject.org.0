Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CC84A8601
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 15:17:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264848.458104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFcve-0002kg-61; Thu, 03 Feb 2022 14:17:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264848.458104; Thu, 03 Feb 2022 14:17:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFcve-0002hY-2h; Thu, 03 Feb 2022 14:17:42 +0000
Received: by outflank-mailman (input) for mailman id 264848;
 Thu, 03 Feb 2022 14:17:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nFcvc-0002hQ-KD
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 14:17:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nFcvc-0007O4-6G; Thu, 03 Feb 2022 14:17:40 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231] helo=[10.7.236.11])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nFcvb-0000hK-UF; Thu, 03 Feb 2022 14:17:40 +0000
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
	bh=2yZRJYN+KPdbLlGPiBYn6xr01jOJPi6GUN30y1HB3DY=; b=5AZOda9x6ICFDcOwqWB7tAMTrw
	6SHLAkA1Y/JEn8qIXVmpK45Z402jEK5NXZnU8ptzqZQs5NeTKiFsJX3aBSHoksZvClAP/CDd5QZuT
	9I0bAT5S8GKrcyzXTjFCP/K8b1s5E+vvIEomncSxVvebf1iCri+6lkvG/tGcNLfwNH7Q=;
Message-ID: <0216845c-be47-41b7-661a-4780fa6b463e@xen.org>
Date: Thu, 3 Feb 2022 14:17:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH] xen: Modify domain_crash() to take a print string
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20220203133829.7913-1-andrew.cooper3@citrix.com>
 <c0d82900-64d1-fe16-9283-deb7c324ff8a@xen.org>
 <ad7467d2-1cae-c8ea-1217-69f0924044d4@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ad7467d2-1cae-c8ea-1217-69f0924044d4@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 03/02/2022 14:11, Andrew Cooper wrote:
> On 03/02/2022 13:48, Julien Grall wrote:
>> Hi,
>>
>> On 03/02/2022 13:38, Andrew Cooper wrote:
>>> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
>>> index 37f78cc4c4c9..38b390d20371 100644
>>> --- a/xen/include/xen/sched.h
>>> +++ b/xen/include/xen/sched.h
>>> @@ -736,10 +736,15 @@ void vcpu_end_shutdown_deferral(struct vcpu *v);
>>>     * from any processor.
>>>     */
>>>    void __domain_crash(struct domain *d);
>>> -#define domain_crash(d) do
>>> {                                              \
>>> -    printk("domain_crash called from %s:%d\n", __FILE__,
>>> __LINE__);       \
>>> -
>>> __domain_crash(d);                                                    \
>>> -} while (0)
>>> +#define domain_crash(d, ...)                            \
>>> +    do {                                                \
>>> +        if ( count_args(__VA_ARGS__) == 0 )             \
>>> +            printk("domain_crash called from %s:%d\n",  \
>>> +                   __FILE__, __LINE__);                 \
>>
>> I find a bit odd that here you are using a normal printk
> 
> That's unmodified from before.  Only reformatted.
> 
>> but...
>>
>>
>>> +        else                                            \
>>> +            printk(XENLOG_G_ERR __VA_ARGS__);           \
>>
>> here it is XENLOG_G_ERR. In fact, isn't it ratelimited? If so,
>> wouldn't it be better to only use XENLOG_ERR so they can always be
>> seen? (A domain shouldn't be able to abuse it).
> 
> Perhaps.  I suppose it is more important information than pretty much
> anything else about the guest.
> 
> I've changed locally, but won't repost just for this.

Ok. With that:

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

