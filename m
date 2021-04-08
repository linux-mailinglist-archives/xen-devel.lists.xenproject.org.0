Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 609D2358741
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 16:36:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107387.205294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUVlS-00025O-Nr; Thu, 08 Apr 2021 14:36:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107387.205294; Thu, 08 Apr 2021 14:36:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUVlS-000252-Ko; Thu, 08 Apr 2021 14:36:10 +0000
Received: by outflank-mailman (input) for mailman id 107387;
 Thu, 08 Apr 2021 14:36:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e/uL=JF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lUVlR-00024x-18
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 14:36:09 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 928ada40-78f2-4854-a747-687caa77e114;
 Thu, 08 Apr 2021 14:36:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2A3B5B00E;
 Thu,  8 Apr 2021 14:36:06 +0000 (UTC)
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
X-Inumbo-ID: 928ada40-78f2-4854-a747-687caa77e114
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617892566; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RxzQA4zuNrqZ9s0kEdhXwXuGOKO3Dq2TMZSevrecj9w=;
	b=ExEStKrM7FcyRxG/n0vGb1nCiWJGUM8kGEABNZfYC5S/siwbsN7HISepNug96tx38kSIZX
	O2iHvtP0PlLuqg/WTCW51wkaRLy5j7JqLbVgLNY95jI1ptv/qjv7QSvvQHJ+f4+elDHj9Z
	DtHW6xAanWMwUMoEgmrKzYCKLrD+9Og=
Subject: Re: [PATCH v2 2/4] xen/arm: Handle cases when hardware_domain is NULL
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Rahul Singh <rahul.singh@arm.com>,
 xen-devel@lists.xenproject.org
References: <20210408094818.8173-1-luca.fancellu@arm.com>
 <20210408094818.8173-3-luca.fancellu@arm.com>
 <b79f363c-2220-f187-6840-23205ef37e1e@suse.com>
 <4F221E20-0ABA-499D-A810-4A2A4F20F17D@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b05b29ce-263b-0526-61a6-679427305709@suse.com>
Date: Thu, 8 Apr 2021 16:36:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <4F221E20-0ABA-499D-A810-4A2A4F20F17D@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 08.04.2021 15:11, Luca Fancellu wrote:
> 
> 
>> On 8 Apr 2021, at 11:17, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 08.04.2021 11:48, Luca Fancellu wrote:
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -308,7 +308,7 @@ static int late_hwdom_init(struct domain *d)
>>>     struct domain *dom0;
>>>     int rv;
>>>
>>> -    if ( d != hardware_domain || d->domain_id == 0 )
>>> +    if ( !is_hardware_domain(d) || d->domain_id == 0 )
>>>         return 0;
>>>
>>>     rv = xsm_init_hardware_domain(XSM_HOOK, d);
>>> @@ -705,7 +705,7 @@ struct domain *domain_create(domid_t domid,
>>>     err = err ?: -EILSEQ; /* Release build safety. */
>>>
>>>     d->is_dying = DOMDYING_dead;
>>> -    if ( hardware_domain == d )
>>> +    if ( is_hardware_domain(d) )
>>>         hardware_domain = old_hwdom;
>>>     atomic_set(&d->refcnt, DOMAIN_DESTROYED);
>>
>> While these may seem like open-coding of is_hardware_domain(), I
>> think it would be better to leave them alone. In neither of the two
>> cases is it possible for d to be NULL afaics, and hence your
>> addition to is_hardware_domain() doesn't matter here.
> 
> Yes that is right, the only thing is that we have a nice function
> “Is_hardware_domain” and we and up comparing “manually”.
> It looks weird to me, but I can change it back if you don’t agree.

Well, from the time when late-hwdom was introduced I seem to vaguely
recall that the way it's done was on purpose. It pretty certainly was
also at that time when is_hardware_domain() (or whatever predecessor
predicate) was introduced, which suggests to me that if the above
were meant to use it, they would have been switched at the same time.

Jan

